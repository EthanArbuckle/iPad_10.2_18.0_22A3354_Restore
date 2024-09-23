uint64_t sub_23FEE3BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90400);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23FEE3C0C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned __int8 a13)
{
  if (a13 != 255)
    return sub_23FEE3C34(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
  return result;
}

uint64_t sub_23FEE3C34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  uint64_t result;

  result = a4;
  switch(a13)
  {
    case 0:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_3;
    case 2:
      goto LABEL_4;
    case 3:
    case 4:
LABEL_3:
      swift_bridgeObjectRetain();
LABEL_4:
      result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_23FEE3CC0()
{
  unint64_t result;

  result = qword_256F91BF8;
  if (!qword_256F91BF8)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event, &type metadata for IntelligenceFlowResponseGeneration.Event);
    atomic_store(result, (unint64_t *)&qword_256F91BF8);
  }
  return result;
}

uint64_t sub_23FEE3CFC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for IntelligenceFlowIdentifiers();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t IntelligenceFlowResponseGeneration.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v15[6];
  char v16;

  v2 = v0;
  v3 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_124_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90400);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = OUTLINED_FUNCTION_5_23();
  sub_23FEE3BC4(v2 + *(int *)(v8 + 28), (uint64_t)v7);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v3) == 1)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_23FE77D0C((uint64_t)v7, v1);
    OUTLINED_FUNCTION_5_0();
    sub_23FEE3E9C(&qword_256F90450, (uint64_t)&protocol conformance descriptor for IntelligenceFlowIdentifiers);
    sub_23FF58FAC();
    sub_23FEE3CFC(v1);
  }
  v9 = v2 + *(int *)(v8 + 32);
  v10 = *(unsigned __int8 *)(v9 + 96);
  if (v10 == 255)
    return OUTLINED_FUNCTION_5_0();
  v11 = *(_OWORD *)(v9 + 16);
  v15[0] = *(_OWORD *)v9;
  v15[1] = v11;
  v12 = *(_OWORD *)(v9 + 48);
  v15[2] = *(_OWORD *)(v9 + 32);
  v15[3] = v12;
  v13 = *(_OWORD *)(v9 + 80);
  v15[4] = *(_OWORD *)(v9 + 64);
  v15[5] = v13;
  v16 = v10;
  OUTLINED_FUNCTION_5_0();
  sub_23FEE3EDC();
  return sub_23FF58FAC();
}

uint64_t sub_23FEE3E9C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for IntelligenceFlowIdentifiers();
    result = MEMORY[0x24267B784](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23FEE3EDC()
{
  unint64_t result;

  result = qword_256F91C00;
  if (!qword_256F91C00)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event, &type metadata for IntelligenceFlowResponseGeneration.Event);
    atomic_store(result, (unint64_t *)&qword_256F91C00);
  }
  return result;
}

void static IntelligenceFlowResponseGeneration.Event.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X10 }
}

void sub_23FEE3FE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
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
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v89;
  uint64_t v90;
  uint64_t v92;
  uint64_t v93;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
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
  uint64_t v114;
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
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  char v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  char v208;

  v149 = v13;
  v151 = v17;
  v107 = v7;
  v110 = v22;
  if (v21)
  {
    OUTLINED_FUNCTION_8_24();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v24 = sub_23FEE3C34(v14, v18, v13, v20, v19, v156, v154, v22, v15, v17, v17, v13, v21);
    OUTLINED_FUNCTION_19_19(v24, (void (*)(void))sub_23FEE3484, v25, v26, v27, v28, v29, v30, v67, v72, v77, v81, v84, v87, v90, v93, v96, v100, v103,
      v107,
      v22,
      v112,
      v115,
      v119,
      v123,
      v127,
      v131,
      v134,
      v138,
      v142,
      v146,
      v13,
      v17,
      v154,
      v156,
      v158,
      v160,
      v162,
      v164,
      v166,
      v169,
      v171,
      v173,
      v176,
      v179,
      v182,
      v185,
      v187,
      v190,
      v191,
      v192,
      v193,
      v195,
      v196,
      v198,
      v200,
      v202,
      v204,
      v206,
      v208);
  }
  else
  {
    v188 = v11;
    LOWORD(v190) = v8 & 0x1FF;
    HIDWORD(v190) = HIDWORD(v8);
    LOBYTE(v191) = v12 & 1;
    HIDWORD(v191) = HIDWORD(v12);
    LOBYTE(v192) = v16 & 1;
    v194 = v10;
    v197 = v9;
    v199 = v7;
    v201 = v15;
    v205 = v18;
    v207 = v146;
    LOWORD(v160) = v14 & 0x1FF;
    HIDWORD(v160) = HIDWORD(v14);
    LOBYTE(v162) = a3 & 1;
    HIDWORD(v162) = HIDWORD(a3);
    LOBYTE(v164) = a4 & 1;
    v97 = v16;
    v174 = v22;
    v180 = v19;
    v183 = v17;
    v78 = v17;
    v120 = v12;
    v124 = v10;
    v135 = v15;
    v128 = v9;
    v132 = v19;
    v104 = v18;
    v32 = v8;
    v33 = v11;
    v143 = v11;
    sub_23FEE3C34(v20, v14, a3, a4, a5, v156, v154, v22, a1, v19, v78, v149, 0);
    v116 = v32;
    OUTLINED_FUNCTION_37_14(v33, v32, v120, v97, v124, v23, v34, v35, v15, a7, v18, v146, 0);
    OUTLINED_FUNCTION_37_14(v143, v32, v120, v97, v124, v23, v36, v37, v15, a7, v18, v146, 0);
    v38 = v149;
    v39 = a5;
    v40 = OUTLINED_FUNCTION_35_15();
    v41 = a4;
    v43 = v154;
    v42 = v156;
    v44 = v110;
    v47 = sub_23FEE3C34(v40, v45, v46, a4, a5, v156, v154, v110, v68, v73, v151, v149, 0);
    v55 = OUTLINED_FUNCTION_32_10(v47, v48, v49, v50, v51, v52, v53, v54, v69, v74, v79, v82, v85, a4, a5, a1, v97, a3, v104,
            v107,
            v110,
            v23,
            v116,
            v120,
            v124,
            v128,
            v132,
            v135,
            a7,
            v143,
            v146,
            v149,
            v151,
            v154,
            v156,
            v20,
            v160,
            v162,
            v164,
            a5,
            v156,
            v154,
            v174,
            a1,
            v180,
            v183,
            v149,
            v188);
    v57 = static IntelligenceFlowResponseGeneration.Event.Generation.== infix(_:_:)((uint64_t)v55, v56);
    OUTLINED_FUNCTION_19_19(v57, (void (*)(void))sub_23FEE3484, v58, v59, v60, v61, v62, v63, v70, v75, v80, v83, v86, v89, v92, v95, v98, v102, v105,
      v108,
      v111,
      v113,
      v117,
      v121,
      v125,
      v129,
      v133,
      v136,
      v140,
      v144,
      v147,
      v150,
      v152,
      v155,
      v157,
      v159,
      v161,
      v163,
      v165,
      v168,
      v170,
      v172,
      v175,
      v178,
      v181,
      v184,
      v186,
      v189,
      v190,
      v191,
      v192,
      v194,
      v23,
      v197,
      v199,
      v201,
      a7,
      v205,
      v207,
      v208);
    v64 = OUTLINED_FUNCTION_35_15();
    sub_23FEE3484(v64, v65, v66, v41, v39, v42, v43, v44, v71, v76, v153, v38, 0);
    sub_23FEE3484(v145, v118, v122, v99, v126, v114, v130, v109, v137, v141, v106, v148, 0);
  }
  OUTLINED_FUNCTION_7();
}

uint64_t sub_23FEE4544(uint64_t a1, void (*a2)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *(_QWORD *)(a1 + 104);
  v16 = *(_QWORD *)(a1 + 112);
  v4 = *(_QWORD *)(a1 + 128);
  v15 = *(_QWORD *)(a1 + 120);
  v5 = *(_QWORD *)(a1 + 136);
  v6 = *(_QWORD *)(a1 + 144);
  v7 = *(_QWORD *)(a1 + 152);
  v8 = *(_QWORD *)(a1 + 160);
  v14 = *(_OWORD *)(a1 + 168);
  v9 = *(_QWORD *)(a1 + 184);
  v10 = *(_QWORD *)(a1 + 192);
  v11 = *(_BYTE *)(a1 + 200);
  OUTLINED_FUNCTION_33_11();
  a2();
  v13 = v11;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, char))a2)(v17, v16, v15, v4, v5, v6, v7, v8, v14, *((_QWORD *)&v14 + 1), v9, v10, v13);
  return a1;
}

void IntelligenceFlowResponseGeneration.Event.hash(into:)()
{
  __asm { BR              X15 }
}

uint64_t sub_23FEE4654()
{
  sub_23FEE484C();
  return sub_23FF58FAC();
}

unint64_t sub_23FEE475C()
{
  unint64_t result;

  result = qword_256F91C08;
  if (!qword_256F91C08)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.SafetyCheck, &type metadata for IntelligenceFlowResponseGeneration.Event.SafetyCheck);
    atomic_store(result, (unint64_t *)&qword_256F91C08);
  }
  return result;
}

unint64_t sub_23FEE4798()
{
  unint64_t result;

  result = qword_256F91C10;
  if (!qword_256F91C10)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.ModelInference, &type metadata for IntelligenceFlowResponseGeneration.Event.ModelInference);
    atomic_store(result, (unint64_t *)&qword_256F91C10);
  }
  return result;
}

unint64_t sub_23FEE47D4()
{
  unint64_t result;

  result = qword_256F91C18;
  if (!qword_256F91C18)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.Override, &type metadata for IntelligenceFlowResponseGeneration.Event.Override);
    atomic_store(result, (unint64_t *)&qword_256F91C18);
  }
  return result;
}

unint64_t sub_23FEE4810()
{
  unint64_t result;

  result = qword_256F91C20;
  if (!qword_256F91C20)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.Fallback, &type metadata for IntelligenceFlowResponseGeneration.Event.Fallback);
    atomic_store(result, (unint64_t *)&qword_256F91C20);
  }
  return result;
}

unint64_t sub_23FEE484C()
{
  unint64_t result;

  result = qword_256F91C28;
  if (!qword_256F91C28)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.Generation, &type metadata for IntelligenceFlowResponseGeneration.Event.Generation);
    atomic_store(result, (unint64_t *)&qword_256F91C28);
  }
  return result;
}

void IntelligenceFlowResponseGeneration.Event.Generation.Source.init(rawValue:)(uint64_t *a1@<X8>, uint64_t a2@<X0>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a2 - 1;
  v3 = 0;
  switch(v2)
  {
    case 1:
      v3 = 1;
      break;
    case 2:
      v3 = 2;
      break;
    case 3:
      v3 = 3;
      break;
    case 4:
      v3 = 4;
      break;
    case 5:
      v3 = 5;
      break;
    default:
      break;
  }
  *a1 = v3;
  OUTLINED_FUNCTION_26_4((uint64_t)a1);
}

uint64_t IntelligenceFlowResponseGeneration.Event.Generation.Source.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0 + *(unsigned __int8 *)(v0 + 8);
}

void static IntelligenceFlowResponseGeneration.Event.Generation.Source.allCases.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char *v43;
  char v44;
  uint64_t v45;
  char *v46;
  char v47;
  uint64_t v48;
  char *v49;
  char v50;
  uint64_t v51;
  char *v52;
  char v53;
  uint64_t v54;
  char *v55;
  char v56;
  uint64_t v57;
  char *v58;
  char v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;

  OUTLINED_FUNCTION_2_5(0, 1, a3, MEMORY[0x24BEE4AF8], &qword_256F91C58);
  OUTLINED_FUNCTION_28_5();
  if (!(!v12 & v11))
  {
    v41 = OUTLINED_FUNCTION_3_15(v10);
    OUTLINED_FUNCTION_2_5(v41, v3, v42, v43, &qword_256F91C58);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_20_7(v6, v7, v8, v9);
  if (!(!v12 & v11))
  {
    v44 = OUTLINED_FUNCTION_3_15(v17);
    OUTLINED_FUNCTION_2_5(v44, v4, v45, v46, &qword_256F91C58);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_18_6(v13, v14, v15, v16);
  if (!(!v12 & v11))
  {
    v47 = OUTLINED_FUNCTION_3_15(v22);
    OUTLINED_FUNCTION_2_5(v47, v5, v48, v49, &qword_256F91C58);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_21_5(v18, v19, v20, v21);
  if (!(!v12 & v11))
  {
    v50 = OUTLINED_FUNCTION_3_15(v27);
    OUTLINED_FUNCTION_2_5(v50, v3, v51, v52, &qword_256F91C58);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_12_0(v23, v24, v25, v26);
  if (!(!v12 & v11))
  {
    v53 = OUTLINED_FUNCTION_3_15(v32);
    OUTLINED_FUNCTION_2_5(v53, v4, v54, v55, &qword_256F91C58);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_17_8(v28, v29, v30, v31);
  if (!(!v12 & v11))
  {
    v56 = OUTLINED_FUNCTION_3_15(v37);
    OUTLINED_FUNCTION_2_5(v56, v3, v57, v58, &qword_256F91C58);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_14_11(v33, v34, v35, v36);
  if (!(!v12 & v11))
  {
    v59 = OUTLINED_FUNCTION_3_15(v39);
    OUTLINED_FUNCTION_2_5(v59, v4, v60, v61, &qword_256F91C58);
    v38 = v62;
  }
  *(_QWORD *)(v38 + 16) = v4;
  v40 = v38 + 16 * v3;
  *(_QWORD *)(v40 + 32) = 5;
  *(_BYTE *)(v40 + 40) = v5;
  OUTLINED_FUNCTION_9();
}

uint64_t IntelligenceFlowResponseGeneration.Event.Generation.Source.description.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8) == 1)
    return ((uint64_t (*)(uint64_t, unint64_t))((char *)&loc_23FEE4A74
                                                              + 4 * byte_23FF6EBD2[*(_QWORD *)v0]))(1819242324, 0xE400000000000000);
  else
    return OUTLINED_FUNCTION_5_15();
}

uint64_t sub_23FEE4A8C()
{
  return 0x656469727265764FLL;
}

uint64_t sub_23FEE4AA4()
{
  return 0x6143746E65696C43;
}

uint64_t sub_23FEE4AC4()
{
  return 0x65736E6F70736552;
}

uint64_t sub_23FEE4AE8()
{
  return 0x6C65646F4D676C4ELL;
}

void IntelligenceFlowResponseGeneration.Event.Generation.Source.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;

  OUTLINED_FUNCTION_4_1();
  v2 = v2 && v1 == 0xE700000000000000;
  if (v2
    || (v3 = v1, v4 = v0, (OUTLINED_FUNCTION_0_0() & 1) != 0)
    || (v4 == 1819242324 ? (v5 = v3 == 0xE400000000000000) : (v5 = 0), v5 || (OUTLINED_FUNCTION_0_0() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    v6 = 0;
  }
  else
  {
    v7 = v4 == 0x6B6361626C6C6146 && v3 == 0xE800000000000000;
    if (v7 || (OUTLINED_FUNCTION_144_2(), (OUTLINED_FUNCTION_0_0() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      v6 = 1;
    }
    else
    {
      v8 = v4 == 0x656469727265764FLL && v3 == 0xE800000000000000;
      if (v8 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v6 = 2;
      }
      else
      {
        v9 = v4 == 0x6143746E65696C43 && v3 == 0xEB00000000656863;
        if (v9 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v6 = 3;
        }
        else
        {
          v10 = v4 == 0x65736E6F70736552 && v3 == 0xEF676F6C61746143;
          if (v10 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            v6 = 4;
          }
          else if (v4 == 0x6C65646F4D676C4ELL && v3 == 0xE800000000000000)
          {
            swift_bridgeObjectRelease();
            v6 = 5;
          }
          else
          {
            OUTLINED_FUNCTION_0_0();
            OUTLINED_FUNCTION_13_10();
            v6 = 5;
            if ((v4 & 1) == 0)
              v6 = 0;
          }
        }
      }
    }
  }
  OUTLINED_FUNCTION_9_8(v6);
  OUTLINED_FUNCTION_9();
}

void IntelligenceFlowResponseGeneration.Event.Fallback.Reason.init(rawValue:)(uint64_t *a1@<X8>, uint64_t a2@<X0>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a2 - 1;
  v3 = 0;
  switch(v2)
  {
    case 1:
      v3 = 1;
      break;
    case 2:
      v3 = 2;
      break;
    case 3:
      v3 = 3;
      break;
    case 4:
      v3 = 4;
      break;
    case 5:
      v3 = 5;
      break;
    case 6:
      v3 = 6;
      break;
    case 7:
      v3 = 7;
      break;
    case 8:
      v3 = 8;
      break;
    default:
      break;
  }
  *a1 = v3;
  OUTLINED_FUNCTION_26_4((uint64_t)a1);
}

void static IntelligenceFlowResponseGeneration.Event.Fallback.Reason.allCases.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v3;
  unint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  char *v49;
  char v50;
  uint64_t v51;
  char *v52;
  char v53;
  uint64_t v54;
  char *v55;
  char v56;
  uint64_t v57;
  char *v58;
  char v59;
  uint64_t v60;
  char *v61;
  char v62;
  uint64_t v63;
  char *v64;
  char v65;
  uint64_t v66;
  char *v67;
  char v68;
  uint64_t v69;
  char *v70;
  char v71;
  uint64_t v72;
  char *v73;
  char v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;

  OUTLINED_FUNCTION_2_5(0, 1, a3, MEMORY[0x24BEE4AF8], &qword_256F91C50);
  OUTLINED_FUNCTION_28_5();
  if (!(!v13 & v12))
  {
    v47 = OUTLINED_FUNCTION_3_15(v11);
    OUTLINED_FUNCTION_2_5(v47, v3, v48, v49, &qword_256F91C50);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_20_7(v7, v8, v9, v10);
  if (!(!v13 & v12))
  {
    v50 = OUTLINED_FUNCTION_3_15(v18);
    OUTLINED_FUNCTION_2_5(v50, v4, v51, v52, &qword_256F91C50);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_18_6(v14, v15, v16, v17);
  if (!(!v13 & v12))
  {
    v53 = OUTLINED_FUNCTION_3_15(v23);
    OUTLINED_FUNCTION_2_5(v53, v5, v54, v55, &qword_256F91C50);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_21_5(v19, v20, v21, v22);
  if (!(!v13 & v12))
  {
    v56 = OUTLINED_FUNCTION_3_15(v28);
    OUTLINED_FUNCTION_2_5(v56, v3, v57, v58, &qword_256F91C50);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_12_0(v24, v25, v26, v27);
  if (!(!v13 & v12))
  {
    v59 = OUTLINED_FUNCTION_3_15(v33);
    OUTLINED_FUNCTION_2_5(v59, v4, v60, v61, &qword_256F91C50);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_17_8(v29, v30, v31, v32);
  if (!(!v13 & v12))
  {
    v62 = OUTLINED_FUNCTION_3_15(v38);
    OUTLINED_FUNCTION_2_5(v62, v3, v63, v64, &qword_256F91C50);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_14_11(v34, v35, v36, v37);
  if (!(!v13 & v12))
  {
    v65 = OUTLINED_FUNCTION_3_15(v40);
    OUTLINED_FUNCTION_2_5(v65, v4, v66, v67, &qword_256F91C50);
    OUTLINED_FUNCTION_1_8();
  }
  *(_QWORD *)(v39 + 16) = v4;
  v42 = v39 + 16 * v3;
  *(_QWORD *)(v42 + 32) = 5;
  *(_BYTE *)(v42 + 40) = v5;
  v43 = v6 + 8;
  if (v41 <= v4)
  {
    v68 = OUTLINED_FUNCTION_3_15(v40);
    OUTLINED_FUNCTION_2_5(v68, v6 + 8, v69, v70, &qword_256F91C50);
    OUTLINED_FUNCTION_1_8();
  }
  *(_QWORD *)(v39 + 16) = v43;
  v44 = v39 + 16 * v4;
  *(_QWORD *)(v44 + 32) = 6;
  *(_BYTE *)(v44 + 40) = v5;
  v45 = v6 + 9;
  if (v41 <= v43)
  {
    v71 = OUTLINED_FUNCTION_3_15(v40);
    OUTLINED_FUNCTION_2_5(v71, v6 + 9, v72, v73, &qword_256F91C50);
    OUTLINED_FUNCTION_1_8();
  }
  *(_QWORD *)(v39 + 16) = v45;
  v46 = v39 + 16 * v43;
  *(_QWORD *)(v46 + 32) = 7;
  *(_BYTE *)(v46 + 40) = v5;
  if (v41 <= v45)
  {
    v74 = OUTLINED_FUNCTION_3_15(v40);
    OUTLINED_FUNCTION_2_5(v74, v6 + 10, v75, v76, &qword_256F91C50);
    v39 = v77;
  }
  *(_QWORD *)(v39 + 16) = v6 + 10;
  OUTLINED_FUNCTION_41_1(v39, v39 + 16 * v45);
  OUTLINED_FUNCTION_9();
}

uint64_t IntelligenceFlowResponseGeneration.Event.Fallback.Reason.description.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8) == 1)
    return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23FEE5054
                                                                       + 4 * byte_23FF6EBE1[*(_QWORD *)v0]))(0xD000000000000011, 0x800000023FF8A730);
  else
    return OUTLINED_FUNCTION_5_15();
}

uint64_t sub_23FEE5054()
{
  return 0x6C6C416E49746F4ELL;
}

uint64_t sub_23FEE507C()
{
  return 0x65526465696E6544;
}

uint64_t sub_23FEE50A0@<X0>(uint64_t a1@<X8>)
{
  return a1 + 14;
}

void IntelligenceFlowResponseGeneration.Event.Fallback.Reason.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  OUTLINED_FUNCTION_4_1();
  v2 = v2 && v1 == 0xE700000000000000;
  if (v2
    || (v3 = v1, v4 = v0, (OUTLINED_FUNCTION_0_0() & 1) != 0)
    || v4 == 0xD000000000000011 && v3 == 0x800000023FF8A730
    || (OUTLINED_FUNCTION_0_0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 0;
  }
  else
  {
    v6 = v4 == 0x6C6C416E49746F4ELL && v3 == 0xEE007473694C776FLL;
    if (v6 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v5 = 1;
    }
    else
    {
      v7 = v4 == 0x65526465696E6544 && v3 == 0xED00007473657571;
      if (v7 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v5 = 2;
      }
      else if (v4 == 0xD00000000000001ELL && (OUTLINED_FUNCTION_7_9(), v2) || (OUTLINED_FUNCTION_0_0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v5 = 3;
      }
      else if (v4 == 0xD00000000000001ALL && (OUTLINED_FUNCTION_7_9(), v2) || (OUTLINED_FUNCTION_0_0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v5 = 4;
      }
      else
      {
        v8 = v4 == 0x646469727265764FLL && v3 == 0xEA00000000006E65;
        if (v8 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v5 = 5;
        }
        else if (v4 == 0xD000000000000012 && (OUTLINED_FUNCTION_7_9(), v2) || (OUTLINED_FUNCTION_0_0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v5 = 6;
        }
        else if (v4 == 0xD000000000000010 && v3 == 0x800000023FF8A6B0 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v5 = 7;
        }
        else if (v4 == 0xD000000000000013 && (OUTLINED_FUNCTION_7_9(), v2))
        {
          swift_bridgeObjectRelease();
          v5 = 8;
        }
        else
        {
          OUTLINED_FUNCTION_0_0();
          OUTLINED_FUNCTION_13_10();
          v5 = 8;
          if ((v4 & 1) == 0)
            v5 = 0;
        }
      }
    }
  }
  OUTLINED_FUNCTION_9_8(v5);
  OUTLINED_FUNCTION_9();
}

void IntelligenceFlowResponseGeneration.Event.Override.OverrideType.init(rawValue:)(uint64_t *a1@<X8>, uint64_t a2@<X0>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 2;
  if (a2 == 2)
    v3 = 1;
  else
    v3 = a2;
  if (a2 != 3)
    v2 = v3;
  if (a2 == 1)
    v2 = 0;
  *a1 = v2;
  OUTLINED_FUNCTION_26_4((uint64_t)a1);
}

void static IntelligenceFlowResponseGeneration.Event.Override.OverrideType.allCases.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char *v16;
  char v17;
  uint64_t v18;
  char *v19;
  char v20;
  uint64_t v21;
  char *v22;
  char v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;

  OUTLINED_FUNCTION_2_5(0, 1, a3, MEMORY[0x24BEE4AF8], &qword_256F91C48);
  v4 = v3;
  v6 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  v7 = v5 >> 1;
  v8 = v6 + 1;
  if (v5 >> 1 <= v6)
  {
    v14 = OUTLINED_FUNCTION_3_15(v5);
    OUTLINED_FUNCTION_2_5(v14, v6 + 1, v15, v16, &qword_256F91C48);
    OUTLINED_FUNCTION_1_8();
  }
  *(_QWORD *)(v4 + 16) = v8;
  v9 = v4 + 16 * v6;
  *(_QWORD *)(v9 + 32) = 0;
  *(_BYTE *)(v9 + 40) = 0;
  v10 = v6 + 2;
  if (v7 <= v8)
  {
    v17 = OUTLINED_FUNCTION_3_15(v5);
    OUTLINED_FUNCTION_2_5(v17, v6 + 2, v18, v19, &qword_256F91C48);
    OUTLINED_FUNCTION_1_8();
  }
  *(_QWORD *)(v4 + 16) = v10;
  v11 = v4 + 16 * v8;
  *(_QWORD *)(v11 + 32) = 0;
  *(_BYTE *)(v11 + 40) = 1;
  v12 = v6 + 3;
  if (v7 <= v10)
  {
    v20 = OUTLINED_FUNCTION_3_15(v5);
    OUTLINED_FUNCTION_2_5(v20, v6 + 3, v21, v22, &qword_256F91C48);
    OUTLINED_FUNCTION_1_8();
  }
  *(_QWORD *)(v4 + 16) = v12;
  v13 = v4 + 16 * v10;
  *(_QWORD *)(v13 + 32) = 1;
  *(_BYTE *)(v13 + 40) = 1;
  if (v7 <= v12)
  {
    v23 = OUTLINED_FUNCTION_3_15(v5);
    OUTLINED_FUNCTION_2_5(v23, v6 + 4, v24, v25, &qword_256F91C48);
    v4 = v26;
  }
  *(_QWORD *)(v4 + 16) = v6 + 4;
  OUTLINED_FUNCTION_41_1(v4, v4 + 16 * v12);
  OUTLINED_FUNCTION_9();
}

uint64_t IntelligenceFlowResponseGeneration.Event.Override.OverrideType.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_BYTE *)(v0 + 8) != 1)
    return OUTLINED_FUNCTION_5_15();
  v1 = 0x6944676E69727453;
  if (*(_QWORD *)v0 != 1)
    v1 = 0x6F6C616944746143;
  if (*(_QWORD *)v0)
    return v1;
  else
    return 0x6B6361626C6C6146;
}

void IntelligenceFlowResponseGeneration.Event.Override.OverrideType.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;

  OUTLINED_FUNCTION_4_1();
  v2 = v2 && v1 == 0xE700000000000000;
  if (v2
    || (v3 = v1, v4 = v0, (OUTLINED_FUNCTION_0_0() & 1) != 0)
    || (v4 == 0x6B6361626C6C6146 ? (v5 = v3 == 0xEE00676F6C616944) : (v5 = 0),
        v5 || (OUTLINED_FUNCTION_144_2(), (OUTLINED_FUNCTION_0_0() & 1) != 0)))
  {
    swift_bridgeObjectRelease();
    v6 = 0;
  }
  else
  {
    v7 = v4 == 0x6944676E69727453 && v3 == 0xEC000000676F6C61;
    if (v7 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v6 = 1;
    }
    else if (v4 == 0x6F6C616944746143 && v3 == 0xE900000000000067)
    {
      swift_bridgeObjectRelease();
      v6 = 2;
    }
    else
    {
      OUTLINED_FUNCTION_0_0();
      OUTLINED_FUNCTION_13_10();
      v6 = 2;
      if ((v4 & 1) == 0)
        v6 = 0;
    }
  }
  OUTLINED_FUNCTION_9_8(v6);
  OUTLINED_FUNCTION_9();
}

unint64_t sub_23FEE5850()
{
  unint64_t result;

  result = qword_256F91C30;
  if (!qword_256F91C30)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.Generation.Source, &type metadata for IntelligenceFlowResponseGeneration.Event.Generation.Source);
    atomic_store(result, (unint64_t *)&qword_256F91C30);
  }
  return result;
}

unint64_t sub_23FEE5890()
{
  unint64_t result;

  result = qword_256F91C38;
  if (!qword_256F91C38)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.Fallback.Reason, &type metadata for IntelligenceFlowResponseGeneration.Event.Fallback.Reason);
    atomic_store(result, (unint64_t *)&qword_256F91C38);
  }
  return result;
}

unint64_t sub_23FEE58D0()
{
  unint64_t result;

  result = qword_256F91C40;
  if (!qword_256F91C40)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.Override.OverrideType, &type metadata for IntelligenceFlowResponseGeneration.Event.Override.OverrideType);
    atomic_store(result, (unint64_t *)&qword_256F91C40);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_24@<X0>(char a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  return sub_23FEE3C34(v28, v24, a17, v26, a18, a15, a19, v29, v25, v30, v27, a24, a1);
}

uint64_t OUTLINED_FUNCTION_4_23@<X0>(char a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  return sub_23FEE3484(v33, v27, v34, v28, v29, v31, v32, v26, v30, a20, a26, a25, a1);
}

uint64_t OUTLINED_FUNCTION_19_19(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  return sub_23FEE4544((uint64_t)&a60, a2);
}

char *OUTLINED_FUNCTION_32_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  return &a48;
}

uint64_t OUTLINED_FUNCTION_34_12(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_23FE1D55C(v2, a2);
}

uint64_t OUTLINED_FUNCTION_35_15()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_37_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  uint64_t v13;
  uint64_t v14;

  return sub_23FEE3C34(a1, a2, a3, a4, a5, a6, v14, v13, a9, a10, a11, a12, a13);
}

void sub_23FEE59E8()
{
  char v0;
  uint64_t v1;
  __n128 *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_31_3();
  v1 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v1);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v2 = (__n128 *)OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_11_2(v2, (__n128)xmmword_23FF60830);
  OUTLINED_FUNCTION_66_0((uint64_t)"intelligenceFlowIds");
  v3 = OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_20_0(v3);
  v4 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v4 = "event";
  *(_QWORD *)(v4 + 8) = 5;
  *(_BYTE *)(v4 + 16) = v0;
  OUTLINED_FUNCTION_16_2(v4);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEE5A90()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_12();
  if (!v0)
  {
    while (1)
    {
      if ((v2 & 1) != 0)
        return;
      if (v1 == 2)
      {
        OUTLINED_FUNCTION_5_23();
        OUTLINED_FUNCTION_50_4();
      }
      else
      {
        if (v1 != 1)
          goto LABEL_9;
        OUTLINED_FUNCTION_5_23();
        type metadata accessor for IntelligenceFlowIdentifiers();
      }
      sub_23FE1C4DC();
LABEL_9:
      v1 = OUTLINED_FUNCTION_40_2();
    }
  }
}

void sub_23FEE5B64()
{
  uint64_t v0;
  uint64_t v1;

  sub_23FEE5C1C(v0);
  if (!v1 && *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_5_23() + 32) + 96) != 255)
    OUTLINED_FUNCTION_30_0();
}

uint64_t sub_23FEE5C1C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90400);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for IntelligenceFlowIdentifiers();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = OUTLINED_FUNCTION_5_23();
  sub_23FEE3BC4(a1 + *(int *)(v8 + 28), (uint64_t)v4);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
    return sub_23FEE78A8((uint64_t)v4);
  sub_23FE77D0C((uint64_t)v4, (uint64_t)v7);
  OUTLINED_FUNCTION_30_0();
  return sub_23FEE3CFC((uint64_t)v7);
}

void sub_23FEE5D44()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEE5D50@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAA0B0, (uint64_t)&unk_256FAF7B0, a1);
}

void sub_23FEE5D70()
{
  sub_23FEE5A90();
}

void sub_23FEE5D84()
{
  sub_23FEE5B64();
}

__n128 sub_23FEE5D98@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  __n128 result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  unsigned __int8 v11;
  char v12;
  unsigned int v13;
  unsigned __int8 v14;
  unsigned int v15;
  unsigned __int8 v16;
  __n128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  IntelligenceFlowResponseGeneration.Event.Generation.init()((uint64_t)&v10);
  v2 = v16;
  v3 = 256;
  if (!v12)
    v3 = 0;
  v4 = v3 | v11 | ((unint64_t)v13 << 32);
  v5 = v14 | ((unint64_t)v15 << 32);
  result = v17;
  v7 = v18;
  v8 = v19;
  v9 = v20;
  *(_QWORD *)a1 = v10;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v2;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 64) = v8;
  *(_OWORD *)(a1 + 80) = v9;
  *(_BYTE *)(a1 + 96) = 0;
  return result;
}

void sub_23FEE5E14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;

  OUTLINED_FUNCTION_31_3();
  v3 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v3);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  OUTLINED_FUNCTION_108_3();
  v5 = OUTLINED_FUNCTION_18_7();
  *(_OWORD *)(v5 + 16) = xmmword_23FF60480;
  OUTLINED_FUNCTION_44_8();
  *(_QWORD *)v1 = "generation";
  *(_QWORD *)(v1 + 8) = 10;
  *(_BYTE *)(v1 + 16) = 2;
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_1_9(v1);
  v6 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v6 = "fallback";
  *(_QWORD *)(v6 + 8) = 8;
  *(_BYTE *)(v6 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v6);
  v7 = OUTLINED_FUNCTION_24_10((_QWORD *)(v5 + v0 + 2 * v2));
  *(_QWORD *)v7 = "override";
  *((_QWORD *)v7 + 1) = 8;
  v7[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v7);
  v8 = OUTLINED_FUNCTION_26_5((_QWORD *)(v5 + v0 + 3 * v2));
  *(_QWORD *)v8 = "modelInference";
  *((_QWORD *)v8 + 1) = 14;
  v8[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v8);
  v9 = (_QWORD *)(v5 + v0 + 4 * v2);
  v10 = (uint64_t)v9 + *(int *)(v4 + 48);
  *v9 = 5;
  *(_QWORD *)v10 = "safetyCheck";
  *(_QWORD *)(v10 + 8) = 11;
  *(_BYTE *)(v10 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v10);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEE5F5C()
{
  uint64_t v0;
  uint64_t v1;
  __int128 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  IntelligencePlatformLibrary::IntelligenceFlowResponseGeneration::Event::SafetyCheck *v26;
  uint64_t v27;
  __int128 v28;
  unsigned int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  char v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v52[24];
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[24];
  uint64_t v59;
  _OWORD v60[4];
  _OWORD *v61;

  v3 = sub_23FF58CDC();
  if (!v1)
  {
    v11 = (_OWORD *)(v0 + 32);
    v48 = v0 + 40;
    v61 = v60;
    v49 = xmmword_23FF614D0;
    while ((v4 & 1) == 0)
    {
      switch(v3)
      {
        case 1:
          v57 = 0u;
          memset(v58, 0, sizeof(v58));
          v59 = 1;
          v12 = v61;
          *v61 = 0u;
          v12[1] = 0u;
          v12[2] = 0u;
          OUTLINED_FUNCTION_43_8(v3, v4, v5, v6, v7, v8, v9, v10, v43, v44, v45, v46, v47, v48, v49, *((uint64_t *)&v49 + 1), v50, v51, *(uint64_t *)v52,
            *(uint64_t *)&v52[8],
            *(uint64_t *)&v52[16],
            v53,
            v54,
            *((uint64_t *)&v54 + 1),
            v55,
            *((uint64_t *)&v55 + 1),
            v56,
            *((uint64_t *)&v56 + 1),
            v57);
          OUTLINED_FUNCTION_46_1();
          OUTLINED_FUNCTION_1_23();
          v13 = v59;
          if (v59 == 1)
          {
            IntelligenceFlowResponseGeneration.Event.Generation.init()((uint64_t)&v50);
            v14 = v50;
            v15 = v51;
            LODWORD(v16) = BYTE1(v51);
            v17 = HIDWORD(v51);
            v18 = v52[0];
            v19 = *(unsigned int *)&v52[4];
            v20 = v52[8];
            v21 = *(_QWORD *)&v52[16];
            v13 = v53;
            v23 = v54;
            v22 = v55;
            v24 = v56;
          }
          else
          {
            v22 = v60[1];
            v24 = v60[2];
            v23 = v60[0];
            v21 = *(_QWORD *)&v58[16];
            v20 = v58[8];
            v18 = v58[0];
            v14 = v57;
            v17 = HIDWORD(*((_QWORD *)&v57 + 1));
            v19 = HIDWORD(*(_QWORD *)v58);
            v15 = BYTE8(v57);
            v16 = (*((_QWORD *)&v57 + 1) >> 8) & 1;
            v50 = v57;
            LOWORD(v51) = WORD4(v57) & 0x1FF;
            HIDWORD(v51) = HIDWORD(v57);
            v52[0] = v58[0] & 1;
            *(_DWORD *)&v52[4] = *(_DWORD *)&v58[4];
            v52[8] = v58[8] & 1;
            *(_QWORD *)&v52[16] = *(_QWORD *)&v58[16];
          }
          v39 = (_DWORD)v16 == 0;
          v40 = 256;
          if (v39)
            v40 = 0;
          *(_QWORD *)v0 = v14;
          *(_QWORD *)(v0 + 8) = v40 | v15 | (v17 << 32);
          *(_QWORD *)(v0 + 16) = v18 & 1 | (unint64_t)(v19 << 32);
          *(_QWORD *)(v0 + 24) = v20 & 1;
          *(_QWORD *)(v0 + 32) = v21;
          *(_QWORD *)(v0 + 40) = v13;
          *(_OWORD *)(v0 + 48) = v23;
          *(_OWORD *)(v0 + 64) = v22;
          *(_OWORD *)(v0 + 80) = v24;
          *(_BYTE *)(v0 + 96) = 0;
          break;
        case 2:
          WORD4(v57) = 0;
          BYTE10(v57) = 1;
          OUTLINED_FUNCTION_43_8(v3, v4, v5, v6, v7, v8, v9, v10, v43, v44, v45, v46, v47, v48, v49, *((uint64_t *)&v49 + 1), v50, v51, *(uint64_t *)v52,
            *(uint64_t *)&v52[8],
            *(uint64_t *)&v52[16],
            v53,
            v54,
            *((uint64_t *)&v54 + 1),
            v55,
            *((uint64_t *)&v55 + 1),
            v56,
            *((uint64_t *)&v56 + 1),
            0);
          OUTLINED_FUNCTION_46_1();
          OUTLINED_FUNCTION_1_23();
          if ((BYTE10(v57) & 1) != 0)
          {
            OUTLINED_FUNCTION_48_10();
            IntelligenceFlowResponseGeneration.Event.Fallback.init()();
            v29 = v51;
            v30 = BYTE1(v51);
          }
          else
          {
            v29 = BYTE8(v57);
            v30 = HIBYTE(WORD4(v57)) & 1;
            v2 = &v57;
          }
          v39 = v30 == 0;
          v41 = 256;
          if (v39)
            v41 = 0;
          *(_QWORD *)v0 = *(_QWORD *)v2;
          *(_QWORD *)(v0 + 8) = v41 | v29;
          *(_OWORD *)(v0 + 16) = 0u;
          *(_OWORD *)(v0 + 32) = 0u;
          *(_OWORD *)(v0 + 48) = 0u;
          *(_OWORD *)(v0 + 64) = 0u;
          *(_OWORD *)(v0 + 80) = 0u;
          *(_BYTE *)(v0 + 96) = 1;
          break;
        case 3:
          v57 = 0uLL;
          *(_QWORD *)v58 = 0;
          *(_QWORD *)&v58[8] = 1;
          OUTLINED_FUNCTION_43_8(v3, v4, v5, v6, v7, v8, v9, v10, v43, v44, v45, v46, v47, v48, v49, *((uint64_t *)&v49 + 1), v50, v51, *(uint64_t *)v52,
            *(uint64_t *)&v52[8],
            *(uint64_t *)&v52[16],
            v53,
            v54,
            *((uint64_t *)&v54 + 1),
            v55,
            *((uint64_t *)&v55 + 1),
            v56,
            *((uint64_t *)&v56 + 1),
            0);
          OUTLINED_FUNCTION_46_1();
          OUTLINED_FUNCTION_1_23();
          v31 = *(_QWORD *)&v58[8];
          if (*(_QWORD *)&v58[8] == 1)
          {
            OUTLINED_FUNCTION_48_10();
            IntelligenceFlowResponseGeneration.Event.Override.init()(v32);
            v33 = v51;
            LODWORD(v34) = BYTE1(v51);
            v31 = *(_QWORD *)&v52[8];
            v35 = *(_QWORD *)v52;
          }
          else
          {
            v35 = *(_QWORD *)v58;
            v33 = BYTE8(v57);
            v34 = (*((_QWORD *)&v57 + 1) >> 8) & 1;
            v2 = &v57;
          }
          v39 = (_DWORD)v34 == 0;
          v42 = 256;
          if (v39)
            v42 = 0;
          *(_QWORD *)v0 = *(_QWORD *)v2;
          *(_QWORD *)(v0 + 8) = v42 | v33;
          *(_QWORD *)(v0 + 16) = v35;
          *(_QWORD *)(v0 + 24) = v31;
          *v11 = 0u;
          *(_OWORD *)(v0 + 48) = 0u;
          *(_OWORD *)(v0 + 64) = 0u;
          *(_OWORD *)(v0 + 80) = 0u;
          v38 = 2;
          goto LABEL_35;
        case 4:
          *((_QWORD *)&v57 + 1) = *((_QWORD *)&v49 + 1);
          *(_OWORD *)v58 = 0uLL;
          OUTLINED_FUNCTION_43_8(v3, v4, v5, v6, v7, v8, v9, v10, v43, v44, v45, v46, v47, v48, v49, *((uint64_t *)&v49 + 1), v50, v51, *(uint64_t *)v52,
            *(uint64_t *)&v52[8],
            *(uint64_t *)&v52[16],
            v53,
            v54,
            *((uint64_t *)&v54 + 1),
            v55,
            *((uint64_t *)&v55 + 1),
            v56,
            *((uint64_t *)&v56 + 1),
            v49);
          OUTLINED_FUNCTION_46_1();
          OUTLINED_FUNCTION_1_23();
          v36 = *((_QWORD *)&v57 + 1);
          if (*((_QWORD *)&v57 + 1) == 1)
          {
            OUTLINED_FUNCTION_48_10();
            IntelligenceFlowResponseGeneration.Event.ModelInference.init()();
            v36 = v51;
            v37 = *(_OWORD *)v52;
          }
          else
          {
            v2 = &v57;
            v37 = *(_OWORD *)v58;
          }
          *(_QWORD *)v0 = *(_QWORD *)v2;
          *(_QWORD *)(v0 + 8) = v36;
          *(_OWORD *)(v0 + 16) = v37;
          *v11 = 0u;
          *(_OWORD *)(v0 + 48) = 0u;
          *(_OWORD *)(v0 + 64) = 0u;
          *(_OWORD *)(v0 + 80) = 0u;
          v38 = 3;
          goto LABEL_35;
        case 5:
          *((_QWORD *)&v57 + 1) = *((_QWORD *)&v49 + 1);
          memset(v58, 0, sizeof(v58));
          OUTLINED_FUNCTION_43_8(v3, v4, v5, v6, v7, v8, v9, v10, v43, v44, v45, v46, v47, v48, v49, *((uint64_t *)&v49 + 1), v50, v51, *(uint64_t *)v52,
            *(uint64_t *)&v52[8],
            *(uint64_t *)&v52[16],
            v53,
            v54,
            *((uint64_t *)&v54 + 1),
            v55,
            *((uint64_t *)&v55 + 1),
            v56,
            *((uint64_t *)&v56 + 1),
            v49);
          OUTLINED_FUNCTION_46_1();
          OUTLINED_FUNCTION_1_23();
          v25 = *((_QWORD *)&v57 + 1);
          if (*((_QWORD *)&v57 + 1) == 1)
          {
            OUTLINED_FUNCTION_48_10();
            IntelligenceFlowResponseGeneration.Event.SafetyCheck.init()(v26);
            v25 = v51;
            v27 = v52[0];
            v28 = *(_OWORD *)&v52[8];
          }
          else
          {
            v28 = *(_OWORD *)&v58[8];
            v27 = v58[0];
            v2 = &v57;
          }
          *(_QWORD *)v0 = *(_QWORD *)v2;
          *(_QWORD *)(v0 + 8) = v25;
          *(_QWORD *)(v0 + 16) = v27;
          *(_OWORD *)(v0 + 24) = v28;
          *(_OWORD *)v48 = 0u;
          *(_OWORD *)(v48 + 16) = 0u;
          *(_OWORD *)(v48 + 32) = 0u;
          *(_QWORD *)(v48 + 48) = 0;
          v38 = 4;
LABEL_35:
          *(_BYTE *)(v0 + 96) = v38;
          break;
        default:
          break;
      }
      v3 = sub_23FF58CDC();
    }
  }
}

uint64_t sub_23FEE63D4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23FEE6408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4 != 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23FEE641C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  if (a6 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_23FEE6470()
{
  __asm { BR              X16 }
}

void sub_23FEE64B4()
{
  sub_23FE1D118();
}

void sub_23FEE65E0()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEE65EC@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAA0B8, (uint64_t)&unk_256FAF7C8, a1);
}

void sub_23FEE660C()
{
  sub_23FEE5F5C();
}

void sub_23FEE6620()
{
  sub_23FEE6470();
}

uint64_t sub_23FEE6634()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;

  v1 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v1);
  __swift_project_value_buffer(v1, (uint64_t)&unk_256FAF7E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = OUTLINED_FUNCTION_18_7();
  *(_OWORD *)(v6 + 16) = xmmword_23FF614E0;
  v7 = v6 + v5;
  OUTLINED_FUNCTION_44_8();
  *(_QWORD *)v0 = "source";
  *(_QWORD *)(v0 + 8) = 6;
  *(_BYTE *)(v0 + 16) = 2;
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_1_9(v0);
  v8 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v8 = "characterCount";
  *(_QWORD *)(v8 + 8) = 14;
  *(_BYTE *)(v8 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v8);
  v9 = OUTLINED_FUNCTION_24_10((_QWORD *)(v7 + 2 * v4));
  *(_QWORD *)v9 = "wordCount";
  *((_QWORD *)v9 + 1) = 9;
  v9[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v9);
  v10 = OUTLINED_FUNCTION_26_5((_QWORD *)(v7 + 3 * v4));
  *(_QWORD *)v10 = "displayString";
  *((_QWORD *)v10 + 1) = 13;
  v10[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v10);
  v11 = (_QWORD *)(v7 + 4 * v4);
  v12 = (uint64_t)v11 + *(int *)(v2 + 48);
  *v11 = 5;
  *(_QWORD *)v12 = "spokenString";
  *(_QWORD *)(v12 + 8) = 12;
  *(_BYTE *)(v12 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v12);
  v13 = (_QWORD *)(v7 + 5 * v4);
  v14 = (uint64_t)v13 + *(int *)(v2 + 48);
  *v13 = 6;
  *(_QWORD *)v14 = "catId";
  *(_QWORD *)(v14 + 8) = 5;
  *(_BYTE *)(v14 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v14);
  v15 = (_QWORD *)(v7 + 6 * v4);
  v16 = (uint64_t)v15 + *(int *)(v2 + 48);
  *v15 = 7;
  *(_QWORD *)v16 = "staticDialogId";
  *(_QWORD *)(v16 + 8) = 14;
  *(_BYTE *)(v16 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v16);
  return sub_23FF58EE0();
}

void sub_23FEE681C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_12();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(v1)
      {
        case 1:
          sub_23FE1C9B0();
          break;
        case 2:
        case 3:
          sub_23FF58D9C();
          break;
        case 4:
        case 5:
        case 6:
        case 7:
          OUTLINED_FUNCTION_74_0();
          break;
        default:
          break;
      }
      v1 = OUTLINED_FUNCTION_40_2();
    }
  }
}

uint64_t sub_23FEE6924(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _BYTE v9[96];
  _BYTE v10[16];
  uint64_t v11[2];
  _BYTE v12[16];
  uint64_t v13;
  uint64_t v14;

  v5 = v4;
  memcpy(v9, v3, sizeof(v9));
  OUTLINED_FUNCTION_16_16((uint64_t)v9, (uint64_t)v12);
  result = OUTLINED_FUNCTION_11_24();
  if ((v14 & 0x100) != 0)
  {
    if (v4)
      return result;
  }
  else
  {
    sub_23FEE786C(&v13, (uint64_t)v11);
    sub_23FEE786C(v11, (uint64_t)v10);
    result = sub_23FE1D294((uint64_t)v10, 1, a2, (uint64_t)&type metadata for IntelligenceFlowResponseGeneration.Event.Generation.Source, a3, (uint64_t)&off_251026190);
    if (v4)
      return result;
  }
  OUTLINED_FUNCTION_16_16((uint64_t)&v9[12], (uint64_t)v12);
  OUTLINED_FUNCTION_11_24();
  if ((v13 & 0x100000000) == 0)
  {
    OUTLINED_FUNCTION_123_0();
    v5 = v4;
  }
  OUTLINED_FUNCTION_16_16((uint64_t)&v9[20], (uint64_t)v12);
  OUTLINED_FUNCTION_11_24();
  if ((v13 & 0x100000000) == 0)
  {
    OUTLINED_FUNCTION_123_0();
    v5 = v4;
  }
  OUTLINED_FUNCTION_16_16((uint64_t)&v9[32], (uint64_t)v12);
  OUTLINED_FUNCTION_11_24();
  if (!v14 || (result = OUTLINED_FUNCTION_52_0(), !v5))
  {
    OUTLINED_FUNCTION_16_16((uint64_t)&v9[48], (uint64_t)v12);
    OUTLINED_FUNCTION_11_24();
    if (!v14 || (result = OUTLINED_FUNCTION_52_0(), !v5))
    {
      OUTLINED_FUNCTION_16_16((uint64_t)&v9[64], (uint64_t)v12);
      OUTLINED_FUNCTION_11_24();
      if (!v14 || (result = OUTLINED_FUNCTION_52_0(), !v5))
      {
        OUTLINED_FUNCTION_16_16((uint64_t)&v9[80], (uint64_t)v12);
        result = OUTLINED_FUNCTION_11_24();
        if (v14)
          return OUTLINED_FUNCTION_52_0();
      }
    }
  }
  return result;
}

void sub_23FEE6B28()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEE6B34@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAA0C0, (uint64_t)&unk_256FAF7E0, a1);
}

void sub_23FEE6B54()
{
  sub_23FEE681C();
}

uint64_t sub_23FEE6B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23FEE6924(a1, a2, a3);
}

void sub_23FEE6B7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

  OUTLINED_FUNCTION_31_3();
  v2 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v2);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  OUTLINED_FUNCTION_108_3();
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23FF614E0;
  v5 = v4 + v0 + *(int *)(v3 + 48);
  *(_QWORD *)(v4 + v0) = 0;
  *(_QWORD *)v5 = "SourceUnknown";
  *(_QWORD *)(v5 + 8) = 13;
  *(_BYTE *)(v5 + 16) = 2;
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_1_9(v5);
  v6 = OUTLINED_FUNCTION_53_0(v4 + v0 + v1);
  *v7 = 1;
  *(_QWORD *)v6 = "SourceTool";
  *(_QWORD *)(v6 + 8) = 10;
  *(_BYTE *)(v6 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v6);
  v8 = OUTLINED_FUNCTION_53_0(v4 + v0 + 2 * v1);
  *v9 = 2;
  *(_QWORD *)v8 = "SourceFallback";
  *(_QWORD *)(v8 + 8) = 14;
  *(_BYTE *)(v8 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v8);
  v10 = OUTLINED_FUNCTION_53_0(v4 + v0 + 3 * v1);
  *v11 = 3;
  *(_QWORD *)v10 = "SourceOverride";
  *(_QWORD *)(v10 + 8) = 14;
  *(_BYTE *)(v10 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v10);
  v12 = OUTLINED_FUNCTION_26_5((_QWORD *)(v4 + v0 + 4 * v1));
  *(_QWORD *)v12 = "SourceClientCache";
  *((_QWORD *)v12 + 1) = 17;
  v12[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v12);
  v13 = OUTLINED_FUNCTION_53_0(v4 + v0 + 5 * v1);
  *v14 = 5;
  *(_QWORD *)v13 = "SourceResponseCatalog";
  *(_QWORD *)(v13 + 8) = 21;
  *(_BYTE *)(v13 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v13);
  v15 = (_QWORD *)(v4 + v0 + 6 * v1);
  v16 = (uint64_t)v15 + *(int *)(v3 + 48);
  *v15 = 6;
  *(_QWORD *)v16 = "SourceNlgModel";
  *(_QWORD *)(v16 + 8) = 14;
  *(_BYTE *)(v16 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v16);
  sub_23FF58EE0();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_23FEE6D3C@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAA0C8, (uint64_t)&unk_256FAF7F8, a1);
}

uint64_t sub_23FEE6D60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v0);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  v4 = OUTLINED_FUNCTION_18_7();
  *(_OWORD *)(v4 + 16) = xmmword_23FF5FAF0;
  v5 = v4 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v4 + v3) = 1;
  *(_QWORD *)v5 = "reason";
  *(_QWORD *)(v5 + 8) = 6;
  *(_BYTE *)(v5 + 16) = 2;
  v6 = *MEMORY[0x24BE5C318];
  v7 = OUTLINED_FUNCTION_28_6();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  return OUTLINED_FUNCTION_33_3();
}

void sub_23FEE6E3C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_12();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (v1 == 1)
        sub_23FE1C9B0();
      v1 = OUTLINED_FUNCTION_40_2();
    }
  }
  OUTLINED_FUNCTION_33_1();
}

uint64_t sub_23FEE6EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char v4;
  uint64_t result;
  uint64_t v6;
  char v7;

  if ((*((_BYTE *)v3 + 9) & 1) == 0)
  {
    v4 = *((_BYTE *)v3 + 8);
    v6 = *v3;
    v7 = v4 & 1;
    return sub_23FE1D294((uint64_t)&v6, 1, a2, (uint64_t)&type metadata for IntelligenceFlowResponseGeneration.Event.Fallback.Reason, a3, (uint64_t)&off_2510264C0);
  }
  return result;
}

void sub_23FEE6F08()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEE6F14@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAA0D0, (uint64_t)&unk_256FAF810, a1);
}

void sub_23FEE6F34()
{
  sub_23FEE6E3C();
}

uint64_t sub_23FEE6F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23FEE6EA0(a1, a2, a3);
}

void sub_23FEE6F5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __n128 *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;

  OUTLINED_FUNCTION_31_3();
  v3 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v3);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  OUTLINED_FUNCTION_108_3();
  v5 = (__n128 *)OUTLINED_FUNCTION_18_7();
  OUTLINED_FUNCTION_79_0(v5, (__n128)xmmword_23FF614B0);
  *(_QWORD *)v0 = "ReasonUnknown";
  *(_QWORD *)(v0 + 8) = 13;
  *(_BYTE *)(v0 + 16) = 2;
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_1_9(v0);
  v6 = OUTLINED_FUNCTION_38_9();
  *(_QWORD *)v6 = "ReasonNotAdoptingNLGAPI";
  *(_QWORD *)(v6 + 8) = 23;
  *(_BYTE *)(v6 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v6);
  v7 = OUTLINED_FUNCTION_87_0();
  *(_QWORD *)v7 = "ReasonNotInAllowList";
  *((_QWORD *)v7 + 1) = 20;
  v7[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v7);
  v8 = OUTLINED_FUNCTION_24_10((_QWORD *)(v2 + 3 * v1));
  *(_QWORD *)v8 = "ReasonDeniedRequest";
  *((_QWORD *)v8 + 1) = 19;
  v8[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v8);
  v9 = OUTLINED_FUNCTION_26_5((_QWORD *)(v2 + 4 * v1));
  *(_QWORD *)v9 = "ReasonGuardrailDetectedHallucination";
  *((_QWORD *)v9 + 1) = 36;
  v9[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v9);
  v10 = OUTLINED_FUNCTION_31_8(5 * v1);
  *v11 = 5;
  *(_QWORD *)v10 = "ReasonModelDetectedHallucination";
  *(_QWORD *)(v10 + 8) = 32;
  *(_BYTE *)(v10 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v10);
  v12 = (_QWORD *)(v2 + 6 * v1);
  v13 = (uint64_t)v12 + *(int *)(v4 + 48);
  *v12 = 6;
  *(_QWORD *)v13 = "ReasonOverridden";
  *(_QWORD *)(v13 + 8) = 16;
  *(_BYTE *)(v13 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v13);
  v14 = OUTLINED_FUNCTION_31_8(7 * v1);
  *v15 = 7;
  *(_QWORD *)v14 = "ReasonModelServerTimeout";
  *(_QWORD *)(v14 + 8) = 24;
  *(_BYTE *)(v14 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v14);
  v16 = (_QWORD *)(v2 + 8 * v1);
  v17 = (uint64_t)v16 + *(int *)(v4 + 48);
  *v16 = 8;
  *(_QWORD *)v17 = "ReasonModelServerError";
  *(_QWORD *)(v17 + 8) = 22;
  *(_BYTE *)(v17 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v17);
  v18 = OUTLINED_FUNCTION_31_8(9 * v1);
  *v19 = 9;
  *(_QWORD *)v18 = "ReasonDetectedSafetyIssue";
  *(_QWORD *)(v18 + 8) = 25;
  *(_BYTE *)(v18 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v18);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_23FEE7164@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAA0D8, (uint64_t)&unk_256FAF828, a1);
}

void sub_23FEE7188()
{
  uint64_t v0;
  uint64_t v1;
  __n128 *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_31_3();
  v1 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v1);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v2 = (__n128 *)OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_11_2(v2, (__n128)xmmword_23FF60830);
  OUTLINED_FUNCTION_66_0((uint64_t)"type");
  v3 = OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_20_0(v3);
  v4 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v4 = "id";
  *(_QWORD *)(v4 + 8) = v0;
  *(_BYTE *)(v4 + 16) = v0;
  OUTLINED_FUNCTION_16_2(v4);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEE722C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_12();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (v1 == 2)
      {
        OUTLINED_FUNCTION_74_0();
      }
      else if (v1 == 1)
      {
        OUTLINED_FUNCTION_50_4();
        sub_23FE1C9B0();
      }
      v1 = OUTLINED_FUNCTION_40_2();
    }
  }
}

uint64_t sub_23FEE72B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  char v9;

  v5 = v3[3];
  if ((*((_BYTE *)v3 + 9) & 1) == 0)
  {
    v6 = *((_BYTE *)v3 + 8);
    v8 = *v3;
    v9 = v6 & 1;
    result = sub_23FE1D294((uint64_t)&v8, 1, a2, (uint64_t)&type metadata for IntelligenceFlowResponseGeneration.Event.Override.OverrideType, a3, (uint64_t)&off_251026640);
  }
  if (!v4)
  {
    if (v5)
      return OUTLINED_FUNCTION_52_0();
  }
  return result;
}

void sub_23FEE7358()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEE7364@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAA0E0, (uint64_t)&unk_256FAF840, a1);
}

void sub_23FEE7384()
{
  sub_23FEE722C();
}

uint64_t sub_23FEE7398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23FEE72B8(a1, a2, a3);
}

void sub_23FEE73AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __n128 *v4;
  uint64_t v5;
  char *v6;
  char *v7;

  OUTLINED_FUNCTION_31_3();
  v3 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v3);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  OUTLINED_FUNCTION_108_3();
  v4 = (__n128 *)OUTLINED_FUNCTION_18_7();
  OUTLINED_FUNCTION_79_0(v4, (__n128)xmmword_23FF5FA60);
  *(_QWORD *)v0 = "OverrideTypeUnknown";
  *(_QWORD *)(v0 + 8) = 19;
  *(_BYTE *)(v0 + 16) = 2;
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_1_9(v0);
  v5 = OUTLINED_FUNCTION_38_9();
  *(_QWORD *)v5 = "OverrideTypeFallbackDialog";
  *(_QWORD *)(v5 + 8) = 26;
  *(_BYTE *)(v5 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v5);
  v6 = OUTLINED_FUNCTION_87_0();
  *(_QWORD *)v6 = "OverrideTypeStringDialog";
  *((_QWORD *)v6 + 1) = 24;
  v6[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v6);
  v7 = OUTLINED_FUNCTION_24_10((_QWORD *)(v2 + 3 * v1));
  *(_QWORD *)v7 = "OverrideTypeCatDialog";
  *((_QWORD *)v7 + 1) = 21;
  v7[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v7);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_23FEE74B8@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAA0E8, (uint64_t)&unk_256FAF858, a1);
}

void sub_23FEE74DC()
{
  char v0;
  uint64_t v1;
  __n128 *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_31_3();
  v1 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v1);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v2 = (__n128 *)OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_11_2(v2, (__n128)xmmword_23FF60830);
  OUTLINED_FUNCTION_66_0((uint64_t)"modelVersion");
  v3 = OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_20_0(v3);
  v4 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v4 = "promptVersion";
  *(_QWORD *)(v4 + 8) = 13;
  *(_BYTE *)(v4 + 16) = v0;
  OUTLINED_FUNCTION_16_2(v4);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEE7584()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEE7590@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAA0F0, (uint64_t)&unk_256FAF870, a1);
}

void sub_23FEE75B0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  __n128 *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  OUTLINED_FUNCTION_31_3();
  v3 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v3);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  OUTLINED_FUNCTION_108_3();
  v4 = (__n128 *)OUTLINED_FUNCTION_18_7();
  OUTLINED_FUNCTION_11_2(v4, (__n128)xmmword_23FF614F0);
  OUTLINED_FUNCTION_66_0((uint64_t)"ruleName");
  v5 = OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_20_0(v5);
  v6 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v6 = "isProfanityFiltered";
  *(_QWORD *)(v6 + 8) = 19;
  *(_BYTE *)(v6 + 16) = v2;
  OUTLINED_FUNCTION_16_2(v6);
  v7 = OUTLINED_FUNCTION_24_10((_QWORD *)(v1 + 2 * v0));
  *(_QWORD *)v7 = "ruleFailureReason";
  *((_QWORD *)v7 + 1) = 17;
  v7[16] = v2;
  OUTLINED_FUNCTION_16_2((uint64_t)v7);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEE7688()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_12();
  if (!v0)
  {
    while (1)
    {
      if ((v2 & 1) != 0)
        goto LABEL_2;
      if (v1 == 3)
        goto LABEL_7;
      if (v1 != 2)
        break;
      sub_23FF58CE8();
LABEL_9:
      v1 = OUTLINED_FUNCTION_40_2();
    }
    if (v1 != 1)
      goto LABEL_9;
LABEL_7:
    OUTLINED_FUNCTION_74_0();
    goto LABEL_9;
  }
LABEL_2:
  OUTLINED_FUNCTION_33_1();
}

uint64_t sub_23FEE7708()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _BYTE v26[24];
  uint64_t v27;

  v2 = v1;
  v3 = v0[1];
  v23 = *v0;
  v24 = v3;
  v25 = *((_QWORD *)v0 + 4);
  v4 = OUTLINED_FUNCTION_28_0((uint64_t)&v23, (uint64_t)v26);
  result = OUTLINED_FUNCTION_26_0(v4, v5, v6, v7, v8, v9);
  if (v27)
  {
    result = OUTLINED_FUNCTION_35_0();
    v2 = v1;
    if (v1)
      return result;
  }
  else if (v1)
  {
    return result;
  }
  v11 = OUTLINED_FUNCTION_28_0((uint64_t)&v24, (uint64_t)v26);
  OUTLINED_FUNCTION_26_0(v11, v12, v13, v14, v15, v16);
  if (v26[16] == 2 || (result = sub_23FF58E14(), !v2))
  {
    v17 = OUTLINED_FUNCTION_28_0((uint64_t)&v24 + 8, (uint64_t)v26);
    result = OUTLINED_FUNCTION_26_0(v17, v18, v19, v20, v21, v22);
    if (v27)
      return OUTLINED_FUNCTION_35_0();
  }
  return result;
}

void sub_23FEE7818()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEE7824@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(qword_256FAA0F8, (uint64_t)&unk_256FAF888, a1);
}

void sub_23FEE7844()
{
  sub_23FEE7688();
}

uint64_t sub_23FEE7858()
{
  return sub_23FEE7708();
}

uint64_t sub_23FEE786C(uint64_t *a1, uint64_t a2)
{
  __swift_memcpy9_8(a2, a1);
  return a2;
}

uint64_t sub_23FEE78A8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90400);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_11_24()
{
  uint64_t *v0;
  uint64_t v1;

  return sub_23FE6D5C8(v1 - 80, v1 - 64, v0);
}

char *OUTLINED_FUNCTION_43_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  return &a29;
}

void OUTLINED_FUNCTION_44_8()
{
  _QWORD *v0;

  *v0 = 1;
}

uint64_t OUTLINED_FUNCTION_45_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  return a29;
}

void *sub_23FEE7944()
{
  return &unk_23FF6EDAC;
}

void IntelligenceFlowResponseGeneration.writeTimestamp.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_5_23();
  OUTLINED_FUNCTION_209_0(v0 + *(int *)(v1 + 20), v2, &qword_25434B8D8);
  OUTLINED_FUNCTION_13();
}

uint64_t type metadata accessor for IntelligenceFlowResponseGeneration()
{
  uint64_t result;

  result = qword_25434E7D0;
  if (!qword_25434E7D0)
    return swift_getSingletonMetadata();
  return result;
}

void IntelligenceFlowResponseGeneration.writeTimestamp.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_5_23();
  OUTLINED_FUNCTION_212_0(v1, v0 + *(int *)(v1 + 20), &qword_25434B8D8);
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowResponseGeneration.writeTimestamp.modify())()
{
  OUTLINED_FUNCTION_5_23();
  return nullsub_1;
}

void IntelligenceFlowResponseGeneration.bookmark.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_5_23();
  OUTLINED_FUNCTION_209_0(v0 + *(int *)(v1 + 24), v2, &qword_25434B738);
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowResponseGeneration.bookmark.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_5_23();
  OUTLINED_FUNCTION_212_0(v1, v0 + *(int *)(v1 + 24), &qword_25434B738);
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowResponseGeneration.bookmark.modify())()
{
  OUTLINED_FUNCTION_5_23();
  return nullsub_1;
}

uint64_t sub_23FEE7A90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_6_1();
  v0 = OUTLINED_FUNCTION_426();
  return OUTLINED_FUNCTION_265(v0, v1, v2, v3);
}

void IntelligenceFlowResponseGeneration.intelligenceFlowIds.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_5_23();
  OUTLINED_FUNCTION_209_0(v0 + *(int *)(v1 + 28), v2, &qword_256F90400);
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowResponseGeneration.intelligenceFlowIds.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_5_23();
  OUTLINED_FUNCTION_212_0(v1, v0 + *(int *)(v1 + 28), &qword_256F90400);
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowResponseGeneration.intelligenceFlowIds.modify())()
{
  OUTLINED_FUNCTION_5_23();
  return nullsub_1;
}

double sub_23FEE7B34@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 96) = -1;
  return result;
}

uint64_t IntelligenceFlowResponseGeneration.event.getter@<X0>(uint64_t a1@<X8>)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_5_23() + 32);
  v4 = *(_QWORD *)v3;
  v5 = *(_QWORD *)(v3 + 8);
  v6 = *(_QWORD *)(v3 + 16);
  v7 = *(_QWORD *)(v3 + 24);
  v8 = *(_QWORD *)(v3 + 32);
  v9 = *(_QWORD *)(v3 + 40);
  v10 = *(_QWORD *)(v3 + 48);
  v11 = *(_QWORD *)(v3 + 56);
  v12 = *(_QWORD *)(v3 + 64);
  v13 = *(_QWORD *)(v3 + 72);
  v14 = *(_QWORD *)(v3 + 80);
  v15 = *(_QWORD *)(v3 + 88);
  LOBYTE(v3) = *(_BYTE *)(v3 + 96);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = v10;
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = v15;
  *(_BYTE *)(a1 + 96) = v3;
  return sub_23FEE3C0C(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v3);
}

__n128 IntelligenceFlowResponseGeneration.event.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  __n128 result;
  __n128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = a1[1];
  v11 = *a1;
  v8 = a1[3];
  v9 = a1[2];
  v7 = (__n128)a1[4];
  v2 = *((_QWORD *)a1 + 10);
  v3 = *((_QWORD *)a1 + 11);
  v4 = *((_BYTE *)a1 + 96);
  v5 = v1 + *(int *)(OUTLINED_FUNCTION_5_23() + 32);
  sub_23FEE345C(*(_QWORD *)v5, *(_QWORD *)(v5 + 8), *(_QWORD *)(v5 + 16), *(_QWORD *)(v5 + 24), *(_QWORD *)(v5 + 32), *(_QWORD *)(v5 + 40), *(_QWORD *)(v5 + 48), *(_QWORD *)(v5 + 56), *(_QWORD *)(v5 + 64), *(_QWORD *)(v5 + 72), *(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 88), *(_BYTE *)(v5 + 96));
  *(_OWORD *)v5 = v11;
  *(_OWORD *)(v5 + 16) = v10;
  *(_OWORD *)(v5 + 32) = v9;
  *(_OWORD *)(v5 + 48) = v8;
  result = v7;
  *(__n128 *)(v5 + 64) = v7;
  *(_QWORD *)(v5 + 80) = v2;
  *(_QWORD *)(v5 + 88) = v3;
  *(_BYTE *)(v5 + 96) = v4;
  return result;
}

uint64_t (*IntelligenceFlowResponseGeneration.event.modify())()
{
  OUTLINED_FUNCTION_5_23();
  return nullsub_1;
}

uint64_t (*IntelligenceFlowResponseGeneration.Event.Generation.source.modify())()
{
  return nullsub_1;
}

unint64_t IntelligenceFlowResponseGeneration.Event.Generation.characterCount.getter()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_30(*(unsigned int *)(v0 + 12));
}

uint64_t IntelligenceFlowResponseGeneration.Event.Generation.characterCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 12) = result;
  *(_BYTE *)(v1 + 16) = BYTE4(result) & 1;
  return result;
}

uint64_t (*IntelligenceFlowResponseGeneration.Event.Generation.characterCount.modify())()
{
  return nullsub_1;
}

unint64_t IntelligenceFlowResponseGeneration.Event.Generation.wordCount.getter()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_30(*(unsigned int *)(v0 + 20));
}

uint64_t IntelligenceFlowResponseGeneration.Event.Generation.wordCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 20) = result;
  *(_BYTE *)(v1 + 24) = BYTE4(result) & 1;
  return result;
}

uint64_t (*IntelligenceFlowResponseGeneration.Event.Generation.wordCount.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowResponseGeneration.Event.Generation.displayString.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowResponseGeneration.Event.Generation.displayString.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_228_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowResponseGeneration.Event.Generation.displayString.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowResponseGeneration.Event.Generation.spokenString.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowResponseGeneration.Event.Generation.spokenString.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_228_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 56) = v0;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowResponseGeneration.Event.Generation.spokenString.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowResponseGeneration.Event.Generation.catId.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowResponseGeneration.Event.Generation.catId.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_228_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 72) = v0;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowResponseGeneration.Event.Generation.catId.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowResponseGeneration.Event.Generation.staticDialogId.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowResponseGeneration.Event.Generation.staticDialogId.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_228_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 80) = v2;
  *(_QWORD *)(v1 + 88) = v0;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowResponseGeneration.Event.Generation.staticDialogId.modify())()
{
  return nullsub_1;
}

double IntelligenceFlowResponseGeneration.Event.Generation.init()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
  *(_DWORD *)(a1 + 12) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_DWORD *)(a1 + 20) = 0;
  *(_BYTE *)(a1 + 24) = 1;
  result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  return result;
}

void sub_23FEE7EA4(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  IntelligenceFlowResponseGeneration.Event.Generation.Source.init(rawValue:)(a2, *a1);
}

void sub_23FEE7EAC(uint64_t *a1@<X8>)
{
  *a1 = IntelligenceFlowResponseGeneration.Event.Generation.Source.rawValue.getter();
  OUTLINED_FUNCTION_13();
}

void sub_23FEE7ECC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v5;

  static IntelligenceFlowResponseGeneration.Event.Generation.Source.allCases.getter(a1, a2, a3);
  *a4 = v5;
  OUTLINED_FUNCTION_13();
}

void sub_23FEE7EEC()
{
  sub_23FE91864();
}

uint64_t sub_23FEE7F10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_17_9();
  return sub_23FE918C0(v0, v1, v2, (void (*)(uint64_t, uint64_t))IntelligenceFlowResponseGeneration.Event.Generation.Source.rawValue.getter);
}

void sub_23FEE7F30()
{
  OUTLINED_FUNCTION_17_9();
  sub_23FEE7F50();
}

void sub_23FEE7F50()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_23FF592AC();
  OUTLINED_FUNCTION_98_4(v0, v1);
  OUTLINED_FUNCTION_300();
  OUTLINED_FUNCTION_301();
  OUTLINED_FUNCTION_38_7();
}

BOOL sub_23FEE7F8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_13();
  return OUTLINED_FUNCTION_105_4(v0, v1, IntelligenceFlowResponseGeneration.Event.Generation.Source.rawValue.getter, v2);
}

uint64_t static IntelligenceFlowResponseGeneration.Event.Generation.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2;
  char v3;
  int v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  char v27;
  char v28;
  BOOL v29;
  uint64_t result;
  char v31;
  char v33;
  char v35;
  BOOL v36;
  uint64_t v37;
  int v38;
  int v39;
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

  v2 = *(_DWORD *)(a1 + 12);
  v3 = *(_BYTE *)(a1 + 16);
  v4 = *(_DWORD *)(a1 + 20);
  v5 = *(_BYTE *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v48 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 80);
  v50 = *(_QWORD *)(a1 + 88);
  v51 = *(_QWORD *)(a1 + 72);
  v11 = *(_DWORD *)(a2 + 12);
  v12 = *(unsigned __int8 *)(a2 + 16);
  v13 = *(_DWORD *)(a2 + 20);
  v14 = *(unsigned __int8 *)(a2 + 24);
  v16 = *(_QWORD *)(a2 + 32);
  v15 = *(_QWORD *)(a2 + 40);
  v17 = *(_QWORD *)(a2 + 48);
  v18 = *(_QWORD *)(a2 + 56);
  v19 = *(_QWORD *)(a2 + 64);
  v20 = *(_QWORD *)(a2 + 72);
  v47 = *(_QWORD *)(a2 + 80);
  v49 = *(_QWORD *)(a2 + 88);
  if ((*(_BYTE *)(a1 + 9) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 9))
      return 0;
  }
  else
  {
    if ((*(_BYTE *)(a2 + 9) & 1) != 0)
      return 0;
    v44 = *(_QWORD *)(a1 + 32);
    v45 = *(_QWORD *)(a2 + 48);
    v46 = *(_QWORD *)(a2 + 72);
    v43 = *(_QWORD *)(a2 + 56);
    v41 = *(_QWORD *)(a1 + 48);
    v42 = *(_QWORD *)(a1 + 56);
    v40 = *(_QWORD *)(a2 + 64);
    v21 = *(_QWORD *)(a1 + 40);
    v22 = *(_QWORD *)(a2 + 40);
    v23 = *(_QWORD *)(a2 + 32);
    v24 = *(_DWORD *)(a1 + 20);
    v38 = *(_DWORD *)(a2 + 20);
    v39 = *(_DWORD *)(a1 + 12);
    v25 = *(unsigned __int8 *)(a2 + 24);
    v37 = IntelligenceFlowResponseGeneration.Event.Generation.Source.rawValue.getter();
    v26 = IntelligenceFlowResponseGeneration.Event.Generation.Source.rawValue.getter();
    v13 = v38;
    v2 = v39;
    v14 = v25;
    v4 = v24;
    v16 = v23;
    v15 = v22;
    v7 = v21;
    v18 = v43;
    v6 = v44;
    v19 = v40;
    v8 = v41;
    v9 = v42;
    v17 = v45;
    v20 = v46;
    if (v37 != v26)
      return 0;
  }
  if ((v3 & 1) != 0)
  {
    if (!v12)
      return 0;
  }
  else
  {
    if (v2 == v11)
      v27 = v12;
    else
      v27 = 1;
    if ((v27 & 1) != 0)
      return 0;
  }
  if ((v5 & 1) != 0)
  {
    if (!v14)
      return 0;
  }
  else
  {
    if (v4 == v13)
      v28 = v14;
    else
      v28 = 1;
    if ((v28 & 1) != 0)
      return 0;
  }
  if (!v7)
  {
    if (v15)
      return 0;
    goto LABEL_29;
  }
  if (!v15)
    return 0;
  v29 = v6 == v16 && v7 == v15;
  if (v29 || (OUTLINED_FUNCTION_4_3(), result = OUTLINED_FUNCTION_59(), (v31 & 1) != 0))
  {
LABEL_29:
    if (v9)
    {
      if (!v18)
        return 0;
      if (v8 != v17 || v9 != v18)
      {
        OUTLINED_FUNCTION_4_3();
        result = OUTLINED_FUNCTION_59();
        if ((v33 & 1) == 0)
          return result;
      }
    }
    else if (v18)
    {
      return 0;
    }
    if (v51)
    {
      if (!v20)
        return 0;
      if (v48 != v19 || v51 != v20)
      {
        OUTLINED_FUNCTION_4_3();
        result = OUTLINED_FUNCTION_59();
        if ((v35 & 1) == 0)
          return result;
      }
    }
    else if (v20)
    {
      return 0;
    }
    if (v50)
    {
      if (!v49)
        return 0;
      v36 = v10 == v47 && v50 == v49;
      return v36 || (OUTLINED_FUNCTION_4_3() & 1) != 0;
    }
    return !v49;
  }
  return result;
}

uint64_t IntelligenceFlowResponseGeneration.Event.Generation.hash(into:)()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;

  v1 = *(unsigned __int8 *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 88);
  v8 = *(unsigned __int8 *)(v0 + 24);
  if (*(_BYTE *)(v0 + 9) == 1)
  {
    OUTLINED_FUNCTION_5_0();
    if (!v1)
    {
LABEL_3:
      OUTLINED_FUNCTION_5_0();
      sub_23FF592D0();
      goto LABEL_6;
    }
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 88);
    OUTLINED_FUNCTION_5_0();
    v5 = v6;
    IntelligenceFlowResponseGeneration.Event.Generation.Source.rawValue.getter();
    OUTLINED_FUNCTION_61_1();
    if (!v1)
      goto LABEL_3;
  }
  OUTLINED_FUNCTION_5_0();
LABEL_6:
  if (v8)
  {
    OUTLINED_FUNCTION_5_0();
    if (v2)
      goto LABEL_8;
  }
  else
  {
    OUTLINED_FUNCTION_5_0();
    sub_23FF592D0();
    if (v2)
    {
LABEL_8:
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_82_1();
      sub_23FF59048();
      swift_bridgeObjectRelease();
      if (v3)
        goto LABEL_9;
      goto LABEL_14;
    }
  }
  OUTLINED_FUNCTION_5_0();
  if (v3)
  {
LABEL_9:
    OUTLINED_FUNCTION_5_0();
    swift_bridgeObjectRetain();
    sub_23FF59048();
    swift_bridgeObjectRelease();
    if (v4)
      goto LABEL_10;
LABEL_15:
    OUTLINED_FUNCTION_5_0();
    if (v5)
      goto LABEL_11;
    return OUTLINED_FUNCTION_5_0();
  }
LABEL_14:
  OUTLINED_FUNCTION_5_0();
  if (!v4)
    goto LABEL_15;
LABEL_10:
  OUTLINED_FUNCTION_5_0();
  swift_bridgeObjectRetain();
  sub_23FF59048();
  swift_bridgeObjectRelease();
  if (v5)
  {
LABEL_11:
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_19_7();
    OUTLINED_FUNCTION_99_7();
    return swift_bridgeObjectRelease();
  }
  return OUTLINED_FUNCTION_5_0();
}

void IntelligenceFlowResponseGeneration.Event.Generation.hashValue.getter()
{
  OUTLINED_FUNCTION_8_25();
  OUTLINED_FUNCTION_36_2();
  OUTLINED_FUNCTION_116_6();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_115_5();
}

void sub_23FEE8464()
{
  OUTLINED_FUNCTION_8_25();
  sub_23FF592AC();
  OUTLINED_FUNCTION_116_6();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_115_5();
}

uint64_t (*IntelligenceFlowResponseGeneration.Event.Fallback.reason.modify())()
{
  return nullsub_1;
}

void sub_23FEE84AC(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  IntelligenceFlowResponseGeneration.Event.Fallback.Reason.init(rawValue:)(a2, *a1);
}

void sub_23FEE84B4(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = IntelligenceFlowResponseGeneration.Event.Fallback.Reason.rawValue.getter(a1, a2);
  OUTLINED_FUNCTION_13();
}

void sub_23FEE84D4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v5;

  static IntelligenceFlowResponseGeneration.Event.Fallback.Reason.allCases.getter(a1, a2, a3);
  *a4 = v5;
  OUTLINED_FUNCTION_13();
}

void sub_23FEE84F4()
{
  sub_23FE91864();
}

uint64_t sub_23FEE8518()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_17_9();
  return sub_23FE918C0(v0, v1, v2, (void (*)(uint64_t, uint64_t))IntelligenceFlowResponseGeneration.Event.Fallback.Reason.rawValue.getter);
}

void sub_23FEE8538()
{
  OUTLINED_FUNCTION_17_9();
  sub_23FEE7F50();
}

BOOL sub_23FEE8558()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_13();
  return OUTLINED_FUNCTION_105_4(v0, v1, (uint64_t (*)(void))IntelligenceFlowResponseGeneration.Event.Fallback.Reason.rawValue.getter, v2);
}

BOOL static IntelligenceFlowResponseGeneration.Event.Fallback.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)(a1 + 9) & 1) == 0)
  {
    if ((*(_BYTE *)(a2 + 9) & 1) != 0)
      return 0;
    OUTLINED_FUNCTION_52_4();
    v4 = IntelligenceFlowResponseGeneration.Event.Fallback.Reason.rawValue.getter(v2, v3);
    return v4 == IntelligenceFlowResponseGeneration.Event.Fallback.Reason.rawValue.getter(v4, v5);
  }
  return (*(_BYTE *)(a2 + 9) & 1) != 0;
}

uint64_t IntelligenceFlowResponseGeneration.Event.Fallback.hash(into:)()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  if (*(_BYTE *)(v0 + 9) == 1)
    return OUTLINED_FUNCTION_5_0();
  v2 = OUTLINED_FUNCTION_5_0();
  IntelligenceFlowResponseGeneration.Event.Fallback.Reason.rawValue.getter(v2, v3);
  return OUTLINED_FUNCTION_61_1();
}

void IntelligenceFlowResponseGeneration.Event.Fallback.hashValue.getter()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_107_4();
  OUTLINED_FUNCTION_36_2();
  if (v0 == 1)
  {
    OUTLINED_FUNCTION_12_14();
  }
  else
  {
    v1 = OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_69_7(v1, v2);
    OUTLINED_FUNCTION_300();
  }
  OUTLINED_FUNCTION_301();
  OUTLINED_FUNCTION_38_7();
}

void sub_23FEE869C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_107_4();
  sub_23FF592AC();
  if (v0 == 1)
  {
    OUTLINED_FUNCTION_12_14();
  }
  else
  {
    v1 = OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_69_7(v1, v2);
    OUTLINED_FUNCTION_300();
  }
  OUTLINED_FUNCTION_301();
  OUTLINED_FUNCTION_38_7();
}

uint64_t (*IntelligenceFlowResponseGeneration.Event.Override.type.modify())()
{
  return nullsub_1;
}

uint64_t (*IntelligenceFlowResponseGeneration.Event.Override.id.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowResponseGeneration.Event.Override.init()(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
}

void sub_23FEE872C(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  IntelligenceFlowResponseGeneration.Event.Override.OverrideType.init(rawValue:)(a2, *a1);
}

void sub_23FEE8734(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = IntelligenceFlowResponseGeneration.Event.Override.OverrideType.rawValue.getter(a1, a2);
  OUTLINED_FUNCTION_13();
}

void sub_23FEE8754(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v5;

  static IntelligenceFlowResponseGeneration.Event.Override.OverrideType.allCases.getter(a1, a2, a3);
  *a4 = v5;
  OUTLINED_FUNCTION_13();
}

void sub_23FEE8774()
{
  sub_23FE91864();
}

uint64_t sub_23FEE8798()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_17_9();
  return sub_23FE918C0(v0, v1, v2, (void (*)(uint64_t, uint64_t))IntelligenceFlowResponseGeneration.Event.Override.OverrideType.rawValue.getter);
}

void sub_23FEE87B8()
{
  OUTLINED_FUNCTION_17_9();
  sub_23FEE7F50();
}

BOOL sub_23FEE87D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_13();
  return OUTLINED_FUNCTION_105_4(v0, v1, (uint64_t (*)(void))IntelligenceFlowResponseGeneration.Event.Override.OverrideType.rawValue.getter, v2);
}

BOOL static IntelligenceFlowResponseGeneration.Event.Override.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  if ((*(_BYTE *)(a1 + 9) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 9))
      return 0;
  }
  else
  {
    if ((*(_BYTE *)(a2 + 9) & 1) != 0)
      return 0;
    OUTLINED_FUNCTION_52_4();
    v8 = IntelligenceFlowResponseGeneration.Event.Override.OverrideType.rawValue.getter(v6, v7);
    if (v8 != IntelligenceFlowResponseGeneration.Event.Override.OverrideType.rawValue.getter(v8, v9))
      return 0;
  }
  if (v3)
  {
    if (!v4)
      return 0;
    v10 = v2 == v5 && v3 == v4;
    return v10 || (OUTLINED_FUNCTION_4_3() & 1) != 0;
  }
  return !v4;
}

uint64_t IntelligenceFlowResponseGeneration.Event.Override.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 24);
  if (*(_BYTE *)(v0 + 9) == 1)
  {
    OUTLINED_FUNCTION_5_0();
    if (v1)
    {
LABEL_3:
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_19_7();
      OUTLINED_FUNCTION_99_7();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v3 = OUTLINED_FUNCTION_5_0();
    IntelligenceFlowResponseGeneration.Event.Override.OverrideType.rawValue.getter(v3, v4);
    OUTLINED_FUNCTION_61_1();
    if (v1)
      goto LABEL_3;
  }
  return OUTLINED_FUNCTION_5_0();
}

void IntelligenceFlowResponseGeneration.Event.Override.hashValue.getter()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_89_3();
  OUTLINED_FUNCTION_36_2();
  if (v1 == 1)
  {
    OUTLINED_FUNCTION_12_14();
  }
  else
  {
    v2 = OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_64_6(v2, v3);
    OUTLINED_FUNCTION_300();
  }
  if (v0)
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_74_1();
    OUTLINED_FUNCTION_126_1();
    OUTLINED_FUNCTION_29_0();
  }
  else
  {
    OUTLINED_FUNCTION_12_14();
  }
  OUTLINED_FUNCTION_301();
  OUTLINED_FUNCTION_474();
}

void sub_23FEE89CC()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_89_3();
  sub_23FF592AC();
  if (v1 == 1)
  {
    OUTLINED_FUNCTION_12_14();
  }
  else
  {
    v2 = OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_64_6(v2, v3);
    OUTLINED_FUNCTION_300();
  }
  if (v0)
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_74_1();
    OUTLINED_FUNCTION_126_1();
    OUTLINED_FUNCTION_29_0();
  }
  else
  {
    OUTLINED_FUNCTION_12_14();
  }
  OUTLINED_FUNCTION_301();
  OUTLINED_FUNCTION_474();
}

void IntelligenceFlowResponseGeneration.Event.ModelInference.modelVersion.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowResponseGeneration.Event.ModelInference.modelVersion.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_85_1();
  *v1 = v2;
  v1[1] = v0;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowResponseGeneration.Event.ModelInference.modelVersion.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowResponseGeneration.Event.ModelInference.promptVersion.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void _s27IntelligencePlatformLibrary0A22FlowResponseGenerationV5EventO8OverrideV2idSSSgvs_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_228_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowResponseGeneration.Event.ModelInference.promptVersion.modify())()
{
  return nullsub_1;
}

void static IntelligenceFlowResponseGeneration.Event.ModelInference.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;

  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = a2[1];
  v7 = a2[2];
  v8 = a2[3];
  if (v3)
  {
    if (!v6)
      goto LABEL_17;
    if (*a1 != *a2 || v3 != v6)
    {
      OUTLINED_FUNCTION_4_3();
      OUTLINED_FUNCTION_59();
      if ((v10 & 1) == 0)
        goto LABEL_17;
    }
  }
  else if (v6)
  {
    goto LABEL_17;
  }
  if (v5 && v8 && (v4 != v7 || v5 != v8))
    OUTLINED_FUNCTION_4_3();
LABEL_17:
  OUTLINED_FUNCTION_9();
}

void IntelligenceFlowResponseGeneration.Event.ModelInference.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  if (*(_QWORD *)(v0 + 8))
  {
    OUTLINED_FUNCTION_274();
    OUTLINED_FUNCTION_44_1();
    sub_23FF59048();
    OUTLINED_FUNCTION_23_3();
    if (v1)
    {
LABEL_3:
      OUTLINED_FUNCTION_274();
      OUTLINED_FUNCTION_74_1();
      OUTLINED_FUNCTION_126_1();
      OUTLINED_FUNCTION_106_0();
      return;
    }
  }
  else
  {
    OUTLINED_FUNCTION_274();
    if (v1)
      goto LABEL_3;
  }
  OUTLINED_FUNCTION_274();
  OUTLINED_FUNCTION_8_6();
}

void IntelligenceFlowResponseGeneration.Event.ModelInference.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 24);
  OUTLINED_FUNCTION_33_0();
  if (v1)
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_44_1();
    OUTLINED_FUNCTION_47_4();
    OUTLINED_FUNCTION_23_3();
  }
  else
  {
    OUTLINED_FUNCTION_12_14();
  }
  if (v2)
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_74_1();
    OUTLINED_FUNCTION_126_1();
    OUTLINED_FUNCTION_29_0();
  }
  else
  {
    OUTLINED_FUNCTION_12_14();
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_117_1();
}

void sub_23FEE8C9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 24);
  OUTLINED_FUNCTION_58_1();
  if (v1)
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_44_1();
    OUTLINED_FUNCTION_47_4();
    OUTLINED_FUNCTION_23_3();
  }
  else
  {
    OUTLINED_FUNCTION_12_14();
  }
  if (v2)
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_74_1();
    OUTLINED_FUNCTION_126_1();
    OUTLINED_FUNCTION_29_0();
  }
  else
  {
    OUTLINED_FUNCTION_12_14();
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_117_1();
}

void IntelligenceFlowResponseGeneration.Event.SafetyCheck.ruleName.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowResponseGeneration.Event.SafetyCheck.ruleName.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_85_1();
  *v1 = v2;
  v1[1] = v0;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowResponseGeneration.Event.SafetyCheck.ruleName.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceFlowResponseGeneration.Event.SafetyCheck.isProfanityFiltered.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t IntelligenceFlowResponseGeneration.Event.SafetyCheck.isProfanityFiltered.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = result;
  return result;
}

uint64_t (*IntelligenceFlowResponseGeneration.Event.SafetyCheck.isProfanityFiltered.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowResponseGeneration.Event.SafetyCheck.ruleFailureReason.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowResponseGeneration.Event.SafetyCheck.ruleFailureReason.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_228_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = v0;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowResponseGeneration.Event.SafetyCheck.ruleFailureReason.modify())()
{
  return nullsub_1;
}

void __swiftcall IntelligenceFlowResponseGeneration.Event.SafetyCheck.init()(IntelligencePlatformLibrary::IntelligenceFlowResponseGeneration::Event::SafetyCheck *__return_ptr retstr)
{
  retstr->ruleName.value._countAndFlagsBits = 0;
  retstr->ruleName.value._object = 0;
  retstr->isProfanityFiltered.value = 2;
  retstr->ruleFailureReason.value._countAndFlagsBits = 0;
  retstr->ruleFailureReason.value._object = 0;
}

uint64_t static IntelligenceFlowResponseGeneration.Event.SafetyCheck.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t result;
  char v13;
  BOOL v14;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(unsigned __int8 *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(unsigned __int8 *)(a2 + 16);
  v10 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 32);
  if (!v3)
  {
    if (v7)
      return 0;
    goto LABEL_10;
  }
  if (!v7)
    return 0;
  v11 = *(_QWORD *)a1 == *(_QWORD *)a2 && v3 == v7;
  if (v11 || (OUTLINED_FUNCTION_4_3(), result = OUTLINED_FUNCTION_59(), (v13 & 1) != 0))
  {
LABEL_10:
    if (v4 == 2)
    {
      if (v8 != 2)
        return 0;
    }
    else
    {
      result = 0;
      if (v8 == 2 || ((((v4 & 1) == 0) ^ v8) & 1) == 0)
        return result;
    }
    if (v6)
    {
      if (!v9)
        return 0;
      v14 = v5 == v10 && v6 == v9;
      return v14 || (OUTLINED_FUNCTION_4_3() & 1) != 0;
    }
    return !v9;
  }
  return result;
}

void IntelligenceFlowResponseGeneration.Event.SafetyCheck.hash(into:)()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 32);
  if (*(_QWORD *)(v0 + 8))
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_44_1();
    OUTLINED_FUNCTION_47_4();
    OUTLINED_FUNCTION_23_3();
  }
  else
  {
    OUTLINED_FUNCTION_12_14();
  }
  if (v1 != 2)
    OUTLINED_FUNCTION_6_19();
  sub_23FF592C4();
  if (v2)
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_74_1();
    OUTLINED_FUNCTION_126_1();
    OUTLINED_FUNCTION_106_0();
  }
  else
  {
    OUTLINED_FUNCTION_12_14();
    OUTLINED_FUNCTION_8_6();
  }
}

void IntelligenceFlowResponseGeneration.Event.SafetyCheck.hashValue.getter()
{
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_118_4();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_124_1();
}

void sub_23FEE8FBC()
{
  OUTLINED_FUNCTION_58_1();
  OUTLINED_FUNCTION_118_4();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_124_1();
}

void IntelligenceFlowResponseGeneration.Event.hashValue.getter()
{
  OUTLINED_FUNCTION_35_16();
  OUTLINED_FUNCTION_36_2();
  OUTLINED_FUNCTION_117_8();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_132_1();
}

void sub_23FEE902C()
{
  OUTLINED_FUNCTION_35_16();
  sub_23FF592AC();
  OUTLINED_FUNCTION_117_8();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_132_1();
}

void IntelligenceFlowResponseGeneration.hashValue.getter()
{
  OUTLINED_FUNCTION_33_0();
  IntelligenceFlowResponseGeneration.hash(into:)();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_5_3();
}

void sub_23FEE9088()
{
  OUTLINED_FUNCTION_58_1();
  IntelligenceFlowResponseGeneration.hash(into:)();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_5_3();
}

void sub_23FEE90B0()
{
  sub_23FE51128(&qword_256F91CD8, &qword_256F91CE0);
}

unint64_t sub_23FEE90D8()
{
  unint64_t result;

  result = qword_256F91CE8;
  if (!qword_256F91CE8)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.Generation.Source, &type metadata for IntelligenceFlowResponseGeneration.Event.Generation.Source);
    atomic_store(result, (unint64_t *)&qword_256F91CE8);
  }
  return result;
}

unint64_t sub_23FEE9118()
{
  unint64_t result;

  result = qword_256F91CF0;
  if (!qword_256F91CF0)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.Generation, &type metadata for IntelligenceFlowResponseGeneration.Event.Generation);
    atomic_store(result, (unint64_t *)&qword_256F91CF0);
  }
  return result;
}

void sub_23FEE9154()
{
  sub_23FE51128(&qword_256F91CF8, &qword_256F91D00);
}

unint64_t sub_23FEE917C()
{
  unint64_t result;

  result = qword_256F91D08;
  if (!qword_256F91D08)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.Fallback.Reason, &type metadata for IntelligenceFlowResponseGeneration.Event.Fallback.Reason);
    atomic_store(result, (unint64_t *)&qword_256F91D08);
  }
  return result;
}

unint64_t sub_23FEE91BC()
{
  unint64_t result;

  result = qword_256F91D10;
  if (!qword_256F91D10)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.Fallback, &type metadata for IntelligenceFlowResponseGeneration.Event.Fallback);
    atomic_store(result, (unint64_t *)&qword_256F91D10);
  }
  return result;
}

void sub_23FEE91F8()
{
  sub_23FE51128(&qword_256F91D18, &qword_256F91D20);
}

unint64_t sub_23FEE9220()
{
  unint64_t result;

  result = qword_256F91D28;
  if (!qword_256F91D28)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.Override.OverrideType, &type metadata for IntelligenceFlowResponseGeneration.Event.Override.OverrideType);
    atomic_store(result, (unint64_t *)&qword_256F91D28);
  }
  return result;
}

unint64_t sub_23FEE9260()
{
  unint64_t result;

  result = qword_256F91D30;
  if (!qword_256F91D30)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.Override, &type metadata for IntelligenceFlowResponseGeneration.Event.Override);
    atomic_store(result, (unint64_t *)&qword_256F91D30);
  }
  return result;
}

unint64_t sub_23FEE92A0()
{
  unint64_t result;

  result = qword_256F91D38;
  if (!qword_256F91D38)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.ModelInference, &type metadata for IntelligenceFlowResponseGeneration.Event.ModelInference);
    atomic_store(result, (unint64_t *)&qword_256F91D38);
  }
  return result;
}

unint64_t sub_23FEE92E0()
{
  unint64_t result;

  result = qword_256F91D40;
  if (!qword_256F91D40)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration.Event.SafetyCheck, &type metadata for IntelligenceFlowResponseGeneration.Event.SafetyCheck);
    atomic_store(result, (unint64_t *)&qword_256F91D40);
  }
  return result;
}

unint64_t sub_23FEE9324()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256F91D48;
  if (!qword_256F91D48)
  {
    v1 = type metadata accessor for IntelligenceFlowResponseGeneration();
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowResponseGeneration, v1);
    atomic_store(result, (unint64_t *)&qword_256F91D48);
  }
  return result;
}

#error "23FEE9488: call analysis failed (funcsize=83)"

uint64_t destroy for IntelligenceFlowResponseGeneration(uint64_t a1, int *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  __n128 *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a1 + a2[5];
  v6 = OUTLINED_FUNCTION_46();
  if (!OUTLINED_FUNCTION_13_22(v6))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v5, v2);
  v7 = a1 + a2[6];
  if (*(_QWORD *)(v7 + 24))
    __swift_destroy_boxed_opaque_existential_1(v7);
  v8 = a1 + a2[7];
  v9 = OUTLINED_FUNCTION_6_1();
  result = OUTLINED_FUNCTION_13_22(v9);
  if (!(_DWORD)result)
  {
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_112_4();
    OUTLINED_FUNCTION_16_12();
    OUTLINED_FUNCTION_16_12();
    OUTLINED_FUNCTION_16_12();
    OUTLINED_FUNCTION_16_12();
    result = OUTLINED_FUNCTION_19_0(v8 + *(int *)(v2 + 40));
    if (!(_DWORD)result)
      result = OUTLINED_FUNCTION_112_4();
  }
  v11 = (__n128 *)(a1 + a2[8]);
  v12 = v11[6].n128_u8[0];
  if (v12 != 255)
    return OUTLINED_FUNCTION_86_7(v11->n128_u64[0], v11->n128_i64[1], v11[1].n128_i64[0], v11[1].n128_i64[1], v11[2].n128_i64[0], v11[2].n128_i64[1], v11[3].n128_i64[0], v11[3].n128_i64[1], v11[4], v13, v14, v11[5].n128_i64[0], v11[5].n128_i64[1], v12);
  return result;
}

#error "23FEE96A0: call analysis failed (funcsize=63)"

#error "23FEE9AE8: call analysis failed (funcsize=289)"

uint64_t sub_23FEE9B6C(uint64_t a1)
{
  destroy for IntelligenceFlowResponseGeneration.Event(a1);
  return a1;
}

uint64_t initializeWithTake for IntelligenceFlowResponseGeneration(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
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
  void *v17;
  const void *v18;
  size_t v19;
  uint64_t v20;

  v8 = OUTLINED_FUNCTION_0_13(a1, a2);
  if (OUTLINED_FUNCTION_1_16(v6))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_5_12(v9);
  }
  else
  {
    OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32));
    OUTLINED_FUNCTION_0_29(v5);
  }
  v10 = v4[6];
  v11 = v4[7];
  v12 = v2 + v10;
  v13 = v3 + v10;
  v14 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *(_OWORD *)(v12 + 16) = v14;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v13 + 32);
  v15 = v2 + v11;
  v16 = v3 + v11;
  OUTLINED_FUNCTION_6_1();
  if (OUTLINED_FUNCTION_19_0(v16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256F90400);
    v17 = (void *)OUTLINED_FUNCTION_129_3();
    memcpy(v17, v18, v19);
  }
  else
  {
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_26_12(v15);
    if (OUTLINED_FUNCTION_1_24())
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_35_11(v20);
    }
    else
    {
      OUTLINED_FUNCTION_26_12(v7);
      OUTLINED_FUNCTION_14_3(v7);
    }
    OUTLINED_FUNCTION_16_20();
  }
  OUTLINED_FUNCTION_67_7((void *)(v2 + v4[8]), (const void *)(v3 + v4[8]));
  return v2;
}

void assignWithTake for IntelligenceFlowResponseGeneration(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int EnumTagSinglePayload;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  int v21;
  int v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  size_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  _OWORD *v38;
  __n128 v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;

  v8 = OUTLINED_FUNCTION_0_13(a1, a2);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v5, 1, v8);
  v10 = OUTLINED_FUNCTION_1_16(v6);
  if (EnumTagSinglePayload)
  {
    if (!v10)
    {
      OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32));
      OUTLINED_FUNCTION_0_29(v5);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v11 = *(_QWORD *)(v8 - 8);
  if (v10)
  {
    OUTLINED_FUNCTION_20_5(v11);
LABEL_6:
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_5_12(v12);
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 40));
LABEL_7:
  v13 = v4[6];
  v14 = v2 + v13;
  v15 = v3 + v13;
  if (*(_QWORD *)(v2 + v13 + 24))
    __swift_destroy_boxed_opaque_existential_1(v14);
  v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v16;
  *(_QWORD *)(v14 + 32) = *(_QWORD *)(v15 + 32);
  v17 = v4[7];
  v18 = v2 + v17;
  v19 = v3 + v17;
  v20 = (int *)OUTLINED_FUNCTION_6_1();
  v21 = __swift_getEnumTagSinglePayload(v18, 1, (uint64_t)v20);
  v22 = OUTLINED_FUNCTION_19_0(v19);
  if (v21)
  {
    if (!v22)
    {
      OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_26_12(v18);
      if (OUTLINED_FUNCTION_1_24())
      {
        v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_35_11(v23);
      }
      else
      {
        OUTLINED_FUNCTION_26_12(v7);
        OUTLINED_FUNCTION_14_3(v7);
      }
      v32 = OUTLINED_FUNCTION_132_3();
      goto LABEL_23;
    }
    goto LABEL_15;
  }
  if (v22)
  {
    sub_23FEE3CFC(v18);
LABEL_15:
    __swift_instantiateConcreteTypeFromMangledName(&qword_256F90400);
    v24 = (void *)OUTLINED_FUNCTION_129_3();
LABEL_16:
    memcpy(v24, v25, v26);
    goto LABEL_24;
  }
  v27 = *(_QWORD *)(OUTLINED_FUNCTION_1_2() - 8);
  OUTLINED_FUNCTION_26_12(v18);
  v28 = v20[5];
  v29 = v18 + v28;
  v30 = v19 + v28;
  *(_QWORD *)v29 = *(_QWORD *)v30;
  *(_BYTE *)(v29 + 8) = *(_BYTE *)(v30 + 8);
  OUTLINED_FUNCTION_14_23(v20[6]);
  OUTLINED_FUNCTION_14_23(v20[7]);
  OUTLINED_FUNCTION_14_23(v20[8]);
  OUTLINED_FUNCTION_14_23(v20[9]);
  v31 = OUTLINED_FUNCTION_33_12();
  if ((_DWORD)v19)
  {
    if (!v31)
    {
      OUTLINED_FUNCTION_83_3(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 32));
      v32 = OUTLINED_FUNCTION_133_1();
LABEL_23:
      __swift_storeEnumTagSinglePayload(v32, v33, v34, v35);
      goto LABEL_24;
    }
    goto LABEL_32;
  }
  if (v31)
  {
    OUTLINED_FUNCTION_124_4(*(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
LABEL_32:
    __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    v24 = (void *)OUTLINED_FUNCTION_130_2();
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_96_4();
LABEL_24:
  v36 = v4[8];
  v37 = (uint64_t *)(v2 + v36);
  v38 = (_OWORD *)(v3 + v36);
  if (*(unsigned __int8 *)(v2 + v36 + 96) == 255)
  {
LABEL_28:
    OUTLINED_FUNCTION_67_7(v37, v38);
    goto LABEL_29;
  }
  if (*((unsigned __int8 *)v38 + 96) == 255)
  {
    sub_23FEE9B6C((uint64_t)v37);
    goto LABEL_28;
  }
  v39 = OUTLINED_FUNCTION_88_7();
  v40 = v37[10];
  v41 = v37[11];
  v42 = v38[1];
  *(_OWORD *)v37 = *v38;
  *((_OWORD *)v37 + 1) = v42;
  v43 = v38[3];
  *((_OWORD *)v37 + 2) = v38[2];
  *((_OWORD *)v37 + 3) = v43;
  v44 = v38[5];
  *((_OWORD *)v37 + 4) = v38[4];
  *((_OWORD *)v37 + 5) = v44;
  *((_BYTE *)v37 + 96) = v45;
  OUTLINED_FUNCTION_86_7(v46, v47, v48, v49, v50, v51, v52, v53, v39, v55, v56, v40, v41, v54);
LABEL_29:
  OUTLINED_FUNCTION_117_1();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowResponseGeneration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23FEE9F40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = *(int *)(a3 + 20);
  }
  else
  {
    if ((_DWORD)a2 == 2147483646)
    {
      OUTLINED_FUNCTION_48_2();
      OUTLINED_FUNCTION_9();
      return;
    }
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90400);
    v8 = *(int *)(a3 + 28);
  }
  __swift_getEnumTagSinglePayload(a1 + v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowResponseGeneration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23FEE9FE4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a4[5];
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(a1 + a4[6] + 24) = a2;
      OUTLINED_FUNCTION_9();
      return;
    }
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90400);
    v10 = a4[7];
  }
  __swift_storeEnumTagSinglePayload(a1 + v10, a2, a2, v9);
}

void sub_23FEEA080()
{
  unint64_t v0;
  unint64_t v1;

  sub_23FE54000(319, (unint64_t *)&qword_25434BB08, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
  {
    sub_23FE54000(319, &qword_25434B910, (void (*)(uint64_t))type metadata accessor for IntelligenceFlowIdentifiers);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t destroy for IntelligenceFlowResponseGeneration.Event(uint64_t a1)
{
  return sub_23FEE3484(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_BYTE *)(a1 + 96));
}

void initializeWithCopy for IntelligenceFlowResponseGeneration.Event(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, char a19)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_32_11();
  OUTLINED_FUNCTION_3_26(v21, v22);
  OUTLINED_FUNCTION_105_8();
  *(_QWORD *)(v19 + 64) = v20;
  *(_QWORD *)(v19 + 72) = a15;
  *(_QWORD *)(v19 + 80) = a16;
  *(_QWORD *)(v19 + 88) = a17;
  *(_BYTE *)(v19 + 96) = a19;
  OUTLINED_FUNCTION_178_0();
}

#error "23FEEA230: call analysis failed (funcsize=28)"

void *__swift_memcpy97_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x61uLL);
}

uint64_t assignWithTake for IntelligenceFlowResponseGeneration.Event(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v3 = *(_BYTE *)(a2 + 96);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_OWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a1 + 88);
  v15 = *(_BYTE *)(a1 + 96);
  v16 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v16;
  v17 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v17;
  v18 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v18;
  *(_BYTE *)(a1 + 96) = v3;
  sub_23FEE3484(v4, v6, v5, v7, v8, v9, v10, v11, v12, *((uint64_t *)&v12 + 1), v13, v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowResponseGeneration.Event(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return OUTLINED_FUNCTION_41_3(-1);
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 97))
    return OUTLINED_FUNCTION_41_3(*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 96);
  if (v3 > 4)
    return OUTLINED_FUNCTION_41_3(v3 ^ 0xFF);
  else
    return OUTLINED_FUNCTION_41_3(-1);
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowResponseGeneration.Event(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 96) = 0;
    *(_QWORD *)result = a2 - 252;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 97) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 97) = 0;
    if (a2)
      *(_BYTE *)(result + 96) = -(char)a2;
  }
  return result;
}

uint64_t sub_23FEEA360(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 96);
}

uint64_t sub_23FEEA368(uint64_t result, char a2)
{
  *(_BYTE *)(result + 96) = a2;
  return result;
}

void type metadata accessor for IntelligenceFlowResponseGeneration.Event()
{
  OUTLINED_FUNCTION_33();
}

uint64_t destroy for IntelligenceFlowResponseGeneration.Event.Generation()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_27_3();
}

void initializeWithCopy for IntelligenceFlowResponseGeneration.Event.Generation(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_28_14((uint64_t)a1, a2);
  v4 = v3[5];
  a1[4] = v3[4];
  a1[5] = v4;
  v5 = v3[7];
  a1[6] = v3[6];
  a1[7] = v5;
  v6 = v3[9];
  a1[8] = v3[8];
  a1[9] = v6;
  v7 = v3[11];
  a1[10] = v3[10];
  a1[11] = v7;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_19_7();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_9();
}

void assignWithCopy for IntelligenceFlowResponseGeneration.Event.Generation(uint64_t a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  v4 = OUTLINED_FUNCTION_94_6(a1, a2);
  v6 = *(_DWORD *)(v5 + 12);
  *(_BYTE *)(v4 + 16) = *(_BYTE *)(v5 + 16);
  *(_DWORD *)(v4 + 12) = v6;
  v7 = *(_DWORD *)(v5 + 20);
  *(_BYTE *)(v4 + 24) = *(_BYTE *)(v5 + 24);
  *(_DWORD *)(v4 + 20) = v7;
  *(_QWORD *)(v4 + 32) = *(_QWORD *)(v5 + 32);
  v2[5] = *(_QWORD *)(v5 + 40);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_16_10();
  v2[6] = a2[6];
  v2[7] = a2[7];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_16_10();
  v2[8] = a2[8];
  v2[9] = a2[9];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_16_10();
  v2[10] = a2[10];
  v2[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9();
}

void *__swift_memcpy96_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

void assignWithTake for IntelligenceFlowResponseGeneration.Event.Generation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_28_14((uint64_t)a1, (uint64_t)a2);
  v5 = *(_QWORD *)(v4 + 40);
  a1[4] = *(_QWORD *)(v4 + 32);
  a1[5] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowResponseGeneration.Event.Generation(uint64_t a1, unsigned int a2)
{
  int v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 96))
      return OUTLINED_FUNCTION_41_3(*(_DWORD *)a1 + 2147483646);
    OUTLINED_FUNCTION_48_2();
  }
  else
  {
    v3 = -1;
  }
  return OUTLINED_FUNCTION_41_3(v3);
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowResponseGeneration.Event.Generation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 96) = 0;
    if (a2)
      *(_QWORD *)(result + 40) = a2;
  }
  return result;
}

void type metadata accessor for IntelligenceFlowResponseGeneration.Event.Generation()
{
  OUTLINED_FUNCTION_33();
}

void type metadata accessor for IntelligenceFlowResponseGeneration.Event.Generation.Source()
{
  OUTLINED_FUNCTION_33();
}

void type metadata accessor for IntelligenceFlowResponseGeneration.Event.Fallback()
{
  OUTLINED_FUNCTION_33();
}

void type metadata accessor for IntelligenceFlowResponseGeneration.Event.Fallback.Reason()
{
  OUTLINED_FUNCTION_33();
}

uint64_t destroy for IntelligenceFlowResponseGeneration.Event.Override()
{
  return swift_bridgeObjectRelease();
}

void initializeWithCopy for IntelligenceFlowResponseGeneration.Event.Override(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_531(a1, a2);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v3 + 16);
  *(_QWORD *)(v2 + 24) = v4;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_13();
}

void assignWithCopy for IntelligenceFlowResponseGeneration.Event.Override(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = OUTLINED_FUNCTION_94_6(a1, a2);
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v4 + 16);
  *(_QWORD *)(v2 + 24) = *(_QWORD *)(v4 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
}

void assignWithTake for IntelligenceFlowResponseGeneration.Event.Override(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_531(a1, a2);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v3 + 16);
  *(_QWORD *)(v2 + 24) = v4;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowResponseGeneration.Event.Override(uint64_t a1, unsigned int a2)
{
  int v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
      return OUTLINED_FUNCTION_41_3(*(_DWORD *)a1 + 2147483646);
    OUTLINED_FUNCTION_48_2();
  }
  else
  {
    v3 = -1;
  }
  return OUTLINED_FUNCTION_41_3(v3);
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowResponseGeneration.Event.Override(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

void type metadata accessor for IntelligenceFlowResponseGeneration.Event.Override()
{
  OUTLINED_FUNCTION_33();
}

void type metadata accessor for IntelligenceFlowResponseGeneration.Event.Override.OverrideType()
{
  OUTLINED_FUNCTION_33();
}

void type metadata accessor for IntelligenceFlowResponseGeneration.Event.ModelInference()
{
  OUTLINED_FUNCTION_33();
}

uint64_t destroy for IntelligenceFlowResponseGeneration.Event.SafetyCheck()
{
  OUTLINED_FUNCTION_261_0();
  return OUTLINED_FUNCTION_27_3();
}

void initializeWithCopy for IntelligenceFlowResponseGeneration.Event.SafetyCheck(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13();
}

void assignWithCopy for IntelligenceFlowResponseGeneration.Event.SafetyCheck(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_95_1(a1, a2);
  OUTLINED_FUNCTION_16_10();
  *(_BYTE *)(v3 + 16) = *(_BYTE *)(v2 + 16);
  *(_QWORD *)(v3 + 24) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(v3 + 32) = *(_QWORD *)(v2 + 32);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_9();
}

void assignWithTake for IntelligenceFlowResponseGeneration.Event.SafetyCheck(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_129_1(a1, a2);
  *(_BYTE *)(v3 + 16) = *(_BYTE *)(v2 + 16);
  v4 = *(_QWORD *)(v2 + 32);
  *(_QWORD *)(v3 + 24) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(v3 + 32) = v4;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowResponseGeneration.Event.SafetyCheck(uint64_t a1, unsigned int a2)
{
  int v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
      return OUTLINED_FUNCTION_41_3(*(_DWORD *)a1 + 2147483646);
    OUTLINED_FUNCTION_48_2();
  }
  else
  {
    v3 = -1;
  }
  return OUTLINED_FUNCTION_41_3(v3);
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowResponseGeneration.Event.SafetyCheck(uint64_t result, unsigned int a2, unsigned int a3)
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
      return OUTLINED_FUNCTION_148_1(result, a2);
  }
  return result;
}

void type metadata accessor for IntelligenceFlowResponseGeneration.Event.SafetyCheck()
{
  OUTLINED_FUNCTION_33();
}

uint64_t OUTLINED_FUNCTION_4_24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v3 = (_QWORD *)(v1 + a1);
  v4 = (_QWORD *)(v2 + a1);
  *v3 = *v4;
  v3[1] = v4[1];
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_14_23@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (_QWORD *)(v1 + a1);
  v4 = (uint64_t *)(v2 + a1);
  v6 = *v4;
  v5 = v4[1];
  *v3 = v6;
  v3[1] = v5;
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_21_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
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

  *(_QWORD *)v19 = v18;
  *(_QWORD *)(v19 + 8) = v20;
  *(_QWORD *)(v19 + 16) = v21;
  *(_QWORD *)(v19 + 24) = v22;
  *(_QWORD *)(v19 + 32) = v23;
  *(_QWORD *)(v19 + 40) = v24;
  *(_QWORD *)(v19 + 48) = v25;
  *(_QWORD *)(v19 + 56) = v26;
  *(_QWORD *)(v19 + 64) = a14;
  *(_QWORD *)(v19 + 72) = a15;
  *(_QWORD *)(v19 + 80) = a16;
  *(_QWORD *)(v19 + 88) = a17;
  *(_BYTE *)(v19 + 96) = v17;
}

uint64_t OUTLINED_FUNCTION_26_12(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_28_14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)result = *(_QWORD *)a2;
  *(_WORD *)(result + 8) = *(_WORD *)(a2 + 8);
  *(_DWORD *)(result + 12) = *(_DWORD *)(a2 + 12);
  *(_BYTE *)(result + 16) = *(_BYTE *)(a2 + 16);
  *(_DWORD *)(result + 20) = *(_DWORD *)(a2 + 20);
  *(_BYTE *)(result + 24) = *(_BYTE *)(a2 + 24);
  return result;
}

uint64_t OUTLINED_FUNCTION_33_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *(int *)(v1 + 40);
  v5 = v2 + v4;
  __swift_getEnumTagSinglePayload(v0 + v4, 1, v3);
  return __swift_getEnumTagSinglePayload(v5, 1, v3);
}

__n128 OUTLINED_FUNCTION_35_16()
{
  __n128 *v0;

  return v0[4];
}

uint64_t OUTLINED_FUNCTION_41_10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

void OUTLINED_FUNCTION_60_8(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + a1) = *(_QWORD *)(v2 + a1);
}

uint64_t OUTLINED_FUNCTION_64_6(uint64_t a1, uint64_t a2)
{
  return IntelligenceFlowResponseGeneration.Event.Override.OverrideType.rawValue.getter(a1, a2);
}

void *OUTLINED_FUNCTION_67_7(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x61uLL);
}

uint64_t OUTLINED_FUNCTION_69_7(uint64_t a1, uint64_t a2)
{
  return IntelligenceFlowResponseGeneration.Event.Fallback.Reason.rawValue.getter(a1, a2);
}

uint64_t OUTLINED_FUNCTION_71_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t (*a17)(uint64_t, uint64_t, uint64_t), uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;

  return a17(a18, v19, v18);
}

void *OUTLINED_FUNCTION_75_5(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__dst)
{
  const void *v18;

  return memcpy(__dst, v18, *(_QWORD *)(*(_QWORD *)(a1 - 8) + 64));
}

uint64_t OUTLINED_FUNCTION_86_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  return sub_23FEE3484(a1, a2, a3, a4, a5, a6, a7, a8, a9.n128_i64[0], a9.n128_i64[1], a12, a13, a14);
}

__n128 OUTLINED_FUNCTION_88_7()
{
  __n128 *v0;

  return v0[4];
}

uint64_t OUTLINED_FUNCTION_91_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_94_6(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_96_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_99_7()
{
  return sub_23FF59048();
}

void OUTLINED_FUNCTION_105_8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *v0 = v1;
  v0[1] = v2;
  v0[2] = v3;
  v0[3] = v4;
  v0[4] = v5;
  v0[5] = v6;
  v0[6] = v7;
  v0[7] = v8;
}

uint64_t OUTLINED_FUNCTION_112_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_116_6()
{
  return IntelligenceFlowResponseGeneration.Event.Generation.hash(into:)();
}

void OUTLINED_FUNCTION_117_8()
{
  IntelligenceFlowResponseGeneration.Event.hash(into:)();
}

void OUTLINED_FUNCTION_118_4()
{
  IntelligenceFlowResponseGeneration.Event.SafetyCheck.hash(into:)();
}

uint64_t OUTLINED_FUNCTION_124_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

ValueMetadata *type metadata accessor for Library.Streams.IntelligenceFlow.Transcript()
{
  return &type metadata for Library.Streams.IntelligenceFlow.Transcript;
}

uint64_t sub_23FEEABA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v0 = sub_23FF59138();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_24();
  v4 = v3 - v2;
  sub_23FF5912C();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_24();
  sub_23FF58F7C();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6_6(v7, &qword_256F90528);
  sub_23FF58F70();
  sub_23FE69F2C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90538);
  sub_23FE69F6C();
  sub_23FF5918C();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BEE5750], v0);
  OUTLINED_FUNCTION_71();
  result = sub_23FF59150();
  qword_25434DD78 = result;
  return result;
}

id sub_23FEEAD18@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  id v4;
  id result;
  void *v6;

  v3 = (void *)qword_256FAAE00;
  if (qword_256FAAE00)
  {
    v4 = (id)qword_256FAAE00;
LABEL_3:
    *a1 = v4;
    return v3;
  }
  sub_23FE14BD0();
  OUTLINED_FUNCTION_71();
  result = (id)sub_23FF58C40();
  if (!v1)
  {
    v6 = (void *)qword_256FAAE00;
    qword_256FAAE00 = (uint64_t)result;
    v4 = result;

    v3 = 0;
    goto LABEL_3;
  }
  return result;
}

uint64_t sub_23FEEADBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
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
  __int128 v21;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25434BB00);
  v0 = OUTLINED_FUNCTION_40();
  *(_OWORD *)(v0 + 16) = xmmword_23FF66C70;
  v1 = OUTLINED_FUNCTION_1_0();
  *(_OWORD *)(v1 + 16) = xmmword_23FF66570;
  OUTLINED_FUNCTION_6_6(v1, (unint64_t *)&qword_25434BAF0);
  *(_QWORD *)(v1 + 32) = sub_23FF5915C();
  *(_QWORD *)(v1 + 40) = sub_23FF5915C();
  OUTLINED_FUNCTION_10_8();
  OUTLINED_FUNCTION_83_7();
  result = (uint64_t)OUTLINED_FUNCTION_11_25((uint64_t)"identifiers.clientSessionId");
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  *(_QWORD *)(v0 + 32) = result;
  v3 = OUTLINED_FUNCTION_1_0();
  *(_QWORD *)(v3 + 32) = OUTLINED_FUNCTION_52_7(v3, v4, v5, v6, v7, v8, v9, v10, xmmword_23FF66570);
  *(_QWORD *)(v3 + 40) = sub_23FF5915C();
  OUTLINED_FUNCTION_10_8();
  OUTLINED_FUNCTION_83_7();
  result = (uint64_t)OUTLINED_FUNCTION_11_25((uint64_t)"identifiers.clientRequestId");
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  *(_QWORD *)(v0 + 40) = result;
  v11 = OUTLINED_FUNCTION_1_0();
  *(_QWORD *)(v11 + 32) = OUTLINED_FUNCTION_52_7(v11, v12, v13, v14, v15, v16, v17, v18, v21);
  *(_QWORD *)(v11 + 40) = sub_23FF5915C();
  OUTLINED_FUNCTION_10_8();
  OUTLINED_FUNCTION_83_7();
  OUTLINED_FUNCTION_71();
  result = (uint64_t)sub_23FE1F26C(v19, v20, 6, 1, v11, 14, 3);
  if (result)
  {
    *(_QWORD *)(v0 + 48) = result;
    result = OUTLINED_FUNCTION_10_8();
    qword_25434F448 = v0;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t *sub_23FEEAF6C()
{
  if (qword_25434F360 != -1)
    swift_once();
  return &qword_25434F448;
}

void sub_23FEEAFAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25434BB00);
  v0 = OUTLINED_FUNCTION_40();
  *(_OWORD *)(v0 + 16) = xmmword_23FF66C70;
  OUTLINED_FUNCTION_40_6();
  v1 = OUTLINED_FUNCTION_33_13();
  *(_QWORD *)(v0 + 32) = OUTLINED_FUNCTION_71_8(v1, v2, v3, v4);
  OUTLINED_FUNCTION_40_6();
  OUTLINED_FUNCTION_71();
  *(_QWORD *)(v0 + 40) = OUTLINED_FUNCTION_12_17(v5, (uint64_t)"identifiers.clientSessionId AS clientSessionIdentifier");
  OUTLINED_FUNCTION_40_6();
  OUTLINED_FUNCTION_71();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_12_17(v6, (uint64_t)"identifiers.clientRequestId AS clientRequestIdentifier");
  OUTLINED_FUNCTION_47_10();
  qword_25434F430 = v7;
  OUTLINED_FUNCTION_80();
}

void sub_23FEEB070()
{
  OUTLINED_FUNCTION_16_14();
  sub_23FEEB090();
  OUTLINED_FUNCTION_13();
}

void sub_23FEEB090()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v1 = OUTLINED_FUNCTION_32_4();
  if (qword_25434D0B0 != -1)
    v1 = swift_once();
  OUTLINED_FUNCTION_6_6(v1, &qword_25434ADA0);
  v2 = (void *)OUTLINED_FUNCTION_9_15();
  OUTLINED_FUNCTION_71();
  v3 = (void *)OUTLINED_FUNCTION_78_6();
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex();
  OUTLINED_FUNCTION_1_14((uint64_t)v10.super_class, sel_initWithName_fields_streamIdentifier_, v4, v5, v6, v7, v8, v9, v10);
  OUTLINED_FUNCTION_25_5();

  OUTLINED_FUNCTION_80();
}

uint64_t type metadata accessor for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex()
{
  return objc_opt_self();
}

id sub_23FEEB170()
{
  void *v0;
  uint64_t v1;
  __n128 *v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  __n128 *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90518);
  v2 = (__n128 *)OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_45_10(v2, (__n128)xmmword_23FF614F0);
  v3 = OUTLINED_FUNCTION_29_5();
  v4 = OUTLINED_FUNCTION_16_17(v3);
  v5 = sub_23FE69EF4(0, &qword_256F90520);
  v2[5].n128_u64[1] = v5;
  v2[4].n128_u64[0] = (unint64_t)v4;
  v6 = OUTLINED_FUNCTION_29_5();
  v7 = OUTLINED_FUNCTION_16_17(v6);
  v2[7].n128_u64[1] = v5;
  v2[6].n128_u64[0] = (unint64_t)v7;
  v8 = (__n128 *)OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_45_10(v8, (__n128)xmmword_23FF614F0);
  v9 = OUTLINED_FUNCTION_29_5();
  v10 = OUTLINED_FUNCTION_16_17(v9);
  v8[5].n128_u64[1] = v5;
  v8[4].n128_u64[0] = (unint64_t)v10;
  v11 = OUTLINED_FUNCTION_29_5();
  v12 = (uint64_t)OUTLINED_FUNCTION_16_17(v11);
  v8[7].n128_u64[1] = v5;
  v8[6].n128_u64[0] = v12;
  if (_MergedGlobals_17 != -1)
    v12 = swift_once();
  OUTLINED_FUNCTION_6_6(v12, &qword_256F90510);
  OUTLINED_FUNCTION_34_6();
  if (v1)
  {
    OUTLINED_FUNCTION_23_3();
    return (id)OUTLINED_FUNCTION_17_3();
  }
  else
  {
    v14 = objc_allocWithZone(MEMORY[0x24BE0CBD0]);
    return OUTLINED_FUNCTION_1_15(v0);
  }
}

id sub_23FEEB304@<X0>(_QWORD *a1@<X8>)
{
  return sub_23FEEAD18(a1);
}

#error "23FEEB390: call analysis failed (funcsize=106)"

id sub_23FEEB4DC()
{
  unint64_t v0;
  unint64_t v1;
  __n128 *v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  uint64_t v26;

  OUTLINED_FUNCTION_60_9();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90518);
  v2 = (__n128 *)OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_32_5(v2, (__n128)xmmword_23FF614F0);
  v3 = OUTLINED_FUNCTION_6_9();
  v4 = OUTLINED_FUNCTION_4_19(v3);
  v5 = OUTLINED_FUNCTION_20_14((uint64_t)v4, &qword_256F90520);
  v6 = MEMORY[0x24BEE0D00];
  v2[2].n128_u64[0] = (unint64_t)v4;
  v2[5].n128_u64[1] = v6;
  v2[3].n128_u64[1] = v5;
  v2[4].n128_u64[0] = v1;
  v2[4].n128_u64[1] = v0;
  OUTLINED_FUNCTION_6_9();
  v7 = OUTLINED_FUNCTION_20_1();
  v8 = OUTLINED_FUNCTION_22_0(v7, sel_init);
  v2[7].n128_u64[1] = v5;
  v2[6].n128_u64[0] = (unint64_t)v8;
  v9 = OUTLINED_FUNCTION_48();
  *(_OWORD *)(v9 + 16) = v25;
  v10 = OUTLINED_FUNCTION_6_9();
  *(_QWORD *)(v9 + 32) = OUTLINED_FUNCTION_4_19(v10);
  *(_QWORD *)(v9 + 88) = v6;
  *(_QWORD *)(v9 + 56) = v5;
  *(_QWORD *)(v9 + 64) = v1;
  *(_QWORD *)(v9 + 72) = v0;
  OUTLINED_FUNCTION_6_9();
  v11 = OUTLINED_FUNCTION_20_1();
  v12 = (uint64_t)OUTLINED_FUNCTION_22_0(v11, sel_init);
  *(_QWORD *)(v9 + 120) = v5;
  *(_QWORD *)(v9 + 96) = v12;
  if (_MergedGlobals_17 != -1)
    v12 = swift_once();
  OUTLINED_FUNCTION_6_6(v12, &qword_256F90510);
  sub_23FF59144();
  if (v26)
  {
    OUTLINED_FUNCTION_23_3();
    return (id)OUTLINED_FUNCTION_17_3();
  }
  else
  {
    v14 = objc_allocWithZone(MEMORY[0x24BE0CBD0]);
    v22 = OUTLINED_FUNCTION_19_16((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21, v23, v24);
    return OUTLINED_FUNCTION_1_15(v22);
  }
}

#error "23FEEB718: call analysis failed (funcsize=107)"

#error "23FEEB988: call analysis failed (funcsize=86)"

#error "23FEEBA54: call analysis failed (funcsize=102)"

void sub_23FEEBB64(uint64_t a1, char a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10)
{
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
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  __n128 *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __n128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
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
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  uint64_t v101;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;

  v96 = a3;
  v98 = a7;
  HIDWORD(v102) = a4;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90518);
  v16 = OUTLINED_FUNCTION_48();
  v23 = v16;
  v100 = xmmword_23FF614F0;
  *(_OWORD *)(v16 + 16) = xmmword_23FF614F0;
  if ((a2 & 1) != 0)
  {
    v31 = OUTLINED_FUNCTION_14_20();
    v32 = OUTLINED_FUNCTION_69_8(v31);
    v24 = OUTLINED_FUNCTION_3_21((uint64_t)v32, &qword_256F90520);
    *(_QWORD *)(v23 + 56) = v24;
    *(_QWORD *)(v23 + 32) = v32;
  }
  else
  {
    *(_QWORD *)&v103 = a1;
    v24 = (uint64_t)OUTLINED_FUNCTION_18_13(v16, (_OWORD *)(v16 + 32), v17, v18, v19, v20, v21, v22, v92, v94, v96, v98, 3, 6, v101, v102, v103);
  }
  if (a6)
  {
    *(_QWORD *)&v104 = a5;
    *((_QWORD *)&v104 + 1) = a6;
    v33 = (uint64_t)OUTLINED_FUNCTION_18_13(v24, (_OWORD *)(v23 + 64), v25, v26, v27, v28, v29, v30, v92, v94, v96, v98, v100, *((uint64_t *)&v100 + 1), v101, v102, v104);
    if (*((_QWORD *)&a9 + 1))
    {
LABEL_6:
      OUTLINED_FUNCTION_18_13(v33, (_OWORD *)(v23 + 96), v34, v35, v36, v37, v38, v39, v92, v94, v96, v98, v100, *((uint64_t *)&v100 + 1), v101, v102, a9);
      OUTLINED_FUNCTION_74_1();
      goto LABEL_9;
    }
  }
  else
  {
    v40 = OUTLINED_FUNCTION_14_20();
    v41 = OUTLINED_FUNCTION_16_17(v40);
    v33 = OUTLINED_FUNCTION_3_21((uint64_t)v41, &qword_256F90520);
    *(_QWORD *)(v23 + 88) = v33;
    *(_QWORD *)(v23 + 64) = v41;
    if (*((_QWORD *)&a9 + 1))
      goto LABEL_6;
  }
  OUTLINED_FUNCTION_14_20();
  v42 = OUTLINED_FUNCTION_74_1();
  v43 = OUTLINED_FUNCTION_22_0(v42, (const char *)0x1F34D2DC8);
  *(_QWORD *)(v23 + 120) = OUTLINED_FUNCTION_3_21((uint64_t)v43, &qword_256F90520);
  *(_QWORD *)(v23 + 96) = v43;
LABEL_9:
  v44 = (__n128 *)OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_81_4(v44, v45, v46, v47, v48, v49, v50, v51, v92, v94, v96, v98, v52);
  if ((v60 & 1) != 0)
  {
    OUTLINED_FUNCTION_14_20();
    v68 = swift_bridgeObjectRetain();
    v69 = OUTLINED_FUNCTION_22_0(v68, (const char *)0x1F34D2DC8);
    v61 = OUTLINED_FUNCTION_3_21((uint64_t)v69, &qword_256F90520);
    *(_QWORD *)(v15 + 56) = v61;
    *(_QWORD *)(v15 + 32) = v69;
  }
  else
  {
    *(_QWORD *)&v103 = v97;
    OUTLINED_FUNCTION_18_13(v53, (_OWORD *)(v15 + 32), v54, v55, v56, v57, v58, v59, v93, (uint64_t)v95, v97, v99, v100, *((uint64_t *)&v100 + 1), v101, v102, v103);
    v61 = swift_bridgeObjectRetain();
  }
  if (a8)
  {
    *(_QWORD *)&v105 = v99;
    *((_QWORD *)&v105 + 1) = a8;
    v70 = (uint64_t)OUTLINED_FUNCTION_18_13(v61, (_OWORD *)(v15 + 64), v62, v63, v64, v65, v66, v67, v93, (uint64_t)v95, v97, v99, v100, *((uint64_t *)&v100 + 1), v101, v102, v105);
    if (*((_QWORD *)&a10 + 1))
    {
LABEL_14:
      OUTLINED_FUNCTION_18_13(v70, (_OWORD *)(v15 + 96), v71, v72, v73, v74, v75, v76, v93, (uint64_t)v95, v97, v99, v100, *((uint64_t *)&v100 + 1), v101, v102, a10);
      OUTLINED_FUNCTION_20_1();
      goto LABEL_17;
    }
  }
  else
  {
    v77 = OUTLINED_FUNCTION_14_20();
    v78 = OUTLINED_FUNCTION_16_17(v77);
    v70 = OUTLINED_FUNCTION_3_21((uint64_t)v78, &qword_256F90520);
    *(_QWORD *)(v15 + 88) = v70;
    *(_QWORD *)(v15 + 64) = v78;
    if (*((_QWORD *)&a10 + 1))
      goto LABEL_14;
  }
  OUTLINED_FUNCTION_14_20();
  v79 = OUTLINED_FUNCTION_20_1();
  v80 = OUTLINED_FUNCTION_22_0(v79, (const char *)0x1F34D2DC8);
  *(_QWORD *)(v15 + 120) = OUTLINED_FUNCTION_3_21((uint64_t)v80, &qword_256F90520);
  *(_QWORD *)(v15 + 96) = v80;
LABEL_17:
  v81 = _MergedGlobals_17;
  v82 = OUTLINED_FUNCTION_74_1();
  if (v81 != -1)
    v82 = swift_once();
  OUTLINED_FUNCTION_6_6(v82, &qword_256F90510);
  OUTLINED_FUNCTION_19_20();
  if (v81)
  {
    OUTLINED_FUNCTION_16_1();
    swift_bridgeObjectRelease();
  }
  else
  {
    v83 = objc_allocWithZone(MEMORY[0x24BE0CBD0]);
    v91 = OUTLINED_FUNCTION_25_12((uint64_t)v83, v84, v85, v86, v87, v88, v89, v90, v93, v95);
    OUTLINED_FUNCTION_51_7(v91, v23, v15);
  }
  OUTLINED_FUNCTION_70_5();
}

void Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex.init(name:fields:streamIdentifier:)()
{
  sub_23FE699F8();
}

id Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex.__deallocating_deinit()
{
  return sub_23FE69A40(type metadata accessor for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex);
}

void sub_23FEEBE94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25434BB00);
  v0 = OUTLINED_FUNCTION_1_0();
  *(_OWORD *)(v0 + 16) = xmmword_23FF66570;
  OUTLINED_FUNCTION_61_5();
  v1 = OUTLINED_FUNCTION_33_13();
  *(_QWORD *)(v0 + 32) = OUTLINED_FUNCTION_71_8(v1, v2, 0xD00000000000002ELL, v3);
  OUTLINED_FUNCTION_61_5();
  *(_QWORD *)(v0 + 40) = sub_23FE69C44(0x6449746E657665, 0xE700000000000000, 0x6449746E657665, 0xE700000000000000, 2);
  OUTLINED_FUNCTION_47_10();
  qword_256FADFD0 = v4;
  OUTLINED_FUNCTION_80();
}

void sub_23FEEBF44()
{
  OUTLINED_FUNCTION_16_14();
  sub_23FEEBF64();
  OUTLINED_FUNCTION_13();
}

void sub_23FEEBF64()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  OUTLINED_FUNCTION_71();
  v1 = OUTLINED_FUNCTION_78_6();
  if (qword_256F923C8 != -1)
    v1 = swift_once();
  OUTLINED_FUNCTION_6_6(v1, &qword_25434ADA0);
  v2 = (void *)OUTLINED_FUNCTION_9_15();
  v3 = (void *)OUTLINED_FUNCTION_32_4();
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_EventIDIndex();
  OUTLINED_FUNCTION_1_14((uint64_t)v10.super_class, sel_initWithName_fields_streamIdentifier_, v4, v5, v6, v7, v8, v9, v10);
  OUTLINED_FUNCTION_25_5();

  OUTLINED_FUNCTION_80();
}

id sub_23FEEC024(double a1)
{
  return sub_23FEEC780(a1);
}

id sub_23FEEC040(uint64_t a1, char a2, uint64_t a3, char a4)
{
  return sub_23FEEC8F8(a1, a2, a3, a4);
}

#error "23FEEC17C: call analysis failed (funcsize=77)"

#error "23FEEC22C: call analysis failed (funcsize=93)"

void sub_23FEEC334(uint64_t a1, char a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  id v28;
  id v29;
  id v30;
  id v31;
  __n128 *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __n128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;

  v65 = a3;
  v67 = a5;
  v69 = a7;
  HIDWORD(v73) = a4;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90518);
  v13 = OUTLINED_FUNCTION_0_24();
  v20 = v13;
  v71 = xmmword_23FF60830;
  *(_OWORD *)(v13 + 16) = xmmword_23FF60830;
  if ((a2 & 1) != 0)
  {
    v28 = OUTLINED_FUNCTION_79_5();
    v29 = OUTLINED_FUNCTION_48_11(v28);
    v21 = sub_23FE69EF4(0, &qword_256F90520);
    *(_QWORD *)(v20 + 56) = v21;
    *(_QWORD *)(v20 + 32) = v29;
  }
  else
  {
    *(_QWORD *)&v74 = a1;
    v21 = (uint64_t)OUTLINED_FUNCTION_18_13(v13, (_OWORD *)(v13 + 32), v14, v15, v16, v17, v18, v19, v63, v65, v67, v69, 2, 4, v72, v73, v74);
  }
  if (a6)
  {
    *(_QWORD *)&v75 = v67;
    *((_QWORD *)&v75 + 1) = a6;
    OUTLINED_FUNCTION_18_13(v21, (_OWORD *)(v20 + 64), v22, v23, v24, v25, v26, v27, v63, v65, v67, v69, v71, *((uint64_t *)&v71 + 1), v72, v73, v75);
  }
  else
  {
    v30 = OUTLINED_FUNCTION_28_7();
    v31 = OUTLINED_FUNCTION_69_8(v30);
    *(_QWORD *)(v20 + 88) = OUTLINED_FUNCTION_10_19((uint64_t)v31, &qword_256F90520);
    *(_QWORD *)(v20 + 64) = v31;
  }
  v32 = (__n128 *)OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_81_4(v32, v33, v34, v35, v36, v37, v38, v39, v63, v65, v67, v69, v40);
  if ((v48 & 1) != 0)
  {
    OUTLINED_FUNCTION_28_7();
    v56 = OUTLINED_FUNCTION_82_1();
    v57 = OUTLINED_FUNCTION_22_0(v56, (const char *)0x1F34D2DC8);
    v49 = OUTLINED_FUNCTION_10_19((uint64_t)v57, &qword_256F90520);
    *(_QWORD *)(v12 + 56) = v49;
    *(_QWORD *)(v12 + 32) = v57;
    if (a8)
      goto LABEL_9;
  }
  else
  {
    *(_QWORD *)&v74 = v66;
    OUTLINED_FUNCTION_18_13(v41, (_OWORD *)(v12 + 32), v42, v43, v44, v45, v46, v47, (uint64_t)v64, v66, v68, v70, v71, *((uint64_t *)&v71 + 1), v72, v73, v74);
    v49 = OUTLINED_FUNCTION_82_1();
    if (a8)
    {
LABEL_9:
      *(_QWORD *)&v76 = v70;
      *((_QWORD *)&v76 + 1) = a8;
      OUTLINED_FUNCTION_18_13(v49, (_OWORD *)(v12 + 64), v50, v51, v52, v53, v54, v55, (uint64_t)v64, v66, v68, v70, v71, *((uint64_t *)&v71 + 1), v72, v73, v76);
      goto LABEL_12;
    }
  }
  v58 = OUTLINED_FUNCTION_28_7();
  v59 = OUTLINED_FUNCTION_69_8(v58);
  *(_QWORD *)(v12 + 88) = OUTLINED_FUNCTION_10_19((uint64_t)v59, &qword_256F90520);
  *(_QWORD *)(v12 + 64) = v59;
LABEL_12:
  v60 = _MergedGlobals_17;
  v61 = OUTLINED_FUNCTION_20_1();
  if (v60 != -1)
    v61 = swift_once();
  OUTLINED_FUNCTION_6_6(v61, &qword_256F90510);
  OUTLINED_FUNCTION_19_20();
  if (v60)
  {
    OUTLINED_FUNCTION_16_1();
    swift_bridgeObjectRelease();
  }
  else
  {
    v62 = objc_allocWithZone(MEMORY[0x24BE0CBD0]);
    OUTLINED_FUNCTION_51_7(v64, v20, v12);
  }
  OUTLINED_FUNCTION_70_5();
}

void Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_EventIDIndex.init(name:fields:streamIdentifier:)()
{
  sub_23FE699F8();
}

id Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_EventIDIndex.__deallocating_deinit()
{
  return sub_23FE69A40(type metadata accessor for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_EventIDIndex);
}

void sub_23FEEC5C4()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25434BB00);
  v0 = OUTLINED_FUNCTION_1_0();
  *(_OWORD *)(v0 + 16) = xmmword_23FF66570;
  OUTLINED_FUNCTION_61_5();
  *(_QWORD *)(v0 + 32) = OUTLINED_FUNCTION_71_8(0x6D61747365746164, 0xE900000000000070, 0xD00000000000002ELL, 0x800000023FF892C0);
  OUTLINED_FUNCTION_61_5();
  *(_QWORD *)(v0 + 40) = sub_23FE69C44(0x496E6F6973736573, 0xE900000000000064, 0xD000000000000022, 0x800000023FF8DF40, 6);
  OUTLINED_FUNCTION_47_10();
  qword_256FADFD8 = v1;
  OUTLINED_FUNCTION_80();
}

void sub_23FEEC6A0()
{
  OUTLINED_FUNCTION_16_14();
  sub_23FEEC6C0();
  OUTLINED_FUNCTION_13();
}

void sub_23FEEC6C0()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  OUTLINED_FUNCTION_71();
  v1 = OUTLINED_FUNCTION_78_6();
  if (qword_256F923D0 != -1)
    v1 = swift_once();
  OUTLINED_FUNCTION_6_6(v1, &qword_25434ADA0);
  v2 = (void *)OUTLINED_FUNCTION_9_15();
  v3 = (void *)OUTLINED_FUNCTION_32_4();
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_SessionIDIndex();
  OUTLINED_FUNCTION_1_14((uint64_t)v10.super_class, sel_initWithName_fields_streamIdentifier_, v4, v5, v6, v7, v8, v9, v10);
  OUTLINED_FUNCTION_25_5();

  OUTLINED_FUNCTION_80();
}

id sub_23FEEC780(double a1)
{
  uint64_t v1;
  __n128 *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  __n128 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __n128 v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90518);
  v3 = (__n128 *)OUTLINED_FUNCTION_0_24();
  v4 = MEMORY[0x24BEE13C8];
  OUTLINED_FUNCTION_45_10(v3, (__n128)xmmword_23FF60830);
  v5 = OUTLINED_FUNCTION_6_9();
  v6 = OUTLINED_FUNCTION_4_19(v5);
  v7 = OUTLINED_FUNCTION_20_14((uint64_t)v6, &qword_256F90520);
  v3[5].n128_u64[1] = v7;
  v3[4].n128_u64[0] = (unint64_t)v6;
  v8 = (__n128 *)OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_40_13(v8, v9, v10, v11, v12, v13, v14, v15, v30, v32, v16);
  *(_QWORD *)(v17 + 56) = v4;
  *(double *)(v17 + 32) = a1;
  v18 = OUTLINED_FUNCTION_6_9();
  v19 = (uint64_t)OUTLINED_FUNCTION_4_19(v18);
  v8[5].n128_u64[1] = v7;
  v8[4].n128_u64[0] = v19;
  if (_MergedGlobals_17 != -1)
    v19 = swift_once();
  OUTLINED_FUNCTION_6_6(v19, &qword_256F90510);
  OUTLINED_FUNCTION_34_6();
  if (v1)
  {
    OUTLINED_FUNCTION_23_3();
    return (id)OUTLINED_FUNCTION_36();
  }
  else
  {
    v21 = objc_allocWithZone(MEMORY[0x24BE0CBD0]);
    v29 = OUTLINED_FUNCTION_25_12((uint64_t)v21, v22, v23, v24, v25, v26, v27, v28, v31, v33);
    return sub_23FE69CD0(v29, (uint64_t)v3, (uint64_t)v8, v34);
  }
}

id sub_23FEEC8F8(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __n128 v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  uint64_t v44;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90518);
  v9 = OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_32_5((__n128 *)v9, (__n128)xmmword_23FF60830);
  v10 = MEMORY[0x24BEE13C8];
  if ((a2 & 1) != 0)
  {
    v11 = OUTLINED_FUNCTION_13_18();
    v12 = OUTLINED_FUNCTION_8_18(v11);
    *(_QWORD *)(v9 + 56) = OUTLINED_FUNCTION_11_21((uint64_t)v12, &qword_256F90520);
    *(_QWORD *)(v9 + 32) = v12;
  }
  else
  {
    v44 = MEMORY[0x24BEE13C8];
    *(_QWORD *)&v43 = a1;
    sub_23FE69D84(&v43, (_OWORD *)(v9 + 32));
  }
  v13 = OUTLINED_FUNCTION_13_18();
  v14 = OUTLINED_FUNCTION_8_18(v13);
  v15 = OUTLINED_FUNCTION_11_21((uint64_t)v14, &qword_256F90520);
  *(_QWORD *)(v9 + 88) = v15;
  *(_QWORD *)(v9 + 64) = v14;
  v16 = OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_40_13((__n128 *)v16, v17, v18, v19, v20, v21, v22, v23, v39, v41, v24);
  if ((a4 & 1) != 0)
  {
    v25 = OUTLINED_FUNCTION_22_13();
    v26 = OUTLINED_FUNCTION_8_18(v25);
    *(_QWORD *)(v16 + 56) = v15;
    *(_QWORD *)(v16 + 32) = v26;
  }
  else
  {
    v44 = v10;
    *(_QWORD *)&v43 = a3;
    sub_23FE69D84(&v43, (_OWORD *)(v16 + 32));
  }
  v27 = OUTLINED_FUNCTION_22_13();
  v28 = (uint64_t)OUTLINED_FUNCTION_8_18(v27);
  *(_QWORD *)(v16 + 88) = v15;
  *(_QWORD *)(v16 + 64) = v28;
  if (_MergedGlobals_17 != -1)
    v28 = swift_once();
  OUTLINED_FUNCTION_6_6(v28, &qword_256F90510);
  OUTLINED_FUNCTION_19_20();
  if (v4)
  {
    OUTLINED_FUNCTION_23_3();
    return (id)OUTLINED_FUNCTION_36();
  }
  else
  {
    v30 = objc_allocWithZone(MEMORY[0x24BE0CBD0]);
    v38 = OUTLINED_FUNCTION_25_12((uint64_t)v30, v31, v32, v33, v34, v35, v36, v37, v40, v42);
    return OUTLINED_FUNCTION_19_14(v38);
  }
}

#error "23FEECB6C: call analysis failed (funcsize=79)"

void sub_23FEECC20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  void *v23;
  id v24;
  id v25[2];
  __int128 v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;

  v27 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_120_4();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v25 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90518);
  v9 = OUTLINED_FUNCTION_0_24();
  v26 = xmmword_23FF60830;
  *(_OWORD *)(v9 + 16) = xmmword_23FF60830;
  v10 = OUTLINED_FUNCTION_6_9();
  v11 = OUTLINED_FUNCTION_48_11(v10);
  v12 = OUTLINED_FUNCTION_20_14((uint64_t)v11, &qword_256F90520);
  *(_QWORD *)(v9 + 56) = v12;
  *(_QWORD *)(v9 + 32) = v11;
  sub_23FE16A70(a1, (uint64_t)v8);
  v13 = OUTLINED_FUNCTION_1_2();
  if (OUTLINED_FUNCTION_24_9((uint64_t)v8) == 1)
  {
    sub_23FE169B8((uint64_t)v8);
    v14 = OUTLINED_FUNCTION_75_6();
    v15 = OUTLINED_FUNCTION_48_11(v14);
    *(_QWORD *)(v9 + 88) = v12;
    *(_QWORD *)(v9 + 64) = v15;
  }
  else
  {
    v29 = v13;
    v16 = OUTLINED_FUNCTION_58_8();
    (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v16, v8, v13);
    OUTLINED_FUNCTION_73_7();
  }
  v17 = OUTLINED_FUNCTION_0_24();
  *(_OWORD *)(v17 + 16) = v26;
  v18 = OUTLINED_FUNCTION_75_6();
  v19 = OUTLINED_FUNCTION_48_11(v18);
  *(_QWORD *)(v17 + 56) = v12;
  *(_QWORD *)(v17 + 32) = v19;
  OUTLINED_FUNCTION_72_6();
  if (OUTLINED_FUNCTION_24_9(v2) == 1)
  {
    sub_23FE169B8(v2);
    v20 = OUTLINED_FUNCTION_75_6();
    v21 = (uint64_t)OUTLINED_FUNCTION_48_11(v20);
    *(_QWORD *)(v17 + 88) = v12;
    *(_QWORD *)(v17 + 64) = v21;
  }
  else
  {
    v29 = v13;
    v22 = OUTLINED_FUNCTION_58_8();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v22, v2, v13);
    v21 = (uint64_t)OUTLINED_FUNCTION_73_7();
  }
  if (_MergedGlobals_17 != -1)
    v21 = swift_once();
  OUTLINED_FUNCTION_6_6(v21, &qword_256F90510);
  OUTLINED_FUNCTION_19_20();
  if (v3)
  {
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_36();
  }
  else
  {
    v23 = v28;
    v24 = objc_allocWithZone(MEMORY[0x24BE0CBD0]);
    sub_23FE69CD0(v25[1], v9, v17, v23);
  }
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEECE68(uint64_t a1, char a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  id v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  int v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;

  v33 = a3;
  v36 = a6;
  v35 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_120_4();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v32 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90518);
  v15 = OUTLINED_FUNCTION_0_24();
  v16 = v15;
  v34 = xmmword_23FF60830;
  *(_OWORD *)(v15 + 16) = xmmword_23FF60830;
  if ((a2 & 1) != 0)
  {
    v17 = OUTLINED_FUNCTION_28_7();
    v18 = OUTLINED_FUNCTION_56_9(v17);
    *(_QWORD *)(v16 + 56) = OUTLINED_FUNCTION_10_19((uint64_t)v18, &qword_256F90520);
    *(_QWORD *)(v16 + 32) = v18;
  }
  else
  {
    v38 = MEMORY[0x24BEE13C8];
    *(_QWORD *)&v37 = a1;
    sub_23FE69D84(&v37, (_OWORD *)(v15 + 32));
  }
  sub_23FE16A70(a5, (uint64_t)v14);
  v19 = OUTLINED_FUNCTION_1_2();
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v19) == 1)
  {
    sub_23FE169B8((uint64_t)v14);
    v20 = OUTLINED_FUNCTION_28_7();
    v21 = OUTLINED_FUNCTION_56_9(v20);
    *(_QWORD *)(v16 + 88) = OUTLINED_FUNCTION_10_19((uint64_t)v21, &qword_256F90520);
    *(_QWORD *)(v16 + 64) = v21;
  }
  else
  {
    v38 = v19;
    v22 = OUTLINED_FUNCTION_58_8();
    (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v22, v14, v19);
    sub_23FE69D84(&v37, (_OWORD *)(v16 + 64));
  }
  v23 = OUTLINED_FUNCTION_0_24();
  v24 = v23;
  *(_OWORD *)(v23 + 16) = v34;
  if ((v35 & 1) != 0)
  {
    v25 = OUTLINED_FUNCTION_28_7();
    v26 = OUTLINED_FUNCTION_56_9(v25);
    *(_QWORD *)(v24 + 56) = OUTLINED_FUNCTION_10_19((uint64_t)v26, &qword_256F90520);
    *(_QWORD *)(v24 + 32) = v26;
  }
  else
  {
    v38 = MEMORY[0x24BEE13C8];
    *(_QWORD *)&v37 = v33;
    sub_23FE69D84(&v37, (_OWORD *)(v23 + 32));
  }
  OUTLINED_FUNCTION_72_6();
  if (__swift_getEnumTagSinglePayload(v6, 1, v19) == 1)
  {
    sub_23FE169B8(v6);
    v27 = OUTLINED_FUNCTION_28_7();
    v28 = OUTLINED_FUNCTION_56_9(v27);
    v29 = OUTLINED_FUNCTION_10_19((uint64_t)v28, &qword_256F90520);
    *(_QWORD *)(v24 + 88) = v29;
    *(_QWORD *)(v24 + 64) = v28;
  }
  else
  {
    v38 = v19;
    v30 = OUTLINED_FUNCTION_58_8();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v30, v6, v19);
    v29 = (uint64_t)sub_23FE69D84(&v37, (_OWORD *)(v24 + 64));
  }
  if (_MergedGlobals_17 != -1)
    v29 = swift_once();
  OUTLINED_FUNCTION_6_6(v29, &qword_256F90510);
  OUTLINED_FUNCTION_19_20();
  if (v7)
  {
    OUTLINED_FUNCTION_16_1();
    swift_bridgeObjectRelease();
  }
  else
  {
    v31 = objc_allocWithZone(MEMORY[0x24BE0CBD0]);
    OUTLINED_FUNCTION_51_7(v32, v16, v24);
  }
  OUTLINED_FUNCTION_9_1();
}

void Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_SessionIDIndex.init(name:fields:streamIdentifier:)()
{
  sub_23FE699F8();
}

id Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_SessionIDIndex.__deallocating_deinit()
{
  return sub_23FE69A40(type metadata accessor for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_SessionIDIndex);
}

uint64_t sub_23FEED194(uint64_t a1)
{
  return sub_23FE69B04(a1, type metadata accessor for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex, (uint64_t (*)(void))sub_23FEEB090, &qword_25434DD88);
}

uint64_t *sub_23FEED1B0()
{
  if (qword_25434DD80 != -1)
    swift_once();
  return &qword_25434DD88;
}

id static Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestID.getter()
{
  return sub_23FE69C0C(&qword_25434DD80, (id *)&qword_25434DD88);
}

uint64_t sub_23FEED208(uint64_t a1)
{
  return sub_23FE69B04(a1, type metadata accessor for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_EventIDIndex, (uint64_t (*)(void))sub_23FEEBF64, &qword_25434DD98);
}

uint64_t *sub_23FEED224()
{
  if (qword_25434DD90 != -1)
    swift_once();
  return &qword_25434DD98;
}

id static Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_EventID.getter()
{
  return sub_23FE69C0C(&qword_25434DD90, (id *)&qword_25434DD98);
}

uint64_t sub_23FEED27C(uint64_t a1)
{
  return sub_23FE69B04(a1, type metadata accessor for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_SessionIDIndex, (uint64_t (*)(void))sub_23FEEC6C0, &qword_25434DDA8);
}

uint64_t *sub_23FEED298()
{
  if (qword_25434DDA0 != -1)
    swift_once();
  return &qword_25434DDA8;
}

id static Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_SessionID.getter()
{
  return sub_23FE69C0C(&qword_25434DDA0, (id *)&qword_25434DDA8);
}

uint64_t type metadata accessor for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_EventIDIndex()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_SessionIDIndex()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes()
{
  return &type metadata for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes;
}

uint64_t method lookup function for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex.indexSearch(datestamp:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex.indexSearch(startDatestamp:endDatestamp:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_63_7();
  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & v0) + 0x60))();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex.indexSearch(clientSessionIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex.indexSearch(startClientSessionIdentifier:endClientSessionIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex.indexSearch(clientRequestIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex.indexSearch(startClientRequestIdentifier:endClientRequestIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex.indexSearch(startDatestamp:endDatestamp:startClientSessionIdentifier:endClientSessionIdentifier:startClientRequestIdentifier:endClientRequestIdentifier:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  _QWORD *v4;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v4) + 0x88))(a1, a2 & 1, a3, a4 & 1);
}

uint64_t method lookup function for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_EventIDIndex()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_EventIDIndex.indexSearch(startDatestamp:endDatestamp:startEventId:endEventId:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_63_7();
  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & v0) + 0x78))();
}

uint64_t method lookup function for Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_SessionIDIndex()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_SessionIDIndex.indexSearch(sessionId:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_SessionIDIndex.indexSearch(startSessionId:endSessionId:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_SessionIDIndex.indexSearch(startDatestamp:endDatestamp:startSessionId:endSessionId:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_63_7();
  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & v0) + 0x78))();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_EventIDIndex.indexSearch(eventId:)()
{
  return dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex.indexSearch(clientSessionIdentifier:)();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_EventIDIndex.indexSearch(startEventId:endEventId:)()
{
  return dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex.indexSearch(startClientSessionIdentifier:endClientSessionIdentifier:)();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_EventIDIndex.indexSearch(datestamp:)()
{
  return dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex.indexSearch(datestamp:)();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_SessionIDIndex.indexSearch(datestamp:)()
{
  return dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex.indexSearch(datestamp:)();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_EventIDIndex.indexSearch(startDatestamp:endDatestamp:)()
{
  return dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex.indexSearch(startDatestamp:endDatestamp:)();
}

uint64_t dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_SessionIDIndex.indexSearch(startDatestamp:endDatestamp:)()
{
  return dispatch thunk of Library.Streams.IntelligenceFlow.Transcript.Datastream.Indexes.Datestamp_ClientSessionID_ClientRequestIDIndex.indexSearch(startDatestamp:endDatestamp:)();
}

id OUTLINED_FUNCTION_11_25@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23FE1F26C(0xD00000000000001BLL, (a1 - 32) | 0x8000000000000000, 2, 1, v1, 13, 0);
}

uint64_t OUTLINED_FUNCTION_19_20()
{
  return sub_23FF59144();
}

id OUTLINED_FUNCTION_25_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  return a10;
}

uint64_t OUTLINED_FUNCTION_33_13()
{
  return 0x6D61747365746164;
}

__n128 OUTLINED_FUNCTION_40_13(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 a11)
{
  __n128 result;

  result = a11;
  a1[1] = a11;
  return result;
}

__n128 *OUTLINED_FUNCTION_45_10(__n128 *result, __n128 a2)
{
  unint64_t v2;
  unint64_t v3;

  result[1] = a2;
  result[3].n128_u64[1] = v2;
  result[2].n128_u64[0] = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_47_10()
{
  return sub_23FF5909C();
}

id OUTLINED_FUNCTION_48_11(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

id OUTLINED_FUNCTION_51_7(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  return sub_23FE69CD0(a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_52_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  *(_OWORD *)(a1 + 16) = a9;
  return sub_23FF5915C();
}

id OUTLINED_FUNCTION_56_9(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

uint64_t *OUTLINED_FUNCTION_58_8()
{
  uint64_t v0;

  return __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 - 112));
}

id OUTLINED_FUNCTION_61_5()
{
  uint64_t v0;

  return objc_allocWithZone(*(Class *)(v0 + 3016));
}

id OUTLINED_FUNCTION_69_8(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

id OUTLINED_FUNCTION_71_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23FE69C44(a1, a2, a3, a4, 1);
}

uint64_t OUTLINED_FUNCTION_72_6()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23FE16A70(*(_QWORD *)(v1 - 120), v0);
}

_OWORD *OUTLINED_FUNCTION_73_7()
{
  _OWORD *v0;
  uint64_t v1;

  return sub_23FE69D84((_OWORD *)(v1 - 112), v0);
}

id OUTLINED_FUNCTION_75_6()
{
  uint64_t v0;

  return objc_allocWithZone(*(Class *)(v0 + 3832));
}

uint64_t OUTLINED_FUNCTION_78_6()
{
  return sub_23FF58FD0();
}

id OUTLINED_FUNCTION_79_5()
{
  Class *v0;

  return objc_allocWithZone(*v0);
}

__n128 OUTLINED_FUNCTION_81_4(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __n128 a13)
{
  __n128 result;

  result = a13;
  a1[1] = a13;
  return result;
}

uint64_t OUTLINED_FUNCTION_82_7(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v1, v3);
}

id OUTLINED_FUNCTION_83_7()
{
  uint64_t v0;

  return objc_allocWithZone(*(Class *)(v0 + 3288));
}

uint64_t OUTLINED_FUNCTION_87_9()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_90_3(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = result;
  return result;
}

unint64_t static Library.Streams.IntelligenceFlow.Transcript.Datastream.identifier.getter()
{
  return 0xD000000000000026;
}

uint64_t sub_23FEED798()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23FF58C28();
  __swift_allocate_value_buffer(v3, qword_25434DDC8);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_25434DDC8);
  sub_23FF58BF8();
  result = __swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(v4, v2, v3);
  __break(1u);
  return result;
}

uint64_t static Library.Streams.IntelligenceFlow.Transcript.Datastream.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE17B08(&_MergedGlobals_18, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], (uint64_t)qword_25434DDC8, a1);
}

uint64_t sub_23FEED894(uint64_t a1)
{
  return sub_23FE17B90(a1, MEMORY[0x24BE0CA80], qword_25434DDE0, MEMORY[0x24BE0CA70]);
}

uint64_t static Library.Streams.IntelligenceFlow.Transcript.Datastream.domain.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE17B08(&qword_25434DDB8, MEMORY[0x24BE0CA80], (uint64_t)qword_25434DDE0, a1);
}

uint64_t sub_23FEED8D0(uint64_t a1)
{
  return sub_23FE17B90(a1, MEMORY[0x24BE0CA40], qword_25434DDF8, MEMORY[0x24BE0CA38]);
}

uint64_t static Library.Streams.IntelligenceFlow.Transcript.Datastream.protectionClass.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE17B08(&qword_25434DDC0, MEMORY[0x24BE0CA40], (uint64_t)qword_25434DDF8, a1);
}

id static Library.Streams.IntelligenceFlow.Transcript.Datastream.configuration.getter()
{
  id result;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C9B8]), sel_initPruneOnAccess_filterByAgeOnRead_maxAge_maxStreamSize_maxEventCount_, 0, 0, 52428800, 1000, 604800.0);
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_opt_self();
    v3 = (void *)OUTLINED_FUNCTION_0_38();
    v4 = objc_msgSend(v2, sel_newLibraryStoreConfigForStreamIdentifier_domain_segmentSize_protectionClass_pruningPolicy_, v3, 0, 0x100000, 3, v1);

    v5 = (void *)OUTLINED_FUNCTION_0_38();
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B9E0);
    v7 = objc_allocWithZone(MEMORY[0x24BE0CDA0]);
    v8 = sub_23FE1E74C(v5, v6, v4, 0, (uint64_t)&unk_251027958, 0);

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_23FEEDA14()
{
  id v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;

  v0 = static Library.Streams.IntelligenceFlow.Transcript.Datastream.configuration.getter();
  v1 = objc_msgSend(v0, sel_streamIdentifier);

  v2 = static Library.Streams.IntelligenceFlow.Transcript.Datastream.configuration.getter();
  v3 = objc_msgSend(v2, sel_streamIdentifier);

  sub_23FF58FDC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25434BB00);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23FF5FF30;
  v5 = (id)BMEventTimestampSQLColumn();
  if (v5)
  {
    *(_QWORD *)(v4 + 32) = v5;
    sub_23FF5909C();
    static IntelligenceFlowTranscriptDatastreamEvent.columns.getter();
  }
  __break(1u);
  JUMPOUT(0x23FEEDBCCLL);
}

unint64_t static Library.Streams.IntelligenceFlow.Transcript.Datastream.attribute(_:)(void (*a1)(void))
{
  uint64_t v1;
  unint64_t result;

  result = sub_23FEEDC00(a1);
  if (!v1)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_23FEEDC00(void (*a1)(void))
{
  a1();
  return 0x800000023FF8E0B0;
}

unint64_t sub_23FEEDC34(void (*a1)(void))
{
  uint64_t v1;
  unint64_t result;

  result = sub_23FEEDC00(a1);
  if (!v1)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_23FEEDC60()
{
  static Library.Streams.IntelligenceFlow.Transcript.Datastream.identifier.getter();
  return 0xD000000000000026;
}

_UNKNOWN **sub_23FEEDC88()
{
  return &protocol witness table for IntelligenceFlowTranscriptDatastreamEvent;
}

unint64_t sub_23FEEDC94(uint64_t a1)
{
  unint64_t result;

  result = sub_23FEEDCB8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23FEEDCB8()
{
  unint64_t result;

  result = qword_25434B8C8;
  if (!qword_25434B8C8)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for Library.Streams.IntelligenceFlow.Transcript.Datastream, &type metadata for Library.Streams.IntelligenceFlow.Transcript.Datastream);
    atomic_store(result, (unint64_t *)&qword_25434B8C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for Library.Streams.IntelligenceFlow.Transcript.Datastream()
{
  return &type metadata for Library.Streams.IntelligenceFlow.Transcript.Datastream;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> IntelligenceFlowTranscriptDatastreamEvent.json()()
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
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  Swift::String result;
  uint64_t v17;

  v3 = v0;
  v4 = sub_23FF58CA0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0_7();
  v6 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_13_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D50);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23FEEDE3C(v3, v2);
  sub_23FE18300(v2, v6, (uint64_t)v10);
  sub_23FF58C94();
  sub_23FEEDE80();
  v11 = sub_23FF58DC0();
  v13 = v12;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v4);
  sub_23FE1D55C((uint64_t)v10, &qword_256F91D50);
  v14 = v11;
  v15 = v13;
  result._object = v15;
  result._countAndFlagsBits = v14;
  return result;
}

uint64_t sub_23FEEDE3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IntelligenceFlowTranscriptDatastreamEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23FEEDE80()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256F91D58;
  if (!qword_256F91D58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256F91D50);
    result = MEMORY[0x24267B784](&unk_23FF5FC90, v1);
    atomic_store(result, (unint64_t *)&qword_256F91D58);
  }
  return result;
}

uint64_t static IntelligenceFlowTranscriptDatastreamEvent.event(from:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  sub_23FF58C88();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_11();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D50);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0_7();
  swift_bridgeObjectRetain();
  sub_23FF58C7C();
  sub_23FEEDE80();
  result = sub_23FF58DCC();
  if (!v1)
    return sub_23FEEDF98(v2, a1);
  return result;
}

uint64_t sub_23FEEDF98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IntelligenceFlowTranscriptDatastreamEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static IntelligenceFlowTranscriptDatastreamEvent.event(from:dataVersion:writeTimestamp:bookmark:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;

  v28 = a6;
  v29 = a5;
  v27 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D50);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_11();
  v11 = sub_23FF58CC4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v26 - v16;
  if (*(_DWORD *)sub_23FEEFBC4() == a3)
  {
    sub_23FF58CB8();
    sub_23FF58CAC();
    v32 = 0;
    v30 = 0u;
    v31 = 0u;
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    sub_23FE1B51C(a1, a2);
    sub_23FEEDE80();
    v18 = v33;
    sub_23FF58DE4();
    if (v18)
    {
      return OUTLINED_FUNCTION_15();
    }
    else
    {
      OUTLINED_FUNCTION_15();
      v21 = v28;
      sub_23FEEDF98(v6, v28);
      v22 = OUTLINED_FUNCTION_16();
      v23 = v21 + *(int *)(v22 + 20);
      sub_23FE1D55C(v23, &qword_25434B8D8);
      v24 = sub_23FF58BEC();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v23, v27, v24);
      __swift_storeEnumTagSinglePayload(v23, 0, 1, v24);
      v25 = v21 + *(int *)(v22 + 24);
      sub_23FE1D55C(v25, &qword_25434B738);
      return sub_23FE1EDB8(v29, v25);
    }
  }
  else
  {
    sub_23FE1ED7C();
    swift_allocError();
    *v20 = a3;
    return swift_willThrow();
  }
}

uint64_t IntelligenceFlowTranscriptDatastreamEvent.serialize()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D50);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_13_0();
  sub_23FEEDE3C(v0, (uint64_t)v5);
  sub_23FE18300((uint64_t)v5, v2, v1);
  sub_23FEEDE80();
  v7 = sub_23FF58DF0();
  sub_23FE1D55C(v1, &qword_256F91D50);
  return v7;
}

void static IntelligenceFlowTranscriptDatastreamEvent.columns.getter()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25434BB00);
  *(_OWORD *)(OUTLINED_FUNCTION_7_4() + 16) = xmmword_23FF5FF30;
  sub_23FE1F1D4();
  v0 = OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_4_0(v0);
  OUTLINED_FUNCTION_8_12();
  v1 = sub_23FE1F26C(0xD000000000000011, 0x800000023FF88C20, 3, 0, v3, 0, 1);
  if (v1)
  {
    v2 = v1;
    OUTLINED_FUNCTION_7_5();
  }
  __break(1u);
  JUMPOUT(0x23FEEE578);
}

uint64_t sub_23FEEE584@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return static IntelligenceFlowTranscriptDatastreamEvent.event(from:dataVersion:writeTimestamp:bookmark:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_23FEEE598()
{
  return IntelligenceFlowTranscriptDatastreamEvent.serialize()();
}

uint64_t sub_23FEEE5B0()
{
  return IntelligenceFlowTranscriptDatastreamEvent.json()()._countAndFlagsBits;
}

uint64_t sub_23FEEE5C4@<X0>(uint64_t a1@<X8>)
{
  return static IntelligenceFlowTranscriptDatastreamEvent.event(from:)(a1);
}

double IntelligenceFlowTranscriptDatastreamEvent.init()@<D0>(_DWORD *a1@<X8>)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  double result;

  v2 = (int *)OUTLINED_FUNCTION_16();
  v3 = (uint64_t)a1 + v2[5];
  sub_23FE415E0();
  v4 = (uint64_t)a1 + v2[6];
  sub_23FE20830(v4);
  v5 = (uint64_t)a1 + v2[7];
  sub_23FE615FC();
  v6 = (uint64_t)a1 + v2[8];
  sub_23FE5F7B0();
  *a1 = *(_DWORD *)sub_23FEEFBC4();
  OUTLINED_FUNCTION_56_4(v3);
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_3_18(v3);
  sub_23FE24D20(v4, &qword_25434B738);
  *(_OWORD *)v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  *(_QWORD *)(v4 + 32) = 0;
  OUTLINED_FUNCTION_56_4(v5);
  OUTLINED_FUNCTION_3_18(v5);
  sub_23FE24D20(v6, &qword_256F8F630);
  v7 = OUTLINED_FUNCTION_3_14();
  __swift_storeEnumTagSinglePayload(v6, 1, 1, v7);
  IntelligenceFlowIdentifiers.init()((uint64_t)a1 + v2[9]);
  v8 = (_QWORD *)((char *)a1 + v2[10]);
  *v8 = 0;
  v8[1] = 0xE000000000000000;
  v9 = (_QWORD *)((char *)a1 + v2[11]);
  *v9 = 0;
  v9[1] = 0xE000000000000000;
  result = 0.0;
  *(_OWORD *)((char *)a1 + v2[12]) = xmmword_23FF60230;
  return result;
}

uint64_t static IntelligenceFlowTranscriptDatastreamEvent.== infix(_:_:)(uint64_t a1, uint64_t a2)
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  uint64_t *v39;
  uint64_t v40;
  char v41;
  void (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  int *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  char v70;
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
  int *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  v83 = a1;
  v84 = a2;
  v75 = type metadata accessor for IntelligenceFlowIdentifiers();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_24_0();
  v74 = v4;
  MEMORY[0x24BDAC7A8](v5);
  v73 = (uint64_t)&v71 - v6;
  v80 = OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_35();
  v72 = v8;
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90410);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_35();
  v82 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_24_0();
  v76 = v12;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v78 = (uint64_t)&v71 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v79 = (uint64_t)&v71 - v16;
  v17 = OUTLINED_FUNCTION_46();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_24();
  v21 = v20 - v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90420);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_14_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
  OUTLINED_FUNCTION_9_0();
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v71 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)&v71 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v71 - v31;
  v33 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_10_26(v83 + *(int *)(v33 + 28), (uint64_t)v32);
  v81 = (int *)v33;
  OUTLINED_FUNCTION_10_26(v84 + *(int *)(v33 + 28), (uint64_t)v30);
  v34 = v2 + *(int *)(v22 + 48);
  OUTLINED_FUNCTION_10_26((uint64_t)v32, v2);
  OUTLINED_FUNCTION_10_26((uint64_t)v30, v34);
  OUTLINED_FUNCTION_68(v2, 1, v17);
  if (v36)
  {
    OUTLINED_FUNCTION_7_17((uint64_t)v30);
    OUTLINED_FUNCTION_7_17((uint64_t)v32);
    v35 = OUTLINED_FUNCTION_68(v34, 1, v17);
    if (v36)
    {
      OUTLINED_FUNCTION_15_17(v35, &qword_25434B8D8);
      goto LABEL_11;
    }
LABEL_9:
    v39 = &qword_256F90420;
LABEL_20:
    OUTLINED_FUNCTION_15_17(v35, v39);
LABEL_21:
    v54 = 0;
    return v54 & 1;
  }
  sub_23FEEED2C(v2, (uint64_t)v27, &qword_25434B8D8);
  OUTLINED_FUNCTION_68(v34, 1, v17);
  if (v36)
  {
    sub_23FE24D20((uint64_t)v30, &qword_25434B8D8);
    sub_23FE24D20((uint64_t)v32, &qword_25434B8D8);
    v37 = OUTLINED_FUNCTION_13_9();
    v35 = v38(v37);
    goto LABEL_9;
  }
  v40 = v21;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v21, v34, v17);
  sub_23FE23908(&qword_256F90430, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
  v41 = sub_23FF58FB8();
  v42 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  v42(v40, v17);
  OUTLINED_FUNCTION_56_4((uint64_t)v30);
  OUTLINED_FUNCTION_56_4((uint64_t)v32);
  v43 = OUTLINED_FUNCTION_13_9();
  ((void (*)(uint64_t))v42)(v43);
  OUTLINED_FUNCTION_56_4(v2);
  if ((v41 & 1) == 0)
    goto LABEL_21;
LABEL_11:
  v44 = v81;
  v45 = v83;
  v46 = v79;
  OUTLINED_FUNCTION_7_26(v83 + v81[8], v79);
  v47 = v84;
  v48 = v78;
  OUTLINED_FUNCTION_7_26(v84 + v44[8], v78);
  v49 = v82;
  v50 = v82 + *(int *)(v77 + 48);
  OUTLINED_FUNCTION_7_26(v46, v82);
  OUTLINED_FUNCTION_7_26(v48, v50);
  v51 = v80;
  OUTLINED_FUNCTION_68(v49, 1, v80);
  if (v36)
  {
    sub_23FE24D20(v48, &qword_256F8F630);
    sub_23FE24D20(v46, &qword_256F8F630);
    v35 = OUTLINED_FUNCTION_68(v50, 1, v51);
    if (v36)
    {
      OUTLINED_FUNCTION_15_17(v35, &qword_256F8F630);
      goto LABEL_24;
    }
    goto LABEL_19;
  }
  v52 = v76;
  sub_23FEEED2C(v49, v76, &qword_256F8F630);
  OUTLINED_FUNCTION_68(v50, 1, v51);
  if (v53)
  {
    OUTLINED_FUNCTION_7_17(v48);
    OUTLINED_FUNCTION_7_17(v46);
    sub_23FE251BC(v52, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
LABEL_19:
    v39 = &qword_256F90410;
    goto LABEL_20;
  }
  v56 = v50;
  v57 = v48;
  v58 = v72;
  sub_23FEEF050(v56, v72);
  sub_23FE23908(&qword_256F8F5E8, (uint64_t (*)(uint64_t))type metadata accessor for MonotonicTimestamp, (uint64_t)&protocol conformance descriptor for MonotonicTimestamp);
  v59 = sub_23FF58FB8();
  sub_23FE251BC(v58, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
  OUTLINED_FUNCTION_35_8(v57);
  OUTLINED_FUNCTION_35_8(v46);
  sub_23FE251BC(v52, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
  OUTLINED_FUNCTION_35_8(v49);
  if ((v59 & 1) == 0)
    goto LABEL_21;
LABEL_24:
  v60 = v73;
  sub_23FEEED68(v45 + v44[9], v73);
  v61 = v74;
  sub_23FEEED68(v47 + v44[9], v74);
  sub_23FE23908((unint64_t *)&qword_256F903E0, (uint64_t (*)(uint64_t))type metadata accessor for IntelligenceFlowIdentifiers, (uint64_t)&protocol conformance descriptor for IntelligenceFlowIdentifiers);
  v62 = sub_23FF58FB8();
  sub_23FE251BC(v61, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceFlowIdentifiers);
  sub_23FE251BC(v60, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceFlowIdentifiers);
  if ((v62 & 1) == 0)
    goto LABEL_21;
  OUTLINED_FUNCTION_5_26(v44[10]);
  if (v36)
    v65 = v63 == v64;
  else
    v65 = 0;
  if (v65 || (v66 = sub_23FF59270(), v54 = 0, (v66 & 1) != 0))
  {
    OUTLINED_FUNCTION_5_26(v44[11]);
    if (v36)
      v69 = v67 == v68;
    else
      v69 = 0;
    if (v69 || (v70 = sub_23FF59270(), v54 = 0, (v70 & 1) != 0))
      v54 = MEMORY[0x24267A9C8](*(_QWORD *)(v45 + v44[12]), *(_QWORD *)(v45 + v44[12] + 8), *(_QWORD *)(v47 + v44[12]), *(_QWORD *)(v47 + v44[12] + 8));
  }
  return v54 & 1;
}

void sub_23FEEED2C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v3 = OUTLINED_FUNCTION_13_9();
  v4(v3);
  OUTLINED_FUNCTION_13();
}

uint64_t sub_23FEEED68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IntelligenceFlowIdentifiers();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t IntelligenceFlowTranscriptDatastreamEvent.hash(into:)()
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  char v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;

  v2 = v0;
  v23 = OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_14_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_24();
  v7 = v6 - v5;
  v8 = OUTLINED_FUNCTION_46();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_24();
  v12 = v11 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_24();
  v16 = v15 - v14;
  v17 = (int *)OUTLINED_FUNCTION_16();
  sub_23FEEED2C(v2 + v17[7], v16, &qword_25434B8D8);
  OUTLINED_FUNCTION_68(v16, 1, v8);
  if (v18)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v12, v16, v8);
    OUTLINED_FUNCTION_5_0();
    sub_23FE23908(&qword_256F90438, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_23FF58FAC();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);
  }
  sub_23FEEED2C(v2 + v17[8], v7, &qword_256F8F630);
  OUTLINED_FUNCTION_68(v7, 1, v23);
  if (v18)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_23FEEF050(v7, v1);
    OUTLINED_FUNCTION_5_0();
    sub_23FE23908(&qword_256F8F860, (uint64_t (*)(uint64_t))type metadata accessor for MonotonicTimestamp, (uint64_t)&protocol conformance descriptor for MonotonicTimestamp);
    sub_23FF58FAC();
    sub_23FE251BC(v1, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
  }
  type metadata accessor for IntelligenceFlowIdentifiers();
  sub_23FE23908(&qword_256F90450, (uint64_t (*)(uint64_t))type metadata accessor for IntelligenceFlowIdentifiers, (uint64_t)&protocol conformance descriptor for IntelligenceFlowIdentifiers);
  sub_23FF58FAC();
  OUTLINED_FUNCTION_14_24();
  OUTLINED_FUNCTION_12_21();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14_24();
  OUTLINED_FUNCTION_12_21();
  swift_bridgeObjectRelease();
  v19 = (uint64_t *)(v2 + v17[12]);
  v20 = *v19;
  v21 = v19[1];
  sub_23FE1B51C(*v19, v21);
  OUTLINED_FUNCTION_13_9();
  sub_23FF58B68();
  return sub_23FE14A74(v20, v21);
}

uint64_t sub_23FEEF050(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MonotonicTimestamp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void OUTLINED_FUNCTION_10_26(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23FEEED2C(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_12_21()
{
  return sub_23FF59048();
}

uint64_t OUTLINED_FUNCTION_14_24()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_15_17(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_23FE24D20(v2, a2);
}

uint64_t sub_23FEEF0C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;

  v0 = OUTLINED_FUNCTION_9_7();
  __swift_allocate_value_buffer(v0, qword_256FAF8A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_256FAF8A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_23FF61530;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "absoluteTimestamp";
  *(_QWORD *)(v7 + 8) = 17;
  *(_BYTE *)(v7 + 16) = 2;
  sub_23FF58ED4();
  OUTLINED_FUNCTION_13_11(v7);
  v8 = OUTLINED_FUNCTION_53_0(v6 + v3);
  *v9 = 2;
  OUTLINED_FUNCTION_10_0(v8, (uint64_t)"monotonicTimestamp");
  v10 = OUTLINED_FUNCTION_53_0(v6 + 2 * v3);
  *v11 = 3;
  OUTLINED_FUNCTION_10_0(v10, (uint64_t)"identifiers");
  v12 = OUTLINED_FUNCTION_53_0(v6 + 3 * v3);
  *v13 = 4;
  OUTLINED_FUNCTION_10_0(v12, (uint64_t)"eventId");
  v14 = OUTLINED_FUNCTION_53_0(v6 + 4 * v3);
  *v15 = 5;
  OUTLINED_FUNCTION_10_0(v14, (uint64_t)"eventType");
  v16 = OUTLINED_FUNCTION_53_0(v6 + 5 * v3);
  *v17 = 6;
  *(_QWORD *)v16 = "data";
  *(_QWORD *)(v16 + 8) = 4;
  *(_BYTE *)(v16 + 16) = 2;
  OUTLINED_FUNCTION_13_11(v16);
  return sub_23FF58EE0();
}

uint64_t sub_23FEEF284()
{
  uint64_t v0;

  if (qword_256FAAE08 != -1)
    swift_once();
  v0 = OUTLINED_FUNCTION_9_7();
  return __swift_project_value_buffer(v0, (uint64_t)qword_256FAF8A0);
}

void sub_23FEEF2C8()
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
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  char *v28;

  OUTLINED_FUNCTION_20();
  v2 = v0;
  v3 = type metadata accessor for IntelligenceFlowIdentifiers();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_24();
  v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90400);
  OUTLINED_FUNCTION_9_0();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - v12;
  v14 = OUTLINED_FUNCTION_14_25();
  v16 = v1;
  if (!v1)
  {
    v24 = xmmword_23FF5FF40;
    v25 = v7;
    v26 = v3;
    v28 = v11;
    v22 = v13;
    v23 = v0;
    while ((v15 & 1) == 0)
    {
      switch(v14)
      {
        case 1:
          OUTLINED_FUNCTION_16();
          v1 = v16;
          sub_23FE1BFDC();
          break;
        case 2:
          OUTLINED_FUNCTION_16();
          type metadata accessor for MonotonicTimestamp();
          v1 = v16;
          sub_23FE1C4DC();
          goto LABEL_32;
        case 3:
          __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v3);
          v1 = v16;
          sub_23FE1C4DC();
          sub_23FE5D46C((uint64_t)v13, (uint64_t)v11, &qword_256F90400);
          if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v3) == 1)
          {
            IntelligenceFlowIdentifiers.init()(v7);
            OUTLINED_FUNCTION_19_21();
            sub_23FE24D20((uint64_t)v11, &qword_256F90400);
          }
          else
          {
            OUTLINED_FUNCTION_19_21();
            sub_23FE5D4A4((uint64_t)v11, v7, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceFlowIdentifiers);
          }
          v21 = OUTLINED_FUNCTION_16();
          v2 = v23;
          sub_23FEEF5F8(v7, v23 + *(int *)(v21 + 36));
          v13 = v22;
          break;
        case 4:
          OUTLINED_FUNCTION_7_27();
          if (*((_QWORD *)&v27 + 1))
            v17 = v27;
          else
            v17 = 0;
          if (*((_QWORD *)&v27 + 1))
            v18 = *((_QWORD *)&v27 + 1);
          else
            v18 = 0xE000000000000000;
          OUTLINED_FUNCTION_16();
          OUTLINED_FUNCTION_21_19();
          *(_QWORD *)v7 = v17;
          *(_QWORD *)(v7 + 8) = v18;
          v11 = v28;
          v7 = v25;
          v3 = v26;
          break;
        case 5:
          OUTLINED_FUNCTION_7_27();
          if (*((_QWORD *)&v27 + 1))
            v19 = v27;
          else
            v19 = 0;
          if (*((_QWORD *)&v27 + 1))
            v20 = *((_QWORD *)&v27 + 1);
          else
            v20 = 0xE000000000000000;
          OUTLINED_FUNCTION_16();
          OUTLINED_FUNCTION_21_19();
          goto LABEL_31;
        case 6:
          v27 = v24;
          v1 = v16;
          sub_23FF58D18();
          if (*((_QWORD *)&v27 + 1) >> 60 == 15)
            v19 = 0;
          else
            v19 = v27;
          if (*((_QWORD *)&v27 + 1) >> 60 == 15)
            v20 = 0xC000000000000000;
          else
            v20 = *((_QWORD *)&v27 + 1);
          v7 = v2 + *(int *)(OUTLINED_FUNCTION_16() + 48);
          sub_23FE14A74(*(_QWORD *)v7, *(_QWORD *)(v7 + 8));
LABEL_31:
          *(_QWORD *)v7 = v19;
          *(_QWORD *)(v7 + 8) = v20;
          v7 = v25;
          v3 = v26;
LABEL_32:
          v11 = v28;
          break;
        default:
          break;
      }
      v14 = OUTLINED_FUNCTION_14_25();
      v16 = v1;
    }
  }
  OUTLINED_FUNCTION_9_1();
}

uint64_t sub_23FEEF5F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IntelligenceFlowIdentifiers();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

#error "23FEEF670: call analysis failed (funcsize=76)"

void sub_23FEEF76C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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

  OUTLINED_FUNCTION_20();
  a19 = v20;
  a20 = v21;
  a10 = v22;
  v24 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_24();
  v28 = v27 - v26;
  v29 = sub_23FF58BEC();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&a9 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = OUTLINED_FUNCTION_16();
  sub_23FE5D46C(v24 + *(int *)(v33 + 28), v28, &qword_25434B8D8);
  if (__swift_getEnumTagSinglePayload(v28, 1, v29) == 1)
  {
    sub_23FE24D20(v28, &qword_25434B8D8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(v32, v28, v29);
    sub_23FE1CDB4((uint64_t)v32, 1, 26211, 0xE200000000000000);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v29);
  }
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEEF894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  OUTLINED_FUNCTION_20();
  a19 = v20;
  a20 = v21;
  v23 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&a9 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for MonotonicTimestamp();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_24();
  v31 = v30 - v29;
  v32 = OUTLINED_FUNCTION_16();
  sub_23FE5D46C(v23 + *(int *)(v32 + 32), (uint64_t)v26, &qword_256F8F630);
  if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27) == 1)
  {
    sub_23FE24D20((uint64_t)v26, &qword_256F8F630);
  }
  else
  {
    sub_23FE5D4A4((uint64_t)v26, v31, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
    sub_23FE1D118();
    sub_23FE251BC(v31, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
  }
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEEF9B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  char *v30;
  uint64_t v31;
  char v32;

  OUTLINED_FUNCTION_20();
  a19 = v20;
  a20 = v21;
  a10 = v22;
  v24 = v23;
  type metadata accessor for IntelligenceFlowIdentifiers();
  OUTLINED_FUNCTION_9_0();
  v26 = MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&a9 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&a9 - v29;
  v31 = OUTLINED_FUNCTION_16();
  sub_23FEEED68(v24 + *(int *)(v31 + 36), (uint64_t)v30);
  IntelligenceFlowIdentifiers.init()((uint64_t)v28);
  sub_23FEEFB5C();
  v32 = sub_23FF58FB8();
  sub_23FE251BC((uint64_t)v28, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceFlowIdentifiers);
  sub_23FE251BC((uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceFlowIdentifiers);
  if ((v32 & 1) == 0)
    sub_23FE1D118();
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEEFAC8()
{
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_14_10();
  OUTLINED_FUNCTION_13_8();
}

uint64_t sub_23FEEFAF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_23FEEF284();
  v3 = OUTLINED_FUNCTION_9_7();
  return OUTLINED_FUNCTION_5_2(a1, v2, v3, *(uint64_t (**)(void))(*(_QWORD *)(v3 - 8) + 16));
}

void sub_23FEEFB34()
{
  sub_23FEEF2C8();
}

uint64_t sub_23FEEFB48()
{
  return sub_23FEEF63C();
}

unint64_t sub_23FEEFB5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256F903E0;
  if (!qword_256F903E0)
  {
    v1 = type metadata accessor for IntelligenceFlowIdentifiers();
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowIdentifiers, v1);
    atomic_store(result, (unint64_t *)&qword_256F903E0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_14_25()
{
  return sub_23FF58CDC();
}

void OUTLINED_FUNCTION_19_21()
{
  uint64_t *v0;
  uint64_t v1;

  sub_23FE24D20(v1, v0);
}

uint64_t OUTLINED_FUNCTION_21_19()
{
  return swift_bridgeObjectRelease();
}

void *sub_23FEEFBC4()
{
  return &unk_23FF6F660;
}

void IntelligenceFlowTranscriptDatastreamEvent.writeTimestamp.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_209_0(v0 + *(int *)(v1 + 20), v2, &qword_25434B8D8);
  OUTLINED_FUNCTION_13();
}

uint64_t type metadata accessor for IntelligenceFlowTranscriptDatastreamEvent()
{
  uint64_t result;

  result = qword_25434E810;
  if (!qword_25434E810)
    return swift_getSingletonMetadata();
  return result;
}

void IntelligenceFlowTranscriptDatastreamEvent.writeTimestamp.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_212_0(v1, v0 + *(int *)(v1 + 20), &qword_25434B8D8);
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowTranscriptDatastreamEvent.writeTimestamp.modify())()
{
  OUTLINED_FUNCTION_16();
  return nullsub_1;
}

void IntelligenceFlowTranscriptDatastreamEvent.bookmark.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_209_0(v0 + *(int *)(v1 + 24), v2, &qword_25434B738);
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowTranscriptDatastreamEvent.bookmark.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_212_0(v1, v0 + *(int *)(v1 + 24), &qword_25434B738);
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowTranscriptDatastreamEvent.bookmark.modify())()
{
  OUTLINED_FUNCTION_16();
  return nullsub_1;
}

void IntelligenceFlowTranscriptDatastreamEvent.absoluteTimestamp.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_209_0(v0 + *(int *)(v1 + 28), v2, &qword_25434B8D8);
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowTranscriptDatastreamEvent.absoluteTimestamp.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_212_0(v1, v0 + *(int *)(v1 + 28), &qword_25434B8D8);
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowTranscriptDatastreamEvent.absoluteTimestamp.modify())()
{
  OUTLINED_FUNCTION_16();
  return nullsub_1;
}

void IntelligenceFlowTranscriptDatastreamEvent.monotonicTimestamp.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_209_0(v0 + *(int *)(v1 + 32), v2, &qword_256F8F630);
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowTranscriptDatastreamEvent.monotonicTimestamp.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_212_0(v1, v0 + *(int *)(v1 + 32), &qword_256F8F630);
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowTranscriptDatastreamEvent.monotonicTimestamp.modify())()
{
  OUTLINED_FUNCTION_16();
  return nullsub_1;
}

uint64_t IntelligenceFlowTranscriptDatastreamEvent.identifiers.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_16() + 36);
  return sub_23FEEED68(v3, a1);
}

uint64_t IntelligenceFlowTranscriptDatastreamEvent.identifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_16() + 36);
  return sub_23FEEF5F8(a1, v3);
}

uint64_t (*IntelligenceFlowTranscriptDatastreamEvent.identifiers.modify())()
{
  OUTLINED_FUNCTION_16();
  return nullsub_1;
}

void IntelligenceFlowTranscriptDatastreamEvent.eventId.getter()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowTranscriptDatastreamEvent.eventId.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_19();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowTranscriptDatastreamEvent.eventId.modify())()
{
  OUTLINED_FUNCTION_16();
  return nullsub_1;
}

void IntelligenceFlowTranscriptDatastreamEvent.eventType.getter()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowTranscriptDatastreamEvent.eventType.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_19();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowTranscriptDatastreamEvent.eventType.modify())()
{
  OUTLINED_FUNCTION_16();
  return nullsub_1;
}

void IntelligenceFlowTranscriptDatastreamEvent.data.getter()
{
  uint64_t v0;
  unint64_t v1;

  OUTLINED_FUNCTION_16();
  v0 = OUTLINED_FUNCTION_13_9();
  sub_23FE1B51C(v0, v1);
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowTranscriptDatastreamEvent.data.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = v2 + *(int *)(OUTLINED_FUNCTION_16() + 48);
  sub_23FE14A74(*(_QWORD *)v5, *(_QWORD *)(v5 + 8));
  *(_QWORD *)v5 = a1;
  *(_QWORD *)(v5 + 8) = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowTranscriptDatastreamEvent.data.modify())()
{
  OUTLINED_FUNCTION_16();
  return nullsub_1;
}

void IntelligenceFlowTranscriptDatastreamEvent.hashValue.getter()
{
  sub_23FF592AC();
  IntelligenceFlowTranscriptDatastreamEvent.hash(into:)();
  sub_23FF592E8();
  OUTLINED_FUNCTION_5_3();
}

void sub_23FEF004C()
{
  sub_23FF592AC();
  IntelligenceFlowTranscriptDatastreamEvent.hash(into:)();
  sub_23FF592E8();
  OUTLINED_FUNCTION_5_3();
}

unint64_t sub_23FEF0080()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256F91D70;
  if (!qword_256F91D70)
  {
    v1 = type metadata accessor for IntelligenceFlowTranscriptDatastreamEvent();
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowTranscriptDatastreamEvent, v1);
    atomic_store(result, (unint64_t *)&qword_256F91D70);
  }
  return result;
}

void initializeBufferWithCopyOfBuffer for IntelligenceFlowTranscriptDatastreamEvent()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
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
  int *v15;
  uint64_t v16;

  OUTLINED_FUNCTION_31_3();
  v3 = v1;
  v4 = v0;
  if ((*(_DWORD *)(*(_QWORD *)(v2 - 8) + 80) & 0x20000) != 0)
  {
    *v0 = *v1;
    swift_retain();
  }
  else
  {
    v5 = v2;
    *(_DWORD *)v0 = *(_DWORD *)v1;
    v6 = OUTLINED_FUNCTION_46();
    if (OUTLINED_FUNCTION_4_2())
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
      OUTLINED_FUNCTION_11_0(v7);
    }
    else
    {
      OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16));
      OUTLINED_FUNCTION_2();
    }
    v8 = OUTLINED_FUNCTION_29_1();
    if (v10)
      OUTLINED_FUNCTION_18_4(v8, v9, v10);
    else
      OUTLINED_FUNCTION_28_4(v8, v9);
    if (OUTLINED_FUNCTION_4_2())
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
      OUTLINED_FUNCTION_11_0(v11);
    }
    else
    {
      OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16));
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_37_11();
    if (OUTLINED_FUNCTION_7_8())
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
      OUTLINED_FUNCTION_5_12(v12);
    }
    else
    {
      v13 = OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_134_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16));
      OUTLINED_FUNCTION_55_3();
      OUTLINED_FUNCTION_4_6();
    }
    v14 = (_QWORD *)((char *)v4 + *(int *)(v5 + 36));
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_20_17();
    v15 = (int *)OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_5_27(v15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (OUTLINED_FUNCTION_4_2())
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_11_0(v16);
    }
    else
    {
      OUTLINED_FUNCTION_20_17();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_16_22();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_35_17();
    *v14 = v3;
    v14[1] = v5;
  }
  OUTLINED_FUNCTION_7();
}

uint64_t destroy for IntelligenceFlowTranscriptDatastreamEvent(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_46();
  if (!OUTLINED_FUNCTION_15_13())
    OUTLINED_FUNCTION_55_1();
  v4 = a1 + a2[6];
  if (*(_QWORD *)(v4 + 24))
    __swift_destroy_boxed_opaque_existential_1(v4);
  if (!OUTLINED_FUNCTION_15_13())
    OUTLINED_FUNCTION_55_1();
  v5 = a1 + a2[8];
  type metadata accessor for MonotonicTimestamp();
  if (!OUTLINED_FUNCTION_8_0(v5))
  {
    v6 = OUTLINED_FUNCTION_1_2();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
    swift_release();
  }
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_53_6();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_25_13();
  OUTLINED_FUNCTION_25_13();
  OUTLINED_FUNCTION_25_13();
  OUTLINED_FUNCTION_25_13();
  if (!OUTLINED_FUNCTION_15_13())
    OUTLINED_FUNCTION_53_6();
  OUTLINED_FUNCTION_26_3();
  OUTLINED_FUNCTION_26_3();
  return sub_23FE14A74(*(_QWORD *)(a1 + a2[12]), *(_QWORD *)(a1 + a2[12] + 8));
}

void initializeWithCopy for IntelligenceFlowTranscriptDatastreamEvent()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _DWORD *v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int *v14;
  uint64_t v15;

  OUTLINED_FUNCTION_31_3();
  v5 = OUTLINED_FUNCTION_11_1(v3, v4);
  if (OUTLINED_FUNCTION_4_2())
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v6);
  }
  else
  {
    OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16));
    OUTLINED_FUNCTION_2();
  }
  v7 = OUTLINED_FUNCTION_29_1();
  if (v9)
    OUTLINED_FUNCTION_18_4(v7, v8, v9);
  else
    OUTLINED_FUNCTION_28_4(v7, v8);
  if (OUTLINED_FUNCTION_4_2())
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v10);
  }
  else
  {
    OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16));
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_37_11();
  if (OUTLINED_FUNCTION_7_8())
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
    OUTLINED_FUNCTION_5_12(v11);
  }
  else
  {
    v12 = OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_134_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16));
    OUTLINED_FUNCTION_55_3();
    OUTLINED_FUNCTION_4_6();
  }
  v13 = (_QWORD *)(v0 + *(int *)(v2 + 36));
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_20_17();
  v14 = (int *)OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_5_27(v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (OUTLINED_FUNCTION_4_2())
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_11_0(v15);
  }
  else
  {
    OUTLINED_FUNCTION_20_17();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_16_22();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_35_17();
  *v13 = v1;
  v13[1] = v2;
  OUTLINED_FUNCTION_7();
}

void assignWithCopy for IntelligenceFlowTranscriptDatastreamEvent()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  __int128 *v4;
  _DWORD *v5;
  _DWORD *v6;
  uint64_t v7;
  int EnumTagSinglePayload;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;

  OUTLINED_FUNCTION_31_3();
  v7 = OUTLINED_FUNCTION_11_1(v5, v6);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v3, 1, v7);
  v9 = OUTLINED_FUNCTION_4_2();
  if (EnumTagSinglePayload)
  {
    if (!v9)
    {
      OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16));
      OUTLINED_FUNCTION_2();
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v10 = *(_QWORD *)(v7 - 8);
  if (v9)
  {
    OUTLINED_FUNCTION_12_2(v10);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v11);
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 24));
LABEL_7:
  OUTLINED_FUNCTION_71_1();
  v12 = *((_QWORD *)v4 + 3);
  if (v13)
  {
    if (v12)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)v3, (uint64_t *)v4);
      goto LABEL_14;
    }
    __swift_destroy_boxed_opaque_existential_1(v3);
  }
  else if (v12)
  {
    *(_QWORD *)(v3 + 24) = v12;
    *(_QWORD *)(v3 + 32) = *((_QWORD *)v4 + 4);
    (**(void (***)(uint64_t, __int128 *))(v12 - 8))(v3, v4);
    goto LABEL_14;
  }
  v14 = *v4;
  v15 = v4[1];
  *(_QWORD *)(v3 + 32) = *((_QWORD *)v4 + 4);
  *(_OWORD *)v3 = v14;
  *(_OWORD *)(v3 + 16) = v15;
LABEL_14:
  v16 = v0 + v2[7];
  v17 = __swift_getEnumTagSinglePayload(v16, 1, v7);
  v18 = OUTLINED_FUNCTION_4_2();
  if (v17)
  {
    if (!v18)
    {
      OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16));
      OUTLINED_FUNCTION_2();
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v19 = *(_QWORD *)(v7 - 8);
  if (v18)
  {
    OUTLINED_FUNCTION_12_2(v19);
LABEL_19:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v20);
    goto LABEL_20;
  }
  OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 24));
LABEL_20:
  v21 = OUTLINED_FUNCTION_37_11();
  v22 = (int *)__swift_getEnumTagSinglePayload(v7, 1, v21);
  v23 = OUTLINED_FUNCTION_7_8();
  if ((_DWORD)v22)
  {
    if (!v23)
    {
      v24 = OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_134_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16));
      OUTLINED_FUNCTION_55_3();
      OUTLINED_FUNCTION_4_6();
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v23)
  {
    sub_23FEF07EC(v7);
LABEL_25:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
    OUTLINED_FUNCTION_5_12(v25);
    goto LABEL_26;
  }
  v48 = OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_134_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 24));
  *(_QWORD *)(v7 + *(int *)(v21 + 20)) = *(_QWORD *)(v16 + *(int *)(v21 + 20));
  swift_retain();
  swift_release();
LABEL_26:
  v26 = v2[9];
  v27 = v0 + v26;
  v28 = v1 + v26;
  v29 = OUTLINED_FUNCTION_1_2();
  v30 = *(_QWORD *)(v29 - 8);
  OUTLINED_FUNCTION_45_11();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_50_5();
  v32 = *(_BYTE *)(v31 + 8);
  *(_QWORD *)v33 = *(_QWORD *)v31;
  *(_BYTE *)(v33 + 8) = v32;
  OUTLINED_FUNCTION_9_24(*(int *)(v34 + 24));
  OUTLINED_FUNCTION_91_6();
  OUTLINED_FUNCTION_9_24(v22[7]);
  OUTLINED_FUNCTION_91_6();
  OUTLINED_FUNCTION_9_24(v22[8]);
  OUTLINED_FUNCTION_91_6();
  OUTLINED_FUNCTION_9_24(v22[9]);
  OUTLINED_FUNCTION_91_6();
  v35 = v22[10];
  v36 = v27 + v35;
  v37 = v28 + v35;
  v38 = __swift_getEnumTagSinglePayload(v36, 1, v29);
  v39 = OUTLINED_FUNCTION_8_0(v37);
  if (!v38)
  {
    if (!v39)
    {
      OUTLINED_FUNCTION_45_11();
      goto LABEL_32;
    }
    OUTLINED_FUNCTION_58_9(*(uint64_t (**)(uint64_t, uint64_t))(v30 + 8));
    goto LABEL_31;
  }
  if (v39)
  {
LABEL_31:
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_21_9(v40);
    goto LABEL_32;
  }
  OUTLINED_FUNCTION_44_9(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 16));
  OUTLINED_FUNCTION_3_16(v36);
LABEL_32:
  OUTLINED_FUNCTION_6_0(v2[10]);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0(v2[11]);
  swift_bridgeObjectRelease();
  v41 = v2[12];
  v42 = (uint64_t *)(v0 + v41);
  v43 = (uint64_t *)(v1 + v41);
  v44 = *v43;
  v45 = v43[1];
  OUTLINED_FUNCTION_35_17();
  v46 = *v42;
  v47 = v42[1];
  *v42 = v44;
  v42[1] = v45;
  sub_23FE14A74(v46, v47);
  OUTLINED_FUNCTION_7();
}

uint64_t sub_23FEF07EC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MonotonicTimestamp();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for IntelligenceFlowTranscriptDatastreamEvent(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
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

  v5 = OUTLINED_FUNCTION_11_1(a1, a2);
  if (OUTLINED_FUNCTION_4_2())
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v6);
  }
  else
  {
    OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32));
    OUTLINED_FUNCTION_2();
  }
  v7 = v4[6];
  v8 = v4[7];
  v9 = v2 + v7;
  v10 = v3 + v7;
  v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(_QWORD *)(v9 + 32) = *(_QWORD *)(v10 + 32);
  v12 = v2 + v8;
  if (OUTLINED_FUNCTION_4_2())
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v13);
  }
  else
  {
    OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32));
    OUTLINED_FUNCTION_2();
  }
  v14 = OUTLINED_FUNCTION_37_11();
  if (OUTLINED_FUNCTION_7_8())
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
    OUTLINED_FUNCTION_5_12(v15);
  }
  else
  {
    v16 = OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_134_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32));
    *(_QWORD *)(v5 + *(int *)(v14 + 20)) = *(_QWORD *)(v12 + *(int *)(v14 + 20));
    OUTLINED_FUNCTION_4_6();
  }
  v17 = v3 + v4[9];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_43_9();
  v18 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_38_11(v17 + *(int *)(v18 + 20));
  OUTLINED_FUNCTION_60_10(v19);
  OUTLINED_FUNCTION_60_10(*(int *)(v20 + 28));
  OUTLINED_FUNCTION_60_10(*(int *)(v21 + 32));
  OUTLINED_FUNCTION_60_10(*(int *)(v22 + 36));
  if (OUTLINED_FUNCTION_4_2())
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_11_0(v23);
  }
  else
  {
    OUTLINED_FUNCTION_43_9();
    OUTLINED_FUNCTION_2();
  }
  v24 = v4[11];
  *(_OWORD *)(v2 + v4[10]) = *(_OWORD *)(v3 + v4[10]);
  *(_OWORD *)(v2 + v24) = *(_OWORD *)(v3 + v24);
  *(_OWORD *)(v2 + v4[12]) = *(_OWORD *)(v3 + v4[12]);
  return v2;
}

void assignWithTake for IntelligenceFlowTranscriptDatastreamEvent()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  _DWORD *v6;
  uint64_t v7;
  int EnumTagSinglePayload;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  int v21;
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
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;

  OUTLINED_FUNCTION_31_3();
  v7 = OUTLINED_FUNCTION_11_1(v5, v6);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v3, 1, v7);
  v9 = OUTLINED_FUNCTION_4_2();
  if (EnumTagSinglePayload)
  {
    if (!v9)
    {
      OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32));
      OUTLINED_FUNCTION_2();
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v10 = *(_QWORD *)(v7 - 8);
  if (v9)
  {
    OUTLINED_FUNCTION_12_2(v10);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v11);
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 40));
LABEL_7:
  OUTLINED_FUNCTION_71_1();
  if (v12)
    __swift_destroy_boxed_opaque_existential_1(v3);
  v13 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)v3 = *(_OWORD *)v4;
  *(_OWORD *)(v3 + 16) = v13;
  *(_QWORD *)(v3 + 32) = *(_QWORD *)(v4 + 32);
  v14 = v0 + v2[7];
  v15 = __swift_getEnumTagSinglePayload(v14, 1, v7);
  v16 = OUTLINED_FUNCTION_4_2();
  if (v15)
  {
    if (!v16)
    {
      OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32));
      OUTLINED_FUNCTION_2();
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v17 = *(_QWORD *)(v7 - 8);
  if (v16)
  {
    OUTLINED_FUNCTION_12_2(v17);
LABEL_14:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v18);
    goto LABEL_15;
  }
  OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 40));
LABEL_15:
  v19 = OUTLINED_FUNCTION_37_11();
  v20 = (int *)__swift_getEnumTagSinglePayload(v7, 1, v19);
  v21 = OUTLINED_FUNCTION_7_8();
  if ((_DWORD)v20)
  {
    if (!v21)
    {
      v22 = OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_134_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 32));
      *(_QWORD *)(v7 + *(int *)(v19 + 20)) = *(_QWORD *)(v14 + *(int *)(v19 + 20));
      OUTLINED_FUNCTION_4_6();
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (v21)
  {
    sub_23FEF07EC(v7);
LABEL_20:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
    OUTLINED_FUNCTION_5_12(v23);
    goto LABEL_21;
  }
  v40 = OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_134_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 40));
  *(_QWORD *)(v7 + *(int *)(v19 + 20)) = *(_QWORD *)(v14 + *(int *)(v19 + 20));
  swift_release();
LABEL_21:
  v24 = v2[9];
  v25 = v0 + v24;
  v26 = v1 + v24;
  v27 = OUTLINED_FUNCTION_1_2();
  v28 = *(_QWORD *)(v27 - 8);
  OUTLINED_FUNCTION_46_8();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_50_5();
  OUTLINED_FUNCTION_38_11(v29);
  OUTLINED_FUNCTION_83_1((uint64_t *)(v26 + v30));
  OUTLINED_FUNCTION_83_1((uint64_t *)(v26 + v20[7]));
  OUTLINED_FUNCTION_83_1((uint64_t *)(v26 + v20[8]));
  OUTLINED_FUNCTION_83_1((uint64_t *)(v26 + v20[9]));
  v31 = v20[10];
  v32 = v25 + v31;
  v33 = v26 + v31;
  v34 = __swift_getEnumTagSinglePayload(v32, 1, v27);
  v35 = OUTLINED_FUNCTION_8_0(v33);
  if (!v34)
  {
    if (!v35)
    {
      OUTLINED_FUNCTION_46_8();
      goto LABEL_27;
    }
    OUTLINED_FUNCTION_58_9(*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8));
    goto LABEL_26;
  }
  if (v35)
  {
LABEL_26:
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_21_9(v36);
    goto LABEL_27;
  }
  OUTLINED_FUNCTION_44_9(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 32));
  OUTLINED_FUNCTION_3_16(v32);
LABEL_27:
  OUTLINED_FUNCTION_83_1((uint64_t *)(v1 + v2[10]));
  OUTLINED_FUNCTION_83_1((uint64_t *)(v1 + v2[11]));
  v37 = v2[12];
  v38 = *(_QWORD *)(v0 + v37);
  v39 = *(_QWORD *)(v0 + v37 + 8);
  *(_OWORD *)(v0 + v37) = *(_OWORD *)(v1 + v37);
  sub_23FE14A74(v38, v39);
  OUTLINED_FUNCTION_7();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowTranscriptDatastreamEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23FEF0C84(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
  OUTLINED_FUNCTION_49_0();
  if (v9)
  {
    v7 = v6;
    v8 = a3[5];
    return __swift_getEnumTagSinglePayload(a1 + v8, a2, v7);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
  OUTLINED_FUNCTION_49_0();
  if (v9)
  {
    v7 = v10;
    v8 = a3[8];
    return __swift_getEnumTagSinglePayload(a1 + v8, a2, v7);
  }
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_49_0();
  if (v11)
  {
    v7 = v12;
    v8 = a3[9];
    return __swift_getEnumTagSinglePayload(a1 + v8, a2, v7);
  }
  v14 = *(_QWORD *)(a1 + a3[10] + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowTranscriptDatastreamEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23FEF0D44(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
  OUTLINED_FUNCTION_48_3();
  if (v10)
  {
    v8 = v7;
    v9 = a4[5];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
    OUTLINED_FUNCTION_48_3();
    if (v10)
    {
      v8 = v11;
      v9 = a4[8];
    }
    else
    {
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_48_3();
      if (!v12)
      {
        *(_QWORD *)(a1 + a4[10] + 8) = (a2 - 1);
        OUTLINED_FUNCTION_9();
        return;
      }
      v8 = v13;
      v9 = a4[9];
    }
  }
  __swift_storeEnumTagSinglePayload(a1 + v9, a2, a2, v8);
}

void sub_23FEF0DEC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23FE54000(319, (unint64_t *)&qword_25434BB08, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
  {
    sub_23FE54000(319, &qword_25434BAD0, (void (*)(uint64_t))type metadata accessor for MonotonicTimestamp);
    if (v1 <= 0x3F)
    {
      type metadata accessor for IntelligenceFlowIdentifiers();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t OUTLINED_FUNCTION_16_22()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v3 = *(int *)(v2 + 40);
  v4 = *(int *)(v2 + 44);
  v5 = (_QWORD *)(v0 + v3);
  v6 = (_QWORD *)(v1 + v3);
  v7 = v6[1];
  *v5 = *v6;
  v5[1] = v7;
  v8 = (_QWORD *)(v0 + v4);
  v9 = (_QWORD *)(v1 + v4);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_20_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_25_13()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_35_17()
{
  uint64_t v0;
  unint64_t v1;

  return sub_23FE1B51C(v0, v1);
}

void OUTLINED_FUNCTION_38_11(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)v1 = *(_QWORD *)a1;
  *(_BYTE *)(v1 + 8) = *(_BYTE *)(a1 + 8);
}

uint64_t OUTLINED_FUNCTION_43_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_44_9@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v3, v2, v1);
}

uint64_t OUTLINED_FUNCTION_45_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_46_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_53_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_58_9@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

__n128 OUTLINED_FUNCTION_60_10@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;

  result = *(__n128 *)(v2 + a1);
  *(__n128 *)(v1 + a1) = result;
  return result;
}

unint64_t static Library.Streams.IntelligenceFlow.QueryDecorationTelemetry.identifier.getter()
{
  return 0xD000000000000029;
}

uint64_t sub_23FEF0FE8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23FF58C28();
  __swift_allocate_value_buffer(v3, qword_25434DE28);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_25434DE28);
  sub_23FF58BF8();
  result = __swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(v4, v2, v3);
  __break(1u);
  return result;
}

uint64_t static Library.Streams.IntelligenceFlow.QueryDecorationTelemetry.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE17B08(&_MergedGlobals_19, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], (uint64_t)qword_25434DE28, a1);
}

uint64_t sub_23FEF10E4(uint64_t a1)
{
  return sub_23FE17B90(a1, MEMORY[0x24BE0CA80], qword_25434DE40, MEMORY[0x24BE0CA70]);
}

uint64_t static Library.Streams.IntelligenceFlow.QueryDecorationTelemetry.domain.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE17B08(&qword_25434DE18, MEMORY[0x24BE0CA80], (uint64_t)qword_25434DE40, a1);
}

uint64_t sub_23FEF1120(uint64_t a1)
{
  return sub_23FE17B90(a1, MEMORY[0x24BE0CA40], qword_25434DE58, MEMORY[0x24BE0CA38]);
}

uint64_t static Library.Streams.IntelligenceFlow.QueryDecorationTelemetry.protectionClass.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE17B08(&qword_25434DE20, MEMORY[0x24BE0CA40], (uint64_t)qword_25434DE58, a1);
}

id static Library.Streams.IntelligenceFlow.QueryDecorationTelemetry.configuration.getter()
{
  id result;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C9B8]), sel_initPruneOnAccess_filterByAgeOnRead_maxAge_maxStreamSize_maxEventCount_, 0, 0, 52428800, 10000, 604800.0);
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_opt_self();
    v3 = (void *)OUTLINED_FUNCTION_0_39();
    v4 = objc_msgSend(v2, sel_newLibraryStoreConfigForStreamIdentifier_domain_segmentSize_protectionClass_pruningPolicy_, v3, 0, 0x20000, 3, v1);

    v5 = (void *)OUTLINED_FUNCTION_0_39();
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434BA80);
    v7 = objc_allocWithZone(MEMORY[0x24BE0CDA0]);
    v8 = sub_23FE1E74C(v5, v6, v4, 0, (uint64_t)&unk_251022850, 0);

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t static Library.Streams.IntelligenceFlow.QueryDecorationTelemetry.attribute(_:)(void (*a1)(void))
{
  uint64_t v1;
  unint64_t result;

  result = sub_23FEF1290(a1);
  if (!v1)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_23FEF1290(void (*a1)(void))
{
  a1();
  return 0x800000023FF8E160;
}

unint64_t sub_23FEF12C4(void (*a1)(void))
{
  uint64_t v1;
  unint64_t result;

  result = sub_23FEF1290(a1);
  if (!v1)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_23FEF12F0()
{
  static Library.Streams.IntelligenceFlow.QueryDecorationTelemetry.identifier.getter();
  return 0xD000000000000029;
}

_UNKNOWN **sub_23FEF1318()
{
  return &protocol witness table for IntelligenceFlowQueryDecorationTelemetry;
}

unint64_t sub_23FEF1324(uint64_t a1)
{
  unint64_t result;

  result = sub_23FEF1348();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23FEF1348()
{
  unint64_t result;

  result = qword_25434BA68;
  if (!qword_25434BA68)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for Library.Streams.IntelligenceFlow.QueryDecorationTelemetry, &type metadata for Library.Streams.IntelligenceFlow.QueryDecorationTelemetry);
    atomic_store(result, (unint64_t *)&qword_25434BA68);
  }
  return result;
}

ValueMetadata *type metadata accessor for Library.Streams.IntelligenceFlow.QueryDecorationTelemetry()
{
  return &type metadata for Library.Streams.IntelligenceFlow.QueryDecorationTelemetry;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> IntelligenceFlowQueryDecorationTelemetry.json()()
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
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  Swift::String result;
  uint64_t v17;

  v3 = v0;
  v4 = sub_23FF58CA0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0_7();
  v6 = OUTLINED_FUNCTION_6_28();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_13_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D78);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23FEF14CC(v3, v2);
  sub_23FE18300(v2, v6, (uint64_t)v10);
  sub_23FF58C94();
  sub_23FEF1510();
  v11 = sub_23FF58DC0();
  v13 = v12;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v4);
  sub_23FE1D55C((uint64_t)v10, &qword_256F91D78);
  v14 = v11;
  v15 = v13;
  result._object = v15;
  result._countAndFlagsBits = v14;
  return result;
}

uint64_t sub_23FEF14CC(uint64_t a1, uint64_t a2)
{
  uint64_t DecorationTelemetry;

  DecorationTelemetry = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(DecorationTelemetry - 8) + 16))(a2, a1, DecorationTelemetry);
  return a2;
}

unint64_t sub_23FEF1510()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256F91D80;
  if (!qword_256F91D80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256F91D78);
    result = MEMORY[0x24267B784](&unk_23FF5FC90, v1);
    atomic_store(result, (unint64_t *)&qword_256F91D80);
  }
  return result;
}

uint64_t static IntelligenceFlowQueryDecorationTelemetry.event(from:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  sub_23FF58C88();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_11();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D78);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0_7();
  swift_bridgeObjectRetain();
  sub_23FF58C7C();
  sub_23FEF1510();
  result = sub_23FF58DCC();
  if (!v1)
    return sub_23FEF1628(v2, a1);
  return result;
}

uint64_t sub_23FEF1628(uint64_t a1, uint64_t a2)
{
  uint64_t DecorationTelemetry;

  DecorationTelemetry = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(DecorationTelemetry - 8) + 32))(a2, a1, DecorationTelemetry);
  return a2;
}

uint64_t static IntelligenceFlowQueryDecorationTelemetry.event(from:dataVersion:writeTimestamp:bookmark:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;

  v28 = a6;
  v29 = a5;
  v27 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D78);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_11();
  v11 = sub_23FF58CC4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v26 - v16;
  if (*(_DWORD *)sub_23FEFB584() == a3)
  {
    sub_23FF58CB8();
    sub_23FF58CAC();
    v32 = 0;
    v30 = 0u;
    v31 = 0u;
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    sub_23FE1B51C(a1, a2);
    sub_23FEF1510();
    v18 = v33;
    sub_23FF58DE4();
    if (v18)
    {
      return OUTLINED_FUNCTION_15();
    }
    else
    {
      OUTLINED_FUNCTION_15();
      v21 = v28;
      sub_23FEF1628(v6, v28);
      v22 = OUTLINED_FUNCTION_6_28();
      v23 = v21 + *(int *)(v22 + 20);
      sub_23FE1D55C(v23, &qword_25434B8D8);
      v24 = sub_23FF58BEC();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v23, v27, v24);
      __swift_storeEnumTagSinglePayload(v23, 0, 1, v24);
      v25 = v21 + *(int *)(v22 + 24);
      sub_23FE1D55C(v25, &qword_25434B738);
      return sub_23FE1EDB8(v29, v25);
    }
  }
  else
  {
    sub_23FE1ED7C();
    swift_allocError();
    *v20 = a3;
    return swift_willThrow();
  }
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.serialize()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = OUTLINED_FUNCTION_6_28();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D78);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_13_0();
  sub_23FEF14CC(v0, (uint64_t)v5);
  sub_23FE18300((uint64_t)v5, v2, v1);
  sub_23FEF1510();
  v7 = sub_23FF58DF0();
  sub_23FE1D55C(v1, &qword_256F91D78);
  return v7;
}

uint64_t static IntelligenceFlowQueryDecorationTelemetry.columns.getter()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_23FEF1994(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23FEF19E0(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23FEF1A18@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return static IntelligenceFlowQueryDecorationTelemetry.event(from:dataVersion:writeTimestamp:bookmark:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_23FEF1A2C()
{
  return IntelligenceFlowQueryDecorationTelemetry.serialize()();
}

uint64_t sub_23FEF1A40()
{
  return IntelligenceFlowQueryDecorationTelemetry.json()()._countAndFlagsBits;
}

uint64_t sub_23FEF1A54@<X0>(uint64_t a1@<X8>)
{
  return static IntelligenceFlowQueryDecorationTelemetry.event(from:)(a1);
}

uint64_t OUTLINED_FUNCTION_6_28()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0);
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.init()@<X0>(_DWORD *a1@<X8>)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t *v10;
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
  uint64_t Decoration;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t *v31;

  v2 = (int *)OUTLINED_FUNCTION_6_28();
  v3 = (uint64_t)a1 + v2[5];
  sub_23FE415E0();
  v4 = (uint64_t)a1 + v2[6];
  sub_23FE41694((_OWORD *)v4);
  v5 = (uint64_t)a1 + v2[7];
  sub_23FEFB664();
  v6 = (uint64_t)a1 + v2[8];
  sub_23FE90DE4();
  v7 = (uint64_t)a1 + v2[9];
  sub_23FEFB760();
  v30 = (uint64_t)a1 + v2[10];
  sub_23FEFB814();
  v31 = (uint64_t *)((char *)a1 + v2[11]);
  OUTLINED_FUNCTION_408(v31);
  v8 = (_OWORD *)((char *)a1 + v2[12]);
  j__OUTLINED_FUNCTION_208_0(v8);
  v9 = (uint64_t)a1 + v2[13];
  sub_23FEFB9D4(v9);
  v10 = (uint64_t *)((char *)a1 + v2[14]);
  sub_23FEFBA88(v10);
  v11 = (uint64_t)a1 + v2[15];
  sub_23FEFBB3C();
  *a1 = *(_DWORD *)sub_23FEFB584();
  sub_23FE24D20(v3, &qword_25434B8D8);
  v12 = sub_23FF58BEC();
  OUTLINED_FUNCTION_6_8(v3, v13, v14, v12);
  sub_23FE24D20(v4, &qword_25434B738);
  *(_OWORD *)v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  *(_QWORD *)(v4 + 32) = 0;
  sub_23FE24D20(v5, &qword_256F91D88);
  v15 = OUTLINED_FUNCTION_74_9();
  OUTLINED_FUNCTION_6_8(v5, v16, v17, v15);
  sub_23FE24D20(v6, &qword_256F8F630);
  v18 = OUTLINED_FUNCTION_3_14();
  v21 = OUTLINED_FUNCTION_6_8(v6, v19, v20, v18);
  OUTLINED_FUNCTION_34_4(v21, &qword_256F91D90);
  Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation(0);
  OUTLINED_FUNCTION_6_8(v7, v23, v24, Decoration);
  sub_23FE24D20(v30, &qword_256F91D98);
  v25 = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall(0);
  OUTLINED_FUNCTION_6_8(v30, v26, v27, v25);
  sub_23FE3D0E0(*v31);
  *v31 = 0xF000000000000007;
  sub_23FEF1994(*(_QWORD *)v8);
  *v8 = 0u;
  v8[1] = 0u;
  *(_QWORD *)v9 = 0;
  *(_WORD *)(v9 + 12) = 768;
  *(_DWORD *)(v9 + 8) = 0;
  sub_23FEF19E0(*v10);
  *v10 = 0;
  v10[1] = 0;
  v10[2] = 0;
  sub_23FE24D20(v11, &qword_256F91DA0);
  v28 = OUTLINED_FUNCTION_73_8();
  return __swift_storeEnumTagSinglePayload(v11, 1, 1, v28);
}

BOOL static IntelligenceFlowQueryDecorationTelemetry.== infix(_:_:)(uint64_t a1, uint64_t a2)
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
  char *v42;
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
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int *v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t *v70;
  char v71;
  int *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  int *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  int *v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char v117;
  uint64_t v118;
  _QWORD *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t *v133;
  unint64_t v134;
  uint64_t *v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char v148;
  int *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char v157;
  uint64_t v158;
  uint64_t v159;
  char v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
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
  int *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;

  v191 = a2;
  v167 = OUTLINED_FUNCTION_73_8();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_21_8(v4);
  v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91DA8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_21_8(v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91DA0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_24_0();
  v163 = v8;
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v9);
  v165 = (uint64_t)&v161 - v10;
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_29_4();
  v166 = v12;
  v172 = OUTLINED_FUNCTION_69_9();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_21_8(v14);
  v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91DB0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_21_8(v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D98);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_24_0();
  v176 = v18;
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v19);
  v183 = (char *)&v161 - v20;
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_29_4();
  v175 = v22;
  v178 = OUTLINED_FUNCTION_70_8();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_21_8(v24);
  v177 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91DB8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_35();
  v179 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D90);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_24_0();
  v182 = v28;
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v29);
  v188 = (uint64_t)&v161 - v30;
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_29_4();
  v181 = v32;
  v185 = OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_21_8(v34);
  v184 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90410);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_35();
  v186 = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_24_0();
  v180 = v38;
  OUTLINED_FUNCTION_39();
  v40 = MEMORY[0x24BDAC7A8](v39);
  v42 = (char *)&v161 - v41;
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_29_4();
  v189 = v43;
  v44 = OUTLINED_FUNCTION_74_9();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_24();
  v48 = v47 - v46;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91DC0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_24();
  v53 = v52 - v51;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D88);
  OUTLINED_FUNCTION_9_0();
  v55 = MEMORY[0x24BDAC7A8](v54);
  v57 = (char *)&v161 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = MEMORY[0x24BDAC7A8](v55);
  v60 = (char *)&v161 - v59;
  MEMORY[0x24BDAC7A8](v58);
  v62 = (char *)&v161 - v61;
  v63 = OUTLINED_FUNCTION_6_28();
  v64 = *(int *)(v63 + 28);
  v187 = a1;
  v65 = a1 + v64;
  v66 = (int *)v63;
  OUTLINED_FUNCTION_58_10(v65, (uint64_t)v62);
  v190 = v66;
  OUTLINED_FUNCTION_58_10(v191 + v66[7], (uint64_t)v60);
  v67 = v53 + *(int *)(v49 + 48);
  OUTLINED_FUNCTION_58_10((uint64_t)v62, v53);
  OUTLINED_FUNCTION_58_10((uint64_t)v60, v67);
  OUTLINED_FUNCTION_68(v53, 1, v44);
  if (v69)
  {
    OUTLINED_FUNCTION_7_17((uint64_t)v60);
    OUTLINED_FUNCTION_7_17((uint64_t)v62);
    v68 = OUTLINED_FUNCTION_68(v67, 1, v44);
    if (v69)
    {
      OUTLINED_FUNCTION_34_4(v68, &qword_256F91D88);
      goto LABEL_11;
    }
LABEL_9:
    v70 = &qword_256F91DC0;
LABEL_20:
    v84 = v53;
LABEL_21:
    sub_23FE24D20(v84, v70);
    return 0;
  }
  sub_23FE5D46C(v53, (uint64_t)v57, &qword_256F91D88);
  OUTLINED_FUNCTION_68(v67, 1, v44);
  if (v69)
  {
    OUTLINED_FUNCTION_7_17((uint64_t)v60);
    OUTLINED_FUNCTION_7_17((uint64_t)v62);
    sub_23FE251BC((uint64_t)v57, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata);
    goto LABEL_9;
  }
  sub_23FE5D4A4(v67, v48, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata);
  sub_23FE23908(&qword_256F91E00, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata);
  v71 = OUTLINED_FUNCTION_367();
  sub_23FE251BC(v48, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata);
  OUTLINED_FUNCTION_7_17((uint64_t)v60);
  OUTLINED_FUNCTION_7_17((uint64_t)v62);
  sub_23FE251BC((uint64_t)v57, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata);
  OUTLINED_FUNCTION_7_17(v53);
  if ((v71 & 1) == 0)
    return 0;
LABEL_11:
  v73 = v189;
  v72 = v190;
  v74 = v187;
  OUTLINED_FUNCTION_4_7(v187 + v190[8], v189);
  v75 = v191;
  OUTLINED_FUNCTION_4_7(v191 + v72[8], (uint64_t)v42);
  v53 = v186;
  v76 = v186 + *(int *)(v184 + 48);
  OUTLINED_FUNCTION_4_7(v73, v186);
  OUTLINED_FUNCTION_4_7((uint64_t)v42, v76);
  v77 = v185;
  OUTLINED_FUNCTION_68(v53, 1, v185);
  if (v69)
  {
    OUTLINED_FUNCTION_2_2((uint64_t)v42);
    OUTLINED_FUNCTION_2_2(v73);
    v78 = OUTLINED_FUNCTION_68(v76, 1, v77);
    v79 = v182;
    v80 = (uint64_t)v183;
    v81 = v188;
    if (v69)
    {
      OUTLINED_FUNCTION_34_4(v78, &qword_256F8F630);
      goto LABEL_25;
    }
    goto LABEL_19;
  }
  v82 = v180;
  sub_23FE5D46C(v53, v180, &qword_256F8F630);
  OUTLINED_FUNCTION_68(v76, 1, v77);
  v81 = v188;
  if (v83)
  {
    OUTLINED_FUNCTION_7_17((uint64_t)v42);
    OUTLINED_FUNCTION_7_17(v73);
    sub_23FE251BC(v82, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
LABEL_19:
    v70 = &qword_256F90410;
    goto LABEL_20;
  }
  v86 = v75;
  v87 = v74;
  v88 = v174;
  OUTLINED_FUNCTION_9_17(v76, v174);
  OUTLINED_FUNCTION_28_1(&qword_256F8F5E8, v89, (uint64_t)&protocol conformance descriptor for MonotonicTimestamp);
  v90 = OUTLINED_FUNCTION_367();
  v91 = v88;
  v74 = v87;
  v75 = v86;
  OUTLINED_FUNCTION_12_1(v91);
  OUTLINED_FUNCTION_2_2((uint64_t)v42);
  OUTLINED_FUNCTION_2_2(v189);
  v92 = v82;
  v80 = (uint64_t)v183;
  OUTLINED_FUNCTION_12_1(v92);
  OUTLINED_FUNCTION_2_2(v53);
  v79 = v182;
  if ((v90 & 1) == 0)
    return 0;
LABEL_25:
  v93 = v190;
  v94 = v181;
  OUTLINED_FUNCTION_4_7(v74 + v190[9], v181);
  OUTLINED_FUNCTION_4_7(v75 + v93[9], v81);
  v95 = v179;
  v96 = v179 + *(int *)(v177 + 48);
  OUTLINED_FUNCTION_4_7(v94, v179);
  OUTLINED_FUNCTION_4_7(v81, v96);
  v97 = v81;
  v98 = v178;
  OUTLINED_FUNCTION_68(v95, 1, v178);
  if (v69)
  {
    OUTLINED_FUNCTION_2_2(v97);
    OUTLINED_FUNCTION_2_2(v94);
    OUTLINED_FUNCTION_68(v96, 1, v98);
    v99 = v176;
    v100 = v175;
    if (v69)
    {
      sub_23FE24D20(v95, &qword_256F91D90);
      goto LABEL_35;
    }
LABEL_33:
    v70 = &qword_256F91DB8;
LABEL_44:
    v84 = v95;
    goto LABEL_21;
  }
  sub_23FE5D46C(v95, v79, &qword_256F91D90);
  OUTLINED_FUNCTION_68(v96, 1, v98);
  v99 = v176;
  v100 = v175;
  if (v101)
  {
    OUTLINED_FUNCTION_7_17(v188);
    OUTLINED_FUNCTION_7_17(v181);
    sub_23FE251BC(v79, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation);
    goto LABEL_33;
  }
  v102 = v79;
  v103 = v170;
  OUTLINED_FUNCTION_9_17(v96, v170);
  OUTLINED_FUNCTION_28_1(&qword_256F91DF8, v104, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation);
  v105 = OUTLINED_FUNCTION_367();
  OUTLINED_FUNCTION_12_1(v103);
  OUTLINED_FUNCTION_2_2(v188);
  OUTLINED_FUNCTION_2_2(v181);
  OUTLINED_FUNCTION_12_1(v102);
  OUTLINED_FUNCTION_2_2(v179);
  if ((v105 & 1) == 0)
    return 0;
LABEL_35:
  v106 = v190;
  OUTLINED_FUNCTION_4_7(v74 + v190[10], v100);
  OUTLINED_FUNCTION_4_7(v75 + v106[10], v80);
  v95 = v173;
  v107 = v173 + *(int *)(v171 + 48);
  OUTLINED_FUNCTION_4_7(v100, v173);
  OUTLINED_FUNCTION_4_7(v80, v107);
  v108 = v172;
  OUTLINED_FUNCTION_68(v95, 1, v172);
  if (v69)
  {
    OUTLINED_FUNCTION_2_2(v80);
    OUTLINED_FUNCTION_2_2(v100);
    OUTLINED_FUNCTION_68(v107, 1, v108);
    if (v69)
    {
      sub_23FE24D20(v95, &qword_256F91D98);
      goto LABEL_46;
    }
    goto LABEL_43;
  }
  sub_23FE5D46C(v95, v99, &qword_256F91D98);
  OUTLINED_FUNCTION_68(v107, 1, v108);
  if (v109)
  {
    OUTLINED_FUNCTION_7_17(v80);
    OUTLINED_FUNCTION_7_17(v100);
    sub_23FE251BC(v99, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall);
LABEL_43:
    v70 = &qword_256F91DB0;
    goto LABEL_44;
  }
  v110 = v99;
  v111 = v169;
  OUTLINED_FUNCTION_9_17(v107, v169);
  OUTLINED_FUNCTION_28_1(&qword_256F91DF0, v112, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall);
  v113 = OUTLINED_FUNCTION_367();
  OUTLINED_FUNCTION_12_1(v111);
  OUTLINED_FUNCTION_2_2(v80);
  OUTLINED_FUNCTION_2_2(v100);
  OUTLINED_FUNCTION_12_1(v110);
  OUTLINED_FUNCTION_2_2(v173);
  if ((v113 & 1) == 0)
    return 0;
LABEL_46:
  v114 = v190[11];
  v115 = *(_QWORD *)(v74 + v114);
  v116 = *(_QWORD *)(v75 + v114);
  if ((~v115 & 0xF000000000000007) == 0)
  {
    if ((~v116 & 0xF000000000000007) == 0)
      goto LABEL_53;
LABEL_51:
    sub_23FED4488(v116);
    sub_23FE3D0E0(v115);
    sub_23FE3D0E0(v116);
    return 0;
  }
  v196 = *(_QWORD *)(v74 + v114);
  if ((~v116 & 0xF000000000000007) == 0)
  {
    sub_23FED4488(v115);
    goto LABEL_51;
  }
  v192 = v116;
  sub_23FED4488(v115);
  sub_23FEF2CDC();
  swift_retain();
  OUTLINED_FUNCTION_41_11();
  v117 = sub_23FF58FB8();
  swift_release();
  sub_23FE3D0E0(v115);
  if ((v117 & 1) == 0)
    return 0;
LABEL_53:
  v118 = v190[12];
  v119 = (_QWORD *)(v74 + v118);
  v120 = *(_QWORD *)(v74 + v118);
  v121 = v119[1];
  v123 = v119[2];
  v122 = v119[3];
  v124 = (uint64_t *)(v75 + v118);
  v126 = *v124;
  v125 = v124[1];
  v128 = v124[2];
  v127 = v124[3];
  if (!v120)
  {
    if (!v126)
      goto LABEL_58;
LABEL_62:
    v137 = OUTLINED_FUNCTION_65_6();
    sub_23FEF2BA4(v137);
    OUTLINED_FUNCTION_49_6();
    v138 = OUTLINED_FUNCTION_65_6();
    sub_23FEF1994(v138);
    return 0;
  }
  v196 = v120;
  v197 = v121;
  v198 = v123;
  v199 = v122;
  if (!v126)
  {
    OUTLINED_FUNCTION_48_12();
    goto LABEL_62;
  }
  v192 = v126;
  v193 = v125;
  v194 = v128;
  v195 = v127;
  OUTLINED_FUNCTION_48_12();
  sub_23FEF2CA0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_41_11();
  v129 = sub_23FF58FB8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_49_6();
  if ((v129 & 1) == 0)
    return 0;
LABEL_58:
  v130 = v191;
  v131 = v190[13];
  v132 = v187;
  v133 = (uint64_t *)(v187 + v131);
  v134 = *((unsigned int *)v133 + 2) | ((unint64_t)*((unsigned __int16 *)v133 + 6) << 32);
  v135 = (uint64_t *)(v191 + v131);
  v136 = *((unsigned int *)v135 + 2) | ((unint64_t)*((unsigned __int16 *)v135 + 6) << 32);
  if ((v134 & 0xFF0000000000) == 0x30000000000)
  {
    if ((v136 & 0xFF0000000000) != 0x30000000000)
      return 0;
  }
  else
  {
    v139 = *v135;
    v196 = *v133;
    WORD2(v197) = WORD2(v134);
    LODWORD(v197) = v134;
    if ((v136 & 0xFF0000000000) == 0x30000000000)
      return 0;
    LODWORD(v192) = v139;
    BYTE4(v192) = BYTE4(v139) & 1;
    LODWORD(v193) = v136;
    BYTE4(v193) = BYTE4(v136) & 1;
    BYTE5(v193) = BYTE5(v136);
    sub_23FEF2C64();
    OUTLINED_FUNCTION_41_11();
    if ((sub_23FF58FB8() & 1) == 0)
      return 0;
  }
  v140 = v190[14];
  v141 = *(_QWORD *)(v132 + v140);
  v142 = *(_QWORD *)(v132 + v140 + 8);
  v143 = *(_QWORD *)(v132 + v140 + 16);
  v144 = (uint64_t *)(v130 + v140);
  v146 = *v144;
  v145 = v144[1];
  v147 = v144[2];
  if (!v141)
  {
    if (!v146)
      goto LABEL_70;
LABEL_76:
    sub_23FEF2BF0(v146);
    OUTLINED_FUNCTION_55_6();
    sub_23FEF19E0(v146);
    return 0;
  }
  v196 = v141;
  v197 = v142;
  v198 = v143;
  if (!v146)
  {
    OUTLINED_FUNCTION_54_10();
    goto LABEL_76;
  }
  v192 = v146;
  v193 = v145;
  v194 = v147;
  OUTLINED_FUNCTION_54_10();
  sub_23FEF2C28();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_41_11();
  v148 = sub_23FF58FB8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_55_6();
  if ((v148 & 1) == 0)
    return 0;
LABEL_70:
  v149 = v190;
  v150 = v132 + v190[15];
  v151 = v166;
  OUTLINED_FUNCTION_4_7(v150, v166);
  v152 = v165;
  OUTLINED_FUNCTION_4_7(v130 + v149[15], v165);
  v153 = v168;
  v154 = v168 + *(int *)(v164 + 48);
  OUTLINED_FUNCTION_4_7(v151, v168);
  OUTLINED_FUNCTION_4_7(v152, v154);
  v155 = v167;
  OUTLINED_FUNCTION_68(v153, 1, v167);
  if (v69)
  {
    OUTLINED_FUNCTION_2_2(v152);
    OUTLINED_FUNCTION_2_2(v151);
    OUTLINED_FUNCTION_68(v154, 1, v155);
    if (v69)
    {
      sub_23FE24D20(v153, &qword_256F91DA0);
      return 1;
    }
    goto LABEL_80;
  }
  v156 = v163;
  sub_23FE5D46C(v153, v163, &qword_256F91DA0);
  OUTLINED_FUNCTION_68(v154, 1, v155);
  if (v157)
  {
    OUTLINED_FUNCTION_7_17(v152);
    OUTLINED_FUNCTION_7_17(v151);
    sub_23FE251BC(v156, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext);
LABEL_80:
    v70 = &qword_256F91DA8;
    v84 = v153;
    goto LABEL_21;
  }
  v158 = v162;
  OUTLINED_FUNCTION_9_17(v154, v162);
  OUTLINED_FUNCTION_28_1(&qword_256F91DC8, v159, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext);
  v160 = sub_23FF58FB8();
  OUTLINED_FUNCTION_12_1(v158);
  OUTLINED_FUNCTION_2_2(v152);
  OUTLINED_FUNCTION_2_2(v151);
  OUTLINED_FUNCTION_12_1(v156);
  OUTLINED_FUNCTION_2_2(v153);
  return (v160 & 1) != 0;
}

uint64_t sub_23FEF2BA4(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_23FEF2BF0(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_23FEF2C28()
{
  unint64_t result;

  result = qword_256F91DD0;
  if (!qword_256F91DD0)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked);
    atomic_store(result, (unint64_t *)&qword_256F91DD0);
  }
  return result;
}

unint64_t sub_23FEF2C64()
{
  unint64_t result;

  result = qword_256F91DD8;
  if (!qword_256F91DD8)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated);
    atomic_store(result, (unint64_t *)&qword_256F91DD8);
  }
  return result;
}

unint64_t sub_23FEF2CA0()
{
  unint64_t result;

  result = qword_256F91DE0;
  if (!qword_256F91DE0)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected);
    atomic_store(result, (unint64_t *)&qword_256F91DE0);
  }
  return result;
}

unint64_t sub_23FEF2CDC()
{
  unint64_t result;

  result = qword_256F91DE8;
  if (!qword_256F91DE8)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDCollectionContext, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDCollectionContext);
    atomic_store(result, (unint64_t *)&qword_256F91DE8);
  }
  return result;
}

void IntelligenceFlowQueryDecorationTelemetry.hash(into:)()
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
  int *v30;
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
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v44 = OUTLINED_FUNCTION_73_8();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_35();
  v38 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91DA0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_35();
  v43 = v4;
  v42 = OUTLINED_FUNCTION_69_9();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_35();
  v37 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D98);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_35();
  v41 = v8;
  v40 = OUTLINED_FUNCTION_70_8();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_35();
  v36 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D90);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_24();
  v14 = v13 - v12;
  v39 = OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_35();
  v35 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_24();
  v20 = v19 - v18;
  v21 = OUTLINED_FUNCTION_74_9();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_24();
  v25 = v24 - v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D88);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_24();
  v29 = v28 - v27;
  v30 = (int *)OUTLINED_FUNCTION_6_28();
  sub_23FE5D46C(v0 + v30[7], v29, &qword_256F91D88);
  OUTLINED_FUNCTION_68(v29, 1, v21);
  if (v31)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_23FE5D4A4(v29, v25, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata);
    OUTLINED_FUNCTION_5_0();
    sub_23FE23908(&qword_256F91E08, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata);
    OUTLINED_FUNCTION_38_6();
    sub_23FF58FAC();
    sub_23FE251BC(v25, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata);
  }
  sub_23FE5D46C(v0 + v30[8], v20, &qword_256F8F630);
  OUTLINED_FUNCTION_68(v20, 1, v39);
  if (v31)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_23FE5D4A4(v20, v35, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
    OUTLINED_FUNCTION_5_0();
    sub_23FE23908(&qword_256F8F860, (uint64_t (*)(uint64_t))type metadata accessor for MonotonicTimestamp, (uint64_t)&protocol conformance descriptor for MonotonicTimestamp);
    OUTLINED_FUNCTION_38_6();
    sub_23FF58FAC();
    sub_23FE251BC(v35, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
  }
  sub_23FE5D46C(v0 + v30[9], v14, &qword_256F91D90);
  OUTLINED_FUNCTION_68(v14, 1, v40);
  if (v31)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    OUTLINED_FUNCTION_9_17(v14, v36);
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_28_1(&qword_256F91E10, v32, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation);
    OUTLINED_FUNCTION_38_6();
    sub_23FF58FAC();
    OUTLINED_FUNCTION_12_1(v36);
  }
  sub_23FE5D46C(v0 + v30[10], v41, &qword_256F91D98);
  OUTLINED_FUNCTION_68(v41, 1, v42);
  if (v31)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    OUTLINED_FUNCTION_9_17(v41, v37);
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_28_1(&qword_256F91E18, v33, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall);
    OUTLINED_FUNCTION_38_6();
    sub_23FF58FAC();
    OUTLINED_FUNCTION_12_1(v37);
  }
  if ((~*(_QWORD *)(v0 + v30[11]) & 0xF000000000000007) != 0)
  {
    OUTLINED_FUNCTION_5_0();
    sub_23FEF32C8();
    OUTLINED_FUNCTION_35_18();
  }
  else
  {
    OUTLINED_FUNCTION_5_0();
  }
  if (*(_QWORD *)(v0 + v30[12]))
  {
    OUTLINED_FUNCTION_5_0();
    sub_23FEF3304();
    OUTLINED_FUNCTION_35_18();
  }
  else
  {
    OUTLINED_FUNCTION_5_0();
  }
  if (((*(unsigned int *)(v0 + v30[13] + 8) | ((unint64_t)*(unsigned __int16 *)(v0 + v30[13] + 12) << 32)) & 0xFF0000000000) == 0x30000000000)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    OUTLINED_FUNCTION_5_0();
    sub_23FEF3340();
    OUTLINED_FUNCTION_35_18();
  }
  if (*(_QWORD *)(v0 + v30[14]))
  {
    OUTLINED_FUNCTION_5_0();
    sub_23FEF337C();
    OUTLINED_FUNCTION_35_18();
  }
  else
  {
    OUTLINED_FUNCTION_5_0();
  }
  sub_23FE5D46C(v0 + v30[15], v43, &qword_256F91DA0);
  OUTLINED_FUNCTION_68(v43, 1, v44);
  if (v31)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    OUTLINED_FUNCTION_9_17(v43, v38);
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_28_1(&qword_256F91E40, v34, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext);
    OUTLINED_FUNCTION_38_6();
    sub_23FF58FAC();
    OUTLINED_FUNCTION_12_1(v38);
  }
  OUTLINED_FUNCTION_7();
}

unint64_t sub_23FEF32C8()
{
  unint64_t result;

  result = qword_256F91E20;
  if (!qword_256F91E20)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDCollectionContext, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDCollectionContext);
    atomic_store(result, (unint64_t *)&qword_256F91E20);
  }
  return result;
}

unint64_t sub_23FEF3304()
{
  unint64_t result;

  result = qword_256F91E28;
  if (!qword_256F91E28)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected);
    atomic_store(result, (unint64_t *)&qword_256F91E28);
  }
  return result;
}

unint64_t sub_23FEF3340()
{
  unint64_t result;

  result = qword_256F91E30;
  if (!qword_256F91E30)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated);
    atomic_store(result, (unint64_t *)&qword_256F91E30);
  }
  return result;
}

unint64_t sub_23FEF337C()
{
  unint64_t result;

  result = qword_256F91E38;
  if (!qword_256F91E38)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked);
    atomic_store(result, (unint64_t *)&qword_256F91E38);
  }
  return result;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDToolSubType.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0 + *(unsigned __int8 *)(v0 + 8);
}

uint64_t static IntelligenceFlowQueryDecorationTelemetry.QDToolSubType.allCases.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23FEF5C08((uint64_t)&unk_256F91EC8, a2, a3);
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDToolSubType.description.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8) == 1)
    return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FEF3420 + 4
                                                                                      * byte_23FF6F84C[*(_QWORD *)v0]))(0x6E656D656C706D49, 0xEE006E6F69746174);
  else
    return OUTLINED_FUNCTION_5_15();
}

uint64_t sub_23FEF3420()
{
  return 0x6E61747369737341;
}

uint64_t sub_23FEF3448()
{
  return 0x6553797469746E45;
}

uint64_t sub_23FEF3468()
{
  return 0x6341746E65696C43;
}

uint64_t sub_23FEF3488()
{
  return 0x6F72746E6F434955;
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolSubType.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v2 && v1 == 0xE700000000000000;
  if (v2 || (v3 = v1, v4 = v0, (OUTLINED_FUNCTION_0_0() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_33_2();
  }
  else
  {
    v6 = v4 == 0x6E656D656C706D49 && v3 == 0xEE006E6F69746174;
    if (v6 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v5 = 0;
    }
    else
    {
      v7 = v4 == 0x6E61747369737341 && v3 == 0xEF616D6568635374;
      if (v7 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v5 = 1;
      }
      else
      {
        v8 = v4 == 0x6553797469746E45 && v3 == 0xEC00000072657474;
        if (v8 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_32_2();
        }
        else
        {
          v9 = v4 == 0x6341746E65696C43 && v3 == 0xEC0000006E6F6974;
          if (v9 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_44();
          }
          else if (v4 == 0x6F72746E6F434955 && v3 == 0xE90000000000006CLL)
          {
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_59_0();
          }
          else
          {
            OUTLINED_FUNCTION_0_0();
            OUTLINED_FUNCTION_13_10();
            v5 = 4;
            if ((v4 & 1) == 0)
              v5 = 0;
          }
        }
      }
    }
  }
  OUTLINED_FUNCTION_9_8(v5);
  OUTLINED_FUNCTION_9();
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType.init(rawValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 - 1;
  v3 = 0;
  switch(v2)
  {
    case 1:
      v3 = 1;
      break;
    case 2:
      v3 = 2;
      break;
    case 3:
      v3 = 3;
      break;
    case 4:
      v3 = 4;
      break;
    case 5:
      v3 = 5;
      break;
    case 6:
      v3 = 6;
      break;
    case 7:
      v3 = 7;
      break;
    case 8:
      v3 = 8;
      break;
    case 9:
      v3 = 9;
      break;
    case 10:
      v3 = 10;
      break;
    case 11:
      v3 = 11;
      break;
    case 12:
      v3 = 12;
      break;
    case 13:
      v3 = 13;
      break;
    case 14:
      v3 = 14;
      break;
    case 15:
      v3 = 15;
      break;
    case 16:
      v3 = 16;
      break;
    case 17:
      v3 = 17;
      break;
    case 18:
      v3 = 18;
      break;
    case 19:
      v3 = 19;
      break;
    case 20:
      v3 = 20;
      break;
    case 21:
      v3 = 21;
      break;
    case 22:
      v3 = 22;
      break;
    case 23:
      v3 = 23;
      break;
    case 24:
      v3 = 24;
      break;
    case 25:
      v3 = 25;
      break;
    default:
      return OUTLINED_FUNCTION_23_4(v3, a2);
  }
  return OUTLINED_FUNCTION_23_4(v3, a2);
}

void static IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType.allCases.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  unint64_t v154;
  unint64_t v155;
  uint64_t v156;
  unint64_t v157;
  unint64_t v158;
  uint64_t v159;
  char v160;
  uint64_t v161;
  char *v162;
  char v163;
  uint64_t v164;
  char *v165;
  char v166;
  uint64_t v167;
  char *v168;
  char v169;
  uint64_t v170;
  char *v171;
  char v172;
  uint64_t v173;
  char *v174;
  char v175;
  uint64_t v176;
  char *v177;
  char v178;
  uint64_t v179;
  char *v180;
  char v181;
  uint64_t v182;
  char *v183;
  char v184;
  uint64_t v185;
  char *v186;
  char v187;
  uint64_t v188;
  char *v189;
  char v190;
  uint64_t v191;
  char *v192;
  char v193;
  uint64_t v194;
  char *v195;
  char v196;
  uint64_t v197;
  char *v198;
  char v199;
  uint64_t v200;
  char *v201;
  char v202;
  uint64_t v203;
  char *v204;
  char v205;
  uint64_t v206;
  char *v207;
  char v208;
  uint64_t v209;
  char *v210;
  char v211;
  uint64_t v212;
  char *v213;
  char v214;
  uint64_t v215;
  char *v216;
  char v217;
  uint64_t v218;
  char *v219;
  char v220;
  uint64_t v221;
  char *v222;
  char v223;
  uint64_t v224;
  char *v225;
  char v226;
  uint64_t v227;
  char *v228;
  char v229;
  uint64_t v230;
  char *v231;
  char v232;
  uint64_t v233;
  char *v234;
  char v235;
  uint64_t v236;
  char *v237;
  char v238;
  uint64_t v239;
  char *v240;
  uint64_t v241;

  OUTLINED_FUNCTION_2_5(0, 1, a3, MEMORY[0x24BEE4AF8], &qword_256F91EC0);
  OUTLINED_FUNCTION_28_5();
  if (!(!v13 & v12))
  {
    v160 = OUTLINED_FUNCTION_3_15(v11);
    OUTLINED_FUNCTION_2_5(v160, v3, v161, v162, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_20_7(v7, v8, v9, v10);
  if (!(!v13 & v12))
  {
    v163 = OUTLINED_FUNCTION_3_15(v18);
    OUTLINED_FUNCTION_2_5(v163, v4, v164, v165, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_18_6(v14, v15, v16, v17);
  if (!(!v13 & v12))
  {
    v166 = OUTLINED_FUNCTION_3_15(v23);
    OUTLINED_FUNCTION_2_5(v166, v5, v167, v168, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_21_5(v19, v20, v21, v22);
  if (!(!v13 & v12))
  {
    v169 = OUTLINED_FUNCTION_3_15(v28);
    OUTLINED_FUNCTION_2_5(v169, v3, v170, v171, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_12_0(v24, v25, v26, v27);
  if (!(!v13 & v12))
  {
    v172 = OUTLINED_FUNCTION_3_15(v33);
    OUTLINED_FUNCTION_2_5(v172, v4, v173, v174, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_17_8(v29, v30, v31, v32);
  if (!(!v13 & v12))
  {
    v175 = OUTLINED_FUNCTION_3_15(v38);
    OUTLINED_FUNCTION_2_5(v175, v3, v176, v177, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_14_11(v34, v35, v36, v37);
  if (!(!v13 & v12))
  {
    v178 = OUTLINED_FUNCTION_3_15(v43);
    OUTLINED_FUNCTION_2_5(v178, v4, v179, v180, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_16_9(v39, v40, v41, v42);
  if (!(!v13 & v12))
  {
    v181 = OUTLINED_FUNCTION_3_15(v48);
    OUTLINED_FUNCTION_2_5(v181, v3, v182, v183, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_15_6(v44, v45, v46, v47);
  if (!(!v13 & v12))
  {
    v184 = OUTLINED_FUNCTION_3_15(v53);
    OUTLINED_FUNCTION_2_5(v184, v4, v185, v186, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_22_6(v49, v50, v51, v52);
  if (!(!v13 & v12))
  {
    v187 = OUTLINED_FUNCTION_3_15(v58);
    OUTLINED_FUNCTION_2_5(v187, v3, v188, v189, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_8_19(v54, v55, v56, v57);
  OUTLINED_FUNCTION_13_1();
  if (v64 <= v3)
  {
    v190 = OUTLINED_FUNCTION_3_15(v63);
    OUTLINED_FUNCTION_2_5(v190, v6 + 11, v191, v192, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_7_23(v59, v60, v61, v62);
  OUTLINED_FUNCTION_13_1();
  if (v70 <= v6 + 11)
  {
    v193 = OUTLINED_FUNCTION_3_15(v69);
    OUTLINED_FUNCTION_2_5(v193, v6 + 12, v194, v195, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_8_19(v65, v66, v67, v68);
  OUTLINED_FUNCTION_13_1();
  if (v76 <= v6 + 12)
  {
    v196 = OUTLINED_FUNCTION_3_15(v75);
    OUTLINED_FUNCTION_2_5(v196, v6 + 13, v197, v198, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_7_23(v71, v72, v73, v74);
  OUTLINED_FUNCTION_13_1();
  if (v82 <= v6 + 13)
  {
    v199 = OUTLINED_FUNCTION_3_15(v81);
    OUTLINED_FUNCTION_2_5(v199, v6 + 14, v200, v201, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_8_19(v77, v78, v79, v80);
  OUTLINED_FUNCTION_13_1();
  if (v88 <= v6 + 14)
  {
    v202 = OUTLINED_FUNCTION_3_15(v87);
    OUTLINED_FUNCTION_2_5(v202, v6 + 15, v203, v204, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_7_23(v83, v84, v85, v86);
  OUTLINED_FUNCTION_13_1();
  if (v94 <= v6 + 15)
  {
    v205 = OUTLINED_FUNCTION_3_15(v93);
    OUTLINED_FUNCTION_2_5(v205, v6 + 16, v206, v207, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_8_19(v89, v90, v91, v92);
  OUTLINED_FUNCTION_13_1();
  if (v100 <= v6 + 16)
  {
    v208 = OUTLINED_FUNCTION_3_15(v99);
    OUTLINED_FUNCTION_2_5(v208, v6 + 17, v209, v210, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_7_23(v95, v96, v97, v98);
  OUTLINED_FUNCTION_13_1();
  if (v106 <= v6 + 17)
  {
    v211 = OUTLINED_FUNCTION_3_15(v105);
    OUTLINED_FUNCTION_2_5(v211, v6 + 18, v212, v213, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_8_19(v101, v102, v103, v104);
  OUTLINED_FUNCTION_13_1();
  if (v112 <= v6 + 18)
  {
    v214 = OUTLINED_FUNCTION_3_15(v111);
    OUTLINED_FUNCTION_2_5(v214, v6 + 19, v215, v216, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_7_23(v107, v108, v109, v110);
  OUTLINED_FUNCTION_13_1();
  if (v118 <= v6 + 19)
  {
    v217 = OUTLINED_FUNCTION_3_15(v117);
    OUTLINED_FUNCTION_2_5(v217, v6 + 20, v218, v219, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_8_19(v113, v114, v115, v116);
  OUTLINED_FUNCTION_13_1();
  if (v124 <= v6 + 20)
  {
    v220 = OUTLINED_FUNCTION_3_15(v123);
    OUTLINED_FUNCTION_2_5(v220, v6 + 21, v221, v222, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_7_23(v119, v120, v121, v122);
  OUTLINED_FUNCTION_13_1();
  if (v130 <= v6 + 21)
  {
    v223 = OUTLINED_FUNCTION_3_15(v129);
    OUTLINED_FUNCTION_2_5(v223, v6 + 22, v224, v225, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_8_19(v125, v126, v127, v128);
  OUTLINED_FUNCTION_13_1();
  if (v136 <= v6 + 22)
  {
    v226 = OUTLINED_FUNCTION_3_15(v135);
    OUTLINED_FUNCTION_2_5(v226, v6 + 23, v227, v228, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_7_23(v131, v132, v133, v134);
  OUTLINED_FUNCTION_13_1();
  if (v142 <= v6 + 23)
  {
    v229 = OUTLINED_FUNCTION_3_15(v141);
    OUTLINED_FUNCTION_2_5(v229, v6 + 24, v230, v231, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_8_19(v137, v138, v139, v140);
  OUTLINED_FUNCTION_13_1();
  if (v148 <= v6 + 24)
  {
    v232 = OUTLINED_FUNCTION_3_15(v147);
    OUTLINED_FUNCTION_2_5(v232, v6 + 25, v233, v234, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_7_23(v143, v144, v145, v146);
  OUTLINED_FUNCTION_13_1();
  v154 = v6 + 26;
  if (v155 <= v6 + 25)
  {
    v235 = OUTLINED_FUNCTION_3_15(v153);
    OUTLINED_FUNCTION_2_5(v235, v6 + 26, v236, v237, &qword_256F91EC0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_8_19(v149, v150, v151, v152);
  OUTLINED_FUNCTION_13_1();
  if (v158 <= v154)
  {
    v238 = OUTLINED_FUNCTION_3_15(v157);
    OUTLINED_FUNCTION_2_5(v238, v6 + 27, v239, v240, &qword_256F91EC0);
    v156 = v241;
  }
  *(_QWORD *)(v156 + 16) = v6 + 27;
  v159 = v156 + 16 * v154;
  *(_QWORD *)(v159 + 32) = 25;
  *(_BYTE *)(v159 + 40) = v5;
  OUTLINED_FUNCTION_9();
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType.description.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8) == 1)
    return ((uint64_t (*)(unint64_t, unint64_t))((char *)&loc_23FEF3DAC
                                                                       + 4 * byte_23FF6F86B[*(_QWORD *)v0]))(0xD000000000000012, 0x800000023FF8E400);
  else
    return OUTLINED_FUNCTION_5_15();
}

uint64_t sub_23FEF3DBC()
{
  return 0x7261646E656C6143;
}

uint64_t sub_23FEF3DE0()
{
  return 0x4C746E6572727543;
}

uint64_t sub_23FEF3E04()
{
  return 0x74536E6F69746F4DLL;
}

uint64_t sub_23FEF3E24@<X0>(uint64_t a1@<X8>)
{
  return a1 + 4;
}

uint64_t sub_23FEF3E34()
{
  return 0x49664F746E696F50;
}

uint64_t sub_23FEF3E58@<X0>(uint64_t a1@<X8>)
{
  return a1 - 3;
}

uint64_t sub_23FEF3E68@<X0>(uint64_t a1@<X8>)
{
  return a1 - 3;
}

uint64_t sub_23FEF3E78@<X0>(uint64_t a1@<X8>)
{
  return a1 + 8;
}

uint64_t sub_23FEF3E88@<X0>(uint64_t a1@<X8>)
{
  return a1 + 7;
}

uint64_t sub_23FEF3E98@<X0>(uint64_t a1@<X8>)
{
  return a1 + 9;
}

uint64_t sub_23FEF3EA8@<X0>(uint64_t a1@<X8>)
{
  return a1 + 3;
}

uint64_t sub_23FEF3EB8@<X0>(uint64_t a1@<X8>)
{
  return a1 + 5;
}

uint64_t sub_23FEF3EC8()
{
  return OUTLINED_FUNCTION_57_5();
}

uint64_t sub_23FEF3EF8@<X0>(uint64_t a1@<X8>)
{
  return a1 + 1;
}

uint64_t sub_23FEF3F08@<X0>(uint64_t a1@<X8>)
{
  return a1 - 3;
}

uint64_t sub_23FEF3F18@<X0>(uint64_t a1@<X8>)
{
  return a1 + 3;
}

uint64_t sub_23FEF3F28@<X0>(uint64_t a1@<X8>)
{
  return a1 + 8;
}

uint64_t sub_23FEF3F38@<X0>(uint64_t a1@<X8>)
{
  return a1 + 1;
}

uint64_t sub_23FEF3F48@<X0>(uint64_t a1@<X8>)
{
  return a1 + 1;
}

unint64_t sub_23FEF3F58()
{
  return OUTLINED_FUNCTION_62(19);
}

unint64_t sub_23FEF3F64()
{
  return OUTLINED_FUNCTION_62(19);
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;

  OUTLINED_FUNCTION_4_1();
  v2 = v2 && v1 == 0xE700000000000000;
  if (v2 || (v3 = v1, v4 = v0, (OUTLINED_FUNCTION_0_0() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_33_2();
  }
  else if (v4 == 0xD000000000000012 && (OUTLINED_FUNCTION_6_5((uint64_t)"AppInFocusBundleId"), v2)
         || (OUTLINED_FUNCTION_0_0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 0;
  }
  else if (v4 == 0xD000000000000013 && (OUTLINED_FUNCTION_6_5((uint64_t)"BluetoothDeviceType"), v2)
         || (OUTLINED_FUNCTION_0_0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 1;
  }
  else
  {
    v6 = v4 == 0x7261646E656C6143 && v3 == 0xEE0073746E657645;
    if (v6 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_32_2();
    }
    else
    {
      v7 = v4 == 0x4C746E6572727543 && v3 == 0xEF6E6F697461636FLL;
      if (v7 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_44();
      }
      else
      {
        v8 = v4 == 0x74536E6F69746F4DLL && v3 == 0xEB00000000657461;
        if (v8 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_59_0();
        }
        else if (v4 == 0xD000000000000017 && (OUTLINED_FUNCTION_7_9(), v2) || (OUTLINED_FUNCTION_0_0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_66();
        }
        else
        {
          v9 = v4 == 0x49664F746E696F50 && v3 == 0xEF7473657265746ELL;
          if (v9 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            v5 = 6;
          }
          else if (v4 == 0xD000000000000010 && (OUTLINED_FUNCTION_6_5((uint64_t)"RecentTranscript"), v2)
                 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            v5 = 7;
          }
          else if (v4 == 0xD000000000000010 && (OUTLINED_FUNCTION_6_5((uint64_t)"SemanticLocation"), v2)
                 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            v5 = 8;
          }
          else if (v4 == 0xD00000000000001BLL && (OUTLINED_FUNCTION_6_5((uint64_t)"OnScreenContentEmailAddress"), v2)
                 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            v5 = 9;
          }
          else if (v4 == 0xD00000000000001ALL && (OUTLINED_FUNCTION_7_9(), v2) || (OUTLINED_FUNCTION_0_0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            v5 = 10;
          }
          else if (v4 == 0xD00000000000001CLL && (OUTLINED_FUNCTION_7_9(), v2) || (OUTLINED_FUNCTION_0_0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            v5 = 11;
          }
          else if (v4 == 0xD000000000000016 && (OUTLINED_FUNCTION_6_5((uint64_t)"OnScreenContentUriLink"), v2)
                 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            v5 = 12;
          }
          else if (v4 == 0xD000000000000018 && (OUTLINED_FUNCTION_7_9(), v2) || (OUTLINED_FUNCTION_0_0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            v5 = 13;
          }
          else
          {
            v10 = v4 == 0x6E65657263536E4FLL && v3 == 0xEE006E6F73726550;
            if (v10 || (OUTLINED_FUNCTION_57_5(), (OUTLINED_FUNCTION_0_0() & 1) != 0))
            {
              swift_bridgeObjectRelease();
              v5 = 14;
            }
            else
            {
              v11 = v4 == 0x6E65657263536E4FLL && v3 == 0xEC000000656D6F48;
              if (v11 || (OUTLINED_FUNCTION_57_5(), (OUTLINED_FUNCTION_0_0() & 1) != 0))
              {
                swift_bridgeObjectRelease();
                v5 = 15;
              }
              else if (v4 == 0xD000000000000014 && (OUTLINED_FUNCTION_6_5((uint64_t)"OnScreenNotification"), v2)
                     || (OUTLINED_FUNCTION_0_0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v5 = 16;
              }
              else if (v4 == 0xD000000000000010 && (OUTLINED_FUNCTION_6_5((uint64_t)"OnScreenDateTime"), v2)
                     || (OUTLINED_FUNCTION_0_0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v5 = 17;
              }
              else if (v4 == 0xD000000000000016 && (OUTLINED_FUNCTION_6_5((uint64_t)"ConversationalReminder"), v2)
                     || (OUTLINED_FUNCTION_0_0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v5 = 18;
              }
              else if (v4 == 0xD00000000000001BLL
                     && (OUTLINED_FUNCTION_6_5((uint64_t)"ConversationalCalendarevent"), v2)
                     || (OUTLINED_FUNCTION_0_0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v5 = 19;
              }
              else if (v4 == 0xD000000000000014 && (OUTLINED_FUNCTION_6_5((uint64_t)"ConversationalPeople"), v2)
                     || (OUTLINED_FUNCTION_0_0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v5 = 20;
              }
              else if (v4 == 0xD000000000000014 && (OUTLINED_FUNCTION_6_5((uint64_t)"ConversationalPlaces"), v2)
                     || (OUTLINED_FUNCTION_0_0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v5 = 21;
              }
              else if (v4 == 0xD000000000000013 && (OUTLINED_FUNCTION_6_5((uint64_t)"ConversationalAlarm"), v2)
                     || (OUTLINED_FUNCTION_0_0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v5 = 22;
              }
              else if (v4 == 0xD000000000000013 && (OUTLINED_FUNCTION_6_5((uint64_t)"ConversationalTimer"), v2)
                     || (OUTLINED_FUNCTION_0_0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v5 = 23;
              }
              else if (v4 == 0xD000000000000013 && (OUTLINED_FUNCTION_6_5((uint64_t)"NowPlayingMediaItem"), v2)
                     || (OUTLINED_FUNCTION_0_0() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v5 = 24;
              }
              else if (v4 == 0xD000000000000012 && (OUTLINED_FUNCTION_6_5((uint64_t)"SiriRequestContext"), v2))
              {
                swift_bridgeObjectRelease();
                v5 = 25;
              }
              else
              {
                OUTLINED_FUNCTION_0_0();
                OUTLINED_FUNCTION_13_10();
                v5 = 25;
                if ((v4 & 1) == 0)
                  v5 = 0;
              }
            }
          }
        }
      }
    }
  }
  OUTLINED_FUNCTION_9_8(v5);
  OUTLINED_FUNCTION_7();
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.init(rawValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 - 1;
  v3 = 0;
  switch(v2)
  {
    case 1:
      v3 = 1;
      break;
    case 2:
      v3 = 2;
      break;
    case 3:
      v3 = 3;
      break;
    case 4:
      v3 = 4;
      break;
    case 5:
      v3 = 5;
      break;
    case 6:
      v3 = 6;
      break;
    case 7:
      v3 = 7;
      break;
    case 8:
      v3 = 8;
      break;
    default:
      return OUTLINED_FUNCTION_23_4(v3, a2);
  }
  return OUTLINED_FUNCTION_23_4(v3, a2);
}

void static IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.allCases.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  uint64_t v56;
  char *v57;
  char v58;
  uint64_t v59;
  char *v60;
  char v61;
  uint64_t v62;
  char *v63;
  char v64;
  uint64_t v65;
  char *v66;
  char v67;
  uint64_t v68;
  char *v69;
  char v70;
  uint64_t v71;
  char *v72;
  char v73;
  uint64_t v74;
  char *v75;
  char v76;
  uint64_t v77;
  char *v78;
  char v79;
  uint64_t v80;
  char *v81;
  char v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;

  OUTLINED_FUNCTION_2_5(0, 1, a3, MEMORY[0x24BEE4AF8], &qword_256F91EB8);
  OUTLINED_FUNCTION_28_5();
  if (!(!v12 & v11))
  {
    v55 = OUTLINED_FUNCTION_3_15(v10);
    OUTLINED_FUNCTION_2_5(v55, v3, v56, v57, &qword_256F91EB8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_20_7(v6, v7, v8, v9);
  if (!(!v12 & v11))
  {
    v58 = OUTLINED_FUNCTION_3_15(v17);
    OUTLINED_FUNCTION_2_5(v58, v4, v59, v60, &qword_256F91EB8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_18_6(v13, v14, v15, v16);
  if (!(!v12 & v11))
  {
    v61 = OUTLINED_FUNCTION_3_15(v22);
    OUTLINED_FUNCTION_2_5(v61, v5, v62, v63, &qword_256F91EB8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_21_5(v18, v19, v20, v21);
  if (!(!v12 & v11))
  {
    v64 = OUTLINED_FUNCTION_3_15(v27);
    OUTLINED_FUNCTION_2_5(v64, v3, v65, v66, &qword_256F91EB8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_12_0(v23, v24, v25, v26);
  if (!(!v12 & v11))
  {
    v67 = OUTLINED_FUNCTION_3_15(v32);
    OUTLINED_FUNCTION_2_5(v67, v4, v68, v69, &qword_256F91EB8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_17_8(v28, v29, v30, v31);
  if (!(!v12 & v11))
  {
    v70 = OUTLINED_FUNCTION_3_15(v37);
    OUTLINED_FUNCTION_2_5(v70, v3, v71, v72, &qword_256F91EB8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_14_11(v33, v34, v35, v36);
  if (!(!v12 & v11))
  {
    v73 = OUTLINED_FUNCTION_3_15(v42);
    OUTLINED_FUNCTION_2_5(v73, v4, v74, v75, &qword_256F91EB8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_16_9(v38, v39, v40, v41);
  if (!(!v12 & v11))
  {
    v76 = OUTLINED_FUNCTION_3_15(v47);
    OUTLINED_FUNCTION_2_5(v76, v3, v77, v78, &qword_256F91EB8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_15_6(v43, v44, v45, v46);
  if (!(!v12 & v11))
  {
    v79 = OUTLINED_FUNCTION_3_15(v52);
    OUTLINED_FUNCTION_2_5(v79, v4, v80, v81, &qword_256F91EB8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_22_6(v48, v49, v50, v51);
  if (!(!v12 & v11))
  {
    v82 = OUTLINED_FUNCTION_3_15(v54);
    OUTLINED_FUNCTION_2_5(v82, v3, v83, v84, &qword_256F91EB8);
    v53 = v85;
  }
  *(_QWORD *)(v53 + 16) = v3;
  OUTLINED_FUNCTION_41_1(v53, v53 + 16 * v4);
  OUTLINED_FUNCTION_9();
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.description.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8) == 1)
    return ((uint64_t (*)(uint64_t, unint64_t))((char *)&loc_23FEF4A70
                                                              + 4 * byte_23FF6F88E[*(_QWORD *)v0]))(0x6C6F437475706E49, 0xEF6E6F697463656CLL);
  else
    return OUTLINED_FUNCTION_5_15();
}

unint64_t sub_23FEF4A80()
{
  return OUTLINED_FUNCTION_62(16);
}

void sub_23FEF4A98()
{
  OUTLINED_FUNCTION_71();
}

uint64_t sub_23FEF4AD4()
{
  return 0x676E696B6E6152;
}

uint64_t sub_23FEF4AEC()
{
  return 0x697542656C707554;
}

uint64_t sub_23FEF4B10()
{
  return 0x6E6152656C707554;
}

uint64_t sub_23FEF4B30()
{
  return 0x754274757074754FLL;
}

void IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v9;
  BOOL v10;
  BOOL v11;

  OUTLINED_FUNCTION_4_1();
  v2 = v2 && v1 == 0xE700000000000000;
  if (v2 || (v3 = v1, v4 = v0, (OUTLINED_FUNCTION_0_0() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_33_2();
    goto LABEL_13;
  }
  v6 = v4 == 0x6C6F437475706E49 && v3 == 0xEF6E6F697463656CLL;
  if (v6 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 0;
    goto LABEL_13;
  }
  if (v4 == 0x727465526E617053 && v3 == 0xED00006C61766569)
  {
    OUTLINED_FUNCTION_67_9();
LABEL_21:
    swift_bridgeObjectRelease();
    v5 = 1;
    goto LABEL_13;
  }
  if ((OUTLINED_FUNCTION_0_0() & 1) != 0)
    goto LABEL_21;
  if (v4 == 0xD000000000000010 && (OUTLINED_FUNCTION_6_5((uint64_t)"ContextRetrieval"), v2)
    || (OUTLINED_FUNCTION_0_0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_32_2();
    goto LABEL_13;
  }
  if (v4 == 0xD000000000000014 && (OUTLINED_FUNCTION_7_9(), v2) || (OUTLINED_FUNCTION_0_0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_44();
    goto LABEL_13;
  }
  if (v4 == 0x727465526C6F6F54 && v3 == 0xED00006C61766569)
  {
    OUTLINED_FUNCTION_67_9();
LABEL_39:
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_59_0();
    goto LABEL_13;
  }
  if ((OUTLINED_FUNCTION_0_0() & 1) != 0)
    goto LABEL_39;
  v9 = v4 == 0x676E696B6E6152 && v3 == 0xE700000000000000;
  if (v9 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_66();
  }
  else
  {
    v10 = v4 == 0x697542656C707554 && v3 == 0xED0000676E69646CLL;
    if (v10 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v5 = 6;
    }
    else
    {
      v11 = v4 == 0x6E6152656C707554 && v3 == 0xEC000000676E696BLL;
      if (v11 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v5 = 7;
      }
      else if (v4 == 0x754274757074754FLL && v3 == 0xEE00676E69646C69)
      {
        swift_bridgeObjectRelease();
        v5 = 8;
      }
      else
      {
        OUTLINED_FUNCTION_0_0();
        OUTLINED_FUNCTION_13_10();
        v5 = 8;
        if ((v4 & 1) == 0)
          v5 = 0;
      }
    }
  }
LABEL_13:
  OUTLINED_FUNCTION_9_8(v5);
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.init(rawValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  if (result == 2)
    v2 = 1;
  else
    v2 = result;
  if (result == 1)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  v3 = result == 1 || result == 2;
  *(_BYTE *)(a2 + 8) = v3;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 1;
  if (*(_QWORD *)v0)
    v1 = 2;
  if (v0[8])
    return v1;
  else
    return *(_QWORD *)v0;
}

void static IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.allCases.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char *v15;
  char v16;
  uint64_t v17;
  char *v18;
  char v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;

  OUTLINED_FUNCTION_2_5(0, 1, a3, MEMORY[0x24BEE4AF8], &qword_256F91EB0);
  v4 = v3;
  v6 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  v7 = v5 >> 1;
  v8 = v6 + 1;
  if (v5 >> 1 <= v6)
  {
    v13 = OUTLINED_FUNCTION_3_15(v5);
    OUTLINED_FUNCTION_2_5(v13, v6 + 1, v14, v15, &qword_256F91EB0);
    OUTLINED_FUNCTION_1_8();
  }
  *(_QWORD *)(v4 + 16) = v8;
  v9 = v4 + 16 * v6;
  *(_QWORD *)(v9 + 32) = 0;
  *(_BYTE *)(v9 + 40) = 0;
  v10 = v6 + 2;
  if (v7 <= v8)
  {
    v16 = OUTLINED_FUNCTION_3_15(v5);
    OUTLINED_FUNCTION_2_5(v16, v6 + 2, v17, v18, &qword_256F91EB0);
    OUTLINED_FUNCTION_1_8();
  }
  *(_QWORD *)(v4 + 16) = v10;
  v11 = v4 + 16 * v8;
  *(_QWORD *)(v11 + 32) = 0;
  *(_BYTE *)(v11 + 40) = 1;
  if (v7 <= v10)
  {
    v19 = OUTLINED_FUNCTION_3_15(v5);
    OUTLINED_FUNCTION_2_5(v19, v6 + 3, v20, v21, &qword_256F91EB0);
    v4 = v22;
  }
  *(_QWORD *)(v4 + 16) = v6 + 3;
  v12 = v4 + 16 * v10;
  *(_QWORD *)(v12 + 32) = 1;
  *(_BYTE *)(v12 + 40) = 1;
  OUTLINED_FUNCTION_9();
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.description.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8) != 1)
    return OUTLINED_FUNCTION_5_15();
  if (*(_QWORD *)v0)
    return 0xD000000000000013;
  return 0xD000000000000011;
}

void IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  OUTLINED_FUNCTION_4_1();
  v3 = v3 && v2 == 0xE700000000000000;
  if (v3 || (v4 = v1, (OUTLINED_FUNCTION_0_0() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    v5 = 0;
    v6 = 0;
  }
  else if (v4 == 0xD000000000000011 && (OUTLINED_FUNCTION_6_5((uint64_t)"SiriEntityMatcher"), v3)
         || (OUTLINED_FUNCTION_0_0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 0;
    v6 = 1;
  }
  else if (v4 == 0xD000000000000013 && (OUTLINED_FUNCTION_7_9(), v3))
  {
    swift_bridgeObjectRelease();
    v5 = 1;
    v6 = 1;
  }
  else
  {
    v6 = OUTLINED_FUNCTION_0_0();
    swift_bridgeObjectRelease();
    v5 = v6 & 1;
  }
  *(_QWORD *)v0 = v5;
  *(_BYTE *)(v0 + 8) = v6 & 1;
  *(_BYTE *)(v0 + 9) = 0;
  OUTLINED_FUNCTION_9();
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform.init(rawValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 - 1;
  v3 = 0;
  switch(v2)
  {
    case 1:
      v3 = 1;
      break;
    case 2:
      v3 = 2;
      break;
    case 3:
      v3 = 3;
      break;
    case 4:
      v3 = 4;
      break;
    case 5:
      v3 = 5;
      break;
    case 6:
      v3 = 6;
      break;
    default:
      return OUTLINED_FUNCTION_23_4(v3, a2);
  }
  return OUTLINED_FUNCTION_23_4(v3, a2);
}

void static IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform.allCases.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  char *v47;
  char v48;
  uint64_t v49;
  char *v50;
  char v51;
  uint64_t v52;
  char *v53;
  char v54;
  uint64_t v55;
  char *v56;
  char v57;
  uint64_t v58;
  char *v59;
  char v60;
  uint64_t v61;
  char *v62;
  char v63;
  uint64_t v64;
  char *v65;
  char v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;

  OUTLINED_FUNCTION_2_5(0, 1, a3, MEMORY[0x24BEE4AF8], &qword_256F91EA8);
  OUTLINED_FUNCTION_28_5();
  if (!(!v12 & v11))
  {
    v45 = OUTLINED_FUNCTION_3_15(v10);
    OUTLINED_FUNCTION_2_5(v45, v3, v46, v47, &qword_256F91EA8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_20_7(v6, v7, v8, v9);
  if (!(!v12 & v11))
  {
    v48 = OUTLINED_FUNCTION_3_15(v17);
    OUTLINED_FUNCTION_2_5(v48, v4, v49, v50, &qword_256F91EA8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_18_6(v13, v14, v15, v16);
  if (!(!v12 & v11))
  {
    v51 = OUTLINED_FUNCTION_3_15(v22);
    OUTLINED_FUNCTION_2_5(v51, v5, v52, v53, &qword_256F91EA8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_21_5(v18, v19, v20, v21);
  if (!(!v12 & v11))
  {
    v54 = OUTLINED_FUNCTION_3_15(v27);
    OUTLINED_FUNCTION_2_5(v54, v3, v55, v56, &qword_256F91EA8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_12_0(v23, v24, v25, v26);
  if (!(!v12 & v11))
  {
    v57 = OUTLINED_FUNCTION_3_15(v32);
    OUTLINED_FUNCTION_2_5(v57, v4, v58, v59, &qword_256F91EA8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_17_8(v28, v29, v30, v31);
  if (!(!v12 & v11))
  {
    v60 = OUTLINED_FUNCTION_3_15(v37);
    OUTLINED_FUNCTION_2_5(v60, v3, v61, v62, &qword_256F91EA8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_14_11(v33, v34, v35, v36);
  if (!(!v12 & v11))
  {
    v63 = OUTLINED_FUNCTION_3_15(v42);
    OUTLINED_FUNCTION_2_5(v63, v4, v64, v65, &qword_256F91EA8);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_16_9(v38, v39, v40, v41);
  if (!(!v12 & v11))
  {
    v66 = OUTLINED_FUNCTION_3_15(v44);
    OUTLINED_FUNCTION_2_5(v66, v3, v67, v68, &qword_256F91EA8);
    v43 = v69;
  }
  *(_QWORD *)(v43 + 16) = v3;
  OUTLINED_FUNCTION_41_1(v43, v43 + 16 * v4);
  OUTLINED_FUNCTION_9();
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform.description.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8) == 1)
    return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FEF5414 + 4
                                                                                      * byte_23FF6F89E[*(_QWORD *)v0]))(0x69746E45656D6F48, 0xEA00000000007974);
  else
    return OUTLINED_FUNCTION_5_15();
}

uint64_t sub_23FEF5414()
{
  return 0x6D796E6F6E7953;
}

uint64_t sub_23FEF5430()
{
  return 0x74696C736E617254;
}

uint64_t sub_23FEF5454()
{
  return 0x6465646E61707845;
}

void sub_23FEF5478()
{
  OUTLINED_FUNCTION_71();
}

unint64_t sub_23FEF5490()
{
  return OUTLINED_FUNCTION_62(17);
}

uint64_t sub_23FEF54A8()
{
  return 0x48746361746E6F43;
}

void IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v2 && v1 == 0xE700000000000000;
  if (v2 || (v3 = v1, v4 = v0, (OUTLINED_FUNCTION_0_0() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_33_2();
  }
  else
  {
    v6 = v4 == 0x69746E45656D6F48 && v3 == 0xEA00000000007974;
    if (v6 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v5 = 0;
    }
    else
    {
      v7 = v4 == 0x6D796E6F6E7953 && v3 == 0xE700000000000000;
      if (v7 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v5 = 1;
      }
      else
      {
        v8 = v4 == 0x74696C736E617254 && v3 == 0xEF6E6F6974617265;
        if (v8 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_32_2();
        }
        else
        {
          v9 = v4 == 0x6465646E61707845 && v3 == 0xED0000696A6F6D45;
          if (v9 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_44();
          }
          else if (v4 == 0xD000000000000013 && (OUTLINED_FUNCTION_6_5((uint64_t)"ContactRelationship"), v2)
                 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_59_0();
          }
          else if (v4 == 0xD000000000000011 && (OUTLINED_FUNCTION_6_5((uint64_t)"ContactHypocorism"), v2)
                 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_66();
          }
          else if (v4 == 0x48746361746E6F43 && v3 == 0xED0000656C646E61)
          {
            swift_bridgeObjectRelease();
            v5 = 6;
          }
          else
          {
            OUTLINED_FUNCTION_0_0();
            OUTLINED_FUNCTION_13_10();
            v5 = 6;
            if ((v4 & 1) == 0)
              v5 = 0;
          }
        }
      }
    }
  }
  OUTLINED_FUNCTION_9_8(v5);
  OUTLINED_FUNCTION_9();
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass.init(rawValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 - 1;
  v3 = 0;
  switch(v2)
  {
    case 1:
      v3 = 1;
      break;
    case 2:
      v3 = 2;
      break;
    case 3:
      v3 = 3;
      break;
    case 4:
      v3 = 4;
      break;
    case 5:
      v3 = 5;
      break;
    default:
      return OUTLINED_FUNCTION_23_4(v3, a2);
  }
  return OUTLINED_FUNCTION_23_4(v3, a2);
}

void static IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass.allCases.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char *v43;
  char v44;
  uint64_t v45;
  char *v46;
  char v47;
  uint64_t v48;
  char *v49;
  char v50;
  uint64_t v51;
  char *v52;
  char v53;
  uint64_t v54;
  char *v55;
  char v56;
  uint64_t v57;
  char *v58;
  char v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;

  OUTLINED_FUNCTION_2_5(0, 1, a3, MEMORY[0x24BEE4AF8], &qword_256F91EA0);
  OUTLINED_FUNCTION_28_5();
  if (!(!v12 & v11))
  {
    v41 = OUTLINED_FUNCTION_3_15(v10);
    OUTLINED_FUNCTION_2_5(v41, v3, v42, v43, &qword_256F91EA0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_20_7(v6, v7, v8, v9);
  if (!(!v12 & v11))
  {
    v44 = OUTLINED_FUNCTION_3_15(v17);
    OUTLINED_FUNCTION_2_5(v44, v4, v45, v46, &qword_256F91EA0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_18_6(v13, v14, v15, v16);
  if (!(!v12 & v11))
  {
    v47 = OUTLINED_FUNCTION_3_15(v22);
    OUTLINED_FUNCTION_2_5(v47, v5, v48, v49, &qword_256F91EA0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_21_5(v18, v19, v20, v21);
  if (!(!v12 & v11))
  {
    v50 = OUTLINED_FUNCTION_3_15(v27);
    OUTLINED_FUNCTION_2_5(v50, v3, v51, v52, &qword_256F91EA0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_12_0(v23, v24, v25, v26);
  if (!(!v12 & v11))
  {
    v53 = OUTLINED_FUNCTION_3_15(v32);
    OUTLINED_FUNCTION_2_5(v53, v4, v54, v55, &qword_256F91EA0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_17_8(v28, v29, v30, v31);
  if (!(!v12 & v11))
  {
    v56 = OUTLINED_FUNCTION_3_15(v37);
    OUTLINED_FUNCTION_2_5(v56, v3, v57, v58, &qword_256F91EA0);
    OUTLINED_FUNCTION_1_8();
  }
  OUTLINED_FUNCTION_14_11(v33, v34, v35, v36);
  if (!(!v12 & v11))
  {
    v59 = OUTLINED_FUNCTION_3_15(v39);
    OUTLINED_FUNCTION_2_5(v59, v4, v60, v61, &qword_256F91EA0);
    v38 = v62;
  }
  *(_QWORD *)(v38 + 16) = v4;
  v40 = v38 + 16 * v3;
  *(_QWORD *)(v40 + 32) = 5;
  *(_BYTE *)(v40 + 40) = v5;
  OUTLINED_FUNCTION_9();
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass.description.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8) == 1)
    return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FEF59C0 + 4
                                                                                      * byte_23FF6F8AB[*(_QWORD *)v0]))(65, 0xE100000000000000);
  else
    return OUTLINED_FUNCTION_5_15();
}

uint64_t sub_23FEF59C0()
{
  return 66;
}

uint64_t sub_23FEF59CC()
{
  return 67;
}

uint64_t sub_23FEF59D4()
{
  return 68;
}

uint64_t sub_23FEF59DC()
{
  return 69;
}

uint64_t sub_23FEF59E4()
{
  return 70;
}

void IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;

  OUTLINED_FUNCTION_4_1();
  v2 = v2 && v1 == 0xE700000000000000;
  if (v2 || (v3 = v1, v4 = v0, (OUTLINED_FUNCTION_0_0() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_33_2();
  }
  else
  {
    v6 = v4 == 65 && v3 == 0xE100000000000000;
    if (v6 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v5 = 0;
    }
    else
    {
      v7 = v4 == 66 && v3 == 0xE100000000000000;
      if (v7 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v5 = 1;
      }
      else
      {
        v8 = v4 == 67 && v3 == 0xE100000000000000;
        if (v8 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_32_2();
        }
        else
        {
          v9 = v4 == 68 && v3 == 0xE100000000000000;
          if (v9 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_44();
          }
          else
          {
            v10 = v4 == 69 && v3 == 0xE100000000000000;
            if (v10 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              OUTLINED_FUNCTION_59_0();
            }
            else if (v4 == 70 && v3 == 0xE100000000000000)
            {
              swift_bridgeObjectRelease();
              OUTLINED_FUNCTION_66();
            }
            else
            {
              OUTLINED_FUNCTION_0_0();
              OUTLINED_FUNCTION_13_10();
              v5 = 5;
              if ((v4 & 1) == 0)
                v5 = 0;
            }
          }
        }
      }
    }
  }
  OUTLINED_FUNCTION_9_8(v5);
  OUTLINED_FUNCTION_9();
}

uint64_t _s27IntelligencePlatformLibrary0A28FlowQueryDecorationTelemetryV13QDToolSubTypeO8rawValueAESgSi_tcfC_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 - 1;
  v3 = 0;
  switch(v2)
  {
    case 1:
      v3 = 1;
      break;
    case 2:
      v3 = 2;
      break;
    case 3:
      v3 = 3;
      break;
    case 4:
      v3 = 4;
      break;
    default:
      return OUTLINED_FUNCTION_23_4(v3, a2);
  }
  return OUTLINED_FUNCTION_23_4(v3, a2);
}

uint64_t static IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria.allCases.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23FEF5C08((uint64_t)&unk_256F91E98, a2, a3);
}

uint64_t sub_23FEF5C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v20;

  OUTLINED_FUNCTION_8_2(0, 1, a3, MEMORY[0x24BEE4AF8]);
  v5 = v3;
  v7 = *(_QWORD *)(v3 + 16);
  v6 = *(_QWORD *)(v3 + 24);
  v8 = v6 >> 1;
  v9 = v7 + 1;
  if (v6 >> 1 <= v7)
  {
    OUTLINED_FUNCTION_8_2(v6 > 1, v7 + 1, v4, (char *)v3);
    OUTLINED_FUNCTION_1_8();
  }
  *(_QWORD *)(v5 + 16) = v9;
  v10 = v5 + 16 * v7;
  *(_QWORD *)(v10 + 32) = 0;
  *(_BYTE *)(v10 + 40) = 0;
  v11 = v7 + 2;
  if (v8 <= v9)
  {
    OUTLINED_FUNCTION_8_2(v6 > 1, v7 + 2, v4, (char *)v5);
    OUTLINED_FUNCTION_1_8();
  }
  *(_QWORD *)(v5 + 16) = v11;
  v12 = v5 + 16 * v9;
  *(_QWORD *)(v12 + 32) = 0;
  *(_BYTE *)(v12 + 40) = 1;
  v13 = v7 + 3;
  if (v8 <= v11)
  {
    OUTLINED_FUNCTION_8_2(v6 > 1, v7 + 3, v4, (char *)v5);
    OUTLINED_FUNCTION_1_8();
  }
  *(_QWORD *)(v5 + 16) = v13;
  v14 = v5 + 16 * v11;
  *(_QWORD *)(v14 + 32) = 1;
  *(_BYTE *)(v14 + 40) = 1;
  v15 = v7 + 4;
  if (v8 <= v13)
  {
    OUTLINED_FUNCTION_8_2(v6 > 1, v7 + 4, v4, (char *)v5);
    OUTLINED_FUNCTION_1_8();
  }
  *(_QWORD *)(v5 + 16) = v15;
  v16 = v5 + 16 * v13;
  *(_QWORD *)(v16 + 32) = 2;
  *(_BYTE *)(v16 + 40) = 1;
  v17 = v7 + 5;
  if (v8 <= v15)
  {
    OUTLINED_FUNCTION_8_2(v6 > 1, v7 + 5, v4, (char *)v5);
    OUTLINED_FUNCTION_1_8();
  }
  *(_QWORD *)(v5 + 16) = v17;
  v18 = v5 + 16 * v15;
  *(_QWORD *)(v18 + 32) = 3;
  *(_BYTE *)(v18 + 40) = 1;
  if (v8 <= v17)
  {
    OUTLINED_FUNCTION_8_2(v6 > 1, v7 + 6, v4, (char *)v5);
    v5 = v20;
  }
  *(_QWORD *)(v5 + 16) = v7 + 6;
  return OUTLINED_FUNCTION_41_1(v5, v5 + 16 * v17);
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria.description.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8) == 1)
    return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23FEF5DE0 + 4
                                                                                      * byte_23FF6F8B6[*(_QWORD *)v0]))(0x656E4F6567617453, 0xEC0000004E706F54);
  else
    return OUTLINED_FUNCTION_5_15();
}

uint64_t sub_23FEF5DE0()
{
  return 0x6F77546567617453;
}

uint64_t sub_23FEF5DF8()
{
  return 0x7268546567617453;
}

uint64_t sub_23FEF5E1C()
{
  return 0x756F466567617453;
}

unint64_t sub_23FEF5E40()
{
  return 0xD000000000000013;
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;

  OUTLINED_FUNCTION_4_1();
  v2 = v2 && v1 == 0xE700000000000000;
  if (v2 || (v3 = v1, v4 = v0, (OUTLINED_FUNCTION_0_0() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_33_2();
  }
  else
  {
    v6 = v4 == 0x656E4F6567617453 && v3 == 0xEC0000004E706F54;
    if (v6 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v5 = 0;
    }
    else
    {
      v7 = v4 == 0x6F77546567617453 && v3 == 0xEC0000004E706F54;
      if (v7 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v5 = 1;
      }
      else
      {
        v8 = v4 == 0x7268546567617453 && v3 == 0xEE004E706F546565;
        if (v8 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_32_2();
        }
        else
        {
          v9 = v4 == 0x756F466567617453 && v3 == 0xED00004E706F5472;
          if (v9 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_44();
          }
          else if (v4 == 0xD000000000000013 && (OUTLINED_FUNCTION_6_5((uint64_t)"RankedToolTupleTopN"), v2))
          {
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_59_0();
          }
          else
          {
            OUTLINED_FUNCTION_0_0();
            OUTLINED_FUNCTION_13_10();
            v5 = 4;
            if ((v4 & 1) == 0)
              v5 = 0;
          }
        }
      }
    }
  }
  OUTLINED_FUNCTION_9_8(v5);
  OUTLINED_FUNCTION_9();
}

uint64_t static IntelligenceFlowQueryDecorationTelemetry.QDCollectionContext.== infix(_:_:)(uint64_t *a1, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  int v10;
  int v11;
  char v12;
  __int128 v14;
  int v15;
  char v16;
  __int128 v17;
  int v18;
  char v19;

  v2 = *a1;
  v3 = *a2;
  v4 = (unint64_t)*a1 >> 62;
  if ((_DWORD)v4)
  {
    if ((_DWORD)v4 == 1)
    {
      if (v3 >> 62 == 1)
      {
        v5 = *(_BYTE *)(v3 + 16);
        LOBYTE(v17) = *(_BYTE *)(v2 + 16);
        LOBYTE(v14) = v5;
        swift_retain();
        OUTLINED_FUNCTION_19_5();
        v6 = static IntelligenceFlowQueryDecorationTelemetry.QDCollectionCompleted.== infix(_:_:)(&v17, &v14);
LABEL_9:
        v8 = v6;
        goto LABEL_10;
      }
    }
    else if (v3 >> 62 == 2)
    {
      v9 = *(_BYTE *)(v2 + 36);
      v10 = *(_DWORD *)(v2 + 32);
      v11 = *(_DWORD *)(v3 + 32);
      v12 = *(_BYTE *)(v3 + 36);
      v17 = *(_OWORD *)(v2 + 16);
      v18 = v10;
      v19 = v9;
      v14 = *(_OWORD *)(v3 + 16);
      v15 = v11;
      v16 = v12;
      swift_retain();
      OUTLINED_FUNCTION_19_5();
      v6 = static IntelligenceFlowQueryDecorationTelemetry.QDCollectionFailed.== infix(_:_:)(&v17, &v14);
      goto LABEL_9;
    }
LABEL_11:
    v8 = 0;
    return v8 & 1;
  }
  if (v3 >> 62)
    goto LABEL_11;
  v7 = *(_BYTE *)(v3 + 16);
  LOBYTE(v17) = *(_BYTE *)(v2 + 16);
  LOBYTE(v14) = v7;
  OUTLINED_FUNCTION_19_5();
  swift_retain();
  v8 = static IntelligenceFlowQueryDecorationTelemetry.QDCollectionStarted.== infix(_:_:)(&v17, &v14);
LABEL_10:
  swift_release();
  swift_release();
  return v8 & 1;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDCollectionContext.hash(into:)()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *v0 >> 62;
  if ((_DWORD)v1)
  {
    if ((_DWORD)v1 == 1)
      sub_23FEF62F8();
    else
      sub_23FEF62BC();
  }
  else
  {
    sub_23FEF6334();
  }
  return sub_23FF58FAC();
}

unint64_t sub_23FEF62BC()
{
  unint64_t result;

  result = qword_256F91E48;
  if (!qword_256F91E48)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDCollectionFailed, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDCollectionFailed);
    atomic_store(result, (unint64_t *)&qword_256F91E48);
  }
  return result;
}

unint64_t sub_23FEF62F8()
{
  unint64_t result;

  result = qword_256F91E50;
  if (!qword_256F91E50)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDCollectionCompleted, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDCollectionCompleted);
    atomic_store(result, (unint64_t *)&qword_256F91E50);
  }
  return result;
}

unint64_t sub_23FEF6334()
{
  unint64_t result;

  result = qword_256F91E58;
  if (!qword_256F91E58)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDCollectionStarted, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDCollectionStarted);
    atomic_store(result, (unint64_t *)&qword_256F91E58);
  }
  return result;
}

unint64_t sub_23FEF6374()
{
  unint64_t result;

  result = qword_256F91E60;
  if (!qword_256F91E60)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDToolSubType, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDToolSubType);
    atomic_store(result, (unint64_t *)&qword_256F91E60);
  }
  return result;
}

unint64_t sub_23FEF63B4()
{
  unint64_t result;

  result = qword_256F91E68;
  if (!qword_256F91E68)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType);
    atomic_store(result, (unint64_t *)&qword_256F91E68);
  }
  return result;
}

unint64_t sub_23FEF63F4()
{
  unint64_t result;

  result = qword_256F91E70;
  if (!qword_256F91E70)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponent, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDSubComponent);
    atomic_store(result, (unint64_t *)&qword_256F91E70);
  }
  return result;
}

unint64_t sub_23FEF6434()
{
  unint64_t result;

  result = qword_256F91E78;
  if (!qword_256F91E78)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType);
    atomic_store(result, (unint64_t *)&qword_256F91E78);
  }
  return result;
}

unint64_t sub_23FEF6474()
{
  unint64_t result;

  result = qword_256F91E80;
  if (!qword_256F91E80)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform);
    atomic_store(result, (unint64_t *)&qword_256F91E80);
  }
  return result;
}

unint64_t sub_23FEF64B4()
{
  unint64_t result;

  result = qword_256F91E88;
  if (!qword_256F91E88)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass);
    atomic_store(result, (unint64_t *)&qword_256F91E88);
  }
  return result;
}

unint64_t sub_23FEF64F4()
{
  unint64_t result;

  result = qword_256F91E90;
  if (!qword_256F91E90)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria);
    atomic_store(result, (unint64_t *)&qword_256F91E90);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_35_18()
{
  return sub_23FF58FAC();
}

uint64_t OUTLINED_FUNCTION_41_11()
{
  uint64_t v0;

  return v0 - 120;
}

uint64_t OUTLINED_FUNCTION_48_12()
{
  uint64_t v0;

  return sub_23FEF2BA4(v0);
}

uint64_t OUTLINED_FUNCTION_49_6()
{
  uint64_t v0;

  return sub_23FEF1994(v0);
}

uint64_t OUTLINED_FUNCTION_54_10()
{
  uint64_t v0;

  return sub_23FEF2BF0(v0);
}

uint64_t OUTLINED_FUNCTION_55_6()
{
  uint64_t v0;

  return sub_23FEF19E0(v0);
}

uint64_t OUTLINED_FUNCTION_57_5()
{
  return 0x6E65657263536E4FLL;
}

void OUTLINED_FUNCTION_58_10(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23FE5D46C(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_65_6()
{
  uint64_t v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_67_9()
{
  return 0xED00006C61766569;
}

uint64_t OUTLINED_FUNCTION_69_9()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall(0);
}

uint64_t OUTLINED_FUNCTION_70_8()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation(0);
}

uint64_t OUTLINED_FUNCTION_73_8()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(0);
}

uint64_t OUTLINED_FUNCTION_74_9()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(0);
}

void sub_23FEF6614()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;

  OUTLINED_FUNCTION_31_3();
  v3 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v3);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  OUTLINED_FUNCTION_108_3();
  v5 = OUTLINED_FUNCTION_18_7();
  *(_OWORD *)(v5 + 16) = xmmword_23FF60490;
  v6 = v5 + v0 + *(int *)(v4 + 48);
  OUTLINED_FUNCTION_72_0();
  OUTLINED_FUNCTION_71_0((uint64_t)"eventMetadata");
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_1_9(v6);
  v7 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v7 = "monotonicTimestamp";
  *(_QWORD *)(v7 + 8) = 18;
  *(_BYTE *)(v7 + 16) = v2;
  OUTLINED_FUNCTION_1_9(v7);
  v8 = OUTLINED_FUNCTION_102_6();
  *v9 = 50;
  *(_QWORD *)v8 = "invocation";
  *(_QWORD *)(v8 + 8) = 10;
  *(_BYTE *)(v8 + 16) = v2;
  OUTLINED_FUNCTION_1_9(v8);
  v10 = OUTLINED_FUNCTION_5_11(v5 + v0 + 3 * v1);
  *v11 = 51;
  *(_QWORD *)v10 = "jointResolverCall";
  *(_QWORD *)(v10 + 8) = 17;
  *(_BYTE *)(v10 + 16) = v2;
  OUTLINED_FUNCTION_1_9(v10);
  v12 = OUTLINED_FUNCTION_5_11(v5 + v0 + 4 * v1);
  *v13 = 100;
  *(_QWORD *)v12 = "collectionContext";
  *(_QWORD *)(v12 + 8) = 17;
  *(_BYTE *)(v12 + 16) = v2;
  OUTLINED_FUNCTION_1_9(v12);
  v14 = OUTLINED_FUNCTION_5_11(v5 + v0 + 5 * v1);
  *v15 = 101;
  *(_QWORD *)v14 = "entitiesCollected";
  *(_QWORD *)(v14 + 8) = 17;
  *(_BYTE *)(v14 + 16) = v2;
  OUTLINED_FUNCTION_1_9(v14);
  v16 = OUTLINED_FUNCTION_5_11(v5 + v0 + 6 * v1);
  *v17 = 102;
  *(_QWORD *)v16 = "tuplesGenerated";
  *(_QWORD *)(v16 + 8) = 15;
  *(_BYTE *)(v16 + 16) = v2;
  OUTLINED_FUNCTION_1_9(v16);
  v18 = OUTLINED_FUNCTION_5_11(v5 + v0 + 7 * v1);
  *v19 = 103;
  *(_QWORD *)v18 = "entitiesRanked";
  *(_QWORD *)(v18 + 8) = 14;
  *(_BYTE *)(v18 + 16) = v2;
  OUTLINED_FUNCTION_1_9(v18);
  v20 = OUTLINED_FUNCTION_5_11(v5 + v0 + 8 * v1);
  *v21 = 104;
  *(_QWORD *)v20 = "subComponentContext";
  *(_QWORD *)(v20 + 8) = 19;
  *(_BYTE *)(v20 + 16) = v2;
  OUTLINED_FUNCTION_1_9(v20);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEF680C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_20();
  v1 = OUTLINED_FUNCTION_16_3();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(v1)
      {
        case 'd':
          v3 = OUTLINED_FUNCTION_6_28();
          OUTLINED_FUNCTION_134_5(*(int *)(v3 + 44));
          goto LABEL_18;
        case 'e':
          v5 = OUTLINED_FUNCTION_6_28();
          OUTLINED_FUNCTION_134_5(*(int *)(v5 + 48));
          goto LABEL_18;
        case 'f':
          v6 = OUTLINED_FUNCTION_6_28();
          OUTLINED_FUNCTION_134_5(*(int *)(v6 + 52));
          goto LABEL_18;
        case 'g':
          v7 = OUTLINED_FUNCTION_6_28();
          OUTLINED_FUNCTION_134_5(*(int *)(v7 + 56));
          goto LABEL_18;
        case 'h':
          OUTLINED_FUNCTION_6_28();
          OUTLINED_FUNCTION_73_8();
          OUTLINED_FUNCTION_25_8();
          goto LABEL_18;
        default:
          switch(v1)
          {
            case 51:
              OUTLINED_FUNCTION_6_28();
              v8 = OUTLINED_FUNCTION_114_5();
              type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall(v8);
              OUTLINED_FUNCTION_25_8();
              break;
            case 2:
              OUTLINED_FUNCTION_6_28();
              OUTLINED_FUNCTION_114_5();
              type metadata accessor for MonotonicTimestamp();
              OUTLINED_FUNCTION_25_8();
              break;
            case 50:
              OUTLINED_FUNCTION_6_28();
              v9 = OUTLINED_FUNCTION_114_5();
              type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation(v9);
              OUTLINED_FUNCTION_25_8();
              break;
            case 1:
              OUTLINED_FUNCTION_6_28();
              v4 = OUTLINED_FUNCTION_114_5();
              type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(v4);
              OUTLINED_FUNCTION_25_8();
              break;
            default:
              goto LABEL_19;
          }
LABEL_18:
          OUTLINED_FUNCTION_46_1();
LABEL_19:
          v1 = OUTLINED_FUNCTION_111_0();
          break;
      }
    }
  }
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEF69DC()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;

  OUTLINED_FUNCTION_215();
  OUTLINED_FUNCTION_88_5();
  sub_23FEF6B98();
  if (!v1)
  {
    OUTLINED_FUNCTION_98();
    sub_23FEF6C38();
    OUTLINED_FUNCTION_98();
    sub_23FEF6CDC();
    OUTLINED_FUNCTION_98();
    sub_23FEF6D80();
    v2 = (int *)OUTLINED_FUNCTION_6_28();
    if ((~*(_QWORD *)(v0 + v2[11]) & 0xF000000000000007) != 0)
      OUTLINED_FUNCTION_67_10();
    if (*(_QWORD *)(v0 + v2[12]))
      OUTLINED_FUNCTION_67_10();
    if (((*(unsigned int *)(v0 + v2[13] + 8) | ((unint64_t)*(unsigned __int16 *)(v0 + v2[13] + 12) << 32)) & 0xFF0000000000) != 0x30000000000)
      OUTLINED_FUNCTION_67_10();
    if (*(_QWORD *)(v0 + v2[14]))
      OUTLINED_FUNCTION_67_10();
    OUTLINED_FUNCTION_98();
    sub_23FEF6E24();
  }
  OUTLINED_FUNCTION_68_6();
}

void sub_23FEF6B98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8_21();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_76_6();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v1);
  v2 = OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_37_10(*(int *)(v2 + 28));
  v3 = OUTLINED_FUNCTION_22();
  if (v4)
  {
    OUTLINED_FUNCTION_34_4(v3, &qword_256F91D88);
  }
  else
  {
    OUTLINED_FUNCTION_21_17();
    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_19_11();
  }
  OUTLINED_FUNCTION_160_0();
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEF6C38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8_21();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_14_15();
  type metadata accessor for MonotonicTimestamp();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v1);
  v2 = OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_37_10(*(int *)(v2 + 32));
  v3 = OUTLINED_FUNCTION_22();
  if (v4)
  {
    OUTLINED_FUNCTION_34_4(v3, &qword_256F8F630);
  }
  else
  {
    OUTLINED_FUNCTION_21_17();
    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_19_11();
  }
  OUTLINED_FUNCTION_160_0();
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEF6CDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8_21();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v0);
  v1 = OUTLINED_FUNCTION_14_15();
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation(v1);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v2);
  v3 = OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_37_10(*(int *)(v3 + 36));
  v4 = OUTLINED_FUNCTION_22();
  if (v5)
  {
    OUTLINED_FUNCTION_34_4(v4, &qword_256F91D90);
  }
  else
  {
    OUTLINED_FUNCTION_21_17();
    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_19_11();
  }
  OUTLINED_FUNCTION_160_0();
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEF6D80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8_21();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v0);
  v1 = OUTLINED_FUNCTION_14_15();
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall(v1);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v2);
  v3 = OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_37_10(*(int *)(v3 + 40));
  v4 = OUTLINED_FUNCTION_22();
  if (v5)
  {
    OUTLINED_FUNCTION_34_4(v4, &qword_256F91D98);
  }
  else
  {
    OUTLINED_FUNCTION_21_17();
    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_19_11();
  }
  OUTLINED_FUNCTION_160_0();
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEF6E24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8_21();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v0);
  v1 = OUTLINED_FUNCTION_14_15();
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(v1);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v2);
  v3 = OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_37_10(*(int *)(v3 + 60));
  v4 = OUTLINED_FUNCTION_22();
  if (v5)
  {
    OUTLINED_FUNCTION_34_4(v4, &qword_256F91DA0);
  }
  else
  {
    OUTLINED_FUNCTION_21_17();
    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_19_11();
  }
  OUTLINED_FUNCTION_160_0();
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEF6EC8()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEF6ED4@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB610, (uint64_t)&unk_256FAF8B8, a1);
}

void sub_23FEF6EF4()
{
  sub_23FEF680C();
}

void sub_23FEF6F08()
{
  sub_23FEF69DC();
}

void sub_23FEF6F1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;

  OUTLINED_FUNCTION_31_3();
  v1 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v1);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8) - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = OUTLINED_FUNCTION_18_7();
  *(_OWORD *)(v5 + 16) = xmmword_23FF61530;
  OUTLINED_FUNCTION_85_9();
  *(_QWORD *)v0 = "QDToolSubTypeUnknown";
  *(_QWORD *)(v0 + 8) = 20;
  *(_BYTE *)(v0 + 16) = 2;
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_1_9(v0);
  v6 = OUTLINED_FUNCTION_36_1((_QWORD *)(v5 + v4 + v3));
  *(_QWORD *)v6 = "QDToolSubTypeImplementation";
  *((_QWORD *)v6 + 1) = 27;
  v6[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v6);
  v7 = OUTLINED_FUNCTION_87_0();
  *(_QWORD *)v7 = "QDToolSubTypeAssistantSchema";
  *((_QWORD *)v7 + 1) = 28;
  v7[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v7);
  v8 = OUTLINED_FUNCTION_24_10((_QWORD *)(v5 + v4 + 3 * v3));
  *(_QWORD *)v8 = "QDToolSubTypeEntitySetter";
  *((_QWORD *)v8 + 1) = 25;
  v8[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v8);
  v9 = OUTLINED_FUNCTION_51_5((_QWORD *)(v5 + v4 + 4 * v3));
  *(_QWORD *)v9 = "QDToolSubTypeClientAction";
  *((_QWORD *)v9 + 1) = 25;
  v9[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v9);
  v10 = OUTLINED_FUNCTION_68_5();
  *(_QWORD *)v10 = "QDToolSubTypeUIControl";
  *((_QWORD *)v10 + 1) = 22;
  v10[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v10);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_23FEF7084@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB618, (uint64_t)&unk_256FAF8D0, a1);
}

void sub_23FEF70A8()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;

  OUTLINED_FUNCTION_22_7();
  v2 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v2);
  OUTLINED_FUNCTION_23_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  OUTLINED_FUNCTION_44_0();
  v39 = OUTLINED_FUNCTION_54_0();
  *(_OWORD *)(v39 + 16) = xmmword_23FF6FB30;
  v4 = v39 + v2 + *(int *)(v3 + 48);
  *(_QWORD *)(v39 + v2) = 0;
  OUTLINED_FUNCTION_71_0((uint64_t)"QDEntityContextTypeUnknown");
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_7_1(v4);
  v5 = OUTLINED_FUNCTION_36_1((_QWORD *)(v39 + v2 + v0));
  *(_QWORD *)v5 = "QDEntityContextTypeAppInFocusBundleId";
  *((_QWORD *)v5 + 1) = 37;
  OUTLINED_FUNCTION_7_28((uint64_t)v5);
  v6 = OUTLINED_FUNCTION_125_3();
  *(_QWORD *)v6 = "QDEntityContextTypeBluetoothDeviceType";
  *((_QWORD *)v6 + 1) = 38;
  OUTLINED_FUNCTION_7_28((uint64_t)v6);
  v7 = OUTLINED_FUNCTION_19_6((_QWORD *)(v39 + v2 + 3 * v0));
  *(_QWORD *)v7 = "QDEntityContextTypeCalendarEvents";
  *((_QWORD *)v7 + 1) = 33;
  OUTLINED_FUNCTION_7_28((uint64_t)v7);
  v8 = OUTLINED_FUNCTION_26_5((_QWORD *)(v39 + v2 + 4 * v0));
  *(_QWORD *)v8 = "QDEntityContextTypeCurrentLocation";
  *((_QWORD *)v8 + 1) = 34;
  OUTLINED_FUNCTION_7_28((uint64_t)v8);
  v9 = OUTLINED_FUNCTION_39_1((_QWORD *)(v39 + v2 + 5 * v0));
  *(_QWORD *)v9 = "QDEntityContextTypeMotionState";
  *((_QWORD *)v9 + 1) = 30;
  OUTLINED_FUNCTION_7_28((uint64_t)v9);
  v10 = OUTLINED_FUNCTION_15_7(6);
  *(_QWORD *)v10 = "QDEntityContextTypeNowPlayingPlaybackState";
  *((_QWORD *)v10 + 1) = 42;
  OUTLINED_FUNCTION_7_28((uint64_t)v10);
  v11 = (_QWORD *)OUTLINED_FUNCTION_53_0(v39 + v2 + 7 * v0);
  *v12 = 7;
  *v11 = "QDEntityContextTypePointOfInterest";
  v11[1] = 34;
  OUTLINED_FUNCTION_7_28((uint64_t)v11);
  v13 = (_QWORD *)OUTLINED_FUNCTION_53_0(v39 + v2 + 8 * v0);
  *v14 = 8;
  *v13 = "QDEntityContextTypeRecentTranscript";
  v13[1] = 35;
  OUTLINED_FUNCTION_7_28((uint64_t)v13);
  v15 = (_QWORD *)OUTLINED_FUNCTION_53_0(v39 + v2 + 9 * v0);
  *v16 = 9;
  *v15 = "QDEntityContextTypeSemanticLocation";
  v15[1] = 35;
  OUTLINED_FUNCTION_7_28((uint64_t)v15);
  v17 = OUTLINED_FUNCTION_15_7(10);
  *(_QWORD *)v17 = "QDEntityContextTypeOnScreenContentEmailAddress";
  *((_QWORD *)v17 + 1) = 46;
  OUTLINED_FUNCTION_7_28((uint64_t)v17);
  v18 = OUTLINED_FUNCTION_15_7(11);
  *(_QWORD *)v18 = "QDEntityContextTypeOnScreenContentPhoneNumber";
  *((_QWORD *)v18 + 1) = 45;
  OUTLINED_FUNCTION_7_28((uint64_t)v18);
  v19 = OUTLINED_FUNCTION_15_7(12);
  *(_QWORD *)v19 = "QDEntityContextTypeOnScreenContentPostalAddress";
  *((_QWORD *)v19 + 1) = 47;
  OUTLINED_FUNCTION_7_28((uint64_t)v19);
  v20 = OUTLINED_FUNCTION_15_7(13);
  *(_QWORD *)v20 = "QDEntityContextTypeOnScreenContentUriLink";
  *((_QWORD *)v20 + 1) = 41;
  OUTLINED_FUNCTION_7_28((uint64_t)v20);
  v21 = OUTLINED_FUNCTION_15_7(14);
  *(_QWORD *)v21 = "QDEntityContextTypeOnScreenContentAppEntity";
  *((_QWORD *)v21 + 1) = 43;
  OUTLINED_FUNCTION_7_28((uint64_t)v21);
  v22 = (_QWORD *)OUTLINED_FUNCTION_53_0(v39 + v2 + 15 * v0);
  *v23 = 15;
  *v22 = "QDEntityContextTypeOnScreenPerson";
  v22[1] = 33;
  OUTLINED_FUNCTION_7_28((uint64_t)v22);
  v24 = (_QWORD *)OUTLINED_FUNCTION_53_0(v39 + v2 + 16 * v0);
  *v25 = 16;
  *v24 = "QDEntityContextTypeOnScreenHome";
  v24[1] = 31;
  OUTLINED_FUNCTION_7_28((uint64_t)v24);
  v26 = (_QWORD *)OUTLINED_FUNCTION_53_0(v39 + v2 + 17 * v0);
  *v27 = 17;
  *v26 = "QDEntityContextTypeOnScreenNotification";
  v26[1] = 39;
  OUTLINED_FUNCTION_7_28((uint64_t)v26);
  v28 = OUTLINED_FUNCTION_15_7(18);
  *(_QWORD *)v28 = "QDEntityContextTypeOnScreenDateTime";
  *((_QWORD *)v28 + 1) = 35;
  OUTLINED_FUNCTION_7_28((uint64_t)v28);
  v29 = OUTLINED_FUNCTION_15_7(19);
  *(_QWORD *)v29 = "QDEntityContextTypeConversationalReminder";
  *((_QWORD *)v29 + 1) = 41;
  OUTLINED_FUNCTION_7_28((uint64_t)v29);
  v30 = OUTLINED_FUNCTION_15_7(20);
  *(_QWORD *)v30 = "QDEntityContextTypeConversationalCalendarevent";
  *((_QWORD *)v30 + 1) = 46;
  OUTLINED_FUNCTION_7_28((uint64_t)v30);
  v31 = OUTLINED_FUNCTION_15_7(21);
  *(_QWORD *)v31 = "QDEntityContextTypeConversationalPeople";
  *((_QWORD *)v31 + 1) = 39;
  OUTLINED_FUNCTION_7_28((uint64_t)v31);
  v32 = OUTLINED_FUNCTION_15_7(22);
  *(_QWORD *)v32 = "QDEntityContextTypeConversationalPlaces";
  *((_QWORD *)v32 + 1) = 39;
  OUTLINED_FUNCTION_7_28((uint64_t)v32);
  v33 = OUTLINED_FUNCTION_15_7(23);
  *(_QWORD *)v33 = "QDEntityContextTypeConversationalAlarm";
  *((_QWORD *)v33 + 1) = 38;
  OUTLINED_FUNCTION_7_28((uint64_t)v33);
  v34 = OUTLINED_FUNCTION_15_7(24);
  *(_QWORD *)v34 = "QDEntityContextTypeConversationalTimer";
  *((_QWORD *)v34 + 1) = 38;
  OUTLINED_FUNCTION_7_28((uint64_t)v34);
  v35 = OUTLINED_FUNCTION_15_7(25);
  *(_QWORD *)v35 = "QDEntityContextTypeNowPlayingMediaItem";
  *((_QWORD *)v35 + 1) = 38;
  OUTLINED_FUNCTION_7_28((uint64_t)v35);
  v36 = OUTLINED_FUNCTION_53_0(v39 + v2 + 26 * v0);
  *v37 = v38;
  *(_QWORD *)v36 = "QDEntityContextTypeSiriRequestContext";
  *(_QWORD *)(v36 + 8) = 37;
  *(_BYTE *)(v36 + 16) = v1;
  OUTLINED_FUNCTION_7_1(v36);
  sub_23FF58EE0();
  OUTLINED_FUNCTION_3_10();
}

uint64_t sub_23FEF748C@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB620, (uint64_t)&unk_256FAF8E8, a1);
}

void sub_23FEF74B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;

  OUTLINED_FUNCTION_22_7();
  v2 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v2);
  OUTLINED_FUNCTION_23_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  OUTLINED_FUNCTION_44_0();
  v3 = OUTLINED_FUNCTION_18_7();
  *(_OWORD *)(v3 + 16) = xmmword_23FF614B0;
  OUTLINED_FUNCTION_85_9();
  *(_QWORD *)v0 = "QDSubComponentUnknown";
  *(_QWORD *)(v0 + 8) = 21;
  *(_BYTE *)(v0 + 16) = 2;
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_1_9(v0);
  v4 = OUTLINED_FUNCTION_36_1((_QWORD *)(v3 + v2 + v1));
  *(_QWORD *)v4 = "QDSubComponentInputCollection";
  *((_QWORD *)v4 + 1) = 29;
  v4[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v4);
  v5 = OUTLINED_FUNCTION_87_0();
  *(_QWORD *)v5 = "QDSubComponentSpanRetrieval";
  *((_QWORD *)v5 + 1) = 27;
  v5[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v5);
  v6 = OUTLINED_FUNCTION_24_10((_QWORD *)(v3 + v2 + 3 * v1));
  *(_QWORD *)v6 = "QDSubComponentContextRetrieval";
  *((_QWORD *)v6 + 1) = 30;
  v6[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v6);
  v7 = OUTLINED_FUNCTION_51_5((_QWORD *)(v3 + v2 + 4 * v1));
  *(_QWORD *)v7 = "QDSubComponentToolRetrievalContext";
  *((_QWORD *)v7 + 1) = 34;
  v7[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v7);
  v8 = OUTLINED_FUNCTION_68_5();
  *(_QWORD *)v8 = "QDSubComponentToolRetrieval";
  *((_QWORD *)v8 + 1) = 27;
  v8[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v8);
  v9 = OUTLINED_FUNCTION_104_3();
  *(_QWORD *)v9 = "QDSubComponentRanking";
  *((_QWORD *)v9 + 1) = 21;
  v9[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v9);
  v10 = OUTLINED_FUNCTION_89_4(8 * v1);
  *(_QWORD *)v10 = "QDSubComponentTupleBuilding";
  *((_QWORD *)v10 + 1) = 27;
  v10[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v10);
  v11 = OUTLINED_FUNCTION_5_11(v3 + v2 + 8 * v1);
  *v12 = 8;
  *(_QWORD *)v11 = "QDSubComponentTupleRanking";
  *(_QWORD *)(v11 + 8) = 26;
  *(_BYTE *)(v11 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v11);
  v13 = OUTLINED_FUNCTION_5_11(v3 + v2 + 9 * v1);
  *v14 = 9;
  *(_QWORD *)v13 = "QDSubComponentOutputBuilding";
  *(_QWORD *)(v13 + 8) = 28;
  *(_BYTE *)(v13 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v13);
  OUTLINED_FUNCTION_43_0();
  OUTLINED_FUNCTION_3_10();
}

uint64_t sub_23FEF7694@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB628, (uint64_t)&unk_256FAF900, a1);
}

void sub_23FEF76B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;

  OUTLINED_FUNCTION_31_3();
  v3 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v3);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v4 = OUTLINED_FUNCTION_0_33();
  *(_OWORD *)(v4 + 16) = xmmword_23FF614F0;
  *(_QWORD *)(v4 + v0) = 0;
  OUTLINED_FUNCTION_66_0((uint64_t)"QDSpanMatcherTypeUnknown");
  v5 = OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_20_0(v5);
  v6 = OUTLINED_FUNCTION_36_1((_QWORD *)(v4 + v0 + v1));
  *(_QWORD *)v6 = "QDSpanMatcherTypeSiriEntityMatcher";
  *((_QWORD *)v6 + 1) = 34;
  v6[16] = v2;
  OUTLINED_FUNCTION_16_2((uint64_t)v6);
  v7 = OUTLINED_FUNCTION_102_6();
  *v8 = v2;
  *(_QWORD *)v7 = "QDSpanMatcherTypeGlobalEntityMatcher";
  *(_QWORD *)(v7 + 8) = 36;
  *(_BYTE *)(v7 + 16) = v2;
  OUTLINED_FUNCTION_16_2(v7);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_23FEF7798@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB630, (uint64_t)&unk_256FAF918, a1);
}

void sub_23FEF77BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;

  OUTLINED_FUNCTION_22_7();
  v2 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v2);
  OUTLINED_FUNCTION_23_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  OUTLINED_FUNCTION_44_0();
  v4 = OUTLINED_FUNCTION_18_7();
  *(_OWORD *)(v4 + 16) = xmmword_23FF61550;
  OUTLINED_FUNCTION_85_9();
  *(_QWORD *)v0 = "QDMatchingTransformUnknown";
  *(_QWORD *)(v0 + 8) = 26;
  *(_BYTE *)(v0 + 16) = 2;
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_7_1(v0);
  v5 = OUTLINED_FUNCTION_36_1((_QWORD *)(v4 + v2 + v1));
  *(_QWORD *)v5 = "QDMatchingTransformHomeEntity";
  *((_QWORD *)v5 + 1) = 29;
  v5[16] = 2;
  OUTLINED_FUNCTION_7_1((uint64_t)v5);
  v6 = (_QWORD *)(v4 + v2 + 2 * v1);
  v7 = (uint64_t)v6 + *(int *)(v3 + 48);
  *v6 = 2;
  *(_QWORD *)v7 = "QDMatchingTransformSynonym";
  *(_QWORD *)(v7 + 8) = 26;
  *(_BYTE *)(v7 + 16) = 2;
  OUTLINED_FUNCTION_7_1(v7);
  v8 = OUTLINED_FUNCTION_24_10((_QWORD *)(v4 + v2 + 3 * v1));
  *(_QWORD *)v8 = "QDMatchingTransformTransliteration";
  *((_QWORD *)v8 + 1) = 34;
  v8[16] = 2;
  OUTLINED_FUNCTION_7_1((uint64_t)v8);
  v9 = OUTLINED_FUNCTION_51_5((_QWORD *)(v4 + v2 + 4 * v1));
  *(_QWORD *)v9 = "QDMatchingTransformExpandedEmoji";
  *((_QWORD *)v9 + 1) = 32;
  v9[16] = 2;
  OUTLINED_FUNCTION_7_1((uint64_t)v9);
  v10 = OUTLINED_FUNCTION_68_5();
  *(_QWORD *)v10 = "QDMatchingTransformContactRelationship";
  *((_QWORD *)v10 + 1) = 38;
  v10[16] = 2;
  OUTLINED_FUNCTION_7_1((uint64_t)v10);
  v11 = OUTLINED_FUNCTION_104_3();
  *(_QWORD *)v11 = "QDMatchingTransformContactHypocorism";
  *((_QWORD *)v11 + 1) = 36;
  v11[16] = 2;
  OUTLINED_FUNCTION_7_1((uint64_t)v11);
  v12 = OUTLINED_FUNCTION_89_4(8 * v1);
  *(_QWORD *)v12 = "QDMatchingTransformContactHandle";
  *((_QWORD *)v12 + 1) = 32;
  v12[16] = 2;
  OUTLINED_FUNCTION_7_1((uint64_t)v12);
  OUTLINED_FUNCTION_43_0();
  OUTLINED_FUNCTION_3_10();
}

uint64_t sub_23FEF7960@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB638, (uint64_t)&unk_256FAF930, a1);
}

void sub_23FEF7984()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;

  OUTLINED_FUNCTION_31_3();
  v3 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v3);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  OUTLINED_FUNCTION_108_3();
  v5 = OUTLINED_FUNCTION_54_0();
  *(_OWORD *)(v5 + 16) = xmmword_23FF614E0;
  v6 = v5 + v0 + *(int *)(v4 + 48);
  *(_QWORD *)(v5 + v0) = 0;
  OUTLINED_FUNCTION_71_0((uint64_t)"QDDataProtectionClassUnknown");
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_1_9(v6);
  v7 = OUTLINED_FUNCTION_36_1((_QWORD *)(v5 + v0 + v1));
  *(_QWORD *)v7 = "QDDataProtectionClassA";
  *((_QWORD *)v7 + 1) = 22;
  v7[16] = v2;
  OUTLINED_FUNCTION_1_9((uint64_t)v7);
  v8 = OUTLINED_FUNCTION_125_3();
  *(_QWORD *)v8 = "QDDataProtectionClassB";
  *((_QWORD *)v8 + 1) = 22;
  v8[16] = v2;
  OUTLINED_FUNCTION_1_9((uint64_t)v8);
  v9 = OUTLINED_FUNCTION_19_6((_QWORD *)(v5 + v0 + 3 * v1));
  *(_QWORD *)v9 = "QDDataProtectionClassC";
  *((_QWORD *)v9 + 1) = 22;
  v9[16] = v2;
  OUTLINED_FUNCTION_1_9((uint64_t)v9);
  v10 = OUTLINED_FUNCTION_26_5((_QWORD *)(v5 + v0 + 4 * v1));
  *(_QWORD *)v10 = "QDDataProtectionClassD";
  *((_QWORD *)v10 + 1) = 22;
  v10[16] = v2;
  OUTLINED_FUNCTION_1_9((uint64_t)v10);
  v11 = OUTLINED_FUNCTION_39_1((_QWORD *)(v5 + v0 + 5 * v1));
  *(_QWORD *)v11 = "QDDataProtectionClassE";
  *((_QWORD *)v11 + 1) = 22;
  v11[16] = v2;
  OUTLINED_FUNCTION_1_9((uint64_t)v11);
  v12 = OUTLINED_FUNCTION_15_7(6);
  *(_QWORD *)v12 = "QDDataProtectionClassF";
  *((_QWORD *)v12 + 1) = 22;
  v12[16] = v2;
  OUTLINED_FUNCTION_1_9((uint64_t)v12);
  sub_23FF58EE0();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_23FEF7B08@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB640, (uint64_t)&unk_256FAF948, a1);
}

void sub_23FEF7B2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;

  OUTLINED_FUNCTION_31_3();
  v1 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v1);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8) - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = OUTLINED_FUNCTION_18_7();
  *(_OWORD *)(v5 + 16) = xmmword_23FF61530;
  OUTLINED_FUNCTION_85_9();
  *(_QWORD *)v0 = "QDToolSelectionCriteriaUnknown";
  *(_QWORD *)(v0 + 8) = 30;
  *(_BYTE *)(v0 + 16) = 2;
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_1_9(v0);
  v6 = OUTLINED_FUNCTION_36_1((_QWORD *)(v5 + v4 + v3));
  *(_QWORD *)v6 = "QDToolSelectionCriteriaStageOneTopN";
  *((_QWORD *)v6 + 1) = 35;
  v6[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v6);
  v7 = OUTLINED_FUNCTION_87_0();
  *(_QWORD *)v7 = "QDToolSelectionCriteriaStageTwoTopN";
  *((_QWORD *)v7 + 1) = 35;
  v7[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v7);
  v8 = OUTLINED_FUNCTION_24_10((_QWORD *)(v5 + v4 + 3 * v3));
  *(_QWORD *)v8 = "QDToolSelectionCriteriaStageThreeTopN";
  *((_QWORD *)v8 + 1) = 37;
  v8[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v8);
  v9 = OUTLINED_FUNCTION_51_5((_QWORD *)(v5 + v4 + 4 * v3));
  *(_QWORD *)v9 = "QDToolSelectionCriteriaStageFourTopN";
  *((_QWORD *)v9 + 1) = 36;
  v9[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v9);
  v10 = OUTLINED_FUNCTION_68_5();
  *(_QWORD *)v10 = "QDToolSelectionCriteriaRankedToolTupleTopN";
  *((_QWORD *)v10 + 1) = 42;
  v10[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v10);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_23FEF7C94@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB648, (uint64_t)&unk_256FAF960, a1);
}

void sub_23FEF7CB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  __n128 *v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_31_3();
  v1 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v1);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = (__n128 *)OUTLINED_FUNCTION_18_7();
  OUTLINED_FUNCTION_11_2(v6, (__n128)xmmword_23FF60830);
  *(_QWORD *)v5 = "qdId";
  *(_QWORD *)(v5 + 8) = 4;
  *(_BYTE *)(v5 + 16) = 2;
  v7 = OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_20_0(v7);
  v8 = v0 + v4 + *(int *)(v2 + 48);
  *(_QWORD *)(v0 + v4) = 50;
  *(_QWORD *)v8 = "rowId";
  *(_QWORD *)(v8 + 8) = 5;
  *(_BYTE *)(v8 + 16) = 2;
  OUTLINED_FUNCTION_16_2(v8);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEF7D94()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t Decoration;

  v1 = OUTLINED_FUNCTION_12();
  v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (v1 == 50)
      {
        Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(0);
        OUTLINED_FUNCTION_84_5(*(int *)(Decoration + 20));
        v0 = v3;
        sub_23FE1C0F0();
      }
      else
      {
        if (v1 != 1)
          goto LABEL_9;
        OUTLINED_FUNCTION_25();
        OUTLINED_FUNCTION_81_5();
      }
      v3 = v0;
LABEL_9:
      v0 = v3;
      v1 = OUTLINED_FUNCTION_40_2();
    }
  }
  OUTLINED_FUNCTION_33_1();
}

#error "23FEF7E44: call analysis failed (funcsize=15)"

void sub_23FEF7E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  uint64_t v31;

  OUTLINED_FUNCTION_20();
  a19 = v21;
  a20 = v22;
  a10 = v23;
  v25 = v24;
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&a9 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_23FF58C28();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v31 = OUTLINED_FUNCTION_76_6();
  sub_23FE90AA8(v25 + *(int *)(v31 + 20), (uint64_t)v28, &qword_25434B788);
  if (__swift_getEnumTagSinglePayload((uint64_t)v28, 1, v29) == 1)
  {
    sub_23FE24D20((uint64_t)v28, &qword_25434B788);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v20, v28, v29);
    sub_23FE1CE30();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v20, v29);
  }
  OUTLINED_FUNCTION_160_0();
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEF7F68()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEF7F74@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB650, (uint64_t)&unk_256FAF978, a1);
}

void sub_23FEF7F94()
{
  sub_23FEF7D94();
}

uint64_t sub_23FEF7FA8()
{
  return sub_23FEF7E20();
}

uint64_t sub_23FEF7FBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return OUTLINED_FUNCTION_65_7(a1, qword_256FAF990, a3, (uint64_t)"exists");
}

void sub_23FEF7FD0()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEF7FDC@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB658, (uint64_t)qword_256FAF990, a1);
}

void sub_23FEF7FFC()
{
  sub_23FEFAA68();
}

uint64_t sub_23FEF8010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return OUTLINED_FUNCTION_65_7(a1, qword_256FAF9A8, a3, (uint64_t)"exists");
}

void sub_23FEF8024()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEF8030@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB660, (uint64_t)qword_256FAF9A8, a1);
}

void sub_23FEF8050()
{
  char v0;
  uint64_t v1;
  __n128 *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_31_3();
  v1 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v1);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v2 = (__n128 *)OUTLINED_FUNCTION_18_7();
  OUTLINED_FUNCTION_11_2(v2, (__n128)xmmword_23FF60830);
  OUTLINED_FUNCTION_66_0((uint64_t)"errorDomain");
  v3 = OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_20_0(v3);
  v4 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v4 = "errorCode";
  *(_QWORD *)(v4 + 8) = 9;
  *(_BYTE *)(v4 + 16) = v0;
  OUTLINED_FUNCTION_16_2(v4);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEF8114()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEF8120@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB668, (uint64_t)&unk_256FAF9C0, a1);
}

void sub_23FEF8140()
{
  sub_23FEFABB4();
}

uint64_t sub_23FEF8154()
{
  return sub_23FEFAC20();
}

void sub_23FEF8168()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;

  OUTLINED_FUNCTION_22_7();
  v2 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v2);
  OUTLINED_FUNCTION_23_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  OUTLINED_FUNCTION_44_0();
  v4 = OUTLINED_FUNCTION_18_7();
  *(_OWORD *)(v4 + 16) = xmmword_23FF614E0;
  v5 = v4 + v2 + *(int *)(v3 + 48);
  OUTLINED_FUNCTION_72_0();
  OUTLINED_FUNCTION_71_0((uint64_t)"sessionScopedUniqueId");
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_1_9(v5);
  v6 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v6 = "toolId";
  *(_QWORD *)(v6 + 8) = 6;
  *(_BYTE *)(v6 + 16) = v1;
  OUTLINED_FUNCTION_1_9(v6);
  v7 = OUTLINED_FUNCTION_24_10((_QWORD *)(v4 + v2 + 2 * v0));
  *(_QWORD *)v7 = "subType";
  *((_QWORD *)v7 + 1) = 7;
  v7[16] = v1;
  OUTLINED_FUNCTION_1_9((uint64_t)v7);
  v8 = OUTLINED_FUNCTION_51_5((_QWORD *)(v4 + v2 + 3 * v0));
  *(_QWORD *)v8 = "similarityScore";
  *((_QWORD *)v8 + 1) = 15;
  v8[16] = v1;
  OUTLINED_FUNCTION_1_9((uint64_t)v8);
  v9 = OUTLINED_FUNCTION_39_1((_QWORD *)(v4 + v2 + 4 * v0));
  *(_QWORD *)v9 = "selectionCriteria";
  *((_QWORD *)v9 + 1) = 17;
  v9[16] = v1;
  OUTLINED_FUNCTION_1_9((uint64_t)v9);
  v10 = OUTLINED_FUNCTION_5_11(v4 + v2 + 5 * v0);
  *v11 = 6;
  *(_QWORD *)v10 = "toolSource";
  *(_QWORD *)(v10 + 8) = 10;
  *(_BYTE *)(v10 + 16) = v1;
  OUTLINED_FUNCTION_1_9(v10);
  v12 = OUTLINED_FUNCTION_5_11(v4 + v2 + 6 * v0);
  *v13 = 7;
  *(_QWORD *)v12 = "toolDefinition";
  *(_QWORD *)(v12 + 8) = 14;
  *(_BYTE *)(v12 + 16) = v1;
  OUTLINED_FUNCTION_1_9(v12);
  OUTLINED_FUNCTION_43_0();
  OUTLINED_FUNCTION_3_10();
}

void sub_23FEF82F8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_20();
  v1 = OUTLINED_FUNCTION_12();
  v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(v1)
      {
        case 1:
          OUTLINED_FUNCTION_25();
          goto LABEL_13;
        case 2:
          OUTLINED_FUNCTION_70_9();
          v4 = v3;
          OUTLINED_FUNCTION_74_0();
          goto LABEL_14;
        case 3:
          v5 = OUTLINED_FUNCTION_70_9();
          OUTLINED_FUNCTION_84_5(*(int *)(v5 + 24));
          goto LABEL_10;
        case 4:
          OUTLINED_FUNCTION_70_9();
          v4 = v3;
          OUTLINED_FUNCTION_153_0();
          goto LABEL_14;
        case 5:
          v6 = OUTLINED_FUNCTION_70_9();
          OUTLINED_FUNCTION_84_5(*(int *)(v6 + 32));
LABEL_10:
          v4 = v3;
          sub_23FE1C9B0();
          goto LABEL_14;
        case 6:
          v7 = OUTLINED_FUNCTION_70_9();
          OUTLINED_FUNCTION_84_5(*(int *)(v7 + 36));
          OUTLINED_FUNCTION_99_8();
          goto LABEL_13;
        case 7:
          v8 = OUTLINED_FUNCTION_70_9();
          OUTLINED_FUNCTION_84_5(*(int *)(v8 + 40));
LABEL_13:
          v4 = v3;
          sub_23FE1C4DC();
LABEL_14:
          v3 = v4;
          break;
        default:
          break;
      }
      v1 = OUTLINED_FUNCTION_40_2();
    }
  }
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEF845C()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  OUTLINED_FUNCTION_215();
  OUTLINED_FUNCTION_88_5();
  sub_23FEF8600(v3, v4, v5, v6, v7, v8, v9, v10, v21, v22, v23, *((uint64_t *)&v23 + 1), v24, *((uint64_t *)&v24 + 1), v25, *((uint64_t *)&v25 + 1), v26, v27, v28,
    v29);
  if (!v1)
  {
    OUTLINED_FUNCTION_70_9();
    OUTLINED_FUNCTION_104_6();
    if (*(_QWORD *)(v11 + 8))
      OUTLINED_FUNCTION_52_0();
    if ((*(_BYTE *)(v0 + v2[6] + 9) & 1) == 0)
    {
      OUTLINED_FUNCTION_229_2();
      OUTLINED_FUNCTION_113_0((uint64_t)&v22, 3, v12, (uint64_t)&type metadata for IntelligenceFlowQueryDecorationTelemetry.QDToolSubType, v13, (uint64_t)&off_251021B18);
    }
    if ((*(_BYTE *)(v0 + v2[7] + 4) & 1) == 0)
      sub_23FF58E50();
    if ((*(_BYTE *)(v0 + v2[8] + 9) & 1) == 0)
    {
      OUTLINED_FUNCTION_229_2();
      OUTLINED_FUNCTION_113_0((uint64_t)&v22, 5, v14, (uint64_t)&type metadata for IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria, v15, (uint64_t)&off_25102EFE0);
    }
    v16 = (uint64_t *)(v0 + v2[9]);
    v17 = *v16;
    if (*v16)
    {
      v18 = v16[1];
      v22 = v17;
      *(_QWORD *)&v23 = v18;
      OUTLINED_FUNCTION_221();
    }
    v19 = v0 + v2[10];
    if (*(_QWORD *)v19)
    {
      v22 = *(_QWORD *)v19;
      v20 = *(_OWORD *)(v19 + 24);
      v23 = *(_OWORD *)(v19 + 8);
      v24 = v20;
      v25 = *(_OWORD *)(v19 + 40);
      OUTLINED_FUNCTION_221();
    }
  }
}

void sub_23FEF8600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  OUTLINED_FUNCTION_20();
  a19 = v21;
  a20 = v22;
  OUTLINED_FUNCTION_8_21();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&a9 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v26);
  sub_23FE90AA8(v20, (uint64_t)v25, &qword_256F90740);
  v27 = OUTLINED_FUNCTION_22();
  if (v28)
  {
    OUTLINED_FUNCTION_34_4(v27, &qword_256F90740);
  }
  else
  {
    OUTLINED_FUNCTION_21_17();
    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_19_11();
  }
  OUTLINED_FUNCTION_160_0();
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEF86CC()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEF86D8@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB670, (uint64_t)&unk_256FAF9D8, a1);
}

void sub_23FEF86F8()
{
  sub_23FEF82F8();
}

void sub_23FEF870C()
{
  sub_23FEF845C();
}

void sub_23FEF8720()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  __n128 *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  OUTLINED_FUNCTION_31_3();
  v3 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v3);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v4 = (__n128 *)OUTLINED_FUNCTION_0_33();
  OUTLINED_FUNCTION_11_2(v4, (__n128)xmmword_23FF614F0);
  OUTLINED_FUNCTION_66_0((uint64_t)"parameters");
  v5 = OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_20_0(v5);
  v6 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v6 = "output";
  *(_QWORD *)(v6 + 8) = 6;
  *(_BYTE *)(v6 + 16) = v2;
  OUTLINED_FUNCTION_16_2(v6);
  v7 = OUTLINED_FUNCTION_24_10((_QWORD *)(v1 + 2 * v0));
  *(_QWORD *)v7 = "description";
  *((_QWORD *)v7 + 1) = 11;
  v7[16] = v2;
  OUTLINED_FUNCTION_16_2((uint64_t)v7);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEF87E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;

  OUTLINED_FUNCTION_20();
  v2 = OUTLINED_FUNCTION_12();
  if (!v1)
  {
    while ((v3 & 1) == 0)
    {
      switch(v2)
      {
        case 3:
          OUTLINED_FUNCTION_74_0();
          break;
        case 2:
          OUTLINED_FUNCTION_99_8();
          sub_23FE1C4DC();
          break;
        case 1:
          sub_23FE1C624(v0);
          break;
      }
      v2 = OUTLINED_FUNCTION_40_2();
    }
  }
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEF88A0()
{
  uint64_t v0;
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
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
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  OUTLINED_FUNCTION_120_5();
  v43 = *((_QWORD *)v1 + 6);
  v10 = v1[2];
  v41 = v1[1];
  v42 = v10;
  v40 = *v1;
  if (*(_QWORD *)(v40 + 16))
  {
    OUTLINED_FUNCTION_236_2();
    OUTLINED_FUNCTION_64_7(v11, v12, v13, v14, v15, v16);
    v0 = v2;
  }
  if (!v0)
  {
    OUTLINED_FUNCTION_121_6((uint64_t)&v40 + 8, v3, v4, v5, v6, v7, v8, v9, v40, *((uint64_t *)&v40 + 1), v41, *((uint64_t *)&v41 + 1), v42);
    OUTLINED_FUNCTION_96_5(v17, v18, v19, v20, v21, v22, v23, v24, v40, *((uint64_t *)&v40 + 1), v41, *((uint64_t *)&v41 + 1));
    if (*((_QWORD *)&v46 + 1) != 2)
    {
      v44 = v46;
      v45 = v47;
      OUTLINED_FUNCTION_243_2();
      sub_23FE1D118();
    }
    OUTLINED_FUNCTION_121_6((uint64_t)&v42 + 8, v25, v26, v27, v28, v29, v30, v31, v40, *((uint64_t *)&v40 + 1), v41, *((uint64_t *)&v41 + 1), v42);
    OUTLINED_FUNCTION_96_5(v32, v33, v34, v35, v36, v37, v38, v39, v40, *((uint64_t *)&v40 + 1), v41, *((uint64_t *)&v41 + 1));
    if (*((_QWORD *)&v46 + 1))
      OUTLINED_FUNCTION_69_0();
  }
}

void sub_23FEF89B0()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEF89BC@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB678, (uint64_t)&unk_256FAF9F0, a1);
}

void sub_23FEF89DC()
{
  sub_23FEF87E8();
}

void sub_23FEF89F0()
{
  sub_23FEF88A0();
}

void sub_23FEF8A04()
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
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;

  OUTLINED_FUNCTION_22_7();
  v0 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v0);
  OUTLINED_FUNCTION_23_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = OUTLINED_FUNCTION_18_7();
  *(_OWORD *)(v5 + 16) = xmmword_23FF5FA60;
  v6 = v5 + v4 + *(int *)(v1 + 48);
  OUTLINED_FUNCTION_72_0();
  *(_QWORD *)v6 = "key";
  *(_QWORD *)(v6 + 8) = 3;
  *(_BYTE *)(v6 + 16) = 2;
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_102(v6);
  v7 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v7 = "name";
  *(_QWORD *)(v7 + 8) = 4;
  *(_BYTE *)(v7 + 16) = 2;
  OUTLINED_FUNCTION_102(v7);
  v8 = OUTLINED_FUNCTION_102_6();
  *v9 = 3;
  *(_QWORD *)v8 = "entityType";
  *(_QWORD *)(v8 + 8) = 10;
  *(_BYTE *)(v8 + 16) = 2;
  OUTLINED_FUNCTION_102(v8);
  v10 = OUTLINED_FUNCTION_5_11(v5 + v4 + 3 * v3);
  *v11 = 4;
  *(_QWORD *)v10 = "description";
  *(_QWORD *)(v10 + 8) = 11;
  *(_BYTE *)(v10 + 16) = 2;
  OUTLINED_FUNCTION_102(v10);
  OUTLINED_FUNCTION_43_0();
  OUTLINED_FUNCTION_3_10();
}

void sub_23FEF8B3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_12();
  if (!v12)
  {
    while ((v13 & 1) == 0)
    {
      OUTLINED_FUNCTION_238();
      if (!(!v24 & v23))
      {
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_23FEF8B98 + 4 * byte_23FF6FB4C[v22]))(v14, v15, v16, v17, v18, v19, v20, v21, a9, a10, a11, a12);
        return;
      }
      OUTLINED_FUNCTION_40_2();
    }
  }
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEF8BE0()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  _BYTE v3[80];
  __int128 v4;
  __int128 v5;
  _BYTE v6[32];
  _OWORD v7[2];

  OUTLINED_FUNCTION_86_6();
  memcpy(v3, v2, sizeof(v3));
  OUTLINED_FUNCTION_14_22((uint64_t)v3, (uint64_t)v6);
  OUTLINED_FUNCTION_14_22((uint64_t)v6, (uint64_t)v7);
  if (*((_QWORD *)&v7[0] + 1))
  {
    OUTLINED_FUNCTION_69_0();
    if (v1)
      return;
  }
  else if (v0)
  {
    return;
  }
  OUTLINED_FUNCTION_14_22((uint64_t)&v3[16], (uint64_t)v6);
  OUTLINED_FUNCTION_14_22((uint64_t)v6, (uint64_t)v7);
  if (!*((_QWORD *)&v7[0] + 1) || (OUTLINED_FUNCTION_69_0(), !v1))
  {
    OUTLINED_FUNCTION_14_22((uint64_t)&v3[32], (uint64_t)v6);
    OUTLINED_FUNCTION_14_22((uint64_t)v6, (uint64_t)v7);
    if (*((_QWORD *)&v7[0] + 1) == 1 || (v4 = v7[0], v5 = v7[1], OUTLINED_FUNCTION_30_0(), !v1))
    {
      OUTLINED_FUNCTION_14_22((uint64_t)&v3[64], (uint64_t)v6);
      OUTLINED_FUNCTION_14_22((uint64_t)v6, (uint64_t)v7);
      if (*((_QWORD *)&v7[0] + 1))
        OUTLINED_FUNCTION_69_0();
    }
  }
}

void sub_23FEF8D3C()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEF8D48@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB680, (uint64_t)&unk_256FAFA08, a1);
}

#error "23FEF8D70: call analysis failed (funcsize=5)"

void sub_23FEF8D7C()
{
  sub_23FEF8BE0();
}

uint64_t sub_23FEF8D90(uint64_t a1)
{
  return sub_23FEFB1A0(a1, qword_256FAFA20, 2, (uint64_t)"entityType", 10);
}

void sub_23FEF8DAC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_12();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (v1 == 2)
      {
        OUTLINED_FUNCTION_63_5();
        sub_23FE1C4DC();
      }
      v1 = OUTLINED_FUNCTION_40_2();
    }
  }
  OUTLINED_FUNCTION_33_1();
}

void sub_23FEF8E00()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8) != 1)
    sub_23FE1D118();
  OUTLINED_FUNCTION_194();
}

void sub_23FEF8E60()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEF8E6C@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB688, (uint64_t)qword_256FAFA20, a1);
}

void sub_23FEF8E8C()
{
  sub_23FEF8DAC();
}

void sub_23FEF8EA0()
{
  sub_23FEF8E00();
}

void sub_23FEF8EB4()
{
  char v0;
  uint64_t v1;
  __n128 *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_31_3();
  v1 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v1);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v2 = (__n128 *)OUTLINED_FUNCTION_18_7();
  OUTLINED_FUNCTION_11_2(v2, (__n128)xmmword_23FF60830);
  OUTLINED_FUNCTION_66_0((uint64_t)"spanMatches");
  v3 = OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_20_0(v3);
  v4 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v4 = "contexualMatches";
  *(_QWORD *)(v4 + 8) = 16;
  *(_BYTE *)(v4 + 16) = v0;
  OUTLINED_FUNCTION_16_2(v4);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEF8F78()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_12();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (v1 == 2)
      {
        OUTLINED_FUNCTION_25();
        v3 = OUTLINED_FUNCTION_133_5();
      }
      else
      {
        if (v1 != 1)
          goto LABEL_9;
        OUTLINED_FUNCTION_74_10();
        OUTLINED_FUNCTION_99_8();
      }
      sub_23FE1C624(v3);
LABEL_9:
      v1 = OUTLINED_FUNCTION_40_2();
    }
  }
  OUTLINED_FUNCTION_92_5();
}

void sub_23FEF9018()
{
  uint64_t v0;
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_120_5();
  v3 = v1[1];
  if (*(_QWORD *)(*v1 + 16))
  {
    OUTLINED_FUNCTION_74_10();
    OUTLINED_FUNCTION_236_2();
    OUTLINED_FUNCTION_64_7(v4, v5, v6, v7, v8, v9);
    v0 = v2;
  }
  if (!v0 && *(_QWORD *)(v3 + 16))
  {
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_243_2();
    OUTLINED_FUNCTION_64_7(v10, v11, v12, v13, v14, v15);
  }
  OUTLINED_FUNCTION_7_15();
}

void sub_23FEF90A4()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEF90B0@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB690, (uint64_t)&unk_256FAFA38, a1);
}

void sub_23FEF90D0()
{
  sub_23FEF8F78();
}

void sub_23FEF90E4()
{
  sub_23FEF9018();
}

void sub_23FEF90F8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  __n128 *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  OUTLINED_FUNCTION_31_3();
  v3 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v3);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v4 = (__n128 *)OUTLINED_FUNCTION_0_33();
  OUTLINED_FUNCTION_11_2(v4, (__n128)xmmword_23FF614F0);
  OUTLINED_FUNCTION_66_0((uint64_t)"sessionScopedUniqueId");
  v5 = OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_20_0(v5);
  v6 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v6 = "contextType";
  *(_QWORD *)(v6 + 8) = 11;
  *(_BYTE *)(v6 + 16) = v2;
  OUTLINED_FUNCTION_16_2(v6);
  v7 = OUTLINED_FUNCTION_24_10((_QWORD *)(v1 + 2 * v0));
  *(_QWORD *)v7 = "valueType";
  *((_QWORD *)v7 + 1) = 9;
  v7[16] = v2;
  OUTLINED_FUNCTION_16_2((uint64_t)v7);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEF91C0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_20();
  v1 = OUTLINED_FUNCTION_12();
  v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(v1)
      {
        case 3:
          v4 = OUTLINED_FUNCTION_80_5();
          OUTLINED_FUNCTION_84_5(*(int *)(v4 + 24));
          break;
        case 2:
          v6 = OUTLINED_FUNCTION_80_5();
          OUTLINED_FUNCTION_84_5(*(int *)(v6 + 20));
          v5 = v3;
          sub_23FE1C9B0();
          goto LABEL_11;
        case 1:
          OUTLINED_FUNCTION_25();
          OUTLINED_FUNCTION_122_7();
          break;
        default:
          goto LABEL_12;
      }
      v5 = v3;
      sub_23FE1C4DC();
LABEL_11:
      v3 = v5;
LABEL_12:
      v1 = OUTLINED_FUNCTION_40_2();
    }
  }
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEF92A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 *v14;
  uint64_t _0[12];

  OUTLINED_FUNCTION_71_9(a1, a2, a3, a4, a5, a6, a7, a8, _0[0], _0[1], _0[2], _0[3], _0[4], _0[5], _0[6], _0[7], _0[8], _0[9], _0[10],
    _0[11]);
  if (!v8)
  {
    OUTLINED_FUNCTION_80_5();
    OUTLINED_FUNCTION_104_6();
    if ((*(_BYTE *)(v11 + 9) & 1) == 0)
    {
      OUTLINED_FUNCTION_148_4();
      OUTLINED_FUNCTION_83_0((uint64_t)_0, 2, v12, (uint64_t)&type metadata for IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType, v13, (uint64_t)&off_2510221D8);
    }
    v14 = (__n128 *)(v9 + *(int *)(v10 + 24));
    if (v14->n128_u64[1] != 1)
    {
      OUTLINED_FUNCTION_124_5(v14);
      OUTLINED_FUNCTION_30_0();
    }
  }
  OUTLINED_FUNCTION_68_6();
}

void sub_23FEF934C()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEF9358@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB698, (uint64_t)&unk_256FAFA50, a1);
}

void sub_23FEF9378()
{
  sub_23FEF91C0();
}

void sub_23FEF938C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23FEF92A4(a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_23FEF93A0()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;

  OUTLINED_FUNCTION_31_3();
  v1 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v1);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = OUTLINED_FUNCTION_18_7();
  *(_OWORD *)(v6 + 16) = xmmword_23FF5FA60;
  v7 = v6 + v5 + *(int *)(v2 + 48);
  OUTLINED_FUNCTION_72_0();
  OUTLINED_FUNCTION_71_0((uint64_t)"sessionScopedUniqueId");
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_1_9(v7);
  v8 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v8 = "valueType";
  *(_QWORD *)(v8 + 8) = 9;
  *(_BYTE *)(v8 + 16) = v0;
  OUTLINED_FUNCTION_1_9(v8);
  v9 = OUTLINED_FUNCTION_24_10((_QWORD *)(v6 + v5 + 2 * v4));
  *(_QWORD *)v9 = "matches";
  *((_QWORD *)v9 + 1) = 7;
  v9[16] = v0;
  OUTLINED_FUNCTION_1_9((uint64_t)v9);
  v10 = OUTLINED_FUNCTION_51_5((_QWORD *)(v6 + v5 + 3 * v4));
  *(_QWORD *)v10 = "dataProtectionClass";
  *((_QWORD *)v10 + 1) = 19;
  v10[16] = v0;
  OUTLINED_FUNCTION_1_9((uint64_t)v10);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEF94C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_16_3();
  if (!v12)
  {
    while ((v13 & 1) == 0)
    {
      OUTLINED_FUNCTION_238();
      if (!(!v24 & v23))
      {
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_23FEF953C + 4 * byte_23FF6FB50[v22]))(v14, v15, v16, v17, v18, v19, v20, v21, a9, a10, a11, a12);
        return;
      }
      OUTLINED_FUNCTION_40_11();
    }
  }
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEF95F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t _0[12];

  OUTLINED_FUNCTION_71_9(a1, a2, a3, a4, a5, a6, a7, a8, _0[0], _0[1], _0[2], _0[3], _0[4], _0[5], _0[6], _0[7], _0[8], _0[9], _0[10],
    _0[11]);
  if (!v8)
  {
    OUTLINED_FUNCTION_74_10();
    OUTLINED_FUNCTION_104_6();
    if (v13->n128_u64[1] != 1)
    {
      OUTLINED_FUNCTION_124_5(v13);
      OUTLINED_FUNCTION_30_0();
    }
    v14 = *(_QWORD *)(v9 + *(int *)(v10 + 24));
    if (*(_QWORD *)(v14 + 16))
      OUTLINED_FUNCTION_55_7(v14, 3, v11, (uint64_t)&type metadata for IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch, v12, (uint64_t)&off_25102F0C8);
    if ((*(_BYTE *)(v9 + *(int *)(v10 + 28) + 9) & 1) == 0)
    {
      OUTLINED_FUNCTION_148_4();
      OUTLINED_FUNCTION_83_0((uint64_t)_0, 4, v15, (uint64_t)&type metadata for IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass, v16, (uint64_t)&off_25102EFB8);
    }
  }
  OUTLINED_FUNCTION_68_6();
}

void sub_23FEF96D0()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEF96DC@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB6A0, (uint64_t)&unk_256FAFA68, a1);
}

#error "23FEF9704: call analysis failed (funcsize=5)"

void sub_23FEF9710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_23FEF95F8(a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_23FEF9724()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;

  OUTLINED_FUNCTION_22_7();
  v1 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v1);
  OUTLINED_FUNCTION_23_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  OUTLINED_FUNCTION_44_0();
  v3 = OUTLINED_FUNCTION_54_0();
  *(_OWORD *)(v3 + 16) = xmmword_23FF61530;
  v4 = v3 + v1 + *(int *)(v2 + 48);
  *(_QWORD *)(v3 + v1) = 1;
  *(_QWORD *)v4 = "startIndex";
  *(_QWORD *)(v4 + 8) = 10;
  *(_BYTE *)(v4 + 16) = 2;
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_13_11(v4);
  v5 = OUTLINED_FUNCTION_53_0(v3 + v1 + v0);
  *v6 = 2;
  *(_QWORD *)v5 = "endIndex";
  *(_QWORD *)(v5 + 8) = 8;
  *(_BYTE *)(v5 + 16) = 2;
  OUTLINED_FUNCTION_13_11(v5);
  v7 = OUTLINED_FUNCTION_19_6((_QWORD *)(v3 + v1 + 2 * v0));
  *(_QWORD *)v7 = "matchingTransforms";
  *((_QWORD *)v7 + 1) = 18;
  v7[16] = 2;
  OUTLINED_FUNCTION_13_11((uint64_t)v7);
  v8 = OUTLINED_FUNCTION_26_5((_QWORD *)(v3 + v1 + 3 * v0));
  *(_QWORD *)v8 = "matcher";
  *((_QWORD *)v8 + 1) = 7;
  v8[16] = 2;
  OUTLINED_FUNCTION_13_11((uint64_t)v8);
  v9 = OUTLINED_FUNCTION_39_1((_QWORD *)(v3 + v1 + 4 * v0));
  *(_QWORD *)v9 = "matchScore";
  *((_QWORD *)v9 + 1) = 10;
  v9[16] = 2;
  OUTLINED_FUNCTION_13_11((uint64_t)v9);
  v10 = OUTLINED_FUNCTION_53_0(v3 + v1 + 5 * v0);
  *v11 = 6;
  *(_QWORD *)v10 = "originAppBundleId";
  *(_QWORD *)(v10 + 8) = 17;
  *(_BYTE *)(v10 + 16) = 2;
  OUTLINED_FUNCTION_13_11(v10);
  sub_23FF58EE0();
  OUTLINED_FUNCTION_3_10();
}

void sub_23FEF98B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  OUTLINED_FUNCTION_20();
  v4 = OUTLINED_FUNCTION_12();
  if (!v1)
  {
    while ((v5 & 1) == 0)
    {
      switch(v4)
      {
        case 1:
        case 2:
          OUTLINED_FUNCTION_207_2();
          break;
        case 3:
          sub_23FE1CB50(v0 + 16, v3, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform, v2, &off_25102EF90);
          break;
        case 4:
          sub_23FE1C9B0();
          break;
        case 5:
          OUTLINED_FUNCTION_153_0();
          break;
        case 6:
          OUTLINED_FUNCTION_74_0();
          break;
        default:
          break;
      }
      v4 = OUTLINED_FUNCTION_40_2();
    }
  }
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEF99A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 *v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[16];
  uint64_t v14[2];
  _BYTE v15[16];
  uint64_t v16;
  uint64_t v17;

  OUTLINED_FUNCTION_86_6();
  v5 = v4[1];
  v9 = *v4;
  v10 = v5;
  v6 = v4[3];
  v11 = v4[2];
  v12 = v6;
  OUTLINED_FUNCTION_14_22((uint64_t)&v9, (uint64_t)v15);
  OUTLINED_FUNCTION_14_22((uint64_t)v15, (uint64_t)&v16);
  if ((v16 & 0x100000000) != 0)
  {
    if (v0)
      return;
  }
  else
  {
    OUTLINED_FUNCTION_118_5();
    v0 = v1;
    if (v1)
      return;
  }
  OUTLINED_FUNCTION_14_22((uint64_t)&v9 + 8, (uint64_t)v15);
  OUTLINED_FUNCTION_14_22((uint64_t)v15, (uint64_t)&v16);
  if ((v16 & 0x100000000) != 0 || (OUTLINED_FUNCTION_118_5(), (v0 = v1) == 0))
  {
    if (!*(_QWORD *)(v10 + 16)
      || (v1 = v0,
          sub_23FE1D370(v10, 3, v3, (uint64_t)&type metadata for IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform, v2, (uint64_t)&off_25102EF90), !v0))
    {
      OUTLINED_FUNCTION_14_22((uint64_t)&v10 + 8, (uint64_t)v15);
      OUTLINED_FUNCTION_14_22((uint64_t)v15, (uint64_t)&v16);
      if ((v17 & 0x100) != 0
        || (sub_23FEFB354(&v16, (uint64_t)v14),
            sub_23FEFB354(v14, (uint64_t)v13),
            OUTLINED_FUNCTION_83_0((uint64_t)v13, 4, v7, (uint64_t)&type metadata for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType, v8, (uint64_t)&off_25102EF68), (v0 = v1) == 0))
      {
        OUTLINED_FUNCTION_14_22((uint64_t)&v11 + 4, (uint64_t)v15);
        OUTLINED_FUNCTION_14_22((uint64_t)v15, (uint64_t)&v16);
        if ((v16 & 0x100000000) != 0 || (sub_23FF58E50(), !v0))
        {
          OUTLINED_FUNCTION_14_22((uint64_t)&v12, (uint64_t)v15);
          OUTLINED_FUNCTION_14_22((uint64_t)v15, (uint64_t)&v16);
          if (v17)
            OUTLINED_FUNCTION_69_0();
        }
      }
    }
  }
}

void sub_23FEF9B8C()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEF9B98@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB6A8, (uint64_t)&unk_256FAFA80, a1);
}

void sub_23FEF9BB8()
{
  sub_23FEF98B0();
}

void sub_23FEF9BCC()
{
  sub_23FEF99A4();
}

void sub_23FEF9BE0()
{
  char v0;
  uint64_t v1;
  __n128 *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_31_3();
  v1 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v1);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v2 = (__n128 *)OUTLINED_FUNCTION_18_7();
  OUTLINED_FUNCTION_11_2(v2, (__n128)xmmword_23FF60830);
  OUTLINED_FUNCTION_66_0((uint64_t)"bundleId");
  v3 = OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_20_0(v3);
  v4 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v4 = "nameOfTypedValue";
  *(_QWORD *)(v4 + 8) = 16;
  *(_BYTE *)(v4 + 16) = v0;
  OUTLINED_FUNCTION_16_2(v4);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEF9CA4()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEF9CB0@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB6B0, (uint64_t)&unk_256FAFA98, a1);
}

IntelligencePlatformLibrary::IntelligenceFlowQueryDecorationTelemetry::QDCollectionStarted sub_23FEF9CD0@<W0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  IntelligencePlatformLibrary::IntelligenceFlowQueryDecorationTelemetry::QDCollectionStarted result;

  v2 = swift_allocObject();
  result.exists.value = IntelligenceFlowQueryDecorationTelemetry.QDCollectionStarted.init()().exists.value;
  *a1 = v2;
  return result;
}

uint64_t sub_23FEF9D10()
{
  return swift_deallocObject();
}

void sub_23FEF9D20()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  __n128 *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  OUTLINED_FUNCTION_31_3();
  v3 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v3);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v4 = (__n128 *)OUTLINED_FUNCTION_0_33();
  OUTLINED_FUNCTION_11_2(v4, (__n128)xmmword_23FF614F0);
  OUTLINED_FUNCTION_66_0((uint64_t)"startedOrChanged");
  v5 = OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_20_0(v5);
  v6 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v6 = "ended";
  *(_QWORD *)(v6 + 8) = 5;
  *(_BYTE *)(v6 + 16) = v2;
  OUTLINED_FUNCTION_16_2(v6);
  v7 = OUTLINED_FUNCTION_24_10((_QWORD *)(v1 + 2 * v0));
  *(_QWORD *)v7 = "failed";
  *((_QWORD *)v7 + 1) = 6;
  v7[16] = v2;
  OUTLINED_FUNCTION_16_2((uint64_t)v7);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEF9DE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  __int128 *v7;
  int v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[8];
  uint64_t v15;
  int v16;
  char v17;
  __int128 v18;
  int v19;
  char v20;

  v2 = OUTLINED_FUNCTION_16_3();
  if (!v1)
  {
    while ((v3 & 1) == 0)
    {
      switch(v2)
      {
        case 3:
          v18 = xmmword_23FF614D0;
          v20 = 0;
          v19 = 0;
          OUTLINED_FUNCTION_46_1();
          OUTLINED_FUNCTION_72_4();
          v6 = *((_QWORD *)&v18 + 1);
          if (*((_QWORD *)&v18 + 1) == 1)
          {
            v7 = (__int128 *)v14;
            IntelligenceFlowQueryDecorationTelemetry.QDCollectionFailed.init()((uint64_t)v14);
            v6 = v15;
            v8 = v16;
            v9 = v17;
          }
          else
          {
            v8 = v19;
            v9 = v20 & 1;
            v7 = &v18;
          }
          v12 = *(_QWORD *)v7;
          v13 = swift_allocObject();
          *(_QWORD *)(v13 + 16) = v12;
          *(_QWORD *)(v13 + 24) = v6;
          *(_DWORD *)(v13 + 32) = v8;
          *(_BYTE *)(v13 + 36) = v9;
          *v0 = v13 | 0x8000000000000000;
          break;
        case 2:
          LOBYTE(v18) = 3;
          OUTLINED_FUNCTION_46_1();
          OUTLINED_FUNCTION_72_4();
          v10 = v18;
          if (v18 == 3)
          {
            IntelligenceFlowQueryDecorationTelemetry.QDCollectionCompleted.init()();
            v10 = v14[0];
          }
          v11 = OUTLINED_FUNCTION_93_2();
          *(_BYTE *)(v11 + 16) = v10;
          *v0 = v11 | 0x4000000000000000;
          break;
        case 1:
          LOBYTE(v18) = 3;
          OUTLINED_FUNCTION_46_1();
          OUTLINED_FUNCTION_72_4();
          v4 = v18;
          if (v18 == 3)
          {
            IntelligenceFlowQueryDecorationTelemetry.QDCollectionStarted.init()();
            v4 = v14[0];
          }
          v5 = OUTLINED_FUNCTION_93_2();
          *(_BYTE *)(v5 + 16) = v4;
          *v0 = v5;
          break;
      }
      v2 = OUTLINED_FUNCTION_111_0();
    }
  }
}

uint64_t sub_23FEFA000()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_23FEFA024()
{
  OUTLINED_FUNCTION_227();
  sub_23FE1D118();
  OUTLINED_FUNCTION_194();
}

void sub_23FEFA0D0()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEFA0DC@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB6B8, (uint64_t)&unk_256FAFAB0, a1);
}

void sub_23FEFA0FC()
{
  sub_23FEF9DE8();
}

void sub_23FEFA110()
{
  sub_23FEFA024();
}

void sub_23FEFA124()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;

  OUTLINED_FUNCTION_31_3();
  v1 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v1);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = OUTLINED_FUNCTION_18_7();
  *(_OWORD *)(v6 + 16) = xmmword_23FF5FA60;
  v7 = v6 + v5 + *(int *)(v2 + 48);
  OUTLINED_FUNCTION_72_0();
  OUTLINED_FUNCTION_71_0((uint64_t)"retrievedTools");
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_1_9(v7);
  v8 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v8 = "spanMatchedEntities";
  *(_QWORD *)(v8 + 8) = 19;
  *(_BYTE *)(v8 + 16) = v0;
  OUTLINED_FUNCTION_1_9(v8);
  v9 = OUTLINED_FUNCTION_24_10((_QWORD *)(v6 + v5 + 2 * v4));
  *(_QWORD *)v9 = "utteranceContext";
  *((_QWORD *)v9 + 1) = 16;
  v9[16] = v0;
  OUTLINED_FUNCTION_1_9((uint64_t)v9);
  v10 = OUTLINED_FUNCTION_51_5((_QWORD *)(v6 + v5 + 3 * v4));
  *(_QWORD *)v10 = "requiredContext";
  *((_QWORD *)v10 + 1) = 15;
  v10[16] = v0;
  OUTLINED_FUNCTION_1_9((uint64_t)v10);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEFA24C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_16_3();
  if (!v13)
  {
    while ((v14 & 1) == 0)
    {
      OUTLINED_FUNCTION_238();
      if (!(!v25 & v24))
      {
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_23FEFA2C0 + 4 * byte_23FF6FB5A[v23]))(v15, v16, v17, v18, v19, v20, v21, v22, a9, v12 + 24, a11, a12);
        return;
      }
      OUTLINED_FUNCTION_40_11();
    }
  }
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEFA33C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
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

  OUTLINED_FUNCTION_86_6();
  v4 = *v2;
  v3 = v2[1];
  v6 = v2[2];
  v5 = v2[3];
  if (*(_QWORD *)(*v2 + 16))
  {
    v7 = OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_55_7(v4, 1, v8, v7, v9, (uint64_t)&off_25102D290);
    v0 = v1;
  }
  if (!v0)
  {
    if (!*(_QWORD *)(v3 + 16)
      || (v10 = OUTLINED_FUNCTION_25(), OUTLINED_FUNCTION_55_7(v3, 2, v11, v10, v12, (uint64_t)&off_25102D290), !v1))
    {
      if (!*(_QWORD *)(v6 + 16)
        || (v13 = OUTLINED_FUNCTION_25(), OUTLINED_FUNCTION_55_7(v6, 3, v14, v13, v15, (uint64_t)&off_25102D290), !v1))
      {
        if (*(_QWORD *)(v5 + 16))
        {
          v16 = OUTLINED_FUNCTION_80_5();
          OUTLINED_FUNCTION_55_7(v5, 4, v17, v16, v18, (uint64_t)&off_2510226D0);
        }
      }
    }
  }
  OUTLINED_FUNCTION_92_5();
}

void sub_23FEFA41C()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEFA428@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB6C0, (uint64_t)&unk_256FAFAC8, a1);
}

#error "23FEFA450: call analysis failed (funcsize=5)"

void sub_23FEFA45C()
{
  sub_23FEFA33C();
}

void sub_23FEFA470()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  __n128 *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  OUTLINED_FUNCTION_31_3();
  v3 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v3);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v4 = (__n128 *)OUTLINED_FUNCTION_0_33();
  OUTLINED_FUNCTION_11_2(v4, (__n128)xmmword_23FF614F0);
  OUTLINED_FUNCTION_66_0((uint64_t)"numberOfTuples");
  v5 = OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_20_0(v5);
  v6 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v6 = "maximumTupleWidth";
  *(_QWORD *)(v6 + 8) = 17;
  *(_BYTE *)(v6 + 16) = v2;
  OUTLINED_FUNCTION_16_2(v6);
  v7 = OUTLINED_FUNCTION_24_10((_QWORD *)(v1 + 2 * v0));
  *(_QWORD *)v7 = "wasToolTupleLimitReached";
  *((_QWORD *)v7 + 1) = 24;
  v7[16] = v2;
  OUTLINED_FUNCTION_16_2((uint64_t)v7);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEFA538()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_12();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (v1 == 3)
      {
        OUTLINED_FUNCTION_152_0();
      }
      else if (v1 == 2 || v1 == 1)
      {
        OUTLINED_FUNCTION_207_2();
      }
      v1 = OUTLINED_FUNCTION_40_2();
    }
  }
  OUTLINED_FUNCTION_33_1();
}

void sub_23FEFA5B0()
{
  _BYTE *v0;
  uint64_t v1;
  char v2;
  int v3;

  v2 = v0[12];
  v3 = v0[13];
  if ((v0[4] & 1) == 0)
    OUTLINED_FUNCTION_97_5();
  if (!v1)
  {
    if ((v2 & 1) == 0)
      OUTLINED_FUNCTION_97_5();
    if (v3 != 2)
    {
      OUTLINED_FUNCTION_88_5();
      sub_23FF58E14();
    }
  }
  OUTLINED_FUNCTION_7_15();
}

void sub_23FEFA634()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEFA640@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB6C8, (uint64_t)&unk_256FAFAE0, a1);
}

void sub_23FEFA660()
{
  sub_23FEFA538();
}

void sub_23FEFA674()
{
  sub_23FEFA5B0();
}

void sub_23FEFA688()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  __n128 *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  OUTLINED_FUNCTION_31_3();
  v3 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v3);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v4 = (__n128 *)OUTLINED_FUNCTION_0_33();
  OUTLINED_FUNCTION_11_2(v4, (__n128)xmmword_23FF614F0);
  OUTLINED_FUNCTION_66_0((uint64_t)"retrievedTools");
  v5 = OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_20_0(v5);
  v6 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v6 = "spanMatchedEntities";
  *(_QWORD *)(v6 + 8) = 19;
  *(_BYTE *)(v6 + 16) = v2;
  OUTLINED_FUNCTION_16_2(v6);
  v7 = OUTLINED_FUNCTION_24_10((_QWORD *)(v1 + 2 * v0));
  *(_QWORD *)v7 = "utteranceContext";
  *((_QWORD *)v7 + 1) = 16;
  v7[16] = v2;
  OUTLINED_FUNCTION_16_2((uint64_t)v7);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEFA750()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  OUTLINED_FUNCTION_20();
  v1 = OUTLINED_FUNCTION_12();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(v1)
      {
        case 3:
          OUTLINED_FUNCTION_80_5();
          v3 = OUTLINED_FUNCTION_133_5();
          break;
        case 2:
          OUTLINED_FUNCTION_74_10();
          OUTLINED_FUNCTION_122_7();
          break;
        case 1:
          OUTLINED_FUNCTION_70_9();
          OUTLINED_FUNCTION_99_8();
          break;
        default:
          goto LABEL_11;
      }
      sub_23FE1C624(v3);
LABEL_11:
      v1 = OUTLINED_FUNCTION_40_2();
    }
  }
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEFA814()
{
  uint64_t v0;
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  OUTLINED_FUNCTION_120_5();
  v5 = v1[1];
  v6 = v1[2];
  if (*(_QWORD *)(*v1 + 16))
  {
    OUTLINED_FUNCTION_70_9();
    OUTLINED_FUNCTION_236_2();
    OUTLINED_FUNCTION_64_7(v7, v8, v9, v10, v11, v12);
    v0 = v2;
  }
  if (!v0)
  {
    if (!*(_QWORD *)(v5 + 16)
      || (OUTLINED_FUNCTION_74_10(), OUTLINED_FUNCTION_243_2(),
                                     OUTLINED_FUNCTION_64_7(v13, v14, v15, v16, v17, v18),
                                     !v2))
    {
      if (*(_QWORD *)(v6 + 16))
      {
        v19 = OUTLINED_FUNCTION_80_5();
        OUTLINED_FUNCTION_64_7(v6, 3, v4, v19, v3, (uint64_t)&off_2510226D0);
      }
    }
  }
  OUTLINED_FUNCTION_92_5();
}

void sub_23FEFA8E0()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEFA8EC@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB6D0, (uint64_t)&unk_256FAFAF8, a1);
}

void sub_23FEFA90C()
{
  sub_23FEFA750();
}

void sub_23FEFA920()
{
  sub_23FEFA814();
}

uint64_t sub_23FEFA934(uint64_t a1)
{
  return sub_23FEFB1A0(a1, qword_256FAFB10, 1, (uint64_t)"subComponent", 12);
}

void sub_23FEFA950()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_12();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (v1 == 1)
      {
        OUTLINED_FUNCTION_63_5();
        sub_23FE1C9B0();
      }
      v1 = OUTLINED_FUNCTION_40_2();
    }
  }
  OUTLINED_FUNCTION_33_1();
}

uint64_t sub_23FEFA9A4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;

  if ((*(_BYTE *)(v0 + 9) & 1) == 0)
  {
    OUTLINED_FUNCTION_227();
    v1 = *(_BYTE *)(v0 + 8);
    v6 = v2;
    v7 = v1 & 1;
    return sub_23FE1D294((uint64_t)&v6, 1, v3, (uint64_t)&type metadata for IntelligenceFlowQueryDecorationTelemetry.QDSubComponent, v4, (uint64_t)&off_251021BD0);
  }
  return result;
}

void sub_23FEFAA00()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEFAA0C@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB6D8, (uint64_t)qword_256FAFB10, a1);
}

void sub_23FEFAA2C()
{
  sub_23FEFA950();
}

uint64_t sub_23FEFAA40()
{
  return sub_23FEFA9A4();
}

uint64_t sub_23FEFAA54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return OUTLINED_FUNCTION_65_7(a1, qword_256FAFB28, a3, (uint64_t)"exists");
}

void sub_23FEFAA68()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  while (1)
  {
    v1 = sub_23FF58CDC();
    if (v0 || (v2 & 1) != 0)
      break;
    if (v1 == 1)
      OUTLINED_FUNCTION_152_0();
  }
  OUTLINED_FUNCTION_249();
}

void sub_23FEFAAC4()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEFAAD0@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB6E0, (uint64_t)qword_256FAFB28, a1);
}

void sub_23FEFAAF0()
{
  char v0;
  uint64_t v1;
  __n128 *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_31_3();
  v1 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v1);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v2 = (__n128 *)OUTLINED_FUNCTION_18_7();
  OUTLINED_FUNCTION_11_2(v2, (__n128)xmmword_23FF60830);
  OUTLINED_FUNCTION_66_0((uint64_t)"errorDomain");
  v3 = OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_20_0(v3);
  v4 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v4 = "errorCode";
  *(_QWORD *)(v4 + 8) = 9;
  *(_BYTE *)(v4 + 16) = v0;
  OUTLINED_FUNCTION_16_2(v4);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEFABB4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_12();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (v1 == 2)
      {
        sub_23FF58D3C();
      }
      else if (v1 == 1)
      {
        OUTLINED_FUNCTION_74_0();
      }
      v1 = OUTLINED_FUNCTION_40_2();
    }
  }
  OUTLINED_FUNCTION_214();
}

uint64_t sub_23FEFAC20()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *(_BYTE *)(v0 + 20);
  if (*(_QWORD *)(v0 + 8))
    result = OUTLINED_FUNCTION_52_0();
  if (!v1 && (v2 & 1) == 0)
  {
    OUTLINED_FUNCTION_88_5();
    return sub_23FF58E5C();
  }
  return result;
}

void sub_23FEFAC98()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEFACA4@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB6E8, (uint64_t)&unk_256FAFB40, a1);
}

void sub_23FEFACC4()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;

  OUTLINED_FUNCTION_31_3();
  v1 = OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_30_4(v1);
  OUTLINED_FUNCTION_17_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = OUTLINED_FUNCTION_18_7();
  *(_OWORD *)(v6 + 16) = xmmword_23FF5FA60;
  v7 = v6 + v5 + *(int *)(v2 + 48);
  OUTLINED_FUNCTION_72_0();
  OUTLINED_FUNCTION_71_0((uint64_t)"startedOrChanged");
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_1_9(v7);
  v8 = OUTLINED_FUNCTION_35_4();
  *(_QWORD *)v8 = "ended";
  *(_QWORD *)(v8 + 8) = 5;
  *(_BYTE *)(v8 + 16) = v0;
  OUTLINED_FUNCTION_1_9(v8);
  v9 = OUTLINED_FUNCTION_24_10((_QWORD *)(v6 + v5 + 2 * v4));
  *(_QWORD *)v9 = "failed";
  *((_QWORD *)v9 + 1) = 6;
  v9[16] = v0;
  OUTLINED_FUNCTION_1_9((uint64_t)v9);
  v10 = OUTLINED_FUNCTION_51_5((_QWORD *)(v6 + v5 + 3 * v4));
  *(_QWORD *)v10 = "traceId";
  *((_QWORD *)v10 + 1) = 7;
  v10[16] = v0;
  OUTLINED_FUNCTION_1_9((uint64_t)v10);
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_7();
}

void sub_23FEFADEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_16_3();
  if (!v12)
  {
    while ((v13 & 1) == 0)
    {
      OUTLINED_FUNCTION_238();
      if (!(!v24 & v23))
      {
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_23FEFAE50 + 4 * byte_23FF6FB5E[v22]))(v14, v15, v16, v17, v18, v19, v20, v21, a9, a10, a11, a12);
        return;
      }
      OUTLINED_FUNCTION_40_11();
    }
  }
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEFAF00()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_215();
  if ((*(_BYTE *)(v0 + 10) & 1) == 0)
    OUTLINED_FUNCTION_92_8();
  if (!v1)
  {
    if (*(_BYTE *)(v0 + 11) != 3)
      OUTLINED_FUNCTION_92_8();
    if (*(_QWORD *)(v0 + 24) != 1)
      OUTLINED_FUNCTION_92_8();
    OUTLINED_FUNCTION_88_5();
    sub_23FEFAFF8();
  }
}

void sub_23FEFAFF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8_21();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v1);
  v2 = OUTLINED_FUNCTION_73_8();
  OUTLINED_FUNCTION_37_10(*(int *)(v2 + 28));
  v3 = OUTLINED_FUNCTION_22();
  if (v4)
  {
    OUTLINED_FUNCTION_34_4(v3, &qword_256F90740);
  }
  else
  {
    OUTLINED_FUNCTION_21_17();
    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_19_11();
  }
  OUTLINED_FUNCTION_160_0();
  OUTLINED_FUNCTION_9_1();
}

void sub_23FEFB0C0()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEFB0CC@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB6F0, (uint64_t)&unk_256FAFB58, a1);
}

#error "23FEFB0F4: call analysis failed (funcsize=5)"

void sub_23FEFB100()
{
  sub_23FEFAF00();
}

uint64_t sub_23FEFB114(uint64_t a1)
{
  return sub_23FEFB1A0(a1, qword_256FAFB70, 1, (uint64_t)"clientTraceId", 13);
}

void sub_23FEFB130()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEFB13C@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FAB6F8, (uint64_t)qword_256FAFB70, a1);
}

void sub_23FEFB15C()
{
  sub_23FEFB2A4();
}

uint64_t sub_23FEFB170()
{
  return sub_23FEFB304();
}

uint64_t sub_23FEFB184(uint64_t a1)
{
  return sub_23FEFB1A0(a1, qword_256FAFB88, 1, (uint64_t)"traceId", 7);
}

uint64_t sub_23FEFB1A0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = OUTLINED_FUNCTION_9_7();
  __swift_allocate_value_buffer(v9, a2);
  __swift_project_value_buffer(v9, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  v11 = *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
  v12 = (v11 + 32) & ~v11;
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_23FF5FAF0;
  v14 = v13 + v12 + *(int *)(v10 + 48);
  *(_QWORD *)(v13 + v12) = a3;
  *(_QWORD *)v14 = a4;
  *(_QWORD *)(v14 + 8) = a5;
  *(_BYTE *)(v14 + 16) = 2;
  v15 = *MEMORY[0x24BE5C318];
  v16 = OUTLINED_FUNCTION_28_6();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  return sub_23FF58EE0();
}

void sub_23FEFB2A4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_12();
  v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (v1 == 1)
      {
        OUTLINED_FUNCTION_25();
        OUTLINED_FUNCTION_81_5();
        v3 = v0;
      }
      v0 = v3;
      v1 = OUTLINED_FUNCTION_40_2();
    }
  }
  OUTLINED_FUNCTION_33_1();
}

#error "23FEFB31C: call analysis failed (funcsize=9)"

void sub_23FEFB328()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FEFB334@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(qword_256FAB700, (uint64_t)qword_256FAFB88, a1);
}

uint64_t sub_23FEFB354(uint64_t *a1, uint64_t a2)
{
  __swift_memcpy9_8(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_29_8()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0);
}

void OUTLINED_FUNCTION_55_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  sub_23FE1D218(a1, a2, v7, a4, v6, a6);
}

void OUTLINED_FUNCTION_64_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_23FE1D218(a1, a2, a3, a4, a5, a6);
}

uint64_t OUTLINED_FUNCTION_65_7(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_23FEFB1A0(a1, a2, 1, a4, 6);
}

void OUTLINED_FUNCTION_67_10()
{
  sub_23FE1D118();
}

uint64_t OUTLINED_FUNCTION_70_9()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0);
}

void OUTLINED_FUNCTION_71_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;

  sub_23FEF8600(v20, a1, a2, a3, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

uint64_t OUTLINED_FUNCTION_74_10()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(0);
}

uint64_t OUTLINED_FUNCTION_76_6()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(0);
}

uint64_t OUTLINED_FUNCTION_80_5()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(0);
}

void OUTLINED_FUNCTION_81_5()
{
  sub_23FE1C4DC();
}

uint64_t OUTLINED_FUNCTION_84_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return v1 + a1;
}

void OUTLINED_FUNCTION_85_9()
{
  _QWORD *v0;

  *v0 = 0;
}

char *OUTLINED_FUNCTION_89_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  char *result;

  v4 = (_QWORD *)(v3 + a1 - v2);
  result = (char *)v4 + *(int *)(v1 + 48);
  *v4 = 7;
  return result;
}

void OUTLINED_FUNCTION_92_8()
{
  sub_23FE1D118();
}

void OUTLINED_FUNCTION_96_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t *v12;
  uint64_t v13;
  va_list va;

  va_start(va, a12);
  sub_23FE90A4C((uint64_t)va, v13 - 80, v12);
}

uint64_t OUTLINED_FUNCTION_97_5()
{
  return sub_23FF58EB0();
}

uint64_t OUTLINED_FUNCTION_102_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return v2 + 2 * v1 + *(int *)(v0 + 48);
}

uint64_t OUTLINED_FUNCTION_114_5()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_118_5()
{
  return sub_23FF58EB0();
}

void OUTLINED_FUNCTION_121_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t *v13;
  va_list va;

  va_start(va, a13);
  sub_23FE90A4C(a1, (uint64_t)va, v13);
}

__n128 OUTLINED_FUNCTION_124_5@<Q0>(__n128 *a1@<X8>)
{
  return a1[1];
}

char *OUTLINED_FUNCTION_125_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  char *result;

  v4 = (_QWORD *)(v2 + 2 * v1);
  result = (char *)v4 + *(int *)(v0 + 48);
  *v4 = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_133_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_134_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return v1 + a1;
}

void *sub_23FEFB584()
{
  return &unk_23FF6FD6C;
}

void IntelligenceFlowQueryDecorationTelemetry.writeTimestamp.getter()
{
  sub_23FEFC260(type metadata accessor for IntelligenceFlowQueryDecorationTelemetry);
}

uint64_t type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(uint64_t a1)
{
  return sub_23FE41760(a1, qword_25434EEC0);
}

void IntelligenceFlowQueryDecorationTelemetry.writeTimestamp.setter(uint64_t a1)
{
  sub_23FEFC298(a1, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry);
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.writeTimestamp.modify())()
{
  OUTLINED_FUNCTION_6_28();
  OUTLINED_FUNCTION_331_0();
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.bookmark.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_92_9();
  OUTLINED_FUNCTION_209_0(v0 + *(int *)(v1 + 24), v2, &qword_25434B738);
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.bookmark.setter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_149_5();
  OUTLINED_FUNCTION_85_4();
  OUTLINED_FUNCTION_212_0(v0, v1, &qword_25434B738);
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.bookmark.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0);
  OUTLINED_FUNCTION_85_4();
  return nullsub_1;
}

uint64_t sub_23FEFB664()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = OUTLINED_FUNCTION_123_3();
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(v0);
  v1 = OUTLINED_FUNCTION_426();
  return OUTLINED_FUNCTION_265(v1, v2, v3, v4);
}

uint64_t type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(uint64_t a1)
{
  return sub_23FE41760(a1, (uint64_t *)&unk_25434EE80);
}

void IntelligenceFlowQueryDecorationTelemetry.eventMetadata.getter()
{
  sub_23FF00DD0(type metadata accessor for IntelligenceFlowQueryDecorationTelemetry);
}

void IntelligenceFlowQueryDecorationTelemetry.eventMetadata.setter(uint64_t a1)
{
  sub_23FF00E08(a1, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry);
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.eventMetadata.modify())()
{
  OUTLINED_FUNCTION_6_28();
  OUTLINED_FUNCTION_517();
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.monotonicTimestamp.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_92_9();
  OUTLINED_FUNCTION_209_0(v0 + *(int *)(v1 + 32), v2, &qword_256F8F630);
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.monotonicTimestamp.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_149_5();
  OUTLINED_FUNCTION_212_0(v1, v0 + *(int *)(v1 + 32), &qword_256F8F630);
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.monotonicTimestamp.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0);
  return nullsub_1;
}

uint64_t sub_23FEFB760()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = OUTLINED_FUNCTION_123_3();
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation(v0);
  v1 = OUTLINED_FUNCTION_426();
  return OUTLINED_FUNCTION_265(v1, v2, v3, v4);
}

uint64_t type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation(uint64_t a1)
{
  return sub_23FE41760(a1, (uint64_t *)&unk_25434EEA0);
}

void IntelligenceFlowQueryDecorationTelemetry.invocation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_92_9();
  OUTLINED_FUNCTION_209_0(v0 + *(int *)(v1 + 36), v2, &qword_256F91D90);
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.invocation.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_149_5();
  OUTLINED_FUNCTION_212_0(v1, v0 + *(int *)(v1 + 36), &qword_256F91D90);
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.invocation.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0);
  return nullsub_1;
}

uint64_t sub_23FEFB814()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = OUTLINED_FUNCTION_123_3();
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall(v0);
  v1 = OUTLINED_FUNCTION_426();
  return OUTLINED_FUNCTION_265(v1, v2, v3, v4);
}

uint64_t type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall(uint64_t a1)
{
  return sub_23FE41760(a1, (uint64_t *)&unk_25434EE90);
}

void IntelligenceFlowQueryDecorationTelemetry.jointResolverCall.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_92_9();
  OUTLINED_FUNCTION_209_0(v0 + *(int *)(v1 + 40), v2, &qword_256F91D98);
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.jointResolverCall.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_149_5();
  OUTLINED_FUNCTION_212_0(v1, v0 + *(int *)(v1 + 40), &qword_256F91D98);
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.jointResolverCall.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0);
  return nullsub_1;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.collectionContext.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(OUTLINED_FUNCTION_92_9() + 44));
  *v0 = v2;
  return sub_23FED4488(v2);
}

void IntelligenceFlowQueryDecorationTelemetry.collectionContext.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *(int *)(OUTLINED_FUNCTION_6_28() + 44);
  sub_23FE3D0E0(*(_QWORD *)(v1 + v3));
  *(_QWORD *)(v1 + v3) = v2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.collectionContext.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0);
  return nullsub_1;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.entitiesCollected.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_92_9();
  v1 = OUTLINED_FUNCTION_161_4(*(int *)(v0 + 48));
  return sub_23FEF2BA4(v1);
}

void IntelligenceFlowQueryDecorationTelemetry.entitiesCollected.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t DecorationTelemetry;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __n128 v11;

  v1 = OUTLINED_FUNCTION_205_0();
  DecorationTelemetry = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(v1);
  v3 = sub_23FEF1994(*(_QWORD *)(v0 + *(int *)(DecorationTelemetry + 48)));
  OUTLINED_FUNCTION_278(v3, v4, v5, v6, v7, v8, v9, v10, v11);
  OUTLINED_FUNCTION_80();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.entitiesCollected.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0);
  return nullsub_1;
}

void sub_23FEFB9D4(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 12) = 768;
}

void IntelligenceFlowQueryDecorationTelemetry.tuplesGenerated.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  int v4;

  v2 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_92_9() + 52));
  v3 = *v2;
  v4 = *((_DWORD *)v2 + 2);
  LOWORD(v2) = *((_WORD *)v2 + 6);
  *(_QWORD *)v0 = v3;
  *(_WORD *)(v0 + 12) = (_WORD)v2;
  *(_DWORD *)(v0 + 8) = v4;
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.tuplesGenerated.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  __int16 v4;
  uint64_t v5;

  v2 = *a1;
  v3 = *((_DWORD *)a1 + 2);
  v4 = *((_WORD *)a1 + 6);
  v5 = v1 + *(int *)(type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0) + 52);
  *(_QWORD *)v5 = v2;
  *(_WORD *)(v5 + 12) = v4;
  *(_DWORD *)(v5 + 8) = v3;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.tuplesGenerated.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0);
  return nullsub_1;
}

void sub_23FEFBA88(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.entitiesRanked.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_92_9() + 56));
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  *v0 = *v2;
  v0[1] = v4;
  v0[2] = v5;
  return sub_23FEF2BF0(v3);
}

__n128 IntelligenceFlowQueryDecorationTelemetry.entitiesRanked.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  __n128 result;
  __int128 v5;

  v5 = *a1;
  v2 = *((_QWORD *)a1 + 2);
  v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0) + 56));
  sub_23FEF19E0(*v3);
  *(_OWORD *)v3 = v5;
  v3[2] = v2;
  OUTLINED_FUNCTION_144();
  return result;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.entitiesRanked.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0);
  return nullsub_1;
}

uint64_t sub_23FEFBB3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_371_0();
  v0 = OUTLINED_FUNCTION_426();
  return OUTLINED_FUNCTION_265(v0, v1, v2, v3);
}

uint64_t type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(uint64_t a1)
{
  return sub_23FE41760(a1, (uint64_t *)&unk_25434EEB0);
}

void IntelligenceFlowQueryDecorationTelemetry.subComponentContext.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_92_9();
  OUTLINED_FUNCTION_209_0(v0 + *(int *)(v1 + 60), v2, &qword_256F91DA0);
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.subComponentContext.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_149_5();
  OUTLINED_FUNCTION_212_0(v1, v0 + *(int *)(v1 + 60), &qword_256F91DA0);
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.subComponentContext.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0);
  return nullsub_1;
}

uint64_t sub_23FEFBBEC(_QWORD *a1)
{
  return IntelligenceFlowQueryDecorationTelemetry.QDToolSubType.init(rawValue:)(*a1);
}

void sub_23FEFBBF4(uint64_t *a1@<X8>)
{
  *a1 = IntelligenceFlowQueryDecorationTelemetry.QDToolSubType.rawValue.getter();
  OUTLINED_FUNCTION_13();
}

void sub_23FEFBC14(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  *a4 = static IntelligenceFlowQueryDecorationTelemetry.QDToolSubType.allCases.getter(a1, a2, a3);
  OUTLINED_FUNCTION_13();
}

void sub_23FEFBC34()
{
  OUTLINED_FUNCTION_47_2();
  sub_23FEAD3A0();
}

void sub_23FEFBC54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_17_9();
  sub_23FEFBC74(v0, v1, v2, (void (*)(uint64_t, uint64_t))IntelligenceFlowQueryDecorationTelemetry.QDToolSubType.rawValue.getter);
}

void sub_23FEFBC74(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  a4(a1, a2);
  OUTLINED_FUNCTION_61_1();
  OUTLINED_FUNCTION_144();
}

void sub_23FEFBCA8()
{
  OUTLINED_FUNCTION_17_9();
  sub_23FEFBCC8();
}

void sub_23FEFBCC8()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_23FF592AC();
  OUTLINED_FUNCTION_98_4(v0, v1);
  OUTLINED_FUNCTION_300();
  OUTLINED_FUNCTION_301();
  OUTLINED_FUNCTION_117_1();
}

BOOL sub_23FEFBD0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_13();
  return OUTLINED_FUNCTION_105_4(v0, v1, IntelligenceFlowQueryDecorationTelemetry.QDToolSubType.rawValue.getter, v2);
}

uint64_t sub_23FEFBD30@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType.init(rawValue:)(*a1, a2);
}

void sub_23FEFBD38(_QWORD *a1@<X8>)
{
  *a1 = IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType.rawValue.getter();
  OUTLINED_FUNCTION_13();
}

void sub_23FEFBD58(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v5;

  static IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType.allCases.getter(a1, a2, a3);
  *a4 = v5;
  OUTLINED_FUNCTION_13();
}

void sub_23FEFBD78()
{
  OUTLINED_FUNCTION_47_2();
  sub_23FEAD3A0();
}

void sub_23FEFBD98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_17_9();
  sub_23FEFBC74(v0, v1, v2, (void (*)(uint64_t, uint64_t))IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType.rawValue.getter);
}

void sub_23FEFBDB8()
{
  OUTLINED_FUNCTION_17_9();
  sub_23FEFBCC8();
}

BOOL sub_23FEFBDD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_13();
  return OUTLINED_FUNCTION_105_4(v0, v1, IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType.rawValue.getter, v2);
}

uint64_t sub_23FEFBDFC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.init(rawValue:)(*a1, a2);
}

void sub_23FEFBE04(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.rawValue.getter(a1, a2, a3, a4);
  OUTLINED_FUNCTION_13();
}

void sub_23FEFBE24(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v5;

  static IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.allCases.getter(a1, a2, a3);
  *a4 = v5;
  OUTLINED_FUNCTION_13();
}

void sub_23FEFBE44()
{
  OUTLINED_FUNCTION_47_2();
  sub_23FEAD3A0();
}

void sub_23FEFBE64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_17_9();
  sub_23FEFBC74(v0, v1, v2, (void (*)(uint64_t, uint64_t))IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.rawValue.getter);
}

void sub_23FEFBE84()
{
  OUTLINED_FUNCTION_17_9();
  sub_23FEFBCC8();
}

BOOL sub_23FEFBEA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_13();
  return OUTLINED_FUNCTION_105_4(v0, v1, (uint64_t (*)(void))IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.rawValue.getter, v2);
}

uint64_t sub_23FEFBEC8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.init(rawValue:)(*a1, a2);
}

void sub_23FEFBED0(uint64_t *a1@<X8>)
{
  *a1 = IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.rawValue.getter();
  OUTLINED_FUNCTION_13();
}

void sub_23FEFBEF0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v5;

  static IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.allCases.getter(a1, a2, a3);
  *a4 = v5;
  OUTLINED_FUNCTION_13();
}

void sub_23FEFBF10()
{
  OUTLINED_FUNCTION_47_2();
  sub_23FEAD3A0();
}

void sub_23FEFBF30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_17_9();
  sub_23FEFBC74(v0, v1, v2, (void (*)(uint64_t, uint64_t))IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.rawValue.getter);
}

void sub_23FEFBF50()
{
  OUTLINED_FUNCTION_17_9();
  sub_23FEFBCC8();
}

BOOL sub_23FEFBF70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_13();
  return OUTLINED_FUNCTION_105_4(v0, v1, IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.rawValue.getter, v2);
}

uint64_t sub_23FEFBF94@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform.init(rawValue:)(*a1, a2);
}

void sub_23FEFBF9C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform.rawValue.getter(a1, a2, a3, a4);
  OUTLINED_FUNCTION_13();
}

void sub_23FEFBFBC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v5;

  static IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform.allCases.getter(a1, a2, a3);
  *a4 = v5;
  OUTLINED_FUNCTION_13();
}

void sub_23FEFBFDC()
{
  OUTLINED_FUNCTION_47_2();
  sub_23FEAD3A0();
}

void sub_23FEFBFFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_17_9();
  sub_23FEFBC74(v0, v1, v2, (void (*)(uint64_t, uint64_t))IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform.rawValue.getter);
}

void sub_23FEFC01C()
{
  OUTLINED_FUNCTION_17_9();
  sub_23FEFBCC8();
}

BOOL sub_23FEFC03C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_13();
  return OUTLINED_FUNCTION_105_4(v0, v1, (uint64_t (*)(void))IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform.rawValue.getter, v2);
}

uint64_t sub_23FEFC060@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass.init(rawValue:)(*a1, a2);
}

void sub_23FEFC068(_QWORD *a1@<X8>)
{
  *a1 = IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass.rawValue.getter();
  OUTLINED_FUNCTION_13();
}

void sub_23FEFC088(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v5;

  static IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass.allCases.getter(a1, a2, a3);
  *a4 = v5;
  OUTLINED_FUNCTION_13();
}

void sub_23FEFC0A8()
{
  OUTLINED_FUNCTION_47_2();
  sub_23FEAD3A0();
}

void sub_23FEFC0C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_17_9();
  sub_23FEFBC74(v0, v1, v2, (void (*)(uint64_t, uint64_t))IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass.rawValue.getter);
}

void sub_23FEFC0E8()
{
  OUTLINED_FUNCTION_17_9();
  sub_23FEFBCC8();
}

BOOL sub_23FEFC108()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_13();
  return OUTLINED_FUNCTION_105_4(v0, v1, IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass.rawValue.getter, v2);
}

uint64_t sub_23FEFC12C(_QWORD *a1)
{
  return IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria.init(rawValue:)(*a1);
}

void sub_23FEFC134(_QWORD *a1@<X8>)
{
  *a1 = IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria.rawValue.getter();
  OUTLINED_FUNCTION_13();
}

void sub_23FEFC154(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  *a4 = static IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria.allCases.getter(a1, a2, a3);
  OUTLINED_FUNCTION_13();
}

void sub_23FEFC174()
{
  OUTLINED_FUNCTION_47_2();
  sub_23FEAD3A0();
}

void sub_23FEFC194()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_17_9();
  sub_23FEFBC74(v0, v1, v2, (void (*)(uint64_t, uint64_t))IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria.rawValue.getter);
}

void sub_23FEFC1B4()
{
  OUTLINED_FUNCTION_17_9();
  sub_23FEFBCC8();
}

BOOL sub_23FEFC1D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14_13();
  return OUTLINED_FUNCTION_105_4(v0, v1, IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria.rawValue.getter, v2);
}

void IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata.qdId.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_23FE20874(v1, a1, &qword_256F90740);
}

void IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata.qdId.setter(uint64_t a1)
{
  uint64_t v1;

  sub_23FE208D4(a1, v1, &qword_256F90740);
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata.qdId.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata.rowId.getter()
{
  sub_23FEFC260(type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata);
}

void sub_23FEFC260(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_226_4(a1);
  OUTLINED_FUNCTION_287_2(*(int *)(v1 + 20));
  OUTLINED_FUNCTION_9();
}

void IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata.rowId.setter(uint64_t a1)
{
  sub_23FEFC298(a1, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata);
}

void sub_23FEFC298(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_275_3(a1, a2);
  OUTLINED_FUNCTION_331_0();
  OUTLINED_FUNCTION_645(v2, v3);
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata.rowId.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(0);
  OUTLINED_FUNCTION_331_0();
  return nullsub_1;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata.init()@<X0>(uint64_t a1@<X8>)
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

  OUTLINED_FUNCTION_25();
  v2 = OUTLINED_FUNCTION_173_4();
  v3 = a1 + *(int *)(type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(v2) + 20);
  OUTLINED_FUNCTION_1_2();
  v4 = OUTLINED_FUNCTION_322_0();
  v8 = __swift_storeEnumTagSinglePayload(v4, v5, v6, v7);
  OUTLINED_FUNCTION_37_4(v8, &qword_256F90740);
  OUTLINED_FUNCTION_41(a1, 1);
  sub_23FE24D20(v3, &qword_25434B788);
  v9 = OUTLINED_FUNCTION_322_0();
  return OUTLINED_FUNCTION_225_0(v9, v10, v11, v12);
}

void IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t Decoration;
  char v37;

  OUTLINED_FUNCTION_31_3();
  a19 = v23;
  a20 = v24;
  v25 = v20;
  v26 = OUTLINED_FUNCTION_1_2();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_0_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&a9 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)&a9 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_239_1(v25, (uint64_t)v34);
  if (OUTLINED_FUNCTION_22_15((uint64_t)v34) == 1)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_23FED9174((uint64_t)v34, (uint64_t)v31);
    OUTLINED_FUNCTION_0_16();
    OUTLINED_FUNCTION_260_4(&qword_256F907D8, v35, (uint64_t)&protocol conformance descriptor for AIML.UUID);
    sub_23FF58FAC();
    OUTLINED_FUNCTION_173_6((uint64_t)v31);
  }
  Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(0);
  sub_23FE20874(v25 + *(int *)(Decoration + 20), v22, &qword_25434B788);
  OUTLINED_FUNCTION_68(v22, 1, v26);
  if (v37)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v21, v22, v26);
    OUTLINED_FUNCTION_0_16();
    sub_23FE23908(&qword_256F8F808, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    OUTLINED_FUNCTION_64_3();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v21, v26);
  }
  OUTLINED_FUNCTION_7();
}

void static IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata.== infix(_:_:)()
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
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t Decoration;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
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

  OUTLINED_FUNCTION_31_3();
  v3 = v2;
  v5 = v4;
  v57 = OUTLINED_FUNCTION_1_2();
  v49 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  OUTLINED_FUNCTION_35();
  v48 = v6;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F5E0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_35();
  v56 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_28_8();
  v50 = v10 - v11;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v52 = (uint64_t)&v48 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v54 = (uint64_t)&v48 - v15;
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_124_2();
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F907E0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_0_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_28_8();
  v22 = v20 - v21;
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v48 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v48 - v27;
  v53 = v5;
  OUTLINED_FUNCTION_260_1(v5, (uint64_t)&v48 - v27);
  v55 = v3;
  OUTLINED_FUNCTION_260_1(v3, (uint64_t)v26);
  v29 = v0 + *(int *)(v17 + 48);
  OUTLINED_FUNCTION_260_1((uint64_t)v28, v0);
  OUTLINED_FUNCTION_260_1((uint64_t)v26, v29);
  OUTLINED_FUNCTION_28(v0);
  if (!v32)
  {
    OUTLINED_FUNCTION_209_0(v0, v30, &qword_256F90740);
    OUTLINED_FUNCTION_28(v29);
    if (!v32)
    {
      OUTLINED_FUNCTION_166_5(v29);
      sub_23FE23908(&qword_256F907E8, (uint64_t (*)(uint64_t))type metadata accessor for AIML.UUID, (uint64_t)&protocol conformance descriptor for AIML.UUID);
      OUTLINED_FUNCTION_171();
      v36 = sub_23FF58FB8();
      sub_23FE251BC(v1, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
      OUTLINED_FUNCTION_92_3((uint64_t)v26);
      OUTLINED_FUNCTION_92_3((uint64_t)v28);
      sub_23FE251BC(v22, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
      OUTLINED_FUNCTION_92_3(v0);
      if ((v36 & 1) == 0)
        goto LABEL_21;
      goto LABEL_11;
    }
    OUTLINED_FUNCTION_2_2((uint64_t)v26);
    OUTLINED_FUNCTION_2_2((uint64_t)v28);
    OUTLINED_FUNCTION_238_3(v33, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_9:
    v34 = &qword_256F907E0;
    v35 = v0;
LABEL_20:
    sub_23FE24D20(v35, v34);
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_7_17((uint64_t)v26);
  OUTLINED_FUNCTION_7_17((uint64_t)v28);
  v31 = OUTLINED_FUNCTION_28(v29);
  if (!v32)
    goto LABEL_9;
  OUTLINED_FUNCTION_297_0(v31, &qword_256F90740);
LABEL_11:
  Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(0);
  v38 = v54;
  OUTLINED_FUNCTION_275_1(v53 + *(int *)(Decoration + 20), v54);
  v39 = v52;
  OUTLINED_FUNCTION_275_1(v55 + *(int *)(Decoration + 20), v52);
  v40 = v56;
  v41 = v56 + *(int *)(v51 + 48);
  OUTLINED_FUNCTION_275_1(v38, v56);
  OUTLINED_FUNCTION_275_1(v39, v41);
  v42 = v57;
  OUTLINED_FUNCTION_68(v40, 1, v57);
  if (!v32)
  {
    v43 = v50;
    sub_23FE20874(v40, v50, &qword_25434B788);
    OUTLINED_FUNCTION_68(v41, 1, v42);
    if (!v44)
    {
      v46 = v48;
      v45 = v49;
      OUTLINED_FUNCTION_19_4(v48, v41, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v49 + 32));
      sub_23FE23908((unint64_t *)&qword_256F8F5D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      sub_23FF58FB8();
      v47 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
      v47(v46, v42);
      OUTLINED_FUNCTION_2_2(v39);
      OUTLINED_FUNCTION_2_2(v38);
      v47(v43, v42);
      OUTLINED_FUNCTION_2_2(v40);
      goto LABEL_21;
    }
    OUTLINED_FUNCTION_7_17(v39);
    OUTLINED_FUNCTION_7_17(v38);
    OUTLINED_FUNCTION_107_2(v43, *(uint64_t (**)(uint64_t, uint64_t))(v49 + 8));
    goto LABEL_19;
  }
  OUTLINED_FUNCTION_2_2(v39);
  OUTLINED_FUNCTION_2_2(v38);
  OUTLINED_FUNCTION_68(v41, 1, v42);
  if (!v32)
  {
LABEL_19:
    v34 = &qword_256F8F5E0;
    v35 = v40;
    goto LABEL_20;
  }
  sub_23FE24D20(v40, &qword_25434B788);
LABEL_21:
  OUTLINED_FUNCTION_7();
}

void IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata.hashValue.getter()
{
  sub_23FE44D5C((void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata.hash(into:));
}

void sub_23FEFC9BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23FE44D9C(a1, a2, a3, (void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata.hash(into:));
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDCollectionStarted.exists.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDCollectionStarted.exists.modify())()
{
  return nullsub_1;
}

IntelligencePlatformLibrary::IntelligenceFlowQueryDecorationTelemetry::QDCollectionStarted __swiftcall IntelligenceFlowQueryDecorationTelemetry.QDCollectionStarted.init()()
{
  _BYTE *v0;
  IntelligencePlatformLibrary::IntelligenceFlowQueryDecorationTelemetry::QDCollectionStarted result;

  OUTLINED_FUNCTION_303_1(v0);
  return result;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDCollectionCompleted.exists.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDCollectionFailed.errorDomain.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.QDCollectionFailed.errorDomain.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_120_1();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDCollectionFailed.errorDomain.modify())()
{
  return nullsub_1;
}

unint64_t IntelligenceFlowQueryDecorationTelemetry.QDCollectionFailed.errorCode.getter()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_30(*(unsigned int *)(v0 + 16));
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDCollectionFailed.errorCode.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 16) = result;
  *(_BYTE *)(v1 + 20) = BYTE4(result) & 1;
  return result;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDCollectionFailed.errorCode.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDCollectionFailed.init()(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 20) = 1;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.sessionScopedUniqueId.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.toolId.getter()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0);
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

uint64_t type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(uint64_t a1)
{
  return sub_23FE41760(a1, (uint64_t *)&unk_256FADD10);
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.toolId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2
                + *(int *)(type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0) + 20));
  OUTLINED_FUNCTION_120_1();
  *v5 = a1;
  v5[1] = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.toolId.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0);
  OUTLINED_FUNCTION_331_0();
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.subType.getter()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_191_4();
  OUTLINED_FUNCTION_198_1(*(int *)(v0 + 24));
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.subType.setter()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_240_3();
  OUTLINED_FUNCTION_319_1(*(int *)(v0 + 24));
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.subType.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0);
  OUTLINED_FUNCTION_85_4();
  return nullsub_1;
}

unint64_t IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.similarityScore.getter()
{
  uint64_t v0;
  unsigned int *v1;

  v1 = (unsigned int *)(v0
                      + *(int *)(type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0)
                               + 28));
  return *v1 | ((unint64_t)*((unsigned __int8 *)v1 + 4) << 32);
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.similarityScore.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0) + 28);
  *(_DWORD *)v3 = a1;
  *(_BYTE *)(v3 + 4) = BYTE4(a1) & 1;
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.similarityScore.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0);
  OUTLINED_FUNCTION_517();
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.selectionCriteria.getter()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_191_4();
  OUTLINED_FUNCTION_198_1(*(int *)(v0 + 32));
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.selectionCriteria.setter()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_240_3();
  OUTLINED_FUNCTION_319_1(*(int *)(v0 + 32));
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.selectionCriteria.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0);
  return nullsub_1;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.toolSource.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_191_4() + 36));
  v3 = *v2;
  v4 = v2[1];
  *v0 = *v2;
  v0[1] = v4;
  return sub_23FEFCD28(v3);
}

uint64_t sub_23FEFCD28(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.toolSource.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v2 = *a1;
  v3 = a1[1];
  v4 = (uint64_t *)(v1
                 + *(int *)(type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0) + 36));
  sub_23FEFCD8C(*v4);
  *v4 = v2;
  v4[1] = v3;
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23FEFCD8C(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.toolSource.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0);
  return nullsub_1;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.toolDefinition.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_191_4() + 40));
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  v7 = v2[4];
  v8 = v2[5];
  v9 = v2[6];
  *v0 = *v2;
  v0[1] = v4;
  v0[2] = v5;
  v0[3] = v6;
  v0[4] = v7;
  v0[5] = v8;
  v0[6] = v9;
  return sub_23FEFCE24(v3, v4, v5);
}

uint64_t sub_23FEFCE24(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    sub_23FEFCE84(a2, a3);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_23FEFCE84(uint64_t a1, uint64_t a2)
{
  if (a2 != 2)
    return sub_23FE4F840(a1, a2);
  return a1;
}

__n128 IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.toolDefinition.setter(__n128 *a1)
{
  uint64_t v1;
  unint64_t v2;
  __n128 *v3;
  __n128 result;
  __n128 v5;
  __n128 v6;
  __n128 v7;

  v6 = a1[1];
  v7 = *a1;
  v5 = a1[2];
  v2 = a1[3].n128_u64[0];
  v3 = (__n128 *)(v1
                + *(int *)(type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0) + 40));
  sub_23FEFCF08(v3->n128_u64[0], v3->n128_i64[1], v3[1].n128_i64[0]);
  *v3 = v7;
  v3[1] = v6;
  result = v5;
  v3[2] = v5;
  v3[3].n128_u64[0] = v2;
  return result;
}

uint64_t sub_23FEFCF08(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    sub_23FEFCF68(a2, a3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23FEFCF68(uint64_t a1, uint64_t a2)
{
  if (a2 != 2)
    return sub_23FE33ED4(a1, a2);
  return a1;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.toolDefinition.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0);
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *Decoration;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;

  OUTLINED_FUNCTION_31_3();
  v1 = v0;
  OUTLINED_FUNCTION_25();
  v2 = OUTLINED_FUNCTION_173_4();
  Decoration = (int *)type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(v2);
  v4 = (_QWORD *)(v1 + Decoration[5]);
  *v4 = 0;
  v4[1] = 0;
  v5 = v1 + Decoration[6];
  *(_QWORD *)v5 = 0;
  *(_WORD *)(v5 + 8) = 256;
  v6 = v1 + Decoration[7];
  *(_DWORD *)v6 = 0;
  *(_BYTE *)(v6 + 4) = 1;
  v7 = v1 + Decoration[8];
  *(_QWORD *)v7 = 0;
  *(_WORD *)(v7 + 8) = 256;
  v8 = (uint64_t *)(v1 + Decoration[9]);
  *v8 = 0;
  v8[1] = 0;
  v9 = (uint64_t *)(v1 + Decoration[10]);
  OUTLINED_FUNCTION_374_1();
  OUTLINED_FUNCTION_37_4(v10, &qword_256F90740);
  OUTLINED_FUNCTION_41(v1, 1);
  swift_bridgeObjectRelease();
  *v4 = 0;
  v4[1] = 0;
  *(_QWORD *)v5 = 0;
  *(_WORD *)(v5 + 8) = 256;
  *(_DWORD *)v6 = 0;
  *(_BYTE *)(v6 + 4) = 1;
  *(_QWORD *)v7 = 0;
  *(_WORD *)(v7 + 8) = 256;
  sub_23FEFCD8C(*v8);
  *v8 = 0;
  v8[1] = 0;
  sub_23FEFCF08(*v9, v9[1], v9[2]);
  OUTLINED_FUNCTION_374_1();
  OUTLINED_FUNCTION_7();
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  int *Decoration;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_124_2();
  OUTLINED_FUNCTION_626();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_89_5(v6, v14);
  OUTLINED_FUNCTION_68(v1, 1, v3);
  if (v7)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    OUTLINED_FUNCTION_166_5(v1);
    OUTLINED_FUNCTION_0_16();
    OUTLINED_FUNCTION_317_2(&qword_256F907D8, v8, (uint64_t)&protocol conformance descriptor for AIML.UUID);
    OUTLINED_FUNCTION_73();
    OUTLINED_FUNCTION_222_2();
  }
  Decoration = (int *)type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0);
  if (*(_QWORD *)(v1 + Decoration[5] + 8))
  {
    OUTLINED_FUNCTION_0_16();
    OUTLINED_FUNCTION_4_8();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_16_1();
  }
  else
  {
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_497();
  if (v7)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    OUTLINED_FUNCTION_0_16();
    OUTLINED_FUNCTION_308_2();
    IntelligenceFlowQueryDecorationTelemetry.QDToolSubType.rawValue.getter();
    OUTLINED_FUNCTION_61_1();
  }
  if (*(_BYTE *)(v1 + Decoration[7] + 4) == 1)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    OUTLINED_FUNCTION_0_16();
    sub_23FF592D0();
  }
  OUTLINED_FUNCTION_497();
  if (v7)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    OUTLINED_FUNCTION_0_16();
    OUTLINED_FUNCTION_308_2();
    IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria.rawValue.getter();
    OUTLINED_FUNCTION_61_1();
  }
  v10 = (_QWORD *)(v1 + Decoration[9]);
  if (*v10)
  {
    v11 = v10[1];
    OUTLINED_FUNCTION_0_16();
    OUTLINED_FUNCTION_4_8();
    v12 = OUTLINED_FUNCTION_171();
    sub_23FF02140(v12, v13);
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_112_1();
    sub_23FEDD1CC(a1, v11);
    OUTLINED_FUNCTION_17_3();
  }
  else
  {
    OUTLINED_FUNCTION_5_0();
  }
  if (*(_QWORD *)(v1 + Decoration[10]))
  {
    OUTLINED_FUNCTION_0_16();
    IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition.hash(into:)();
  }
  else
  {
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_8_6();
}

void static IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
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
  char v20;
  uint64_t v21;
  uint64_t v22;
  int *Decoration;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char v30;
  uint64_t *v31;
  int v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  float *v36;
  char v37;
  float *v38;
  int v39;
  uint64_t *v40;
  int v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
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
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
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
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100[8];

  OUTLINED_FUNCTION_31_3();
  v4 = v3;
  v6 = v5;
  v7 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_124_2();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F907E0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_106_4();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_149_3();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v84 - v14;
  OUTLINED_FUNCTION_108_2(v6, (uint64_t)&v84 - v14);
  OUTLINED_FUNCTION_108_2(v4, v2);
  v16 = v0 + *(int *)(v9 + 48);
  OUTLINED_FUNCTION_108_2((uint64_t)v15, v0);
  OUTLINED_FUNCTION_108_2(v2, v16);
  v17 = OUTLINED_FUNCTION_28(v0);
  if (v20)
  {
    OUTLINED_FUNCTION_92_3(v2);
    OUTLINED_FUNCTION_92_3((uint64_t)v15);
    v19 = OUTLINED_FUNCTION_28(v16);
    if (v20)
    {
      OUTLINED_FUNCTION_297_0(v19, &qword_256F90740);
      goto LABEL_11;
    }
LABEL_9:
    OUTLINED_FUNCTION_297_0(v19, &qword_256F907E0);
    goto LABEL_49;
  }
  OUTLINED_FUNCTION_218_3(v17, v18, &qword_256F90740);
  OUTLINED_FUNCTION_28(v16);
  if (v20)
  {
    OUTLINED_FUNCTION_7_17(v2);
    OUTLINED_FUNCTION_7_17((uint64_t)v15);
    OUTLINED_FUNCTION_315_1(v21, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_166_5(v16);
  OUTLINED_FUNCTION_260_4(&qword_256F907E8, v22, (uint64_t)&protocol conformance descriptor for AIML.UUID);
  OUTLINED_FUNCTION_155_4();
  OUTLINED_FUNCTION_165_3();
  OUTLINED_FUNCTION_92_3(v2);
  OUTLINED_FUNCTION_92_3((uint64_t)v15);
  OUTLINED_FUNCTION_173_6(v1);
  OUTLINED_FUNCTION_92_3(v0);
  if ((v7 & 1) == 0)
    goto LABEL_49;
LABEL_11:
  Decoration = (int *)type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0);
  v24 = Decoration[5];
  v25 = (_QWORD *)(v6 + v24);
  v26 = *(_QWORD *)(v6 + v24 + 8);
  v27 = (_QWORD *)(v4 + v24);
  v28 = v27[1];
  if (v26)
  {
    if (!v28)
      goto LABEL_49;
    if (*v25 != *v27 || v26 != v28)
    {
      OUTLINED_FUNCTION_4_3();
      OUTLINED_FUNCTION_59();
      if ((v30 & 1) == 0)
        goto LABEL_49;
    }
  }
  else if (v28)
  {
    goto LABEL_49;
  }
  OUTLINED_FUNCTION_146_5();
  if ((v33 & 1) != 0)
  {
    if (!v32)
      goto LABEL_49;
  }
  else
  {
    if ((v32 & 1) != 0)
      goto LABEL_49;
    OUTLINED_FUNCTION_135_6(v31);
    v34 = IntelligenceFlowQueryDecorationTelemetry.QDToolSubType.rawValue.getter();
    if (v34 != IntelligenceFlowQueryDecorationTelemetry.QDToolSubType.rawValue.getter())
      goto LABEL_49;
  }
  v35 = Decoration[7];
  v36 = (float *)(v6 + v35);
  v37 = *(_BYTE *)(v6 + v35 + 4);
  v38 = (float *)(v4 + v35);
  v39 = *(unsigned __int8 *)(v4 + v35 + 4);
  if ((v37 & 1) != 0)
  {
    if (!v39)
      goto LABEL_49;
LABEL_31:
    OUTLINED_FUNCTION_146_5();
    if ((v42 & 1) != 0)
    {
      if (!v41)
        goto LABEL_49;
    }
    else
    {
      if ((v41 & 1) != 0)
        goto LABEL_49;
      OUTLINED_FUNCTION_135_6(v40);
      v44 = IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria.rawValue.getter(v43);
      if (v44 != IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria.rawValue.getter(v44))
        goto LABEL_49;
    }
    v45 = Decoration[9];
    v47 = *(_QWORD *)(v6 + v45);
    v46 = *(_QWORD *)(v6 + v45 + 8);
    v48 = (uint64_t *)(v4 + v45);
    v50 = *v48;
    v49 = v48[1];
    if (v47)
    {
      if (v50)
      {
        sub_23FEFCD28(v47);
        OUTLINED_FUNCTION_4_8();
        OUTLINED_FUNCTION_20_1();
        sub_23FEFDF68(v47, v50, (uint64_t)type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity, (uint64_t)static IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.== infix(_:_:), v51, v52, v53, v54, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94,
          v95);
        if ((v55 & 1) != 0)
        {
          v56 = sub_23FED9F1C(v46, v49);
          OUTLINED_FUNCTION_18_2();
          OUTLINED_FUNCTION_16_1();
          OUTLINED_FUNCTION_327_0();
          if ((v56 & 1) == 0)
            goto LABEL_49;
LABEL_42:
          v57 = Decoration[10];
          v58 = *(_QWORD *)(v6 + v57);
          v59 = *(_QWORD *)(v6 + v57 + 8);
          v61 = *(_QWORD *)(v6 + v57 + 16);
          v60 = *(_QWORD *)(v6 + v57 + 24);
          v63 = *(_QWORD *)(v6 + v57 + 32);
          v62 = *(_QWORD *)(v6 + v57 + 40);
          v64 = *(_QWORD *)(v6 + v57 + 48);
          v65 = (uint64_t *)(v4 + v57);
          v67 = *v65;
          v66 = v65[1];
          v69 = v65[2];
          v68 = v65[3];
          v71 = v65[4];
          v70 = v65[5];
          v72 = v65[6];
          v91 = v63;
          v92 = v64;
          v90 = v60;
          if (v58)
          {
            v100[0] = v58;
            v100[1] = v59;
            v100[2] = v61;
            v100[3] = v60;
            v100[4] = v63;
            v100[5] = v62;
            v100[6] = v64;
            if (v67)
            {
              v93 = v67;
              v94 = v66;
              v95 = v69;
              v96 = v68;
              v97 = v71;
              v98 = v70;
              v99 = v72;
              swift_bridgeObjectRetain();
              sub_23FEFCE84(v59, v61);
              OUTLINED_FUNCTION_20_1();
              OUTLINED_FUNCTION_5_5();
              v73 = OUTLINED_FUNCTION_320_2();
              sub_23FEFCE84(v73, v74);
              OUTLINED_FUNCTION_20_1();
              static IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition.== infix(_:_:)(v100, &v93);
              OUTLINED_FUNCTION_36();
              v75 = OUTLINED_FUNCTION_320_2();
              sub_23FEFCF68(v75, v76);
              OUTLINED_FUNCTION_18_2();
              sub_23FEFCF08(v58, v59, v61);
              goto LABEL_49;
            }
            v88 = v72;
            v89 = v62;
            v86 = v71;
            v87 = v70;
            swift_bridgeObjectRetain();
            OUTLINED_FUNCTION_369_1(v59, v61);
            OUTLINED_FUNCTION_19_7();
            OUTLINED_FUNCTION_5_5();
            v85 = v61;
            OUTLINED_FUNCTION_369_1(v59, v61);
            OUTLINED_FUNCTION_19_7();
            OUTLINED_FUNCTION_36();
            sub_23FEFCF68(v59, v61);
            OUTLINED_FUNCTION_16_10();
            v61 = v85;
          }
          else
          {
            v89 = v62;
            if (!v67)
              goto LABEL_49;
          }
          v78 = OUTLINED_FUNCTION_193_2();
          sub_23FEFCE24(v78, v79, v80);
          sub_23FEFCF08(v58, v59, v61);
          v81 = OUTLINED_FUNCTION_193_2();
          sub_23FEFCF08(v81, v82, v83);
          goto LABEL_49;
        }
        OUTLINED_FUNCTION_18_2();
        OUTLINED_FUNCTION_16_1();
        v77 = v47;
LABEL_48:
        sub_23FEFCD8C(v77);
        goto LABEL_49;
      }
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_20_1();
    }
    else if (!v50)
    {
      goto LABEL_42;
    }
    sub_23FEFCD28(v50);
    OUTLINED_FUNCTION_327_0();
    v77 = v50;
    goto LABEL_48;
  }
  if (*v36 != *v38)
    LOBYTE(v39) = 1;
  if ((v39 & 1) == 0)
    goto LABEL_31;
LABEL_49:
  OUTLINED_FUNCTION_7();
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.hashValue.getter()
{
  sub_23FE44D5C((void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.hash(into:));
}

void sub_23FEFD7BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23FE44D9C(a1, a2, a3, (void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool.hash(into:));
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition.parameters.setter()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_122_6();
  *v1 = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition.parameters.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition.output.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v1[1];
  v3 = v1[2];
  v4 = v1[3];
  v5 = v1[4];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return sub_23FEFCE84(v2, v3);
}

__n128 IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition.output.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  __n128 result;
  __int128 v5;

  OUTLINED_FUNCTION_216_0(a1);
  sub_23FEFCF68(v2[1], v2[2]);
  *(_OWORD *)(v2 + 1) = v5;
  v2[3] = v1;
  v2[4] = v3;
  OUTLINED_FUNCTION_80();
  return result;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition.output.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition.description.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition.description.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition.description.modify())()
{
  return nullsub_1;
}

void __swiftcall IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition.init()(IntelligencePlatformLibrary::IntelligenceFlowQueryDecorationTelemetry::QDToolDefinition *__return_ptr retstr)
{
  retstr->parameters._rawValue = (void *)MEMORY[0x24BEE4AF8];
  retstr->output.value.entityType.value.bundleId = (Swift::String_optional)xmmword_23FF68F30;
  retstr->output.value.entityType.value.nameOfTypedValue = 0u;
  retstr->description = 0u;
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition.hash(into:)()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_38_5();
  OUTLINED_FUNCTION_288();
  v2 = *v1;
  v3 = v1[2];
  v4 = v1[4];
  v5 = v1[6];
  OUTLINED_FUNCTION_18_0();
  sub_23FF01ECC(v0, v2);
  swift_bridgeObjectRelease();
  if (v3 == 2)
  {
LABEL_2:
    OUTLINED_FUNCTION_12_14();
    if (!v5)
      goto LABEL_12;
LABEL_6:
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_74_1();
    OUTLINED_FUNCTION_126_1();
    swift_bridgeObjectRelease();
    return;
  }
  OUTLINED_FUNCTION_6_19();
  if (v3 == 1)
  {
    OUTLINED_FUNCTION_12_14();
    OUTLINED_FUNCTION_219_4();
    OUTLINED_FUNCTION_219_4();
    if (v5)
      goto LABEL_6;
  }
  else
  {
    OUTLINED_FUNCTION_6_19();
    if (v3)
    {
      OUTLINED_FUNCTION_6_19();
      OUTLINED_FUNCTION_5_5();
      sub_23FF59048();
      OUTLINED_FUNCTION_36();
      if (!v4)
        goto LABEL_2;
    }
    else
    {
      OUTLINED_FUNCTION_12_14();
      if (!v4)
        goto LABEL_2;
    }
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_44_1();
    OUTLINED_FUNCTION_47_4();
    OUTLINED_FUNCTION_23_3();
    if (v5)
      goto LABEL_6;
  }
LABEL_12:
  OUTLINED_FUNCTION_12_14();
  OUTLINED_FUNCTION_6_7();
}

uint64_t static IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
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
  char v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;

  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[6];
  v5 = a2[2];
  v14 = a2[5];
  v15 = a1[5];
  v6 = a2[6];
  if ((sub_23FEFDEB0(*a1, *a2) & 1) == 0)
    return 0;
  if (v3 != 2)
  {
    if (v5 != 2)
    {
      OUTLINED_FUNCTION_156_6();
      v11 = static IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition.== infix(_:_:)();
      OUTLINED_FUNCTION_167_3(v2, v3);
      OUTLINED_FUNCTION_217_4();
      if ((v11 & 1) == 0)
        return 0;
      goto LABEL_9;
    }
    OUTLINED_FUNCTION_156_6();
    OUTLINED_FUNCTION_167_3(v2, v3);
LABEL_7:
    v7 = OUTLINED_FUNCTION_319_2();
    sub_23FEFCE84(v7, v8);
    OUTLINED_FUNCTION_217_4();
    v9 = OUTLINED_FUNCTION_319_2();
    sub_23FEFCF68(v9, v10);
    return 0;
  }
  if (v5 != 2)
    goto LABEL_7;
LABEL_9:
  if (v4)
  {
    if (v6)
    {
      v12 = v15 == v14 && v4 == v6;
      if (v12 || (OUTLINED_FUNCTION_4_3() & 1) != 0)
        return 1;
    }
  }
  else if (!v6)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_23FEFDAF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v8;
  uint64_t v9;
  char v10;
  float v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  char v19;
  char v20;
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
  uint64_t Decoration;
  uint64_t v34;
  char v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v3 = 0;
  v4 = a1 + 32;
  v5 = a2 + 32;
  v38 = a2 + 32;
  v39 = a1 + 32;
  while (1)
  {
    v6 = v4 + (v3 << 6);
    v7 = *(_DWORD *)(v6 + 8);
    v8 = *(_BYTE *)(v6 + 12);
    v9 = *(_QWORD *)(v6 + 16);
    v10 = *(_BYTE *)(v6 + 33);
    v11 = *(float *)(v6 + 36);
    v12 = *(_BYTE *)(v6 + 40);
    v13 = *(_QWORD *)(v6 + 48);
    v14 = *(_QWORD *)(v6 + 56);
    v15 = v5 + (v3 << 6);
    v16 = *(_QWORD *)(v15 + 16);
    v17 = *(float *)(v15 + 36);
    v18 = *(_QWORD *)(v15 + 48);
    if ((*(_BYTE *)(v6 + 4) & 1) != 0)
    {
      if (!*(_BYTE *)(v15 + 4))
        return 0;
    }
    else
    {
      if (*(_DWORD *)v6 == *(_DWORD *)v15)
        v19 = *(_BYTE *)(v15 + 4);
      else
        v19 = 1;
      if ((v19 & 1) != 0)
        return 0;
    }
    if ((v8 & 1) != 0)
    {
      if (!*(_BYTE *)(v15 + 12))
        return 0;
    }
    else
    {
      if (v7 == *(_DWORD *)(v15 + 8))
        v20 = *(_BYTE *)(v15 + 12);
      else
        v20 = 1;
      if ((v20 & 1) != 0)
        return 0;
    }
    v21 = *(_QWORD *)(v9 + 16);
    if (v21 != *(_QWORD *)(v16 + 16))
      return 0;
    v42 = *(_BYTE *)(v15 + 33);
    v43 = v10;
    v40 = *(_BYTE *)(v15 + 40);
    v41 = v12;
    v44 = v14;
    v45 = *(_QWORD *)(v15 + 56);
    if (!v21)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_27;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v9 != v16)
      break;
LABEL_27:
    v22 = v13;
    swift_bridgeObjectRetain();
LABEL_28:
    if ((v43 & 1) != 0)
    {
      v32 = v45;
      if ((v42 & 1) == 0)
        goto LABEL_53;
    }
    else
    {
      if ((v42 & 1) != 0)
        goto LABEL_53;
      Decoration = IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.rawValue.getter();
      v32 = v45;
      if (Decoration != IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.rawValue.getter())
        goto LABEL_53;
    }
    if ((v41 & 1) != 0)
    {
      v34 = v22;
      if ((v40 & 1) == 0)
        goto LABEL_53;
    }
    else
    {
      if ((v40 & 1) != 0)
        goto LABEL_53;
      v34 = v22;
      if (v11 != v17)
        goto LABEL_53;
    }
    if (v44)
    {
      if (!v32)
        goto LABEL_53;
      if (v34 != v18 || v44 != v32)
      {
        v36 = sub_23FF59270();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v36 & 1) == 0)
          return 0;
        goto LABEL_50;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      if (v32)
        goto LABEL_53;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRelease();
LABEL_50:
    ++v3;
    result = 1;
    v5 = v38;
    v4 = v39;
    if (v3 == v2)
      return result;
  }
  v22 = v13;
  v23 = swift_bridgeObjectRetain();
  v27 = 0;
  while (1)
  {
    v28 = IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform.rawValue.getter(v23, v24, v25, v26);
    v23 = IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform.rawValue.getter(v28, v29, v30, v31);
    if (v28 != v23)
      break;
    v27 += 16;
    if (!--v21)
      goto LABEL_28;
  }
LABEL_53:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_23FEFDEB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _OWORD *v4;
  __int128 *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  char v11;
  BOOL v13;
  _OWORD v15[5];
  _OWORD v16[5];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      v11 = 1;
    }
    else
    {
      v3 = v2 - 1;
      v4 = (_OWORD *)(a1 + 96);
      v5 = (__int128 *)(a2 + 48);
      do
      {
        v6 = *(v4 - 3);
        v16[0] = *(v4 - 4);
        v16[1] = v6;
        v7 = *(v4 - 1);
        v16[2] = *(v4 - 2);
        v16[3] = v7;
        v16[4] = *v4;
        v8 = *v5;
        v15[0] = *(v5 - 1);
        v15[1] = v8;
        v9 = v5[2];
        v10 = v5[3];
        v15[2] = v5[1];
        v15[3] = v9;
        v15[4] = v10;
        v11 = static IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.== infix(_:_:)(v16, v15);
        v13 = v3-- != 0;
        if ((v11 & 1) == 0)
          break;
        v4 += 5;
        v5 += 5;
      }
      while (v13);
    }
  }
  else
  {
    v11 = 0;
  }
  return v11 & 1;
}

void sub_23FEFDF68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(char *, char *);
  uint64_t (*v23)(char *, char *);
  uint64_t (*v24)(_QWORD);
  uint64_t (*v25)(_QWORD);
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
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  BOOL v43;

  OUTLINED_FUNCTION_31_3();
  a19 = v20;
  a20 = v21;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = v24(0);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&a9 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v36 = (char *)&a9 - v35;
  v37 = *(_QWORD *)(v29 + 16);
  if (v37 == *(_QWORD *)(v27 + 16) && v37 && v29 != v27)
  {
    v38 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
    v39 = *(_QWORD *)(v34 + 72);
    v40 = v37 - 1;
    do
    {
      sub_23FF095B8(v29 + v38, (uint64_t)v36, v25);
      sub_23FF095B8(v27 + v38, (uint64_t)v33, v25);
      v41 = v23(v36, v33);
      sub_23FE251BC((uint64_t)v33, v25);
      sub_23FE251BC((uint64_t)v36, v25);
      v43 = v40-- != 0;
      if ((v41 & 1) == 0)
        break;
      v38 += v39;
    }
    while (v43);
  }
  OUTLINED_FUNCTION_7();
}

uint64_t sub_23FEFE088(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t Decoration;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v14;
  BOOL v15;

  v4 = *(_QWORD *)(result + 16);
  if (v4 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v4 || result == a2)
    return 1;
  v5 = v4 - 1;
  v6 = result + 40;
  v7 = a2 + 40;
  do
  {
    Decoration = IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform.rawValue.getter(result, a2, a3, a4);
    v12 = IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform.rawValue.getter(Decoration, v9, v10, v11);
    v14 = v5-- != 0;
    v15 = Decoration == v12;
    result = Decoration == v12;
    if (!v15)
      break;
    v6 += 16;
    v7 += 16;
  }
  while (v14);
  return result;
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition.hashValue.getter()
{
  OUTLINED_FUNCTION_174_5();
  OUTLINED_FUNCTION_36_2();
  OUTLINED_FUNCTION_325_1();
  OUTLINED_FUNCTION_98_1();
  OUTLINED_FUNCTION_124_1();
}

void sub_23FEFE174()
{
  OUTLINED_FUNCTION_174_5();
  sub_23FF592AC();
  OUTLINED_FUNCTION_325_1();
  OUTLINED_FUNCTION_98_1();
  OUTLINED_FUNCTION_124_1();
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.key.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.key.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_120_1();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.key.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.name.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.name.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_147_1();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.name.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.entityType.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return OUTLINED_FUNCTION_87_1(v1[4], v1[5], v1[6], v1[7], a1);
}

__n128 IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.entityType.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  __n128 result;
  __int128 v5;

  OUTLINED_FUNCTION_216_0(a1);
  sub_23FE33ED4(v2[4], v2[5]);
  *((_OWORD *)v2 + 2) = v5;
  v2[6] = v1;
  v2[7] = v3;
  OUTLINED_FUNCTION_80();
  return result;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.entityType.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.description.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.description.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.description.modify())()
{
  return nullsub_1;
}

void __swiftcall IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.init()(IntelligencePlatformLibrary::IntelligenceFlowQueryDecorationTelemetry::QDToolParameterDefinition *__return_ptr retstr)
{
  retstr->key = 0u;
  retstr->name = 0u;
  retstr->entityType.value.bundleId.value._countAndFlagsBits = 0;
  retstr->entityType.value.bundleId.value._object = (void *)1;
  retstr->entityType.value.nameOfTypedValue = 0u;
  retstr->description = 0u;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.hash(into:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_288();
  v1 = v0[3];
  v2 = v0[5];
  v3 = v0[7];
  v4 = v0[9];
  if (v0[1])
  {
    OUTLINED_FUNCTION_6_19();
    swift_bridgeObjectRetain();
    sub_23FF59048();
    swift_bridgeObjectRelease();
    if (v1)
    {
LABEL_3:
      OUTLINED_FUNCTION_6_19();
      OUTLINED_FUNCTION_18_0();
      sub_23FF59048();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    OUTLINED_FUNCTION_12_14();
    if (v1)
      goto LABEL_3;
  }
  OUTLINED_FUNCTION_12_14();
LABEL_6:
  if (v2 == 1)
    goto LABEL_12;
  OUTLINED_FUNCTION_6_19();
  if (v2)
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_112_1();
    sub_23FF59048();
    OUTLINED_FUNCTION_17_3();
    if (v3)
      goto LABEL_9;
LABEL_12:
    OUTLINED_FUNCTION_12_14();
    if (!v4)
      return OUTLINED_FUNCTION_12_14();
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_12_14();
  if (!v3)
    goto LABEL_12;
LABEL_9:
  OUTLINED_FUNCTION_6_19();
  OUTLINED_FUNCTION_44_1();
  sub_23FF59048();
  OUTLINED_FUNCTION_23_3();
  if (!v4)
    return OUTLINED_FUNCTION_12_14();
LABEL_13:
  OUTLINED_FUNCTION_6_19();
  OUTLINED_FUNCTION_74_1();
  sub_23FF59048();
  return swift_bridgeObjectRelease();
}

uint64_t static IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
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
  BOOL v21;
  uint64_t result;
  char v23;
  char v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v32;
  char v34;

  v2 = a1[2];
  v4 = a1[3];
  v3 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8 = a1[7];
  v7 = a1[8];
  v9 = a1[9];
  v10 = a2[1];
  v11 = a2[2];
  v13 = a2[3];
  v12 = a2[4];
  v15 = a2[5];
  v14 = a2[6];
  v16 = a2[7];
  v17 = a2[8];
  v18 = a2[9];
  if (!a1[1])
  {
    if (v10)
      return 0;
    goto LABEL_10;
  }
  if (!v10)
    return 0;
  OUTLINED_FUNCTION_221_0((uint64_t)a1);
  v21 = v21 && v19 == v20;
  if (v21 || (sub_23FF59270(), result = OUTLINED_FUNCTION_59(), (v23 & 1) != 0))
  {
LABEL_10:
    if (v4)
    {
      if (!v13)
        return 0;
      if (v2 != v11 || v4 != v13)
      {
        v4 = v14;
        v11 = v15;
        sub_23FF59270();
        result = OUTLINED_FUNCTION_59();
        if ((v25 & 1) == 0)
          return result;
      }
    }
    else if (v13)
    {
      return 0;
    }
    if (v5 == 1)
    {
      if (v15 == 1)
      {
LABEL_21:
        if (v9)
        {
          if (v18)
          {
            v26 = v7 == v17 && v9 == v18;
            if (v26 || (OUTLINED_FUNCTION_4_3() & 1) != 0)
              return 1;
          }
        }
        else if (!v18)
        {
          return 1;
        }
        return 0;
      }
    }
    else
    {
      if (v15 != 1)
      {
        if (v5)
        {
          if (!v15)
            return 0;
          if (v3 != v12 || v5 != v15)
          {
            sub_23FF59270();
            result = OUTLINED_FUNCTION_59();
            if ((v32 & 1) == 0)
              return result;
          }
        }
        else if (v15)
        {
          return 0;
        }
        if (v8)
        {
          if (!v16)
            return 0;
          if (v6 != v14 || v8 != v16)
          {
            sub_23FF59270();
            result = OUTLINED_FUNCTION_59();
            if ((v34 & 1) == 0)
              return result;
          }
        }
        else if (v16)
        {
          return 0;
        }
        goto LABEL_21;
      }
      OUTLINED_FUNCTION_305_1();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_112_1();
    }
    OUTLINED_FUNCTION_305_1();
    v28 = v27;
    sub_23FE4F840(v29, v30);
    sub_23FE33ED4(v11, v18);
    OUTLINED_FUNCTION_167_3(v28, v4);
    return 0;
  }
  return result;
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.hashValue.getter()
{
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_348_1();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_92_1();
}

void sub_23FEFE754()
{
  OUTLINED_FUNCTION_58_1();
  OUTLINED_FUNCTION_348_1();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_92_1();
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition.entityType.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return OUTLINED_FUNCTION_87_1(*v1, v1[1], v1[2], v1[3], a1);
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition.entityType.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 v9;

  OUTLINED_FUNCTION_216_0(a1);
  v1 = OUTLINED_FUNCTION_238_4();
  OUTLINED_FUNCTION_278(v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_80();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition.entityType.modify())()
{
  return nullsub_1;
}

IntelligencePlatformLibrary::IntelligenceFlowQueryDecorationTelemetry::QDToolOutputDefinition __swiftcall IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition.init()()
{
  __n128 *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  IntelligencePlatformLibrary::IntelligenceFlowQueryDecorationTelemetry::QDToolOutputDefinition result;

  OUTLINED_FUNCTION_212_3(v0, (__n128)xmmword_23FF614D0);
  result.entityType.value.nameOfTypedValue.value._object = v4;
  result.entityType.value.nameOfTypedValue.value._countAndFlagsBits = v3;
  result.entityType.value.bundleId.value._object = v2;
  result.entityType.value.bundleId.value._countAndFlagsBits = v1;
  return result;
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_288();
  v1 = *(_QWORD *)(v0 + 8);
  if (v1 != 1)
  {
    v2 = *(_QWORD *)(v0 + 24);
    OUTLINED_FUNCTION_6_19();
    if (v1)
    {
      OUTLINED_FUNCTION_6_19();
      OUTLINED_FUNCTION_44_1();
      OUTLINED_FUNCTION_47_4();
      OUTLINED_FUNCTION_23_3();
      if (v2)
      {
LABEL_4:
        OUTLINED_FUNCTION_6_19();
        OUTLINED_FUNCTION_74_1();
        OUTLINED_FUNCTION_126_1();
        OUTLINED_FUNCTION_106_0();
        return;
      }
    }
    else
    {
      OUTLINED_FUNCTION_12_14();
      if (v2)
        goto LABEL_4;
    }
  }
  OUTLINED_FUNCTION_12_14();
  OUTLINED_FUNCTION_8_6();
}

uint64_t static IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition.== infix(_:_:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v11;

  OUTLINED_FUNCTION_38_5();
  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v7 = *v5;
  v6 = v5[1];
  v9 = v5[2];
  v8 = v5[3];
  if (v2 == 1)
  {
    if (v6 == 1)
      return 1;
    goto LABEL_6;
  }
  if (v6 == 1)
  {
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_44_1();
LABEL_6:
    sub_23FE4F840(v7, v6);
    sub_23FE33ED4(v1, v2);
    OUTLINED_FUNCTION_167_3(v7, v6);
    return 0;
  }
  if (v2)
  {
    if (!v6)
      return 0;
    v11 = v1 == v7 && v2 == v6;
    if (!v11 && (OUTLINED_FUNCTION_4_3() & 1) == 0)
      return 0;
  }
  else if (v6)
  {
    return 0;
  }
  if (v4)
  {
    if (v8)
    {
      if (v3 == v9 && v4 == v8)
        return 1;
      OUTLINED_FUNCTION_220_1();
      if ((OUTLINED_FUNCTION_4_3() & 1) != 0)
        return 1;
    }
  }
  else if (!v8)
  {
    return 1;
  }
  return 0;
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_395();
  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 24);
  OUTLINED_FUNCTION_33_0();
  if (v1 == 1)
    goto LABEL_6;
  OUTLINED_FUNCTION_6_19();
  if (!v1)
  {
    OUTLINED_FUNCTION_12_14();
    if (v2)
      goto LABEL_4;
LABEL_6:
    OUTLINED_FUNCTION_12_14();
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_6_19();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_47_4();
  OUTLINED_FUNCTION_23_3();
  if (!v2)
    goto LABEL_6;
LABEL_4:
  OUTLINED_FUNCTION_6_19();
  OUTLINED_FUNCTION_74_1();
  OUTLINED_FUNCTION_126_1();
  OUTLINED_FUNCTION_29_0();
LABEL_7:
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_56_1();
}

void sub_23FEFE9F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_395();
  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 24);
  OUTLINED_FUNCTION_58_1();
  if (v1 == 1)
    goto LABEL_6;
  OUTLINED_FUNCTION_6_19();
  if (!v1)
  {
    OUTLINED_FUNCTION_12_14();
    if (v2)
      goto LABEL_4;
LABEL_6:
    OUTLINED_FUNCTION_12_14();
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_6_19();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_47_4();
  OUTLINED_FUNCTION_23_3();
  if (!v2)
    goto LABEL_6;
LABEL_4:
  OUTLINED_FUNCTION_6_19();
  OUTLINED_FUNCTION_74_1();
  OUTLINED_FUNCTION_126_1();
  OUTLINED_FUNCTION_29_0();
LABEL_7:
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_56_1();
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolSource.spanMatches.setter()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_122_6();
  *v1 = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDToolSource.spanMatches.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDToolSource.contexualMatches.setter(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_120_1();
  *(_QWORD *)(v1 + 8) = a1;
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDToolSource.contexualMatches.modify())()
{
  return nullsub_1;
}

IntelligencePlatformLibrary::IntelligenceFlowQueryDecorationTelemetry::QDToolSource __swiftcall IntelligenceFlowQueryDecorationTelemetry.QDToolSource.init()()
{
  _QWORD *v0;
  uint64_t v1;
  IntelligencePlatformLibrary::IntelligenceFlowQueryDecorationTelemetry::QDToolSource result;

  v1 = MEMORY[0x24BEE4AF8];
  *v0 = MEMORY[0x24BEE4AF8];
  v0[1] = v1;
  return result;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDToolSource.hash(into:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_19_7();
  OUTLINED_FUNCTION_337_1(a1);
  OUTLINED_FUNCTION_16_10();
  OUTLINED_FUNCTION_20_1();
  v2 = OUTLINED_FUNCTION_13_9();
  sub_23FEDD1CC(v2, v3);
  return OUTLINED_FUNCTION_227_0();
}

#error "23FEFEB58: call analysis failed (funcsize=17)"

void IntelligenceFlowQueryDecorationTelemetry.QDToolSource.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_33_0();
  v0 = OUTLINED_FUNCTION_74_1();
  OUTLINED_FUNCTION_344_1(v0);
  OUTLINED_FUNCTION_29_0();
  v1 = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_350_0(v1);
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_5_3();
}

void sub_23FEFEBC4()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_58_1();
  v0 = OUTLINED_FUNCTION_74_1();
  OUTLINED_FUNCTION_344_1(v0);
  OUTLINED_FUNCTION_29_0();
  v1 = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_350_0(v1);
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_5_3();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement.sessionScopedUniqueId.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement.contextType.getter()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_370_0();
  OUTLINED_FUNCTION_198_1(*(int *)(v0 + 20));
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement.contextType.setter()
{
  uint64_t v0;
  uint64_t Decoration;

  v0 = OUTLINED_FUNCTION_362_0();
  Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(v0);
  OUTLINED_FUNCTION_319_1(*(int *)(Decoration + 20));
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement.contextType.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(0);
  OUTLINED_FUNCTION_331_0();
  return nullsub_1;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement.valueType.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = OUTLINED_FUNCTION_370_0();
  v1 = OUTLINED_FUNCTION_161_4(*(int *)(v0 + 24));
  return OUTLINED_FUNCTION_245_4(v1, v2);
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement.valueType.setter()
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
  __n128 v9;

  v0 = OUTLINED_FUNCTION_205_0();
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(v0);
  v1 = OUTLINED_FUNCTION_238_4();
  OUTLINED_FUNCTION_278(v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_80();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement.valueType.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(0);
  OUTLINED_FUNCTION_85_4();
  return nullsub_1;
}

__n128 IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement.init()@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t Decoration;
  uint64_t v4;
  uint64_t *v5;
  __n128 result;

  OUTLINED_FUNCTION_25();
  v2 = OUTLINED_FUNCTION_173_4();
  Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(v2);
  v4 = a1 + *(int *)(Decoration + 20);
  *(_QWORD *)v4 = 0;
  *(_WORD *)(v4 + 8) = 256;
  v5 = (uint64_t *)(a1 + *(int *)(Decoration + 24));
  *(_OWORD *)v5 = xmmword_23FF614D0;
  v5[2] = 0;
  v5[3] = 0;
  OUTLINED_FUNCTION_37_4(Decoration, &qword_256F90740);
  OUTLINED_FUNCTION_41(a1, 1);
  *(_QWORD *)v4 = 0;
  *(_WORD *)(v4 + 8) = 256;
  sub_23FE33ED4(*v5, v5[1]);
  *(_OWORD *)v5 = xmmword_23FF614D0;
  v5[2] = 0;
  v5[3] = 0;
  OUTLINED_FUNCTION_228_5();
  return result;
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t Decoration;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_124_2();
  OUTLINED_FUNCTION_626();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_89_5(v4, v12);
  OUTLINED_FUNCTION_68(v0, 1, v1);
  if (v5)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    OUTLINED_FUNCTION_166_5(v0);
    OUTLINED_FUNCTION_0_16();
    OUTLINED_FUNCTION_317_2(&qword_256F907D8, v6, (uint64_t)&protocol conformance descriptor for AIML.UUID);
    OUTLINED_FUNCTION_73();
    OUTLINED_FUNCTION_222_2();
  }
  Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(0);
  OUTLINED_FUNCTION_497();
  if (v5)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    v8 = OUTLINED_FUNCTION_0_16();
    IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType.rawValue.getter(v8);
    OUTLINED_FUNCTION_61_1();
  }
  v9 = v0 + *(int *)(Decoration + 24);
  v10 = *(_QWORD *)(v9 + 8);
  if (v10 == 1)
    goto LABEL_12;
  v11 = *(_QWORD *)(v9 + 24);
  OUTLINED_FUNCTION_0_16();
  if (!v10)
  {
    OUTLINED_FUNCTION_5_0();
    if (v11)
      goto LABEL_10;
LABEL_12:
    OUTLINED_FUNCTION_5_0();
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_4_8();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_16_1();
  if (!v11)
    goto LABEL_12;
LABEL_10:
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_19_7();
  OUTLINED_FUNCTION_187_0();
  OUTLINED_FUNCTION_16_10();
LABEL_13:
  OUTLINED_FUNCTION_8_6();
}

void static IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t Decoration;
  uint64_t *v24;
  int v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  _BYTE v44[32];

  OUTLINED_FUNCTION_31_3();
  v4 = v3;
  v6 = v5;
  v7 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_124_2();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F907E0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_106_4();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_149_3();
  MEMORY[0x24BDAC7A8](v13);
  v15 = &v44[-v14];
  OUTLINED_FUNCTION_108_2(v6, (uint64_t)&v44[-v14]);
  OUTLINED_FUNCTION_108_2(v4, v2);
  v16 = v0 + *(int *)(v9 + 48);
  OUTLINED_FUNCTION_108_2((uint64_t)v15, v0);
  OUTLINED_FUNCTION_108_2(v2, v16);
  v17 = OUTLINED_FUNCTION_28(v0);
  if (v20)
  {
    OUTLINED_FUNCTION_92_3(v2);
    OUTLINED_FUNCTION_92_3((uint64_t)v15);
    v19 = OUTLINED_FUNCTION_28(v16);
    if (v20)
    {
      OUTLINED_FUNCTION_297_0(v19, &qword_256F90740);
      goto LABEL_12;
    }
LABEL_9:
    OUTLINED_FUNCTION_297_0(v19, &qword_256F907E0);
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_218_3(v17, v18, &qword_256F90740);
  OUTLINED_FUNCTION_28(v16);
  if (v20)
  {
    OUTLINED_FUNCTION_7_17(v2);
    OUTLINED_FUNCTION_7_17((uint64_t)v15);
    OUTLINED_FUNCTION_315_1(v21, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_166_5(v16);
  OUTLINED_FUNCTION_260_4(&qword_256F907E8, v22, (uint64_t)&protocol conformance descriptor for AIML.UUID);
  OUTLINED_FUNCTION_155_4();
  OUTLINED_FUNCTION_165_3();
  OUTLINED_FUNCTION_92_3(v2);
  OUTLINED_FUNCTION_92_3((uint64_t)v15);
  OUTLINED_FUNCTION_173_6(v1);
  OUTLINED_FUNCTION_92_3(v0);
  if ((v7 & 1) == 0)
    goto LABEL_10;
LABEL_12:
  Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(0);
  OUTLINED_FUNCTION_146_5();
  if ((v26 & 1) != 0)
  {
    if (!v25)
      goto LABEL_10;
  }
  else
  {
    if ((v25 & 1) != 0)
      goto LABEL_10;
    OUTLINED_FUNCTION_187_4(v24);
    v28 = IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType.rawValue.getter(v27);
    if (v28 != IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType.rawValue.getter(v28))
      goto LABEL_10;
  }
  v29 = *(int *)(Decoration + 24);
  v30 = *(_QWORD *)(v6 + v29);
  v31 = *(_QWORD *)(v6 + v29 + 8);
  v32 = *(_QWORD *)(v6 + v29 + 16);
  v33 = *(_QWORD *)(v6 + v29 + 24);
  v34 = (_QWORD *)(v4 + v29);
  v35 = v34[1];
  v37 = v34[2];
  v36 = v34[3];
  if (v31 == 1)
  {
    if (v35 == 1)
      goto LABEL_10;
    goto LABEL_22;
  }
  if (v35 == 1)
  {
    OUTLINED_FUNCTION_5_5();
    OUTLINED_FUNCTION_19_7();
LABEL_22:
    v38 = OUTLINED_FUNCTION_318_1();
    sub_23FE4F840(v38, v39);
    sub_23FE33ED4(v30, v31);
    v40 = OUTLINED_FUNCTION_318_1();
    sub_23FE33ED4(v40, v41);
    goto LABEL_10;
  }
  if (v31)
  {
    if (!v35)
      goto LABEL_10;
    v42 = v30 == *v34 && v31 == v35;
    if (!v42 && (OUTLINED_FUNCTION_4_3() & 1) == 0)
      goto LABEL_10;
  }
  else if (v35)
  {
    goto LABEL_10;
  }
  if (v33 && v36 && (v32 != v37 || v33 != v36))
    OUTLINED_FUNCTION_4_3();
LABEL_10:
  OUTLINED_FUNCTION_7();
}

void IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement.hashValue.getter()
{
  sub_23FE44D5C((void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement.hash(into:));
}

void sub_23FEFF1F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23FE44D9C(a1, a2, a3, (void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement.hash(into:));
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.sessionScopedUniqueId.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.valueType.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = OUTLINED_FUNCTION_372_1();
  v1 = OUTLINED_FUNCTION_161_4(*(int *)(v0 + 20));
  return OUTLINED_FUNCTION_245_4(v1, v2);
}

void IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.valueType.setter()
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
  __n128 v9;

  v0 = OUTLINED_FUNCTION_205_0();
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(v0);
  v1 = OUTLINED_FUNCTION_238_4();
  OUTLINED_FUNCTION_278(v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_80();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.valueType.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(0);
  OUTLINED_FUNCTION_331_0();
  return nullsub_1;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.matches.getter()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(0);
  return swift_bridgeObjectRetain();
}

void IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.matches.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(OUTLINED_FUNCTION_74_10() + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.matches.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(0);
  OUTLINED_FUNCTION_85_4();
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.dataProtectionClass.getter()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_372_1();
  OUTLINED_FUNCTION_198_1(*(int *)(v0 + 28));
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.dataProtectionClass.setter()
{
  uint64_t v0;
  uint64_t Decoration;

  v0 = OUTLINED_FUNCTION_362_0();
  Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(v0);
  OUTLINED_FUNCTION_319_1(*(int *)(Decoration + 28));
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.dataProtectionClass.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(0);
  OUTLINED_FUNCTION_517();
  return nullsub_1;
}

__n128 IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.init()@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  int *Decoration;
  uint64_t *v4;
  uint64_t v5;
  __n128 result;

  OUTLINED_FUNCTION_25();
  v2 = OUTLINED_FUNCTION_173_4();
  Decoration = (int *)type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(v2);
  v4 = (uint64_t *)(a1 + Decoration[5]);
  *(_OWORD *)v4 = xmmword_23FF614D0;
  v4[2] = 0;
  v4[3] = 0;
  v5 = a1 + Decoration[7];
  *(_QWORD *)v5 = 0;
  *(_WORD *)(v5 + 8) = 256;
  OUTLINED_FUNCTION_37_4((uint64_t)Decoration, &qword_256F90740);
  OUTLINED_FUNCTION_41(a1, 1);
  sub_23FE33ED4(*v4, v4[1]);
  *(_OWORD *)v4 = xmmword_23FF614D0;
  v4[2] = 0;
  v4[3] = 0;
  *(_QWORD *)(a1 + Decoration[6]) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)v5 = 0;
  *(_WORD *)(v5 + 8) = 256;
  OUTLINED_FUNCTION_228_5();
  return result;
}

void IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_38_5();
  v1 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_124_2();
  OUTLINED_FUNCTION_626();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_89_5(v4, v13);
  OUTLINED_FUNCTION_68(v0, 1, v1);
  if (v5)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    OUTLINED_FUNCTION_166_5(v0);
    OUTLINED_FUNCTION_0_16();
    OUTLINED_FUNCTION_317_2(&qword_256F907D8, v6, (uint64_t)&protocol conformance descriptor for AIML.UUID);
    OUTLINED_FUNCTION_73();
    OUTLINED_FUNCTION_222_2();
  }
  v7 = v0 + *(int *)(OUTLINED_FUNCTION_74_10() + 20);
  v8 = *(_QWORD *)(v7 + 8);
  if (v8 != 1)
  {
    v9 = *(_QWORD *)(v7 + 24);
    OUTLINED_FUNCTION_0_16();
    if (v8)
    {
      OUTLINED_FUNCTION_0_16();
      OUTLINED_FUNCTION_5_5();
      OUTLINED_FUNCTION_262_3();
      OUTLINED_FUNCTION_36();
      if (v9)
      {
LABEL_7:
        OUTLINED_FUNCTION_0_16();
        OUTLINED_FUNCTION_4_8();
        OUTLINED_FUNCTION_6();
        OUTLINED_FUNCTION_16_1();
        goto LABEL_10;
      }
    }
    else
    {
      OUTLINED_FUNCTION_5_0();
      if (v9)
        goto LABEL_7;
    }
  }
  OUTLINED_FUNCTION_5_0();
LABEL_10:
  OUTLINED_FUNCTION_20_1();
  v10 = OUTLINED_FUNCTION_13_9();
  sub_23FF018F0(v10, v11);
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_497();
  if (v5)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    v12 = OUTLINED_FUNCTION_0_16();
    IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass.rawValue.getter(v12);
    OUTLINED_FUNCTION_61_1();
  }
  OUTLINED_FUNCTION_6_7();
}

void static IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
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
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v41;
  BOOL v42;
  char v43;
  uint64_t v44;
  uint64_t Decoration;
  uint64_t v46;
  uint64_t v47;

  OUTLINED_FUNCTION_31_3();
  v4 = v3;
  v6 = v5;
  v7 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_124_2();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F907E0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_106_4();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_149_3();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v46 - v14;
  OUTLINED_FUNCTION_108_2(v6, (uint64_t)&v46 - v14);
  OUTLINED_FUNCTION_108_2(v4, v2);
  v16 = v0 + *(int *)(v9 + 48);
  OUTLINED_FUNCTION_108_2((uint64_t)v15, v0);
  OUTLINED_FUNCTION_108_2(v2, v16);
  v17 = OUTLINED_FUNCTION_28(v0);
  if (v20)
  {
    OUTLINED_FUNCTION_92_3(v2);
    OUTLINED_FUNCTION_92_3((uint64_t)v15);
    v19 = OUTLINED_FUNCTION_28(v16);
    if (v20)
    {
      OUTLINED_FUNCTION_297_0(v19, &qword_256F90740);
      goto LABEL_11;
    }
LABEL_9:
    OUTLINED_FUNCTION_297_0(v19, &qword_256F907E0);
    goto LABEL_19;
  }
  OUTLINED_FUNCTION_218_3(v17, v18, &qword_256F90740);
  OUTLINED_FUNCTION_28(v16);
  if (v20)
  {
    OUTLINED_FUNCTION_7_17(v2);
    OUTLINED_FUNCTION_7_17((uint64_t)v15);
    OUTLINED_FUNCTION_315_1(v21, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_166_5(v16);
  OUTLINED_FUNCTION_260_4(&qword_256F907E8, v22, (uint64_t)&protocol conformance descriptor for AIML.UUID);
  OUTLINED_FUNCTION_155_4();
  OUTLINED_FUNCTION_165_3();
  OUTLINED_FUNCTION_92_3(v2);
  OUTLINED_FUNCTION_92_3((uint64_t)v15);
  OUTLINED_FUNCTION_173_6(v1);
  OUTLINED_FUNCTION_92_3(v0);
  if ((v7 & 1) == 0)
    goto LABEL_19;
LABEL_11:
  v23 = OUTLINED_FUNCTION_74_10();
  v24 = *(int *)(v23 + 20);
  v25 = *(_QWORD *)(v6 + v24);
  v26 = *(_QWORD *)(v6 + v24 + 8);
  v27 = *(_QWORD *)(v6 + v24 + 16);
  v47 = *(_QWORD *)(v6 + v24 + 24);
  v28 = (uint64_t *)(v4 + v24);
  v29 = *v28;
  v30 = v28[1];
  v32 = v28[2];
  v31 = v28[3];
  if (v26 == 1)
  {
    if (v30 == 1)
      goto LABEL_13;
LABEL_18:
    v36 = OUTLINED_FUNCTION_326_0();
    sub_23FE4F840(v36, v37);
    sub_23FE33ED4(v25, v26);
    v38 = OUTLINED_FUNCTION_326_0();
    sub_23FE33ED4(v38, v39);
    goto LABEL_19;
  }
  if (v30 == 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_18;
  }
  if (v26)
  {
    if (!v30)
      goto LABEL_19;
    v46 = v27;
    if (v25 != v29 || v26 != v30)
    {
      OUTLINED_FUNCTION_4_3();
      OUTLINED_FUNCTION_59();
      if ((v41 & 1) == 0)
        goto LABEL_19;
    }
  }
  else
  {
    v46 = v27;
    if (v30)
      goto LABEL_19;
  }
  if (!v47)
  {
    if (v31)
      goto LABEL_19;
    goto LABEL_13;
  }
  if (v31)
  {
    v42 = v46 == v32 && v47 == v31;
    if (v42 || (OUTLINED_FUNCTION_4_3(), OUTLINED_FUNCTION_59(), (v43 & 1) != 0))
    {
LABEL_13:
      if ((sub_23FEFDAF8(*(_QWORD *)(v6 + *(int *)(v23 + 24)), *(_QWORD *)(v4 + *(int *)(v23 + 24))) & 1) != 0)
      {
        OUTLINED_FUNCTION_146_5();
        if ((v35 & 1) == 0 && (v34 & 1) == 0)
        {
          OUTLINED_FUNCTION_187_4(v33);
          Decoration = IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass.rawValue.getter(v44);
          IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass.rawValue.getter(Decoration);
        }
      }
    }
  }
LABEL_19:
  OUTLINED_FUNCTION_7();
}

void IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.hashValue.getter()
{
  sub_23FE44D5C((void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.hash(into:));
}

void sub_23FEFF8C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23FE44D9C(a1, a2, a3, (void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity.hash(into:));
}

unint64_t IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.startIndex.getter()
{
  unsigned int *v0;

  return OUTLINED_FUNCTION_30(*v0);
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.startIndex.modify())()
{
  return nullsub_1;
}

unint64_t IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.endIndex.getter()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_30(*(unsigned int *)(v0 + 8));
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.endIndex.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.matchingTransforms.setter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_421();
  *(_QWORD *)(v1 + 16) = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.matchingTransforms.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.matcher.getter(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_21_6(a1);
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.matcher.setter(uint64_t result)
{
  uint64_t v1;
  char v2;
  char v3;

  v2 = *(_BYTE *)(result + 8);
  v3 = *(_BYTE *)(result + 9);
  *(_QWORD *)(v1 + 24) = *(_QWORD *)result;
  *(_BYTE *)(v1 + 32) = v2;
  *(_BYTE *)(v1 + 33) = v3;
  return result;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.matcher.modify())()
{
  return nullsub_1;
}

unint64_t IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.matchScore.getter()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_30(*(unsigned int *)(v0 + 36));
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.matchScore.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 36) = result;
  *(_BYTE *)(v1 + 40) = BYTE4(result) & 1;
  return result;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.matchScore.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.originAppBundleId.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.originAppBundleId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.originAppBundleId.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.init()(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = 1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 12) = 1;
  *(_QWORD *)(a1 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 24) = 0;
  *(_WORD *)(a1 + 32) = 256;
  *(_DWORD *)(a1 + 36) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.hash(into:)()
{
  uint64_t v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  int v8;

  v1 = *(unsigned __int8 *)(v0 + 12);
  v2 = *(unsigned __int8 *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 56);
  v8 = *(unsigned __int8 *)(v0 + 33);
  if (*(_BYTE *)(v0 + 4) == 1)
  {
    OUTLINED_FUNCTION_5_0();
    if (!v1)
    {
LABEL_3:
      OUTLINED_FUNCTION_0_16();
      sub_23FF592D0();
      goto LABEL_6;
    }
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 56);
    OUTLINED_FUNCTION_0_16();
    v3 = v7;
    sub_23FF592D0();
    if (!v1)
      goto LABEL_3;
  }
  OUTLINED_FUNCTION_5_0();
LABEL_6:
  OUTLINED_FUNCTION_4_8();
  v4 = OUTLINED_FUNCTION_171();
  sub_23FF01B40(v4, v5);
  OUTLINED_FUNCTION_16_1();
  if (v8)
  {
    OUTLINED_FUNCTION_5_0();
    if (!v2)
      goto LABEL_8;
LABEL_11:
    OUTLINED_FUNCTION_5_0();
    if (v3)
      goto LABEL_9;
    return OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_0_16();
  IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.rawValue.getter();
  OUTLINED_FUNCTION_61_1();
  if (v2)
    goto LABEL_11;
LABEL_8:
  OUTLINED_FUNCTION_0_16();
  sub_23FF592D0();
  if (v3)
  {
LABEL_9:
    OUTLINED_FUNCTION_0_16();
    OUTLINED_FUNCTION_19_7();
    sub_23FF59048();
    return swift_bridgeObjectRelease();
  }
  return OUTLINED_FUNCTION_5_0();
}

BOOL static IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v6;
  int v7;
  char v8;
  uint64_t v9;
  char v10;
  float v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  float v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t Decoration;
  uint64_t v28;
  char v29;
  BOOL v30;
  uint64_t v32;
  uint64_t v33;

  v6 = *(_BYTE *)(a1 + 4);
  v7 = *(_DWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 12);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_BYTE *)(a1 + 33);
  v11 = *(float *)(a1 + 36);
  v12 = *(_BYTE *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  v15 = *(unsigned __int8 *)(a2 + 4);
  v16 = *(_DWORD *)(a2 + 8);
  v17 = *(unsigned __int8 *)(a2 + 12);
  v18 = *(_QWORD *)(a2 + 16);
  v19 = *(unsigned __int8 *)(a2 + 33);
  v20 = *(float *)(a2 + 36);
  v21 = *(unsigned __int8 *)(a2 + 40);
  v23 = *(_QWORD *)(a2 + 48);
  v22 = *(_QWORD *)(a2 + 56);
  if ((v6 & 1) != 0)
  {
    if (!v15)
      return 0;
  }
  else
  {
    if (*(_DWORD *)a1 == *(_DWORD *)a2)
      v24 = v15;
    else
      v24 = 1;
    if ((v24 & 1) != 0)
      return 0;
  }
  if ((v8 & 1) != 0)
  {
    if (!v17)
      return 0;
  }
  else
  {
    if (v7 == v16)
      v25 = v17;
    else
      v25 = 1;
    if ((v25 & 1) != 0)
      return 0;
  }
  v32 = v13;
  v33 = v14;
  if ((sub_23FEFE088(v9, v18, a3, a4) & 1) != 0)
  {
    v26 = v33;
    if ((v10 & 1) != 0)
    {
      if (!v19)
        return 0;
    }
    else
    {
      if ((v19 & 1) != 0)
        return 0;
      Decoration = IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.rawValue.getter();
      v28 = IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.rawValue.getter();
      v26 = v33;
      if (Decoration != v28)
        return 0;
    }
    if ((v12 & 1) != 0)
    {
      if (!v21)
        return 0;
    }
    else
    {
      if (v11 == v20)
        v29 = v21;
      else
        v29 = 1;
      if ((v29 & 1) != 0)
        return 0;
    }
    if (v26)
    {
      if (!v22)
        return 0;
      v30 = v32 == v23 && v26 == v22;
      return v30 || (OUTLINED_FUNCTION_4_3() & 1) != 0;
    }
    if (!v22)
      return 1;
  }
  return 0;
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.hashValue.getter()
{
  OUTLINED_FUNCTION_160_3();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_347_1();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_344();
}

void sub_23FEFFDA8()
{
  OUTLINED_FUNCTION_160_3();
  OUTLINED_FUNCTION_58_1();
  OUTLINED_FUNCTION_347_1();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_344();
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntityType.bundleId.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntityType.bundleId.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_120_1();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEntityType.bundleId.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntityType.nameOfTypedValue.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntityType.nameOfTypedValue.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_147_1();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEntityType.nameOfTypedValue.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntityType.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  if (*(_QWORD *)(v0 + 8))
  {
    OUTLINED_FUNCTION_274();
    OUTLINED_FUNCTION_44_1();
    sub_23FF59048();
    OUTLINED_FUNCTION_23_3();
    if (v1)
    {
LABEL_3:
      OUTLINED_FUNCTION_274();
      OUTLINED_FUNCTION_74_1();
      OUTLINED_FUNCTION_126_1();
      OUTLINED_FUNCTION_106_0();
      return;
    }
  }
  else
  {
    OUTLINED_FUNCTION_274();
    if (v1)
      goto LABEL_3;
  }
  OUTLINED_FUNCTION_274();
  OUTLINED_FUNCTION_8_6();
}

void static IntelligenceFlowQueryDecorationTelemetry.QDEntityType.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;

  v2 = a1[2];
  v3 = a1[3];
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  if (a1[1])
  {
    if (!v4)
      goto LABEL_17;
    OUTLINED_FUNCTION_221_0((uint64_t)a1);
    v9 = v9 && v7 == v8;
    if (!v9)
    {
      OUTLINED_FUNCTION_4_3();
      OUTLINED_FUNCTION_59();
      if ((v10 & 1) == 0)
        goto LABEL_17;
    }
  }
  else if (v4)
  {
    goto LABEL_17;
  }
  if (v3 && v6 && (v2 != v5 || v3 != v6))
    OUTLINED_FUNCTION_4_3();
LABEL_17:
  OUTLINED_FUNCTION_9();
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntityType.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_395();
  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 24);
  OUTLINED_FUNCTION_33_0();
  if (v1)
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_44_1();
    OUTLINED_FUNCTION_47_4();
    OUTLINED_FUNCTION_23_3();
  }
  else
  {
    OUTLINED_FUNCTION_12_14();
  }
  if (v2)
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_74_1();
    OUTLINED_FUNCTION_126_1();
    OUTLINED_FUNCTION_29_0();
  }
  else
  {
    OUTLINED_FUNCTION_12_14();
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_56_1();
}

void sub_23FF00040()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_395();
  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 24);
  OUTLINED_FUNCTION_58_1();
  if (v1)
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_44_1();
    OUTLINED_FUNCTION_47_4();
    OUTLINED_FUNCTION_23_3();
  }
  else
  {
    OUTLINED_FUNCTION_12_14();
  }
  if (v2)
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_74_1();
    OUTLINED_FUNCTION_126_1();
    OUTLINED_FUNCTION_29_0();
  }
  else
  {
    OUTLINED_FUNCTION_12_14();
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_56_1();
}

void IntelligenceFlowQueryDecorationTelemetry.QDCollectionContext.hashValue.getter()
{
  OUTLINED_FUNCTION_36_2();
  OUTLINED_FUNCTION_324_1();
  OUTLINED_FUNCTION_98_1();
  OUTLINED_FUNCTION_5_3();
}

void sub_23FF000F0()
{
  sub_23FF592AC();
  OUTLINED_FUNCTION_324_1();
  OUTLINED_FUNCTION_98_1();
  OUTLINED_FUNCTION_5_3();
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected.retrievedTools.setter()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_122_6();
  *v1 = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected.retrievedTools.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected.spanMatchedEntities.setter(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_120_1();
  *(_QWORD *)(v1 + 8) = a1;
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected.spanMatchedEntities.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected.utteranceContext.setter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_421();
  *(_QWORD *)(v1 + 16) = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected.utteranceContext.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected.requiredContext.getter()
{
  return swift_bridgeObjectRetain();
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected.requiredContext.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = a1;
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected.requiredContext.modify())()
{
  return nullsub_1;
}

IntelligencePlatformLibrary::IntelligenceFlowQueryDecorationTelemetry::QDEntitiesCollected __swiftcall IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected.init()()
{
  _QWORD *v0;
  uint64_t v1;
  IntelligencePlatformLibrary::IntelligenceFlowQueryDecorationTelemetry::QDEntitiesCollected result;

  v1 = MEMORY[0x24BEE4AF8];
  *v0 = MEMORY[0x24BEE4AF8];
  v0[1] = v1;
  v0[2] = v1;
  v0[3] = v1;
  return result;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected.hash(into:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_19_7();
  OUTLINED_FUNCTION_338_1(a1);
  OUTLINED_FUNCTION_16_10();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_307_1(a1);
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_4_8();
  v2 = OUTLINED_FUNCTION_171();
  sub_23FEDD1CC(v2, v3);
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_368_0();
  return OUTLINED_FUNCTION_106_0();
}

#error "23FF002CC: call analysis failed (funcsize=31)"

void IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v2[72];

  OUTLINED_FUNCTION_33_0();
  v0 = OUTLINED_FUNCTION_74_1();
  OUTLINED_FUNCTION_346_1(v0);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_19_7();
  OUTLINED_FUNCTION_338_1((uint64_t)v2);
  OUTLINED_FUNCTION_16_10();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_307_1((uint64_t)v2);
  OUTLINED_FUNCTION_23_3();
  v1 = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_179_5(v1);
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_137_1();
}

void sub_23FF0035C()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v2[72];

  OUTLINED_FUNCTION_58_1();
  v0 = OUTLINED_FUNCTION_74_1();
  OUTLINED_FUNCTION_346_1(v0);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_19_7();
  OUTLINED_FUNCTION_338_1((uint64_t)v2);
  OUTLINED_FUNCTION_16_10();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_307_1((uint64_t)v2);
  OUTLINED_FUNCTION_23_3();
  v1 = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_179_5(v1);
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_137_1();
}

unint64_t IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated.numberOfTuples.getter()
{
  unsigned int *v0;

  return OUTLINED_FUNCTION_30(*v0);
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated.numberOfTuples.modify())()
{
  return nullsub_1;
}

unint64_t IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated.maximumTupleWidth.getter()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_30(*(unsigned int *)(v0 + 8));
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated.maximumTupleWidth.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated.wasToolTupleLimitReached.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 13);
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated.wasToolTupleLimitReached.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 13) = result;
  return result;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated.wasToolTupleLimitReached.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated.init()(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = 1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 12) = 513;
}

void IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated.hash(into:)()
{
  _BYTE *v0;
  int v1;
  int v2;

  OUTLINED_FUNCTION_288();
  v1 = v0[12];
  v2 = v0[13];
  if (v0[4] == 1)
  {
    OUTLINED_FUNCTION_12_14();
    if (!v1)
    {
LABEL_3:
      OUTLINED_FUNCTION_6_19();
      OUTLINED_FUNCTION_270_3();
      goto LABEL_6;
    }
  }
  else
  {
    OUTLINED_FUNCTION_6_19();
    sub_23FF592D0();
    if (!v1)
      goto LABEL_3;
  }
  OUTLINED_FUNCTION_12_14();
LABEL_6:
  if (v2 != 2)
    OUTLINED_FUNCTION_6_19();
  OUTLINED_FUNCTION_131_3();
  OUTLINED_FUNCTION_8_6();
}

uint64_t static IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2;
  char v3;
  int v4;
  char v5;
  _BOOL4 v6;

  v2 = *(unsigned __int8 *)(a1 + 13);
  v3 = *(_BYTE *)(a2 + 4);
  v4 = *(unsigned __int8 *)(a2 + 13);
  if ((*(_BYTE *)(a1 + 4) & 1) == 0)
  {
    if (*(_DWORD *)a1 != *(_DWORD *)a2)
      v3 = 1;
    if ((v3 & 1) != 0)
      return OUTLINED_FUNCTION_211();
LABEL_7:
    if ((*(_BYTE *)(a1 + 12) & 1) != 0)
    {
      if (!*(_BYTE *)(a2 + 12))
        return OUTLINED_FUNCTION_211();
    }
    else
    {
      if (*(_DWORD *)(a1 + 8) == *(_DWORD *)(a2 + 8))
        v5 = *(_BYTE *)(a2 + 12);
      else
        v5 = 1;
      if ((v5 & 1) != 0)
        return OUTLINED_FUNCTION_211();
    }
    if (v2 == 2)
    {
      if (v4 != 2)
        return OUTLINED_FUNCTION_211();
    }
    else
    {
      v6 = (v2 & 1) == 0;
      if (v4 == 2 || ((v6 ^ v4) & 1) == 0)
        return OUTLINED_FUNCTION_211();
    }
    return 1;
  }
  if (*(_BYTE *)(a2 + 4))
    goto LABEL_7;
  return OUTLINED_FUNCTION_211();
}

void IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated.hashValue.getter()
{
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_349_0();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_59_3();
}

void sub_23FF005AC()
{
  OUTLINED_FUNCTION_58_1();
  OUTLINED_FUNCTION_349_0();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_59_3();
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked.retrievedTools.setter()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_122_6();
  *v1 = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked.retrievedTools.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked.spanMatchedEntities.setter(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_120_1();
  *(_QWORD *)(v1 + 8) = a1;
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked.spanMatchedEntities.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked.utteranceContext.setter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_421();
  *(_QWORD *)(v1 + 16) = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked.utteranceContext.modify())()
{
  return nullsub_1;
}

IntelligencePlatformLibrary::IntelligenceFlowQueryDecorationTelemetry::QDEntitiesRanked __swiftcall IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked.init()()
{
  _QWORD *v0;
  uint64_t v1;
  IntelligencePlatformLibrary::IntelligenceFlowQueryDecorationTelemetry::QDEntitiesRanked result;

  v1 = MEMORY[0x24BEE4AF8];
  *v0 = MEMORY[0x24BEE4AF8];
  v0[1] = v1;
  v0[2] = v1;
  return result;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v4 = v1[1];
  OUTLINED_FUNCTION_19_7();
  sub_23FF024A0(a1, v3);
  OUTLINED_FUNCTION_16_10();
  OUTLINED_FUNCTION_44_1();
  sub_23FF02140(a1, v4);
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_368_0();
  return OUTLINED_FUNCTION_227_0();
}

#error "23FF0072C: call analysis failed (funcsize=25)"

void IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v2[72];

  OUTLINED_FUNCTION_33_0();
  v0 = OUTLINED_FUNCTION_74_1();
  OUTLINED_FUNCTION_345_0(v0);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_19_7();
  OUTLINED_FUNCTION_337_1((uint64_t)v2);
  OUTLINED_FUNCTION_16_10();
  v1 = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_179_5(v1);
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_137_1();
}

void sub_23FF007D4()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v2[72];

  OUTLINED_FUNCTION_58_1();
  v0 = OUTLINED_FUNCTION_74_1();
  OUTLINED_FUNCTION_345_0(v0);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_19_7();
  OUTLINED_FUNCTION_337_1((uint64_t)v2);
  OUTLINED_FUNCTION_16_10();
  v1 = OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_179_5(v1);
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_137_1();
}

void IntelligenceFlowQueryDecorationTelemetry.QDSubComponentStarted.subComponent.getter(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_21_6(a1);
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDSubComponentStarted.subComponent.setter(uint64_t result)
{
  uint64_t v1;
  char v2;
  char v3;

  v2 = *(_BYTE *)(result + 8);
  v3 = *(_BYTE *)(result + 9);
  *(_QWORD *)v1 = *(_QWORD *)result;
  *(_BYTE *)(v1 + 8) = v2;
  *(_BYTE *)(v1 + 9) = v3;
  return result;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDSubComponentStarted.subComponent.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDSubComponentStarted.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (*(_BYTE *)(v0 + 9) == 1)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    v1 = OUTLINED_FUNCTION_0_16();
    IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.rawValue.getter(v1, v2, v3, v4);
    OUTLINED_FUNCTION_61_1();
  }
  OUTLINED_FUNCTION_80();
}

BOOL static IntelligenceFlowQueryDecorationTelemetry.QDSubComponentStarted.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t Decoration;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)(a1 + 9) & 1) == 0)
  {
    if ((*(_BYTE *)(a2 + 9) & 1) != 0)
      return 0;
    Decoration = IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.rawValue.getter(a1, a2, a3, a4);
    return Decoration == IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.rawValue.getter(Decoration, v5, v6, v7);
  }
  return (*(_BYTE *)(a2 + 9) & 1) != 0;
}

void IntelligenceFlowQueryDecorationTelemetry.QDSubComponentStarted.hashValue.getter()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_107_4();
  OUTLINED_FUNCTION_36_2();
  if (v0 == 1)
  {
    OUTLINED_FUNCTION_12_14();
  }
  else
  {
    v1 = OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_223_4(v1, v2, v3, v4);
    OUTLINED_FUNCTION_300();
  }
  OUTLINED_FUNCTION_301();
  OUTLINED_FUNCTION_117_1();
}

void sub_23FF009AC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_107_4();
  sub_23FF592AC();
  if (v0 == 1)
  {
    OUTLINED_FUNCTION_12_14();
  }
  else
  {
    v1 = OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_223_4(v1, v2, v3, v4);
    OUTLINED_FUNCTION_300();
  }
  OUTLINED_FUNCTION_301();
  OUTLINED_FUNCTION_117_1();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDSubComponentEnded.exists.modify())()
{
  return nullsub_1;
}

void _s27IntelligencePlatformLibrary0A28FlowQueryDecorationTelemetryV19QDCollectionStartedV4hash4intoys6HasherVz_tF_0()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_288();
  if (*v0 != 2)
    OUTLINED_FUNCTION_6_19();
  OUTLINED_FUNCTION_131_3();
  OUTLINED_FUNCTION_13();
}

void _s27IntelligencePlatformLibrary0A28FlowQueryDecorationTelemetryV19QDCollectionStartedV9hashValueSivg_0()
{
  unsigned __int8 *v0;
  int v1;

  v1 = *v0;
  OUTLINED_FUNCTION_33_0();
  if (v1 != 2)
    OUTLINED_FUNCTION_6_19();
  OUTLINED_FUNCTION_131_3();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_5_3();
}

void sub_23FF00AA4()
{
  unsigned __int8 *v0;
  int v1;

  v1 = *v0;
  OUTLINED_FUNCTION_58_1();
  if (v1 != 2)
    OUTLINED_FUNCTION_6_19();
  OUTLINED_FUNCTION_131_3();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_5_3();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDSubComponentFailed.errorDomain.modify())()
{
  return nullsub_1;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDSubComponentFailed.errorCode.modify())()
{
  return nullsub_1;
}

void _s27IntelligencePlatformLibrary0A28FlowQueryDecorationTelemetryV18QDCollectionFailedV4hash4intoys6HasherVz_tF_0()
{
  uint64_t v0;
  int v1;

  OUTLINED_FUNCTION_288();
  v1 = *(unsigned __int8 *)(v0 + 20);
  if (!*(_QWORD *)(v0 + 8))
  {
    OUTLINED_FUNCTION_12_14();
    if (v1)
      goto LABEL_3;
LABEL_5:
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_270_3();
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_6_19();
  OUTLINED_FUNCTION_19_7();
  OUTLINED_FUNCTION_187_0();
  OUTLINED_FUNCTION_16_10();
  if (!v1)
    goto LABEL_5;
LABEL_3:
  OUTLINED_FUNCTION_12_14();
LABEL_6:
  OUTLINED_FUNCTION_8_6();
}

void _s27IntelligencePlatformLibrary0A28FlowQueryDecorationTelemetryV18QDCollectionFailedV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  if (*(_QWORD *)(a1 + 8) && *(_QWORD *)(a2 + 8))
  {
    OUTLINED_FUNCTION_221_0(a1);
    v4 = v4 && v2 == v3;
    if (!v4)
    {
      OUTLINED_FUNCTION_4_3();
      OUTLINED_FUNCTION_59();
    }
  }
  OUTLINED_FUNCTION_9();
}

void _s27IntelligencePlatformLibrary0A28FlowQueryDecorationTelemetryV18QDCollectionFailedV9hashValueSivg_0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  OUTLINED_FUNCTION_395();
  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(unsigned __int8 *)(v0 + 20);
  OUTLINED_FUNCTION_33_0();
  if (v1)
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_19_7();
    OUTLINED_FUNCTION_187_0();
    OUTLINED_FUNCTION_16_10();
  }
  else
  {
    OUTLINED_FUNCTION_12_14();
  }
  if (v2)
  {
    OUTLINED_FUNCTION_12_14();
  }
  else
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_270_3();
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_56_1();
}

void sub_23FF00C68()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  OUTLINED_FUNCTION_395();
  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(unsigned __int8 *)(v0 + 20);
  OUTLINED_FUNCTION_58_1();
  if (v1)
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_19_7();
    OUTLINED_FUNCTION_187_0();
    OUTLINED_FUNCTION_16_10();
  }
  else
  {
    OUTLINED_FUNCTION_12_14();
  }
  if (v2)
  {
    OUTLINED_FUNCTION_12_14();
  }
  else
  {
    OUTLINED_FUNCTION_6_19();
    OUTLINED_FUNCTION_270_3();
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_56_1();
}

void IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.startedOrChanged.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int16 v2;
  char v3;

  v2 = *(_WORD *)(v1 + 8);
  v3 = *(_BYTE *)(v1 + 10);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_WORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 10) = v3;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.startedOrChanged.setter(uint64_t result)
{
  uint64_t v1;
  __int16 v2;
  char v3;

  v2 = *(_WORD *)(result + 8);
  v3 = *(_BYTE *)(result + 10);
  *(_QWORD *)v1 = *(_QWORD *)result;
  *(_WORD *)(v1 + 8) = v2;
  *(_BYTE *)(v1 + 10) = v3;
  return result;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.startedOrChanged.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.ended.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_303_1(a1);
}

_BYTE *IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.ended.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 11) = *result;
  return result;
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.ended.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.failed.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  int v5;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_BYTE *)(v1 + 36);
  v5 = *(_DWORD *)(v1 + 32);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 20) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  return sub_23FE7923C(v2, v3);
}

void IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.failed.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  char v5;
  uint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_DWORD *)a1 + 4);
  v5 = *((_BYTE *)a1 + 20);
  v6 = v1 + 32;
  sub_23FE3D158(*(_QWORD *)(v6 - 16), *(_QWORD *)(v6 - 8));
  *(_QWORD *)(v6 - 16) = v2;
  *(_QWORD *)(v6 - 8) = v3;
  *(_BYTE *)(v6 + 4) = v5;
  *(_DWORD *)v6 = v4;
  OUTLINED_FUNCTION_8_6();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.failed.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.traceId.getter()
{
  sub_23FF00DD0(type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext);
}

void sub_23FF00DD0(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_226_4(a1);
  OUTLINED_FUNCTION_287_2(*(int *)(v1 + 28));
  OUTLINED_FUNCTION_9();
}

void IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.traceId.setter(uint64_t a1)
{
  sub_23FF00E08(a1, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext);
}

void sub_23FF00E08(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_275_3(a1, a2);
  OUTLINED_FUNCTION_517();
  OUTLINED_FUNCTION_645(v2, v3);
  OUTLINED_FUNCTION_9();
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.traceId.modify())()
{
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(0);
  OUTLINED_FUNCTION_517();
  return nullsub_1;
}

uint64_t IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.init()()
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

  v1 = v0 + *(int *)(OUTLINED_FUNCTION_371_0() + 28);
  OUTLINED_FUNCTION_25();
  v2 = OUTLINED_FUNCTION_283_1();
  __swift_storeEnumTagSinglePayload(v2, v3, v4, v5);
  *(_QWORD *)v0 = 0;
  *(_DWORD *)(v0 + 8) = 50397184;
  *(_OWORD *)(v0 + 16) = xmmword_23FF614D0;
  *(_BYTE *)(v0 + 36) = 0;
  *(_DWORD *)(v0 + 32) = 0;
  sub_23FE24D20(v1, &qword_256F90740);
  v6 = OUTLINED_FUNCTION_283_1();
  return OUTLINED_FUNCTION_225_0(v6, v7, v8, v9);
}

void IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t Decoration;
  char v15;
  uint64_t v16;
  uint64_t (*v17)(_QWORD);

  OUTLINED_FUNCTION_31_3();
  v3 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_14_2();
  if (*(_BYTE *)(v0 + 10) == 1 || (v6 = *(_WORD *)(v0 + 8), OUTLINED_FUNCTION_0_16(), (v6 & 0x100) != 0))
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_0_16();
    IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.rawValue.getter(v7, v8, v9, v10);
    OUTLINED_FUNCTION_61_1();
  }
  v11 = *(unsigned __int8 *)(v0 + 11);
  if (v11 != 3)
  {
    OUTLINED_FUNCTION_0_16();
    if (v11 != 2)
      OUTLINED_FUNCTION_0_16();
  }
  OUTLINED_FUNCTION_5_0();
  v12 = *(_QWORD *)(v0 + 24);
  if (v12 == 1)
  {
    OUTLINED_FUNCTION_5_0();
    goto LABEL_17;
  }
  v13 = *(unsigned int *)(v0 + 32) | ((unint64_t)*(unsigned __int8 *)(v0 + 36) << 32);
  OUTLINED_FUNCTION_0_16();
  if (!v12)
  {
    OUTLINED_FUNCTION_5_0();
    if ((v13 & 0x100000000) == 0)
      goto LABEL_13;
LABEL_15:
    OUTLINED_FUNCTION_5_0();
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_0_16();
  swift_bridgeObjectRetain_n();
  OUTLINED_FUNCTION_262_3();
  if ((v13 & 0x100000000) != 0)
    goto LABEL_15;
LABEL_13:
  OUTLINED_FUNCTION_0_16();
  sub_23FF592D0();
LABEL_16:
  OUTLINED_FUNCTION_524();
  OUTLINED_FUNCTION_524();
LABEL_17:
  Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(0);
  sub_23FE20874(v0 + *(int *)(Decoration + 28), v2, &qword_256F90740);
  OUTLINED_FUNCTION_68(v2, 1, v3);
  if (v15)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    sub_23FED9174(v2, v1);
    OUTLINED_FUNCTION_0_16();
    sub_23FE23908(&qword_256F907D8, (uint64_t (*)(uint64_t))type metadata accessor for AIML.UUID, (uint64_t)&protocol conformance descriptor for AIML.UUID);
    OUTLINED_FUNCTION_64_3();
    v16 = OUTLINED_FUNCTION_300_0();
    sub_23FE251BC(v16, v17);
  }
  OUTLINED_FUNCTION_7();
}

void static IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
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
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int16 v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BOOL4 v44;
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  char v49;
  _BYTE v50[4];
  int v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t Decoration;
  uint64_t v57;
  char v58;
  uint64_t v59;
  char v60;

  OUTLINED_FUNCTION_31_3();
  v3 = v2;
  v5 = v4;
  v6 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0_7();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F907E0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_29_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_28_8();
  v13 = v11 - v12;
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = &v50[-v16];
  v18 = MEMORY[0x24BDAC7A8](v15);
  v23 = &v50[-v22];
  if ((*((_BYTE *)v5 + 10) & 1) != 0)
  {
    if ((*((_BYTE *)v3 + 10) & 1) == 0)
      goto LABEL_50;
  }
  else
  {
    if ((*((_BYTE *)v3 + 10) & 1) != 0)
      goto LABEL_50;
    v35 = *((_WORD *)v3 + 4);
    if ((*((_BYTE *)v5 + 9) & 1) != 0)
    {
      if ((v3[1] & 0x100) == 0)
        goto LABEL_50;
    }
    else
    {
      if ((v3[1] & 0x100) != 0)
        goto LABEL_50;
      v36 = *((_BYTE *)v5 + 8);
      v37 = *v3;
      v59 = *v5;
      v60 = v36 & 1;
      v57 = v37;
      v58 = v35 & 1;
      Decoration = IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.rawValue.getter(v18, v19, v20, v21);
      v41 = IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.rawValue.getter(Decoration, v38, v39, v40);
      if (Decoration != v41)
        goto LABEL_50;
    }
  }
  v24 = *((unsigned __int8 *)v5 + 11);
  v25 = *((unsigned __int8 *)v3 + 11);
  if (v24 == 3)
  {
    if (v25 != 3)
      goto LABEL_50;
  }
  else
  {
    if (v25 == 3)
      goto LABEL_50;
    if (v24 == 2)
    {
      if (v25 != 2)
        goto LABEL_50;
    }
    else
    {
      v44 = (v24 & 1) == 0;
      if (v25 == 2 || ((v44 ^ v25) & 1) == 0)
        goto LABEL_50;
    }
  }
  v26 = v5[2];
  v27 = v5[3];
  v28 = *((unsigned int *)v5 + 8);
  v29 = v3[2];
  v30 = v3[3];
  v31 = *((unsigned int *)v3 + 8) | ((unint64_t)*((unsigned __int8 *)v3 + 36) << 32);
  Decoration = v28 | ((unint64_t)*((unsigned __int8 *)v5 + 36) << 32);
  if (v27 != 1)
  {
    if (v30 != 1)
    {
      if (v27)
      {
        if (!v30)
        {
          sub_23FE7923C(v26, v27);
          OUTLINED_FUNCTION_29_0();
          goto LABEL_50;
        }
        v45 = v26 == v29 && v27 == v30;
        v52 = v28;
        v53 = v31;
        if (v45)
        {
          sub_23FE7923C(v26, v27);
          OUTLINED_FUNCTION_18_2();
          LODWORD(v28) = v52;
          v31 = v53;
        }
        else
        {
          v54 = v26;
          v55 = v27;
          v51 = OUTLINED_FUNCTION_4_3();
          sub_23FE7923C(v54, v55);
          OUTLINED_FUNCTION_18_2();
          LODWORD(v28) = v52;
          v31 = v53;
          if ((v51 & 1) == 0)
            goto LABEL_50;
        }
      }
      else if (v30)
      {
        goto LABEL_50;
      }
      if ((Decoration & 0x100000000) != 0)
      {
        if ((v31 & 0x100000000) == 0)
          goto LABEL_50;
      }
      else if ((v31 & 0x100000000) != 0 || (_DWORD)v28 != (_DWORD)v31)
      {
        goto LABEL_50;
      }
      goto LABEL_7;
    }
    v54 = v26;
    v55 = v27;
    v42 = v29;
    swift_bridgeObjectRetain();
    v29 = v42;
LABEL_25:
    v43 = v29;
    sub_23FE7923C(v29, v30);
    sub_23FE3D158(v54, v55);
    sub_23FE3D158(v43, v30);
    goto LABEL_50;
  }
  v54 = v26;
  v55 = 1;
  if (v30 != 1)
    goto LABEL_25;
LABEL_7:
  v32 = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(0);
  OUTLINED_FUNCTION_239_1((uint64_t)v5 + *(int *)(v32 + 28), (uint64_t)v23);
  OUTLINED_FUNCTION_239_1((uint64_t)v3 + *(int *)(v32 + 28), (uint64_t)v17);
  v33 = v0 + *(int *)(v8 + 48);
  OUTLINED_FUNCTION_239_1((uint64_t)v23, v0);
  OUTLINED_FUNCTION_239_1((uint64_t)v17, v33);
  OUTLINED_FUNCTION_68(v0, 1, v6);
  if (!v49)
  {
    v46 = OUTLINED_FUNCTION_171();
    sub_23FE20874(v46, v47, v48);
    OUTLINED_FUNCTION_68(v33, 1, v6);
    if (!v49)
    {
      sub_23FED9174(v33, v1);
      sub_23FE23908(&qword_256F907E8, (uint64_t (*)(uint64_t))type metadata accessor for AIML.UUID, (uint64_t)&protocol conformance descriptor for AIML.UUID);
      sub_23FF58FB8();
      sub_23FE251BC(v1, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
      OUTLINED_FUNCTION_13_15((uint64_t)v17);
      OUTLINED_FUNCTION_13_15((uint64_t)v23);
      sub_23FE251BC(v13, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
      OUTLINED_FUNCTION_13_15(v0);
      goto LABEL_50;
    }
    OUTLINED_FUNCTION_2_2((uint64_t)v17);
    OUTLINED_FUNCTION_2_2((uint64_t)v23);
    sub_23FE251BC(v13, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_40:
    OUTLINED_FUNCTION_37_4(v34, &qword_256F907E0);
    goto LABEL_50;
  }
  sub_23FE24D20((uint64_t)v17, &qword_256F90740);
  sub_23FE24D20((uint64_t)v23, &qword_256F90740);
  v34 = OUTLINED_FUNCTION_68(v33, 1, v6);
  if (!v49)
    goto LABEL_40;
  OUTLINED_FUNCTION_37_4(v34, &qword_256F90740);
LABEL_50:
  OUTLINED_FUNCTION_7();
}

void IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.hashValue.getter()
{
  sub_23FE44D5C((void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.hash(into:));
}

void sub_23FF01500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23FE44D9C(a1, a2, a3, (void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext.hash(into:));
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation.clientTraceId.modify())()
{
  return nullsub_1;
}

void IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation.hashValue.getter()
{
  sub_23FE44D5C((void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation.hash(into:));
}

void sub_23FF01540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23FE44D9C(a1, a2, a3, (void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation.hash(into:));
}

uint64_t (*IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall.traceId.modify())()
{
  return nullsub_1;
}

uint64_t _s27IntelligencePlatformLibrary0A28FlowQueryDecorationTelemetryV19QDRequestInvocationVAEycfC_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_25();
  v3 = OUTLINED_FUNCTION_41(a1, 1);
  OUTLINED_FUNCTION_37_4(v3, &qword_256F90740);
  return OUTLINED_FUNCTION_265(a1, 1, 1, v2);
}

void _s27IntelligencePlatformLibrary0A28FlowQueryDecorationTelemetryV19QDRequestInvocationV4hash4intoys6HasherVz_tF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD);

  v3 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_626();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0_7();
  sub_23FE20874(v0, v2, &qword_256F90740);
  OUTLINED_FUNCTION_68(v2, 1, v3);
  if (v6)
  {
    OUTLINED_FUNCTION_12_14();
  }
  else
  {
    sub_23FED9174(v2, v1);
    OUTLINED_FUNCTION_6_19();
    sub_23FE23908(&qword_256F907D8, (uint64_t (*)(uint64_t))type metadata accessor for AIML.UUID, (uint64_t)&protocol conformance descriptor for AIML.UUID);
    sub_23FF58FAC();
    v7 = OUTLINED_FUNCTION_220_1();
    sub_23FE251BC(v7, v8);
  }
  OUTLINED_FUNCTION_8_6();
}

void _s27IntelligencePlatformLibrary0A28FlowQueryDecorationTelemetryV19QDRequestInvocationV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;

  OUTLINED_FUNCTION_31_3();
  a19 = v22;
  a20 = v23;
  v25 = v24;
  v27 = v26;
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_40_0();
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F907E0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_29_6();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_28_8();
  v34 = v32 - v33;
  v36 = MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)&a9 - v37;
  MEMORY[0x24BDAC7A8](v36);
  v40 = (char *)&a9 - v39;
  OUTLINED_FUNCTION_108_2(v27, (uint64_t)&a9 - v39);
  OUTLINED_FUNCTION_108_2(v25, (uint64_t)v38);
  v41 = v20 + *(int *)(v29 + 48);
  OUTLINED_FUNCTION_108_2((uint64_t)v40, v20);
  OUTLINED_FUNCTION_108_2((uint64_t)v38, v41);
  OUTLINED_FUNCTION_28(v20);
  if (!v43)
  {
    sub_23FE20874(v20, v34, &qword_256F90740);
    OUTLINED_FUNCTION_28(v41);
    if (!v43)
    {
      sub_23FED9174(v41, v21);
      sub_23FE23908(&qword_256F907E8, (uint64_t (*)(uint64_t))type metadata accessor for AIML.UUID, (uint64_t)&protocol conformance descriptor for AIML.UUID);
      sub_23FF58FB8();
      sub_23FE251BC(v21, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
      OUTLINED_FUNCTION_13_15((uint64_t)v38);
      OUTLINED_FUNCTION_13_15((uint64_t)v40);
      sub_23FE251BC(v34, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
      OUTLINED_FUNCTION_13_15(v20);
      goto LABEL_10;
    }
    OUTLINED_FUNCTION_2_2((uint64_t)v38);
    OUTLINED_FUNCTION_2_2((uint64_t)v40);
    OUTLINED_FUNCTION_149_2(v44, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_9:
    OUTLINED_FUNCTION_37_4(v42, &qword_256F907E0);
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_13_15((uint64_t)v38);
  OUTLINED_FUNCTION_13_15((uint64_t)v40);
  v42 = OUTLINED_FUNCTION_28(v41);
  if (!v43)
    goto LABEL_9;
  OUTLINED_FUNCTION_37_4(v42, &qword_256F90740);
LABEL_10:
  OUTLINED_FUNCTION_7();
}

void IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall.hashValue.getter()
{
  sub_23FE44D5C((void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall.hash(into:));
}

void sub_23FF018C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23FE44D9C(a1, a2, a3, (void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall.hash(into:));
}

void IntelligenceFlowQueryDecorationTelemetry.hashValue.getter()
{
  sub_23FE44D5C((void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.hash(into:));
}

void sub_23FF018E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23FE44D9C(a1, a2, a3, (void (*)(_BYTE *))IntelligenceFlowQueryDecorationTelemetry.hash(into:));
}

uint64_t sub_23FF018F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_23FF592B8();
  v19 = v3;
  if (v3)
  {
    v5 = 0;
    v18 = a2 + 32;
    do
    {
      v6 = v18 + (v5 << 6);
      v7 = *(unsigned __int8 *)(v6 + 12);
      v8 = *(_QWORD *)(v6 + 16);
      v9 = *(_BYTE *)(v6 + 33);
      v10 = *(unsigned __int8 *)(v6 + 40);
      v11 = *(_QWORD *)(v6 + 56);
      if (*(_BYTE *)(v6 + 4) == 1)
      {
        sub_23FF592C4();
        if (!v7)
          goto LABEL_5;
      }
      else
      {
        sub_23FF592C4();
        sub_23FF592D0();
        if (!v7)
        {
LABEL_5:
          sub_23FF592C4();
          sub_23FF592D0();
          goto LABEL_8;
        }
      }
      sub_23FF592C4();
LABEL_8:
      sub_23FF592B8();
      v12 = *(_QWORD *)(v8 + 16);
      if (v12)
      {
        swift_bridgeObjectRetain();
        v13 = swift_bridgeObjectRetain_n();
        v17 = v8 + 40;
        do
        {
          v17 += 16;
          IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform.rawValue.getter(v13, v14, v15, v16);
          v13 = sub_23FF592B8();
          --v12;
        }
        while (v12);
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
        {
LABEL_12:
          sub_23FF592C4();
          if (!v10)
            goto LABEL_13;
          goto LABEL_17;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if ((v9 & 1) != 0)
          goto LABEL_12;
      }
      sub_23FF592C4();
      IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType.rawValue.getter();
      sub_23FF592B8();
      if (!v10)
      {
LABEL_13:
        sub_23FF592C4();
        sub_23FF592D0();
        if (!v11)
          goto LABEL_18;
        goto LABEL_14;
      }
LABEL_17:
      sub_23FF592C4();
      if (!v11)
      {
LABEL_18:
        sub_23FF592C4();
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
LABEL_14:
      sub_23FF592C4();
      swift_bridgeObjectRetain();
      sub_23FF59048();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_19:
      ++v5;
      result = swift_bridgeObjectRelease();
    }
    while (v5 != v19);
  }
  return result;
}

uint64_t sub_23FF01B40(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_23FF592B8();
  if (v3)
  {
    v8 = a2 + 40;
    do
    {
      v8 += 16;
      IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform.rawValue.getter(result, v5, v6, v7);
      result = sub_23FF592B8();
      --v3;
    }
    while (v3);
  }
  return result;
}

void sub_23FF01BB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t Decoration;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;

  v3 = type metadata accessor for AIML.UUID();
  MEMORY[0x24BDAC7A8](v3);
  v23 = (uint64_t)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(0);
  v9 = *(_QWORD *)(Decoration - 8);
  MEMORY[0x24BDAC7A8](Decoration);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a2 + 16);
  sub_23FF592B8();
  if (v12)
  {
    v13 = a2 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v25 = *(_QWORD *)(v9 + 72);
    v22 = Decoration;
    do
    {
      sub_23FF095B8(v13, (uint64_t)v11, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement);
      sub_23FE20874((uint64_t)v11, (uint64_t)v7, &qword_256F90740);
      if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v3) == 1)
      {
        sub_23FF592C4();
      }
      else
      {
        v14 = v23;
        sub_23FED9174((uint64_t)v7, v23);
        sub_23FF592C4();
        sub_23FE23908(&qword_256F907D8, (uint64_t (*)(uint64_t))type metadata accessor for AIML.UUID, (uint64_t)&protocol conformance descriptor for AIML.UUID);
        sub_23FF58FAC();
        sub_23FE251BC(v14, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
      }
      v15 = &v11[*(int *)(Decoration + 20)];
      if (v15[9] == 1)
      {
        sub_23FF592C4();
      }
      else
      {
        v16 = v15[8];
        v17 = *(_QWORD *)v15;
        v18 = sub_23FF592C4();
        v26 = v17;
        v27 = v16 & 1;
        IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType.rawValue.getter(v18);
        sub_23FF592B8();
      }
      v19 = &v11[*(int *)(Decoration + 24)];
      v20 = *((_QWORD *)v19 + 1);
      if (v20 == 1)
      {
        sub_23FF592C4();
      }
      else
      {
        v21 = *((_QWORD *)v19 + 3);
        v24 = *((_QWORD *)v19 + 2);
        sub_23FF592C4();
        sub_23FF592C4();
        if (v20)
        {
          swift_bridgeObjectRetain();
          sub_23FF59048();
          swift_bridgeObjectRelease();
        }
        sub_23FF592C4();
        if (v21)
        {
          swift_bridgeObjectRetain();
          sub_23FF59048();
          swift_bridgeObjectRelease();
        }
        Decoration = v22;
      }
      sub_23FE251BC((uint64_t)v11, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement);
      v13 += v25;
      --v12;
    }
    while (v12);
  }
}

uint64_t sub_23FF01ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t *v5;
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

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_23FF592B8();
  if (v3)
  {
    v5 = (uint64_t *)(a2 + 56);
    do
    {
      v7 = *v5;
      v6 = v5[1];
      v8 = v5[2];
      v9 = v5[4];
      v10 = v5[6];
      v15 = v3;
      v14 = v6;
      if (*(v5 - 2))
      {
        sub_23FF592C4();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v11 = v6;
        v12 = v9;
        sub_23FE4F840(v11, v8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_23FF59048();
        swift_bridgeObjectRelease();
        if (v7)
          goto LABEL_5;
      }
      else
      {
        sub_23FF592C4();
        swift_bridgeObjectRetain();
        v13 = v6;
        v12 = v9;
        sub_23FE4F840(v13, v8);
        swift_bridgeObjectRetain();
        if (v7)
        {
LABEL_5:
          sub_23FF592C4();
          swift_bridgeObjectRetain();
          sub_23FF59048();
          swift_bridgeObjectRelease();
          goto LABEL_8;
        }
      }
      sub_23FF592C4();
LABEL_8:
      if (v8 != 1)
      {
        sub_23FF592C4();
        if (v8)
        {
          sub_23FF592C4();
          swift_bridgeObjectRetain();
          sub_23FF59048();
          swift_bridgeObjectRelease();
          if (v12)
            goto LABEL_11;
        }
        else
        {
          sub_23FF592C4();
          if (v12)
          {
LABEL_11:
            sub_23FF592C4();
            swift_bridgeObjectRetain();
            sub_23FF59048();
            swift_bridgeObjectRelease();
            if (v10)
              goto LABEL_15;
            goto LABEL_12;
          }
        }
      }
      sub_23FF592C4();
      if (v10)
      {
LABEL_15:
        sub_23FF592C4();
        swift_bridgeObjectRetain();
        sub_23FF59048();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23FE33ED4(v14, v8);
        goto LABEL_16;
      }
LABEL_12:
      sub_23FF592C4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23FE33ED4(v14, v8);
LABEL_16:
      result = swift_bridgeObjectRelease();
      v5 += 10;
      --v3;
    }
    while (v15 != 1);
  }
  return result;
}

void sub_23FF02140(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *Decoration;
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
  char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  v4 = type metadata accessor for AIML.UUID();
  MEMORY[0x24BDAC7A8](v4);
  v25 = (uint64_t)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  Decoration = (int *)type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(0);
  v10 = *((_QWORD *)Decoration - 1);
  MEMORY[0x24BDAC7A8](Decoration);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(a2 + 16);
  sub_23FF592B8();
  if (v13)
  {
    v14 = a2 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    v27 = *(_QWORD *)(v10 + 72);
    v24 = v8;
    do
    {
      sub_23FF095B8(v14, (uint64_t)v12, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity);
      sub_23FE20874((uint64_t)v12, (uint64_t)v8, &qword_256F90740);
      if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v4) == 1)
      {
        sub_23FF592C4();
      }
      else
      {
        v15 = v25;
        sub_23FED9174((uint64_t)v8, v25);
        sub_23FF592C4();
        sub_23FE23908(&qword_256F907D8, (uint64_t (*)(uint64_t))type metadata accessor for AIML.UUID, (uint64_t)&protocol conformance descriptor for AIML.UUID);
        sub_23FF58FAC();
        sub_23FE251BC(v15, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
      }
      v16 = &v12[Decoration[5]];
      v17 = *((_QWORD *)v16 + 1);
      if (v17 == 1)
      {
        sub_23FF592C4();
      }
      else
      {
        v18 = *((_QWORD *)v16 + 3);
        v26 = *((_QWORD *)v16 + 2);
        sub_23FF592C4();
        sub_23FF592C4();
        if (v17)
        {
          swift_bridgeObjectRetain();
          sub_23FF59048();
          swift_bridgeObjectRelease();
        }
        sub_23FF592C4();
        if (v18)
        {
          swift_bridgeObjectRetain();
          sub_23FF59048();
          swift_bridgeObjectRelease();
        }
        v8 = v24;
      }
      v19 = *(_QWORD *)&v12[Decoration[6]];
      swift_bridgeObjectRetain();
      sub_23FF018F0(a1, v19);
      swift_bridgeObjectRelease();
      v20 = &v12[Decoration[7]];
      if (v20[9] == 1)
      {
        sub_23FF592C4();
      }
      else
      {
        v21 = v20[8];
        v22 = *(_QWORD *)v20;
        v23 = sub_23FF592C4();
        v28 = v22;
        v29 = v21 & 1;
        IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass.rawValue.getter(v23);
        sub_23FF592B8();
      }
      sub_23FE251BC((uint64_t)v12, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity);
      v14 += v27;
      --v13;
    }
    while (v13);
  }
}

uint64_t type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(uint64_t a1)
{
  return sub_23FE41760(a1, (uint64_t *)&unk_256FADD20);
}

uint64_t type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(uint64_t a1)
{
  return sub_23FE41760(a1, (uint64_t *)&unk_256FADD30);
}

void sub_23FF024A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *Decoration;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  int EnumTagSinglePayload;
  uint64_t v19;
  char *v20;
  char v21;
  uint64_t v22;
  char *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int *v56;
  uint64_t v57;
  char v58;

  v4 = type metadata accessor for AIML.UUID();
  v45 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v46 = (uint64_t)&v43 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  Decoration = (int *)type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0);
  v13 = *((_QWORD *)Decoration - 1);
  MEMORY[0x24BDAC7A8](Decoration);
  v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(a2 + 16);
  sub_23FF592B8();
  v53 = v16;
  if (v16)
  {
    v17 = 0;
    v52 = a2 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    v51 = *(_QWORD *)(v13 + 72);
    v50 = v11;
    v56 = Decoration;
    v44 = v15;
    v48 = v4;
    while (1)
    {
      sub_23FF095B8(v52 + v51 * v17, (uint64_t)v15, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool);
      sub_23FE20874((uint64_t)v15, (uint64_t)v11, &qword_256F90740);
      EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v4);
      v55 = v17;
      if (EnumTagSinglePayload == 1)
      {
        sub_23FF592C4();
      }
      else
      {
        v19 = v46;
        sub_23FED9174((uint64_t)v11, v46);
        sub_23FF592C4();
        sub_23FE23908(&qword_256F907D8, (uint64_t (*)(uint64_t))type metadata accessor for AIML.UUID, (uint64_t)&protocol conformance descriptor for AIML.UUID);
        sub_23FF58FAC();
        sub_23FE251BC(v19, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
      }
      if (*(_QWORD *)&v15[Decoration[5] + 8])
      {
        sub_23FF592C4();
        swift_bridgeObjectRetain();
        sub_23FF59048();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_23FF592C4();
      }
      v20 = &v15[Decoration[6]];
      if (v20[9] == 1)
      {
        sub_23FF592C4();
      }
      else
      {
        v21 = v20[8];
        v22 = *(_QWORD *)v20;
        sub_23FF592C4();
        v57 = v22;
        v58 = v21 & 1;
        IntelligenceFlowQueryDecorationTelemetry.QDToolSubType.rawValue.getter();
        sub_23FF592B8();
      }
      if (v15[Decoration[7] + 4] == 1)
      {
        sub_23FF592C4();
      }
      else
      {
        sub_23FF592C4();
        sub_23FF592D0();
      }
      v23 = &v15[Decoration[8]];
      if (v23[9] == 1)
      {
        sub_23FF592C4();
      }
      else
      {
        v24 = v23[8];
        v25 = *(_QWORD *)v23;
        v26 = sub_23FF592C4();
        v57 = v25;
        v58 = v24 & 1;
        IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria.rawValue.getter(v26);
        sub_23FF592B8();
      }
      v27 = (uint64_t *)&v15[Decoration[9]];
      v28 = *v27;
      if (*v27)
      {
        v29 = v27[1];
        sub_23FF592C4();
        swift_bridgeObjectRetain();
        sub_23FF02140(a1, v28);
        swift_bridgeObjectRelease();
        sub_23FF592B8();
        v30 = *(_QWORD *)(v29 + 16);
        if (v30)
        {
          v31 = v45;
          v32 = v29 + ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80));
          v54 = v29;
          swift_bridgeObjectRetain();
          v33 = *(_QWORD *)(v31 + 72);
          do
          {
            sub_23FF095B8(v32, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
            sub_23FE23908(&qword_256F907D8, (uint64_t (*)(uint64_t))type metadata accessor for AIML.UUID, (uint64_t)&protocol conformance descriptor for AIML.UUID);
            sub_23FF58FAC();
            sub_23FE251BC((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
            v32 += v33;
            --v30;
          }
          while (v30);
          swift_bridgeObjectRelease();
          v15 = v44;
        }
      }
      else
      {
        sub_23FF592C4();
      }
      v34 = (uint64_t *)&v15[v56[10]];
      v35 = *v34;
      if (*v34)
        break;
      sub_23FF592C4();
      v11 = v50;
      Decoration = v56;
LABEL_38:
      v17 = v55 + 1;
      sub_23FE251BC((uint64_t)v15, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool);
      if (v17 == v53)
        return;
    }
    v36 = v34[1];
    v37 = v34[2];
    v39 = v34[3];
    v38 = v34[4];
    v41 = v34[5];
    v40 = v34[6];
    v49 = v41;
    v54 = v40;
    sub_23FF592C4();
    swift_bridgeObjectRetain();
    sub_23FF01ECC(a1, v35);
    swift_bridgeObjectRelease();
    if (v37 == 2)
    {
      sub_23FF592C4();
    }
    else
    {
      v47 = v39;
      sub_23FF592C4();
      if (v37 != 1)
      {
        sub_23FF592C4();
        sub_23FF592C4();
        if (v37)
        {
          swift_bridgeObjectRetain();
          sub_23FF59048();
          swift_bridgeObjectRelease();
        }
        v11 = v50;
        Decoration = v56;
        v42 = v54;
        sub_23FF592C4();
        if (v38)
        {
          swift_bridgeObjectRetain();
          sub_23FF59048();
          swift_bridgeObjectRelease();
        }
        v4 = v48;
        if (!v42)
        {
LABEL_37:
          sub_23FF592C4();
          goto LABEL_38;
        }
        goto LABEL_31;
      }
      sub_23FF592C4();
      sub_23FEFCF68(v36, 1);
      sub_23FEFCF68(v36, 1);
    }
    v11 = v50;
    Decoration = v56;
    v4 = v48;
    if (!v54)
      goto LABEL_37;
LABEL_31:
    sub_23FF592C4();
    swift_bridgeObjectRetain();
    sub_23FF59048();
    swift_bridgeObjectRelease();
    goto LABEL_38;
  }
}

void sub_23FF02AD0()
{
  sub_23FE51128(&qword_256F92068, &qword_256F92070);
}

unint64_t sub_23FF02AF8()
{
  unint64_t result;

  result = qword_256F92078;
  if (!qword_256F92078)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDToolSubType, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDToolSubType);
    atomic_store(result, (unint64_t *)&qword_256F92078);
  }
  return result;
}

void sub_23FF02B34()
{
  sub_23FE51128(&qword_256F92080, &qword_256F92088);
}

unint64_t sub_23FF02B5C()
{
  unint64_t result;

  result = qword_256F92090;
  if (!qword_256F92090)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType);
    atomic_store(result, (unint64_t *)&qword_256F92090);
  }
  return result;
}

void sub_23FF02B98()
{
  sub_23FE51128(&qword_256F92098, &qword_256F920A0);
}

unint64_t sub_23FF02BC0()
{
  unint64_t result;

  result = qword_256F920A8;
  if (!qword_256F920A8)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponent, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDSubComponent);
    atomic_store(result, (unint64_t *)&qword_256F920A8);
  }
  return result;
}

void sub_23FF02BFC()
{
  sub_23FE51128(&qword_256F920B0, &qword_256F920B8);
}

unint64_t sub_23FF02C24()
{
  unint64_t result;

  result = qword_256F920C0;
  if (!qword_256F920C0)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType);
    atomic_store(result, (unint64_t *)&qword_256F920C0);
  }
  return result;
}

void sub_23FF02C60()
{
  sub_23FE51128(&qword_256F920C8, &qword_256F920D0);
}

unint64_t sub_23FF02C88()
{
  unint64_t result;

  result = qword_256F920D8;
  if (!qword_256F920D8)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform);
    atomic_store(result, (unint64_t *)&qword_256F920D8);
  }
  return result;
}

void sub_23FF02CC4()
{
  sub_23FE51128(&qword_256F920E0, &qword_256F920E8);
}

unint64_t sub_23FF02CEC()
{
  unint64_t result;

  result = qword_256F920F0;
  if (!qword_256F920F0)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass);
    atomic_store(result, (unint64_t *)&qword_256F920F0);
  }
  return result;
}

void sub_23FF02D28()
{
  sub_23FE51128(&qword_256F920F8, &qword_256F92100);
}

unint64_t sub_23FF02D50()
{
  unint64_t result;

  result = qword_256F92108;
  if (!qword_256F92108)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria);
    atomic_store(result, (unint64_t *)&qword_256F92108);
  }
  return result;
}

void sub_23FF02D8C()
{
  sub_23FE23908(&qword_256F91E00, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata);
}

unint64_t sub_23FF02DBC()
{
  unint64_t result;

  result = qword_256F92110;
  if (!qword_256F92110)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDCollectionStarted, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDCollectionStarted);
    atomic_store(result, (unint64_t *)&qword_256F92110);
  }
  return result;
}

unint64_t sub_23FF02DFC()
{
  unint64_t result;

  result = qword_256F92118;
  if (!qword_256F92118)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDCollectionCompleted, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDCollectionCompleted);
    atomic_store(result, (unint64_t *)&qword_256F92118);
  }
  return result;
}

unint64_t sub_23FF02E3C()
{
  unint64_t result;

  result = qword_256F92120;
  if (!qword_256F92120)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDCollectionFailed, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDCollectionFailed);
    atomic_store(result, (unint64_t *)&qword_256F92120);
  }
  return result;
}

void sub_23FF02E78()
{
  sub_23FE23908(&qword_256F92128, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool);
}

unint64_t sub_23FF02EA8()
{
  unint64_t result;

  result = qword_256F92130;
  if (!qword_256F92130)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition);
    atomic_store(result, (unint64_t *)&qword_256F92130);
  }
  return result;
}

unint64_t sub_23FF02EE8()
{
  unint64_t result;

  result = qword_256F92138;
  if (!qword_256F92138)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition);
    atomic_store(result, (unint64_t *)&qword_256F92138);
  }
  return result;
}

unint64_t sub_23FF02F28()
{
  unint64_t result;

  result = qword_256F92140;
  if (!qword_256F92140)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition);
    atomic_store(result, (unint64_t *)&qword_256F92140);
  }
  return result;
}

unint64_t sub_23FF02F68()
{
  unint64_t result;

  result = qword_256F92148;
  if (!qword_256F92148)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDToolSource, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDToolSource);
    atomic_store(result, (unint64_t *)&qword_256F92148);
  }
  return result;
}

void sub_23FF02FA4()
{
  sub_23FE23908(&qword_256F92150, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement);
}

void sub_23FF02FD0()
{
  sub_23FE23908(&qword_256F92158, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity);
}

unint64_t sub_23FF03000()
{
  unint64_t result;

  result = qword_256F92160;
  if (!qword_256F92160)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch);
    atomic_store(result, (unint64_t *)&qword_256F92160);
  }
  return result;
}

unint64_t sub_23FF03040()
{
  unint64_t result;

  result = qword_256F92168;
  if (!qword_256F92168)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDEntityType, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDEntityType);
    atomic_store(result, (unint64_t *)&qword_256F92168);
  }
  return result;
}

unint64_t sub_23FF03090()
{
  unint64_t result;

  result = qword_256F92170;
  if (!qword_256F92170)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentStarted, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentStarted);
    atomic_store(result, (unint64_t *)&qword_256F92170);
  }
  return result;
}

unint64_t sub_23FF030D0()
{
  unint64_t result;

  result = qword_256F92178;
  if (!qword_256F92178)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentEnded, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentEnded);
    atomic_store(result, (unint64_t *)&qword_256F92178);
  }
  return result;
}

unint64_t sub_23FF03110()
{
  unint64_t result;

  result = qword_256F92180;
  if (!qword_256F92180)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentFailed, &type metadata for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentFailed);
    atomic_store(result, (unint64_t *)&qword_256F92180);
  }
  return result;
}

void sub_23FF0314C()
{
  sub_23FE23908(&qword_256F91DC8, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext);
}

void sub_23FF03178()
{
  sub_23FE23908(&qword_256F91DF8, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation);
}

void sub_23FF031A4()
{
  sub_23FE23908(&qword_256F91DF0, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall);
}

void sub_23FF031D0()
{
  sub_23FE23908(&qword_256F92188, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry, (uint64_t)&protocol conformance descriptor for IntelligenceFlowQueryDecorationTelemetry);
}

void initializeBufferWithCopyOfBuffer for IntelligenceFlowQueryDecorationTelemetry()
{
  _DWORD *v0;
  _DWORD *v1;
  void *v2;
  uint64_t v3;
  int *v4;
  int v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t Decoration;
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
  uint64_t v41;
  char v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  __n128 *v46;
  uint64_t v47;
  char *v48;
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

  OUTLINED_FUNCTION_38_5();
  OUTLINED_FUNCTION_417();
  if ((v5 & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_46_7();
  }
  else
  {
    v6 = v4;
    *v0 = *v1;
    v7 = OUTLINED_FUNCTION_46();
    if (OUTLINED_FUNCTION_7_8())
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
      OUTLINED_FUNCTION_5_12(v8);
    }
    else
    {
      OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16));
      OUTLINED_FUNCTION_4_6();
    }
    v9 = OUTLINED_FUNCTION_29_1();
    if (v11)
      OUTLINED_FUNCTION_18_4(v9, v10, v11);
    else
      OUTLINED_FUNCTION_28_4(v9, v10);
    v12 = v6[7];
    v13 = (uint64_t)v0 + v12;
    v14 = (uint64_t)v1 + v12;
    Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(0);
    if (OUTLINED_FUNCTION_19_0(v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D88);
      OUTLINED_FUNCTION_6_2(v16);
    }
    else
    {
      v17 = OUTLINED_FUNCTION_25();
      if (OUTLINED_FUNCTION_2_22(v17))
      {
        v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
        OUTLINED_FUNCTION_6_2(v18);
      }
      else
      {
        v19 = OUTLINED_FUNCTION_1_2();
        if (OUTLINED_FUNCTION_15_16(v19))
        {
          v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
          OUTLINED_FUNCTION_6_2(v20);
        }
        else
        {
          OUTLINED_FUNCTION_38_12(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
          OUTLINED_FUNCTION_16_23();
        }
        OUTLINED_FUNCTION_3_25();
      }
      v2 = (void *)(v13 + *(int *)(Decoration + 20));
      v21 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_15_16(v21))
      {
        v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_20_16(v2, v23, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
      }
      else
      {
        OUTLINED_FUNCTION_37_13((uint64_t)v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
        OUTLINED_FUNCTION_12_18((uint64_t)v2);
      }
      OUTLINED_FUNCTION_10_1(v13);
    }
    OUTLINED_FUNCTION_37_11();
    if (OUTLINED_FUNCTION_7_8())
    {
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
      OUTLINED_FUNCTION_5_12(v24);
    }
    else
    {
      v25 = OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_134_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16));
      OUTLINED_FUNCTION_55_3();
      OUTLINED_FUNCTION_4_6();
    }
    v26 = v6[9];
    v27 = (uint64_t)v0 + v26;
    v28 = (uint64_t)v1 + v26;
    type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation(0);
    if (OUTLINED_FUNCTION_19_0(v28))
    {
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D90);
      OUTLINED_FUNCTION_6_2(v29);
    }
    else
    {
      v30 = OUTLINED_FUNCTION_25();
      if (OUTLINED_FUNCTION_2_22(v30))
      {
        v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
        OUTLINED_FUNCTION_6_2(v31);
      }
      else
      {
        v32 = OUTLINED_FUNCTION_1_2();
        if (OUTLINED_FUNCTION_15_16(v32))
        {
          v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
          OUTLINED_FUNCTION_6_2(v33);
        }
        else
        {
          OUTLINED_FUNCTION_38_12(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
          OUTLINED_FUNCTION_16_23();
        }
        OUTLINED_FUNCTION_3_25();
      }
      OUTLINED_FUNCTION_10_1(v27);
    }
    v34 = v6[10];
    v35 = (uint64_t)v0 + v34;
    v36 = (uint64_t)v1 + v34;
    type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall(0);
    if (OUTLINED_FUNCTION_19_0(v36))
    {
      v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D98);
      OUTLINED_FUNCTION_6_2(v37);
    }
    else
    {
      v38 = OUTLINED_FUNCTION_25();
      if (OUTLINED_FUNCTION_2_22(v38))
      {
        v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
        OUTLINED_FUNCTION_6_2(v39);
      }
      else
      {
        v40 = OUTLINED_FUNCTION_1_2();
        if (OUTLINED_FUNCTION_15_16(v40))
        {
          v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
          OUTLINED_FUNCTION_6_2(v41);
        }
        else
        {
          OUTLINED_FUNCTION_38_12(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
          OUTLINED_FUNCTION_16_23();
        }
        OUTLINED_FUNCTION_3_25();
      }
      OUTLINED_FUNCTION_10_1(v35);
    }
    OUTLINED_FUNCTION_365_0();
    if (!v42)
      swift_retain();
    v43 = OUTLINED_FUNCTION_289_1();
    if (v43)
    {
      OUTLINED_FUNCTION_242_2(v43, v44);
      OUTLINED_FUNCTION_44_1();
      OUTLINED_FUNCTION_4_8();
      OUTLINED_FUNCTION_112_1();
    }
    else
    {
      OUTLINED_FUNCTION_67_1(v44);
    }
    v45 = OUTLINED_FUNCTION_148_5();
    if (v45)
    {
      OUTLINED_FUNCTION_285_3(v45, v46);
      OUTLINED_FUNCTION_44_1();
      OUTLINED_FUNCTION_4_8();
    }
    else
    {
      OUTLINED_FUNCTION_206_1(v46);
    }
    v47 = v6[15];
    v48 = (char *)v0 + v47;
    v49 = (uint64_t)v1 + v47;
    v50 = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(0);
    if (OUTLINED_FUNCTION_9_2(v49))
    {
      v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91DA0);
      OUTLINED_FUNCTION_63_3(v48, v52, *(_QWORD *)(*(_QWORD *)(v51 - 8) + 64));
    }
    else
    {
      v53 = OUTLINED_FUNCTION_184_4();
      if (v42)
        OUTLINED_FUNCTION_147_6((uint64_t)(v48 + 16));
      else
        OUTLINED_FUNCTION_183_4(v53);
      v54 = *(int *)(v50 + 28);
      v55 = (uint64_t)&v48[v54];
      v56 = v49 + v54;
      OUTLINED_FUNCTION_25();
      if (OUTLINED_FUNCTION_19_0(v56))
      {
        v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
        OUTLINED_FUNCTION_6_2(v57);
      }
      else
      {
        v58 = OUTLINED_FUNCTION_1_2();
        if (OUTLINED_FUNCTION_2_22(v58))
        {
          v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
          OUTLINED_FUNCTION_6_2(v59);
        }
        else
        {
          OUTLINED_FUNCTION_30_9(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*((_QWORD *)v2 - 1) + 16));
          OUTLINED_FUNCTION_3_25();
        }
        OUTLINED_FUNCTION_10_1(v55);
      }
      OUTLINED_FUNCTION_41((uint64_t)v48, 0);
    }
  }
  OUTLINED_FUNCTION_6_7();
}

void destroy for IntelligenceFlowQueryDecorationTelemetry()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t Decoration;
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
  void (*v26)(uint64_t);

  OUTLINED_FUNCTION_207_0();
  v4 = v3 + *(int *)(v2 + 20);
  v5 = OUTLINED_FUNCTION_46();
  if (!OUTLINED_FUNCTION_8_0(v4))
    OUTLINED_FUNCTION_107_2(v4, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8));
  v6 = v0 + v1[6];
  if (*(_QWORD *)(v6 + 24))
    __swift_destroy_boxed_opaque_existential_1(v6);
  v7 = OUTLINED_FUNCTION_265_3();
  Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(v7);
  if (!OUTLINED_FUNCTION_8_0(v4))
  {
    v9 = OUTLINED_FUNCTION_25();
    if (!OUTLINED_FUNCTION_279_0(v9))
    {
      v10 = OUTLINED_FUNCTION_1_2();
      if (!OUTLINED_FUNCTION_19_0(v4))
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v4, v10);
    }
    v4 += *(int *)(Decoration + 20);
    v11 = OUTLINED_FUNCTION_1_2();
    if (!OUTLINED_FUNCTION_8_0(v4))
      OUTLINED_FUNCTION_107_2(v4, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8));
  }
  OUTLINED_FUNCTION_265_3();
  type metadata accessor for MonotonicTimestamp();
  if (!OUTLINED_FUNCTION_8_0(v4))
  {
    v12 = OUTLINED_FUNCTION_1_2();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v4, v12);
    swift_release();
  }
  v13 = OUTLINED_FUNCTION_265_3();
  v14 = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation(v13);
  if (!OUTLINED_FUNCTION_279_0(v14))
  {
    v15 = OUTLINED_FUNCTION_25();
    if (!OUTLINED_FUNCTION_279_0(v15))
    {
      v16 = OUTLINED_FUNCTION_1_2();
      if (!OUTLINED_FUNCTION_8_0(v4))
        OUTLINED_FUNCTION_107_2(v4, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8));
    }
  }
  v17 = OUTLINED_FUNCTION_265_3();
  v18 = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall(v17);
  if (!OUTLINED_FUNCTION_279_0(v18))
  {
    v19 = OUTLINED_FUNCTION_25();
    if (!OUTLINED_FUNCTION_279_0(v19))
    {
      v20 = OUTLINED_FUNCTION_1_2();
      if (!OUTLINED_FUNCTION_8_0(v4))
        OUTLINED_FUNCTION_107_2(v4, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8));
    }
  }
  if ((~*(_QWORD *)(v0 + v1[11]) & 0xF000000000000007) != 0)
    swift_release();
  if (*(_QWORD *)(v0 + v1[12]))
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_359_1();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v0 + v1[14]))
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_359_1();
    swift_bridgeObjectRelease();
  }
  v21 = v0 + v1[15];
  v22 = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(0);
  if (OUTLINED_FUNCTION_9_2(v21))
    goto LABEL_32;
  if (*(_QWORD *)(v21 + 24) != 1)
    swift_bridgeObjectRelease();
  v23 = v21 + *(int *)(v22 + 28);
  v24 = OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_121_2(v24) || (OUTLINED_FUNCTION_1_2(), OUTLINED_FUNCTION_9_2(v23)))
  {
LABEL_32:
    OUTLINED_FUNCTION_8_6();
  }
  else
  {
    v25 = OUTLINED_FUNCTION_13_9();
    v26(v25);
  }
}

void initializeWithCopy for IntelligenceFlowQueryDecorationTelemetry()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  void *v3;
  uint64_t v4;
  _DWORD *v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t Decoration;
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
  uint64_t v41;
  char v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  __n128 *v46;
  uint64_t v47;
  void *v48;
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

  OUTLINED_FUNCTION_38_5();
  v7 = OUTLINED_FUNCTION_0_13(v5, v6);
  if (OUTLINED_FUNCTION_7_8())
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_5_12(v8);
  }
  else
  {
    OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16));
    OUTLINED_FUNCTION_4_6();
  }
  v9 = OUTLINED_FUNCTION_29_1();
  if (v11)
    OUTLINED_FUNCTION_18_4(v9, v10, v11);
  else
    OUTLINED_FUNCTION_28_4(v9, v10);
  v12 = v2[7];
  v13 = v0 + v12;
  v14 = v1 + v12;
  Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(0);
  if (OUTLINED_FUNCTION_19_0(v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D88);
    OUTLINED_FUNCTION_6_2(v16);
  }
  else
  {
    v17 = OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_2_22(v17))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
      OUTLINED_FUNCTION_6_2(v18);
    }
    else
    {
      v19 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_15_16(v19))
      {
        v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_6_2(v20);
      }
      else
      {
        OUTLINED_FUNCTION_38_12(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
        OUTLINED_FUNCTION_16_23();
      }
      OUTLINED_FUNCTION_3_25();
    }
    v3 = (void *)(v13 + *(int *)(Decoration + 20));
    v21 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_15_16(v21))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_20_16(v3, v23, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      OUTLINED_FUNCTION_37_13((uint64_t)v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
      OUTLINED_FUNCTION_12_18((uint64_t)v3);
    }
    OUTLINED_FUNCTION_10_1(v13);
  }
  OUTLINED_FUNCTION_37_11();
  if (OUTLINED_FUNCTION_7_8())
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
    OUTLINED_FUNCTION_5_12(v24);
  }
  else
  {
    v25 = OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_134_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16));
    OUTLINED_FUNCTION_55_3();
    OUTLINED_FUNCTION_4_6();
  }
  v26 = v2[9];
  v27 = v0 + v26;
  v28 = v1 + v26;
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation(0);
  if (OUTLINED_FUNCTION_19_0(v28))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D90);
    OUTLINED_FUNCTION_6_2(v29);
  }
  else
  {
    v30 = OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_2_22(v30))
    {
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
      OUTLINED_FUNCTION_6_2(v31);
    }
    else
    {
      v32 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_15_16(v32))
      {
        v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_6_2(v33);
      }
      else
      {
        OUTLINED_FUNCTION_38_12(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
        OUTLINED_FUNCTION_16_23();
      }
      OUTLINED_FUNCTION_3_25();
    }
    OUTLINED_FUNCTION_10_1(v27);
  }
  v34 = v2[10];
  v35 = v0 + v34;
  v36 = v1 + v34;
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall(0);
  if (OUTLINED_FUNCTION_19_0(v36))
  {
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D98);
    OUTLINED_FUNCTION_6_2(v37);
  }
  else
  {
    v38 = OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_2_22(v38))
    {
      v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
      OUTLINED_FUNCTION_6_2(v39);
    }
    else
    {
      v40 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_15_16(v40))
      {
        v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_6_2(v41);
      }
      else
      {
        OUTLINED_FUNCTION_38_12(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
        OUTLINED_FUNCTION_16_23();
      }
      OUTLINED_FUNCTION_3_25();
    }
    OUTLINED_FUNCTION_10_1(v35);
  }
  OUTLINED_FUNCTION_365_0();
  if (!v42)
    swift_retain();
  v43 = OUTLINED_FUNCTION_289_1();
  if (v43)
  {
    OUTLINED_FUNCTION_242_2(v43, v44);
    OUTLINED_FUNCTION_44_1();
    OUTLINED_FUNCTION_4_8();
    OUTLINED_FUNCTION_112_1();
  }
  else
  {
    OUTLINED_FUNCTION_67_1(v44);
  }
  v45 = OUTLINED_FUNCTION_148_5();
  if (v45)
  {
    OUTLINED_FUNCTION_285_3(v45, v46);
    OUTLINED_FUNCTION_44_1();
    OUTLINED_FUNCTION_4_8();
  }
  else
  {
    OUTLINED_FUNCTION_206_1(v46);
  }
  v47 = v2[15];
  v48 = (void *)(v0 + v47);
  v49 = v1 + v47;
  v50 = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(0);
  if (OUTLINED_FUNCTION_9_2(v49))
  {
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91DA0);
    OUTLINED_FUNCTION_63_3(v48, v52, *(_QWORD *)(*(_QWORD *)(v51 - 8) + 64));
  }
  else
  {
    v53 = OUTLINED_FUNCTION_184_4();
    if (v42)
      OUTLINED_FUNCTION_147_6((uint64_t)v48 + 16);
    else
      OUTLINED_FUNCTION_183_4(v53);
    v54 = *(int *)(v50 + 28);
    v55 = (uint64_t)v48 + v54;
    v56 = v49 + v54;
    OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_19_0(v56))
    {
      v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
      OUTLINED_FUNCTION_6_2(v57);
    }
    else
    {
      v58 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_2_22(v58))
      {
        v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_6_2(v59);
      }
      else
      {
        OUTLINED_FUNCTION_30_9(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*((_QWORD *)v3 - 1) + 16));
        OUTLINED_FUNCTION_3_25();
      }
      OUTLINED_FUNCTION_10_1(v55);
    }
    OUTLINED_FUNCTION_41((uint64_t)v48, 0);
  }
  OUTLINED_FUNCTION_6_7();
}

void assignWithCopy for IntelligenceFlowQueryDecorationTelemetry()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  __int128 *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  _DWORD *v8;
  _DWORD *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t Decoration;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const void *v29;
  size_t v30;
  uint64_t v31;
  uint64_t EnumTagSinglePayload;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
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
  int v65;
  int v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  int v110;
  __int128 v111;
  void *v112;
  const void *v113;
  size_t v114;
  __int128 *v115;
  __int128 *v116;
  uint64_t v117;
  __int128 v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  int v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  int v143;
  int v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;

  OUTLINED_FUNCTION_38_5();
  v10 = OUTLINED_FUNCTION_0_13(v8, v9);
  v11 = OUTLINED_FUNCTION_5_1(v10);
  if (v6)
  {
    if (!v11)
    {
      OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16));
      OUTLINED_FUNCTION_4_6();
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v12 = *(_QWORD *)(v5 - 8);
  if (v11)
  {
    OUTLINED_FUNCTION_20_5(v12);
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_5_12(v13);
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 24));
LABEL_7:
  OUTLINED_FUNCTION_389();
  v14 = *((_QWORD *)v4 + 3);
  if (v15)
  {
    if (v14)
    {
      v16 = (uint64_t *)OUTLINED_FUNCTION_300_0();
      __swift_assign_boxed_opaque_existential_1(v16, v17);
      goto LABEL_14;
    }
    __swift_destroy_boxed_opaque_existential_1(v3);
  }
  else if (v14)
  {
    *(_QWORD *)(v3 + 24) = v14;
    *(_QWORD *)(v3 + 32) = *((_QWORD *)v4 + 4);
    OUTLINED_FUNCTION_134_1(**(uint64_t (***)(uint64_t, uint64_t))(v14 - 8));
    goto LABEL_14;
  }
  v18 = *v4;
  v19 = v4[1];
  *(_QWORD *)(v3 + 32) = *((_QWORD *)v4 + 4);
  *(_OWORD *)v3 = v18;
  *(_OWORD *)(v3 + 16) = v19;
LABEL_14:
  v20 = v2[7];
  v21 = v0 + v20;
  v22 = v1 + v20;
  Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(0);
  LODWORD(v24) = __swift_getEnumTagSinglePayload(v21, 1, Decoration);
  v25 = OUTLINED_FUNCTION_19_0(v22);
  if ((_DWORD)v24)
  {
    if (!(_DWORD)v25)
    {
      v26 = OUTLINED_FUNCTION_25();
      if (OUTLINED_FUNCTION_2_22(v26))
      {
        v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
        OUTLINED_FUNCTION_6_2(v27);
      }
      else
      {
        v36 = OUTLINED_FUNCTION_1_2();
        if (OUTLINED_FUNCTION_15_16(v36))
        {
          v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
          OUTLINED_FUNCTION_6_2(v37);
        }
        else
        {
          OUTLINED_FUNCTION_38_12(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16));
          OUTLINED_FUNCTION_16_23();
        }
        OUTLINED_FUNCTION_3_25();
      }
      v40 = *(int *)(Decoration + 20);
      v24 = (void *)(v21 + v40);
      v22 += v40;
      v41 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_15_16(v41))
      {
        v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_20_16(v24, v43, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
      }
      else
      {
        OUTLINED_FUNCTION_37_13((uint64_t)v24, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16));
        OUTLINED_FUNCTION_12_18((uint64_t)v24);
      }
      v44 = OUTLINED_FUNCTION_132_3();
      goto LABEL_39;
    }
    goto LABEL_20;
  }
  if ((_DWORD)v25)
  {
    OUTLINED_FUNCTION_149_2(v25, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata);
LABEL_20:
    __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D88);
    v28 = (void *)OUTLINED_FUNCTION_129_3();
LABEL_21:
    memcpy(v28, v29, v30);
    goto LABEL_40;
  }
  v31 = OUTLINED_FUNCTION_25();
  LODWORD(v24) = v31;
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v21, 1, v31);
  v33 = OUTLINED_FUNCTION_17_13();
  if ((_DWORD)EnumTagSinglePayload)
  {
    if (!(_DWORD)v33)
    {
      v34 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_15_16(v34))
      {
        v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_6_2(v35);
      }
      else
      {
        OUTLINED_FUNCTION_38_12(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(EnumTagSinglePayload
                                                                                                - 8)
                                                                                    + 16));
        OUTLINED_FUNCTION_16_23();
      }
      goto LABEL_66;
    }
    goto LABEL_31;
  }
  if ((_DWORD)v33)
  {
    OUTLINED_FUNCTION_149_2(v33, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_31:
    v38 = &qword_256F90740;
LABEL_32:
    v39 = __swift_instantiateConcreteTypeFromMangledName(v38);
    OUTLINED_FUNCTION_6_2(v39);
    goto LABEL_67;
  }
  v24 = (void *)OUTLINED_FUNCTION_1_2();
  v65 = __swift_getEnumTagSinglePayload(v21, 1, (uint64_t)v24);
  v66 = OUTLINED_FUNCTION_17_13();
  if (v65)
  {
    if (!v66)
    {
      OUTLINED_FUNCTION_30_9(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*((_QWORD *)v24 - 1) + 16));
LABEL_66:
      OUTLINED_FUNCTION_3_25();
      goto LABEL_67;
    }
    goto LABEL_154;
  }
  v145 = *((_QWORD *)v24 - 1);
  if (v66)
  {
    OUTLINED_FUNCTION_51_4(v145);
LABEL_154:
    v38 = &qword_25434B788;
    goto LABEL_32;
  }
  OUTLINED_FUNCTION_30_9(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v145 + 24));
LABEL_67:
  v69 = *(int *)(Decoration + 20);
  v21 += v69;
  Decoration = v22 + v69;
  v70 = OUTLINED_FUNCTION_1_2();
  v71 = OUTLINED_FUNCTION_5_1(v70);
  if ((_DWORD)v24)
  {
    if (!v71)
    {
      OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16));
      v44 = OUTLINED_FUNCTION_92_7();
LABEL_39:
      __swift_storeEnumTagSinglePayload(v44, v45, v46, v47);
      goto LABEL_40;
    }
    goto LABEL_72;
  }
  v72 = *(_QWORD *)(v22 - 8);
  if (v71)
  {
    OUTLINED_FUNCTION_20_5(v72);
LABEL_72:
    __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    v28 = (void *)OUTLINED_FUNCTION_300_0();
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v72 + 24));
LABEL_40:
  v48 = OUTLINED_FUNCTION_37_11();
  v49 = OUTLINED_FUNCTION_5_1(v48);
  if ((_DWORD)v24)
  {
    if (!(_DWORD)v49)
    {
      v50 = OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_134_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 16));
      OUTLINED_FUNCTION_55_3();
      OUTLINED_FUNCTION_4_6();
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  if ((_DWORD)v49)
  {
    OUTLINED_FUNCTION_149_2(v49, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
LABEL_45:
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
    OUTLINED_FUNCTION_5_12(v51);
    goto LABEL_46;
  }
  v60 = OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_134_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 24));
  *(_QWORD *)(v21 + *(int *)(v22 + 20)) = *(_QWORD *)(Decoration + *(int *)(v22 + 20));
  swift_retain();
  swift_release();
LABEL_46:
  v52 = v2[9];
  v53 = v0 + v52;
  v54 = v1 + v52;
  v55 = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation(0);
  v56 = OUTLINED_FUNCTION_5_1(v55);
  if (!(_DWORD)v24)
  {
    if (!(_DWORD)v56)
    {
      v61 = OUTLINED_FUNCTION_25();
      v62 = OUTLINED_FUNCTION_5_1(v61);
      if ((_DWORD)v62)
      {
        OUTLINED_FUNCTION_149_2(v62, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
        v58 = &qword_256F90740;
      }
      else
      {
        v67 = OUTLINED_FUNCTION_1_2();
        v68 = OUTLINED_FUNCTION_5_1(v67);
        v146 = *(_QWORD *)(v22 - 8);
        if (!v68)
        {
          OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v146 + 24));
          goto LABEL_76;
        }
        OUTLINED_FUNCTION_20_5(v146);
        v58 = &qword_25434B788;
      }
LABEL_53:
      v59 = __swift_instantiateConcreteTypeFromMangledName(v58);
      OUTLINED_FUNCTION_5_12(v59);
      goto LABEL_76;
    }
    OUTLINED_FUNCTION_149_2(v56, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation);
LABEL_52:
    v58 = &qword_256F91D90;
    goto LABEL_53;
  }
  if ((_DWORD)v56)
    goto LABEL_52;
  LODWORD(v24) = OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_22_15(v54))
  {
    v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_5_12(v57);
  }
  else
  {
    v63 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_26_9(v54))
    {
      v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_5_12(v64);
    }
    else
    {
      OUTLINED_FUNCTION_84_2(v53, v54, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 16));
      OUTLINED_FUNCTION_16_23();
    }
    OUTLINED_FUNCTION_3_25();
  }
  OUTLINED_FUNCTION_4_6();
LABEL_76:
  v73 = v2[10];
  v74 = v0 + v73;
  v75 = v1 + v73;
  v76 = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall(0);
  v77 = OUTLINED_FUNCTION_5_1(v76);
  if (!(_DWORD)v24)
  {
    if (!(_DWORD)v77)
    {
      v81 = OUTLINED_FUNCTION_25();
      v82 = OUTLINED_FUNCTION_5_1(v81);
      if ((_DWORD)v82)
      {
        OUTLINED_FUNCTION_149_2(v82, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
        v79 = &qword_256F90740;
      }
      else
      {
        v85 = OUTLINED_FUNCTION_1_2();
        v86 = OUTLINED_FUNCTION_5_1(v85);
        v147 = *(_QWORD *)(v22 - 8);
        if (!v86)
        {
          OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v147 + 24));
          goto LABEL_93;
        }
        OUTLINED_FUNCTION_20_5(v147);
        v79 = &qword_25434B788;
      }
LABEL_83:
      v80 = __swift_instantiateConcreteTypeFromMangledName(v79);
      OUTLINED_FUNCTION_5_12(v80);
      goto LABEL_93;
    }
    OUTLINED_FUNCTION_149_2(v77, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall);
LABEL_82:
    v79 = &qword_256F91D98;
    goto LABEL_83;
  }
  if ((_DWORD)v77)
    goto LABEL_82;
  OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_22_15(v75))
  {
    v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_5_12(v78);
  }
  else
  {
    v83 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_26_9(v75))
    {
      v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_5_12(v84);
    }
    else
    {
      OUTLINED_FUNCTION_84_2(v74, v75, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v83 - 8) + 16));
      OUTLINED_FUNCTION_16_23();
    }
    OUTLINED_FUNCTION_3_25();
  }
  OUTLINED_FUNCTION_4_6();
LABEL_93:
  v87 = v2[11];
  v88 = (_QWORD *)(v0 + v87);
  v89 = *(_QWORD *)(v1 + v87);
  v90 = v89 & 0xF000000000000007;
  if ((~*(_QWORD *)(v0 + v87) & 0xF000000000000007) == 0)
  {
    if (v90 != 0xF000000000000007)
    {
      *v88 = v89;
      swift_retain();
      goto LABEL_100;
    }
    goto LABEL_98;
  }
  if (v90 == 0xF000000000000007)
  {
    sub_23FEDEE9C(v0 + v87);
    v89 = *(_QWORD *)(v1 + v87);
LABEL_98:
    *v88 = v89;
    goto LABEL_100;
  }
  *v88 = v89;
  swift_retain();
  swift_release();
LABEL_100:
  v91 = v2[12];
  v92 = v0 + v91;
  v93 = v1 + v91;
  v94 = *(_QWORD *)(v0 + v91);
  v95 = *(_QWORD *)(v1 + v91);
  if (v94)
  {
    if (v95)
    {
      OUTLINED_FUNCTION_354_1(v95);
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_234_2(*(_QWORD *)(v93 + 8));
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_353_1(*(_QWORD *)(v93 + 16));
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_351_0(*(_QWORD *)(v93 + 24));
      OUTLINED_FUNCTION_16_1();
    }
    else
    {
      sub_23FF04738(v0 + v91);
      v96 = *(_OWORD *)(v93 + 16);
      *(_OWORD *)v92 = *(_OWORD *)v93;
      *(_OWORD *)(v92 + 16) = v96;
    }
  }
  else if (v95)
  {
    *(_QWORD *)v92 = v95;
    v94 = *(_QWORD *)(v93 + 8);
    *(_QWORD *)(v92 + 8) = v94;
    v22 = *(_QWORD *)(v93 + 16);
    *(_QWORD *)(v92 + 16) = v22;
    v93 = *(_QWORD *)(v93 + 24);
    *(_QWORD *)(v92 + 24) = v93;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_4_8();
    OUTLINED_FUNCTION_112_1();
    OUTLINED_FUNCTION_5_5();
  }
  else
  {
    v97 = *(_OWORD *)(v93 + 16);
    *(_OWORD *)v92 = *(_OWORD *)v93;
    *(_OWORD *)(v92 + 16) = v97;
  }
  v98 = v2[13];
  v99 = (_QWORD *)(v0 + v98);
  v100 = (uint64_t *)(v1 + v98);
  v101 = *v100;
  *(_QWORD *)((char *)v99 + 6) = *(uint64_t *)((char *)v100 + 6);
  *v99 = v101;
  v102 = OUTLINED_FUNCTION_297_3(v2[14]);
  if (v94)
  {
    if (v102)
    {
      OUTLINED_FUNCTION_354_1(v102);
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_234_2(*(_QWORD *)(v22 + 8));
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_353_1(*(_QWORD *)(v22 + 16));
      OUTLINED_FUNCTION_16_1();
    }
    else
    {
      sub_23FF0475C(v92);
      v103 = *(_QWORD *)(v22 + 16);
      *(_OWORD *)v92 = *(_OWORD *)v22;
      *(_QWORD *)(v92 + 16) = v103;
    }
  }
  else if (v102)
  {
    *(_QWORD *)v92 = v102;
    *(_QWORD *)(v92 + 8) = *(_QWORD *)(v22 + 8);
    *(_QWORD *)(v92 + 16) = *(_QWORD *)(v22 + 16);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_4_8();
    OUTLINED_FUNCTION_112_1();
  }
  else
  {
    v104 = *(_OWORD *)v22;
    *(_QWORD *)(v92 + 16) = *(_QWORD *)(v22 + 16);
    *(_OWORD *)v92 = v104;
  }
  v105 = v2[15];
  v106 = v0 + v105;
  v107 = v1 + v105;
  v108 = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(0);
  v109 = __swift_getEnumTagSinglePayload(v106, 1, v108);
  v110 = OUTLINED_FUNCTION_9_2(v107);
  if (v109)
  {
    if (!v110)
    {
      OUTLINED_FUNCTION_232_3();
      if (*(_QWORD *)(v107 + 24) == 1)
      {
        v111 = *(_OWORD *)(v107 + 16);
        *(_QWORD *)(v106 + 29) = *(_QWORD *)(v107 + 29);
        *(_OWORD *)(v106 + 16) = v111;
      }
      else
      {
        OUTLINED_FUNCTION_141_5();
      }
      v119 = *(int *)(v108 + 28);
      v120 = (void *)(v106 + v119);
      v121 = v107 + v119;
      OUTLINED_FUNCTION_25();
      if (OUTLINED_FUNCTION_8_0(v121))
      {
        v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
        OUTLINED_FUNCTION_20_16(v120, v123, *(_QWORD *)(*(_QWORD *)(v122 - 8) + 64));
      }
      else
      {
        v124 = OUTLINED_FUNCTION_1_2();
        if (OUTLINED_FUNCTION_2_22(v124))
        {
          v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
          OUTLINED_FUNCTION_20_16(v120, v126, *(_QWORD *)(*(_QWORD *)(v125 - 8) + 64));
        }
        else
        {
          OUTLINED_FUNCTION_12_20((uint64_t)v120, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v93 - 8) + 16));
          OUTLINED_FUNCTION_14_3((uint64_t)v120);
        }
        OUTLINED_FUNCTION_3_16((uint64_t)v120);
      }
      v138 = OUTLINED_FUNCTION_80_1();
      goto LABEL_145;
    }
    goto LABEL_120;
  }
  if (!v110)
  {
    OUTLINED_FUNCTION_232_3();
    v115 = (__int128 *)(v106 + 16);
    v116 = (__int128 *)(v107 + 16);
    v117 = *(_QWORD *)(v107 + 24);
    if (*(_QWORD *)(v106 + 24) == 1)
    {
      if (v117 == 1)
      {
        v118 = *v116;
        *(_QWORD *)(v106 + 29) = *(_QWORD *)(v107 + 29);
        *v115 = v118;
      }
      else
      {
        OUTLINED_FUNCTION_141_5();
      }
    }
    else if (v117 == 1)
    {
      sub_23FEBABD4(v106 + 16);
      v127 = *(_QWORD *)(v107 + 29);
      *v115 = *v116;
      *(_QWORD *)(v106 + 29) = v127;
    }
    else
    {
      *(_QWORD *)(v106 + 16) = *(_QWORD *)(v107 + 16);
      *(_QWORD *)(v106 + 24) = *(_QWORD *)(v107 + 24);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_17_3();
      v128 = *(_DWORD *)(v107 + 32);
      *(_BYTE *)(v106 + 36) = *(_BYTE *)(v107 + 36);
      *(_DWORD *)(v106 + 32) = v128;
    }
    v129 = *(int *)(v108 + 28);
    v130 = v106 + v129;
    v131 = v107 + v129;
    v132 = OUTLINED_FUNCTION_25();
    v133 = __swift_getEnumTagSinglePayload(v130, 1, v132);
    v134 = OUTLINED_FUNCTION_8_0(v131);
    if (v133)
    {
      if (!(_DWORD)v134)
      {
        v135 = OUTLINED_FUNCTION_1_2();
        if (OUTLINED_FUNCTION_19_0(v131))
        {
          v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
          OUTLINED_FUNCTION_70_6(v136);
        }
        else
        {
          OUTLINED_FUNCTION_17_5(v130, v131, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v135 - 8) + 16));
          OUTLINED_FUNCTION_10_1(v130);
        }
        goto LABEL_151;
      }
    }
    else
    {
      if (!(_DWORD)v134)
      {
        v142 = OUTLINED_FUNCTION_1_2();
        v143 = __swift_getEnumTagSinglePayload(v130, 1, v142);
        v144 = OUTLINED_FUNCTION_8_0(v131);
        if (v143)
        {
          if (!v144)
          {
            OUTLINED_FUNCTION_19_4(v130, v131, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v142 - 8) + 16));
LABEL_151:
            v138 = OUTLINED_FUNCTION_85_2();
LABEL_145:
            __swift_storeEnumTagSinglePayload(v138, v139, v140, v141);
            goto LABEL_146;
          }
        }
        else
        {
          v148 = *(_QWORD *)(v142 - 8);
          if (!v144)
          {
            OUTLINED_FUNCTION_19_4(v130, v131, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v148 + 24));
            goto LABEL_146;
          }
          OUTLINED_FUNCTION_107_2(v130, *(uint64_t (**)(uint64_t, uint64_t))(v148 + 8));
        }
        v137 = &qword_25434B788;
LABEL_141:
        __swift_instantiateConcreteTypeFromMangledName(v137);
        v112 = (void *)OUTLINED_FUNCTION_69_2();
        goto LABEL_121;
      }
      OUTLINED_FUNCTION_269_2(v134, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
    }
    v137 = &qword_256F90740;
    goto LABEL_141;
  }
  sub_23FE251BC(v106, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext);
LABEL_120:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91DA0);
  v112 = (void *)OUTLINED_FUNCTION_220_1();
LABEL_121:
  memcpy(v112, v113, v114);
LABEL_146:
  OUTLINED_FUNCTION_6_7();
}

uint64_t sub_23FF04738(uint64_t a1)
{
  destroy for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected();
  return a1;
}

uint64_t sub_23FF0475C(uint64_t a1)
{
  destroy for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked();
  return a1;
}

void initializeWithTake for IntelligenceFlowQueryDecorationTelemetry()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  void *v3;
  uint64_t v4;
  _DWORD *v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t Decoration;
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
  _OWORD *v45;
  _OWORD *v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
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

  OUTLINED_FUNCTION_38_5();
  v7 = OUTLINED_FUNCTION_0_13(v5, v6);
  if (OUTLINED_FUNCTION_7_8())
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_5_12(v8);
  }
  else
  {
    OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32));
    OUTLINED_FUNCTION_4_6();
  }
  v9 = v2[6];
  v10 = v2[7];
  v11 = v0 + v9;
  v12 = v1 + v9;
  v13 = *(_OWORD *)(v12 + 16);
  *(_OWORD *)v11 = *(_OWORD *)v12;
  *(_OWORD *)(v11 + 16) = v13;
  *(_QWORD *)(v11 + 32) = *(_QWORD *)(v12 + 32);
  v14 = v0 + v10;
  v15 = v1 + v10;
  Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(0);
  if (OUTLINED_FUNCTION_19_0(v15))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D88);
    OUTLINED_FUNCTION_6_2(v17);
  }
  else
  {
    v18 = OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_2_22(v18))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
      OUTLINED_FUNCTION_6_2(v19);
    }
    else
    {
      v20 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_15_16(v20))
      {
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_6_2(v21);
      }
      else
      {
        OUTLINED_FUNCTION_38_12(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32));
        OUTLINED_FUNCTION_16_23();
      }
      OUTLINED_FUNCTION_3_25();
    }
    v3 = (void *)(v14 + *(int *)(Decoration + 20));
    v22 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_15_16(v22))
    {
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_20_16(v3, v24, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      OUTLINED_FUNCTION_37_13((uint64_t)v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32));
      OUTLINED_FUNCTION_12_18((uint64_t)v3);
    }
    OUTLINED_FUNCTION_10_1(v14);
  }
  v25 = OUTLINED_FUNCTION_37_11();
  if (OUTLINED_FUNCTION_7_8())
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
    OUTLINED_FUNCTION_5_12(v26);
  }
  else
  {
    v27 = OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_134_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 32));
    *(_QWORD *)(v14 + *(int *)(v25 + 20)) = *(_QWORD *)(Decoration + *(int *)(v25 + 20));
    OUTLINED_FUNCTION_4_6();
  }
  v28 = v2[9];
  v29 = v0 + v28;
  v30 = v1 + v28;
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation(0);
  if (OUTLINED_FUNCTION_19_0(v30))
  {
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D90);
    OUTLINED_FUNCTION_6_2(v31);
  }
  else
  {
    v32 = OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_2_22(v32))
    {
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
      OUTLINED_FUNCTION_6_2(v33);
    }
    else
    {
      v34 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_15_16(v34))
      {
        v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_6_2(v35);
      }
      else
      {
        OUTLINED_FUNCTION_38_12(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32));
        OUTLINED_FUNCTION_16_23();
      }
      OUTLINED_FUNCTION_3_25();
    }
    OUTLINED_FUNCTION_10_1(v29);
  }
  v36 = v2[10];
  v37 = v0 + v36;
  v38 = v1 + v36;
  type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall(0);
  if (OUTLINED_FUNCTION_19_0(v38))
  {
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D98);
    OUTLINED_FUNCTION_6_2(v39);
  }
  else
  {
    v40 = OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_2_22(v40))
    {
      v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
      OUTLINED_FUNCTION_6_2(v41);
    }
    else
    {
      v42 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_15_16(v42))
      {
        v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_6_2(v43);
      }
      else
      {
        OUTLINED_FUNCTION_38_12(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32));
        OUTLINED_FUNCTION_16_23();
      }
      OUTLINED_FUNCTION_3_25();
    }
    OUTLINED_FUNCTION_10_1(v37);
  }
  v44 = v2[12];
  *(_QWORD *)(v0 + v2[11]) = *(_QWORD *)(v1 + v2[11]);
  v45 = (_OWORD *)(v0 + v44);
  v46 = (_OWORD *)(v1 + v44);
  v47 = v46[1];
  *v45 = *v46;
  v45[1] = v47;
  v48 = v2[13];
  v49 = v2[14];
  v50 = (_QWORD *)(v0 + v48);
  v51 = (_QWORD *)(v1 + v48);
  *(_QWORD *)((char *)v50 + 6) = *(_QWORD *)((char *)v51 + 6);
  *v50 = *v51;
  OUTLINED_FUNCTION_206_1((__n128 *)(v0 + v49));
  v52 = v2[15];
  v53 = (_QWORD *)(v0 + v52);
  v54 = v1 + v52;
  v55 = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(0);
  if (OUTLINED_FUNCTION_9_2(v54))
  {
    v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91DA0);
    OUTLINED_FUNCTION_63_3(v53, v57, *(_QWORD *)(*(_QWORD *)(v56 - 8) + 64));
  }
  else
  {
    *v53 = *(_QWORD *)v54;
    *(_DWORD *)((char *)v53 + 7) = *(_DWORD *)(v54 + 7);
    *((_BYTE *)v53 + 11) = *(_BYTE *)(v54 + 11);
    *((_OWORD *)v53 + 1) = *(_OWORD *)(v54 + 16);
    *(_QWORD *)((char *)v53 + 29) = *(_QWORD *)(v54 + 29);
    v58 = *(int *)(v55 + 28);
    v59 = (uint64_t)v53 + v58;
    v60 = v54 + v58;
    OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_19_0(v60))
    {
      v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
      OUTLINED_FUNCTION_6_2(v61);
    }
    else
    {
      v62 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_2_22(v62))
      {
        v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_6_2(v63);
      }
      else
      {
        OUTLINED_FUNCTION_30_9(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*((_QWORD *)v3 - 1) + 32));
        OUTLINED_FUNCTION_3_25();
      }
      OUTLINED_FUNCTION_10_1(v59);
    }
    OUTLINED_FUNCTION_41((uint64_t)v53, 0);
  }
  OUTLINED_FUNCTION_6_7();
}

void assignWithTake for IntelligenceFlowQueryDecorationTelemetry()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  _DWORD *v8;
  _DWORD *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t Decoration;
  void *EnumTagSinglePayload;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const void *v24;
  size_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  int v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  int v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const void *v105;
  size_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  int v125;
  int v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;

  OUTLINED_FUNCTION_38_5();
  v10 = OUTLINED_FUNCTION_0_13(v8, v9);
  v11 = OUTLINED_FUNCTION_5_1(v10);
  if (v6)
  {
    if (!v11)
    {
      OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32));
      OUTLINED_FUNCTION_4_6();
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v12 = *(_QWORD *)(v5 - 8);
  if (v11)
  {
    OUTLINED_FUNCTION_20_5(v12);
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_5_12(v13);
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 40));
LABEL_7:
  OUTLINED_FUNCTION_389();
  if (v14)
    __swift_destroy_boxed_opaque_existential_1(v3);
  OUTLINED_FUNCTION_357_1();
  *(_QWORD *)(v3 + 32) = *(_QWORD *)(v4 + 32);
  v15 = v2[7];
  v16 = v0 + v15;
  v17 = v1 + v15;
  Decoration = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(0);
  EnumTagSinglePayload = (void *)__swift_getEnumTagSinglePayload(v16, 1, Decoration);
  v20 = OUTLINED_FUNCTION_19_0(v17);
  if ((_DWORD)EnumTagSinglePayload)
  {
    if (!(_DWORD)v20)
    {
      v21 = OUTLINED_FUNCTION_25();
      if (OUTLINED_FUNCTION_2_22(v21))
      {
        v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
        OUTLINED_FUNCTION_6_2(v22);
      }
      else
      {
        v30 = OUTLINED_FUNCTION_1_2();
        if (OUTLINED_FUNCTION_15_16(v30))
        {
          v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
          OUTLINED_FUNCTION_6_2(v31);
        }
        else
        {
          OUTLINED_FUNCTION_38_12(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32));
          OUTLINED_FUNCTION_16_23();
        }
        OUTLINED_FUNCTION_3_25();
      }
      v34 = *(int *)(Decoration + 20);
      EnumTagSinglePayload = (void *)(v16 + v34);
      v17 += v34;
      v35 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_15_16(v35))
      {
        v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_20_16(EnumTagSinglePayload, v37, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
      }
      else
      {
        OUTLINED_FUNCTION_37_13((uint64_t)EnumTagSinglePayload, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32));
        OUTLINED_FUNCTION_12_18((uint64_t)EnumTagSinglePayload);
      }
      v38 = OUTLINED_FUNCTION_132_3();
      goto LABEL_34;
    }
    goto LABEL_15;
  }
  if ((_DWORD)v20)
  {
    OUTLINED_FUNCTION_149_2(v20, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata);
LABEL_15:
    __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D88);
    v23 = (void *)OUTLINED_FUNCTION_129_3();
LABEL_16:
    memcpy(v23, v24, v25);
    goto LABEL_35;
  }
  EnumTagSinglePayload = (void *)OUTLINED_FUNCTION_25();
  v26 = __swift_getEnumTagSinglePayload(v16, 1, (uint64_t)EnumTagSinglePayload);
  v27 = OUTLINED_FUNCTION_17_13();
  if ((_DWORD)v26)
  {
    if (!(_DWORD)v27)
    {
      v28 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_15_16(v28))
      {
        v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_6_2(v29);
      }
      else
      {
        OUTLINED_FUNCTION_38_12(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 32));
        OUTLINED_FUNCTION_16_23();
      }
      goto LABEL_61;
    }
    goto LABEL_26;
  }
  if ((_DWORD)v27)
  {
    OUTLINED_FUNCTION_149_2(v27, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_26:
    v32 = &qword_256F90740;
LABEL_27:
    v33 = __swift_instantiateConcreteTypeFromMangledName(v32);
    OUTLINED_FUNCTION_6_2(v33);
    goto LABEL_62;
  }
  EnumTagSinglePayload = (void *)OUTLINED_FUNCTION_1_2();
  v59 = __swift_getEnumTagSinglePayload(v16, 1, (uint64_t)EnumTagSinglePayload);
  v60 = OUTLINED_FUNCTION_17_13();
  if (v59)
  {
    if (!v60)
    {
      OUTLINED_FUNCTION_30_9(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*((_QWORD *)EnumTagSinglePayload - 1)
                                                                                 + 32));
LABEL_61:
      OUTLINED_FUNCTION_3_25();
      goto LABEL_62;
    }
    goto LABEL_138;
  }
  v127 = *((_QWORD *)EnumTagSinglePayload - 1);
  if (v60)
  {
    OUTLINED_FUNCTION_51_4(v127);
LABEL_138:
    v32 = &qword_25434B788;
    goto LABEL_27;
  }
  OUTLINED_FUNCTION_30_9(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v127 + 40));
LABEL_62:
  v63 = *(int *)(Decoration + 20);
  v16 += v63;
  Decoration = v17 + v63;
  v64 = OUTLINED_FUNCTION_1_2();
  v65 = OUTLINED_FUNCTION_5_1(v64);
  if ((_DWORD)EnumTagSinglePayload)
  {
    if (!v65)
    {
      OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32));
      v38 = OUTLINED_FUNCTION_92_7();
LABEL_34:
      __swift_storeEnumTagSinglePayload(v38, v39, v40, v41);
      goto LABEL_35;
    }
    goto LABEL_67;
  }
  v66 = *(_QWORD *)(v17 - 8);
  if (v65)
  {
    OUTLINED_FUNCTION_20_5(v66);
LABEL_67:
    __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    v23 = (void *)OUTLINED_FUNCTION_300_0();
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v66 + 40));
LABEL_35:
  v42 = OUTLINED_FUNCTION_37_11();
  v43 = OUTLINED_FUNCTION_5_1(v42);
  if ((_DWORD)EnumTagSinglePayload)
  {
    if (!(_DWORD)v43)
    {
      v44 = OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_134_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 32));
      *(_QWORD *)(v16 + *(int *)(v17 + 20)) = *(_QWORD *)(Decoration + *(int *)(v17 + 20));
      OUTLINED_FUNCTION_4_6();
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  if ((_DWORD)v43)
  {
    OUTLINED_FUNCTION_149_2(v43, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
LABEL_40:
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
    OUTLINED_FUNCTION_5_12(v45);
    goto LABEL_41;
  }
  v54 = OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_134_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 40));
  *(_QWORD *)(v16 + *(int *)(v17 + 20)) = *(_QWORD *)(Decoration + *(int *)(v17 + 20));
  swift_release();
LABEL_41:
  v46 = v2[9];
  v47 = v0 + v46;
  v48 = v1 + v46;
  v49 = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation(0);
  v50 = OUTLINED_FUNCTION_5_1(v49);
  if (!(_DWORD)EnumTagSinglePayload)
  {
    if (!(_DWORD)v50)
    {
      v55 = OUTLINED_FUNCTION_25();
      v56 = OUTLINED_FUNCTION_5_1(v55);
      if ((_DWORD)v56)
      {
        OUTLINED_FUNCTION_149_2(v56, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
        v52 = &qword_256F90740;
      }
      else
      {
        v61 = OUTLINED_FUNCTION_1_2();
        v62 = OUTLINED_FUNCTION_5_1(v61);
        v128 = *(_QWORD *)(v17 - 8);
        if (!v62)
        {
          OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v128 + 40));
          goto LABEL_71;
        }
        OUTLINED_FUNCTION_20_5(v128);
        v52 = &qword_25434B788;
      }
LABEL_48:
      v53 = __swift_instantiateConcreteTypeFromMangledName(v52);
      OUTLINED_FUNCTION_5_12(v53);
      goto LABEL_71;
    }
    OUTLINED_FUNCTION_149_2(v50, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation);
LABEL_47:
    v52 = &qword_256F91D90;
    goto LABEL_48;
  }
  if ((_DWORD)v50)
    goto LABEL_47;
  EnumTagSinglePayload = (void *)OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_22_15(v48))
  {
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_5_12(v51);
  }
  else
  {
    v57 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_26_9(v48))
    {
      v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_5_12(v58);
    }
    else
    {
      OUTLINED_FUNCTION_84_2(v47, v48, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 32));
      OUTLINED_FUNCTION_16_23();
    }
    OUTLINED_FUNCTION_3_25();
  }
  OUTLINED_FUNCTION_4_6();
LABEL_71:
  v67 = v2[10];
  v68 = v0 + v67;
  v69 = v1 + v67;
  v70 = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall(0);
  v71 = OUTLINED_FUNCTION_5_1(v70);
  if (!(_DWORD)EnumTagSinglePayload)
  {
    if (!(_DWORD)v71)
    {
      v75 = OUTLINED_FUNCTION_25();
      v76 = OUTLINED_FUNCTION_5_1(v75);
      if ((_DWORD)v76)
      {
        OUTLINED_FUNCTION_149_2(v76, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
        v73 = &qword_256F90740;
      }
      else
      {
        v79 = OUTLINED_FUNCTION_1_2();
        v80 = OUTLINED_FUNCTION_5_1(v79);
        v129 = *(_QWORD *)(v17 - 8);
        if (!v80)
        {
          OUTLINED_FUNCTION_3_11(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v129 + 40));
          goto LABEL_88;
        }
        OUTLINED_FUNCTION_20_5(v129);
        v73 = &qword_25434B788;
      }
LABEL_78:
      v74 = __swift_instantiateConcreteTypeFromMangledName(v73);
      OUTLINED_FUNCTION_5_12(v74);
      goto LABEL_88;
    }
    OUTLINED_FUNCTION_149_2(v71, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall);
LABEL_77:
    v73 = &qword_256F91D98;
    goto LABEL_78;
  }
  if ((_DWORD)v71)
    goto LABEL_77;
  EnumTagSinglePayload = (void *)OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_22_15(v69))
  {
    v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_5_12(v72);
  }
  else
  {
    v77 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_26_9(v69))
    {
      v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_5_12(v78);
    }
    else
    {
      OUTLINED_FUNCTION_84_2(v68, v69, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 32));
      OUTLINED_FUNCTION_16_23();
    }
    OUTLINED_FUNCTION_3_25();
  }
  OUTLINED_FUNCTION_4_6();
LABEL_88:
  v81 = v2[11];
  v82 = (_QWORD *)(v0 + v81);
  v83 = *(_QWORD *)(v1 + v81);
  if ((~*(_QWORD *)(v0 + v81) & 0xF000000000000007) != 0)
  {
    if ((~v83 & 0xF000000000000007) != 0)
    {
      *v82 = v83;
      swift_release();
    }
    else
    {
      sub_23FEDEE9C(v0 + v81);
      *v82 = *(_QWORD *)(v1 + v81);
    }
  }
  else
  {
    *v82 = v83;
  }
  v84 = v2[12];
  v85 = v0 + v84;
  v86 = (uint64_t *)(v1 + v84);
  if (*(_QWORD *)(v0 + v84))
  {
    if (*v86)
    {
      OUTLINED_FUNCTION_356_1(*v86);
      OUTLINED_FUNCTION_175_4();
      OUTLINED_FUNCTION_280_2();
      *(_QWORD *)(v85 + 24) = v86[3];
      swift_bridgeObjectRelease();
      goto LABEL_98;
    }
    sub_23FF04738(v85);
  }
  OUTLINED_FUNCTION_357_1();
LABEL_98:
  v87 = v2[13];
  v88 = v2[14];
  v89 = (_QWORD *)(v0 + v87);
  v90 = (_QWORD *)(v1 + v87);
  *v89 = *v90;
  *(_QWORD *)((char *)v89 + 6) = *(_QWORD *)((char *)v90 + 6);
  v91 = v0 + v88;
  v92 = (uint64_t *)(v1 + v88);
  if (*(_QWORD *)(v0 + v88))
  {
    if (*v92)
    {
      OUTLINED_FUNCTION_356_1(*v92);
      OUTLINED_FUNCTION_175_4();
      OUTLINED_FUNCTION_280_2();
      goto LABEL_103;
    }
    sub_23FF0475C(v0 + v88);
  }
  *(_OWORD *)v91 = *(_OWORD *)v92;
  *(_QWORD *)(v91 + 16) = v92[2];
LABEL_103:
  v93 = v2[15];
  v94 = v0 + v93;
  v95 = v1 + v93;
  v96 = type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(0);
  v97 = __swift_getEnumTagSinglePayload(v94, 1, v96);
  v98 = OUTLINED_FUNCTION_9_2(v95);
  if (v97)
  {
    if (!v98)
    {
      OUTLINED_FUNCTION_231_2();
      *(_OWORD *)(v94 + 16) = *(_OWORD *)(v95 + 16);
      *(_QWORD *)(v94 + 29) = *(_QWORD *)(v95 + 29);
      v99 = *(int *)(v96 + 28);
      v100 = (void *)(v94 + v99);
      v101 = v95 + v99;
      OUTLINED_FUNCTION_25();
      if (OUTLINED_FUNCTION_8_0(v101))
      {
        v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
        OUTLINED_FUNCTION_20_16(v100, v103, *(_QWORD *)(*(_QWORD *)(v102 - 8) + 64));
      }
      else
      {
        v108 = OUTLINED_FUNCTION_1_2();
        if (OUTLINED_FUNCTION_2_22(v108))
        {
          v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
          OUTLINED_FUNCTION_20_16(v100, v110, *(_QWORD *)(*(_QWORD *)(v109 - 8) + 64));
        }
        else
        {
          OUTLINED_FUNCTION_12_20((uint64_t)v100, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*((_QWORD *)EnumTagSinglePayload - 1) + 32));
          OUTLINED_FUNCTION_14_3((uint64_t)v100);
        }
        OUTLINED_FUNCTION_3_16((uint64_t)v100);
      }
      v120 = OUTLINED_FUNCTION_80_1();
      goto LABEL_129;
    }
    goto LABEL_109;
  }
  if (!v98)
  {
    OUTLINED_FUNCTION_231_2();
    if (*(_QWORD *)(v94 + 24) != 1)
    {
      v107 = *(_QWORD *)(v95 + 24);
      if (v107 != 1)
      {
        *(_QWORD *)(v94 + 16) = *(_QWORD *)(v95 + 16);
        *(_QWORD *)(v94 + 24) = v107;
        swift_bridgeObjectRelease();
        *(_DWORD *)(v94 + 32) = *(_DWORD *)(v95 + 32);
        *(_BYTE *)(v94 + 36) = *(_BYTE *)(v95 + 36);
LABEL_118:
        v111 = *(int *)(v96 + 28);
        v112 = v94 + v111;
        v113 = v95 + v111;
        v114 = OUTLINED_FUNCTION_25();
        v115 = __swift_getEnumTagSinglePayload(v112, 1, v114);
        v116 = OUTLINED_FUNCTION_8_0(v113);
        if (v115)
        {
          if (!(_DWORD)v116)
          {
            v117 = OUTLINED_FUNCTION_1_2();
            if (OUTLINED_FUNCTION_19_0(v113))
            {
              v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
              OUTLINED_FUNCTION_70_6(v118);
            }
            else
            {
              OUTLINED_FUNCTION_17_5(v112, v113, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v117 - 8) + 32));
              OUTLINED_FUNCTION_10_1(v112);
            }
            goto LABEL_135;
          }
        }
        else
        {
          if (!(_DWORD)v116)
          {
            v124 = OUTLINED_FUNCTION_1_2();
            v125 = __swift_getEnumTagSinglePayload(v112, 1, v124);
            v126 = OUTLINED_FUNCTION_8_0(v113);
            if (v125)
            {
              if (!v126)
              {
                OUTLINED_FUNCTION_19_4(v112, v113, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v124 - 8) + 32));
LABEL_135:
                v120 = OUTLINED_FUNCTION_85_2();
LABEL_129:
                __swift_storeEnumTagSinglePayload(v120, v121, v122, v123);
                goto LABEL_130;
              }
            }
            else
            {
              v130 = *(_QWORD *)(v124 - 8);
              if (!v126)
              {
                OUTLINED_FUNCTION_19_4(v112, v113, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v130 + 40));
                goto LABEL_130;
              }
              OUTLINED_FUNCTION_107_2(v112, *(uint64_t (**)(uint64_t, uint64_t))(v130 + 8));
            }
            v119 = &qword_25434B788;
LABEL_125:
            __swift_instantiateConcreteTypeFromMangledName(v119);
            v104 = (void *)OUTLINED_FUNCTION_69_2();
            goto LABEL_110;
          }
          OUTLINED_FUNCTION_269_2(v116, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
        }
        v119 = &qword_256F90740;
        goto LABEL_125;
      }
      sub_23FEBABD4(v94 + 16);
    }
    *(_OWORD *)(v94 + 16) = *(_OWORD *)(v95 + 16);
    *(_QWORD *)(v94 + 29) = *(_QWORD *)(v95 + 29);
    goto LABEL_118;
  }
  sub_23FE251BC(v94, type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext);
LABEL_109:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F91DA0);
  v104 = (void *)OUTLINED_FUNCTION_220_1();
LABEL_110:
  memcpy(v104, v105, v106);
LABEL_130:
  OUTLINED_FUNCTION_6_7();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23FF05510(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  OUTLINED_FUNCTION_42_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
  OUTLINED_FUNCTION_49_0();
  if (v10)
  {
    v7 = v6;
    v8 = a3[5];
  }
  else
  {
    if ((_DWORD)v3 == 2147483646)
    {
      OUTLINED_FUNCTION_56_6(*(_QWORD *)(v4 + a3[6] + 24));
      OUTLINED_FUNCTION_9();
      return;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D88);
    OUTLINED_FUNCTION_49_0();
    if (v10)
    {
      v7 = v9;
      v8 = a3[7];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
      OUTLINED_FUNCTION_49_0();
      if (v10)
      {
        v7 = v11;
        v8 = a3[8];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D90);
        OUTLINED_FUNCTION_49_0();
        if (v12)
        {
          v7 = v13;
          v8 = a3[9];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D98);
          OUTLINED_FUNCTION_49_0();
          if (v14)
          {
            v7 = v15;
            v8 = a3[10];
          }
          else
          {
            v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91DA0);
            v8 = a3[15];
          }
        }
      }
    }
  }
  OUTLINED_FUNCTION_226_0(v4 + v8, v3, v7);
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23FF0561C()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  OUTLINED_FUNCTION_328_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
  OUTLINED_FUNCTION_48_3();
  if (v8)
  {
    v5 = v4;
    v6 = v2[5];
  }
  else
  {
    if (v3 == 2147483646)
    {
      *(_QWORD *)(v1 + v2[6] + 24) = v0;
      OUTLINED_FUNCTION_9();
      return;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D88);
    OUTLINED_FUNCTION_48_3();
    if (v8)
    {
      v5 = v7;
      v6 = v2[7];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F630);
      OUTLINED_FUNCTION_48_3();
      if (v8)
      {
        v5 = v9;
        v6 = v2[8];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D90);
        OUTLINED_FUNCTION_48_3();
        if (v10)
        {
          v5 = v11;
          v6 = v2[9];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256F91D98);
          OUTLINED_FUNCTION_48_3();
          if (v12)
          {
            v5 = v13;
            v6 = v2[10];
          }
          else
          {
            v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F91DA0);
            v6 = v2[15];
          }
        }
      }
    }
  }
  OUTLINED_FUNCTION_225_0(v1 + v6, v0, v0, v5);
}

void sub_23FF0571C(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  OUTLINED_FUNCTION_59_2(a1, (unint64_t *)&qword_25434BB08, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_60_2();
    OUTLINED_FUNCTION_59_2(v2, &qword_25434BB30, (void (*)(uint64_t))type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata);
    if (v4 <= 0x3F)
    {
      OUTLINED_FUNCTION_59_2(v3, &qword_25434BAD0, (void (*)(uint64_t))type metadata accessor for MonotonicTimestamp);
      if (v5 <= 0x3F)
      {
        OUTLINED_FUNCTION_60_2();
        OUTLINED_FUNCTION_59_2(v6, &qword_25434BA58, (void (*)(uint64_t))type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation);
        if (v7 <= 0x3F)
        {
          OUTLINED_FUNCTION_60_2();
          OUTLINED_FUNCTION_59_2(v8, &qword_25434BA50, (void (*)(uint64_t))type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall);
          if (v10 <= 0x3F)
          {
            OUTLINED_FUNCTION_59_2(v9, &qword_25434BA60, (void (*)(uint64_t))type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext);
            if (v11 <= 0x3F)
            {
              OUTLINED_FUNCTION_263_1();
              swift_initStructMetadata();
              OUTLINED_FUNCTION_17_0();
            }
          }
        }
      }
    }
  }
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDToolSubType()
{
  OUTLINED_FUNCTION_33();
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEntityContextType()
{
  OUTLINED_FUNCTION_33();
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponent()
{
  OUTLINED_FUNCTION_33();
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatcherType()
{
  OUTLINED_FUNCTION_33();
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDMatchingTransform()
{
  OUTLINED_FUNCTION_33();
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDDataProtectionClass()
{
  OUTLINED_FUNCTION_33();
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDToolSelectionCriteria()
{
  OUTLINED_FUNCTION_33();
}

void initializeBufferWithCopyOfBuffer for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_417();
  if ((v3 & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_46_7();
  }
  else
  {
    v4 = v2;
    OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_8_0(v1))
    {
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
      OUTLINED_FUNCTION_3_2(v5);
    }
    else
    {
      v6 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_19_0(v1))
      {
        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_3_2(v7);
      }
      else
      {
        OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16));
        OUTLINED_FUNCTION_10_1(v0);
      }
      OUTLINED_FUNCTION_3_16(v0);
    }
    v8 = *(int *)(v4 + 20);
    v9 = (void *)(v0 + v8);
    v10 = v1 + v8;
    v11 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_8_0(v10))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_28_12(v9, v13, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      OUTLINED_FUNCTION_55_5((uint64_t)v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16));
      OUTLINED_FUNCTION_3_16((uint64_t)v9);
    }
  }
  OUTLINED_FUNCTION_8_6();
}

void destroy for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);

  v4 = OUTLINED_FUNCTION_25();
  if (!OUTLINED_FUNCTION_121_2(v4))
  {
    v5 = OUTLINED_FUNCTION_1_2();
    if (!OUTLINED_FUNCTION_65_1(a1))
      OUTLINED_FUNCTION_17_17(*(_QWORD *)(v5 - 8));
  }
  v6 = a1 + *(int *)(a2 + 20);
  OUTLINED_FUNCTION_1_2();
  if (OUTLINED_FUNCTION_9_2(v6))
  {
    OUTLINED_FUNCTION_9();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_13_9();
    v8(v7);
  }
}

void initializeWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_8_0(a2))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_3_2(v6);
  }
  else
  {
    v7 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_19_0(a2))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_3_2(v8);
    }
    else
    {
      OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16));
      OUTLINED_FUNCTION_10_1(a1);
    }
    OUTLINED_FUNCTION_3_16(a1);
  }
  v9 = *(int *)(a3 + 20);
  v10 = (void *)(a1 + v9);
  v11 = a2 + v9;
  v12 = OUTLINED_FUNCTION_1_2();
  if (OUTLINED_FUNCTION_8_0(v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_28_12(v10, v14, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    OUTLINED_FUNCTION_55_5((uint64_t)v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16));
    OUTLINED_FUNCTION_3_16((uint64_t)v10);
  }
  OUTLINED_FUNCTION_8_6();
}

void assignWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8 = OUTLINED_FUNCTION_25();
  v9 = OUTLINED_FUNCTION_3_27(v8);
  if (!(_DWORD)v4)
  {
    if (!(_DWORD)v9)
    {
      v13 = OUTLINED_FUNCTION_1_2();
      v14 = OUTLINED_FUNCTION_3_27(v13);
      v21 = *(_QWORD *)(v3 - 8);
      if (!v14)
      {
        OUTLINED_FUNCTION_31_13(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 24));
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_65_8(v21);
      v11 = &qword_25434B788;
LABEL_8:
      v12 = __swift_instantiateConcreteTypeFromMangledName(v11);
      OUTLINED_FUNCTION_3_2(v12);
      goto LABEL_12;
    }
    OUTLINED_FUNCTION_238_3(v9, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_7:
    v11 = &qword_256F90740;
    goto LABEL_8;
  }
  if ((_DWORD)v9)
    goto LABEL_7;
  v4 = OUTLINED_FUNCTION_1_2();
  if (OUTLINED_FUNCTION_19_0(a2))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_3_2(v10);
  }
  else
  {
    OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
    OUTLINED_FUNCTION_10_1(a1);
  }
  OUTLINED_FUNCTION_3_16(a1);
LABEL_12:
  v15 = (void *)(a1 + *(int *)(a3 + 20));
  v16 = OUTLINED_FUNCTION_1_2();
  v17 = OUTLINED_FUNCTION_4_25((uint64_t)v15);
  if (!(_DWORD)v4)
  {
    v18 = *(_QWORD *)(v16 - 8);
    if (!v17)
    {
      OUTLINED_FUNCTION_55_5((uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 24));
      goto LABEL_18;
    }
    OUTLINED_FUNCTION_107_2((uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t))(v18 + 8));
    goto LABEL_17;
  }
  if (v17)
  {
LABEL_17:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_28_12(v15, v20, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_55_5((uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16));
  OUTLINED_FUNCTION_3_16((uint64_t)v15);
LABEL_18:
  OUTLINED_FUNCTION_8_6();
}

void initializeWithTake for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_8_0(a2))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_3_2(v6);
  }
  else
  {
    v7 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_19_0(a2))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_3_2(v8);
    }
    else
    {
      OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32));
      OUTLINED_FUNCTION_10_1(a1);
    }
    OUTLINED_FUNCTION_3_16(a1);
  }
  v9 = *(int *)(a3 + 20);
  v10 = (void *)(a1 + v9);
  v11 = a2 + v9;
  v12 = OUTLINED_FUNCTION_1_2();
  if (OUTLINED_FUNCTION_8_0(v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_28_12(v10, v14, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    OUTLINED_FUNCTION_55_5((uint64_t)v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32));
    OUTLINED_FUNCTION_3_16((uint64_t)v10);
  }
  OUTLINED_FUNCTION_8_6();
}

void assignWithTake for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8 = OUTLINED_FUNCTION_25();
  v9 = OUTLINED_FUNCTION_3_27(v8);
  if (!(_DWORD)v4)
  {
    if (!(_DWORD)v9)
    {
      v13 = OUTLINED_FUNCTION_1_2();
      v14 = OUTLINED_FUNCTION_3_27(v13);
      v21 = *(_QWORD *)(v3 - 8);
      if (!v14)
      {
        OUTLINED_FUNCTION_31_13(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40));
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_65_8(v21);
      v11 = &qword_25434B788;
LABEL_8:
      v12 = __swift_instantiateConcreteTypeFromMangledName(v11);
      OUTLINED_FUNCTION_3_2(v12);
      goto LABEL_12;
    }
    OUTLINED_FUNCTION_238_3(v9, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_7:
    v11 = &qword_256F90740;
    goto LABEL_8;
  }
  if ((_DWORD)v9)
    goto LABEL_7;
  v4 = OUTLINED_FUNCTION_1_2();
  if (OUTLINED_FUNCTION_19_0(a2))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_3_2(v10);
  }
  else
  {
    OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32));
    OUTLINED_FUNCTION_10_1(a1);
  }
  OUTLINED_FUNCTION_3_16(a1);
LABEL_12:
  v15 = (void *)(a1 + *(int *)(a3 + 20));
  v16 = OUTLINED_FUNCTION_1_2();
  v17 = OUTLINED_FUNCTION_4_25((uint64_t)v15);
  if (!(_DWORD)v4)
  {
    v18 = *(_QWORD *)(v16 - 8);
    if (!v17)
    {
      OUTLINED_FUNCTION_55_5((uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 40));
      goto LABEL_18;
    }
    OUTLINED_FUNCTION_107_2((uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t))(v18 + 8));
    goto LABEL_17;
  }
  if (v17)
  {
LABEL_17:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_28_12(v15, v20, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_55_5((uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32));
  OUTLINED_FUNCTION_3_16((uint64_t)v15);
LABEL_18:
  OUTLINED_FUNCTION_8_6();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23FF05F08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_42_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  OUTLINED_FUNCTION_49_0();
  if (v7)
  {
    v8 = v6;
    v9 = v4;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    v9 = v4 + *(int *)(a3 + 20);
  }
  return OUTLINED_FUNCTION_226_0(v9, v3, v8);
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDEventMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23FF05F70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_328_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  OUTLINED_FUNCTION_48_3();
  if (v4)
  {
    v5 = v3;
    v6 = v1;
  }
  else
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    v6 = v1 + *(int *)(v2 + 20);
  }
  return OUTLINED_FUNCTION_225_0(v6, v0, v0, v5);
}

void sub_23FF05FCC(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;

  OUTLINED_FUNCTION_59_2(a1, &qword_25434BA00, (void (*)(uint64_t))type metadata accessor for AIML.UUID);
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_60_2();
    OUTLINED_FUNCTION_59_2(v2, (unint64_t *)&qword_25434BAA0, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
    if (v3 <= 0x3F)
    {
      OUTLINED_FUNCTION_322_2();
      swift_initStructMetadata();
      OUTLINED_FUNCTION_17_0();
    }
  }
  OUTLINED_FUNCTION_144();
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDCollectionStarted()
{
  OUTLINED_FUNCTION_33();
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDCollectionCompleted()
{
  OUTLINED_FUNCTION_33();
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDCollectionFailed()
{
  OUTLINED_FUNCTION_33();
}

void initializeBufferWithCopyOfBuffer for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _OWORD *v4;
  int v5;
  _OWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  OUTLINED_FUNCTION_417();
  if ((v5 & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_46_7();
  }
  else
  {
    v6 = v4;
    v7 = (_QWORD *)OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_8_0(v1))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
      OUTLINED_FUNCTION_3_2(v8);
    }
    else
    {
      v2 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_19_0(v1))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_3_2(v9);
      }
      else
      {
        OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16));
        OUTLINED_FUNCTION_10_1(v0);
      }
      OUTLINED_FUNCTION_3_16(v0);
    }
    OUTLINED_FUNCTION_48_13();
    if (v7)
    {
      v2 = *(_QWORD *)(v2 + 8);
      *(_QWORD *)v3 = v7;
      *(_QWORD *)(v3 + 8) = v2;
      OUTLINED_FUNCTION_44_1();
      OUTLINED_FUNCTION_4_8();
    }
    else
    {
      *(_OWORD *)v3 = *(_OWORD *)v2;
    }
    v10 = OUTLINED_FUNCTION_366_1();
    if (v10)
    {
      OUTLINED_FUNCTION_213_4(v10);
      if (v1 == 1 || v1 == 2)
      {
        v11 = *(_OWORD *)(v3 + 16);
        *v6 = *(_OWORD *)v3;
        v6[1] = v11;
      }
      else
      {
        v7[1] = *(_QWORD *)(v2 + 8);
        v7[2] = v1;
        v12 = *(_QWORD *)(v2 + 32);
        v7[3] = *(_QWORD *)(v2 + 24);
        v7[4] = v12;
        OUTLINED_FUNCTION_20_1();
        OUTLINED_FUNCTION_19_7();
      }
      OUTLINED_FUNCTION_311_2();
    }
    else
    {
      OUTLINED_FUNCTION_235_4();
    }
  }
  OUTLINED_FUNCTION_8_6();
}

void destroy for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = OUTLINED_FUNCTION_25();
  if (!OUTLINED_FUNCTION_121_2(v4))
  {
    v5 = OUTLINED_FUNCTION_1_2();
    if (!OUTLINED_FUNCTION_65_1(a1))
      OUTLINED_FUNCTION_17_17(*(_QWORD *)(v5 - 8));
  }
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + *(int *)(a2 + 36)))
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_359_1();
  }
  v6 = (_QWORD *)(a1 + *(int *)(a2 + 40));
  if (*v6)
  {
    swift_bridgeObjectRelease();
    if ((unint64_t)(v6[2] - 1) >= 2)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    OUTLINED_FUNCTION_227_0();
  }
  else
  {
    OUTLINED_FUNCTION_9();
  }
}

void initializeWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v8 = (_QWORD *)OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_8_0(a2))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_3_2(v9);
  }
  else
  {
    v3 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_19_0(a2))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_3_2(v10);
    }
    else
    {
      OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
      OUTLINED_FUNCTION_10_1(a1);
    }
    OUTLINED_FUNCTION_3_16(a1);
  }
  OUTLINED_FUNCTION_48_13();
  if (v8)
  {
    v3 = *(_QWORD *)(v3 + 8);
    *(_QWORD *)v4 = v8;
    *(_QWORD *)(v4 + 8) = v3;
    OUTLINED_FUNCTION_44_1();
    OUTLINED_FUNCTION_4_8();
  }
  else
  {
    *(_OWORD *)v4 = *(_OWORD *)v3;
  }
  v11 = OUTLINED_FUNCTION_366_1();
  if (v11)
  {
    OUTLINED_FUNCTION_213_4(v11);
    if (a2 == 1 || a2 == 2)
    {
      v12 = *(_OWORD *)(v4 + 16);
      *a3 = *(_OWORD *)v4;
      a3[1] = v12;
    }
    else
    {
      v8[1] = *(_QWORD *)(v3 + 8);
      v8[2] = a2;
      v13 = *(_QWORD *)(v3 + 32);
      v8[3] = *(_QWORD *)(v3 + 24);
      v8[4] = v13;
      OUTLINED_FUNCTION_20_1();
      OUTLINED_FUNCTION_19_7();
    }
    OUTLINED_FUNCTION_311_2();
  }
  else
  {
    OUTLINED_FUNCTION_235_4();
  }
  OUTLINED_FUNCTION_8_6();
}

void assignWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 *v31;
  uint64_t v32;
  _OWORD *v33;
  _OWORD *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;

  v9 = OUTLINED_FUNCTION_25();
  v10 = OUTLINED_FUNCTION_3_27(v9);
  if (!(_DWORD)v4)
  {
    if (!(_DWORD)v10)
    {
      v14 = OUTLINED_FUNCTION_1_2();
      v15 = OUTLINED_FUNCTION_3_27(v14);
      v46 = *(_QWORD *)(v3 - 8);
      if (!v15)
      {
        OUTLINED_FUNCTION_31_13(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v46 + 24));
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_65_8(v46);
      v12 = &qword_25434B788;
LABEL_8:
      v13 = __swift_instantiateConcreteTypeFromMangledName(v12);
      OUTLINED_FUNCTION_3_2(v13);
      goto LABEL_12;
    }
    OUTLINED_FUNCTION_238_3(v10, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_7:
    v12 = &qword_256F90740;
    goto LABEL_8;
  }
  if ((_DWORD)v10)
    goto LABEL_7;
  v4 = OUTLINED_FUNCTION_1_2();
  if (OUTLINED_FUNCTION_19_0(a2))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_3_2(v11);
  }
  else
  {
    OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
    OUTLINED_FUNCTION_10_1(a1);
  }
  OUTLINED_FUNCTION_3_16(a1);
LABEL_12:
  v16 = a3[5];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  *v17 = *v18;
  v19 = (uint64_t *)v17[1];
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_131_6(a3[6]);
  v20 = a3[7];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = *(_BYTE *)(v22 + 4);
  *(_DWORD *)v21 = *(_DWORD *)v22;
  *(_BYTE *)(v21 + 4) = v23;
  v24 = a3[8];
  v25 = a1 + v24;
  v26 = a2 + v24;
  v27 = *(_WORD *)(v26 + 8);
  *(_QWORD *)v25 = *(_QWORD *)v26;
  *(_WORD *)(v25 + 8) = v27;
  v28 = OUTLINED_FUNCTION_297_3(a3[9]);
  if (v4)
  {
    if (v28)
    {
      OUTLINED_FUNCTION_354_1(v28);
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_234_2(*(_QWORD *)(v5 + 8));
      OUTLINED_FUNCTION_16_1();
      goto LABEL_19;
    }
    sub_23FEE19E0((uint64_t)v19);
  }
  else if (v28)
  {
    *v19 = v28;
    v19[1] = *(_QWORD *)(v5 + 8);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_4_8();
    goto LABEL_19;
  }
  *(_OWORD *)v19 = *(_OWORD *)v5;
LABEL_19:
  v29 = a3[10];
  v30 = a1 + v29;
  v31 = (__int128 *)(a2 + v29);
  v32 = *(_QWORD *)(a2 + v29);
  if (*(_QWORD *)(a1 + v29))
  {
    if (v32)
    {
      *(_QWORD *)v30 = v32;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_18_2();
      v33 = (_OWORD *)(v30 + 8);
      v34 = (__int128 *)((char *)v31 + 8);
      v35 = *(_QWORD *)(v30 + 16);
      v36 = *((_QWORD *)v31 + 2);
      if (v35 == 2)
      {
        if (v36 == 1 || v36 == 2)
          goto LABEL_24;
        goto LABEL_35;
      }
      if (v36 == 2)
      {
        sub_23FF066A0(v30 + 8);
      }
      else
      {
        if (v35 == 1)
        {
          if (v36 == 1)
          {
LABEL_24:
            v37 = *(__int128 *)((char *)v31 + 24);
            *v33 = *v34;
            *(_OWORD *)(v30 + 24) = v37;
LABEL_43:
            *(_QWORD *)(v30 + 40) = *((_QWORD *)v31 + 5);
            *(_QWORD *)(v30 + 48) = *((_QWORD *)v31 + 6);
            swift_bridgeObjectRetain();
            OUTLINED_FUNCTION_18_2();
            goto LABEL_44;
          }
LABEL_35:
          OUTLINED_FUNCTION_144_4();
          OUTLINED_FUNCTION_20_1();
          goto LABEL_43;
        }
        if (v36 != 1)
        {
          *(_QWORD *)(v30 + 8) = *((_QWORD *)v31 + 1);
          *(_QWORD *)(v30 + 16) = *((_QWORD *)v31 + 2);
          swift_bridgeObjectRetain();
          OUTLINED_FUNCTION_23_3();
          *(_QWORD *)(v30 + 24) = *((_QWORD *)v31 + 3);
          *(_QWORD *)(v30 + 32) = *((_QWORD *)v31 + 4);
          swift_bridgeObjectRetain();
          OUTLINED_FUNCTION_18_2();
          goto LABEL_43;
        }
        sub_23FF0667C(v30 + 8);
      }
      v47 = *(__int128 *)((char *)v31 + 24);
      *v33 = *v34;
      *(_OWORD *)(v30 + 24) = v47;
      goto LABEL_43;
    }
    sub_23FF066C4(a1 + v29);
    v41 = v31[1];
    v40 = v31[2];
    v42 = *v31;
    *(_QWORD *)(v30 + 48) = *((_QWORD *)v31 + 6);
    *(_OWORD *)(v30 + 16) = v41;
    *(_OWORD *)(v30 + 32) = v40;
    *(_OWORD *)v30 = v42;
  }
  else if (v32)
  {
    *(_QWORD *)v30 = v32;
    v38 = *((_QWORD *)v31 + 2);
    swift_bridgeObjectRetain();
    if (v38 == 1 || v38 == 2)
    {
      v39 = *(__int128 *)((char *)v31 + 24);
      *(_OWORD *)(v30 + 8) = *(__int128 *)((char *)v31 + 8);
      *(_OWORD *)(v30 + 24) = v39;
    }
    else
    {
      OUTLINED_FUNCTION_144_4();
      OUTLINED_FUNCTION_20_1();
    }
    *(_QWORD *)(v30 + 40) = *((_QWORD *)v31 + 5);
    *(_QWORD *)(v30 + 48) = *((_QWORD *)v31 + 6);
    swift_bridgeObjectRetain();
  }
  else
  {
    v43 = *v31;
    v44 = v31[1];
    v45 = v31[2];
    *(_QWORD *)(v30 + 48) = *((_QWORD *)v31 + 6);
    *(_OWORD *)(v30 + 16) = v44;
    *(_OWORD *)(v30 + 32) = v45;
    *(_OWORD *)v30 = v43;
  }
LABEL_44:
  OUTLINED_FUNCTION_8_6();
}

uint64_t sub_23FF0667C(uint64_t a1)
{
  destroy for SiriPostSiriEngagement.Signal.Content();
  return a1;
}

uint64_t sub_23FF066A0(uint64_t a1)
{
  destroy for IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition(a1);
  return a1;
}

uint64_t sub_23FF066C4(uint64_t a1)
{
  destroy for IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition(a1);
  return a1;
}

__n128 initializeWithTake for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(uint64_t a1, uint64_t a2, int *a3)
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
  __int128 *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __n128 result;

  OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_8_0(a2))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_3_2(v6);
  }
  else
  {
    v7 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_19_0(a2))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_3_2(v8);
    }
    else
    {
      OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32));
      OUTLINED_FUNCTION_10_1(a1);
    }
    OUTLINED_FUNCTION_3_16(a1);
  }
  OUTLINED_FUNCTION_302_1(a3[5]);
  *(_WORD *)(v10 + 8) = *(_WORD *)(v9 + 8);
  *(_QWORD *)v10 = *(_QWORD *)v9;
  v11 = a3[7];
  v12 = a3[8];
  v13 = a1 + v11;
  v14 = a2 + v11;
  *(_BYTE *)(v13 + 4) = *(_BYTE *)(v14 + 4);
  *(_DWORD *)v13 = *(_DWORD *)v14;
  v15 = a1 + v12;
  v16 = a2 + v12;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *(_WORD *)(v15 + 8) = *(_WORD *)(v16 + 8);
  OUTLINED_FUNCTION_302_1(a3[9]);
  v18 = *v17;
  v19 = v17[1];
  v20 = v17[2];
  *(_QWORD *)(v21 + 48) = *((_QWORD *)v17 + 6);
  *(_OWORD *)(v21 + 16) = v19;
  *(_OWORD *)(v21 + 32) = v20;
  *(_OWORD *)v21 = v18;
  OUTLINED_FUNCTION_8_6();
  return result;
}

void assignWithTake for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v8 = OUTLINED_FUNCTION_25();
  v9 = OUTLINED_FUNCTION_3_27(v8);
  if (!v4)
  {
    if (!(_DWORD)v9)
    {
      v14 = OUTLINED_FUNCTION_1_2();
      v15 = OUTLINED_FUNCTION_3_27(v14);
      v33 = *(_QWORD *)(v3 - 8);
      if (!v15)
      {
        OUTLINED_FUNCTION_31_13(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 40));
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_65_8(v33);
      v12 = &qword_25434B788;
LABEL_8:
      v13 = __swift_instantiateConcreteTypeFromMangledName(v12);
      OUTLINED_FUNCTION_3_2(v13);
      goto LABEL_12;
    }
    OUTLINED_FUNCTION_238_3(v9, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_7:
    v12 = &qword_256F90740;
    goto LABEL_8;
  }
  if ((_DWORD)v9)
    goto LABEL_7;
  v10 = OUTLINED_FUNCTION_1_2();
  if (OUTLINED_FUNCTION_19_0(a2))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_3_2(v11);
  }
  else
  {
    OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32));
    OUTLINED_FUNCTION_10_1(a1);
  }
  OUTLINED_FUNCTION_3_16(a1);
LABEL_12:
  v16 = a3[5];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_182_2(a3[6]);
  *(_DWORD *)v22 = *(_DWORD *)v21;
  *(_BYTE *)(v22 + 4) = *(_BYTE *)(v21 + 4);
  OUTLINED_FUNCTION_237_5(a3[8]);
  v24 = (_OWORD *)(a1 + v23);
  v25 = (uint64_t *)(a2 + v23);
  if (*(_QWORD *)(a1 + v23))
  {
    if (*v25)
    {
      OUTLINED_FUNCTION_356_1(*v25);
      OUTLINED_FUNCTION_175_4();
      goto LABEL_17;
    }
    sub_23FEE19E0(a1 + v23);
  }
  *v24 = *(_OWORD *)v25;
LABEL_17:
  v26 = a3[10];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (_QWORD *)(a2 + v26);
  if (*(_QWORD *)(a1 + v26))
  {
    if (*v28)
    {
      *v27 = *v28;
      swift_bridgeObjectRelease();
      v29 = v27[2];
      if (v29 != 2)
      {
        v30 = v28[2];
        if (v30 == 2)
        {
          sub_23FF066A0((uint64_t)(v27 + 1));
        }
        else if (v29 != 1)
        {
          if (v30 != 1)
          {
            v27[1] = v28[1];
            v27[2] = v30;
            swift_bridgeObjectRelease();
            v34 = v28[4];
            v27[3] = v28[3];
            v27[4] = v34;
            swift_bridgeObjectRelease();
            goto LABEL_28;
          }
          sub_23FF0667C((uint64_t)(v27 + 1));
        }
      }
      v31 = *(_OWORD *)(v28 + 3);
      *(_OWORD *)(v27 + 1) = *(_OWORD *)(v28 + 1);
      *(_OWORD *)(v27 + 3) = v31;
LABEL_28:
      v32 = v28[6];
      v27[5] = v28[5];
      v27[6] = v32;
      swift_bridgeObjectRelease();
      goto LABEL_29;
    }
    sub_23FF066C4((uint64_t)v27);
  }
  OUTLINED_FUNCTION_99_0();
  *((_OWORD *)v27 + 2) = *((_OWORD *)v28 + 2);
  v27[6] = v28[6];
LABEL_29:
  OUTLINED_FUNCTION_8_6();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23FF06A10()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_54_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  OUTLINED_FUNCTION_266_2();
  if (v2)
  {
    v3 = OUTLINED_FUNCTION_267_4();
    OUTLINED_FUNCTION_226_0(v3, v4, v5);
  }
  else
  {
    OUTLINED_FUNCTION_56_6(*(_QWORD *)(v0 + *(int *)(v1 + 20) + 8));
    OUTLINED_FUNCTION_9();
  }
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23FF06A68()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_328_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  OUTLINED_FUNCTION_48_3();
  if (v3)
  {
    v4 = OUTLINED_FUNCTION_146_2();
    OUTLINED_FUNCTION_225_0(v4, v5, v6, v7);
  }
  else
  {
    *(_QWORD *)(v1 + *(int *)(v2 + 20) + 8) = v0;
    OUTLINED_FUNCTION_9();
  }
}

void sub_23FF06AB4(uint64_t a1)
{
  unint64_t v1;

  OUTLINED_FUNCTION_59_2(a1, &qword_25434BA00, (void (*)(uint64_t))type metadata accessor for AIML.UUID);
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_263_1();
    OUTLINED_FUNCTION_86_3();
    swift_initStructMetadata();
    OUTLINED_FUNCTION_17_0();
  }
}

uint64_t destroy for IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition(uint64_t a1)
{
  OUTLINED_FUNCTION_180_3();
  if ((unint64_t)(*(_QWORD *)(a1 + 16) - 1) >= 2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return OUTLINED_FUNCTION_27_3();
}

void initializeWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = *a2;
  v4 = a2[2];
  swift_bridgeObjectRetain();
  if (v4 == 1 || v4 == 2)
  {
    OUTLINED_FUNCTION_357_1();
  }
  else
  {
    a1[1] = a2[1];
    a1[2] = v4;
    v5 = a2[4];
    a1[3] = a2[3];
    a1[4] = v5;
    OUTLINED_FUNCTION_19_7();
    OUTLINED_FUNCTION_44_1();
  }
  v6 = a2[6];
  a1[5] = a2[5];
  a1[6] = v6;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_8_6();
}

void assignWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition(_QWORD *a1, _QWORD *a2)
{
  _OWORD *v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_16_10();
  v4 = a1 + 1;
  v5 = a2 + 1;
  v6 = a1[2];
  v7 = a2[2];
  if (v6 == 2)
  {
    if (v7 == 1 || v7 == 2)
      goto LABEL_4;
LABEL_9:
    OUTLINED_FUNCTION_300_1();
    a1[3] = a2[3];
    a1[4] = a2[4];
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_19_7();
    goto LABEL_13;
  }
  if (v7 == 2)
  {
    sub_23FF066A0((uint64_t)(a1 + 1));
LABEL_12:
    v9 = *(_OWORD *)(a2 + 3);
    *v4 = *v5;
    *(_OWORD *)(a1 + 3) = v9;
    goto LABEL_13;
  }
  if (v6 != 1)
  {
    if (v7 != 1)
    {
      OUTLINED_FUNCTION_300_1();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_23_3();
      a1[3] = a2[3];
      a1[4] = a2[4];
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_16_10();
      goto LABEL_13;
    }
    OUTLINED_FUNCTION_199_5();
    goto LABEL_12;
  }
  if (v7 != 1)
    goto LABEL_9;
LABEL_4:
  v8 = *(_OWORD *)(a2 + 3);
  *v4 = *v5;
  *(_OWORD *)(a1 + 3) = v8;
LABEL_13:
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_8_6();
}

void assignWithTake for IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v4 = a1[2];
  if (v4 != 2)
  {
    v5 = a2[2];
    if (v5 == 2)
    {
      sub_23FF066A0((uint64_t)(a1 + 1));
    }
    else if (v4 != 1)
    {
      if (v5 != 1)
      {
        a1[1] = a2[1];
        a1[2] = v5;
        swift_bridgeObjectRelease();
        v7 = a2[4];
        a1[3] = a2[3];
        a1[4] = v7;
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
      OUTLINED_FUNCTION_199_5();
    }
  }
  OUTLINED_FUNCTION_99_0();
LABEL_8:
  v6 = a2[6];
  a1[5] = a2[5];
  a1[6] = v6;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return OUTLINED_FUNCTION_41_3(-1);
  if (a2 < 0 && *((_BYTE *)a1 + 56))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    v2 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v2) = -1;
  }
  return OUTLINED_FUNCTION_41_3(v2);
}

_QWORD *storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition(_QWORD *result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 5) = 0u;
    *(_OWORD *)(result + 3) = 0u;
    *(_OWORD *)(result + 1) = 0u;
    *result = a2 ^ 0x80000000;
    if (a3 < 0)
      *((_BYTE *)result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
      return OUTLINED_FUNCTION_11_14(result, (a2 - 1));
    }
    *((_BYTE *)result + 56) = 0;
    if (a2)
      return OUTLINED_FUNCTION_11_14(result, (a2 - 1));
  }
  return result;
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition()
{
  OUTLINED_FUNCTION_33();
}

uint64_t destroy for IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition()
{
  uint64_t v0;

  OUTLINED_FUNCTION_261_0();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 40) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return OUTLINED_FUNCTION_27_3();
}

void initializeWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_207_0();
  v3 = v2[1];
  *(_QWORD *)v0 = *v2;
  *(_QWORD *)(v0 + 8) = v3;
  v4 = v2[3];
  *(_QWORD *)(v0 + 16) = v2[2];
  *(_QWORD *)(v0 + 24) = v4;
  v5 = v2[5];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_44_1();
  if (v5 == 1)
  {
    OUTLINED_FUNCTION_67_1((_OWORD *)(v0 + 32));
  }
  else
  {
    *(_QWORD *)(v0 + 32) = v1[4];
    *(_QWORD *)(v0 + 40) = v5;
    v6 = v1[7];
    *(_QWORD *)(v0 + 48) = v1[6];
    *(_QWORD *)(v0 + 56) = v6;
    OUTLINED_FUNCTION_19_7();
    OUTLINED_FUNCTION_44_1();
  }
  v7 = v1[9];
  *(_QWORD *)(v0 + 64) = v1[8];
  *(_QWORD *)(v0 + 72) = v7;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_9();
}

void assignWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _OWORD *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_16_10();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_16_10();
  v4 = (_OWORD *)(a1 + 32);
  v5 = (_OWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  if (*(_QWORD *)(a1 + 40) == 1)
  {
    if (v6 == 1)
    {
      v7 = *(_OWORD *)(a2 + 48);
      *v4 = *v5;
      *(_OWORD *)(a1 + 48) = v7;
    }
    else
    {
      OUTLINED_FUNCTION_364_0();
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_19_7();
    }
  }
  else if (v6 == 1)
  {
    OUTLINED_FUNCTION_199_5();
    v8 = *(_OWORD *)(a2 + 48);
    *v4 = *v5;
    *(_OWORD *)(a1 + 48) = v8;
  }
  else
  {
    OUTLINED_FUNCTION_364_0();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_23_3();
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_16_10();
  }
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_8_6();
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

void assignWithTake for IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_207_0();
  v3 = v2[1];
  *v0 = *v2;
  v0[1] = v3;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_184_0();
  if (v0[5] != 1)
  {
    v4 = v1[5];
    if (v4 != 1)
    {
      v0[4] = v1[4];
      v0[5] = v4;
      swift_bridgeObjectRelease();
      v5 = v1[7];
      v0[6] = v1[6];
      v0[7] = v5;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    OUTLINED_FUNCTION_199_5();
  }
  OUTLINED_FUNCTION_99_0();
LABEL_6:
  v6 = v1[9];
  v0[8] = v1[8];
  v0[9] = v6;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition(uint64_t a1, unsigned int a2)
{
  int v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 80))
      return OUTLINED_FUNCTION_41_3(*(_DWORD *)a1 + 2147483646);
    OUTLINED_FUNCTION_134_6();
  }
  else
  {
    v3 = -1;
  }
  return OUTLINED_FUNCTION_41_3(v3);
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 0;
    if (a2)
      return OUTLINED_FUNCTION_148_1(result, a2);
  }
  return result;
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition()
{
  OUTLINED_FUNCTION_33();
}

void destroy for IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 8) == 1)
  {
    OUTLINED_FUNCTION_13();
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_27_3();
  }
}

void initializeWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition(_OWORD *a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 1)
  {
    v4 = *(_OWORD *)(a2 + 16);
    *a1 = *(_OWORD *)a2;
    a1[1] = v4;
  }
  else
  {
    OUTLINED_FUNCTION_291_2(v3, a2, *(_QWORD *)a2);
    OUTLINED_FUNCTION_20_1();
  }
  OUTLINED_FUNCTION_13();
}

void assignWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  OUTLINED_FUNCTION_207_0();
  v4 = *(_QWORD *)(v3 + 8);
  if (*(_QWORD *)(v2 + 8) == 1)
  {
    if (v4 == 1)
    {
      v5 = *(_OWORD *)(v1 + 16);
      *(_OWORD *)v0 = *(_OWORD *)v1;
      *(_OWORD *)(v0 + 16) = v5;
    }
    else
    {
      OUTLINED_FUNCTION_328_2();
      *(_QWORD *)(v0 + 16) = *(_QWORD *)(v1 + 16);
      *(_QWORD *)(v0 + 24) = *(_QWORD *)(v1 + 24);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_20_1();
    }
  }
  else if (v4 == 1)
  {
    sub_23FF0667C(v0);
    v6 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)v0 = *(_OWORD *)v1;
    *(_OWORD *)(v0 + 16) = v6;
  }
  else
  {
    OUTLINED_FUNCTION_328_2();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_16_10();
    *(_QWORD *)(v0 + 16) = *(_QWORD *)(v1 + 16);
    *(_QWORD *)(v0 + 24) = *(_QWORD *)(v1 + 24);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_18_2();
  }
  OUTLINED_FUNCTION_9();
}

void assignWithTake for IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  OUTLINED_FUNCTION_207_0();
  if (*(_QWORD *)(v2 + 8) != 1)
  {
    v3 = *(_QWORD *)(v1 + 8);
    if (v3 != 1)
    {
      *(_QWORD *)v0 = *(_QWORD *)v1;
      *(_QWORD *)(v0 + 8) = v3;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_184_0();
      goto LABEL_6;
    }
    sub_23FF0667C(v0);
  }
  v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)v0 = *(_OWORD *)v1;
  *(_OWORD *)(v0 + 16) = v4;
LABEL_6:
  OUTLINED_FUNCTION_13();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition(uint64_t a1, unsigned int a2)
{
  int v3;
  BOOL v4;
  int v5;

  if (a2)
  {
    if (a2 > 0x7FFFFFFD && *(_BYTE *)(a1 + 32))
      return OUTLINED_FUNCTION_41_3(*(_DWORD *)a1 + 2147483645);
    OUTLINED_FUNCTION_134_6();
    v4 = __OFSUB__(v3, 1);
    v5 = v3 - 1;
    if (v5 < 0 != v4)
      return OUTLINED_FUNCTION_41_3(-1);
  }
  else
  {
    v5 = -1;
  }
  return OUTLINED_FUNCTION_41_3(v5);
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 2147483646;
    *(_QWORD *)(result + 8) = 0;
    if (a3 > 0x7FFFFFFD)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 > 0x7FFFFFFD)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDToolOutputDefinition()
{
  OUTLINED_FUNCTION_33();
}

void sub_23FF07358(uint64_t *a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_284_3(a1, a2);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13();
}

void assignWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDToolSource(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_122_8(a1, a2);
  OUTLINED_FUNCTION_16_10();
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(v2 + 8);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_9();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDToolSource(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return OUTLINED_FUNCTION_41_3(-1);
  if (a2 < 0 && *((_BYTE *)a1 + 16))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    v2 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v2) = -1;
  }
  return OUTLINED_FUNCTION_41_3(v2);
}

_QWORD *storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDToolSource(_QWORD *result, int a2, int a3)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
    if (a3 < 0)
      *((_BYTE *)result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
      return OUTLINED_FUNCTION_11_14(result, (a2 - 1));
    }
    *((_BYTE *)result + 16) = 0;
    if (a2)
      return OUTLINED_FUNCTION_11_14(result, (a2 - 1));
  }
  return result;
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDToolSource()
{
  OUTLINED_FUNCTION_33();
}

void initializeBufferWithCopyOfBuffer for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  char v8;

  OUTLINED_FUNCTION_417();
  if ((v2 & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_46_7();
  }
  else
  {
    OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_8_0(v1))
    {
      v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
      OUTLINED_FUNCTION_3_2(v3);
    }
    else
    {
      v4 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_19_0(v1))
      {
        v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_3_2(v5);
      }
      else
      {
        OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
        OUTLINED_FUNCTION_10_1(v0);
      }
      OUTLINED_FUNCTION_3_16(v0);
    }
    v6 = OUTLINED_FUNCTION_126_4();
    if (v8)
    {
      OUTLINED_FUNCTION_67_1(v7);
    }
    else
    {
      OUTLINED_FUNCTION_216_3(v6, v7);
      OUTLINED_FUNCTION_20_1();
    }
  }
  OUTLINED_FUNCTION_8_6();
}

void destroy for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = OUTLINED_FUNCTION_25();
  if (!OUTLINED_FUNCTION_121_2(v4))
  {
    v5 = OUTLINED_FUNCTION_1_2();
    if (!OUTLINED_FUNCTION_65_1(a1))
      OUTLINED_FUNCTION_17_17(*(_QWORD *)(v5 - 8));
  }
  if (*(_QWORD *)(a1 + *(int *)(a2 + 24) + 8) == 1)
  {
    OUTLINED_FUNCTION_9();
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_227_0();
  }
}

void initializeWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  char v9;

  OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_8_0(a2))
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_3_2(v4);
  }
  else
  {
    v5 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_19_0(a2))
    {
      v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_3_2(v6);
    }
    else
    {
      OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16));
      OUTLINED_FUNCTION_10_1(a1);
    }
    OUTLINED_FUNCTION_3_16(a1);
  }
  v7 = OUTLINED_FUNCTION_126_4();
  if (v9)
  {
    OUTLINED_FUNCTION_67_1(v8);
  }
  else
  {
    OUTLINED_FUNCTION_216_3(v7, v8);
    OUTLINED_FUNCTION_20_1();
  }
  OUTLINED_FUNCTION_8_6();
}

void assignWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  v8 = OUTLINED_FUNCTION_25();
  v9 = OUTLINED_FUNCTION_3_27(v8);
  if (!v4)
  {
    if (!(_DWORD)v9)
    {
      v14 = OUTLINED_FUNCTION_1_2();
      v15 = OUTLINED_FUNCTION_3_27(v14);
      v22 = *(_QWORD *)(v3 - 8);
      if (!v15)
      {
        OUTLINED_FUNCTION_31_13(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 24));
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_65_8(v22);
      v12 = &qword_25434B788;
LABEL_8:
      v13 = __swift_instantiateConcreteTypeFromMangledName(v12);
      OUTLINED_FUNCTION_3_2(v13);
      goto LABEL_12;
    }
    OUTLINED_FUNCTION_238_3(v9, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_7:
    v12 = &qword_256F90740;
    goto LABEL_8;
  }
  if ((_DWORD)v9)
    goto LABEL_7;
  v10 = OUTLINED_FUNCTION_1_2();
  if (OUTLINED_FUNCTION_19_0(a2))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_3_2(v11);
  }
  else
  {
    OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16));
    OUTLINED_FUNCTION_10_1(a1);
  }
  OUTLINED_FUNCTION_3_16(a1);
LABEL_12:
  OUTLINED_FUNCTION_131_6(*(int *)(a3 + 20));
  v16 = *(int *)(a3 + 24);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = *(_QWORD *)(a1 + v16 + 8);
  v20 = *(_QWORD *)(v18 + 8);
  if (v19 == 1)
  {
    if (v20 == 1)
    {
      OUTLINED_FUNCTION_99_0();
    }
    else
    {
      OUTLINED_FUNCTION_342_0();
      *(_QWORD *)(v17 + 16) = *(_QWORD *)(v18 + 16);
      *(_QWORD *)(v17 + 24) = *(_QWORD *)(v18 + 24);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_20_1();
    }
  }
  else if (v20 == 1)
  {
    OUTLINED_FUNCTION_199_5();
    v21 = *(_OWORD *)(v18 + 16);
    *(_OWORD *)v17 = *(_OWORD *)v18;
    *(_OWORD *)(v17 + 16) = v21;
  }
  else
  {
    OUTLINED_FUNCTION_342_0();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_18_2();
    *(_QWORD *)(v17 + 16) = *(_QWORD *)(v18 + 16);
    *(_QWORD *)(v17 + 24) = *(_QWORD *)(v18 + 24);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_18_2();
  }
  OUTLINED_FUNCTION_8_6();
}

void initializeWithTake for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;

  OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_8_0(a2))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_3_2(v6);
  }
  else
  {
    v7 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_19_0(a2))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_3_2(v8);
    }
    else
    {
      OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32));
      OUTLINED_FUNCTION_10_1(a1);
    }
    OUTLINED_FUNCTION_3_16(a1);
  }
  OUTLINED_FUNCTION_182_2(*(int *)(a3 + 20));
  OUTLINED_FUNCTION_67_1(v9);
  OUTLINED_FUNCTION_8_6();
}

void assignWithTake for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v8 = OUTLINED_FUNCTION_25();
  v9 = OUTLINED_FUNCTION_3_27(v8);
  if (!v4)
  {
    if (!(_DWORD)v9)
    {
      v14 = OUTLINED_FUNCTION_1_2();
      v15 = OUTLINED_FUNCTION_3_27(v14);
      v22 = *(_QWORD *)(v3 - 8);
      if (!v15)
      {
        OUTLINED_FUNCTION_31_13(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 40));
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_65_8(v22);
      v12 = &qword_25434B788;
LABEL_8:
      v13 = __swift_instantiateConcreteTypeFromMangledName(v12);
      OUTLINED_FUNCTION_3_2(v13);
      goto LABEL_12;
    }
    OUTLINED_FUNCTION_238_3(v9, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_7:
    v12 = &qword_256F90740;
    goto LABEL_8;
  }
  if ((_DWORD)v9)
    goto LABEL_7;
  v10 = OUTLINED_FUNCTION_1_2();
  if (OUTLINED_FUNCTION_19_0(a2))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_3_2(v11);
  }
  else
  {
    OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32));
    OUTLINED_FUNCTION_10_1(a1);
  }
  OUTLINED_FUNCTION_3_16(a1);
LABEL_12:
  OUTLINED_FUNCTION_237_5(*(int *)(a3 + 20));
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  if (*(_QWORD *)(a1 + v16 + 8) != 1)
  {
    v19 = v18[1];
    if (v19 != 1)
    {
      *v17 = *v18;
      v17[1] = v19;
      swift_bridgeObjectRelease();
      v21 = v18[3];
      v17[2] = v18[2];
      v17[3] = v21;
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    OUTLINED_FUNCTION_199_5();
  }
  v20 = *((_OWORD *)v18 + 1);
  *(_OWORD *)v17 = *(_OWORD *)v18;
  *((_OWORD *)v17 + 1) = v20;
LABEL_17:
  OUTLINED_FUNCTION_8_6();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23FF07970()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_54_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  OUTLINED_FUNCTION_266_2();
  if (v2)
  {
    v3 = OUTLINED_FUNCTION_267_4();
    OUTLINED_FUNCTION_226_0(v3, v4, v5);
  }
  else
  {
    OUTLINED_FUNCTION_264_3(*(_QWORD *)(v0 + *(int *)(v1 + 24) + 8));
    OUTLINED_FUNCTION_9();
  }
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23FF079C8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_328_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  OUTLINED_FUNCTION_48_3();
  if (v3)
  {
    v4 = OUTLINED_FUNCTION_146_2();
    OUTLINED_FUNCTION_225_0(v4, v5, v6, v7);
  }
  else
  {
    *(_QWORD *)(v1 + *(int *)(v2 + 24) + 8) = (v0 + 1);
    OUTLINED_FUNCTION_9();
  }
}

void sub_23FF07A14(uint64_t a1)
{
  unint64_t v1;

  OUTLINED_FUNCTION_59_2(a1, &qword_25434BA00, (void (*)(uint64_t))type metadata accessor for AIML.UUID);
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_86_3();
    swift_initStructMetadata();
    OUTLINED_FUNCTION_17_0();
  }
  OUTLINED_FUNCTION_13_8();
}

void initializeBufferWithCopyOfBuffer for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  char v8;

  OUTLINED_FUNCTION_417();
  if ((v2 & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_46_7();
  }
  else
  {
    OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_8_0(v1))
    {
      v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
      OUTLINED_FUNCTION_3_2(v3);
    }
    else
    {
      v4 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_19_0(v1))
      {
        v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_3_2(v5);
      }
      else
      {
        OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
        OUTLINED_FUNCTION_10_1(v0);
      }
      OUTLINED_FUNCTION_3_16(v0);
    }
    v6 = OUTLINED_FUNCTION_151_5();
    if (v8)
    {
      OUTLINED_FUNCTION_67_1(v7);
    }
    else
    {
      OUTLINED_FUNCTION_215_4(v6, v7);
      OUTLINED_FUNCTION_44_1();
    }
    OUTLINED_FUNCTION_130_4();
  }
  OUTLINED_FUNCTION_8_6();
}

uint64_t destroy for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = OUTLINED_FUNCTION_25();
  if (!OUTLINED_FUNCTION_121_2(v4))
  {
    v5 = OUTLINED_FUNCTION_1_2();
    if (!OUTLINED_FUNCTION_65_1(a1))
      OUTLINED_FUNCTION_17_17(*(_QWORD *)(v5 - 8));
  }
  if (*(_QWORD *)(a1 + *(int *)(a2 + 20) + 8) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return OUTLINED_FUNCTION_227_0();
}

void initializeWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  char v9;

  OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_8_0(a2))
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_3_2(v4);
  }
  else
  {
    v5 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_19_0(a2))
    {
      v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_3_2(v6);
    }
    else
    {
      OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16));
      OUTLINED_FUNCTION_10_1(a1);
    }
    OUTLINED_FUNCTION_3_16(a1);
  }
  v7 = OUTLINED_FUNCTION_151_5();
  if (v9)
  {
    OUTLINED_FUNCTION_67_1(v8);
  }
  else
  {
    OUTLINED_FUNCTION_215_4(v7, v8);
    OUTLINED_FUNCTION_44_1();
  }
  OUTLINED_FUNCTION_130_4();
  OUTLINED_FUNCTION_8_6();
}

void assignWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v8 = OUTLINED_FUNCTION_25();
  v9 = OUTLINED_FUNCTION_3_27(v8);
  if (!v4)
  {
    if (!(_DWORD)v9)
    {
      v14 = OUTLINED_FUNCTION_1_2();
      v15 = OUTLINED_FUNCTION_3_27(v14);
      v23 = *(_QWORD *)(v3 - 8);
      if (!v15)
      {
        OUTLINED_FUNCTION_31_13(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 24));
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_65_8(v23);
      v12 = &qword_25434B788;
LABEL_8:
      v13 = __swift_instantiateConcreteTypeFromMangledName(v12);
      OUTLINED_FUNCTION_3_2(v13);
      goto LABEL_12;
    }
    OUTLINED_FUNCTION_238_3(v9, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_7:
    v12 = &qword_256F90740;
    goto LABEL_8;
  }
  if ((_DWORD)v9)
    goto LABEL_7;
  v10 = OUTLINED_FUNCTION_1_2();
  if (OUTLINED_FUNCTION_19_0(a2))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_3_2(v11);
  }
  else
  {
    OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16));
    OUTLINED_FUNCTION_10_1(a1);
  }
  OUTLINED_FUNCTION_3_16(a1);
LABEL_12:
  v16 = a3[5];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = *(_QWORD *)(a1 + v16 + 8);
  v20 = *(_QWORD *)(a2 + v16 + 8);
  if (v19 == 1)
  {
    if (v20 == 1)
    {
      v21 = *(_OWORD *)(v18 + 16);
      *(_OWORD *)v17 = *(_OWORD *)v18;
      *(_OWORD *)(v17 + 16) = v21;
    }
    else
    {
      OUTLINED_FUNCTION_352_0();
      *(_QWORD *)(v17 + 16) = *(_QWORD *)(v18 + 16);
      *(_QWORD *)(v17 + 24) = *(_QWORD *)(v18 + 24);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_4_8();
    }
  }
  else if (v20 == 1)
  {
    sub_23FF0667C(v17);
    v22 = *(_OWORD *)(v18 + 16);
    *(_OWORD *)v17 = *(_OWORD *)v18;
    *(_OWORD *)(v17 + 16) = v22;
  }
  else
  {
    OUTLINED_FUNCTION_352_0();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_16_1();
    *(_QWORD *)(v17 + 16) = *(_QWORD *)(v18 + 16);
    OUTLINED_FUNCTION_351_0(*(_QWORD *)(v18 + 24));
    OUTLINED_FUNCTION_16_1();
  }
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_131_6(a3[7]);
  OUTLINED_FUNCTION_8_6();
}

void initializeWithTake for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  _OWORD *v13;

  OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_8_0(a2))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_3_2(v6);
  }
  else
  {
    v7 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_19_0(a2))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_3_2(v8);
    }
    else
    {
      OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32));
      OUTLINED_FUNCTION_10_1(a1);
    }
    OUTLINED_FUNCTION_3_16(a1);
  }
  v9 = *(int *)(a3 + 20);
  v10 = *(int *)(a3 + 24);
  v11 = *(_OWORD *)(a2 + v9);
  v12 = *(_OWORD *)(a2 + v9 + 16);
  v13 = (_OWORD *)(a1 + v9);
  *v13 = v11;
  v13[1] = v12;
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  OUTLINED_FUNCTION_189_5();
  OUTLINED_FUNCTION_8_6();
}

void assignWithTake for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8 = OUTLINED_FUNCTION_25();
  v9 = OUTLINED_FUNCTION_3_27(v8);
  if (!v4)
  {
    if (!(_DWORD)v9)
    {
      v14 = OUTLINED_FUNCTION_1_2();
      v15 = OUTLINED_FUNCTION_3_27(v14);
      v21 = *(_QWORD *)(v3 - 8);
      if (!v15)
      {
        OUTLINED_FUNCTION_31_13(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40));
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_65_8(v21);
      v12 = &qword_25434B788;
LABEL_8:
      v13 = __swift_instantiateConcreteTypeFromMangledName(v12);
      OUTLINED_FUNCTION_3_2(v13);
      goto LABEL_12;
    }
    OUTLINED_FUNCTION_238_3(v9, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_7:
    v12 = &qword_256F90740;
    goto LABEL_8;
  }
  if ((_DWORD)v9)
    goto LABEL_7;
  v10 = OUTLINED_FUNCTION_1_2();
  if (OUTLINED_FUNCTION_19_0(a2))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_3_2(v11);
  }
  else
  {
    OUTLINED_FUNCTION_74_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32));
    OUTLINED_FUNCTION_10_1(a1);
  }
  OUTLINED_FUNCTION_3_16(a1);
LABEL_12:
  v16 = *(int *)(a3 + 20);
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  if (*(_QWORD *)(a1 + v16 + 8) != 1)
  {
    v19 = v18[1];
    if (v19 != 1)
    {
      *v17 = *v18;
      v17[1] = v19;
      swift_bridgeObjectRelease();
      v20 = v18[3];
      v17[2] = v18[2];
      v17[3] = v20;
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    sub_23FF0667C((uint64_t)v17);
  }
  OUTLINED_FUNCTION_357_1();
LABEL_17:
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_189_5();
  OUTLINED_FUNCTION_8_6();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23FF08010()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_54_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  OUTLINED_FUNCTION_266_2();
  if (v0)
  {
    v1 = OUTLINED_FUNCTION_267_4();
    OUTLINED_FUNCTION_226_0(v1, v2, v3);
  }
  else
  {
    OUTLINED_FUNCTION_9();
  }
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23FF08070()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_328_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  OUTLINED_FUNCTION_48_3();
  if (v3)
  {
    v4 = OUTLINED_FUNCTION_146_2();
    OUTLINED_FUNCTION_225_0(v4, v5, v6, v7);
  }
  else
  {
    *(_QWORD *)(v1 + *(int *)(v2 + 24)) = (v0 - 1);
    OUTLINED_FUNCTION_9();
  }
}

void sub_23FF080B8(uint64_t a1)
{
  unint64_t v1;

  OUTLINED_FUNCTION_59_2(a1, &qword_25434BA00, (void (*)(uint64_t))type metadata accessor for AIML.UUID);
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_263_1();
    OUTLINED_FUNCTION_433();
    OUTLINED_FUNCTION_17_0();
  }
  OUTLINED_FUNCTION_13_8();
}

uint64_t destroy for IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch()
{
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_27_3();
}

void initializeWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_181_3(a1, a2);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(v3 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_WORD *)(a1 + 32) = *(_WORD *)(v3 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(v3 + 40);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(v3 + 36);
  v5 = *(_QWORD *)(v3 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(v3 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13();
}

void assignWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch(uint64_t a1, int *a2)
{
  int v4;
  int v5;
  uint64_t v6;

  v4 = *a2;
  *(_BYTE *)(a1 + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)a1 = v4;
  v5 = a2[2];
  *(_BYTE *)(a1 + 12) = *((_BYTE *)a2 + 12);
  *(_DWORD *)(a1 + 8) = v5;
  OUTLINED_FUNCTION_341_0(*((_QWORD *)a2 + 2));
  OUTLINED_FUNCTION_16_10();
  v6 = *((_QWORD *)a2 + 3);
  *(_WORD *)(a1 + 32) = *((_WORD *)a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  LODWORD(v6) = a2[9];
  *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
  *(_DWORD *)(a1 + 36) = v6;
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  *(_QWORD *)(a1 + 56) = *((_QWORD *)a2 + 7);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_9();
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

void assignWithTake for IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_181_3(a1, a2);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(v4 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return OUTLINED_FUNCTION_41_3(-1);
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2 >= 0xFFFFFFFF)
      LODWORD(v2) = -1;
  }
  return OUTLINED_FUNCTION_41_3(v2);
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch()
{
  OUTLINED_FUNCTION_33();
}

void initializeWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDEntityType(uint64_t a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_291_2(a2[1], (uint64_t)a2, *a2);
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13();
}

void assignWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDEntityType(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_95_1(a1, a2);
  OUTLINED_FUNCTION_16_10();
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v2 + 16);
  OUTLINED_FUNCTION_277_2();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_9();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDEntityType(uint64_t a1, unsigned int a2)
{
  int v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
      return OUTLINED_FUNCTION_41_3(*(_DWORD *)a1 + 2147483646);
    OUTLINED_FUNCTION_134_6();
  }
  else
  {
    v3 = -1;
  }
  return OUTLINED_FUNCTION_41_3(v3);
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEntityType()
{
  OUTLINED_FUNCTION_33();
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDCollectionContext()
{
  OUTLINED_FUNCTION_33();
}

uint64_t destroy for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected()
{
  OUTLINED_FUNCTION_180_3();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_27_3();
}

void initializeWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_284_3(a1, a2);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v3 + 16);
  *(_QWORD *)(v2 + 24) = v4;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_19_7();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_9();
}

void assignWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  OUTLINED_FUNCTION_122_8(a1, a2);
  OUTLINED_FUNCTION_16_10();
  OUTLINED_FUNCTION_176_3(*(_QWORD *)(v2 + 8));
  OUTLINED_FUNCTION_16_10();
  OUTLINED_FUNCTION_341_0(*(_QWORD *)(v2 + 16));
  OUTLINED_FUNCTION_16_10();
  OUTLINED_FUNCTION_277_2();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_9();
}

void assignWithTake for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_119_6();
  OUTLINED_FUNCTION_170_2();
  swift_bridgeObjectRelease();
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 16);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return OUTLINED_FUNCTION_41_3(-1);
  if (a2 < 0 && *((_BYTE *)a1 + 32))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    v2 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v2) = -1;
  }
  return OUTLINED_FUNCTION_41_3(v2);
}

_QWORD *storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected(_QWORD *result, int a2, int a3)
{
  if (a2 < 0)
  {
    result[2] = 0;
    result[3] = 0;
    *result = a2 ^ 0x80000000;
    result[1] = 0;
    if (a3 < 0)
      *((_BYTE *)result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
      return OUTLINED_FUNCTION_11_14(result, (a2 - 1));
    }
    *((_BYTE *)result + 32) = 0;
    if (a2)
      return OUTLINED_FUNCTION_11_14(result, (a2 - 1));
  }
  return result;
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesCollected()
{
  OUTLINED_FUNCTION_33();
}

_QWORD *__swift_memcpy14_4(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_QWORD *)((char *)result + 6) = *(uint64_t *)((char *)a2 + 6);
  *result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 14))
      return OUTLINED_FUNCTION_41_3(*(_DWORD *)a1 + 253);
    v3 = *(unsigned __int8 *)(a1 + 13);
    if (v3 >= 2)
      v4 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
    else
      v4 = -2;
    if (v4 < 0)
      return OUTLINED_FUNCTION_41_3(-1);
  }
  else
  {
    v4 = -1;
  }
  return OUTLINED_FUNCTION_41_3(v4);
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_WORD *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 14) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 14) = 0;
    if (a2)
      *(_BYTE *)(result + 13) = a2 + 2;
  }
  return result;
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated()
{
  OUTLINED_FUNCTION_33();
}

uint64_t destroy for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked()
{
  OUTLINED_FUNCTION_180_3();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_27_3();
}

void _s27IntelligencePlatformLibrary40IntelligenceFlowQueryDecorationTelemetryV16QDEntitiesRankedVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_284_3(a1, a2);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_19_7();
  OUTLINED_FUNCTION_9();
}

void assignWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  OUTLINED_FUNCTION_122_8(a1, a2);
  OUTLINED_FUNCTION_16_10();
  OUTLINED_FUNCTION_176_3(*(_QWORD *)(v2 + 8));
  OUTLINED_FUNCTION_16_10();
  OUTLINED_FUNCTION_341_0(*(_QWORD *)(v2 + 16));
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_9();
}

void assignWithTake for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_119_6();
  OUTLINED_FUNCTION_170_2();
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return OUTLINED_FUNCTION_41_3(-1);
  if (a2 < 0 && *((_BYTE *)a1 + 24))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    v2 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v2) = -1;
  }
  return OUTLINED_FUNCTION_41_3(v2);
}

_QWORD *storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked(_QWORD *result, int a2, int a3)
{
  if (a2 < 0)
  {
    result[1] = 0;
    result[2] = 0;
    *result = a2 ^ 0x80000000;
    if (a3 < 0)
      *((_BYTE *)result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
      return OUTLINED_FUNCTION_11_14(result, (a2 - 1));
    }
    *((_BYTE *)result + 24) = 0;
    if (a2)
      return OUTLINED_FUNCTION_11_14(result, (a2 - 1));
  }
  return result;
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDEntitiesRanked()
{
  OUTLINED_FUNCTION_33();
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentStarted()
{
  OUTLINED_FUNCTION_33();
}

uint64_t _s27IntelligencePlatformLibrary40IntelligenceFlowQueryDecorationTelemetryV19QDCollectionStartedVwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23FF087C4 + 4 * byte_23FF6FD65[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23FF087F8 + 4 * byte_23FF6FD60[v4]))();
}

uint64_t sub_23FF087F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FF08800(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23FF08808);
  return result;
}

uint64_t sub_23FF08814(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23FF0881CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23FF08820(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23FF08828(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentEnded()
{
  OUTLINED_FUNCTION_33();
}

void _s27IntelligencePlatformLibrary40IntelligenceFlowQueryDecorationTelemetryV18QDCollectionFailedVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_13();
}

uint64_t _s27IntelligencePlatformLibrary40IntelligenceFlowQueryDecorationTelemetryV18QDCollectionFailedVwet_0(uint64_t a1, unsigned int a2)
{
  int v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 21))
      return OUTLINED_FUNCTION_41_3(*(_DWORD *)a1 + 2147483646);
    OUTLINED_FUNCTION_134_6();
  }
  else
  {
    v3 = -1;
  }
  return OUTLINED_FUNCTION_41_3(v3);
}

uint64_t _s27IntelligencePlatformLibrary40IntelligenceFlowQueryDecorationTelemetryV18QDCollectionFailedVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 20) = 0;
    *(_DWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 21) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 21) = 0;
    if (a2)
      return OUTLINED_FUNCTION_148_1(result, a2);
  }
  return result;
}

void type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentFailed()
{
  OUTLINED_FUNCTION_33();
}

void initializeBufferWithCopyOfBuffer for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((*(_DWORD *)(*(_QWORD *)(a3 - 8) + 80) & 0x20000) != 0)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_DWORD *)(a1 + 7) = *(_DWORD *)(a2 + 7);
    *(_BYTE *)(a1 + 11) = *(_BYTE *)(a2 + 11);
    v6 = *(_QWORD *)(a2 + 24);
    if (v6 == 1)
      OUTLINED_FUNCTION_147_6(a1 + 16);
    else
      OUTLINED_FUNCTION_169_4(v6);
    v7 = *(int *)(a3 + 28);
    v8 = a1 + v7;
    v9 = a2 + v7;
    OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_65_1(v9))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
      OUTLINED_FUNCTION_43_7(v10);
    }
    else
    {
      v11 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_19_0(v9))
      {
        v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_43_7(v12);
      }
      else
      {
        OUTLINED_FUNCTION_17_5(v8, v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16));
        OUTLINED_FUNCTION_10_1(v8);
      }
      OUTLINED_FUNCTION_39_6(v8);
    }
  }
  OUTLINED_FUNCTION_8_6();
}

void destroy for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  OUTLINED_FUNCTION_207_0();
  if (*(_QWORD *)(v2 + 24) != 1)
    swift_bridgeObjectRelease();
  v3 = v0 + *(int *)(v1 + 28);
  v4 = OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_121_2(v4) || (OUTLINED_FUNCTION_1_2(), OUTLINED_FUNCTION_9_2(v3)))
  {
    OUTLINED_FUNCTION_13();
  }
  else
  {
    v5 = OUTLINED_FUNCTION_13_9();
    OUTLINED_FUNCTION_103_3(v5, v6, v7);
  }
}

void initializeWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_119_7(a1, a2);
  v7 = *(_QWORD *)(v6 + 24);
  if (v7 == 1)
    OUTLINED_FUNCTION_147_6(v3 + 16);
  else
    OUTLINED_FUNCTION_169_4(v7);
  v8 = *(int *)(a3 + 28);
  v9 = v3 + v8;
  v10 = a2 + v8;
  OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_65_1(v10))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_43_7(v11);
  }
  else
  {
    v12 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_19_0(v10))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_43_7(v13);
    }
    else
    {
      OUTLINED_FUNCTION_17_5(v9, v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16));
      OUTLINED_FUNCTION_10_1(v9);
    }
    OUTLINED_FUNCTION_39_6(v9);
  }
  OUTLINED_FUNCTION_8_6();
}

void assignWithCopy for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int EnumTagSinglePayload;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;

  v6 = *a2;
  *(_DWORD *)(a1 + 7) = *(_DWORD *)((char *)a2 + 7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 11) = *((_BYTE *)a2 + 11);
  v7 = a1 + 16;
  v8 = (__int128 *)(a2 + 2);
  v9 = a2[3];
  if (*(_QWORD *)(a1 + 24) == 1)
  {
    if (v9 == 1)
    {
      v10 = *v8;
      *(_QWORD *)(a1 + 29) = *(uint64_t *)((char *)a2 + 29);
      *(_OWORD *)v7 = v10;
    }
    else
    {
      OUTLINED_FUNCTION_310_1();
      OUTLINED_FUNCTION_309_1();
      swift_bridgeObjectRetain();
    }
  }
  else if (v9 == 1)
  {
    sub_23FEBABD4(a1 + 16);
    v11 = *(_QWORD *)((char *)v8 + 13);
    *(_OWORD *)v7 = *v8;
    *(_QWORD *)(v7 + 13) = v11;
  }
  else
  {
    OUTLINED_FUNCTION_310_1();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_309_1();
  }
  v12 = *(int *)(a3 + 28);
  v13 = a1 + v12;
  v14 = (uint64_t)a2 + v12;
  v15 = OUTLINED_FUNCTION_25();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v13, 1, v15);
  v17 = OUTLINED_FUNCTION_8_0(v14);
  if (EnumTagSinglePayload)
  {
    if (!(_DWORD)v17)
    {
      v18 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_19_0(v14))
      {
        v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_70_6(v19);
      }
      else
      {
        OUTLINED_FUNCTION_17_5(v13, v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16));
        OUTLINED_FUNCTION_10_1(v13);
      }
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  if ((_DWORD)v17)
  {
    OUTLINED_FUNCTION_269_2(v17, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_14:
    v20 = &qword_256F90740;
    goto LABEL_15;
  }
  v22 = OUTLINED_FUNCTION_1_2();
  v23 = __swift_getEnumTagSinglePayload(v13, 1, v22);
  v24 = OUTLINED_FUNCTION_8_0(v14);
  if (v23)
  {
    if (!v24)
    {
      OUTLINED_FUNCTION_19_4(v13, v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16));
LABEL_20:
      OUTLINED_FUNCTION_3_16(v13);
      goto LABEL_21;
    }
  }
  else
  {
    v25 = *(_QWORD *)(v22 - 8);
    if (!v24)
    {
      OUTLINED_FUNCTION_19_4(v13, v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 24));
      goto LABEL_21;
    }
    OUTLINED_FUNCTION_107_2(v13, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
  }
  v20 = &qword_25434B788;
LABEL_15:
  v21 = __swift_instantiateConcreteTypeFromMangledName(v20);
  OUTLINED_FUNCTION_70_6(v21);
LABEL_21:
  OUTLINED_FUNCTION_8_6();
}

void initializeWithTake for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(uint64_t a1, uint64_t a2)
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

  v2 = OUTLINED_FUNCTION_119_7(a1, a2);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v3 + 16);
  *(_QWORD *)(v2 + 29) = *(_QWORD *)(v3 + 29);
  v5 = *(int *)(v4 + 28);
  v6 = v2 + v5;
  v7 = v3 + v5;
  OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_65_1(v7))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_43_7(v8);
  }
  else
  {
    v9 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_19_0(v7))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_43_7(v10);
    }
    else
    {
      OUTLINED_FUNCTION_17_5(v6, v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32));
      OUTLINED_FUNCTION_10_1(v6);
    }
    OUTLINED_FUNCTION_39_6(v6);
  }
  OUTLINED_FUNCTION_8_6();
}

void assignWithTake for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int EnumTagSinglePayload;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;

  v6 = OUTLINED_FUNCTION_119_7(a1, a2);
  v7 = v6 + 16;
  v9 = v8 + 16;
  if (*(_QWORD *)(v6 + 24) == 1)
    goto LABEL_4;
  v10 = *(_QWORD *)(a2 + 24);
  if (v10 == 1)
  {
    sub_23FEBABD4(v7);
LABEL_4:
    *(_OWORD *)v7 = *(_OWORD *)v9;
    *(_QWORD *)(v7 + 13) = *(_QWORD *)(v9 + 13);
    goto LABEL_6;
  }
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(v3 + 24) = v10;
  swift_bridgeObjectRelease();
  *(_DWORD *)(v3 + 32) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(v3 + 36) = *(_BYTE *)(a2 + 36);
LABEL_6:
  v11 = *(int *)(a3 + 28);
  v12 = v3 + v11;
  v13 = a2 + v11;
  v14 = OUTLINED_FUNCTION_25();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v12, 1, v14);
  v16 = OUTLINED_FUNCTION_8_0(v13);
  if (EnumTagSinglePayload)
  {
    if (!(_DWORD)v16)
    {
      v17 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_19_0(v13))
      {
        v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_70_6(v18);
      }
      else
      {
        OUTLINED_FUNCTION_17_5(v12, v13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32));
        OUTLINED_FUNCTION_10_1(v12);
      }
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  if ((_DWORD)v16)
  {
    OUTLINED_FUNCTION_269_2(v16, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_12:
    v19 = &qword_256F90740;
    goto LABEL_13;
  }
  v21 = OUTLINED_FUNCTION_1_2();
  v22 = __swift_getEnumTagSinglePayload(v12, 1, v21);
  v23 = OUTLINED_FUNCTION_8_0(v13);
  if (v22)
  {
    if (!v23)
    {
      OUTLINED_FUNCTION_19_4(v12, v13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 32));
LABEL_18:
      OUTLINED_FUNCTION_3_16(v12);
      goto LABEL_19;
    }
  }
  else
  {
    v24 = *(_QWORD *)(v21 - 8);
    if (!v23)
    {
      OUTLINED_FUNCTION_19_4(v12, v13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 40));
      goto LABEL_19;
    }
    OUTLINED_FUNCTION_107_2(v12, *(uint64_t (**)(uint64_t, uint64_t))(v24 + 8));
  }
  v19 = &qword_25434B788;
LABEL_13:
  v20 = __swift_instantiateConcreteTypeFromMangledName(v19);
  OUTLINED_FUNCTION_70_6(v20);
LABEL_19:
  OUTLINED_FUNCTION_8_6();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23FF08F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 2147483645)
  {
    OUTLINED_FUNCTION_264_3(*(_QWORD *)(a1 + 24));
    OUTLINED_FUNCTION_9();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_226_0(a1 + *(int *)(a3 + 28), a2, v6);
  }
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23FF09000()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_42_0();
  if (v3 == 2147483645)
  {
    *(_QWORD *)(v1 + 24) = (v0 + 1);
    OUTLINED_FUNCTION_9();
  }
  else
  {
    v4 = v2;
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_225_0(v1 + *(int *)(v4 + 28), v0, v0, v5);
  }
}

void sub_23FF09060(uint64_t a1)
{
  unint64_t v1;

  OUTLINED_FUNCTION_59_2(a1, &qword_25434BA00, (void (*)(uint64_t))type metadata accessor for AIML.UUID);
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_263_1();
    OUTLINED_FUNCTION_433();
    OUTLINED_FUNCTION_17_0();
  }
  OUTLINED_FUNCTION_13_8();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23FF090F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_42_0();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDRequestInvocation()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23FF09134()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_42_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
  v0 = OUTLINED_FUNCTION_146_2();
  return OUTLINED_FUNCTION_265(v0, v1, v2, v3);
}

void _s27IntelligencePlatformLibrary40IntelligenceFlowQueryDecorationTelemetryV19QDRequestInvocationVwCP_0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_207_0();
  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256F90740) - 8);
  if ((*(_DWORD *)(v2 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_46_7();
  }
  else
  {
    OUTLINED_FUNCTION_25();
    if (OUTLINED_FUNCTION_65_1(v1))
    {
      OUTLINED_FUNCTION_28_12(v0, v3, *(_QWORD *)(v2 + 64));
    }
    else
    {
      v4 = OUTLINED_FUNCTION_1_2();
      if (OUTLINED_FUNCTION_8_0(v1))
      {
        v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
        OUTLINED_FUNCTION_3_2(v5);
      }
      else
      {
        OUTLINED_FUNCTION_31_13(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
        OUTLINED_FUNCTION_3_16((uint64_t)v0);
      }
      OUTLINED_FUNCTION_39_6((uint64_t)v0);
    }
  }
  OUTLINED_FUNCTION_9();
}

void _s27IntelligencePlatformLibrary40IntelligenceFlowQueryDecorationTelemetryV19QDRequestInvocationVwxx_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v2 = OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_121_2(v2) || (OUTLINED_FUNCTION_1_2(), OUTLINED_FUNCTION_9_2(a1)))
  {
    OUTLINED_FUNCTION_13();
  }
  else
  {
    v3 = OUTLINED_FUNCTION_13_9();
    OUTLINED_FUNCTION_103_3(v3, v4, v5);
  }
}

void _s27IntelligencePlatformLibrary40IntelligenceFlowQueryDecorationTelemetryV19QDRequestInvocationVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_9_2(a2))
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_109_5(v4);
  }
  else
  {
    v5 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_8_0(a2))
    {
      v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_109_5(v6);
    }
    else
    {
      OUTLINED_FUNCTION_19_4(a1, a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16));
      OUTLINED_FUNCTION_3_16(a1);
    }
    OUTLINED_FUNCTION_41(a1, 0);
  }
  OUTLINED_FUNCTION_9();
}

void _s27IntelligencePlatformLibrary40IntelligenceFlowQueryDecorationTelemetryV19QDRequestInvocationVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v6 = OUTLINED_FUNCTION_25();
  v7 = OUTLINED_FUNCTION_54_11(v6);
  if (!v3)
  {
    if (!(_DWORD)v7)
    {
      v12 = OUTLINED_FUNCTION_1_2();
      v13 = OUTLINED_FUNCTION_54_11(v12);
      v14 = *(_QWORD *)(v2 - 8);
      if (!v13)
      {
        OUTLINED_FUNCTION_0_32(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 24));
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_17_17(v14);
      v10 = &qword_25434B788;
      goto LABEL_8;
    }
    OUTLINED_FUNCTION_238_3(v7, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_7:
    v10 = &qword_256F90740;
LABEL_8:
    v11 = __swift_instantiateConcreteTypeFromMangledName(v10);
    OUTLINED_FUNCTION_3_2(v11);
    goto LABEL_12;
  }
  if ((_DWORD)v7)
    goto LABEL_7;
  v8 = OUTLINED_FUNCTION_1_2();
  if (OUTLINED_FUNCTION_8_0(a2))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_3_2(v9);
  }
  else
  {
    OUTLINED_FUNCTION_31_13(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16));
    OUTLINED_FUNCTION_3_16(a1);
  }
  OUTLINED_FUNCTION_39_6(a1);
LABEL_12:
  OUTLINED_FUNCTION_9();
}

void _s27IntelligencePlatformLibrary40IntelligenceFlowQueryDecorationTelemetryV19QDRequestInvocationVwtk_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_25();
  if (OUTLINED_FUNCTION_9_2(a2))
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90740);
    OUTLINED_FUNCTION_109_5(v4);
  }
  else
  {
    v5 = OUTLINED_FUNCTION_1_2();
    if (OUTLINED_FUNCTION_8_0(a2))
    {
      v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
      OUTLINED_FUNCTION_109_5(v6);
    }
    else
    {
      OUTLINED_FUNCTION_19_4(a1, a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32));
      OUTLINED_FUNCTION_3_16(a1);
    }
    OUTLINED_FUNCTION_41(a1, 0);
  }
  OUTLINED_FUNCTION_9();
}

void _s27IntelligencePlatformLibrary40IntelligenceFlowQueryDecorationTelemetryV19QDRequestInvocationVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v6 = OUTLINED_FUNCTION_25();
  v7 = OUTLINED_FUNCTION_54_11(v6);
  if (!v3)
  {
    if (!(_DWORD)v7)
    {
      v12 = OUTLINED_FUNCTION_1_2();
      v13 = OUTLINED_FUNCTION_54_11(v12);
      v14 = *(_QWORD *)(v2 - 8);
      if (!v13)
      {
        OUTLINED_FUNCTION_0_32(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 40));
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_17_17(v14);
      v10 = &qword_25434B788;
      goto LABEL_8;
    }
    OUTLINED_FUNCTION_238_3(v7, (uint64_t (*)(_QWORD))type metadata accessor for AIML.UUID);
LABEL_7:
    v10 = &qword_256F90740;
LABEL_8:
    v11 = __swift_instantiateConcreteTypeFromMangledName(v10);
    OUTLINED_FUNCTION_3_2(v11);
    goto LABEL_12;
  }
  if ((_DWORD)v7)
    goto LABEL_7;
  v8 = OUTLINED_FUNCTION_1_2();
  if (OUTLINED_FUNCTION_8_0(a2))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
    OUTLINED_FUNCTION_3_2(v9);
  }
  else
  {
    OUTLINED_FUNCTION_31_13(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32));
    OUTLINED_FUNCTION_3_16(a1);
  }
  OUTLINED_FUNCTION_39_6(a1);
LABEL_12:
  OUTLINED_FUNCTION_9();
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for IntelligenceFlowQueryDecorationTelemetry.QDJointResolverCall()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23FF09564(uint64_t a1)
{
  unint64_t v1;

  OUTLINED_FUNCTION_59_2(a1, &qword_25434BA00, (void (*)(uint64_t))type metadata accessor for AIML.UUID);
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_322_2();
    OUTLINED_FUNCTION_86_3();
    swift_initStructMetadata();
    OUTLINED_FUNCTION_17_0();
  }
  OUTLINED_FUNCTION_144();
}

void sub_23FF095B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_16_8(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_13();
}

uint64_t OUTLINED_FUNCTION_4_25(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  __swift_getEnumTagSinglePayload(a1, 1, v2);
  return __swift_getEnumTagSinglePayload(v1, 1, v2);
}

uint64_t OUTLINED_FUNCTION_16_23()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_38_12@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_48_13()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = v2[5];
  v4 = v2[6];
  v5 = (_QWORD *)(v0 + v3);
  v6 = (_QWORD *)(v1 + v3);
  v7 = v6[1];
  *v5 = *v6;
  v5[1] = v7;
  v8 = v0 + v4;
  v9 = v1 + v4;
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_WORD *)(v8 + 8) = *(_WORD *)(v9 + 8);
  v10 = v2[7];
  v11 = v2[8];
  v12 = v0 + v10;
  v13 = v1 + v10;
  *(_DWORD *)v12 = *(_DWORD *)v13;
  *(_BYTE *)(v12 + 4) = *(_BYTE *)(v13 + 4);
  v14 = v0 + v11;
  v15 = v1 + v11;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *(_WORD *)(v14 + 8) = *(_WORD *)(v15 + 8);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_54_11(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  __swift_getEnumTagSinglePayload(v1, 1, a1);
  return __swift_getEnumTagSinglePayload(v2, 1, a1);
}

uint64_t OUTLINED_FUNCTION_65_8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
}

void OUTLINED_FUNCTION_89_5(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;

  sub_23FE20874(v2, (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
}

uint64_t OUTLINED_FUNCTION_92_9()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0);
}

void *OUTLINED_FUNCTION_109_5(uint64_t a1)
{
  void *v1;
  const void *v2;

  return memcpy(v1, v2, *(_QWORD *)(*(_QWORD *)(a1 - 8) + 64));
}

uint64_t OUTLINED_FUNCTION_119_7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)result = *(_QWORD *)a2;
  *(_DWORD *)(result + 7) = *(_DWORD *)(a2 + 7);
  *(_BYTE *)(result + 11) = *(_BYTE *)(a2 + 11);
  return result;
}

uint64_t OUTLINED_FUNCTION_122_8(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_126_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(int *)(v2 + 20);
  v4 = *(int *)(v2 + 24);
  v5 = v0 + v3;
  v6 = v1 + v3;
  *(_QWORD *)v5 = *(_QWORD *)v6;
  *(_WORD *)(v5 + 8) = *(_WORD *)(v6 + 8);
  return *(_QWORD *)(v1 + v4 + 8);
}

uint64_t OUTLINED_FUNCTION_130_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(int *)(v2 + 28);
  *(_QWORD *)(v0 + *(int *)(v2 + 24)) = *(_QWORD *)(v1 + *(int *)(v2 + 24));
  v4 = v0 + v3;
  v5 = v1 + v3;
  *(_QWORD *)v4 = *(_QWORD *)v5;
  *(_WORD *)(v4 + 8) = *(_WORD *)(v5 + 8);
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_131_6(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  v3 = v1 + a1;
  v4 = (uint64_t *)(v2 + a1);
  v5 = *v4;
  *(_WORD *)(v3 + 8) = *((_WORD *)v4 + 4);
  *(_QWORD *)v3 = v5;
}

void OUTLINED_FUNCTION_135_6(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v3 = *a1;
  v4 = *((_BYTE *)a1 + 8);
  v5 = *v1;
  v6 = *((_BYTE *)v1 + 8);
  *(_QWORD *)(v2 - 144) = v3;
  *(_BYTE *)(v2 - 136) = v4 & 1;
  *(_QWORD *)(v2 - 200) = v5;
  *(_BYTE *)(v2 - 192) = v6 & 1;
}

uint64_t OUTLINED_FUNCTION_140_6()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_141_5()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 24) = *(_QWORD *)(v1 + 24);
  v2 = *(_DWORD *)(v1 + 32);
  *(_BYTE *)(v0 + 36) = *(_BYTE *)(v1 + 36);
  *(_DWORD *)(v0 + 32) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_144_4()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[1] = v1[1];
  v0[2] = v1[2];
  v0[3] = v1[3];
  v0[4] = v1[4];
  return swift_bridgeObjectRetain();
}

__n128 OUTLINED_FUNCTION_147_6@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;

  result = *(__n128 *)v1;
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_QWORD *)(a1 + 13) = *(_QWORD *)(v1 + 13);
  return result;
}

uint64_t OUTLINED_FUNCTION_148_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v3 = *(int *)(v2 + 52);
  v4 = *(int *)(v2 + 56);
  v5 = (_QWORD *)(v0 + v3);
  v6 = (_QWORD *)(v1 + v3);
  *v5 = *v6;
  *(_QWORD *)((char *)v5 + 6) = *(_QWORD *)((char *)v6 + 6);
  return *(_QWORD *)(v1 + v4);
}

uint64_t OUTLINED_FUNCTION_149_5()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry(0);
}

uint64_t OUTLINED_FUNCTION_151_5()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v1 + v0 + 8);
}

uint64_t OUTLINED_FUNCTION_155_4()
{
  return sub_23FF58FB8();
}

uint64_t OUTLINED_FUNCTION_156_6()
{
  uint64_t v0;
  uint64_t v1;

  sub_23FEFCE84(v1, v0);
  return sub_23FE4F840(v1, v0);
}

uint64_t OUTLINED_FUNCTION_161_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (uint64_t *)(v2 + a1);
  result = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  *v1 = *v3;
  v1[1] = v5;
  v1[2] = v6;
  v1[3] = v7;
  return result;
}

void OUTLINED_FUNCTION_165_3()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);

  sub_23FE251BC(v0, v1);
}

uint64_t OUTLINED_FUNCTION_166_5(uint64_t a1)
{
  uint64_t v1;

  return sub_23FED9174(a1, v1);
}

uint64_t OUTLINED_FUNCTION_167_3(uint64_t a1, uint64_t a2)
{
  return sub_23FE33ED4(a1, a2);
}

uint64_t OUTLINED_FUNCTION_169_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v1 + 24) = a1;
  *(_DWORD *)(v1 + 32) = *(_DWORD *)(v2 + 32);
  *(_BYTE *)(v1 + 36) = *(_BYTE *)(v2 + 36);
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_173_6(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_23FE251BC(a1, v1);
}

__n128 OUTLINED_FUNCTION_174_5()
{
  uint64_t v0;

  return *(__n128 *)(v0 + 40);
}

uint64_t OUTLINED_FUNCTION_175_4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 8) = *(_QWORD *)(v1 + 8);
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_176_3(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = a1;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_179_5(uint64_t a1, ...)
{
  uint64_t v1;
  va_list va;

  va_start(va, a1);
  sub_23FF01BB0((uint64_t)va, v1);
}

uint64_t OUTLINED_FUNCTION_181_3(uint64_t result, uint64_t a2)
{
  *(_DWORD *)result = *(_DWORD *)a2;
  *(_BYTE *)(result + 4) = *(_BYTE *)(a2 + 4);
  *(_DWORD *)(result + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(result + 12) = *(_BYTE *)(a2 + 12);
  return result;
}

void OUTLINED_FUNCTION_182_2(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + a1;
  v4 = v2 + a1;
  *(_QWORD *)v3 = *(_QWORD *)v4;
  *(_WORD *)(v3 + 8) = *(_WORD *)(v4 + 8);
}

uint64_t OUTLINED_FUNCTION_183_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v1 + 24) = a1;
  *(_DWORD *)(v1 + 32) = *(_DWORD *)(v2 + 32);
  *(_BYTE *)(v1 + 36) = *(_BYTE *)(v2 + 36);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_184_4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)v0 = *(_QWORD *)v1;
  *(_DWORD *)(v0 + 7) = *(_DWORD *)(v1 + 7);
  *(_BYTE *)(v0 + 11) = *(_BYTE *)(v1 + 11);
  return *(_QWORD *)(v1 + 24);
}

uint64_t OUTLINED_FUNCTION_189_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(int *)(v2 + 28);
  v4 = v0 + v3;
  v5 = v1 + v3;
  *(_QWORD *)v4 = *(_QWORD *)v5;
  *(_WORD *)(v4 + 8) = *(_WORD *)(v5 + 8);
  return v0;
}

uint64_t OUTLINED_FUNCTION_191_4()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0);
}

uint64_t OUTLINED_FUNCTION_193_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_199_5()
{
  uint64_t v0;

  return sub_23FF0667C(v0);
}

uint64_t OUTLINED_FUNCTION_205_0()
{
  return 0;
}

__n128 OUTLINED_FUNCTION_206_1@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  __n128 result;

  result = *v1;
  *a1 = *v1;
  a1[1].n128_u64[0] = v1[1].n128_u64[0];
  return result;
}

void OUTLINED_FUNCTION_212_3(__n128 *a1@<X8>, __n128 a2@<Q0>)
{
  *a1 = a2;
  a1[1].n128_u64[0] = 0;
  a1[1].n128_u64[1] = 0;
}

uint64_t OUTLINED_FUNCTION_213_4(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_215_4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  *a2 = *v2;
  a2[1] = a1;
  v3 = v2[3];
  a2[2] = v2[2];
  a2[3] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_216_3@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  *a2 = *v2;
  a2[1] = a1;
  v3 = v2[3];
  a2[2] = v2[2];
  a2[3] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_217_4()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23FEFCF68(v1, v0);
}

void OUTLINED_FUNCTION_218_3(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_23FE20874(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_219_4()
{
  uint64_t v0;

  return sub_23FEFCF68(v0, 1);
}

void OUTLINED_FUNCTION_222_2()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);

  sub_23FE251BC(v0, v1);
}

uint64_t OUTLINED_FUNCTION_223_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return IntelligenceFlowQueryDecorationTelemetry.QDSubComponent.rawValue.getter(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_226_4(uint64_t (*a1)(_QWORD))
{
  return a1(0);
}

void OUTLINED_FUNCTION_231_2()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)v0 = *(_QWORD *)v1;
  *(_DWORD *)(v0 + 7) = *(_DWORD *)(v1 + 7);
  *(_BYTE *)(v0 + 11) = *(_BYTE *)(v1 + 11);
}

void OUTLINED_FUNCTION_232_3()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_DWORD *)(v0 + 7) = *(_DWORD *)((char *)v1 + 7);
  *(_QWORD *)v0 = v2;
  *(_BYTE *)(v0 + 11) = *((_BYTE *)v1 + 11);
}

uint64_t OUTLINED_FUNCTION_234_2(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = a1;
  return swift_bridgeObjectRetain();
}

__n128 OUTLINED_FUNCTION_235_4()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  __n128 result;

  v2 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)v0 = *(_OWORD *)v1;
  *(_OWORD *)(v0 + 16) = v2;
  result = *(__n128 *)(v1 + 32);
  *(__n128 *)(v0 + 32) = result;
  *(_QWORD *)(v0 + 48) = *(_QWORD *)(v1 + 48);
  return result;
}

void OUTLINED_FUNCTION_237_5(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + a1;
  v4 = v2 + a1;
  *(_QWORD *)v3 = *(_QWORD *)v4;
  *(_WORD *)(v3 + 8) = *(_WORD *)(v4 + 8);
}

uint64_t OUTLINED_FUNCTION_238_4()
{
  uint64_t *v0;

  return sub_23FE33ED4(*v0, v0[1]);
}

uint64_t OUTLINED_FUNCTION_240_3()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedTool(0);
}

uint64_t OUTLINED_FUNCTION_242_2@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v2[1];
  v4 = v2[2];
  *a2 = a1;
  a2[1] = v3;
  v5 = v2[3];
  a2[2] = v4;
  a2[3] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_245_4(uint64_t a1, uint64_t a2)
{
  return sub_23FE4F840(a1, a2);
}

void OUTLINED_FUNCTION_260_4(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_23FE23908(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_264_3@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF)
    LODWORD(a1) = -1;
  return ((_DWORD)a1 - 1) & ~(((int)a1 - 1) >> 31);
}

uint64_t OUTLINED_FUNCTION_265_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_267_4()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_269_2(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23FE251BC(v2, a2);
}

uint64_t OUTLINED_FUNCTION_270_3()
{
  return sub_23FF592D0();
}

uint64_t OUTLINED_FUNCTION_275_3(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  return a2(0);
}

uint64_t OUTLINED_FUNCTION_277_2()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = *(_QWORD *)(v0 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_280_2()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v1 + 16);
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_284_3(uint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_285_3@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + 8);
  v4 = *(_QWORD *)(v2 + 16);
  *a2 = a1;
  a2[1] = v3;
  a2[2] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_286_2(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 8) = result;
  *(_BYTE *)(v1 + 12) = BYTE4(result) & 1;
  return result;
}

void OUTLINED_FUNCTION_287_2(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  sub_23FE20874(v2 + a1, v3, v1);
}

uint64_t OUTLINED_FUNCTION_289_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v0 + v3) = v4;
  return *(_QWORD *)(v1 + *(int *)(v2 + 48));
}

uint64_t OUTLINED_FUNCTION_290_1(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)v1 = result;
  *(_BYTE *)(v1 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_291_2@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  *v3 = a3;
  v3[1] = a1;
  v4 = *(_QWORD *)(a2 + 24);
  v3[2] = *(_QWORD *)(a2 + 16);
  v3[3] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_297_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_300_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  *(_QWORD *)(v0 + 8) = *(_QWORD *)(v1 + 8);
  result = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 16) = result;
  return result;
}

__n128 OUTLINED_FUNCTION_302_1@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;

  result = *(__n128 *)(v2 + a1);
  *(__n128 *)(v1 + a1) = result;
  return result;
}

void OUTLINED_FUNCTION_303_1(_BYTE *a1@<X8>)
{
  char v1;

  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_307_1(uint64_t a1)
{
  uint64_t v1;

  return sub_23FEDD1CC(a1, v1);
}

void OUTLINED_FUNCTION_308_2()
{
  char v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = v1;
  *(_BYTE *)(v2 - 96) = v0 & 1;
}

void OUTLINED_FUNCTION_309_1()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  v2 = *(_DWORD *)(v1 + 32);
  *(_BYTE *)(v0 + 36) = *(_BYTE *)(v1 + 36);
  *(_DWORD *)(v0 + 32) = v2;
}

uint64_t OUTLINED_FUNCTION_310_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v1 + 16);
  result = *(_QWORD *)(v1 + 24);
  *(_QWORD *)(v0 + 24) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_311_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 48);
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v1 + 40);
  *(_QWORD *)(v0 + 48) = v2;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_315_1(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23FE251BC(v2, a2);
}

void OUTLINED_FUNCTION_317_2(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_23FE23908(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_318_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_319_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_320_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_324_1()
{
  return IntelligenceFlowQueryDecorationTelemetry.QDCollectionContext.hash(into:)();
}

void OUTLINED_FUNCTION_325_1()
{
  IntelligenceFlowQueryDecorationTelemetry.QDToolDefinition.hash(into:)();
}

uint64_t OUTLINED_FUNCTION_326_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_327_0()
{
  uint64_t v0;

  return sub_23FEFCD8C(v0);
}

uint64_t OUTLINED_FUNCTION_328_2()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t result;

  *v0 = *v1;
  result = v1[1];
  v0[1] = result;
  return result;
}

void OUTLINED_FUNCTION_337_1(uint64_t a1)
{
  uint64_t v1;

  sub_23FF02140(a1, v1);
}

uint64_t OUTLINED_FUNCTION_338_1(uint64_t a1)
{
  uint64_t v1;

  return sub_23FEDD1CC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_341_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_342_0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t result;

  *v0 = *v1;
  result = v1[1];
  v0[1] = result;
  return result;
}

void OUTLINED_FUNCTION_343_0(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v19;

  sub_23FEFDF68(a7, v19, a1, a2, a3, a4, a5, a6, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19);
}

void OUTLINED_FUNCTION_344_1(uint64_t a1, ...)
{
  uint64_t v1;
  va_list va;

  va_start(va, a1);
  sub_23FF02140((uint64_t)va, v1);
}

void OUTLINED_FUNCTION_345_0(uint64_t a1, ...)
{
  uint64_t v1;
  va_list va;

  va_start(va, a1);
  sub_23FF024A0((uint64_t)va, v1);
}

uint64_t OUTLINED_FUNCTION_346_1(uint64_t a1, ...)
{
  uint64_t v1;
  va_list va;

  va_start(va, a1);
  return sub_23FEDD1CC((uint64_t)va, v1);
}

uint64_t OUTLINED_FUNCTION_347_1()
{
  return IntelligenceFlowQueryDecorationTelemetry.QDEntityMatch.hash(into:)();
}

uint64_t OUTLINED_FUNCTION_348_1()
{
  return IntelligenceFlowQueryDecorationTelemetry.QDToolParameterDefinition.hash(into:)();
}

void OUTLINED_FUNCTION_349_0()
{
  IntelligenceFlowQueryDecorationTelemetry.QDTuplesGenerated.hash(into:)();
}

uint64_t OUTLINED_FUNCTION_350_0(uint64_t a1, ...)
{
  uint64_t v1;
  va_list va;

  va_start(va, a1);
  return sub_23FEDD1CC((uint64_t)va, v1);
}

uint64_t OUTLINED_FUNCTION_351_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_352_0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t result;

  *v0 = *v1;
  result = v1[1];
  v0[1] = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_353_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_354_1(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_356_1@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  *v1 = a1;
  return swift_bridgeObjectRelease();
}

__n128 OUTLINED_FUNCTION_357_1()
{
  _OWORD *v0;
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)v1;
  v3 = *(_OWORD *)(v1 + 16);
  *v0 = *(_OWORD *)v1;
  v0[1] = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_359_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_362_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_364_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  *(_QWORD *)(v0 + 32) = *(_QWORD *)(v1 + 32);
  result = *(_QWORD *)(v1 + 40);
  *(_QWORD *)(v0 + 40) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_366_1()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 40));
}

void OUTLINED_FUNCTION_367_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;

  sub_23FEFDF68(v20, v21, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

void OUTLINED_FUNCTION_368_0()
{
  uint64_t v0;
  uint64_t v1;

  sub_23FF01BB0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_369_1(uint64_t a1, uint64_t a2)
{
  return sub_23FEFCE84(a1, a2);
}

uint64_t OUTLINED_FUNCTION_370_0()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDRetrievedContextStatement(0);
}

uint64_t OUTLINED_FUNCTION_371_0()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSubComponentContext(0);
}

uint64_t OUTLINED_FUNCTION_372_1()
{
  return type metadata accessor for IntelligenceFlowQueryDecorationTelemetry.QDSpanMatchedEntity(0);
}

double OUTLINED_FUNCTION_374_1()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 + 48) = 0;
  result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)v0 = 0u;
  return result;
}

ValueMetadata *type metadata accessor for Library.Streams.PrivateCloudCompute()
{
  return &type metadata for Library.Streams.PrivateCloudCompute;
}

unint64_t static Library.Streams.PrivateCloudCompute.RequestLog.identifier.getter()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_23FF0A0F0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23FF58C28();
  __swift_allocate_value_buffer(v3, qword_25434DE88);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_25434DE88);
  sub_23FF58BF8();
  result = __swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(v4, v2, v3);
  __break(1u);
  return result;
}

uint64_t static Library.Streams.PrivateCloudCompute.RequestLog.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE17B08(&_MergedGlobals_20, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], (uint64_t)qword_25434DE88, a1);
}

uint64_t sub_23FF0A1EC(uint64_t a1)
{
  return sub_23FE17B90(a1, MEMORY[0x24BE0CA80], qword_25434DEA0, MEMORY[0x24BE0CA70]);
}

uint64_t static Library.Streams.PrivateCloudCompute.RequestLog.domain.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE17B08(&qword_25434DE78, MEMORY[0x24BE0CA80], (uint64_t)qword_25434DEA0, a1);
}

uint64_t sub_23FF0A228(uint64_t a1)
{
  return sub_23FE17B90(a1, MEMORY[0x24BE0CA40], qword_25434DEB8, MEMORY[0x24BE0CA38]);
}

uint64_t static Library.Streams.PrivateCloudCompute.RequestLog.protectionClass.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE17B08(&qword_25434DE80, MEMORY[0x24BE0CA40], (uint64_t)qword_25434DEB8, a1);
}

id static Library.Streams.PrivateCloudCompute.RequestLog.configuration.getter()
{
  id result;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C9B8]), sel_initPruneOnAccess_filterByAgeOnRead_maxAge_maxStreamSize_maxEventCount_, 0, 0, 52428800, 10000, 604800.0);
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_opt_self();
    v3 = (void *)OUTLINED_FUNCTION_0_30();
    v4 = objc_msgSend(v2, sel_newLibraryStoreConfigForStreamIdentifier_domain_segmentSize_protectionClass_pruningPolicy_, v3, 0, 5242880, 3, v1);

    v5 = (void *)OUTLINED_FUNCTION_0_30();
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434BB40);
    v7 = objc_allocWithZone(MEMORY[0x24BE0CDA0]);
    v8 = sub_23FE1E74C(v5, v6, v4, 0, (uint64_t)&unk_2510228A0, 0);

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t static Library.Streams.PrivateCloudCompute.RequestLog.attribute(_:)(void (*a1)(void))
{
  uint64_t v1;
  unint64_t result;

  result = sub_23FF0A398(a1);
  if (!v1)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_23FF0A398(void (*a1)(void))
{
  a1();
  return 0x800000023FF8F920;
}

unint64_t sub_23FF0A3CC(void (*a1)(void))
{
  uint64_t v1;
  unint64_t result;

  result = sub_23FF0A398(a1);
  if (!v1)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_23FF0A3F8()
{
  static Library.Streams.PrivateCloudCompute.RequestLog.identifier.getter();
  return 0xD00000000000001ELL;
}

_UNKNOWN **sub_23FF0A420()
{
  return &protocol witness table for PrivateCloudComputeRequestLog;
}

unint64_t sub_23FF0A42C(uint64_t a1)
{
  unint64_t result;

  result = sub_23FF0A450();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23FF0A450()
{
  unint64_t result;

  result = qword_25434BA18;
  if (!qword_25434BA18)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for Library.Streams.PrivateCloudCompute.RequestLog, &type metadata for Library.Streams.PrivateCloudCompute.RequestLog);
    atomic_store(result, (unint64_t *)&qword_25434BA18);
  }
  return result;
}

ValueMetadata *type metadata accessor for Library.Streams.PrivateCloudCompute.RequestLog()
{
  return &type metadata for Library.Streams.PrivateCloudCompute.RequestLog;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> PrivateCloudComputeRequestLog.json()()
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
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  Swift::String result;
  uint64_t v17;

  v3 = v0;
  v4 = sub_23FF58CA0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0_7();
  v6 = OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_13_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F92190);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23FF0A5D4(v3, v2);
  sub_23FE18300(v2, v6, (uint64_t)v10);
  sub_23FF58C94();
  sub_23FF0A618();
  v11 = sub_23FF58DC0();
  v13 = v12;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v4);
  sub_23FE1D55C((uint64_t)v10, &qword_256F92190);
  v14 = v11;
  v15 = v13;
  result._object = v15;
  result._countAndFlagsBits = v14;
  return result;
}

uint64_t sub_23FF0A5D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PrivateCloudComputeRequestLog();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23FF0A618()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256F92198;
  if (!qword_256F92198)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256F92190);
    result = MEMORY[0x24267B784](&unk_23FF5FC90, v1);
    atomic_store(result, (unint64_t *)&qword_256F92198);
  }
  return result;
}

uint64_t static PrivateCloudComputeRequestLog.event(from:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  sub_23FF58C88();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_11();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F92190);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0_7();
  swift_bridgeObjectRetain();
  sub_23FF58C7C();
  sub_23FF0A618();
  result = sub_23FF58DCC();
  if (!v1)
    return sub_23FF0A730(v2, a1);
  return result;
}

uint64_t sub_23FF0A730(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PrivateCloudComputeRequestLog();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static PrivateCloudComputeRequestLog.event(from:dataVersion:writeTimestamp:bookmark:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;

  v28 = a6;
  v29 = a5;
  v27 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F92190);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_11();
  v11 = sub_23FF58CC4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v26 - v16;
  if (*(_DWORD *)sub_23FF0BE14() == a3)
  {
    sub_23FF58CB8();
    sub_23FF58CAC();
    v32 = 0;
    v30 = 0u;
    v31 = 0u;
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    sub_23FE1B51C(a1, a2);
    sub_23FF0A618();
    v18 = v33;
    sub_23FF58DE4();
    if (v18)
    {
      return OUTLINED_FUNCTION_15();
    }
    else
    {
      OUTLINED_FUNCTION_15();
      v21 = v28;
      sub_23FF0A730(v6, v28);
      v22 = OUTLINED_FUNCTION_16_0();
      v23 = v21 + *(int *)(v22 + 20);
      sub_23FE1D55C(v23, &qword_25434B8D8);
      v24 = sub_23FF58BEC();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v23, v27, v24);
      __swift_storeEnumTagSinglePayload(v23, 0, 1, v24);
      v25 = v21 + *(int *)(v22 + 24);
      sub_23FE1D55C(v25, &qword_25434B738);
      return sub_23FE1EDB8(v29, v25);
    }
  }
  else
  {
    sub_23FE1ED7C();
    swift_allocError();
    *v20 = a3;
    return swift_willThrow();
  }
}

uint64_t PrivateCloudComputeRequestLog.serialize()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F92190);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_13_0();
  sub_23FF0A5D4(v0, (uint64_t)v5);
  sub_23FE18300((uint64_t)v5, v2, v1);
  sub_23FF0A618();
  v7 = sub_23FF58DF0();
  sub_23FE1D55C(v1, &qword_256F92190);
  return v7;
}

void static PrivateCloudComputeRequestLog.columns.getter()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25434BB00);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_23FF5FF30;
  sub_23FE1F1D4();
  v0 = OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_4_0(v0);
  OUTLINED_FUNCTION_8_12();
  v1 = sub_23FE1F26C(0x6D617473656D6974, 0xE900000000000070, 3, 0, v3, 0, 2);
  if (v1)
  {
    v2 = v1;
    OUTLINED_FUNCTION_7_5();
  }
  __break(1u);
  JUMPOUT(0x23FF0AD24);
}

uint64_t sub_23FF0AD30@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return static PrivateCloudComputeRequestLog.event(from:dataVersion:writeTimestamp:bookmark:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_23FF0AD44()
{
  return PrivateCloudComputeRequestLog.serialize()();
}

uint64_t sub_23FF0AD5C()
{
  return PrivateCloudComputeRequestLog.json()()._countAndFlagsBits;
}

uint64_t sub_23FF0AD70@<X0>(uint64_t a1@<X8>)
{
  return static PrivateCloudComputeRequestLog.event(from:)(a1);
}

uint64_t PrivateCloudComputeRequestLog.init()@<X0>(_DWORD *a1@<X8>)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t result;

  v2 = (int *)OUTLINED_FUNCTION_16_0();
  v3 = (uint64_t)a1 + v2[5];
  sub_23FE2073C(v3);
  v4 = (uint64_t)a1 + v2[6];
  sub_23FE20830(v4);
  v5 = (uint64_t)a1 + v2[7];
  sub_23FE647EC(v5);
  v6 = (uint64_t *)((char *)a1 + v2[8]);
  *v6 = j__OUTLINED_FUNCTION_17_0();
  v6[1] = v7;
  v8 = (uint64_t *)((char *)a1 + v2[9]);
  *v8 = j__OUTLINED_FUNCTION_17_0();
  v8[1] = v9;
  v10 = (uint64_t *)((char *)a1 + v2[10]);
  *v10 = j__OUTLINED_FUNCTION_17_0();
  v10[1] = v11;
  *a1 = *(_DWORD *)sub_23FF0BE14();
  OUTLINED_FUNCTION_10(v3);
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_13_2(v3);
  sub_23FE1D55C(v4, &qword_25434B738);
  *(_OWORD *)v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  *(_QWORD *)(v4 + 32) = 0;
  OUTLINED_FUNCTION_10(v5);
  OUTLINED_FUNCTION_13_2(v5);
  swift_bridgeObjectRelease();
  *v6 = 0;
  v6[1] = 0;
  swift_bridgeObjectRelease();
  *v8 = 0;
  v8[1] = 0;
  result = swift_bridgeObjectRelease();
  *v10 = 0;
  v10[1] = 0;
  *(_QWORD *)((char *)a1 + v2[11]) = MEMORY[0x24BEE4AF8];
  return result;
}

uint64_t static PrivateCloudComputeRequestLog.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  char *v17;
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
  char v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  char v53;
  uint64_t v54;
  uint64_t v55;

  v5 = OUTLINED_FUNCTION_46();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_14_2();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256F90420);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
  OUTLINED_FUNCTION_9_0();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v54 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v54 - v18;
  v20 = OUTLINED_FUNCTION_16_0();
  v21 = *(int *)(v20 + 28);
  v54 = a1;
  v22 = a1 + v21;
  v23 = v20;
  sub_23FE63100(v22, (uint64_t)v19);
  v24 = *(int *)(v23 + 28);
  v55 = a2;
  sub_23FE63100(a2 + v24, (uint64_t)v17);
  v25 = (uint64_t)&v10[*(int *)(v7 + 48)];
  sub_23FE63100((uint64_t)v19, (uint64_t)v10);
  sub_23FE63100((uint64_t)v17, v25);
  OUTLINED_FUNCTION_28((uint64_t)v10);
  if (v26)
  {
    OUTLINED_FUNCTION_10((uint64_t)v17);
    OUTLINED_FUNCTION_10((uint64_t)v19);
    OUTLINED_FUNCTION_28(v25);
    if (v26)
    {
      sub_23FE1D55C((uint64_t)v10, &qword_25434B8D8);
      goto LABEL_13;
    }
LABEL_9:
    sub_23FE1D55C((uint64_t)v10, &qword_256F90420);
    goto LABEL_10;
  }
  sub_23FE63100((uint64_t)v10, (uint64_t)v14);
  OUTLINED_FUNCTION_28(v25);
  if (v26)
  {
    sub_23FE1D55C((uint64_t)v17, &qword_25434B8D8);
    sub_23FE1D55C((uint64_t)v19, &qword_25434B8D8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
    goto LABEL_9;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v2, v25, v5);
  sub_23FE6319C(&qword_256F90430, MEMORY[0x24BDCE958]);
  v29 = sub_23FF58FB8();
  v30 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v30(v2, v5);
  OUTLINED_FUNCTION_10((uint64_t)v17);
  OUTLINED_FUNCTION_10((uint64_t)v19);
  v30((uint64_t)v14, v5);
  OUTLINED_FUNCTION_10((uint64_t)v10);
  if ((v29 & 1) == 0)
    goto LABEL_10;
LABEL_13:
  v32 = v54;
  v31 = v55;
  OUTLINED_FUNCTION_2_3();
  if (v35)
  {
    if (!v33)
      goto LABEL_10;
    OUTLINED_FUNCTION_8_1(v34);
    if (v26)
      v38 = v36 == v37;
    else
      v38 = 0;
    if (!v38)
    {
      v39 = OUTLINED_FUNCTION_4_3();
      v27 = 0;
      if ((v39 & 1) == 0)
        return v27 & 1;
    }
  }
  else if (v33)
  {
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_2_3();
  if (v42)
  {
    if (!v40)
      goto LABEL_10;
    OUTLINED_FUNCTION_8_1(v41);
    if (v26)
      v45 = v43 == v44;
    else
      v45 = 0;
    if (!v45)
    {
      v46 = OUTLINED_FUNCTION_4_3();
      v27 = 0;
      if ((v46 & 1) == 0)
        return v27 & 1;
    }
  }
  else if (v40)
  {
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_2_3();
  if (!v49)
  {
    if (!v47)
    {
LABEL_40:
      v27 = sub_23FF0B3C8(*(_QWORD *)(v32 + *(int *)(v23 + 44)), *(_QWORD *)(v31 + *(int *)(v23 + 44)));
      return v27 & 1;
    }
    goto LABEL_10;
  }
  if (!v47)
  {
LABEL_10:
    v27 = 0;
    return v27 & 1;
  }
  OUTLINED_FUNCTION_8_1(v48);
  if (v26)
    v52 = v50 == v51;
  else
    v52 = 0;
  if (v52)
    goto LABEL_40;
  v53 = OUTLINED_FUNCTION_4_3();
  v27 = 0;
  if ((v53 & 1) != 0)
    goto LABEL_40;
  return v27 & 1;
}

uint64_t PrivateCloudComputeRequestLog.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int *v10;
  uint64_t v11;
  uint64_t v13;

  v3 = v1;
  v5 = OUTLINED_FUNCTION_46();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_14_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (int *)OUTLINED_FUNCTION_16_0();
  sub_23FE63100(v3 + v10[7], (uint64_t)v9);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v5) == 1)
  {
    OUTLINED_FUNCTION_5_0();
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v2, v9, v5);
    OUTLINED_FUNCTION_5_0();
    sub_23FE6319C(&qword_256F90438, MEMORY[0x24BDCE930]);
    sub_23FF58FAC();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v5);
  }
  if (*(_QWORD *)(v3 + v10[8] + 8))
  {
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_4_8();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_16_1();
  }
  else
  {
    OUTLINED_FUNCTION_5_0();
  }
  if (*(_QWORD *)(v3 + v10[9] + 8))
  {
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_4_8();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_16_1();
  }
  else
  {
    OUTLINED_FUNCTION_5_0();
  }
  if (*(_QWORD *)(v3 + v10[10] + 8))
  {
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_4_8();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_16_1();
  }
  else
  {
    OUTLINED_FUNCTION_5_0();
  }
  v11 = *(_QWORD *)(v3 + v10[11]);
  swift_bridgeObjectRetain();
  sub_23FF0B498(a1, v11);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23FF0B3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  BOOL v10;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      v8 = 1;
    }
    else
    {
      sub_23FF0B560();
      v5 = v2 - 1;
      v6 = a2 + 64;
      v7 = a1 + 64;
      do
      {
        v8 = sub_23FF58FB8();
        v10 = v5-- != 0;
        if ((v8 & 1) == 0)
          break;
        v6 += 48;
        v7 += 48;
      }
      while (v10);
    }
  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

uint64_t sub_23FF0B498(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_23FF592B8();
  if (v3)
  {
    sub_23FF0B524();
    v5 = a2 + 64;
    do
    {
      v5 += 48;
      result = sub_23FF58FAC();
      --v3;
    }
    while (v3);
  }
  return result;
}

unint64_t sub_23FF0B524()
{
  unint64_t result;

  result = qword_256F921A0;
  if (!qword_256F921A0)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for PrivateCloudComputeRequestLog.Attestation, &type metadata for PrivateCloudComputeRequestLog.Attestation);
    atomic_store(result, (unint64_t *)&qword_256F921A0);
  }
  return result;
}

unint64_t sub_23FF0B560()
{
  unint64_t result;

  result = qword_256F921A8;
  if (!qword_256F921A8)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for PrivateCloudComputeRequestLog.Attestation, &type metadata for PrivateCloudComputeRequestLog.Attestation);
    atomic_store(result, (unint64_t *)&qword_256F921A8);
  }
  return result;
}

uint64_t sub_23FF0B59C()
{
  uint64_t v0;
  uint64_t v1;
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
  char *v12;

  v3 = OUTLINED_FUNCTION_9_7();
  __swift_allocate_value_buffer(v3, qword_256FAFBA0);
  OUTLINED_FUNCTION_15_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  OUTLINED_FUNCTION_187();
  v4 = OUTLINED_FUNCTION_13_24();
  *(_OWORD *)(v4 + 16) = xmmword_23FF60480;
  v5 = v4 + v1;
  v6 = v4 + v1 + *(int *)(v0 + 48);
  *(_QWORD *)(v4 + v1) = 4;
  *(_QWORD *)v6 = "timestamp";
  *(_QWORD *)(v6 + 8) = 9;
  *(_BYTE *)(v6 + 16) = 2;
  sub_23FF58ED4();
  OUTLINED_FUNCTION_1_9(v6);
  v7 = v5 + v2 + *(int *)(v0 + 48);
  *(_QWORD *)(v5 + v2) = 5;
  *(_QWORD *)v7 = "requestId";
  *(_QWORD *)(v7 + 8) = 9;
  *(_BYTE *)(v7 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v7);
  v8 = (_QWORD *)(v5 + 2 * v2);
  v9 = (uint64_t)v8 + *(int *)(v0 + 48);
  *v8 = 1;
  *(_QWORD *)v9 = "pipelineKind";
  *(_QWORD *)(v9 + 8) = 12;
  *(_BYTE *)(v9 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v9);
  v10 = (_QWORD *)(v5 + 3 * v2);
  v11 = (uint64_t)v10 + *(int *)(v0 + 48);
  *v10 = 2;
  *(_QWORD *)v11 = "pipelineParameters";
  *(_QWORD *)(v11 + 8) = 18;
  *(_BYTE *)(v11 + 16) = 2;
  OUTLINED_FUNCTION_1_9(v11);
  v12 = OUTLINED_FUNCTION_24_10((_QWORD *)(v5 + 4 * v2));
  *(_QWORD *)v12 = "attestations";
  *((_QWORD *)v12 + 1) = 12;
  v12[16] = 2;
  OUTLINED_FUNCTION_1_9((uint64_t)v12);
  return sub_23FF58EE0();
}

uint64_t sub_23FF0B730()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = OUTLINED_FUNCTION_12();
  v4 = v1;
  if (!v1)
  {
    while ((v3 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 5:
          OUTLINED_FUNCTION_16_0();
          v6 = v4;
          OUTLINED_FUNCTION_74_0();
          goto LABEL_8;
        case 3:
          v5 = OUTLINED_FUNCTION_16_0();
          v6 = v4;
          sub_23FE1C624(v0 + *(int *)(v5 + 44));
          goto LABEL_8;
        case 4:
          OUTLINED_FUNCTION_16_0();
          v6 = v4;
          sub_23FE1BFDC();
LABEL_8:
          v4 = v6;
          break;
        default:
          break;
      }
      result = OUTLINED_FUNCTION_40_2();
    }
  }
  return result;
}

void sub_23FF0B844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int *v7;
  uint64_t v8;

  sub_23FF0B940(v3);
  if (!v4)
  {
    v7 = (int *)OUTLINED_FUNCTION_16_0();
    if (*(_QWORD *)(v3 + v7[8] + 8))
      OUTLINED_FUNCTION_2_1();
    if (*(_QWORD *)(v3 + v7[9] + 8))
      OUTLINED_FUNCTION_2_1();
    if (*(_QWORD *)(v3 + v7[10] + 8))
      OUTLINED_FUNCTION_2_1();
    v8 = *(_QWORD *)(v3 + v7[11]);
    if (*(_QWORD *)(v8 + 16))
      sub_23FE1D218(v8, 3, a2, (uint64_t)&type metadata for PrivateCloudComputeRequestLog.Attestation, a3, (uint64_t)&off_2510253F0);
  }
  OUTLINED_FUNCTION_33_1();
}

uint64_t sub_23FF0B940(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23FF58BEC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OUTLINED_FUNCTION_16_0();
  sub_23FE63100(a1 + *(int *)(v9 + 28), (uint64_t)v4);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
    return sub_23FE13D34((uint64_t)v4);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_23FE1CDB4((uint64_t)v8, 4, 2020175477, 0xE400000000000000);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_23FF0BA8C()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FF0BA98@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(&qword_256FADD40, (uint64_t)qword_256FAFBA0, a1);
}

uint64_t sub_23FF0BAB8()
{
  return sub_23FF0B730();
}

void sub_23FF0BACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23FF0B844(a1, a2, a3);
}

uint64_t sub_23FF0BAE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;

  v3 = OUTLINED_FUNCTION_9_7();
  __swift_allocate_value_buffer(v3, qword_256FAFBB8);
  OUTLINED_FUNCTION_15_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256F8F7D8);
  OUTLINED_FUNCTION_187();
  v4 = OUTLINED_FUNCTION_13_24();
  *(_OWORD *)(v4 + 16) = xmmword_23FF614F0;
  v5 = (_QWORD *)(v4 + v1);
  v6 = v4 + v1 + *(int *)(v0 + 48);
  *v5 = 1;
  *(_QWORD *)v6 = "node";
  *(_QWORD *)(v6 + 8) = 4;
  *(_BYTE *)(v6 + 16) = 2;
  sub_23FF58ED4();
  OUTLINED_FUNCTION_16_2(v6);
  v7 = (uint64_t)v5 + v2 + *(int *)(v0 + 48);
  *(_QWORD *)((char *)v5 + v2) = 2;
  *(_QWORD *)v7 = "nodeState";
  *(_QWORD *)(v7 + 8) = 9;
  *(_BYTE *)(v7 + 16) = 2;
  OUTLINED_FUNCTION_16_2(v7);
  v8 = OUTLINED_FUNCTION_24_10((_QWORD *)((char *)v5 + 2 * v2));
  *(_QWORD *)v8 = "attestationString";
  *((_QWORD *)v8 + 1) = 17;
  v8[16] = 2;
  OUTLINED_FUNCTION_16_2((uint64_t)v8);
  return sub_23FF58EE0();
}

void sub_23FF0BC18()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_12();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (v1 == 3 || v1 == 2 || v1 == 1)
        OUTLINED_FUNCTION_74_0();
      v1 = OUTLINED_FUNCTION_40_2();
    }
  }
  OUTLINED_FUNCTION_33_1();
}

uint64_t sub_23FF0BC88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  __int128 *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
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
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v9 = v7[1];
  v41 = *v7;
  v42 = v9;
  v43 = v7[2];
  v10 = OUTLINED_FUNCTION_16_24((uint64_t)&v41, a2, a3, a4, a5, a6, a7);
  result = OUTLINED_FUNCTION_5_28(v10, v11, v12, v13, v14, v15);
  v22 = v44;
  if (v44)
  {
    result = OUTLINED_FUNCTION_35_0();
    if (v8)
      return result;
  }
  else if (v8)
  {
    return result;
  }
  v23 = OUTLINED_FUNCTION_16_24((uint64_t)&v42, v22, v17, v18, v19, v20, v21);
  OUTLINED_FUNCTION_5_28(v23, v24, v25, v26, v27, v28);
  v34 = v44;
  if (v44)
    OUTLINED_FUNCTION_35_0();
  v35 = OUTLINED_FUNCTION_16_24((uint64_t)&v43, v34, v29, v30, v31, v32, v33);
  result = OUTLINED_FUNCTION_5_28(v35, v36, v37, v38, v39, v40);
  if (v44)
    return OUTLINED_FUNCTION_35_0();
  return result;
}

void sub_23FF0BD60()
{
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23FF0BD6C@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE20668(qword_256FADD48, (uint64_t)qword_256FAFBB8, a1);
}

void sub_23FF0BD8C()
{
  sub_23FF0BC18();
}

uint64_t sub_23FF0BDA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_23FF0BC88(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_23FF0BDB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_13_24()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_16_24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  return sub_23FF0BDB4(a1, (uint64_t)va);
}

void *sub_23FF0BE14()
{
  return &unk_23FF716A0;
}

void PrivateCloudComputeRequestLog.writeTimestamp.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_209_0(v0 + *(int *)(v1 + 20), v2, &qword_25434B8D8);
  OUTLINED_FUNCTION_13();
}

uint64_t type metadata accessor for PrivateCloudComputeRequestLog()
{
  uint64_t result;

  result = qword_25434F160;
  if (!qword_25434F160)
    return swift_getSingletonMetadata();
  return result;
}

void PrivateCloudComputeRequestLog.writeTimestamp.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_212_0(v1, v0 + *(int *)(v1 + 20), &qword_25434B8D8);
  OUTLINED_FUNCTION_13();
}

uint64_t (*PrivateCloudComputeRequestLog.writeTimestamp.modify())()
{
  OUTLINED_FUNCTION_16_0();
  return nullsub_1;
}

void PrivateCloudComputeRequestLog.bookmark.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_209_0(v0 + *(int *)(v1 + 24), v2, &qword_25434B738);
  OUTLINED_FUNCTION_13();
}

void PrivateCloudComputeRequestLog.bookmark.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_212_0(v1, v0 + *(int *)(v1 + 24), &qword_25434B738);
  OUTLINED_FUNCTION_13();
}

uint64_t (*PrivateCloudComputeRequestLog.bookmark.modify())()
{
  OUTLINED_FUNCTION_16_0();
  return nullsub_1;
}

void PrivateCloudComputeRequestLog.timestamp.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_209_0(v0 + *(int *)(v1 + 28), v2, &qword_25434B8D8);
  OUTLINED_FUNCTION_13();
}

void PrivateCloudComputeRequestLog.timestamp.setter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_212_0(v1, v0 + *(int *)(v1 + 28), &qword_25434B8D8);
  OUTLINED_FUNCTION_13();
}

uint64_t (*PrivateCloudComputeRequestLog.timestamp.modify())()
{
  OUTLINED_FUNCTION_16_0();
  return nullsub_1;
}

void PrivateCloudComputeRequestLog.requestId.getter()
{
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void PrivateCloudComputeRequestLog.requestId.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_19();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*PrivateCloudComputeRequestLog.requestId.modify())()
{
  OUTLINED_FUNCTION_16_0();
  return nullsub_1;
}

void PrivateCloudComputeRequestLog.pipelineKind.getter()
{
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void PrivateCloudComputeRequestLog.pipelineKind.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_19();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*PrivateCloudComputeRequestLog.pipelineKind.modify())()
{
  OUTLINED_FUNCTION_16_0();
  return nullsub_1;
}

void PrivateCloudComputeRequestLog.pipelineParameters.getter()
{
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void PrivateCloudComputeRequestLog.pipelineParameters.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_19();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*PrivateCloudComputeRequestLog.pipelineParameters.modify())()
{
  OUTLINED_FUNCTION_16_0();
  return nullsub_1;
}

uint64_t PrivateCloudComputeRequestLog.attestations.getter()
{
  OUTLINED_FUNCTION_16_0();
  return swift_bridgeObjectRetain();
}

void PrivateCloudComputeRequestLog.attestations.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(OUTLINED_FUNCTION_16_0() + 44);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  OUTLINED_FUNCTION_9();
}

uint64_t (*PrivateCloudComputeRequestLog.attestations.modify())()
{
  OUTLINED_FUNCTION_16_0();
  return nullsub_1;
}

void PrivateCloudComputeRequestLog.Attestation.node.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void PrivateCloudComputeRequestLog.Attestation.node.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*PrivateCloudComputeRequestLog.Attestation.node.modify())()
{
  return nullsub_1;
}

void PrivateCloudComputeRequestLog.Attestation.nodeState.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void PrivateCloudComputeRequestLog.Attestation.nodeState.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*PrivateCloudComputeRequestLog.Attestation.nodeState.modify())()
{
  return nullsub_1;
}

void PrivateCloudComputeRequestLog.Attestation.attestationString.getter()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_13();
}

void PrivateCloudComputeRequestLog.Attestation.attestationString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*PrivateCloudComputeRequestLog.Attestation.attestationString.modify())()
{
  return nullsub_1;
}

void __swiftcall PrivateCloudComputeRequestLog.Attestation.init()(IntelligencePlatformLibrary::PrivateCloudComputeRequestLog::Attestation *__return_ptr retstr)
{
  retstr->nodeState = 0u;
  retstr->attestationString = 0u;
  retstr->node = 0u;
}

uint64_t PrivateCloudComputeRequestLog.Attestation.hash(into:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[3];
  v2 = v0[5];
  if (v0[1])
  {
    OUTLINED_FUNCTION_6_19();
    swift_bridgeObjectRetain();
    sub_23FF59048();
    swift_bridgeObjectRelease();
    if (v1)
      goto LABEL_3;
LABEL_6:
    OUTLINED_FUNCTION_12_14();
    if (v2)
      goto LABEL_4;
    return OUTLINED_FUNCTION_12_14();
  }
  OUTLINED_FUNCTION_12_14();
  if (!v1)
    goto LABEL_6;
LABEL_3:
  OUTLINED_FUNCTION_6_19();
  OUTLINED_FUNCTION_44_1();
  sub_23FF59048();
  OUTLINED_FUNCTION_23_3();
  if (v2)
  {
LABEL_4:
    OUTLINED_FUNCTION_6_19();
    swift_bridgeObjectRetain();
    sub_23FF59048();
    return swift_bridgeObjectRelease();
  }
  return OUTLINED_FUNCTION_12_14();
}

uint64_t static PrivateCloudComputeRequestLog.Attestation.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
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
  BOOL v13;
  char v14;
  uint64_t result;
  char v17;

  v3 = a1[1];
  v4 = a1[2];
  v6 = a1[3];
  v5 = a1[4];
  v7 = a1[5];
  v8 = a2[1];
  v9 = a2[2];
  v11 = a2[3];
  v10 = a2[4];
  v12 = a2[5];
  if (!v3)
  {
    if (v8)
      return 0;
    goto LABEL_10;
  }
  if (!v8)
    return 0;
  v13 = *a1 == *a2 && v3 == v8;
  if (v13 || (v14 = OUTLINED_FUNCTION_4_3(), result = 0, (v14 & 1) != 0))
  {
LABEL_10:
    if (v6)
    {
      if (!v11)
        return 0;
      if (v4 != v9 || v6 != v11)
      {
        v17 = OUTLINED_FUNCTION_4_3();
        result = 0;
        if ((v17 & 1) == 0)
          return result;
      }
    }
    else if (v11)
    {
      return 0;
    }
    if (v7)
    {
      if (v12)
      {
        if (v5 == v10 && v7 == v12)
          return 1;
        OUTLINED_FUNCTION_13_9();
        if ((OUTLINED_FUNCTION_4_3() & 1) != 0)
          return 1;
      }
    }
    else if (!v12)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

void PrivateCloudComputeRequestLog.Attestation.hashValue.getter()
{
  OUTLINED_FUNCTION_29_9();
  sub_23FF592AC();
  OUTLINED_FUNCTION_35_19();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_124_1();
}

void sub_23FF0C500()
{
  OUTLINED_FUNCTION_29_9();
  sub_23FF592AC();
  OUTLINED_FUNCTION_35_19();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_124_1();
}

void PrivateCloudComputeRequestLog.hashValue.getter()
{
  _BYTE v0[72];

  sub_23FF592AC();
  PrivateCloudComputeRequestLog.hash(into:)((uint64_t)v0);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_5_3();
}

void sub_23FF0C564()
{
  _BYTE v0[72];

  sub_23FF592AC();
  PrivateCloudComputeRequestLog.hash(into:)((uint64_t)v0);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_5_3();
}

unint64_t sub_23FF0C598()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256F921D0;
  if (!qword_256F921D0)
  {
    v1 = type metadata accessor for PrivateCloudComputeRequestLog();
    result = MEMORY[0x24267B784](&protocol conformance descriptor for PrivateCloudComputeRequestLog, v1);
    atomic_store(result, (unint64_t *)&qword_256F921D0);
  }
  return result;
}

void initializeBufferWithCopyOfBuffer for PrivateCloudComputeRequestLog(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_DWORD *)(*(_QWORD *)(a3 - 8) + 80) & 0x20000) != 0)
  {
    *a1 = *a2;
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    v3 = OUTLINED_FUNCTION_46();
    if (OUTLINED_FUNCTION_4_2())
    {
      v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
      OUTLINED_FUNCTION_11_0(v4);
    }
    else
    {
      OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
      OUTLINED_FUNCTION_2();
    }
    v5 = OUTLINED_FUNCTION_29_1();
    if (v7)
      OUTLINED_FUNCTION_18_4(v5, v6, v7);
    else
      OUTLINED_FUNCTION_28_4(v5, v6);
    if (OUTLINED_FUNCTION_4_2())
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
      OUTLINED_FUNCTION_11_0(v8);
    }
    else
    {
      OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_6_29();
    OUTLINED_FUNCTION_44_1();
    OUTLINED_FUNCTION_19_7();
    OUTLINED_FUNCTION_20_1();
  }
  OUTLINED_FUNCTION_8_6();
}

uint64_t destroy for PrivateCloudComputeRequestLog(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  OUTLINED_FUNCTION_46();
  if (!OUTLINED_FUNCTION_15_13())
    OUTLINED_FUNCTION_55_1();
  v4 = a1 + *(int *)(a2 + 24);
  if (*(_QWORD *)(v4 + 24))
    __swift_destroy_boxed_opaque_existential_1(v4);
  if (!OUTLINED_FUNCTION_15_13())
    OUTLINED_FUNCTION_55_1();
  OUTLINED_FUNCTION_26_3();
  OUTLINED_FUNCTION_26_3();
  OUTLINED_FUNCTION_26_3();
  return swift_bridgeObjectRelease();
}

void initializeWithCopy for PrivateCloudComputeRequestLog(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = OUTLINED_FUNCTION_11_1(a1, a2);
  if (OUTLINED_FUNCTION_4_2())
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v3);
  }
  else
  {
    OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16));
    OUTLINED_FUNCTION_2();
  }
  v4 = OUTLINED_FUNCTION_29_1();
  if (v6)
    OUTLINED_FUNCTION_18_4(v4, v5, v6);
  else
    OUTLINED_FUNCTION_28_4(v4, v5);
  if (OUTLINED_FUNCTION_4_2())
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v7);
  }
  else
  {
    OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16));
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_6_29();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_19_7();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_8_6();
}

void assignWithCopy for PrivateCloudComputeRequestLog(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  __int128 *v6;
  uint64_t v7;
  int EnumTagSinglePayload;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v7 = OUTLINED_FUNCTION_11_1(a1, a2);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v5, 1, v7);
  v9 = OUTLINED_FUNCTION_4_2();
  if (EnumTagSinglePayload)
  {
    if (!v9)
    {
      OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16));
      OUTLINED_FUNCTION_2();
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v10 = *(_QWORD *)(v7 - 8);
  if (v9)
  {
    OUTLINED_FUNCTION_12_2(v10);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v11);
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 24));
LABEL_7:
  OUTLINED_FUNCTION_71_1();
  v12 = *((_QWORD *)v6 + 3);
  if (v13)
  {
    if (v12)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)v5, (uint64_t *)v6);
      goto LABEL_14;
    }
    __swift_destroy_boxed_opaque_existential_1(v5);
  }
  else if (v12)
  {
    *(_QWORD *)(v5 + 24) = v12;
    *(_QWORD *)(v5 + 32) = *((_QWORD *)v6 + 4);
    (**(void (***)(uint64_t, __int128 *))(v12 - 8))(v5, v6);
    goto LABEL_14;
  }
  v14 = *v6;
  v15 = v6[1];
  *(_QWORD *)(v5 + 32) = *((_QWORD *)v6 + 4);
  *(_OWORD *)v5 = v14;
  *(_OWORD *)(v5 + 16) = v15;
LABEL_14:
  v16 = __swift_getEnumTagSinglePayload(v2 + v4[7], 1, v7);
  v17 = OUTLINED_FUNCTION_4_2();
  if (!v16)
  {
    v18 = *(_QWORD *)(v7 - 8);
    if (!v17)
    {
      OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 24));
      goto LABEL_20;
    }
    OUTLINED_FUNCTION_12_2(v18);
    goto LABEL_19;
  }
  if (v17)
  {
LABEL_19:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v19);
    goto LABEL_20;
  }
  OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16));
  OUTLINED_FUNCTION_2();
LABEL_20:
  OUTLINED_FUNCTION_6_0(v4[8]);
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_6_0(v4[9]);
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_6_0(v4[10]);
  OUTLINED_FUNCTION_23_3();
  *(_QWORD *)(v2 + v4[11]) = *(_QWORD *)(v3 + v4[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_7();
}

void initializeWithTake for PrivateCloudComputeRequestLog(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = OUTLINED_FUNCTION_11_1(a1, a2);
  if (OUTLINED_FUNCTION_4_2())
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v6);
  }
  else
  {
    OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32));
    OUTLINED_FUNCTION_2();
  }
  v7 = v4[6];
  v8 = v2 + v7;
  v9 = v3 + v7;
  v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  if (OUTLINED_FUNCTION_4_2())
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v11);
  }
  else
  {
    OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32));
    OUTLINED_FUNCTION_2();
  }
  v12 = v4[9];
  *(_OWORD *)(v2 + v4[8]) = *(_OWORD *)(v3 + v4[8]);
  *(_OWORD *)(v2 + v12) = *(_OWORD *)(v3 + v12);
  v13 = v4[11];
  *(_OWORD *)(v2 + v4[10]) = *(_OWORD *)(v3 + v4[10]);
  *(_QWORD *)(v2 + v13) = *(_QWORD *)(v3 + v13);
  OUTLINED_FUNCTION_8_6();
}

void assignWithTake for PrivateCloudComputeRequestLog(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int EnumTagSinglePayload;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v7 = OUTLINED_FUNCTION_11_1(a1, a2);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v5, 1, v7);
  v9 = OUTLINED_FUNCTION_4_2();
  if (EnumTagSinglePayload)
  {
    if (!v9)
    {
      OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32));
      OUTLINED_FUNCTION_2();
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v10 = *(_QWORD *)(v7 - 8);
  if (v9)
  {
    OUTLINED_FUNCTION_12_2(v10);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v11);
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 40));
LABEL_7:
  OUTLINED_FUNCTION_71_1();
  if (v12)
    __swift_destroy_boxed_opaque_existential_1(v5);
  v13 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)v5 = *(_OWORD *)v6;
  *(_OWORD *)(v5 + 16) = v13;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(v6 + 32);
  v14 = __swift_getEnumTagSinglePayload(v2 + v4[7], 1, v7);
  v15 = OUTLINED_FUNCTION_4_2();
  if (!v14)
  {
    v16 = *(_QWORD *)(v7 - 8);
    if (!v15)
    {
      OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 40));
      goto LABEL_15;
    }
    OUTLINED_FUNCTION_12_2(v16);
    goto LABEL_14;
  }
  if (v15)
  {
LABEL_14:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
    OUTLINED_FUNCTION_11_0(v17);
    goto LABEL_15;
  }
  OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32));
  OUTLINED_FUNCTION_2();
LABEL_15:
  OUTLINED_FUNCTION_14(v4[8]);
  OUTLINED_FUNCTION_14(v4[9]);
  OUTLINED_FUNCTION_14(v4[10]);
  *(_QWORD *)(v2 + v4[11]) = *(_QWORD *)(v3 + v4[11]);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_7();
}

uint64_t getEnumTagSinglePayload for PrivateCloudComputeRequestLog()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23FF0CBB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 20), a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 44));
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivateCloudComputeRequestLog()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23FF0CC44(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B8D8);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 20), a2, a2, v8);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 44)) = (a2 - 1);
    OUTLINED_FUNCTION_9();
  }
}

void sub_23FF0CCB8()
{
  unint64_t v0;

  sub_23FE21638();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t destroy for PrivateCloudComputeRequestLog.Attestation()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void initializeWithCopy for PrivateCloudComputeRequestLog.Attestation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_19_7();
  OUTLINED_FUNCTION_9();
}

void assignWithCopy for PrivateCloudComputeRequestLog.Attestation(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9();
}

void assignWithTake for PrivateCloudComputeRequestLog.Attestation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
}

uint64_t getEnumTagSinglePayload for PrivateCloudComputeRequestLog.Attestation(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 48))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivateCloudComputeRequestLog.Attestation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivateCloudComputeRequestLog.Attestation()
{
  return &type metadata for PrivateCloudComputeRequestLog.Attestation;
}

uint64_t OUTLINED_FUNCTION_6_29()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v3 = v2[8];
  v4 = v2[9];
  v5 = (_QWORD *)(v0 + v3);
  v6 = (_QWORD *)(v1 + v3);
  v7 = v6[1];
  *v5 = *v6;
  v5[1] = v7;
  v8 = (_QWORD *)(v0 + v4);
  v9 = (_QWORD *)(v1 + v4);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = v2[10];
  v12 = v2[11];
  v13 = (_QWORD *)(v0 + v11);
  v14 = (_QWORD *)(v1 + v11);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  *(_QWORD *)(v0 + v12) = *(_QWORD *)(v1 + v12);
  return swift_bridgeObjectRetain();
}

__n128 OUTLINED_FUNCTION_29_9()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  __n128 result;

  v2 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 - 64) = *(_OWORD *)v0;
  *(_OWORD *)(v1 - 48) = v2;
  result = *(__n128 *)(v0 + 32);
  *(__n128 *)(v1 - 32) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_35_19()
{
  return PrivateCloudComputeRequestLog.Attestation.hash(into:)();
}

ValueMetadata *type metadata accessor for Library.Databases.IntelligenceFlow.Transcript.Datastream()
{
  return &type metadata for Library.Databases.IntelligenceFlow.Transcript.Datastream;
}

ValueMetadata *type metadata accessor for Library.Databases.IntelligenceFlow.Transcript()
{
  return &type metadata for Library.Databases.IntelligenceFlow.Transcript;
}

unint64_t static Library.Databases.IntelligenceFlow.Transcript.Datastream.Indexes.identifier.getter()
{
  return 0xD00000000000002ELL;
}

uint64_t sub_23FF0D008()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25434B788);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23FF58C28();
  __swift_allocate_value_buffer(v3, qword_25434DEE8);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_25434DEE8);
  sub_23FF58BF8();
  result = __swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(v4, v2, v3);
  __break(1u);
  return result;
}

uint64_t static Library.Databases.IntelligenceFlow.Transcript.Datastream.Indexes.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE17B08(&_MergedGlobals_21, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], (uint64_t)qword_25434DEE8, a1);
}

uint64_t sub_23FF0D104(uint64_t a1)
{
  return sub_23FE17B90(a1, MEMORY[0x24BE0CA80], qword_25434DF00, MEMORY[0x24BE0CA70]);
}

uint64_t static Library.Databases.IntelligenceFlow.Transcript.Datastream.Indexes.domain.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE17B08(&qword_25434DED8, MEMORY[0x24BE0CA80], (uint64_t)qword_25434DF00, a1);
}

uint64_t sub_23FF0D140(uint64_t a1)
{
  return sub_23FE17B90(a1, MEMORY[0x24BE0CA40], qword_25434DF18, MEMORY[0x24BE0CA38]);
}

uint64_t static Library.Databases.IntelligenceFlow.Transcript.Datastream.Indexes.protectionClass.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FE17B08(&qword_25434DEE0, MEMORY[0x24BE0CA40], (uint64_t)qword_25434DF18, a1);
}

uint64_t static Library.Databases.IntelligenceFlow.Transcript.Datastream.Indexes.configuration.getter()
{
  return sub_23FF58FA0();
}

uint64_t static Library.Databases.IntelligenceFlow.Transcript.Datastream.Indexes.materializedViewDefinitions.getter()
{
  uint64_t v0;
  uint64_t *v1;
  id v2;
  id v3;
  uint64_t *v4;
  id v5;
  id v6;
  uint64_t *v7;
  id v8;
  id v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25434B768);
  sub_23FF58C64();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23FF614F0;
  v1 = sub_23FEED1B0();
  v2 = objc_msgSend((id)*v1, sel_createViewSQL);
  OUTLINED_FUNCTION_7_21();
  OUTLINED_FUNCTION_5_17();
  v3 = OUTLINED_FUNCTION_4_18((void *)*v1);
  sub_23FF58FDC();
  OUTLINED_FUNCTION_6_23();
  OUTLINED_FUNCTION_0_23();
  v4 = sub_23FEED224();
  v5 = objc_msgSend((id)*v4, (SEL)&selRef_providerName + 7);
  sub_23FF58FDC();

  v6 = OUTLINED_FUNCTION_4_18((void *)*v4);
  OUTLINED_FUNCTION_7_21();

  sub_23FF58C58();
  v7 = sub_23FEED298();
  v8 = objc_msgSend((id)*v7, sel_createViewSQL);
  OUTLINED_FUNCTION_7_21();
  OUTLINED_FUNCTION_5_17();
  v9 = OUTLINED_FUNCTION_4_18((void *)*v7);
  sub_23FF58FDC();
  OUTLINED_FUNCTION_6_23();
  OUTLINED_FUNCTION_0_23();
  return v0;
}

void static Library.Databases.IntelligenceFlow.Transcript.Datastream.Indexes.attribute(to:block:)(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  sub_23FF0D390(a1, a2, a3);
}

void sub_23FF0D390(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v3;
  char v6;
  uint64_t (*v7)(void);
  uint64_t (*v8)(void);
  uint64_t (*v9)(void);

  if (a1 == 0xD000000000000033 && (OUTLINED_FUNCTION_2_0(), v6) || (OUTLINED_FUNCTION_0() & 1) != 0)
  {
    v7 = (uint64_t (*)(void))OUTLINED_FUNCTION_1_4();
    sub_23FF0D530(v7);
  }
  else if (a1 == 0xD00000000000001CLL && (OUTLINED_FUNCTION_2_0(), v6) || (OUTLINED_FUNCTION_0() & 1) != 0)
  {
    v8 = (uint64_t (*)(void))OUTLINED_FUNCTION_1_4();
    sub_23FF0D558(v8);
  }
  else
  {
    if (a1 != 0xD00000000000001ELL || (OUTLINED_FUNCTION_2_0(), !v6))
    {
      if ((OUTLINED_FUNCTION_0() & 1) == 0)
      {
        a3();
        return;
      }
    }
    v9 = (uint64_t (*)(void))OUTLINED_FUNCTION_1_4();
    sub_23FF0D580(v9);
  }
  if (!v3)
    swift_bridgeObjectRelease();
}

unint64_t sub_23FF0D4A0()
{
  unint64_t result;

  result = qword_25434B778;
  if (!qword_25434B778)
  {
    result = MEMORY[0x24267B784](&protocol conformance descriptor for Library.Databases.IntelligenceFlow.Transcript.Datastream.Indexes, &type metadata for Library.Databases.IntelligenceFlow.Transcript.Datastream.Indexes);
    atomic_store(result, (unint64_t *)&qword_25434B778);
  }
  return result;
}

void sub_23FF0D4E0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  static Library.Databases.IntelligenceFlow.Transcript.Datastream.Indexes.attribute(to:block:)(a1, a2, a3);
}

unint64_t sub_23FF0D4F8()
{
  static Library.Databases.IntelligenceFlow.Transcript.Datastream.Indexes.identifier.getter();
  return 0xD00000000000002ELL;
}

ValueMetadata *type metadata accessor for Library.Databases.IntelligenceFlow.Transcript.Datastream.Indexes()
{
  return &type metadata for Library.Databases.IntelligenceFlow.Transcript.Datastream.Indexes;
}

void sub_23FF0D530(uint64_t (*a1)(void))
{
  OUTLINED_FUNCTION_4_5(a1);
  OUTLINED_FUNCTION_3_8();
}

void sub_23FF0D558(uint64_t (*a1)(void))
{
  OUTLINED_FUNCTION_4_5(a1);
  OUTLINED_FUNCTION_3_8();
}

void sub_23FF0D580(uint64_t (*a1)(void))
{
  OUTLINED_FUNCTION_4_5(a1);
  OUTLINED_FUNCTION_3_8();
}

uint64_t CCHomeDeviceTypeDecode(uint64_t result)
{
  if (result >= 0x2E)
    return 0;
  else
    return result;
}

__CFString *CCHomeEntityTypeAsString(uint64_t a1)
{
  if (a1 < 9)
    return off_2510301D0[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

_BYTE *CCHomeEntityTypeFromString(const void *a1)
{
  _BYTE *result;

  result = bsearch_b(a1, CCHomeEntityTypeFromString_sortedStrings, 8uLL, 8uLL, &__block_literal_global);
  if (result)
    return (_BYTE *)*(unsigned int *)((char *)&CCHomeEntityTypeFromString_sortedEnums
                                    + (((unint64_t)(result - (_BYTE *)CCHomeEntityTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

uint64_t CCHomeEntityTypeDecode(uint64_t result)
{
  if (result >= 9)
    return 0;
  else
    return result;
}

__CFString *CCHomeDeviceTypeAsString(uint64_t a1)
{
  if (a1 < 0x2E)
    return off_251030218[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

_BYTE *CCHomeDeviceTypeFromString(const void *a1)
{
  _BYTE *result;

  result = bsearch_b(a1, CCHomeDeviceTypeFromString_sortedStrings, 0x2DuLL, 8uLL, &__block_literal_global_110);
  if (result)
    return (_BYTE *)*(unsigned int *)((char *)&CCHomeDeviceTypeFromString_sortedEnums
                                    + (((unint64_t)(result - (_BYTE *)CCHomeDeviceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

uint64_t CCMediaEntityTypeDecode(uint64_t result)
{
  if (result >= 0xD)
    return 0;
  else
    return result;
}

__CFString *CCMediaEntityTypeAsString(uint64_t a1)
{
  if (a1 < 0xD)
    return off_251030508[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

_BYTE *CCMediaEntityTypeFromString(const void *a1)
{
  _BYTE *result;

  result = bsearch_b(a1, CCMediaEntityTypeFromString_sortedStrings, 0xCuLL, 8uLL, &__block_literal_global_2726);
  if (result)
    return (_BYTE *)*(unsigned int *)((char *)&CCMediaEntityTypeFromString_sortedEnums
                                    + (((unint64_t)(result - (_BYTE *)CCMediaEntityTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

uint64_t CCPhotosPetTypeDecode(uint64_t result)
{
  if (result >= 3)
    return 0;
  else
    return result;
}

__CFString *CCPhotosPetTypeAsString(uint64_t a1)
{
  if (a1 < 3)
    return off_251030678[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

_BYTE *CCPhotosPetTypeFromString(const void *a1)
{
  _BYTE *result;

  result = bsearch_b(a1, CCPhotosPetTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_2819);
  if (result)
    return (_BYTE *)*(unsigned int *)((char *)&CCPhotosPetTypeFromString_sortedEnums
                                    + (((unint64_t)(result - (_BYTE *)CCPhotosPetTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

uint64_t CCRadioStationSignalTypeDecode(uint64_t result)
{
  if (result >= 6)
    return 0;
  else
    return result;
}

__CFString *CCRadioStationSignalTypeAsString(uint64_t a1)
{
  if (a1 < 6)
    return off_251030728[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

_BYTE *CCRadioStationSignalTypeFromString(const void *a1)
{
  _BYTE *result;

  result = bsearch_b(a1, CCRadioStationSignalTypeFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_3029);
  if (result)
    return (_BYTE *)*(unsigned int *)((char *)&CCRadioStationSignalTypeFromString_sortedEnums
                                    + (((unint64_t)(result
                                                         - (_BYTE *)CCRadioStationSignalTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

uint64_t CCSignificantLocationSubPremiseTypeDecode(uint64_t result)
{
  if (result >= 5)
    return 0;
  else
    return result;
}

__CFString *CCSignificantLocationSubPremiseTypeAsString(uint64_t a1)
{
  if (a1 < 5)
    return off_2510307D8[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

_BYTE *CCSignificantLocationSubPremiseTypeFromString(const void *a1)
{
  _BYTE *result;

  result = bsearch_b(a1, CCSignificantLocationSubPremiseTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_3241);
  if (result)
    return (_BYTE *)*(unsigned int *)((char *)&CCSignificantLocationSubPremiseTypeFromString_sortedEnums
                                    + (((unint64_t)(result
                                                         - (_BYTE *)CCSignificantLocationSubPremiseTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

uint64_t CCSiriCompanionContextAudioSubscriptionStatusDecode(uint64_t result)
{
  if (result >= 4)
    return 0;
  else
    return result;
}

__CFString *CCSiriCompanionContextAudioSubscriptionStatusAsString(uint64_t a1)
{
  if (a1 < 4)
    return off_251030B00[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

_BYTE *CCSiriCompanionContextAudioSubscriptionStatusFromString(const void *a1)
{
  _BYTE *result;

  result = bsearch_b(a1, CCSiriCompanionContextAudioSubscriptionStatusFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_4043);
  if (result)
    return (_BYTE *)*(unsigned int *)((char *)&CCSiriCompanionContextAudioSubscriptionStatusFromString_sortedEnums
                                    + (((unint64_t)(result
                                                         - (_BYTE *)CCSiriCompanionContextAudioSubscriptionStatusFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

__CFString *CCSiriCompanionContextAudioMediaCategoryAsString(uint64_t a1)
{
  if (a1 < 6)
    return off_251030B20[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

_BYTE *CCSiriCompanionContextAudioMediaCategoryFromString(const void *a1)
{
  _BYTE *result;

  result = bsearch_b(a1, CCSiriCompanionContextAudioMediaCategoryFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_20);
  if (result)
    return (_BYTE *)*(unsigned int *)((char *)&CCSiriCompanionContextAudioMediaCategoryFromString_sortedEnums
                                    + (((unint64_t)(result
                                                         - (_BYTE *)CCSiriCompanionContextAudioMediaCategoryFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

uint64_t CCSiriCompanionContextAudioMediaCategoryDecode(uint64_t result)
{
  if (result >= 6)
    return 0;
  else
    return result;
}

uint64_t sub_23FF58B08()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_23FF58B14()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_23FF58B20()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23FF58B2C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23FF58B38()
{
  return MEMORY[0x24BDCDC78]();
}

uint64_t sub_23FF58B44()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23FF58B50()
{
  return MEMORY[0x24BDCDCC8]();
}

uint64_t sub_23FF58B5C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23FF58B68()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_23FF58B74()
{
  return MEMORY[0x24BDCDD00]();
}

uint64_t sub_23FF58B80()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_23FF58B8C()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_23FF58B98()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_23FF58BA4()
{
  return MEMORY[0x24BDCE2F8]();
}

uint64_t sub_23FF58BB0()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23FF58BBC()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_23FF58BC8()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_23FF58BD4()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_23FF58BE0()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23FF58BEC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23FF58BF8()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_23FF58C04()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23FF58C10()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23FF58C1C()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23FF58C28()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23FF58C34()
{
  return MEMORY[0x24BE0CA18]();
}

uint64_t sub_23FF58C40()
{
  return MEMORY[0x24BE0CA28]();
}

uint64_t sub_23FF58C4C()
{
  return MEMORY[0x24BE0CA30]();
}

uint64_t sub_23FF58C58()
{
  return MEMORY[0x24BE0CA58]();
}

uint64_t sub_23FF58C64()
{
  return MEMORY[0x24BE0CA60]();
}

uint64_t sub_23FF58C70()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t sub_23FF58C7C()
{
  return MEMORY[0x24BE5BF90]();
}

uint64_t sub_23FF58C88()
{
  return MEMORY[0x24BE5BF98]();
}

uint64_t sub_23FF58C94()
{
  return MEMORY[0x24BE5BFA8]();
}

uint64_t sub_23FF58CA0()
{
  return MEMORY[0x24BE5BFB0]();
}

uint64_t sub_23FF58CAC()
{
  return MEMORY[0x24BE5BFB8]();
}

uint64_t sub_23FF58CB8()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_23FF58CC4()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_23FF58CD0()
{
  return MEMORY[0x24BE5C018]();
}

uint64_t sub_23FF58CDC()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t sub_23FF58CE8()
{
  return MEMORY[0x24BE5C060]();
}

uint64_t sub_23FF58CF4()
{
  return MEMORY[0x24BE5C070]();
}

uint64_t sub_23FF58D00()
{
  return MEMORY[0x24BE5C080]();
}

uint64_t sub_23FF58D0C()
{
  return MEMORY[0x24BE5C088]();
}

uint64_t sub_23FF58D18()
{
  return MEMORY[0x24BE5C0A0]();
}

uint64_t sub_23FF58D24()
{
  return MEMORY[0x24BE5C0A8]();
}

uint64_t sub_23FF58D30()
{
  return MEMORY[0x24BE5C0B0]();
}

uint64_t sub_23FF58D3C()
{
  return MEMORY[0x24BE5C0C0]();
}

uint64_t sub_23FF58D48()
{
  return MEMORY[0x24BE5C0D0]();
}

uint64_t sub_23FF58D54()
{
  return MEMORY[0x24BE5C0E8]();
}

uint64_t sub_23FF58D60()
{
  return MEMORY[0x24BE5C0F0]();
}

uint64_t sub_23FF58D6C()
{
  return MEMORY[0x24BE5C0F8]();
}

uint64_t sub_23FF58D78()
{
  return MEMORY[0x24BE5C100]();
}

uint64_t sub_23FF58D84()
{
  return MEMORY[0x24BE5C108]();
}

uint64_t sub_23FF58D90()
{
  return MEMORY[0x24BE5C118]();
}

uint64_t sub_23FF58D9C()
{
  return MEMORY[0x24BE5C128]();
}

uint64_t sub_23FF58DA8()
{
  return MEMORY[0x24BE5C138]();
}

uint64_t sub_23FF58DB4()
{
  return MEMORY[0x24BE5C160]();
}

uint64_t sub_23FF58DC0()
{
  return MEMORY[0x24BE5C188]();
}

uint64_t sub_23FF58DCC()
{
  return MEMORY[0x24BE5C190]();
}

uint64_t sub_23FF58DD8()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t sub_23FF58DE4()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_23FF58DF0()
{
  return MEMORY[0x24BE5C1C0]();
}

uint64_t sub_23FF58DFC()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_23FF58E08()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t sub_23FF58E14()
{
  return MEMORY[0x24BE5C270]();
}

uint64_t sub_23FF58E20()
{
  return MEMORY[0x24BE5C278]();
}

uint64_t sub_23FF58E2C()
{
  return MEMORY[0x24BE5C280]();
}

uint64_t sub_23FF58E38()
{
  return MEMORY[0x24BE5C288]();
}

uint64_t sub_23FF58E44()
{
  return MEMORY[0x24BE5C298]();
}

uint64_t sub_23FF58E50()
{
  return MEMORY[0x24BE5C2A0]();
}

uint64_t sub_23FF58E5C()
{
  return MEMORY[0x24BE5C2A8]();
}

uint64_t sub_23FF58E68()
{
  return MEMORY[0x24BE5C2B0]();
}

uint64_t sub_23FF58E74()
{
  return MEMORY[0x24BE5C2C0]();
}

uint64_t sub_23FF58E80()
{
  return MEMORY[0x24BE5C2C8]();
}

uint64_t sub_23FF58E8C()
{
  return MEMORY[0x24BE5C2D0]();
}

uint64_t sub_23FF58E98()
{
  return MEMORY[0x24BE5C2D8]();
}

uint64_t sub_23FF58EA4()
{
  return MEMORY[0x24BE5C2E8]();
}

uint64_t sub_23FF58EB0()
{
  return MEMORY[0x24BE5C2F0]();
}

uint64_t sub_23FF58EBC()
{
  return MEMORY[0x24BE5C2F8]();
}

uint64_t sub_23FF58EC8()
{
  return MEMORY[0x24BE5C310]();
}

uint64_t sub_23FF58ED4()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t sub_23FF58EE0()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t sub_23FF58EEC()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t sub_23FF58EF8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23FF58F04()
{
  return MEMORY[0x24BEE78C8]();
}

uint64_t sub_23FF58F10()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23FF58F1C()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_23FF58F28()
{
  return MEMORY[0x24BDB9410]();
}

uint64_t sub_23FF58F34()
{
  return MEMORY[0x24BDB9A28]();
}

uint64_t sub_23FF58F40()
{
  return MEMORY[0x24BDB9A30]();
}

uint64_t sub_23FF58F4C()
{
  return MEMORY[0x24BDB9A38]();
}

uint64_t sub_23FF58F58()
{
  return MEMORY[0x24BDB9AB0]();
}

uint64_t sub_23FF58F64()
{
  return MEMORY[0x24BDB9AC0]();
}

uint64_t sub_23FF58F70()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23FF58F7C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23FF58F88()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23FF58F94()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23FF58FA0()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_23FF58FAC()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23FF58FB8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23FF58FC4()
{
  return MEMORY[0x24BDCF880]();
}

uint64_t sub_23FF58FD0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23FF58FDC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23FF58FE8()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_23FF58FF4()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_23FF59000()
{
  return MEMORY[0x24BDCFAC0]();
}

uint64_t sub_23FF5900C()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23FF59018()
{
  return MEMORY[0x24BDCFAD8]();
}

uint64_t sub_23FF59024()
{
  return MEMORY[0x24BDCFAE8]();
}

uint64_t sub_23FF59030()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23FF5903C()
{
  return MEMORY[0x24BEE0A40]();
}

uint64_t sub_23FF59048()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23FF59054()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23FF59060()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t sub_23FF5906C()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t sub_23FF59078()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23FF59084()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23FF59090()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23FF5909C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23FF590A8()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23FF590B4()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23FF590C0()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23FF590CC()
{
  return MEMORY[0x24BEE11A8]();
}

uint64_t sub_23FF590D8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23FF590E4()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23FF590F0()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_23FF590FC()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_23FF59108()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_23FF59114()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_23FF59120()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23FF5912C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23FF59138()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23FF59144()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_23FF59150()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23FF5915C()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_23FF59168()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23FF59174()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23FF59180()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23FF5918C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23FF59198()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t sub_23FF591A4()
{
  return MEMORY[0x24BEE24F8]();
}

uint64_t sub_23FF591B0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23FF591BC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23FF591C8()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23FF591D4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23FF591E0()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_23FF591EC()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_23FF591F8()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_23FF59204()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_23FF59210()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23FF5921C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23FF59228()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23FF59234()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23FF59240()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23FF5924C()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23FF59258()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23FF59264()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23FF59270()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23FF5927C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23FF59288()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23FF59294()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23FF592A0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23FF592AC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23FF592B8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23FF592C4()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23FF592D0()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23FF592DC()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_23FF592E8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23FF592F4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23FF59300()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23FF5930C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23FF59318()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23FF59324()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t BMEventBookmarkSQLColumns()
{
  return MEMORY[0x24BE0CA90]();
}

uint64_t BMEventTimestampSQLColumn()
{
  return MEMORY[0x24BE0CA98]();
}

uint64_t CCInvalidBufferErrorForMessage()
{
  return MEMORY[0x24BE15548]();
}

uint64_t CCPBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE15550]();
}

uint64_t CCPBDataWriterWriteDataField()
{
  return MEMORY[0x24BE15558]();
}

uint64_t CCPBDataWriterWriteDoubleField()
{
  return MEMORY[0x24BE15560]();
}

uint64_t CCPBDataWriterWriteFloatField()
{
  return MEMORY[0x24BE15568]();
}

uint64_t CCPBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE15570]();
}

uint64_t CCPBDataWriterWriteInt64Field()
{
  return MEMORY[0x24BE15578]();
}

uint64_t CCPBDataWriterWriteRepeatedEnumField()
{
  return MEMORY[0x24BE15580]();
}

uint64_t CCPBDataWriterWriteRepeatedFloatField()
{
  return MEMORY[0x24BE15588]();
}

uint64_t CCPBDataWriterWriteRepeatedInt64Field()
{
  return MEMORY[0x24BE15590]();
}

uint64_t CCPBDataWriterWriteRepeatedUInt32Field()
{
  return MEMORY[0x24BE15598]();
}

uint64_t CCPBDataWriterWriteStringField()
{
  return MEMORY[0x24BE155A0]();
}

uint64_t CCPBDataWriterWriteUint32Field()
{
  return MEMORY[0x24BE155A8]();
}

uint64_t CCPBReaderAppendRepeatedEnumFieldValues()
{
  return MEMORY[0x24BE155B0]();
}

uint64_t CCPBReaderAppendRepeatedFloatFieldValues()
{
  return MEMORY[0x24BE155B8]();
}

uint64_t CCPBReaderAppendRepeatedInt64FieldValues()
{
  return MEMORY[0x24BE155C0]();
}

uint64_t CCPBReaderAppendRepeatedUInt32FieldValues()
{
  return MEMORY[0x24BE155C8]();
}

uint64_t CCPBReaderReadData()
{
  return MEMORY[0x24BE155D0]();
}

uint64_t CCPBReaderReadDataNoCopy()
{
  return MEMORY[0x24BE155D8]();
}

uint64_t CCPBReaderReadStringNoCopy()
{
  return MEMORY[0x24BE155E0]();
}

uint64_t CCPBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE155E8]();
}

uint64_t CCSetError()
{
  return MEMORY[0x24BE15600]();
}

uint64_t CCSkipFieldErrorForMessage()
{
  return MEMORY[0x24BE15610]();
}

uint64_t CCValidateArrayValues()
{
  return MEMORY[0x24BE15628]();
}

uint64_t CCValidateEnumField()
{
  return MEMORY[0x24BE15630]();
}

uint64_t CCValidateIsInstanceOfExpectedClass()
{
  return MEMORY[0x24BE15638]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
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

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x24BDAD318](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocEmptyBox()
{
  return MEMORY[0x24BEE4B60]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}


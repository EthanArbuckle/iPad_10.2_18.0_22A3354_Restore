uint64_t sub_23D6453E8(void (*a1)(uint64_t, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t *);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = v3;
  v18 = a1;
  v19 = a2;
  v6 = type metadata accessor for HashAndCipher();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a3 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  if (v10)
  {
    v21 = MEMORY[0x24BEE4AF8];
    sub_23D5DE334(0, v10, 0);
    v11 = v21;
    v12 = *(_QWORD *)(type metadata accessor for GKCrypto_GroupHandle.CiphertextAndTag(0) - 8);
    v13 = a3 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    v17 = *(_QWORD *)(v12 + 72);
    while (1)
    {
      v18(v13, &v20);
      if (v4)
        break;
      v4 = 0;
      v21 = v11;
      v15 = *(_QWORD *)(v11 + 16);
      v14 = *(_QWORD *)(v11 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_23D5DE334(v14 > 1, v15 + 1, 1);
        v11 = v21;
      }
      *(_QWORD *)(v11 + 16) = v15 + 1;
      sub_23D5E7F64((uint64_t)v9, v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v15, (uint64_t (*)(_QWORD))type metadata accessor for HashAndCipher);
      v13 += v17;
      if (!--v10)
        return v11;
    }
    swift_release();
  }
  return v11;
}

unint64_t sub_23D645560(void (*a1)(_QWORD), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  char *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24;
  void (*v25)(_QWORD);
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;

  v30 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_256C7BF60);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_23D66C054();
  v9 = *(_QWORD *)(v27 - 8);
  v10 = MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v26 = (char *)&v24 - v12;
  v13 = *(_QWORD *)(a3 + 16);
  if (!v13)
    return MEMORY[0x24BEE4AF8];
  v14 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256C79A08) - 8);
  v15 = a3 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
  v28 = *(_QWORD *)(v14 + 72);
  v24 = a3;
  swift_bridgeObjectRetain();
  v16 = MEMORY[0x24BEE4AF8];
  v25 = a1;
  v17 = v27;
  do
  {
    a1(v15);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v16;
    }
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v17) == 1)
    {
      sub_23D5AEF8C((uint64_t)v8, qword_256C7BF60);
    }
    else
    {
      v18 = v9;
      v19 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      v20 = v26;
      v19(v26, v8, v17);
      v19(v29, v20, v17);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v16 = sub_23D62B744(0, *(_QWORD *)(v16 + 16) + 1, 1, v16);
      v22 = *(_QWORD *)(v16 + 16);
      v21 = *(_QWORD *)(v16 + 24);
      if (v22 >= v21 >> 1)
        v16 = sub_23D62B744(v21 > 1, v22 + 1, 1, v16);
      *(_QWORD *)(v16 + 16) = v22 + 1;
      v17 = v27;
      v19((char *)(v16+ ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80))+ *(_QWORD *)(v18 + 72) * v22), v29, v27);
      v9 = v18;
      a1 = v25;
    }
    v15 += v28;
    --v13;
  }
  while (v13);
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_23D6457DC@<X0>(unint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X8>)
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
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t result;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  os_log_type_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char *v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  char v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  os_log_type_t v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  os_log_type_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  char *v81;
  _QWORD *v82;
  uint64_t v83;
  os_log_type_t v84;
  NSObject *v85;
  os_log_type_t v86;
  uint8_t *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  __int128 v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  char *v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  void (*v112)(char *, uint64_t);
  uint64_t v113;
  uint64_t v114;
  os_log_type_t v115;
  NSObject *v116;
  _BOOL4 v117;
  uint64_t v118;
  uint8_t *v119;
  uint64_t v120;
  char *v121;
  unint64_t v122;
  unint64_t v123;
  void (*v124)(char *, uint64_t);
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  unint64_t v129;
  _QWORD *v130;
  char *v131;
  unint64_t v132;
  uint64_t (*v133)(char *, uint64_t);
  unint64_t v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  char *v145;
  char *v146;
  uint64_t v147;
  uint64_t *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  unint64_t v153;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;
  uint64_t v157;
  __int128 v158;
  __int128 v159;
  uint64_t v160;
  uint64_t v161;

  v155 = a6;
  v138 = a4;
  v137 = a3;
  v153 = a1;
  v135 = a7;
  v140 = sub_23D66C054();
  v139 = *(_QWORD *)(v140 - 8);
  v9 = MEMORY[0x24BDAC7A8](v140);
  v141 = (char *)&v128 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v144 = (char *)&v128 - v11;
  v12 = sub_23D66C024();
  v142 = *(_QWORD *)(v12 - 8);
  v143 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v136 = (char *)&v128 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v145 = (char *)&v128 - v15;
  v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79A08);
  v147 = *(_QWORD *)(v149 - 8);
  MEMORY[0x24BDAC7A8](v149);
  v148 = (uint64_t *)((char *)&v128 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v154 = sub_23D66C210();
  v151 = *(_QWORD *)(v154 - 8);
  v17 = MEMORY[0x24BDAC7A8](v154);
  v146 = (char *)&v128 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v152 = (char *)&v128 - v19;
  v20 = sub_23D66C0C0();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v128 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_23D66BE80();
  MEMORY[0x24BDAC7A8](v24);
  v25 = type metadata accessor for GKCrypto_GroupHandle(0);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (uint64_t *)((char *)&v128 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  v28 = a2[1];
  v150 = *a2;
  v160 = 0;
  v158 = 0u;
  v159 = 0u;
  sub_23D5AFA60(a5, v155);
  sub_23D66BE74();
  sub_23D5AE928(&qword_256C7A4A8, type metadata accessor for GKCrypto_GroupHandle, (uint64_t)&unk_23D67299C);
  v29 = v161;
  result = sub_23D66BF10();
  if (v29)
    return result;
  v31 = v28;
  v155 = v21;
  v161 = v20;
  v32 = v27[3];
  *(_QWORD *)&v158 = v27[2];
  *((_QWORD *)&v158 + 1) = v32;
  sub_23D5AFA60(v158, v32);
  v33 = sub_23D5E6898();
  v34 = sub_23D66C0A8();
  v35 = v23;
  v36 = v27[4];
  if (!*(_QWORD *)(v36 + 16))
  {
    if (qword_256C78B10 != -1)
      swift_once();
    v37 = sub_23D66BFDC();
    __swift_project_value_buffer(v37, (uint64_t)qword_256C88B78);
    v38 = sub_23D66C588();
    v39 = sub_23D66BFC4();
    v40 = v38;
    if (os_log_type_enabled(v39, v38))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_23D5A8000, v39, v40, "ciphertext missing in GroupHandleBlob", v41, 2u);
      MEMORY[0x242636844](v41, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D618E34();
    swift_allocError();
    *(_WORD *)v42 = 278;
    *(_OWORD *)(v42 + 8) = xmmword_23D6744C0;
    *(_QWORD *)(v42 + 24) = 0x800000023D67A7B0;
    *(_QWORD *)(v42 + 32) = 0xD00000000000005CLL;
    *(_QWORD *)(v42 + 40) = 0x800000023D67A750;
    swift_willThrow();
    goto LABEL_24;
  }
  v134 = v31;
  MEMORY[0x24BDAC7A8](v34);
  v126 = (uint64_t)v23;
  swift_bridgeObjectRetain();
  v43 = sub_23D644E78((void (*)(uint64_t, uint64_t *))sub_23D64C6B0, (uint64_t)(&v128 - 4), v36);
  v132 = v33;
  swift_bridgeObjectRelease();
  v44 = v152;
  sub_23D66C228();
  v45 = sub_23D66C1F8();
  v47 = v46;
  sub_23D5AFD60(v45, v46);
  v49 = v48;
  v51 = v50;
  sub_23D5DDA20(v45, v47);
  v133 = *(uint64_t (**)(char *, uint64_t))(v151 + 8);
  v52 = v133(v44, v154);
  MEMORY[0x24BDAC7A8](v52);
  v151 = v49;
  v126 = v49;
  v127 = v51;
  v53 = sub_23D64C6D4(v43, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23D64C6CC);
  swift_bridgeObjectRelease();
  v54 = *(_QWORD *)(v53 + 16);
  if (!v54)
  {
    swift_bridgeObjectRelease();
    if (qword_256C78B10 != -1)
      swift_once();
    v69 = sub_23D66BFDC();
    __swift_project_value_buffer(v69, (uint64_t)qword_256C88B78);
    v70 = sub_23D66C588();
    v71 = sub_23D66BFC4();
    v72 = v70;
    if (os_log_type_enabled(v71, v70))
    {
      v73 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v73 = 0;
      _os_log_impl(&dword_23D5A8000, v71, v72, "missing user public key in GroupHandleBlob", v73, 2u);
      MEMORY[0x242636844](v73, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D618E34();
    swift_allocError();
    *(_WORD *)v74 = 279;
    v75 = xmmword_23D6744A0;
    goto LABEL_23;
  }
  if (v54 != 1)
  {
    swift_bridgeObjectRelease();
    if (qword_256C78B10 != -1)
      swift_once();
    v76 = sub_23D66BFDC();
    __swift_project_value_buffer(v76, (uint64_t)qword_256C88B78);
    v77 = sub_23D66C588();
    v78 = sub_23D66BFC4();
    v79 = v77;
    if (os_log_type_enabled(v78, v77))
    {
      v80 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v80 = 0;
      _os_log_impl(&dword_23D5A8000, v78, v79, "user public key duplicated in GroupHandleBlob", v80, 2u);
      MEMORY[0x242636844](v80, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D618E34();
    swift_allocError();
    *(_WORD *)v74 = 280;
    v75 = xmmword_23D6744B0;
LABEL_23:
    *(_OWORD *)(v74 + 8) = v75;
    *(_QWORD *)(v74 + 24) = 0x800000023D67A7B0;
    *(_QWORD *)(v74 + 32) = 0xD00000000000005CLL;
    *(_QWORD *)(v74 + 40) = 0x800000023D67A750;
    swift_willThrow();
    sub_23D5DDA20(v151, v51);
LABEL_24:
    sub_23D5E6950((uint64_t)v27, type metadata accessor for GKCrypto_GroupHandle);
    return (*(uint64_t (**)(char *, uint64_t))(v155 + 8))(v35, v161);
  }
  v129 = v51;
  v130 = v27;
  v131 = v35;
  v55 = v148;
  sub_23D5AEF48(v53 + ((*(unsigned __int8 *)(v147 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v147 + 80)), (uint64_t)v148, &qword_256C79A08);
  sub_23D5DDA20(*v55, v55[1]);
  v56 = v53;
  v57 = v55[2];
  v58 = v55[3];
  v59 = v150;
  v60 = (char *)v55 + *(int *)(v149 + 64);
  v61 = v134;
  sub_23D5AFA60(v150, v134);
  sub_23D5AFD60(v59, v61);
  v63 = v62;
  v65 = v64;
  sub_23D5DDA20(v59, v61);
  sub_23D5E6578(v57, v58);
  LOBYTE(v59) = v66;
  sub_23D5DDA20(v57, v58);
  sub_23D5DDA20(v63, v65);
  v67 = sub_23D66C108();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v67 - 8) + 8))(v60, v67);
  if ((v59 & 1) != 0)
  {
    v149 = v56;
    v68 = v130[1];
    *(_QWORD *)&v158 = *v130;
    *((_QWORD *)&v158 + 1) = v68;
    sub_23D5AFA60(v158, v68);
    sub_23D66C1EC();
    v89 = v145;
    sub_23D66C21C();
    v90 = sub_23D66C1D4();
    v92 = v91;
    v93 = v152;
    sub_23D66C228();
    v94 = sub_23D66C1D4();
    v96 = v95;
    v133(v93, v154);
    *(_QWORD *)&v158 = v90;
    *((_QWORD *)&v158 + 1) = v92;
    sub_23D5AFA60(v90, v92);
    sub_23D5AFA60(v94, v96);
    sub_23D64C120(v94, v96);
    sub_23D5DDA20(v94, v96);
    sub_23D5DDA20(v94, v96);
    sub_23D5DDA20(v90, v92);
    v97 = v158;
    (*(void (**)(char *, char *, uint64_t))(v142 + 16))(v136, v89, v143);
    sub_23D5AE928(&qword_256C7BF50, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6380], MEMORY[0x24BDC6360]);
    v98 = v141;
    sub_23D66C03C();
    v148 = (uint64_t *)v97;
    v158 = v97;
    v153 = *((_QWORD *)&v97 + 1);
    v99 = v137;
    v100 = v138;
    v156 = v137;
    v157 = v138;
    sub_23D66C354();
    sub_23D5AE928((unint64_t *)&qword_256C79AC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8], MEMORY[0x24BDC6AE8]);
    v126 = v132;
    v127 = v132;
    v101 = v144;
    sub_23D66C12C();
    v102 = v139;
    v103 = v98;
    v104 = v89;
    v105 = v140;
    v152 = *(char **)(v139 + 8);
    v106 = ((uint64_t (*)(char *, uint64_t))v152)(v103, v140);
    MEMORY[0x24BDAC7A8](v106);
    *(&v128 - 4) = (uint64_t)v101;
    *(&v128 - 3) = v99;
    v126 = v100;
    v107 = sub_23D645560((void (*)(_QWORD))sub_23D64C8B4, (uint64_t)(&v128 - 6), v149);
    swift_bridgeObjectRelease();
    v108 = v104;
    v109 = *(_QWORD *)(v107 + 16);
    if (v109 == 1)
    {
      v110 = v141;
      (*(void (**)(char *, unint64_t, uint64_t))(v102 + 16))(v141, v107 + ((*(unsigned __int8 *)(v102 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80)), v105);
      v111 = swift_bridgeObjectRelease();
      MEMORY[0x24BDAC7A8](v111);
      v126 = v150;
      v127 = v134;
      sub_23D66C030();
      sub_23D5DDA20(v151, v129);
      sub_23D5DDA20((uint64_t)v148, v153);
      v112 = (void (*)(char *, uint64_t))v152;
      ((void (*)(char *, uint64_t))v152)(v110, v105);
      (*(void (**)(char *, uint64_t))(v142 + 8))(v108, v143);
      v133(v146, v154);
      sub_23D5E6950((uint64_t)v130, type metadata accessor for GKCrypto_GroupHandle);
      v112(v144, v105);
      return (*(uint64_t (**)(char *, uint64_t))(v155 + 8))(v131, v161);
    }
    else
    {
      v113 = (uint64_t)v148;
      if (qword_256C78B10 != -1)
        swift_once();
      v114 = sub_23D66BFDC();
      __swift_project_value_buffer(v114, (uint64_t)qword_256C88B78);
      v115 = sub_23D66C588();
      swift_bridgeObjectRetain();
      v116 = sub_23D66BFC4();
      v117 = os_log_type_enabled(v116, v115);
      v118 = v142;
      if (v117)
      {
        v119 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v119 = 134217984;
        swift_bridgeObjectRelease();
        *(_QWORD *)&v158 = v109;
        v120 = v140;
        sub_23D66C5D0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23D5A8000, v116, v115, "failed to decrypt GroupHandleBlob, got %ld keys", v119, 0xCu);
        MEMORY[0x242636844](v119, -1, -1);

        v121 = v131;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v121 = v131;
        v120 = v105;
      }
      v122 = v155;
      v123 = v129;
      v124 = (void (*)(char *, uint64_t))v133;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
      sub_23D618E34();
      swift_allocError();
      *(_WORD *)v125 = 282;
      *(_OWORD *)(v125 + 8) = xmmword_23D674490;
      *(_QWORD *)(v125 + 24) = 0x800000023D67A7B0;
      *(_QWORD *)(v125 + 32) = 0xD00000000000005CLL;
      *(_QWORD *)(v125 + 40) = 0x800000023D67A750;
      swift_willThrow();
      sub_23D5DDA20(v151, v123);
      sub_23D5DDA20(v113, v153);
      (*(void (**)(char *, uint64_t))(v118 + 8))(v145, v143);
      v124(v146, v154);
      sub_23D5E6950((uint64_t)v130, type metadata accessor for GKCrypto_GroupHandle);
      ((void (*)(char *, uint64_t))v152)(v144, v120);
      return (*(uint64_t (**)(char *, uint64_t))(v122 + 8))(v121, v161);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    v81 = v131;
    v82 = v130;
    if (qword_256C78B10 != -1)
      swift_once();
    v83 = sub_23D66BFDC();
    __swift_project_value_buffer(v83, (uint64_t)qword_256C88B78);
    v84 = sub_23D66C588();
    v85 = sub_23D66BFC4();
    v86 = v84;
    if (os_log_type_enabled(v85, v84))
    {
      v87 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v87 = 0;
      _os_log_impl(&dword_23D5A8000, v85, v86, "user public key does not match hint in GroupHandleBlob", v87, 2u);
      MEMORY[0x242636844](v87, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D618E34();
    swift_allocError();
    *(_WORD *)v88 = 281;
    *(_OWORD *)(v88 + 8) = xmmword_23D674480;
    *(_QWORD *)(v88 + 24) = 0x800000023D67A7B0;
    *(_QWORD *)(v88 + 32) = 0xD00000000000005CLL;
    *(_QWORD *)(v88 + 40) = 0x800000023D67A750;
    swift_willThrow();
    sub_23D5DDA20(v151, v129);
    sub_23D5E6950((uint64_t)v82, type metadata accessor for GKCrypto_GroupHandle);
    return (*(uint64_t (**)(char *, uint64_t))(v155 + 8))(v81, v161);
  }
}

uint64_t sub_23D646874(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
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
  uint64_t *v18;
  uint64_t v19;
  char *v20;
  uint64_t result;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  os_log_type_t v32;
  NSObject *v33;
  os_log_type_t v34;
  _BOOL4 v35;
  uint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  __int128 v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  os_log_type_t v51;
  NSObject *v52;
  os_log_type_t v53;
  _BOOL4 v54;
  uint8_t *v55;
  uint64_t (*v56)(char *, uint64_t);
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  os_log_type_t v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  _QWORD v71[2];
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  _OWORD v84[2];
  uint64_t v85;

  v82 = a7;
  v80 = a1;
  v81 = a6;
  v76 = a5;
  v77 = a4;
  v78 = a2;
  v79 = sub_23D66C210();
  v8 = *(_QWORD *)(v79 - 8);
  MEMORY[0x24BDAC7A8](v79);
  v10 = (char *)v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23D66C0C0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23D66BE80();
  MEMORY[0x24BDAC7A8](v15);
  v16 = type metadata accessor for GKCrypto_GroupHandle(0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (_QWORD *)((char *)v71 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = *a3;
  *(_QWORD *)&v84[0] = v19;
  v20 = v83;
  result = sub_23D647918((uint64_t *)v84);
  if (!v20)
  {
    v71[1] = v19;
    v72 = v10;
    v73 = v8;
    v74 = v12;
    v83 = v14;
    v75 = v11;
    v85 = 0;
    memset(v84, 0, sizeof(v84));
    v22 = v80;
    sub_23D5AFA60(v81, v82);
    sub_23D66BE74();
    sub_23D5AE928(&qword_256C7A4A8, type metadata accessor for GKCrypto_GroupHandle, (uint64_t)&unk_23D67299C);
    sub_23D66BF10();
    v23 = v18[3];
    *(_QWORD *)&v84[0] = v18[2];
    *((_QWORD *)&v84[0] + 1) = v23;
    sub_23D5AFA60(*(uint64_t *)&v84[0], v23);
    sub_23D5E6898();
    v24 = v83;
    sub_23D66C0A8();
    if (*(_QWORD *)(v18[4] + 16))
    {
      v25 = v72;
      sub_23D66C228();
      v26 = sub_23D66C1E0();
      v28 = v27;
      (*(void (**)(char *, uint64_t))(v73 + 8))(v25, v79);
      v82 = (unint64_t)v18;
      v29 = *v18;
      v30 = v18[1];
      sub_23D5AFA60(v29, v30);
      if (v28 >> 60 == 15)
      {
        sub_23D5E725C(v26, v28);
        sub_23D5E725C(v29, v30);
      }
      else
      {
        sub_23D5E7284(v26, v28);
        sub_23D5E6578(v26, v28);
        v41 = v40;
        sub_23D5DDA20(v29, v30);
        sub_23D5E725C(v26, v28);
        sub_23D5E725C(v26, v28);
        if ((v41 & 1) != 0)
        {
          v42 = swift_bridgeObjectRetain();
          v43 = sub_23D644FF4(v42);
          swift_bridgeObjectRelease();
          *(_QWORD *)&v84[0] = v43;
          v44 = sub_23D647870((uint64_t *)v84, &qword_256C79AD8, (uint64_t (*)(uint64_t))sub_23D644840, (uint64_t)sub_23D644648);
          v45 = *(_QWORD *)&v84[0];
          MEMORY[0x24BDAC7A8](v44);
          v46 = v77;
          v71[-6] = v22;
          v71[-5] = v46;
          v47 = v78;
          v71[-4] = v76;
          v71[-3] = v47;
          v71[-2] = v24;
          v48 = sub_23D64C338(v45, (void (*)(uint64_t, uint64_t))sub_23D64C8D0, (uint64_t)&v71[-8]);
          v49 = v75;
          v59 = v48;
          v60 = swift_bridgeObjectRelease();
          v61 = *(_QWORD *)(v82 + 32);
          MEMORY[0x24BDAC7A8](v60);
          v71[-2] = v24;
          swift_bridgeObjectRetain();
          v62 = sub_23D6453E8((void (*)(uint64_t, uint64_t *))sub_23D64C8F0, (uint64_t)&v71[-4], v61);
          swift_bridgeObjectRelease();
          v63 = sub_23D608298(v62, v59);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v63 & 1) != 0)
          {
            sub_23D5E6950(v82, type metadata accessor for GKCrypto_GroupHandle);
            v56 = *(uint64_t (**)(char *, uint64_t))(v74 + 8);
          }
          else
          {
            v64 = v74;
            if (qword_256C78B10 != -1)
              swift_once();
            v65 = sub_23D66BFDC();
            __swift_project_value_buffer(v65, (uint64_t)qword_256C88B78);
            v66 = sub_23D66C588();
            v67 = sub_23D66BFC4();
            v68 = v66;
            if (os_log_type_enabled(v67, v66))
            {
              v69 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v69 = 0;
              _os_log_impl(&dword_23D5A8000, v67, v68, "mismatch ciphertext in generated GroupHandleBlob", v69, 2u);
              MEMORY[0x242636844](v69, -1, -1);
            }

            __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
            sub_23D618E34();
            swift_allocError();
            *(_WORD *)v70 = 288;
            *(_OWORD *)(v70 + 8) = xmmword_23D6744D0;
            *(_QWORD *)(v70 + 24) = 0x800000023D67A810;
            *(_QWORD *)(v70 + 32) = 0xD00000000000005CLL;
            *(_QWORD *)(v70 + 40) = 0x800000023D67A750;
            swift_willThrow();
            sub_23D5E6950(v82, type metadata accessor for GKCrypto_GroupHandle);
            v56 = *(uint64_t (**)(char *, uint64_t))(v64 + 8);
          }
          v57 = v24;
          v58 = v49;
          return v56(v57, v58);
        }
      }
      v36 = v75;
      if (qword_256C78B10 != -1)
        swift_once();
      v50 = sub_23D66BFDC();
      __swift_project_value_buffer(v50, (uint64_t)qword_256C88B78);
      v51 = sub_23D66C588();
      v52 = sub_23D66BFC4();
      v53 = v51;
      v54 = os_log_type_enabled(v52, v51);
      v18 = (uint64_t *)v82;
      if (v54)
      {
        v55 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v55 = 0;
        _os_log_impl(&dword_23D5A8000, v52, v53, "inconsistent ephemeral keys when verifying GroupHandleBlob", v55, 2u);
        MEMORY[0x242636844](v55, -1, -1);
      }

      __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
      sub_23D618E34();
      swift_allocError();
      *(_WORD *)v38 = 289;
      v39 = xmmword_23D6744E0;
    }
    else
    {
      if (qword_256C78B10 != -1)
        swift_once();
      v31 = sub_23D66BFDC();
      __swift_project_value_buffer(v31, (uint64_t)qword_256C88B78);
      v32 = sub_23D66C588();
      v33 = sub_23D66BFC4();
      v34 = v32;
      v35 = os_log_type_enabled(v33, v32);
      v36 = v75;
      if (v35)
      {
        v37 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_23D5A8000, v33, v34, "ciphertext missing in GroupHandleBlob", v37, 2u);
        MEMORY[0x242636844](v37, -1, -1);
      }

      __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
      sub_23D618E34();
      swift_allocError();
      *(_WORD *)v38 = 278;
      v39 = xmmword_23D6744F0;
    }
    *(_OWORD *)(v38 + 8) = v39;
    *(_QWORD *)(v38 + 24) = 0x800000023D67A810;
    *(_QWORD *)(v38 + 32) = 0xD00000000000005CLL;
    *(_QWORD *)(v38 + 40) = 0x800000023D67A750;
    swift_willThrow();
    sub_23D5E6950((uint64_t)v18, type metadata accessor for GKCrypto_GroupHandle);
    v56 = *(uint64_t (**)(char *, uint64_t))(v74 + 8);
    v57 = v24;
    v58 = v36;
    return v56(v57, v58);
  }
  return result;
}

uint64_t sub_23D6470B4(uint64_t a1, unint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *boxed_opaque_existential_1;
  void (*v40)(uint64_t *, char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t result;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  _OWORD *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  __int128 v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98[3];
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;

  v94 = a1;
  v92 = a2;
  v93 = a5;
  *(_QWORD *)&v83 = a4;
  v86 = sub_23D66C108();
  v91 = *(_QWORD *)(v86 - 8);
  MEMORY[0x24BDAC7A8](v86);
  v85 = (char *)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79A08);
  v80 = *(_QWORD *)(v90 - 8);
  v7 = MEMORY[0x24BDAC7A8](v90);
  v89 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v88 = (uint64_t *)((char *)&v73 - v9);
  v84 = type metadata accessor for GKCrypto_GroupHandle.CiphertextAndTag(0);
  v87 = *(_QWORD *)(v84 - 8);
  v10 = MEMORY[0x24BDAC7A8](v84);
  v12 = (char *)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v101 = (uint64_t)&v73 - v13;
  v82 = sub_23D66C210();
  v14 = *(_QWORD *)(v82 - 8);
  MEMORY[0x24BDAC7A8](v82);
  v16 = (char *)&v73 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for GKCrypto_GroupHandle(0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v73 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_23D66C0C0();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98[0] = *a3;
  v24 = v95;
  sub_23D647918(v98);
  if (v24)
    return v21;
  v81 = (uint64_t *)v16;
  v95 = v14;
  v76 = v17;
  v79 = v21;
  v78 = v20;
  v77 = v19;
  sub_23D66C0B4();
  v25 = swift_bridgeObjectRetain();
  v98[0] = sub_23D650C3C(v25);
  sub_23D647870(v98, &qword_256C799A0, (uint64_t (*)(uint64_t))sub_23D6448FC, (uint64_t)sub_23D644654);
  v26 = swift_bridgeObjectRelease();
  v27 = v98[0];
  MEMORY[0x24BDAC7A8](v26);
  v28 = v83;
  *(&v73 - 6) = v94;
  *(&v73 - 5) = v28;
  v29 = v92;
  *(&v73 - 4) = v93;
  *(&v73 - 3) = v29;
  *(&v73 - 2) = (uint64_t)v23;
  v30 = sub_23D64C4B8(v27, (uint64_t (*)(char *, uint64_t, uint64_t))sub_23D649FFC, (uint64_t)(&v73 - 8));
  v31 = v82;
  v32 = v95;
  v33 = v81;
  v75 = v30;
  swift_release();
  v21 = (unint64_t)v77;
  *v77 = xmmword_23D66DF40;
  *(_OWORD *)(v21 + 16) = xmmword_23D66DF40;
  v83 = xmmword_23D66DF40;
  *(_QWORD *)(v21 + 32) = MEMORY[0x24BEE4AF8];
  sub_23D66BE5C();
  sub_23D66C228();
  v34 = sub_23D66C1E0();
  v35 = v33;
  v37 = v36;
  (*(void (**)(uint64_t *, uint64_t))(v32 + 8))(v35, v31);
  if (v37 >> 60 != 15)
  {
    sub_23D5DDA20(*(_QWORD *)v21, *(_QWORD *)(v21 + 8));
    *(_QWORD *)v21 = v34;
    *(_QWORD *)(v21 + 8) = v37;
    v38 = v78;
    v99 = v78;
    v100 = sub_23D5AE928(&qword_256C7BF48, (uint64_t (*)(uint64_t))MEMORY[0x24BDC65D0], MEMORY[0x24BDC65B0]);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v98);
    v40 = *(void (**)(uint64_t *, char *, uint64_t))(v79 + 16);
    v74 = v23;
    v40(boxed_opaque_existential_1, v23, v38);
    __swift_project_boxed_opaque_existential_1(v98, v99);
    sub_23D66BCC4();
    v41 = 0;
    v42 = v96;
    v43 = v97;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
    sub_23D5DDA20(*(_QWORD *)(v21 + 16), *(_QWORD *)(v21 + 24));
    *(_QWORD *)(v21 + 16) = v42;
    *(_QWORD *)(v21 + 24) = v43;
    v44 = v75;
    v45 = *(_QWORD *)(v75 + 16);
    if (v45)
    {
      v81 = (uint64_t *)v12;
      v73 = 0;
      v98[0] = MEMORY[0x24BEE4AF8];
      v95 = v45;
      sub_23D5DE3A8(0, v45, 0);
      v46 = v44 + ((*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80));
      v82 = *(_QWORD *)(v80 + 72);
      v47 = v90;
      v48 = v91;
      v50 = v88;
      v49 = v89;
      v51 = v81;
      do
      {
        v94 = v46;
        sub_23D5AEF48(v46, (uint64_t)v50, &qword_256C79A08);
        v52 = *(int *)(v47 + 64);
        v53 = &v49[v52];
        v54 = *v50;
        v55 = v50[1];
        v57 = v50[2];
        v92 = v50[3];
        v56 = v92;
        v93 = v57;
        v58 = v86;
        (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v53, (char *)v50 + v52, v86);
        v59 = v85;
        (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v85, v53, v58);
        v60 = v83;
        *((_OWORD *)v51 + 2) = v83;
        *((_OWORD *)v51 + 3) = v60;
        sub_23D5AFA60(v54, v55);
        sub_23D5AFA60(v57, v56);
        sub_23D66BE5C();
        *v51 = v54;
        v51[1] = v55;
        sub_23D5AFA60(v54, v55);
        v51[2] = sub_23D66C0CC();
        v51[3] = v61;
        v62 = sub_23D66C0D8();
        v64 = v63;
        sub_23D5DDA20(v54, v55);
        v65 = v59;
        v50 = v88;
        (*(void (**)(char *, uint64_t))(v48 + 8))(v65, v58);
        sub_23D5DDA20(v51[4], v51[5]);
        v51[4] = v62;
        v51[5] = v64;
        sub_23D5DDA20(v51[6], v51[7]);
        v66 = v92;
        v51[6] = v93;
        v51[7] = v66;
        sub_23D5E7F64((uint64_t)v51, v101, type metadata accessor for GKCrypto_GroupHandle.CiphertextAndTag);
        sub_23D5AEF8C((uint64_t)v50, &qword_256C79A08);
        v67 = v98[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23D5DE3A8(0, *(_QWORD *)(v67 + 16) + 1, 1);
          v67 = v98[0];
        }
        v68 = v87;
        v21 = *(_QWORD *)(v67 + 16);
        v69 = *(_QWORD *)(v67 + 24);
        v47 = v90;
        v48 = v91;
        v49 = v89;
        if (v21 >= v69 >> 1)
        {
          sub_23D5DE3A8(v69 > 1, v21 + 1, 1);
          v68 = v87;
          v67 = v98[0];
        }
        *(_QWORD *)(v67 + 16) = v21 + 1;
        sub_23D5E7F64(v101, v67+ ((*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80))+ *(_QWORD *)(v68 + 72) * v21, type metadata accessor for GKCrypto_GroupHandle.CiphertextAndTag);
        v46 = v94 + v82;
        --v95;
      }
      while (v95);
      swift_bridgeObjectRelease();
      v70 = (uint64_t)v77;
      v38 = v78;
      v41 = v73;
    }
    else
    {
      v70 = v21;
      swift_bridgeObjectRelease();
      v67 = MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)(v70 + 32) = v67;
    sub_23D5AE928(&qword_256C7A4A8, type metadata accessor for GKCrypto_GroupHandle, (uint64_t)&unk_23D67299C);
    v71 = sub_23D66BF1C();
    if (!v41)
      v21 = v71;
    (*(void (**)(char *, uint64_t))(v79 + 8))(v74, v38);
    sub_23D5E6950(v70, type metadata accessor for GKCrypto_GroupHandle);
    return v21;
  }
  __break(1u);
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_23D647870(uint64_t *a1, uint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12[2];

  v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8);
  v9 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v9 = a3(v9);
  v10 = *(_QWORD *)(v9 + 16);
  v12[0] = v9 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  v12[1] = v10;
  result = sub_23D64A01C(v12, a2, a4);
  *a1 = v9;
  return result;
}

uint64_t sub_23D647918(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  os_log_type_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_type_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  os_log_type_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;

  v1 = *a1;
  v2 = *(_QWORD *)(*a1 + 16);
  v3 = *(_QWORD *)(sub_23D648FAC(*a1) + 16);
  swift_bridgeObjectRelease();
  if (v2 == v3)
  {
    v4 = *(_QWORD *)(v1 + 16);
    v5 = *(_QWORD *)(sub_23D64943C(v1) + 16);
    swift_bridgeObjectRelease();
    if (v4 == v5)
    {
      v6 = *(_QWORD *)(v1 + 16);
      v7 = *(_QWORD *)(sub_23D649A3C(v1) + 16);
      result = swift_bridgeObjectRelease();
      if (v6 == v7)
        return result;
      if (qword_256C78B10 != -1)
        swift_once();
      v9 = sub_23D66BFDC();
      __swift_project_value_buffer(v9, (uint64_t)qword_256C88B78);
      v10 = sub_23D66C588();
      v11 = sub_23D66BFC4();
      v12 = v10;
      if (os_log_type_enabled(v11, v10))
      {
        v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_23D5A8000, v11, v12, "user in group does not have necessary UserKeyingInfo information", v13, 2u);
        MEMORY[0x242636844](v13, -1, -1);
      }

      __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
      sub_23D618E34();
      swift_allocError();
      *(_BYTE *)v14 = 17;
      v15 = 241;
    }
    else
    {
      if (qword_256C78B10 != -1)
        swift_once();
      v21 = sub_23D66BFDC();
      __swift_project_value_buffer(v21, (uint64_t)qword_256C88B78);
      v22 = sub_23D66C588();
      v23 = sub_23D66BFC4();
      v24 = v22;
      if (os_log_type_enabled(v23, v22))
      {
        v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_23D5A8000, v23, v24, "user in group does not have necessary diversification key information", v25, 2u);
        MEMORY[0x242636844](v25, -1, -1);
      }

      __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
      sub_23D618E34();
      swift_allocError();
      *(_BYTE *)v14 = 18;
      v15 = 237;
    }
  }
  else
  {
    if (qword_256C78B10 != -1)
      swift_once();
    v16 = sub_23D66BFDC();
    __swift_project_value_buffer(v16, (uint64_t)qword_256C88B78);
    v17 = sub_23D66C588();
    v18 = sub_23D66BFC4();
    v19 = v17;
    if (os_log_type_enabled(v18, v17))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_23D5A8000, v18, v19, "user in group does not have necessary KeyShare information", v20, 2u);
      MEMORY[0x242636844](v20, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D618E34();
    swift_allocError();
    *(_BYTE *)v14 = 16;
    v15 = 233;
  }
  *(_BYTE *)(v14 + 1) = 1;
  *(_QWORD *)(v14 + 8) = v15;
  *(_QWORD *)(v14 + 16) = 0xD000000000000011;
  *(_QWORD *)(v14 + 24) = 0x800000023D67A730;
  *(_QWORD *)(v14 + 32) = 0xD00000000000005CLL;
  *(_QWORD *)(v14 + 40) = 0x800000023D67A750;
  return swift_willThrow();
}

uint64_t sub_23D647CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
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
  char *v20;
  uint64_t v21;
  uint64_t result;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t (*v29)(char *, uint64_t);
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52[2];
  uint64_t v53;

  v48 = a8;
  v46 = a6;
  v47 = a7;
  v44 = a4;
  v45 = a5;
  v43 = a1;
  v9 = sub_23D66C210();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v50 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v38 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79990);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v38 - v19;
  v53 = a3 + *(int *)(type metadata accessor for GroupMembership.MemberProperties(0) + 24);
  sub_23D5AEF48(v53, (uint64_t)v20, &qword_256C79990);
  v21 = type metadata accessor for UserKeyingInfo(0);
  v51 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 48);
  result = v51(v20, 1, v21);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_10;
  }
  v23 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v23(v14, &v20[*(int *)(v21 + 20)], v9);
  sub_23D5E6950((uint64_t)v20, type metadata accessor for UserKeyingInfo);
  v24 = sub_23D66C1F8();
  v26 = v25;
  sub_23D5AFD60(v24, v25);
  v41 = v28;
  v42 = v27;
  sub_23D5DDA20(v24, v26);
  v29 = *(uint64_t (**)(char *, uint64_t))(v10 + 8);
  result = v29(v14, v9);
  v30 = *(_QWORD *)(a3 + 16);
  if (v30 >> 60 == 15)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v31 = *(_QWORD *)(a3 + 8);
  sub_23D5AFA60(v31, *(_QWORD *)(a3 + 16));
  sub_23D5AFD60(v31, v30);
  v39 = v33;
  v40 = v32;
  sub_23D5E725C(v31, v30);
  sub_23D5AEF48(v53, (uint64_t)v18, &qword_256C79990);
  result = v51(v18, 1, v21);
  if ((_DWORD)result == 1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v34 = v50;
  v23(v50, &v18[*(int *)(v21 + 20)], v9);
  result = sub_23D5E6950((uint64_t)v18, type metadata accessor for UserKeyingInfo);
  v35 = *(_QWORD *)(a3 + 16);
  if (v35 >> 60 == 15)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  v36 = *(_QWORD *)(a3 + 8);
  v52[0] = v36;
  v52[1] = v35;
  sub_23D5AFA60(v36, v35);
  v37 = v49;
  sub_23D647F90(v52, v45, v46, v47, v48, v43);
  if (v37)
  {
    sub_23D5DDA20(v42, v41);
    sub_23D5DDA20(v40, v39);
    sub_23D5E725C(v36, v35);
    return v29(v34, v9);
  }
  else
  {
    sub_23D5E725C(v36, v35);
    v29(v34, v9);
    return v42;
  }
}

uint64_t sub_23D647F90@<X0>(uint64_t *a1@<X2>, unint64_t a2@<X3>, unint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
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
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  unint64_t v38;
  char *v39;
  uint64_t (*v40)(char *, uint64_t);
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  _QWORD v48[2];
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;

  v55 = a4;
  v56 = a5;
  v57 = a3;
  v58 = a6;
  v68 = a2;
  v8 = sub_23D66C054();
  v54 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v59 = (char *)v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v53 = (char *)v48 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v60 = (char *)v48 - v13;
  v14 = sub_23D66C210();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23D66C024();
  v62 = *(_QWORD *)(v18 - 8);
  v63 = v18;
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v22 = *a1;
  v23 = a1[1];
  v52 = v22;
  v61 = (char *)v48 - v24;
  result = sub_23D66C21C();
  if (!v6)
  {
    sub_23D66C228();
    v26 = sub_23D66C1D4();
    v48[1] = v23;
    v27 = v26;
    v51 = v8;
    v29 = v28;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    v30 = sub_23D66C1D4();
    v32 = v31;
    v66 = v27;
    v67 = v29;
    sub_23D5AFA60(v27, v29);
    sub_23D64C120(v30, v32);
    sub_23D5DDA20(v30, v32);
    v33 = v29;
    v34 = v51;
    sub_23D5DDA20(v27, v33);
    v35 = v66;
    v36 = v67;
    (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v21, v61, v63);
    sub_23D5AE928(&qword_256C7BF50, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6380], MEMORY[0x24BDC6360]);
    v37 = v53;
    sub_23D66C03C();
    v49 = v36;
    v50 = v35;
    v66 = v35;
    v67 = v36;
    v38 = v57;
    v64 = v68;
    v65 = v57;
    sub_23D66C354();
    sub_23D5AE928((unint64_t *)&qword_256C79AC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8], MEMORY[0x24BDC6AE8]);
    v46 = sub_23D5E6898();
    v47 = v46;
    v39 = v60;
    sub_23D66C12C();
    v40 = *(uint64_t (**)(char *, uint64_t))(v54 + 8);
    v41 = v40(v37, v34);
    MEMORY[0x24BDAC7A8](v41);
    v42 = v59;
    v43 = sub_23D66C030();
    MEMORY[0x24BDAC7A8](v43);
    v44 = v56;
    v48[-4] = v39;
    v48[-3] = v44;
    v46 = v68;
    v47 = v38;
    sub_23D66C108();
    sub_23D66C030();
    sub_23D5DDA20(v50, v49);
    v45 = v51;
    v40(v42, v51);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v61, v63);
    return v40(v39, v45);
  }
  return result;
}

uint64_t sub_23D648360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[4];

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79980);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[2] = a1;
  v17[3] = a2;
  v14 = sub_23D66C0C0();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a4, v14);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
  v17[0] = a5;
  v17[1] = a6;
  sub_23D64C66C();
  sub_23D5E6898();
  sub_23D66C09C();
  return sub_23D5AEF8C((uint64_t)v13, &qword_256C79980);
}

uint64_t sub_23D648494@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v21 = a3;
  v22 = a2;
  v6 = sub_23D66C0C0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = (char *)a4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256C79A08) + 64);
  v10 = *a1;
  v11 = a1[1];
  *a4 = *a1;
  a4[1] = v11;
  v12 = a1[6];
  v13 = a1[7];
  a4[2] = v12;
  a4[3] = v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v22, v6);
  v15 = a1[3];
  v26 = a1[2];
  v14 = v26;
  v27 = v15;
  v16 = a1[4];
  v17 = a1[5];
  v24 = v16;
  v25 = v17;
  sub_23D5AFA60(v10, v11);
  sub_23D5AFA60(v12, v13);
  sub_23D5AFA60(v14, v15);
  sub_23D5AFA60(v16, v17);
  sub_23D5E6898();
  v18 = v28;
  result = sub_23D66C0E4();
  if (v18)
  {
    sub_23D5DDA20(v12, v13);
    result = sub_23D5DDA20(v10, v11);
    *v21 = v18;
  }
  return result;
}

uint64_t sub_23D6485F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  _QWORD v15[2];

  v15[1] = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79A08);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23D66C108();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(int *)(v5 + 64);
  v13 = &v7[v12];
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(&v7[v12], a1 + v12, v8);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v13, v8);
  sub_23D648720(a3);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void sub_23D648720(uint64_t a1@<X8>)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_23D5E6898();
  v5 = sub_23D66C090();
  v3 = v2 >> 62;
  sub_23D5AFA60(v5, v2);
  sub_23D66C03C();
  v4 = sub_23D66C054();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, 0, 1, v4);
  __asm { BR              X9 }
}

uint64_t sub_23D648880(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  void (*v29)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;

  v32 = a1;
  v3 = sub_23D66C108();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v31 - v8;
  v10 = sub_23D66C0CC();
  v12 = v11;
  v13 = sub_23D66C0CC();
  v15 = v14;
  sub_23D5E6578(v10, v12);
  v17 = v16;
  v18 = v15;
  v19 = v4;
  sub_23D5DDA20(v13, v18);
  sub_23D5DDA20(v10, v12);
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v20(v9, v32, v3);
  v20(v7, a2, v3);
  if ((v17 & 1) != 0)
  {
    v21 = sub_23D66C0D8();
    v23 = v22;
    v24 = sub_23D66C0D8();
    v26 = v25;
    sub_23D5E6578(v21, v23);
    v28 = v27;
    sub_23D5DDA20(v24, v26);
    sub_23D5DDA20(v21, v23);
  }
  else
  {
    v28 = 0;
  }
  v29 = *(void (**)(char *, uint64_t))(v19 + 8);
  v29(v7, v3);
  v29(v9, v3);
  return v28 & 1;
}

uint64_t sub_23D648A10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  char *v11;
  char v12;
  char v13;
  char v14;
  uint64_t v16;

  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t *)MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v16 - v10;
  sub_23D5E6578(*v9, *(_QWORD *)(a1 + 8));
  v13 = v12;
  sub_23D5E7298(a1, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for HashAndCipher);
  sub_23D5E7298(a2, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for HashAndCipher);
  if ((v13 & 1) != 0)
    v14 = sub_23D648880((uint64_t)&v11[*(int *)(a3 + 20)], (uint64_t)&v8[*(int *)(a3 + 20)]);
  else
    v14 = 0;
  sub_23D5E6950((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for HashAndCipher);
  sub_23D5E6950((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for HashAndCipher);
  return v14 & 1;
}

uint64_t sub_23D648B18@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, unint64_t a3@<X3>, unint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, _QWORD *a7@<X8>)
{
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
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  uint64_t result;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55[2];
  uint64_t v56;

  v50 = a6;
  v48 = a4;
  v49 = a5;
  v46 = a2;
  v47 = a3;
  v43 = a7;
  v8 = sub_23D66C108();
  v41 = *(_QWORD *)(v8 - 8);
  v42 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v52 = (uint64_t)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23D66C210();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v54 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v41 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79990);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v41 - v20;
  v22 = *(int *)(type metadata accessor for GroupMembership.MemberProperties(0) + 24);
  v53 = a1;
  v56 = a1 + v22;
  sub_23D5AEF48(a1 + v22, (uint64_t)v21, &qword_256C79990);
  v23 = type metadata accessor for UserKeyingInfo(0);
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 48);
  result = v24(v21, 1, v23);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_9;
  }
  v26 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v26(v15, &v21[*(int *)(v23 + 20)], v10);
  sub_23D5E6950((uint64_t)v21, type metadata accessor for UserKeyingInfo);
  v27 = sub_23D66C1F8();
  v29 = v28;
  sub_23D5AFD60(v27, v28);
  v44 = v30;
  v45 = v31;
  sub_23D5DDA20(v27, v29);
  v32 = *(void (**)(char *, uint64_t))(v11 + 8);
  v32(v15, v10);
  sub_23D5AEF48(v56, (uint64_t)v19, &qword_256C79990);
  result = v24(v19, 1, v23);
  if ((_DWORD)result == 1)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v33 = v54;
  v26(v54, &v19[*(int *)(v23 + 20)], v10);
  result = sub_23D5E6950((uint64_t)v19, type metadata accessor for UserKeyingInfo);
  v34 = *(_QWORD *)(v53 + 16);
  if (v34 >> 60 == 15)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v35 = *(_QWORD *)(v53 + 8);
  v55[0] = v35;
  v55[1] = v34;
  sub_23D5AFA60(v35, v34);
  v36 = v51;
  v37 = v52;
  sub_23D647F90(v55, v47, v48, v49, v50, v52);
  if (v36)
  {
    sub_23D5DDA20(v44, v45);
    sub_23D5E725C(v35, v34);
    return ((uint64_t (*)(char *, uint64_t))v32)(v33, v10);
  }
  else
  {
    sub_23D5E725C(v35, v34);
    v32(v33, v10);
    v38 = type metadata accessor for HashAndCipher();
    v39 = v43;
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 32))((char *)v43 + *(int *)(v38 + 20), v37, v42);
    v40 = v45;
    *v39 = v44;
    v39[1] = v40;
  }
  return result;
}

uint64_t sub_23D648E20@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;

  v25 = a4;
  v26 = a3;
  v6 = sub_23D66C0C0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_23D66C108();
  v10 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a1;
  v14 = a1[1];
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v16 = a1[3];
  v29 = a1[2];
  v15 = v29;
  v30 = v16;
  v18 = a1[4];
  v17 = a1[5];
  v27 = v18;
  v28 = v17;
  sub_23D5AFA60(v13, v14);
  sub_23D5AFA60(v15, v16);
  sub_23D5AFA60(v18, v17);
  sub_23D5E6898();
  v19 = v31;
  sub_23D66C0E4();
  if (v19)
  {
    result = sub_23D5DDA20(v13, v14);
    *v26 = v19;
  }
  else
  {
    v21 = v25;
    *v25 = v13;
    v21[1] = v14;
    v22 = type metadata accessor for HashAndCipher();
    return (*(uint64_t (**)(char *, char *, uint64_t))(v10 + 32))((char *)v21 + *(int *)(v22 + 20), v12, v24);
  }
  return result;
}

uint64_t sub_23D648FAC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char v43;
  unint64_t v44;
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  unint64_t v49;
  uint64_t *v50;
  _QWORD v51[2];
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  int64_t v57;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v52 = (_QWORD *)((char *)v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (_QWORD *)((char *)v51 - v6);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (_QWORD *)((char *)v51 - v8);
  v10 = *(_QWORD *)(a1 + 64);
  v58 = a1 + 64;
  v56 = MEMORY[0x24BEE4B00];
  v60 = MEMORY[0x24BEE4B00];
  v11 = -1 << *(_BYTE *)(a1 + 32);
  if (-v11 < 64)
    v12 = ~(-1 << -(char)v11);
  else
    v12 = -1;
  v13 = v12 & v10;
  v51[1] = -1 << *(_BYTE *)(a1 + 32);
  v57 = (unint64_t)(63 - v11) >> 6;
  result = swift_bridgeObjectRetain();
  v59 = 0;
  if (!v13)
    goto LABEL_8;
LABEL_5:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  v16 = v15 | (v59 << 6);
  while (1)
  {
    v17 = *(_QWORD *)(a1 + 56);
    v18 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v16);
    v20 = *v18;
    v19 = v18[1];
    v21 = type metadata accessor for GroupMembership.MemberProperties(0);
    sub_23D5E7298(v17 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v16, (uint64_t)v9 + *(int *)(v2 + 48), type metadata accessor for GroupMembership.MemberProperties);
    *v9 = v20;
    v9[1] = v19;
    sub_23D5F16C4((uint64_t)v9, (uint64_t)v7, &qword_256C799A0);
    v22 = *(int *)(v2 + 48);
    v23 = (uint64_t)v7 + v22;
    v24 = *(uint64_t *)((char *)v7 + v22 + 16);
    if (v24 >> 60 == 15)
    {
      sub_23D5AFA60(v20, v19);
      result = sub_23D5AEF8C((uint64_t)v7, &qword_256C799A0);
      if (v13)
        goto LABEL_5;
    }
    else
    {
      v29 = *(_QWORD *)(v23 + 8);
      v30 = v52;
      v31 = (uint64_t)v52 + v22;
      v32 = v7[1];
      v54 = *v7;
      v55 = v32;
      *v52 = v54;
      v30[1] = v32;
      v53 = v31;
      sub_23D5E7F64(v23, v31, type metadata accessor for GroupMembership.MemberProperties);
      v33 = *(_QWORD *)(v56 + 16);
      if (*(_QWORD *)(v56 + 24) <= v33)
      {
        v56 = v33 + 1;
        sub_23D5AFA60(v20, v19);
        sub_23D5E7284(v29, v24);
        sub_23D665BFC(v56, 1);
        v34 = v60;
      }
      else
      {
        sub_23D5AFA60(v20, v19);
        sub_23D5E7284(v29, v24);
        v34 = v56;
      }
      v35 = v54;
      v56 = v34;
      sub_23D66C8E8();
      v36 = v55;
      sub_23D5AFA60(v35, v55);
      sub_23D66BDA8();
      sub_23D5DDA20(v35, v36);
      result = sub_23D66C90C();
      v37 = (_QWORD *)v56;
      v38 = v56 + 64;
      v39 = -1 << *(_BYTE *)(v56 + 32);
      v40 = result & ~v39;
      v41 = v40 >> 6;
      if (((-1 << v40) & ~*(_QWORD *)(v56 + 64 + 8 * (v40 >> 6))) == 0)
      {
        v43 = 0;
        v44 = (unint64_t)(63 - v39) >> 6;
        while (++v41 != v44 || (v43 & 1) == 0)
        {
          v45 = v41 == v44;
          if (v41 == v44)
            v41 = 0;
          v43 |= v45;
          v46 = *(_QWORD *)(v38 + 8 * v41);
          if (v46 != -1)
          {
            v42 = __clz(__rbit64(~v46)) + (v41 << 6);
            goto LABEL_37;
          }
        }
        goto LABEL_41;
      }
      v42 = __clz(__rbit64((-1 << v40) & ~*(_QWORD *)(v56 + 64 + 8 * (v40 >> 6)))) | v40 & 0x7FFFFFFFFFFFFFC0;
LABEL_37:
      *(_QWORD *)(v38 + ((v42 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v42;
      v47 = 16 * v42;
      v48 = (uint64_t *)(v37[6] + v47);
      v49 = v55;
      *v48 = v35;
      v48[1] = v49;
      v50 = (uint64_t *)(v37[7] + v47);
      *v50 = v29;
      v50[1] = v24;
      ++v37[2];
      result = sub_23D5E6950(v53, type metadata accessor for GroupMembership.MemberProperties);
      if (v13)
        goto LABEL_5;
    }
LABEL_8:
    v25 = v59 + 1;
    if (__OFADD__(v59, 1))
    {
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v25 >= v57)
      goto LABEL_39;
    v26 = *(_QWORD *)(v58 + 8 * v25);
    v27 = v59 + 1;
    if (!v26)
    {
      v27 = v59 + 2;
      if (v59 + 2 >= v57)
        goto LABEL_39;
      v26 = *(_QWORD *)(v58 + 8 * v27);
      if (!v26)
      {
        v27 = v59 + 3;
        if (v59 + 3 >= v57)
          goto LABEL_39;
        v26 = *(_QWORD *)(v58 + 8 * v27);
        if (!v26)
        {
          v27 = v59 + 4;
          if (v59 + 4 >= v57)
            goto LABEL_39;
          v26 = *(_QWORD *)(v58 + 8 * v27);
          if (!v26)
            break;
        }
      }
    }
LABEL_23:
    v13 = (v26 - 1) & v26;
    v16 = __clz(__rbit64(v26)) + (v27 << 6);
    v59 = v27;
  }
  v28 = v59 + 5;
  if (v59 + 5 >= v57)
  {
LABEL_39:
    sub_23D5F165C();
    return v56;
  }
  v26 = *(_QWORD *)(v58 + 8 * v28);
  if (v26)
  {
    v27 = v59 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    v27 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v27 >= v57)
      goto LABEL_39;
    v26 = *(_QWORD *)(v58 + 8 * v27);
    ++v28;
    if (v26)
      goto LABEL_23;
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_23D64943C(uint64_t a1)
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
  unint64_t v17;
  uint64_t result;
  uint64_t *v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  char *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  char v56;
  unint64_t v57;
  BOOL v58;
  uint64_t v59;
  uint64_t *v60;
  _QWORD v61[3];
  uint64_t v62;
  uint64_t *v63;
  char *v64;
  int64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t *v72;
  int64_t i;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
  MEMORY[0x24BDAC7A8](v2);
  v71 = (uint64_t)v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = sub_23D66C330();
  v4 = *(_QWORD *)(v75 - 8);
  v5 = MEMORY[0x24BDAC7A8](v75);
  v68 = (char *)v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v64 = (char *)v61 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v63 = (_QWORD *)((char *)v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = MEMORY[0x24BDAC7A8](v9);
  v72 = (_QWORD *)((char *)v61 - v12);
  MEMORY[0x24BDAC7A8](v11);
  v70 = (_QWORD *)((char *)v61 - v13);
  v14 = *(_QWORD *)(a1 + 64);
  v66 = a1 + 64;
  v77 = MEMORY[0x24BEE4B00];
  v15 = -1 << *(_BYTE *)(a1 + 32);
  if (-v15 < 64)
    v16 = ~(-1 << -(char)v15);
  else
    v16 = -1;
  v17 = v16 & v14;
  v61[1] = -1 << *(_BYTE *)(a1 + 32);
  v65 = (unint64_t)(63 - v15) >> 6;
  result = swift_bridgeObjectRetain();
  i = 0;
  v69 = a1;
  v74 = v4;
  v62 = v8;
  if (v17)
    goto LABEL_7;
LABEL_8:
  v21 = i + 1;
  if (!__OFADD__(i, 1))
  {
    v19 = v72;
    if (v21 < v65)
    {
      v22 = *(_QWORD *)(v66 + 8 * v21);
      v23 = i + 1;
      if (v22)
        goto LABEL_23;
      v23 = i + 2;
      if (i + 2 >= v65)
        goto LABEL_40;
      v22 = *(_QWORD *)(v66 + 8 * v23);
      if (v22)
        goto LABEL_23;
      v23 = i + 3;
      if (i + 3 >= v65)
        goto LABEL_40;
      v22 = *(_QWORD *)(v66 + 8 * v23);
      if (v22)
        goto LABEL_23;
      v23 = i + 4;
      if (i + 4 >= v65)
        goto LABEL_40;
      v22 = *(_QWORD *)(v66 + 8 * v23);
      if (v22)
      {
LABEL_23:
        v76 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v23 << 6);
        for (i = v23; ; v20 = __clz(__rbit64(v17)) | (i << 6))
        {
          v25 = *(_QWORD *)(a1 + 56);
          v26 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v20);
          v27 = *v26;
          v28 = v26[1];
          v29 = type metadata accessor for GroupMembership.MemberProperties(0);
          v30 = v25 + *(_QWORD *)(*(_QWORD *)(v29 - 8) + 72) * v20;
          v31 = v70;
          sub_23D5E7298(v30, (uint64_t)v70 + *(int *)(v8 + 48), type metadata accessor for GroupMembership.MemberProperties);
          *v31 = v27;
          v31[1] = v28;
          sub_23D5F16C4((uint64_t)v31, (uint64_t)v19, &qword_256C799A0);
          v32 = (uint64_t)v19 + *(int *)(v8 + 48);
          v33 = v71;
          sub_23D5AEF48(v32 + *(int *)(v29 + 28), v71, &qword_256C799E0);
          v34 = v74;
          v35 = v8;
          v36 = v75;
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v74 + 48))(v33, 1, v75) == 1)
          {
            sub_23D5AFA60(v27, v28);
            sub_23D5AEF8C((uint64_t)v19, &qword_256C799A0);
            result = sub_23D5AEF8C(v33, &qword_256C799E0);
            v8 = v35;
            a1 = v69;
            v17 = v76;
            if (!v76)
              goto LABEL_8;
          }
          else
          {
            v37 = v28;
            v38 = v33;
            v39 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 32);
            v40 = v64;
            v39(v64, v38, v36);
            v41 = *(int *)(v35 + 48);
            v42 = v63;
            v43 = (uint64_t)v63 + v41;
            v45 = *v19;
            v44 = v19[1];
            *v63 = *v19;
            v42[1] = v44;
            v67 = (uint64_t)v42 + v41;
            sub_23D5E7F64(v32, v43, type metadata accessor for GroupMembership.MemberProperties);
            v39(v68, (uint64_t)v40, v36);
            v46 = v77;
            v47 = *(_QWORD *)(v77 + 16);
            if (*(_QWORD *)(v77 + 24) <= v47)
            {
              v48 = v47 + 1;
              sub_23D5AFA60(v27, v37);
              sub_23D665858(v48, 1);
              v46 = v77;
            }
            else
            {
              sub_23D5AFA60(v27, v37);
            }
            sub_23D66C8E8();
            sub_23D5AFA60(v45, v44);
            sub_23D66BDA8();
            sub_23D5DDA20(v45, v44);
            result = sub_23D66C90C();
            v49 = v46 + 64;
            v50 = -1 << *(_BYTE *)(v46 + 32);
            v51 = result & ~v50;
            v52 = v51 >> 6;
            v53 = v74;
            if (((-1 << v51) & ~*(_QWORD *)(v46 + 64 + 8 * (v51 >> 6))) != 0)
            {
              v54 = __clz(__rbit64((-1 << v51) & ~*(_QWORD *)(v46 + 64 + 8 * (v51 >> 6)))) | v51 & 0x7FFFFFFFFFFFFFC0;
              v55 = v75;
            }
            else
            {
              v56 = 0;
              v57 = (unint64_t)(63 - v50) >> 6;
              v55 = v75;
              do
              {
                if (++v52 == v57 && (v56 & 1) != 0)
                {
                  __break(1u);
                  goto LABEL_41;
                }
                v58 = v52 == v57;
                if (v52 == v57)
                  v52 = 0;
                v56 |= v58;
                v59 = *(_QWORD *)(v49 + 8 * v52);
              }
              while (v59 == -1);
              v54 = __clz(__rbit64(~v59)) + (v52 << 6);
            }
            *(_QWORD *)(v49 + ((v54 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v54;
            v60 = (uint64_t *)(*(_QWORD *)(v46 + 48) + 16 * v54);
            *v60 = v45;
            v60[1] = v44;
            v39((char *)(*(_QWORD *)(v46 + 56) + *(_QWORD *)(v53 + 72) * v54), (uint64_t)v68, v55);
            ++*(_QWORD *)(v46 + 16);
            result = sub_23D5E6950(v67, type metadata accessor for GroupMembership.MemberProperties);
            a1 = v69;
            v8 = v62;
            v17 = v76;
            if (!v76)
              goto LABEL_8;
          }
LABEL_7:
          v76 = (v17 - 1) & v17;
          v19 = v72;
        }
      }
      v24 = i + 5;
      if (i + 5 < v65)
      {
        v22 = *(_QWORD *)(v66 + 8 * v24);
        if (v22)
        {
          v23 = i + 5;
          goto LABEL_23;
        }
        while (1)
        {
          v23 = v24 + 1;
          if (__OFADD__(v24, 1))
            goto LABEL_42;
          if (v23 >= v65)
            break;
          v22 = *(_QWORD *)(v66 + 8 * v23);
          ++v24;
          if (v22)
            goto LABEL_23;
        }
      }
    }
LABEL_40:
    sub_23D5F165C();
    return v77;
  }
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_23D649A3C(uint64_t a1)
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
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t result;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  char v53;
  unint64_t v54;
  BOOL v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t *v59;
  _QWORD v60[3];
  uint64_t *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  int64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int64_t v73;
  _QWORD *v74;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79990);
  MEMORY[0x24BDAC7A8](v2);
  v68 = (uint64_t)v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = type metadata accessor for UserKeyingInfo(0);
  v71 = *(_QWORD *)(v69 - 8);
  v4 = MEMORY[0x24BDAC7A8](v69);
  v64 = (uint64_t)v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v62 = (uint64_t)v60 - v6;
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0);
  v7 = MEMORY[0x24BDAC7A8](v72);
  v61 = (_QWORD *)((char *)v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (_QWORD *)((char *)v60 - v10);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (_QWORD *)((char *)v60 - v12);
  v14 = *(_QWORD *)(a1 + 64);
  v67 = a1 + 64;
  v65 = (_QWORD *)MEMORY[0x24BEE4B00];
  v74 = (_QWORD *)MEMORY[0x24BEE4B00];
  v15 = -1 << *(_BYTE *)(a1 + 32);
  if (-v15 < 64)
    v16 = ~(-1 << -(char)v15);
  else
    v16 = -1;
  v17 = v16 & v14;
  v60[1] = -1 << *(_BYTE *)(a1 + 32);
  v66 = (unint64_t)(63 - v15) >> 6;
  v70 = a1;
  result = swift_bridgeObjectRetain();
  v73 = 0;
  if (!v17)
    goto LABEL_8;
LABEL_5:
  v19 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  v20 = v19 | (v73 << 6);
  while (1)
  {
    v21 = *(_QWORD *)(v70 + 56);
    v22 = (uint64_t *)(*(_QWORD *)(v70 + 48) + 16 * v20);
    v24 = *v22;
    v23 = v22[1];
    v25 = type metadata accessor for GroupMembership.MemberProperties(0);
    v26 = v21 + *(_QWORD *)(*(_QWORD *)(v25 - 8) + 72) * v20;
    v27 = v72;
    sub_23D5E7298(v26, (uint64_t)v13 + *(int *)(v72 + 48), type metadata accessor for GroupMembership.MemberProperties);
    *v13 = v24;
    v13[1] = v23;
    sub_23D5F16C4((uint64_t)v13, (uint64_t)v11, &qword_256C799A0);
    v28 = (char *)v11 + *(int *)(v27 + 48);
    v29 = (uint64_t)&v28[*(int *)(v25 + 24)];
    v30 = v68;
    sub_23D5AEF48(v29, v68, &qword_256C79990);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v71 + 48))(v30, 1, v69) == 1)
    {
      sub_23D5AFA60(v24, v23);
      sub_23D5AEF8C((uint64_t)v11, &qword_256C799A0);
      result = sub_23D5AEF8C(v30, &qword_256C79990);
      if (v17)
        goto LABEL_5;
    }
    else
    {
      v35 = v62;
      sub_23D5E7F64(v30, v62, type metadata accessor for UserKeyingInfo);
      v36 = v61;
      v37 = (uint64_t)v61 + *(int *)(v72 + 48);
      v38 = v11[1];
      v39 = *v11;
      *v61 = *v11;
      v36[1] = v38;
      v63 = v38;
      v40 = (uint64_t)v28;
      v41 = v37;
      sub_23D5E7F64(v40, v37, type metadata accessor for GroupMembership.MemberProperties);
      sub_23D5E7F64(v35, v64, type metadata accessor for UserKeyingInfo);
      v42 = v65[2];
      if (v65[3] <= v42)
      {
        v44 = v42 + 1;
        sub_23D5AFA60(v24, v23);
        sub_23D6654A8(v44, 1);
        v43 = v74;
      }
      else
      {
        sub_23D5AFA60(v24, v23);
        v43 = v65;
      }
      v45 = v39;
      v46 = v63;
      v47 = v43;
      sub_23D66C8E8();
      sub_23D5AFA60(v45, v46);
      sub_23D66BDA8();
      sub_23D5DDA20(v45, v46);
      result = sub_23D66C90C();
      v48 = v47 + 8;
      v65 = v47;
      v49 = -1 << *((_BYTE *)v47 + 32);
      v50 = result & ~v49;
      v51 = v50 >> 6;
      if (((-1 << v50) & ~v47[(v50 >> 6) + 8]) == 0)
      {
        v53 = 0;
        v54 = (unint64_t)(63 - v49) >> 6;
        while (++v51 != v54 || (v53 & 1) == 0)
        {
          v55 = v51 == v54;
          if (v51 == v54)
            v51 = 0;
          v53 |= v55;
          v56 = v48[v51];
          if (v56 != -1)
          {
            v52 = __clz(__rbit64(~v56)) + (v51 << 6);
            goto LABEL_37;
          }
        }
        goto LABEL_41;
      }
      v52 = __clz(__rbit64((-1 << v50) & ~v47[(v50 >> 6) + 8])) | v50 & 0x7FFFFFFFFFFFFFC0;
LABEL_37:
      *(_QWORD *)((char *)v48 + ((v52 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v52;
      v57 = v64;
      v58 = v65;
      v59 = (uint64_t *)(v65[6] + 16 * v52);
      *v59 = v45;
      v59[1] = v46;
      sub_23D5E7F64(v57, v58[7] + *(_QWORD *)(v71 + 72) * v52, type metadata accessor for UserKeyingInfo);
      ++v58[2];
      result = sub_23D5E6950(v41, type metadata accessor for GroupMembership.MemberProperties);
      if (v17)
        goto LABEL_5;
    }
LABEL_8:
    v31 = v73 + 1;
    if (__OFADD__(v73, 1))
    {
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v31 >= v66)
      goto LABEL_39;
    v32 = *(_QWORD *)(v67 + 8 * v31);
    v33 = v73 + 1;
    if (!v32)
    {
      v33 = v73 + 2;
      if (v73 + 2 >= v66)
        goto LABEL_39;
      v32 = *(_QWORD *)(v67 + 8 * v33);
      if (!v32)
      {
        v33 = v73 + 3;
        if (v73 + 3 >= v66)
          goto LABEL_39;
        v32 = *(_QWORD *)(v67 + 8 * v33);
        if (!v32)
        {
          v33 = v73 + 4;
          if (v73 + 4 >= v66)
            goto LABEL_39;
          v32 = *(_QWORD *)(v67 + 8 * v33);
          if (!v32)
            break;
        }
      }
    }
LABEL_23:
    v17 = (v32 - 1) & v32;
    v20 = __clz(__rbit64(v32)) + (v33 << 6);
    v73 = v33;
  }
  v34 = v73 + 5;
  if (v73 + 5 >= v66)
  {
LABEL_39:
    sub_23D5F165C();
    return (uint64_t)v65;
  }
  v32 = *(_QWORD *)(v67 + 8 * v34);
  if (v32)
  {
    v33 = v73 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    v33 = v34 + 1;
    if (__OFADD__(v34, 1))
      break;
    if (v33 >= v66)
      goto LABEL_39;
    v32 = *(_QWORD *)(v67 + 8 * v33);
    ++v34;
    if (v32)
      goto LABEL_23;
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_23D649FFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_23D647CA4(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48));
}

uint64_t sub_23D64A01C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
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
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t result;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int (*v81)(uint64_t, uint64_t, uint64_t);
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  void (*v85)(uint64_t, uint64_t);
  uint64_t v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unsigned int (*v106)(uint64_t, uint64_t, uint64_t);
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  void (*v111)(uint64_t, uint64_t);
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  int v118;
  int v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  void (*v128)(uint64_t, uint64_t);
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
  uint64_t v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  unsigned int (*v151)(uint64_t, uint64_t, uint64_t);
  uint64_t v152;
  unint64_t v153;
  unint64_t v154;
  void (*v155)(uint64_t, uint64_t);
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  unint64_t v159;
  char v160;
  char v161;
  uint64_t v162;
  uint64_t v163;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v165;
  unint64_t v166;
  char *v167;
  char *v168;
  uint64_t v169;
  unint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  BOOL v181;
  unint64_t v182;
  char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  char *v188;
  uint64_t v189;
  uint64_t v190;
  BOOL v191;
  uint64_t v192;
  char v193;
  char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  BOOL v198;
  uint64_t v199;
  uint64_t v200;
  char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  unint64_t v209;
  uint64_t *v210;
  char *v211;
  char *v212;
  uint64_t v213;
  char *v214;
  uint64_t v215;
  uint64_t v216;
  unint64_t v217;
  char *v218;
  uint64_t v219;
  unint64_t v220;
  uint64_t *v221;
  char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  char *v227;
  unint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  char *v241;
  void (*v242)(uint64_t, uint64_t);
  char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  unint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  unsigned int (*v258)(uint64_t, uint64_t, uint64_t);
  uint64_t v259;
  char *v260;
  uint64_t v261;
  char *v262;
  uint64_t *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t *v273;

  v253 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v256 = (uint64_t)&v230 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v230 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v245 = (uint64_t)&v230 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v230 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v232 = (uint64_t)&v230 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v233 = (uint64_t)&v230 - v19;
  v261 = type metadata accessor for GroupMembership.MemberProperties(0);
  v20 = MEMORY[0x24BDAC7A8](v261);
  v22 = (char *)&v230 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v272 = (uint64_t)&v230 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v246 = (uint64_t)&v230 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v251 = (uint64_t)&v230 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v238 = (uint64_t)&v230 - v30;
  MEMORY[0x24BDAC7A8](v29);
  v236 = (uint64_t)&v230 - v31;
  v265 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v32 = *(_QWORD *)(v265 - 8);
  v33 = MEMORY[0x24BDAC7A8](v265);
  v244 = (uint64_t)&v230 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = MEMORY[0x24BDAC7A8](v33);
  v266 = (uint64_t)&v230 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  v271 = (uint64_t)&v230 - v38;
  v39 = MEMORY[0x24BDAC7A8](v37);
  v270 = (uint64_t)&v230 - v40;
  v41 = MEMORY[0x24BDAC7A8](v39);
  v250 = (uint64_t)&v230 - v42;
  v43 = MEMORY[0x24BDAC7A8](v41);
  v249 = (uint64_t)&v230 - v44;
  v45 = MEMORY[0x24BDAC7A8](v43);
  v260 = (char *)&v230 - v46;
  v47 = MEMORY[0x24BDAC7A8](v45);
  v235 = (uint64_t)&v230 - v48;
  MEMORY[0x24BDAC7A8](v47);
  v234 = (uint64_t)&v230 - v49;
  v273 = a1;
  v50 = a1[1];
  result = sub_23D66C834();
  if (result >= v50)
  {
    if (v50 < 0)
      goto LABEL_151;
    if (v50)
      return sub_23D64B224(0, v50, 1, v273, a2);
    return result;
  }
  if (v50 >= 0)
    v52 = v50;
  else
    v52 = v50 + 1;
  if (v50 < -1)
    goto LABEL_165;
  v231 = result;
  v255 = v3;
  if (v50 < 2)
  {
    v55 = v32;
    v57 = MEMORY[0x24BEE4AF8];
    v252 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
    if (v50 != 1)
    {
      v61 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v59 = (char *)MEMORY[0x24BEE4AF8];
LABEL_113:
      v230 = v57;
      if (v61 >= 2)
      {
        v219 = *v273;
        do
        {
          v220 = v61 - 2;
          if (v61 < 2)
            goto LABEL_146;
          if (!v219)
            goto LABEL_162;
          v221 = a2;
          v222 = v59;
          v223 = *(_QWORD *)&v59[16 * v220 + 32];
          v224 = *(_QWORD *)&v59[16 * v61 + 24];
          v225 = v55;
          v226 = v255;
          sub_23D64B6BC(v219 + *(_QWORD *)(v55 + 72) * v223, v219 + *(_QWORD *)(v55 + 72) * *(_QWORD *)&v59[16 * v61 + 16], v219 + *(_QWORD *)(v55 + 72) * v224, v252, v221, v253);
          v255 = v226;
          if (v226)
            goto LABEL_125;
          if (v224 < v223)
            goto LABEL_147;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v222 = sub_23D644818((uint64_t)v222);
          if (v220 >= *((_QWORD *)v222 + 2))
            goto LABEL_148;
          v227 = &v222[16 * v220 + 32];
          *(_QWORD *)v227 = v223;
          *((_QWORD *)v227 + 1) = v224;
          v228 = *((_QWORD *)v222 + 2);
          if (v61 > v228)
            goto LABEL_149;
          memmove(&v222[16 * v61 + 16], &v222[16 * v61 + 32], 16 * (v228 - v61));
          v59 = v222;
          *((_QWORD *)v222 + 2) = v228 - 1;
          v61 = v228 - 1;
          a2 = v221;
          v55 = v225;
        }
        while (v228 > 2);
      }
      swift_bridgeObjectRelease();
      *(_QWORD *)(v230 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v230 = MEMORY[0x24BEE4AF8];
    v241 = v16;
  }
  else
  {
    v241 = v16;
    v53 = v52 >> 1;
    v54 = sub_23D66C4E0();
    *(_QWORD *)(v54 + 16) = v53;
    v55 = v32;
    v56 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
    v230 = v54;
    v252 = v54 + v56;
  }
  v58 = 0;
  v59 = (char *)MEMORY[0x24BEE4AF8];
  v262 = v11;
  v263 = a2;
  v254 = v55;
  v248 = v22;
  v60 = v238;
  while (1)
  {
    v62 = v58;
    v63 = v58 + 1;
    v243 = v59;
    if (v58 + 1 < v50)
    {
      v267 = v50;
      v268 = v58 + 1;
      v64 = *v273;
      v65 = *(_QWORD *)(v55 + 72);
      v66 = v234;
      sub_23D5AEF48(*v273 + v65 * v63, v234, a2);
      v247 = v62;
      v237 = v64;
      v269 = v65;
      v67 = v64 + v65 * v62;
      v68 = v235;
      v69 = a2;
      sub_23D5AEF48(v67, v235, a2);
      v70 = v265;
      v71 = *(int *)(v265 + 48);
      v72 = v260;
      v73 = (uint64_t)&v260[v71];
      sub_23D5E7298(v66 + v71, (uint64_t)&v260[v71], type metadata accessor for GroupMembership.MemberProperties);
      v74 = v236;
      sub_23D5E7F64(v73, v236, type metadata accessor for GroupMembership.MemberProperties);
      v75 = *(int *)(v70 + 48);
      v76 = (uint64_t)&v72[v75];
      sub_23D5E7298(v68 + v75, (uint64_t)&v72[v75], type metadata accessor for GroupMembership.MemberProperties);
      sub_23D5E7F64(v76, v60, type metadata accessor for GroupMembership.MemberProperties);
      v77 = v261;
      v78 = v233;
      sub_23D5AEF48(v74 + *(int *)(v261 + 28), v233, &qword_256C799E0);
      v79 = sub_23D66C330();
      v80 = *(_QWORD *)(v79 - 8);
      v81 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v80 + 48);
      if (v81(v78, 1, v79) == 1)
        goto LABEL_163;
      v82 = sub_23D66C1D4();
      v84 = v83;
      v85 = *(void (**)(uint64_t, uint64_t))(v80 + 8);
      v85(v78, v79);
      v86 = v232;
      sub_23D5AEF48(v238 + *(int *)(v77 + 28), v232, &qword_256C799E0);
      v87 = v81(v86, 1, v79);
      v258 = v81;
      if (v87 == 1)
        goto LABEL_164;
      v88 = v86;
      v89 = sub_23D66C1D4();
      v91 = v90;
      v257 = v79;
      v242 = v85;
      v85(v88, v79);
      sub_23D617FF0(v89, v91, v82, v84);
      LODWORD(v259) = v92;
      sub_23D5DDA20(v89, v91);
      sub_23D5DDA20(v82, v84);
      sub_23D5E6950(v238, type metadata accessor for GroupMembership.MemberProperties);
      sub_23D5E6950(v236, type metadata accessor for GroupMembership.MemberProperties);
      a2 = v69;
      sub_23D5AEF8C(v235, v69);
      sub_23D5AEF8C(v234, v69);
      v63 = v247 + 2;
      if (v247 + 2 >= v267)
      {
        v55 = v254;
        v11 = v262;
      }
      else
      {
        v240 = v269 * v268;
        v93 = v237;
        v239 = v269 * v63;
        while (1)
        {
          v264 = v63;
          v94 = v249;
          sub_23D5AEF48(v93 + v239, v249, v69);
          v268 = v93;
          v95 = v250;
          sub_23D5AEF48(v93 + v240, v250, v69);
          v96 = v265;
          v97 = *(int *)(v265 + 48);
          v98 = v260;
          v99 = (uint64_t)&v260[v97];
          sub_23D5E7298(v94 + v97, (uint64_t)&v260[v97], type metadata accessor for GroupMembership.MemberProperties);
          v100 = v251;
          sub_23D5E7F64(v99, v251, type metadata accessor for GroupMembership.MemberProperties);
          v101 = *(int *)(v96 + 48);
          v102 = (uint64_t)&v98[v101];
          sub_23D5E7298(v95 + v101, (uint64_t)&v98[v101], type metadata accessor for GroupMembership.MemberProperties);
          v103 = v246;
          sub_23D5E7F64(v102, v246, type metadata accessor for GroupMembership.MemberProperties);
          v104 = v261;
          v105 = (uint64_t)v241;
          sub_23D5AEF48(v100 + *(int *)(v261 + 28), (uint64_t)v241, &qword_256C799E0);
          v107 = v257;
          v106 = v258;
          if (v258(v105, 1, v257) == 1)
            goto LABEL_159;
          v108 = sub_23D66C1D4();
          v110 = v109;
          v111 = v242;
          v242(v105, v107);
          v112 = v245;
          sub_23D5AEF48(v103 + *(int *)(v104 + 28), v245, &qword_256C799E0);
          if (v106(v112, 1, v107) == 1)
            goto LABEL_160;
          v113 = v107;
          v114 = v103;
          v115 = sub_23D66C1D4();
          v117 = v116;
          v111(v112, v113);
          sub_23D617FF0(v115, v117, v108, v110);
          v119 = v118;
          sub_23D5DDA20(v115, v117);
          sub_23D5DDA20(v108, v110);
          sub_23D5E6950(v114, type metadata accessor for GroupMembership.MemberProperties);
          sub_23D5E6950(v251, type metadata accessor for GroupMembership.MemberProperties);
          v120 = v263;
          sub_23D5AEF8C(v250, v263);
          v69 = v120;
          sub_23D5AEF8C(v249, v120);
          if (((v259 ^ v119) & 1) != 0)
            break;
          v63 = v264 + 1;
          v93 = v268 + v269;
          v55 = v254;
          if (v267 == v264 + 1)
          {
            v63 = v267;
            v11 = v262;
            v22 = v248;
            goto LABEL_28;
          }
        }
        v55 = v254;
        v11 = v262;
        v22 = v248;
        v63 = v264;
LABEL_28:
        a2 = v120;
      }
      v62 = v247;
      if ((v259 & 1) != 0)
      {
        if (v63 < v247)
          goto LABEL_152;
        if (v247 < v63)
        {
          v121 = 0;
          v122 = v269 * (v63 - 1);
          v123 = v63 * v269;
          v124 = v247;
          v125 = v247 * v269;
          do
          {
            if (v124 != v63 + v121 - 1)
            {
              v126 = v237;
              if (!v237)
                goto LABEL_161;
              v127 = v237 + v125;
              sub_23D5F16C4(v237 + v125, v244, v263);
              if (v125 < v122 || v127 >= v126 + v123)
              {
                swift_arrayInitWithTakeFrontToBack();
              }
              else if (v125 != v122)
              {
                swift_arrayInitWithTakeBackToFront();
              }
              sub_23D5F16C4(v244, v126 + v122, v263);
            }
            ++v124;
            --v121;
            v122 -= v269;
            v123 -= v269;
            v125 += v269;
          }
          while (v124 < v63 + v121);
          v55 = v254;
          v11 = v262;
          a2 = v263;
          v22 = v248;
          v62 = v247;
        }
      }
      v50 = v267;
    }
    if (v63 < v50)
    {
      if (__OFSUB__(v63, v62))
        goto LABEL_150;
      if (v63 - v62 < v231)
        break;
    }
LABEL_64:
    if (v63 < v62)
      goto LABEL_145;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v264 = v63;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      v59 = v243;
    else
      v59 = sub_23D6442E4(0, *((_QWORD *)v243 + 2) + 1, 1, v243);
    v166 = *((_QWORD *)v59 + 2);
    v165 = *((_QWORD *)v59 + 3);
    v61 = v166 + 1;
    v55 = v254;
    if (v166 >= v165 >> 1)
    {
      v218 = sub_23D6442E4((char *)(v165 > 1), v166 + 1, 1, v59);
      v55 = v254;
      v59 = v218;
    }
    *((_QWORD *)v59 + 2) = v61;
    v167 = v59 + 32;
    v168 = &v59[16 * v166 + 32];
    v169 = v264;
    *(_QWORD *)v168 = v62;
    *((_QWORD *)v168 + 1) = v169;
    if (v166)
    {
      while (1)
      {
        v170 = v61 - 1;
        if (v61 >= 4)
        {
          v175 = &v167[16 * v61];
          v176 = *((_QWORD *)v175 - 8);
          v177 = *((_QWORD *)v175 - 7);
          v181 = __OFSUB__(v177, v176);
          v178 = v177 - v176;
          if (v181)
            goto LABEL_134;
          v180 = *((_QWORD *)v175 - 6);
          v179 = *((_QWORD *)v175 - 5);
          v181 = __OFSUB__(v179, v180);
          v173 = v179 - v180;
          v174 = v181;
          if (v181)
            goto LABEL_135;
          v182 = v61 - 2;
          v183 = &v167[16 * v61 - 32];
          v185 = *(_QWORD *)v183;
          v184 = *((_QWORD *)v183 + 1);
          v181 = __OFSUB__(v184, v185);
          v186 = v184 - v185;
          if (v181)
            goto LABEL_137;
          v181 = __OFADD__(v173, v186);
          v187 = v173 + v186;
          if (v181)
            goto LABEL_140;
          if (v187 >= v178)
          {
            v205 = &v167[16 * v170];
            v207 = *(_QWORD *)v205;
            v206 = *((_QWORD *)v205 + 1);
            v181 = __OFSUB__(v206, v207);
            v208 = v206 - v207;
            if (v181)
              goto LABEL_144;
            v198 = v173 < v208;
            goto LABEL_101;
          }
        }
        else
        {
          if (v61 != 3)
          {
            v199 = *((_QWORD *)v59 + 4);
            v200 = *((_QWORD *)v59 + 5);
            v181 = __OFSUB__(v200, v199);
            v192 = v200 - v199;
            v193 = v181;
            goto LABEL_95;
          }
          v172 = *((_QWORD *)v59 + 4);
          v171 = *((_QWORD *)v59 + 5);
          v181 = __OFSUB__(v171, v172);
          v173 = v171 - v172;
          v174 = v181;
        }
        if ((v174 & 1) != 0)
          goto LABEL_136;
        v182 = v61 - 2;
        v188 = &v167[16 * v61 - 32];
        v190 = *(_QWORD *)v188;
        v189 = *((_QWORD *)v188 + 1);
        v191 = __OFSUB__(v189, v190);
        v192 = v189 - v190;
        v193 = v191;
        if (v191)
          goto LABEL_139;
        v194 = &v167[16 * v170];
        v196 = *(_QWORD *)v194;
        v195 = *((_QWORD *)v194 + 1);
        v181 = __OFSUB__(v195, v196);
        v197 = v195 - v196;
        if (v181)
          goto LABEL_142;
        if (__OFADD__(v192, v197))
          goto LABEL_143;
        if (v192 + v197 >= v173)
        {
          v198 = v173 < v197;
LABEL_101:
          if (v198)
            v170 = v182;
          goto LABEL_103;
        }
LABEL_95:
        if ((v193 & 1) != 0)
          goto LABEL_138;
        v201 = &v167[16 * v170];
        v203 = *(_QWORD *)v201;
        v202 = *((_QWORD *)v201 + 1);
        v181 = __OFSUB__(v202, v203);
        v204 = v202 - v203;
        if (v181)
          goto LABEL_141;
        if (v204 < v192)
          goto LABEL_15;
LABEL_103:
        v209 = v170 - 1;
        if (v170 - 1 >= v61)
        {
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
        if (!*v273)
          goto LABEL_158;
        v210 = a2;
        v211 = v59;
        v212 = &v167[16 * v209];
        v213 = *(_QWORD *)v212;
        v214 = &v167[16 * v170];
        v215 = *((_QWORD *)v214 + 1);
        v216 = v255;
        sub_23D64B6BC(*v273 + *(_QWORD *)(v55 + 72) * *(_QWORD *)v212, *v273 + *(_QWORD *)(v55 + 72) * *(_QWORD *)v214, *v273 + *(_QWORD *)(v55 + 72) * v215, v252, v210, v253);
        v255 = v216;
        if (v216)
        {
LABEL_125:
          v229 = v230;
          swift_bridgeObjectRelease();
          *(_QWORD *)(v229 + 16) = 0;
          return swift_bridgeObjectRelease();
        }
        if (v215 < v213)
          goto LABEL_131;
        if (v170 > *((_QWORD *)v211 + 2))
          goto LABEL_132;
        *(_QWORD *)v212 = v213;
        *(_QWORD *)&v167[16 * v209 + 8] = v215;
        v217 = *((_QWORD *)v211 + 2);
        if (v170 >= v217)
          goto LABEL_133;
        v61 = v217 - 1;
        memmove(&v167[16 * v170], v214 + 16, 16 * (v217 - 1 - v170));
        v59 = v211;
        *((_QWORD *)v211 + 2) = v217 - 1;
        v11 = v262;
        v22 = v248;
        a2 = v210;
        v55 = v254;
        if (v217 <= 2)
          goto LABEL_15;
      }
    }
    v61 = 1;
LABEL_15:
    v50 = v273[1];
    v58 = v264;
    v60 = v238;
    if (v264 >= v50)
    {
      v57 = v230;
      goto LABEL_113;
    }
  }
  if (__OFADD__(v62, v231))
    goto LABEL_153;
  if (v62 + v231 >= v50)
    v128 = (void (*)(uint64_t, uint64_t))v50;
  else
    v128 = (void (*)(uint64_t, uint64_t))(v62 + v231);
  if ((uint64_t)v128 >= v62)
  {
    if ((void (*)(uint64_t, uint64_t))v63 != v128)
    {
      v247 = v62;
      v129 = (uint64_t)v11;
      v130 = *(_QWORD *)(v55 + 72);
      v131 = v130 * (v63 - 1);
      v257 = v130;
      v132 = v63 * v130;
      v242 = v128;
      do
      {
        v134 = 0;
        v135 = v247;
        v264 = v63;
        v258 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v132;
        v259 = v131;
        while (1)
        {
          v269 = v135;
          v136 = *v273;
          v268 = v132 + v134;
          v137 = v270;
          sub_23D5AEF48(v132 + v134 + v136, v270, a2);
          v267 = v131 + v134;
          v138 = v271;
          sub_23D5AEF48(v131 + v134 + v136, v271, a2);
          v139 = v265;
          v140 = *(int *)(v265 + 48);
          v141 = v260;
          v142 = (uint64_t)&v260[v140];
          sub_23D5E7298(v137 + v140, (uint64_t)&v260[v140], type metadata accessor for GroupMembership.MemberProperties);
          v143 = v272;
          sub_23D5E7F64(v142, v272, type metadata accessor for GroupMembership.MemberProperties);
          v144 = *(int *)(v139 + 48);
          v145 = (uint64_t)&v141[v144];
          sub_23D5E7298(v138 + v144, (uint64_t)&v141[v144], type metadata accessor for GroupMembership.MemberProperties);
          sub_23D5E7F64(v145, (uint64_t)v22, type metadata accessor for GroupMembership.MemberProperties);
          v146 = (uint64_t)v22;
          v147 = v261;
          v148 = v129;
          sub_23D5AEF48(v143 + *(int *)(v261 + 28), v129, &qword_256C799E0);
          v149 = sub_23D66C330();
          v150 = *(_QWORD *)(v149 - 8);
          v151 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v150 + 48);
          if (v151(v129, 1, v149) == 1)
            goto LABEL_155;
          v152 = sub_23D66C1D4();
          v154 = v153;
          v155 = *(void (**)(uint64_t, uint64_t))(v150 + 8);
          v155(v148, v149);
          v156 = v256;
          sub_23D5AEF48(v146 + *(int *)(v147 + 28), v256, &qword_256C799E0);
          if (v151(v156, 1, v149) == 1)
            goto LABEL_156;
          v157 = sub_23D66C1D4();
          v159 = v158;
          v155(v156, v149);
          sub_23D617FF0(v157, v159, v152, v154);
          v161 = v160;
          sub_23D5DDA20(v157, v159);
          sub_23D5DDA20(v152, v154);
          sub_23D5E6950(v146, type metadata accessor for GroupMembership.MemberProperties);
          sub_23D5E6950(v272, type metadata accessor for GroupMembership.MemberProperties);
          a2 = v263;
          sub_23D5AEF8C(v271, v263);
          sub_23D5AEF8C(v270, a2);
          v22 = (char *)v146;
          if ((v161 & 1) == 0)
            break;
          v162 = *v273;
          if (!*v273)
            goto LABEL_157;
          v132 = (uint64_t)v258;
          v131 = v259;
          v163 = v162 + v259 + v134;
          sub_23D5F16C4((uint64_t)v258 + v162 + v134, v266, a2);
          v129 = (uint64_t)v262;
          swift_arrayInitWithTakeFrontToBack();
          sub_23D5F16C4(v266, v163, a2);
          v134 -= v257;
          v135 = v269 + 1;
          v133 = v264;
          if (v264 == v269 + 1)
            goto LABEL_55;
        }
        v129 = (uint64_t)v262;
        v133 = v264;
        v132 = (uint64_t)v258;
        v131 = v259;
LABEL_55:
        v63 = v133 + 1;
        v131 += v257;
        v132 += v257;
      }
      while ((void (*)(uint64_t, uint64_t))v63 != v242);
      v63 = (uint64_t)v242;
      v11 = (char *)v129;
      v62 = v247;
    }
    goto LABEL_64;
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
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  __break(1u);
LABEL_163:
  __break(1u);
LABEL_164:
  __break(1u);
LABEL_165:
  result = sub_23D66C714();
  __break(1u);
  return result;
}

uint64_t sub_23D64B224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t result;
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
  uint64_t (*v41)(char *, uint64_t, uint64_t);
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v71 = a4;
  v58 = a1;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v62 = (uint64_t)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v56 - v11;
  v74 = type metadata accessor for GroupMembership.MemberProperties(0);
  v13 = MEMORY[0x24BDAC7A8](v74);
  v76 = (uint64_t)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v56 - v15;
  v67 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v17 = MEMORY[0x24BDAC7A8](v67);
  v68 = (uint64_t)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v63 = (char *)&v56 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v56 - v22;
  result = MEMORY[0x24BDAC7A8](v21);
  v73 = (uint64_t)&v56 - v26;
  v66 = a3;
  v57 = a2;
  if (a3 != a2)
  {
    v27 = *(_QWORD *)(v25 + 72);
    v75 = v27 * (v66 - 1);
    v64 = v27;
    v28 = v27 * v66;
    v60 = v16;
    v61 = a5;
    v59 = v23;
LABEL_5:
    v29 = 0;
    v72 = v58;
    v65 = v28;
    while (1)
    {
      v30 = *v71;
      v70 = v28 + v29;
      v31 = v28 + v29 + v30;
      v32 = v73;
      sub_23D5AEF48(v31, v73, a5);
      v69 = v75 + v29;
      sub_23D5AEF48(v75 + v29 + v30, (uint64_t)v23, a5);
      v33 = v67;
      v34 = *(int *)(v67 + 48);
      v35 = v63;
      v36 = (uint64_t)&v63[v34];
      sub_23D5E7298(v32 + v34, (uint64_t)&v63[v34], type metadata accessor for GroupMembership.MemberProperties);
      sub_23D5E7F64(v36, (uint64_t)v16, type metadata accessor for GroupMembership.MemberProperties);
      v37 = *(int *)(v33 + 48);
      v38 = (uint64_t)&v35[v37];
      sub_23D5E7298((uint64_t)&v23[v37], (uint64_t)&v35[v37], type metadata accessor for GroupMembership.MemberProperties);
      sub_23D5E7F64(v38, v76, type metadata accessor for GroupMembership.MemberProperties);
      sub_23D5AEF48((uint64_t)&v16[*(int *)(v74 + 28)], (uint64_t)v12, &qword_256C799E0);
      v39 = sub_23D66C330();
      v40 = *(_QWORD *)(v39 - 8);
      v41 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48);
      result = v41(v12, 1, v39);
      if ((_DWORD)result == 1)
        break;
      v42 = sub_23D66C1D4();
      v44 = v43;
      v45 = *(void (**)(char *, uint64_t))(v40 + 8);
      v45(v12, v39);
      v46 = v62;
      sub_23D5AEF48(v76 + *(int *)(v74 + 28), v62, &qword_256C799E0);
      result = v41((char *)v46, 1, v39);
      if ((_DWORD)result == 1)
        goto LABEL_13;
      v47 = v12;
      v48 = sub_23D66C1D4();
      v50 = v49;
      v45((char *)v46, v39);
      sub_23D617FF0(v48, v50, v42, v44);
      v52 = v51;
      v53 = v48;
      v12 = v47;
      sub_23D5DDA20(v53, v50);
      sub_23D5DDA20(v42, v44);
      sub_23D5E6950(v76, type metadata accessor for GroupMembership.MemberProperties);
      v16 = v60;
      sub_23D5E6950((uint64_t)v60, type metadata accessor for GroupMembership.MemberProperties);
      v23 = v59;
      a5 = v61;
      sub_23D5AEF8C((uint64_t)v59, v61);
      result = sub_23D5AEF8C(v73, a5);
      v28 = v65;
      if ((v52 & 1) != 0)
      {
        v54 = *v71;
        if (!*v71)
          goto LABEL_14;
        v55 = v54 + v75 + v29;
        sub_23D5F16C4(v54 + v65 + v29, v68, a5);
        swift_arrayInitWithTakeFrontToBack();
        result = sub_23D5F16C4(v68, v55, a5);
        v29 -= v64;
        if (v66 != ++v72)
          continue;
      }
      v75 += v64;
      v28 += v64;
      if (++v66 == v57)
        return result;
      goto LABEL_5;
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
  }
  return result;
}

uint64_t sub_23D64B6BC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t *a5, uint64_t a6)
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
  char *v23;
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
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int (*v60)(uint64_t, uint64_t, uint64_t);
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  char v70;
  char v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unsigned int (*v93)(uint64_t, uint64_t, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  void (*v99)(uint64_t, uint64_t);
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  char v105;
  char v106;
  BOOL v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t result;
  _QWORD v113[2];
  char *v114;
  unint64_t v115;
  unint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  unint64_t v129;
  char *v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v119 = (uint64_t)v113 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v121 = (uint64_t)v113 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v118 = (uint64_t)v113 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v120 = (uint64_t)v113 - v19;
  v20 = type metadata accessor for GroupMembership.MemberProperties(0);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)v113 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v21);
  v129 = (unint64_t)v113 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v114 = (char *)v113 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v128 = (unint64_t)v113 - v28;
  v133 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v29 = MEMORY[0x24BDAC7A8](v133);
  v127 = (uint64_t)v113 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = MEMORY[0x24BDAC7A8](v29);
  v126 = (uint64_t)v113 - v32;
  v33 = MEMORY[0x24BDAC7A8](v31);
  v130 = (char *)v113 - v34;
  v35 = MEMORY[0x24BDAC7A8](v33);
  v125 = (unint64_t)v113 - v36;
  MEMORY[0x24BDAC7A8](v35);
  v124 = (uint64_t)v113 - v37;
  v131 = *(_QWORD *)(v38 + 72);
  if (!v131)
  {
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  if (a2 - a1 == 0x8000000000000000 && v131 == -1)
    goto LABEL_66;
  v39 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v131 == -1)
    goto LABEL_67;
  v40 = (uint64_t)(a2 - a1) / v131;
  v137 = a1;
  v136 = a4;
  v41 = v39 / v131;
  v122 = a5;
  v123 = v20;
  v113[0] = a6;
  if (v40 >= v39 / v131)
  {
    if ((v41 & 0x8000000000000000) == 0)
    {
      v44 = v41 * v131;
      v117 = v23;
      if (a4 < a2 || a2 + v44 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v77 = a4 + v44;
      v135 = a4 + v44;
      v137 = a2;
      if (v44 >= 1 && a1 < a2)
      {
        v79 = -v131;
        v116 = a4;
        v115 = a1;
        v131 = -v131;
        while (1)
        {
          v132 = a3;
          v80 = v126;
          sub_23D5AEF48(v77 + v79, v126, a5);
          v134 = a2;
          v125 = a2 + v79;
          v81 = v127;
          sub_23D5AEF48(a2 + v79, v127, a5);
          v82 = v133;
          v83 = *(int *)(v133 + 48);
          v84 = v130;
          v85 = (uint64_t)&v130[v83];
          sub_23D5E7298(v80 + v83, (uint64_t)&v130[v83], type metadata accessor for GroupMembership.MemberProperties);
          v86 = v129;
          sub_23D5E7F64(v85, v129, type metadata accessor for GroupMembership.MemberProperties);
          v87 = *(int *)(v82 + 48);
          v88 = (uint64_t)&v84[v87];
          sub_23D5E7298(v81 + v87, (uint64_t)&v84[v87], type metadata accessor for GroupMembership.MemberProperties);
          v89 = (uint64_t)v117;
          sub_23D5E7F64(v88, (uint64_t)v117, type metadata accessor for GroupMembership.MemberProperties);
          v90 = v121;
          sub_23D5AEF48(v86 + *(int *)(v20 + 28), v121, &qword_256C799E0);
          v91 = sub_23D66C330();
          v92 = *(_QWORD *)(v91 - 8);
          v93 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v92 + 48);
          if (v93(v90, 1, v91) == 1)
            goto LABEL_69;
          v94 = v20;
          v95 = v90;
          v96 = sub_23D66C1D4();
          v98 = v97;
          v99 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
          v99(v95, v91);
          v100 = v119;
          sub_23D5AEF48(v89 + *(int *)(v94 + 28), v119, &qword_256C799E0);
          if (v93(v100, 1, v91) == 1)
            goto LABEL_71;
          v101 = v132;
          v128 = v132 + v131;
          v102 = sub_23D66C1D4();
          v104 = v103;
          v99(v100, v91);
          sub_23D617FF0(v102, v104, v96, v98);
          v106 = v105;
          sub_23D5DDA20(v102, v104);
          sub_23D5DDA20(v96, v98);
          sub_23D5E6950(v89, type metadata accessor for GroupMembership.MemberProperties);
          sub_23D5E6950(v129, type metadata accessor for GroupMembership.MemberProperties);
          a5 = v122;
          sub_23D5AEF8C(v127, v122);
          sub_23D5AEF8C(v126, a5);
          if ((v106 & 1) != 0)
          {
            v20 = v123;
            a3 = v128;
            if (v101 < v134 || v128 >= v134)
            {
              v110 = v125;
              swift_arrayInitWithTakeFrontToBack();
              v108 = v116;
              v109 = v115;
              v79 = v131;
            }
            else
            {
              v107 = v101 == v134;
              v108 = v116;
              v109 = v115;
              v79 = v131;
              v110 = v125;
              if (!v107)
                swift_arrayInitWithTakeBackToFront();
            }
            v137 += v79;
          }
          else
          {
            v111 = v135;
            v79 = v131;
            v135 += v131;
            v20 = v123;
            a3 = v128;
            if (v101 < v111 || v128 >= v111)
            {
              swift_arrayInitWithTakeFrontToBack();
              v110 = v134;
            }
            else
            {
              v110 = v134;
              if (v101 != v111)
                swift_arrayInitWithTakeBackToFront();
            }
            v108 = v116;
            v109 = v115;
          }
          v77 = v135;
          if (v135 > v108)
          {
            a2 = v110;
            if (v110 > v109)
              continue;
          }
          goto LABEL_64;
        }
      }
      goto LABEL_64;
    }
  }
  else if ((v40 & 0x8000000000000000) == 0)
  {
    v42 = v40 * v131;
    v43 = (uint64_t)v114;
    if (a4 < a1 || a1 + v42 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v129 = a4 + v42;
    v135 = a4 + v42;
    if (v42 >= 1 && a2 < a3)
    {
      v132 = a3;
      while (1)
      {
        v46 = v20;
        v134 = a2;
        v47 = v124;
        sub_23D5AEF48(a2, v124, a5);
        v48 = v125;
        sub_23D5AEF48(a4, v125, a5);
        v49 = v133;
        v50 = *(int *)(v133 + 48);
        v51 = v130;
        v52 = (uint64_t)&v130[v50];
        sub_23D5E7298(v47 + v50, (uint64_t)&v130[v50], type metadata accessor for GroupMembership.MemberProperties);
        v53 = v128;
        sub_23D5E7F64(v52, v128, type metadata accessor for GroupMembership.MemberProperties);
        v54 = *(int *)(v49 + 48);
        v55 = (uint64_t)&v51[v54];
        sub_23D5E7298(v48 + v54, (uint64_t)&v51[v54], type metadata accessor for GroupMembership.MemberProperties);
        sub_23D5E7F64(v55, v43, type metadata accessor for GroupMembership.MemberProperties);
        v56 = v120;
        sub_23D5AEF48(v53 + *(int *)(v46 + 28), v120, &qword_256C799E0);
        v57 = sub_23D66C330();
        v58 = *(_QWORD *)(v57 - 8);
        v59 = v43;
        v60 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48);
        if (v60(v56, 1, v57) == 1)
          goto LABEL_68;
        v61 = sub_23D66C1D4();
        v63 = v62;
        v64 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
        v64(v56, v57);
        v65 = v59 + *(int *)(v46 + 28);
        v66 = v118;
        sub_23D5AEF48(v65, v118, &qword_256C799E0);
        if (v60(v66, 1, v57) == 1)
          goto LABEL_70;
        v67 = sub_23D66C1D4();
        v69 = v68;
        v64(v66, v57);
        sub_23D617FF0(v67, v69, v61, v63);
        v71 = v70;
        sub_23D5DDA20(v67, v69);
        sub_23D5DDA20(v61, v63);
        sub_23D5E6950(v59, type metadata accessor for GroupMembership.MemberProperties);
        sub_23D5E6950(v128, type metadata accessor for GroupMembership.MemberProperties);
        a5 = v122;
        sub_23D5AEF8C(v125, v122);
        sub_23D5AEF8C(v124, a5);
        v72 = v137;
        if ((v71 & 1) != 0)
        {
          v43 = v59;
          v73 = v134 + v131;
          v20 = v123;
          if (v137 < v134 || v137 >= v73)
          {
            swift_arrayInitWithTakeFrontToBack();
            v74 = v132;
          }
          else
          {
            v74 = v132;
            if (v137 == v134)
              v72 = v134;
            else
              swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          v75 = v136 + v131;
          v20 = v123;
          v76 = v134;
          if (v137 < v136 || v137 >= v75)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v137 != v136)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v136 = v75;
          v73 = v76;
          v74 = v132;
          v43 = (uint64_t)v114;
        }
        v137 = v72 + v131;
        a4 = v136;
        if (v136 < v129)
        {
          a2 = v73;
          if (v73 < v74)
            continue;
        }
        break;
      }
    }
LABEL_64:
    ((void (*)(unint64_t *, unint64_t *, unint64_t *))v113[0])(&v137, &v136, &v135);
    return 1;
  }
LABEL_72:
  result = sub_23D66C768();
  __break(1u);
  return result;
}

uint64_t sub_23D64C090(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_23D66BC88();
  if (!result || (result = sub_23D66BCAC(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_23D66BCA0();
      return sub_23D66BD60();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_23D64C120(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[3] = MEMORY[0x24BDCDDE8];
  v3[4] = MEMORY[0x24BDCDDC8];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_23D64C184
     + *((int *)qword_23D64C328 + (__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x24BDCDDE8])[1] >> 62));
  __asm { BR              X10 }
}

uint64_t sub_23D64C194()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v3;

  sub_23D5AFA60(v1, v0);
  sub_23D66BD60();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v3);
}

uint64_t sub_23D64C338(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;

  v19 = a2;
  v20 = a3;
  v5 = type metadata accessor for HashAndCipher();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  if (v9)
  {
    v21 = MEMORY[0x24BEE4AF8];
    sub_23D5DE334(0, v9, 0);
    v10 = v21;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79AD8);
    v12 = *(_QWORD *)(v11 - 8);
    v13 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    v17 = *(_QWORD *)(v12 + 72);
    v18 = v11;
    while (1)
    {
      v19(v13, v13 + *(int *)(v18 + 48));
      if (v3)
        break;
      v21 = v10;
      v15 = *(_QWORD *)(v10 + 16);
      v14 = *(_QWORD *)(v10 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_23D5DE334(v14 > 1, v15 + 1, 1);
        v10 = v21;
      }
      *(_QWORD *)(v10 + 16) = v15 + 1;
      sub_23D5E7F64((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v15, (uint64_t (*)(_QWORD))type metadata accessor for HashAndCipher);
      v13 += v17;
      if (!--v9)
        return v10;
    }
    swift_release();
  }
  return v10;
}

uint64_t sub_23D64C4B8(uint64_t a1, uint64_t (*a2)(char *, uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;

  v24 = a2;
  v25 = a3;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79A08);
  v5 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v7 = (uint64_t *)((char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *(_QWORD *)(a1 + 16);
  v9 = MEMORY[0x24BEE4AF8];
  if (v8)
  {
    v26 = MEMORY[0x24BEE4AF8];
    sub_23D5DE2DC(0, v8, 0);
    v9 = v26;
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0);
    v11 = *(_QWORD *)(v10 - 8);
    v12 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    v21 = *(_QWORD *)(v11 + 72);
    v22 = v10;
    while (1)
    {
      v13 = v24((char *)v7 + *(int *)(v23 + 64), v12, v12 + *(int *)(v22 + 48));
      if (v3)
        break;
      *v7 = v13;
      v7[1] = v14;
      v7[2] = v15;
      v7[3] = v16;
      v26 = v9;
      v18 = *(_QWORD *)(v9 + 16);
      v17 = *(_QWORD *)(v9 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_23D5DE2DC(v17 > 1, v18 + 1, 1);
        v9 = v26;
      }
      *(_QWORD *)(v9 + 16) = v18 + 1;
      sub_23D5F16C4((uint64_t)v7, v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v18, &qword_256C79A08);
      v12 += v21;
      if (!--v8)
        return v9;
    }
    swift_release();
  }
  return v9;
}

uint64_t sub_23D64C650(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_23D648360(a1, a2, v2[2], v2[3], v2[4], v2[5]);
}

unint64_t sub_23D64C66C()
{
  unint64_t result;

  result = qword_256C7BF58;
  if (!qword_256C7BF58)
  {
    result = MEMORY[0x242636790](MEMORY[0x24BDCFB88], MEMORY[0x24BEE0F88]);
    atomic_store(result, (unint64_t *)&qword_256C7BF58);
  }
  return result;
}

uint64_t sub_23D64C6B0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;

  return sub_23D648494(a1, *(_QWORD *)(v3 + 16), a2, a3);
}

void sub_23D64C6CC(uint64_t a1, uint64_t a2)
{
  sub_23D5E6578(a1, a2);
}

uint64_t sub_23D64C6D4(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79A08);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v23 = (uint64_t)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (uint64_t *)((char *)&v18 - v9);
  result = MEMORY[0x24BEE4AF8];
  v24 = MEMORY[0x24BEE4AF8];
  v12 = *(_QWORD *)(a1 + 16);
  if (v12)
  {
    v18 = v2;
    v13 = *(_QWORD *)(v8 + 72);
    v21 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v14 = a1 + v21;
    v15 = MEMORY[0x24BEE4AF8];
    v22 = v5;
    v19 = v13;
    v20 = a2;
    do
    {
      sub_23D5AEF48(v14, (uint64_t)v10, &qword_256C79A08);
      if ((a2(*v10, v10[1], v10[2], v10[3], (char *)v10 + *(int *)(v5 + 64)) & 1) != 0)
      {
        sub_23D5F16C4((uint64_t)v10, v23, &qword_256C79A08);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_23D5DE2DC(0, *(_QWORD *)(v15 + 16) + 1, 1);
        v15 = v24;
        v17 = *(_QWORD *)(v24 + 16);
        v16 = *(_QWORD *)(v24 + 24);
        if (v17 >= v16 >> 1)
        {
          sub_23D5DE2DC(v16 > 1, v17 + 1, 1);
          v15 = v24;
        }
        *(_QWORD *)(v15 + 16) = v17 + 1;
        v13 = v19;
        sub_23D5F16C4(v23, v15 + v21 + v17 * v19, &qword_256C79A08);
        a2 = v20;
        v5 = v22;
      }
      else
      {
        sub_23D5AEF8C((uint64_t)v10, &qword_256C79A08);
      }
      v14 += v13;
      --v12;
    }
    while (v12);
    return v24;
  }
  return result;
}

uint64_t sub_23D64C8B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23D6485F8(a1, *(_QWORD *)(v2 + 32), a2);
}

uint64_t sub_23D64C8D0@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_23D648B18(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), a2);
}

uint64_t sub_23D64C8F0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;

  return sub_23D648E20(a1, *(_QWORD *)(v3 + 16), a2, a3);
}

uint64_t type metadata accessor for HashAndCipher()
{
  uint64_t result;

  result = qword_256C7BFC0;
  if (!qword_256C7BFC0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t *sub_23D64C948(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    sub_23D5AFA60(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    v9 = *(int *)(a3 + 20);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_23D66C108();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  }
  return a1;
}

uint64_t sub_23D64C9EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_23D5DDA20(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_23D66C108();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t *sub_23D64CA38(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = *a2;
  v7 = a2[1];
  sub_23D5AFA60(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_23D66C108();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  return a1;
}

uint64_t *sub_23D64CAB0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = *a2;
  v7 = a2[1];
  sub_23D5AFA60(*a2, v7);
  v8 = *a1;
  v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_23D5DDA20(v8, v9);
  v10 = *(int *)(a3 + 20);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_23D66C108();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *sub_23D64CB30(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23D66C108();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t *sub_23D64CB8C(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = *a1;
  v7 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_23D5DDA20(v6, v7);
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_23D66C108();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_23D64CBFC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23D64CC08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 12)
  {
    v4 = *(_QWORD *)(a1 + 8) >> 60;
    if (((4 * (_DWORD)v4) & 0xC) != 0)
      return 16 - ((4 * (_DWORD)v4) & 0xC | (v4 >> 2));
    else
      return 0;
  }
  else
  {
    v8 = sub_23D66C108();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_23D64CC90()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_23D64CC9C(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 12)
  {
    *(_QWORD *)result = 0;
    *((_QWORD *)result + 1) = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  }
  else
  {
    v7 = sub_23D66C108();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_23D64CD18()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23D66C108();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23D64CD8C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
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
  char *v16;
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
  char *v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;

  v32 = a5;
  v31 = a4;
  v45 = a2;
  v46 = a3;
  v37 = a1;
  v39 = sub_23D66C258();
  v36 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v38 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_23D66C1C8();
  v33 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v40 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23D66BE80();
  MEMORY[0x24BDAC7A8](v7);
  v43 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = type metadata accessor for GKCrypto_HPKEOneShotCipherText(0);
  MEMORY[0x24BDAC7A8](v44);
  v42 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_23D66C174();
  v10 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23D66C15C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23D66C168();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = sub_23D66C150();
  v48 = *(_QWORD *)(v54 - 8);
  v21 = MEMORY[0x24BDAC7A8](v54);
  v35 = (char *)&v31 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v31 - v23;
  (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, *MEMORY[0x24BDC6768], v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x24BDC6758], v13);
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BDC6778], v41);
  v25 = (uint64_t)v42;
  sub_23D66C144();
  v53 = 0;
  v51 = 0u;
  v52 = 0u;
  sub_23D5AFA60(v45, v46);
  sub_23D66BE74();
  sub_23D64D230();
  v26 = v44;
  v27 = v47;
  sub_23D66BF10();
  if (v27)
  {
    (*(void (**)(char *, uint64_t))(v48 + 8))(v24, v54);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v38, v37, v39);
    (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v35, v24, v54);
    sub_23D5AFA60(*(_QWORD *)v25, *(_QWORD *)(v25 + 8));
    v28 = v40;
    sub_23D66C1B0();
    v29 = v48;
    v51 = *(_OWORD *)(v25 + 16);
    v49 = v31;
    v50 = v32;
    sub_23D5E6898();
    v26 = sub_23D66C1BC();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v34);
    sub_23D64D278(v25);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v24, v54);
  }
  return v26;
}

unint64_t sub_23D64D230()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256C7A280;
  if (!qword_256C7A280)
  {
    v1 = type metadata accessor for GKCrypto_HPKEOneShotCipherText(255);
    result = MEMORY[0x242636790](&unk_23D670CDC, v1);
    atomic_store(result, (unint64_t *)&qword_256C7A280);
  }
  return result;
}

uint64_t sub_23D64D278(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for GKCrypto_HPKEOneShotCipherText(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_23D64D2B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;

  v41 = a4;
  v42 = a5;
  v39 = a2;
  v40 = a3;
  v53 = a1;
  v43 = type metadata accessor for GKCrypto_HPKEOneShotCipherText(0);
  MEMORY[0x24BDAC7A8](v43);
  v44 = (uint64_t *)((char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_23D66C210();
  v51 = *(_QWORD *)(v6 - 8);
  v52 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v50 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23D66C1A4();
  v37 = *(_QWORD *)(v8 - 8);
  v38 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v47 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23D66C174();
  v48 = *(_QWORD *)(v10 - 8);
  v49 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23D66C15C();
  v45 = *(_QWORD *)(v13 - 8);
  v46 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23D66C168();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_23D66C150();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v37 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v37 - v25;
  v27 = v16;
  v28 = v47;
  (*(void (**)(char *, _QWORD, uint64_t))(v17 + 104))(v19, *MEMORY[0x24BDC6768], v27);
  (*(void (**)(char *, _QWORD, uint64_t))(v45 + 104))(v15, *MEMORY[0x24BDC6758], v46);
  (*(void (**)(char *, _QWORD, uint64_t))(v48 + 104))(v12, *MEMORY[0x24BDC6778], v49);
  v29 = v21;
  sub_23D66C144();
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v50, v53, v52);
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v26, v20);
  v30 = v58;
  sub_23D66C180();
  if (v30)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v20);
  }
  else
  {
    v58 = v26;
    v32 = v37;
    v31 = v38;
    v33 = v44;
    *((_OWORD *)v44 + 1) = xmmword_23D66DF40;
    sub_23D66BE5C();
    *v33 = sub_23D66C18C();
    v33[1] = v34;
    v56 = v39;
    v57 = v40;
    v54 = v41;
    v55 = v42;
    sub_23D5E6898();
    v33[2] = sub_23D66C198();
    v33[3] = v35;
    sub_23D64D230();
    v26 = (char *)sub_23D66BF1C();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v28, v31);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v58, v20);
    sub_23D64D278((uint64_t)v33);
  }
  return v26;
}

uint64_t sub_23D64D69C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t sub_23D64D6B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_23D64D6CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_23D64D6E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t))(a9 + 32))(a1);
}

uint64_t sub_23D64D70C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 40))();
}

uint64_t sub_23D64D724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t sub_23D64D73C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t sub_23D64D754(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t result;
  _QWORD v12[7];
  __int128 v13;
  uint64_t v14;
  _QWORD v15[5];

  v3 = *a1;
  v4 = a1[1];
  v5 = *a2;
  v6 = a2[1];
  if (qword_25431AB48 != -1)
    swift_once();
  swift_beginAccess();
  sub_23D5AEF48((uint64_t)&unk_25431AC10, (uint64_t)&v13, &qword_25431A9A8);
  if (v14)
  {
    sub_23D5AEF30(&v13, (uint64_t)v15);
    swift_endAccess();
    v7 = __swift_project_boxed_opaque_existential_1(v15, v15[3]);
    MEMORY[0x24BDAC7A8](v7);
    v12[2] = v8;
    v12[3] = v3;
    v12[4] = v4;
    v12[5] = v5;
    v12[6] = v6;
    v10 = v9;
    sub_23D640124((uint64_t)sub_23D652644, (uint64_t)v12, &v13);

    if (!v2)
      v10 = (id)v13;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    return (uint64_t)v10;
  }
  else
  {
    sub_23D5AEF8C((uint64_t)&v13, &qword_25431A9A8);
    result = sub_23D66C720();
    __break(1u);
  }
  return result;
}

uint64_t sub_23D64D910(uint64_t *a1, uint64_t *a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t result;
  _QWORD v17[7];
  int v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  _QWORD v23[5];

  v8 = *a1;
  v9 = a1[1];
  v10 = *a2;
  v11 = a2[1];
  if (qword_25431AB48 != -1)
    swift_once();
  swift_beginAccess();
  sub_23D5AEF48((uint64_t)&unk_25431AC10, (uint64_t)&v21, &qword_25431A9A8);
  if (v22)
  {
    sub_23D5AEF30(&v21, (uint64_t)v23);
    swift_endAccess();
    v12 = __swift_project_boxed_opaque_existential_1(v23, v23[3]);
    MEMORY[0x24BDAC7A8](v12);
    v17[2] = v13;
    v17[3] = v8;
    v17[4] = v9;
    v17[5] = v10;
    v17[6] = v11;
    v18 = a3;
    v19 = a4;
    v20 = a5;
    v15 = v14;
    sub_23D6402E4((uint64_t)sub_23D65261C, (uint64_t)v17);

    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  }
  else
  {
    sub_23D5AEF8C((uint64_t)&v21, &qword_25431A9A8);
    result = sub_23D66C720();
    __break(1u);
  }
  return result;
}

uint64_t sub_23D64DABC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t result;
  _QWORD v20[7];
  int v21;
  __int128 *v22;
  int v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];

  v23 = a7;
  v11 = *a1;
  v12 = a1[1];
  v13 = *a2;
  v14 = a2[1];
  if (qword_25431AB48 != -1)
    swift_once();
  swift_beginAccess();
  sub_23D5AEF48((uint64_t)&unk_25431AC10, (uint64_t)&v24, &qword_25431A9A8);
  if (v26)
  {
    sub_23D5AEF30(&v24, (uint64_t)v27);
    swift_endAccess();
    v15 = __swift_project_boxed_opaque_existential_1(v27, v27[3]);
    *(_QWORD *)&v24 = a3;
    *((_QWORD *)&v24 + 1) = a4;
    v25 = a5;
    v26 = a6;
    MEMORY[0x24BDAC7A8](v15);
    v20[2] = v16;
    v20[3] = v11;
    v20[4] = v12;
    v20[5] = v13;
    v20[6] = v14;
    v21 = v23;
    v22 = &v24;
    v18 = v17;
    sub_23D6402E4((uint64_t)sub_23D6525F4, (uint64_t)v20);

    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  }
  else
  {
    sub_23D5AEF8C((uint64_t)&v24, &qword_25431A9A8);
    result = sub_23D66C720();
    __break(1u);
  }
  return result;
}

uint64_t sub_23D64DC80(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t result;
  _QWORD v17[7];
  int v18;
  __int128 *v19;
  __int128 v20;
  uint64_t v21;
  _QWORD v22[5];

  v8 = *a1;
  v9 = a1[1];
  v10 = *a2;
  v11 = a2[1];
  if (qword_25431AB48 != -1)
    swift_once();
  swift_beginAccess();
  sub_23D5AEF48((uint64_t)&unk_25431AC10, (uint64_t)&v20, &qword_25431A9A8);
  if (v21)
  {
    sub_23D5AEF30(&v20, (uint64_t)v22);
    swift_endAccess();
    v12 = __swift_project_boxed_opaque_existential_1(v22, v22[3]);
    *(_QWORD *)&v20 = a3;
    *((_QWORD *)&v20 + 1) = a4;
    MEMORY[0x24BDAC7A8](v12);
    v17[2] = v13;
    v17[3] = v8;
    v17[4] = v9;
    v17[5] = v10;
    v17[6] = v11;
    v18 = a5;
    v19 = &v20;
    v15 = v14;
    sub_23D6402E4((uint64_t)sub_23D6525CC, (uint64_t)v17);

    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  }
  else
  {
    sub_23D5AEF8C((uint64_t)&v20, &qword_25431A9A8);
    result = sub_23D66C720();
    __break(1u);
  }
  return result;
}

uint64_t sub_23D64DE34@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _QWORD v19[7];
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];

  v7 = *a1;
  v8 = a1[1];
  v9 = *a2;
  v10 = a2[1];
  if (qword_25431AB48 != -1)
    swift_once();
  swift_beginAccess();
  sub_23D5AEF48((uint64_t)&unk_25431AC10, (uint64_t)&v23, &qword_25431A9A8);
  if (*((_QWORD *)&v24 + 1))
  {
    sub_23D5AEF30(&v23, (uint64_t)v27);
    swift_endAccess();
    v11 = __swift_project_boxed_opaque_existential_1(v27, v27[3]);
    MEMORY[0x24BDAC7A8](v11);
    v19[2] = v12;
    v19[3] = v7;
    v19[4] = v8;
    v19[5] = v9;
    v19[6] = v10;
    v20 = a3;
    v14 = v13;
    sub_23D640490((uint64_t)sub_23D6525A8, (uint64_t)v19, (uint64_t)&v23);

    if (v4)
    {
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
    }
    else
    {
      v21 = v24;
      v22 = v23;
      v16 = v25;
      v17 = v26;
      result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
      v18 = v21;
      *(_OWORD *)a4 = v22;
      *(_OWORD *)(a4 + 16) = v18;
      *(_QWORD *)(a4 + 32) = v16;
      *(_QWORD *)(a4 + 40) = v17;
    }
  }
  else
  {
    sub_23D5AEF8C((uint64_t)&v23, &qword_25431A9A8);
    result = sub_23D66C720();
    __break(1u);
  }
  return result;
}

uint64_t sub_23D64E010(uint64_t *a1, uint64_t (*a2)(uint64_t), void (*a3)(_QWORD), uint64_t (*a4)(id), void (*a5)(id **, void ***, void ***))
{
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v14[2];

  v10 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v10 = a2(v10);
    *a1 = v10;
  }
  v12 = *(_QWORD *)(v10 + 16);
  v14[0] = v10 + 32;
  v14[1] = v12;
  sub_23D650E98(v14, a3, a4, a5);
  return sub_23D66C69C();
}

void sub_23D64E0B4(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = v2;
  v6 = a2 & 1;
  *(_QWORD *)(v3 + 16) = a1;
  swift_retain();
  *(_QWORD *)(v3 + 32) = sub_23D617574();
  *(_BYTE *)(v3 + 40) = v6;
  if ((a2 & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 144) == 1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
      sub_23D5ED518((unint64_t *)&qword_256C790E0, &qword_256C790D8, (uint64_t)&protocol conformance descriptor for GroupKitCryptoError<A>);
      swift_allocError();
      *(_BYTE *)v7 = -94;
      v8 = 126;
      goto LABEL_6;
    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 160) == 1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
      sub_23D5ED518((unint64_t *)&qword_256C790E0, &qword_256C790D8, (uint64_t)&protocol conformance descriptor for GroupKitCryptoError<A>);
      swift_allocError();
      *(_BYTE *)v7 = -93;
      v8 = 132;
LABEL_6:
      *(_BYTE *)(v7 + 1) = 1;
      *(_QWORD *)(v7 + 8) = v8;
      *(_QWORD *)(v7 + 16) = 0xD000000000000022;
      *(_QWORD *)(v7 + 24) = 0x800000023D67A900;
      *(_QWORD *)(v7 + 32) = 0xD000000000000086;
      *(_QWORD *)(v7 + 40) = 0x800000023D677A80;
      swift_willThrow();
      swift_release();
      swift_release();

      type metadata accessor for DeviceToDeviceEncryptedContainerInteraction();
      swift_deallocPartialClassInstance();
      return;
    }
    v9 = *(_QWORD *)(a1 + 152);
    v10 = objc_msgSend(*(id *)(a1 + 168), sel_persistentStoreCoordinator);
    v11 = objc_msgSend(v10, sel_persistentStores);

    sub_23D643600(0, &qword_25431A858);
    v12 = sub_23D66C4BC();

    if ((v12 & 0xC000000000000001) != 0)
      goto LABEL_16;
    if ((v9 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_18;
    }
    if (v9 < *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_14:
      v15 = *(id *)(v12 + 8 * v9 + 32);
LABEL_15:
      v16 = v15;
      swift_release();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v3 + 24) = v16;
      return;
    }
    __break(1u);
  }
  v9 = *(_QWORD *)(a1 + 136);
  v13 = objc_msgSend(*(id *)(a1 + 168), sel_persistentStoreCoordinator);
  v14 = objc_msgSend(v13, sel_persistentStores);

  sub_23D643600(0, &qword_25431A858);
  v12 = sub_23D66C4BC();

  if ((v12 & 0xC000000000000001) != 0)
  {
LABEL_16:
    v15 = (id)MEMORY[0x242636040](v9, v12);
    goto LABEL_15;
  }
  if ((v9 & 0x8000000000000000) != 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v9 < *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_14;
LABEL_19:
  __break(1u);
}

void sub_23D64E394(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, unint64_t a5, unsigned int a6, uint64_t a7, unint64_t a8)
{
  uint64_t v8;
  id *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v29 = a2;
  v30 = a3;
  v27 = a4;
  v28 = a5;
  v17 = sub_23D64F7F4((uint64_t *)&v29, (uint64_t)&v27);
  if (!v8)
  {
    v26 = a6;
    if (v17)
    {
      v18 = v17;
      if ((uint64_t)objc_msgSend(v17, sel_groupVersion) >= a6)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
        sub_23D5ED518((unint64_t *)&qword_256C790E0, &qword_256C790D8, (uint64_t)&protocol conformance descriptor for GroupKitCryptoError<A>);
        swift_allocError();
        *(_WORD *)v24 = 388;
        *(_OWORD *)(v24 + 8) = xmmword_23D674560;
        *(_QWORD *)(v24 + 24) = 0x800000023D67A930;
        *(_QWORD *)(v24 + 32) = 0xD000000000000086;
        *(_QWORD *)(v24 + 40) = 0x800000023D677A80;
        swift_willThrow();

        return;
      }
      v19 = (void *)sub_23D66BD84();
      objc_msgSend(v18, sel_setBlobData_, v19);

      objc_msgSend(v18, sel_setGroupVersion_, a6);
    }
    else
    {
      type metadata accessor for GroupKitCryptoGroupBlob();
      v29 = a2;
      v30 = a3;
      v27 = a4;
      v28 = a5;
      v20 = a1;
      v21 = *(void **)(a1 + 32);
      sub_23D5AFA60((uint64_t)a2, a3);
      sub_23D5AFA60(a4, a5);
      sub_23D5AFA60(a7, a8);
      v18 = sub_23D62F040((uint64_t *)&v29, &v27, a7, a8, v26, v21);
      objc_msgSend(*(id *)(v20 + 32), sel_assignObject_toPersistentStore_, v18, *(_QWORD *)(v20 + 24));
      a1 = v20;
    }

    v22 = *(void **)(a1 + 32);
    v29 = 0;
    if (objc_msgSend(v22, sel_save_, &v29))
    {
      v23 = v29;
    }
    else
    {
      v25 = v29;
      sub_23D66BCDC();

      swift_willThrow();
    }
  }
}

void sub_23D64E628(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t i;
  id v41;
  void *v42;
  void *v43;
  void (*v44)(char *, uint64_t);
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  char *v65;
  id v66[2];

  v66[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = sub_23D66BE20();
  v47 = *(_QWORD *)(v5 - 8);
  v48 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v65 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  v7 = a1[1];
  v9 = *a2;
  v61 = a2[1];
  v62 = v9;
  v10 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v11 = (void *)sub_23D66C390();
  v12 = objc_msgSend(v10, sel_initWithEntityName_, v11);

  __swift_instantiateConcreteTypeFromMangledName(&qword_25431A870);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_23D673120;
  v14 = *(void **)(v2 + 24);
  *(_QWORD *)(v13 + 32) = v14;
  v66[0] = (id)v13;
  sub_23D66C4C8();
  sub_23D643600(0, &qword_25431A858);
  v15 = v12;
  v64 = v15;
  v16 = v14;
  v17 = (void *)sub_23D66C4A4();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setAffectedStores_, v17);

  v57 = sub_23D643600(0, &qword_256C7BF00);
  swift_getKeyPath();
  v58 = (id)sub_23D66C564();
  swift_getKeyPath();
  v59 = sub_23D66C564();
  sub_23D5AFA60(v8, v7);
  v56 = sub_23D66BDD8();
  v55 = sub_23D66BDD8();
  v54 = sub_23D66BDD8();
  v53 = sub_23D66BDD8();
  v52 = sub_23D66BDD8();
  v51 = sub_23D66BDD8();
  v50 = sub_23D66BDD8();
  v49 = sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  v18 = v65;
  sub_23D66BDFC();
  sub_23D5DDA20(v8, v7);
  sub_23D643600(0, &qword_256C7BF08);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79A40);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_23D66E0E0;
  v20 = v57;
  *(_QWORD *)(v19 + 56) = v57;
  v21 = sub_23D643638(&qword_256C7BF10, &qword_256C7BF00);
  *(_QWORD *)(v19 + 64) = v21;
  v22 = v58;
  *(_QWORD *)(v19 + 32) = v58;
  v58 = v22;
  v23 = sub_23D66BDE4();
  *(_QWORD *)(v19 + 96) = sub_23D643600(0, &qword_256C7BF18);
  v24 = sub_23D643638(&qword_256C7BF20, &qword_256C7BF18);
  *(_QWORD *)(v19 + 72) = v23;
  *(_QWORD *)(v19 + 136) = v20;
  *(_QWORD *)(v19 + 144) = v21;
  v25 = (void *)v59;
  *(_QWORD *)(v19 + 104) = v24;
  *(_QWORD *)(v19 + 112) = v25;
  v26 = v25;
  v27 = v63;
  sub_23D5B06C8(v62, v61);
  v66[0] = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79198);
  sub_23D5ED518((unint64_t *)&qword_256C791A0, &qword_256C79198, MEMORY[0x24BEE12B0]);
  v29 = sub_23D66C378();
  v31 = v30;
  v32 = v64;
  v33 = v60;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v19 + 176) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v19 + 184) = sub_23D643678();
  *(_QWORD *)(v19 + 152) = v29;
  *(_QWORD *)(v19 + 160) = v31;
  v34 = (void *)sub_23D66C558();
  objc_msgSend(v32, sel_setPredicate_, v34);

  v35 = *(void **)(v33 + 32);
  type metadata accessor for GroupKitCryptoGroupBlob();
  v36 = v35;
  v37 = sub_23D66C5A0();
  if (v27)
  {
    (*(void (**)(char *, uint64_t))(v47 + 8))(v18, v48);

    return;
  }
  v38 = v37;

  if (v38 >> 62)
  {
    swift_bridgeObjectRetain();
    v39 = sub_23D66C72C();
    swift_bridgeObjectRelease();
    if (v39)
      goto LABEL_5;
  }
  else
  {
    v39 = *(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v39)
    {
LABEL_5:
      if (v39 < 1)
        __break(1u);
      for (i = 0; i != v39; ++i)
      {
        if ((v38 & 0xC000000000000001) != 0)
          v41 = (id)MEMORY[0x242636040](i, v38);
        else
          v41 = *(id *)(v38 + 8 * i + 32);
        v42 = v41;
        objc_msgSend(*(id *)(v33 + 32), sel_deleteObject_, v41, v47);

      }
    }
  }
  swift_bridgeObjectRelease();
  v43 = *(void **)(v33 + 32);
  v66[0] = 0;
  if ((objc_msgSend(v43, sel_save_, v66) & 1) != 0)
  {
    v44 = *(void (**)(char *, uint64_t))(v47 + 8);
    v45 = v66[0];
    v44(v65, v48);

  }
  else
  {
    v46 = v66[0];
    sub_23D66BCDC();

    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v65, v48);
  }
}

void sub_23D64ED0C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t i;
  id v42;
  void *v43;
  void *v44;
  void (*v45)(char *, uint64_t);
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  char *v63;
  id v64[2];

  v64[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = sub_23D66BE20();
  v48 = *(_QWORD *)(v5 - 8);
  v49 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v63 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *a1;
  v8 = a1[1];
  v9 = *a2;
  v58 = a2[1];
  v59 = v9;
  v10 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v11 = (void *)sub_23D66C390();
  v12 = objc_msgSend(v10, sel_initWithEntityName_, v11);

  __swift_instantiateConcreteTypeFromMangledName(&qword_25431A870);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_23D673120;
  v14 = *(void **)(v2 + 24);
  *(_QWORD *)(v13 + 32) = v14;
  v64[0] = (id)v13;
  sub_23D66C4C8();
  sub_23D643600(0, &qword_25431A858);
  v15 = v12;
  v62 = v15;
  v16 = v14;
  v17 = (void *)sub_23D66C4A4();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setAffectedStores_, v17);

  sub_23D5AFA60(v7, v8);
  LODWORD(v57) = sub_23D66BDD8();
  LODWORD(v56) = sub_23D66BDD8();
  v55 = sub_23D66BDD8();
  v54 = sub_23D66BDD8();
  v53 = sub_23D66BDD8();
  v52 = sub_23D66BDD8();
  v51 = sub_23D66BDD8();
  v50 = sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDFC();
  sub_23D5DDA20(v7, v8);
  v18 = sub_23D643600(0, &qword_256C7BF00);
  swift_getKeyPath();
  v19 = (void *)sub_23D66C564();
  swift_getKeyPath();
  v20 = (void *)sub_23D66C564();
  v57 = sub_23D643600(0, &qword_256C7BF08);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79A40);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_23D66E0E0;
  *(_QWORD *)(v21 + 56) = v18;
  v22 = sub_23D643638(&qword_256C7BF10, &qword_256C7BF00);
  *(_QWORD *)(v21 + 64) = v22;
  *(_QWORD *)(v21 + 32) = v19;
  v56 = v19;
  v23 = sub_23D66BDE4();
  *(_QWORD *)(v21 + 96) = sub_23D643600(0, &qword_256C7BF18);
  v24 = sub_23D643638(&qword_256C7BF20, &qword_256C7BF18);
  *(_QWORD *)(v21 + 72) = v23;
  *(_QWORD *)(v21 + 136) = v18;
  *(_QWORD *)(v21 + 144) = v22;
  *(_QWORD *)(v21 + 104) = v24;
  *(_QWORD *)(v21 + 112) = v20;
  v25 = v20;
  v26 = v61;
  sub_23D5B06C8(v59, v58);
  v64[0] = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79198);
  sub_23D5ED518((unint64_t *)&qword_256C791A0, &qword_256C79198, MEMORY[0x24BEE12B0]);
  v28 = sub_23D66C378();
  v30 = v29;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v21 + 176) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v21 + 184) = sub_23D643678();
  *(_QWORD *)(v21 + 152) = v28;
  *(_QWORD *)(v21 + 160) = v30;
  v31 = v60;
  v32 = (void *)sub_23D66C558();
  v33 = v62;
  objc_msgSend(v62, sel_setPredicate_, v32);

  v34 = *(void **)(v31 + 32);
  type metadata accessor for GroupKitCryptoGroupSeed();
  v35 = v34;
  v36 = v33;
  v37 = v35;
  v38 = sub_23D66C5A0();
  if (v26)
  {
    (*(void (**)(char *, uint64_t))(v48 + 8))(v63, v49);

    return;
  }
  v39 = v38;

  if (v39 >> 62)
  {
    swift_bridgeObjectRetain();
    v40 = sub_23D66C72C();
    swift_bridgeObjectRelease();
    if (v40)
      goto LABEL_5;
  }
  else
  {
    v40 = *(_QWORD *)((v39 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v40)
    {
LABEL_5:
      if (v40 < 1)
        __break(1u);
      for (i = 0; i != v40; ++i)
      {
        if ((v39 & 0xC000000000000001) != 0)
          v42 = (id)MEMORY[0x242636040](i, v39);
        else
          v42 = *(id *)(v39 + 8 * i + 32);
        v43 = v42;
        objc_msgSend(*(id *)(v31 + 32), sel_deleteObject_, v42, v48);

      }
    }
  }
  swift_bridgeObjectRelease();
  v44 = *(void **)(v31 + 32);
  v64[0] = 0;
  if ((objc_msgSend(v44, sel_save_, v64) & 1) != 0)
  {
    v45 = *(void (**)(char *, uint64_t))(v48 + 8);
    v46 = v64[0];
    v45(v63, v49);

  }
  else
  {
    v47 = v64[0];
    sub_23D66BCDC();

    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v63, v49);
  }
}

void sub_23D64F3E8(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, unint64_t *a5@<X8>)
{
  uint64_t v5;
  id *v7;
  id *v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD v17[2];
  uint64_t v18[2];

  v18[1] = a2;
  v17[1] = a4;
  v18[0] = a1;
  v17[0] = a3;
  v7 = sub_23D64F7F4(v18, (uint64_t)v17);
  if (!v5)
  {
    v8 = v7;
    if (v7)
    {
      if (((unint64_t)objc_msgSend(v7, sel_groupVersion) & 0x8000000000000000) != 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
        sub_23D5ED518((unint64_t *)&qword_256C790E0, &qword_256C790D8, (uint64_t)&protocol conformance descriptor for GroupKitCryptoError<A>);
        swift_allocError();
        *(_WORD *)v16 = 306;
        *(_OWORD *)(v16 + 8) = xmmword_23D674570;
        *(_QWORD *)(v16 + 24) = 0x800000023D67A970;
        *(_QWORD *)(v16 + 32) = 0xD000000000000086;
        *(_QWORD *)(v16 + 40) = 0x800000023D677A80;
        swift_willThrow();

      }
      else
      {
        v9 = (unint64_t)objc_msgSend(v8, sel_groupVersion);
        if ((v9 & 0x8000000000000000) == 0)
        {
          v10 = v9;
          if (!HIDWORD(v9))
          {
            v11 = objc_msgSend(v8, sel_blobData);
            if (v11)
            {
              v12 = v11;
              v13 = sub_23D66BD9C();
              v15 = v14;

              *a5 = v10;
              a5[1] = v13;
              a5[2] = v15;
              return;
            }
            __break(1u);
          }
        }
        sub_23D66C714();
        __break(1u);
      }
    }
    else
    {
      *a5 = 0;
      a5[1] = 0;
      a5[2] = 0xF000000000000000;
    }
  }
}

void sub_23D64F5F0(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, int a5@<W5>, int8x16_t *a6@<X8>)
{
  uint64_t v6;
  id v13;
  void *v14;
  id v15;
  void *v16;
  int8x16_t v17;
  int8x16_t v18;
  unint64_t v19;
  int8x16_t v20;
  int8x16_t v21;
  int8x16_t v22[2];
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  unsigned __int8 v28;

  v22[0].i64[0] = a1;
  v22[0].i64[1] = a2;
  v23 = a3;
  v24 = a4;
  v28 = 1;
  v13 = sub_23D650050(v22[0].i64, &v23, a5, &v28);
  if (!v6)
  {
    v14 = v13;
    if (v13)
    {
      sub_23D618250((uint64_t *)&v25);

      __swift_instantiateConcreteTypeFromMangledName(&qword_256C79A50);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v21 = v22[0];
        v22[0].i64[0] = a1;
        v22[0].i64[1] = a2;
        v23 = a3;
        v24 = a4;
        v28 = 0;
        v15 = sub_23D650050(v22[0].i64, &v23, a5, &v28);
        v16 = v15;
        if (v15)
        {
          sub_23D618250((uint64_t *)&v25);

          if (swift_dynamicCast())
            v19 = -1;
          else
            v19 = 0;
          v20 = (int8x16_t)vdupq_n_s64(v19);
          v18 = vbslq_s8(v20, v22[0], (int8x16_t)xmmword_23D66DF30);
          v17 = vandq_s8(v22[1], v20);
        }
        else
        {
          v27 = 0;
          v25 = 0u;
          v26 = 0u;
          sub_23D5AEF8C((uint64_t)&v25, &qword_256C7C018);
          v17 = 0uLL;
          v18 = (int8x16_t)xmmword_23D66DF30;
        }
        *a6 = v18;
        a6[1] = v17;
        a6[2] = v21;
        return;
      }
    }
    else
    {
      v27 = 0;
      v25 = 0u;
      v26 = 0u;
      sub_23D5AEF8C((uint64_t)&v25, &qword_256C7C018);
    }
    *a6 = 0u;
    a6[1] = 0u;
    a6[2].i64[0] = 0;
    a6[2].i64[1] = 0xF000000000000000;
  }
}

id *sub_23D64F7F4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t i;
  id v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v54;
  id *v55;
  id *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v74;
  id v75;
  char *v76;
  id *v77;
  unint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v5 = sub_23D66BE20();
  v58 = *(_QWORD *)(v5 - 8);
  v59 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v76 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *a1;
  v8 = a1[1];
  v9 = *(void **)a2;
  v72 = *(_QWORD *)(a2 + 8);
  v73 = v9;
  v10 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v11 = (void *)sub_23D66C390();
  v12 = objc_msgSend(v10, sel_initWithEntityName_, v11);

  __swift_instantiateConcreteTypeFromMangledName(&qword_25431A870);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_23D673120;
  v14 = *(void **)(v2 + 24);
  *(_QWORD *)(v13 + 32) = v14;
  v78 = v13;
  sub_23D66C4C8();
  sub_23D643600(0, &qword_25431A858);
  v15 = v12;
  v75 = v15;
  v16 = v14;
  v17 = (void *)sub_23D66C4A4();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setAffectedStores_, v17);

  v68 = sub_23D643600(0, &qword_256C7BF00);
  swift_getKeyPath();
  v69 = sub_23D66C564();
  swift_getKeyPath();
  v70 = sub_23D66C564();
  sub_23D5AFA60(v7, v8);
  v67 = sub_23D66BDD8();
  v66 = sub_23D66BDD8();
  v65 = sub_23D66BDD8();
  v64 = sub_23D66BDD8();
  v63 = sub_23D66BDD8();
  v62 = sub_23D66BDD8();
  v61 = sub_23D66BDD8();
  v60 = sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  v18 = v76;
  sub_23D66BDFC();
  v19 = v7;
  v20 = v18;
  sub_23D5DDA20(v19, v8);
  sub_23D643600(0, &qword_256C7BF08);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79A40);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_23D66E0E0;
  v22 = v68;
  *(_QWORD *)(v21 + 56) = v68;
  v23 = sub_23D643638(&qword_256C7BF10, &qword_256C7BF00);
  *(_QWORD *)(v21 + 64) = v23;
  v24 = (void *)v69;
  *(_QWORD *)(v21 + 32) = v69;
  v25 = v24;
  v26 = sub_23D66BDE4();
  *(_QWORD *)(v21 + 96) = sub_23D643600(0, &qword_256C7BF18);
  v27 = sub_23D643638(&qword_256C7BF20, &qword_256C7BF18);
  *(_QWORD *)(v21 + 72) = v26;
  *(_QWORD *)(v21 + 136) = v22;
  *(_QWORD *)(v21 + 144) = v23;
  v28 = (void *)v70;
  *(_QWORD *)(v21 + 104) = v27;
  *(_QWORD *)(v21 + 112) = v28;
  v29 = v28;
  v30 = v74;
  sub_23D5B06C8((uint64_t)v73, v72);
  v78 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79198);
  sub_23D5ED518((unint64_t *)&qword_256C791A0, &qword_256C79198, MEMORY[0x24BEE12B0]);
  v32 = sub_23D66C378();
  v34 = v33;
  v35 = v71;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v21 + 176) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v21 + 184) = sub_23D643678();
  *(_QWORD *)(v21 + 152) = v32;
  *(_QWORD *)(v21 + 160) = v34;
  v36 = v75;
  v37 = (void *)sub_23D66C558();
  objc_msgSend(v36, sel_setPredicate_, v37);

  v38 = *(void **)(v35 + 32);
  type metadata accessor for GroupKitCryptoGroupBlob();
  v39 = v38;
  v40 = sub_23D66C5A0();
  if (!v30)
  {
    v42 = v40;

    if ((unint64_t)v42 >> 62)
    {
      if (v42 < 0)
        v39 = (id *)v42;
      else
        v39 = (id *)(v42 & 0xFFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain();
      v49 = sub_23D66C72C();
      swift_bridgeObjectRelease();
      if (v49 > 1)
      {
        v50 = swift_bridgeObjectRetain();
        v39 = (id *)sub_23D650D74(v50, (void (*)(_QWORD))type metadata accessor for GroupKitCryptoGroupBlob, &qword_256C7C010, &qword_256C7C008, (uint64_t (*)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))sub_23D651C24);
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
      swift_bridgeObjectRetain();
      v43 = sub_23D66C72C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v39 = (id *)(v42 & 0xFFFFFFFFFFFFFF8);
      v43 = *(_QWORD *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v43 > 1)
      {
        swift_bridgeObjectRetain();
LABEL_7:
        v77 = v39;
        sub_23D64E010((uint64_t *)&v77, (uint64_t (*)(uint64_t))sub_23D644910, (void (*)(_QWORD))type metadata accessor for GroupKitCryptoGroupBlob, sub_23D62F4C8, (void (*)(id **, void ***, void ***))sub_23D64476C);
        v78 = (unint64_t)v77;
        v44 = (void *)sub_23D650B14((uint64_t (*)(uint64_t))sub_23D644854);
        if (v44)
        {
          v73 = v44;
          v74 = v25;
          v39 = (id *)v35;
          v43 = v78;
          if (!(v78 >> 62))
          {
            v45 = *(_QWORD *)((v78 & 0xFFFFFFFFFFFFF8) + 0x10);
            if (v45)
            {
LABEL_10:
              if (v45 < 1)
                __break(1u);
              for (i = 0; i != v45; ++i)
              {
                if ((v43 & 0xC000000000000001) != 0)
                  v47 = (id)MEMORY[0x242636040](i, v43);
                else
                  v47 = *(id *)(v43 + 8 * i + 32);
                v48 = v47;
                objc_msgSend(v39[4], sel_deleteObject_, v47);

              }
            }
LABEL_34:
            swift_bridgeObjectRelease();
            v54 = v39[4];
            v77 = 0;
            if (!objc_msgSend(v54, sel_save_, &v77))
            {
              v56 = v77;
              sub_23D66BCDC();

              swift_willThrow();
              v36 = v75;
              v41 = v74;
              (*(void (**)(char *, uint64_t))(v58 + 8))(v76, v59);
              swift_bridgeObjectRelease();
              goto LABEL_3;
            }
            v55 = v77;
            v52 = v58;
            v51 = v59;
            v36 = v75;
            v20 = v76;
            v39 = (id *)v73;
            v25 = v74;
LABEL_29:
            (*(void (**)(char *, uint64_t))(v52 + 8))(v20, v51);
            swift_bridgeObjectRelease();

            return v39;
          }
LABEL_33:
          swift_bridgeObjectRetain();
          v45 = sub_23D66C72C();
          swift_bridgeObjectRelease();
          if (v45)
            goto LABEL_10;
          goto LABEL_34;
        }
        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
    }
    if (v43)
    {
      if ((v42 & 0xC000000000000001) != 0)
      {
        v39 = (id *)MEMORY[0x242636040](0, v42);
      }
      else
      {
        if (!*(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_33;
        }
        v39 = (id *)*(id *)(v42 + 32);
      }
LABEL_28:
      v52 = v58;
      v51 = v59;
      goto LABEL_29;
    }
LABEL_27:
    v39 = 0;
    goto LABEL_28;
  }
  (*(void (**)(char *, uint64_t))(v58 + 8))(v20, v59);

  v29 = v25;
  v41 = v36;
LABEL_3:

  return v39;
}

id sub_23D650050(uint64_t *a1, uint64_t *a2, int a3, unsigned __int8 *a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t i;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  id v76;
  void *v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  id v89;
  id v90;
  uint64_t v91;
  id v92;
  __int128 v93;
  id v94;
  uint64_t v95;
  id v96;
  id v97;
  uint64_t v98;
  id v99;
  char *v100;
  id v101;
  unint64_t v102;
  uint64_t v103;

  LODWORD(v96) = a3;
  v103 = *MEMORY[0x24BDAC8D0];
  v83 = sub_23D66BE20();
  v82 = *(_QWORD *)(v83 - 8);
  MEMORY[0x24BDAC7A8](v83);
  v100 = (char *)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  v10 = a1[1];
  v11 = *a2;
  v92 = (id)a2[1];
  *(_QWORD *)&v93 = v11;
  v97 = (id)*a4;
  v12 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v13 = (void *)sub_23D66C390();
  v14 = objc_msgSend(v12, sel_initWithEntityName_, v13);

  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_25431A870);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_23D673120;
  v16 = *(void **)(v4 + 24);
  *(_QWORD *)(v15 + 32) = v16;
  v102 = v15;
  sub_23D66C4C8();
  sub_23D643600(0, &qword_25431A858);
  v17 = v14;
  v99 = v17;
  v18 = v16;
  v19 = (void *)sub_23D66C4A4();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_setAffectedStores_, v19);

  sub_23D5AFA60(v9, v10);
  LODWORD(v91) = sub_23D66BDD8();
  LODWORD(v90) = sub_23D66BDD8();
  LODWORD(v89) = sub_23D66BDD8();
  v88 = sub_23D66BDD8();
  v87 = sub_23D66BDD8();
  v86 = sub_23D66BDD8();
  v85 = sub_23D66BDD8();
  v84 = sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDD8();
  sub_23D66BDFC();
  sub_23D5DDA20(v9, v10);
  v20 = sub_23D643600(0, &qword_256C7BF00);
  swift_getKeyPath();
  v21 = (void *)sub_23D66C564();
  swift_getKeyPath();
  v22 = (void *)sub_23D66C564();
  v91 = sub_23D643600(0, &qword_256C7BF08);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79A40);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_23D66E0E0;
  *(_QWORD *)(v23 + 56) = v20;
  v24 = sub_23D643638(&qword_256C7BF10, &qword_256C7BF00);
  *(_QWORD *)(v23 + 64) = v24;
  *(_QWORD *)(v23 + 32) = v21;
  v90 = v21;
  v25 = sub_23D66BDE4();
  *(_QWORD *)(v23 + 96) = sub_23D643600(0, &qword_256C7BF18);
  v26 = sub_23D643638(&qword_256C7BF20, &qword_256C7BF18);
  *(_QWORD *)(v23 + 72) = v25;
  *(_QWORD *)(v23 + 136) = v20;
  *(_QWORD *)(v23 + 144) = v24;
  *(_QWORD *)(v23 + 104) = v26;
  *(_QWORD *)(v23 + 112) = v22;
  v89 = v22;
  v27 = v94;
  sub_23D5B06C8(v93, (uint64_t)v92);
  v94 = v27;
  v102 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79198);
  sub_23D5ED518((unint64_t *)&qword_256C791A0, &qword_256C79198, MEMORY[0x24BEE12B0]);
  v29 = sub_23D66C378();
  v31 = v30;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v23 + 176) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v23 + 184) = sub_23D643678();
  *(_QWORD *)(v23 + 152) = v29;
  *(_QWORD *)(v23 + 160) = v31;
  v32 = (void *)sub_23D66C558();
  swift_getKeyPath();
  v33 = (void *)sub_23D66C564();
  v34 = swift_allocObject();
  v93 = xmmword_23D66DF10;
  *(_OWORD *)(v34 + 16) = xmmword_23D66DF10;
  *(_QWORD *)(v34 + 56) = v20;
  *(_QWORD *)(v34 + 64) = v24;
  v35 = MEMORY[0x24BEE44F0];
  *(_QWORD *)(v34 + 32) = v33;
  v36 = MEMORY[0x24BEE4558];
  *(_QWORD *)(v34 + 96) = v35;
  *(_QWORD *)(v34 + 104) = v36;
  *(_DWORD *)(v34 + 72) = (_DWORD)v96;
  v96 = v33;
  v37 = (void *)sub_23D66C558();
  swift_getKeyPath();
  v38 = (void *)sub_23D66C564();
  v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = v93;
  *(_QWORD *)(v39 + 56) = v20;
  *(_QWORD *)(v39 + 64) = v24;
  v40 = MEMORY[0x24BEE4008];
  *(_QWORD *)(v39 + 32) = v38;
  v41 = MEMORY[0x24BEE4060];
  *(_QWORD *)(v39 + 96) = v40;
  *(_QWORD *)(v39 + 104) = v41;
  *(_QWORD *)(v39 + 72) = v97;
  v42 = v38;
  v43 = (void *)sub_23D66C558();
  v44 = swift_allocObject();
  *(_OWORD *)(v44 + 16) = xmmword_23D674580;
  *(_QWORD *)(v44 + 32) = v32;
  *(_QWORD *)(v44 + 40) = v37;
  *(_QWORD *)(v44 + 48) = v43;
  v102 = v44;
  sub_23D66C4C8();
  v45 = v32;
  v46 = v99;
  v47 = v45;
  v48 = v37;
  v49 = v43;
  v50 = v98;
  v51 = v49;
  v52 = (void *)sub_23D66C4A4();
  swift_bridgeObjectRelease();
  v53 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v52);

  objc_msgSend(v46, sel_setPredicate_, v53);
  v54 = *(void **)(v50 + 32);
  type metadata accessor for GroupKitCryptoGroupSeed();
  v55 = v54;
  v56 = v94;
  v57 = sub_23D66C5A0();
  if (!v56)
  {
    v64 = v57;
    v97 = v51;

    if ((unint64_t)v64 >> 62)
    {
      v65 = v64;
      if (v64 >= 0)
        v64 &= 0xFFFFFFFFFFFFFF8uLL;
      swift_bridgeObjectRetain();
      v74 = sub_23D66C72C();
      swift_bridgeObjectRelease();
      if (v74 > 1)
      {
        v75 = swift_bridgeObjectRetain();
        v64 = (uint64_t)sub_23D650D74(v75, (void (*)(_QWORD))type metadata accessor for GroupKitCryptoGroupSeed, &qword_256C7C000, &qword_256C7BFF8, (uint64_t (*)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))sub_23D651C7C);
        v95 = v65;
        swift_bridgeObjectRelease();
LABEL_7:
        v101 = (id)v64;
        sub_23D64E010((uint64_t *)&v101, (uint64_t (*)(uint64_t))sub_23D644E6C, (void (*)(_QWORD))type metadata accessor for GroupKitCryptoGroupSeed, (uint64_t (*)(id))sub_23D6184FC, (void (*)(id **, void ***, void ***))sub_23D64476C);
        v102 = (unint64_t)v101;
        v66 = (void *)sub_23D650B14((uint64_t (*)(uint64_t))sub_23D644854);
        if (!v66)
        {
          swift_bridgeObjectRelease();
          v61 = 0;
          v71 = v83;
          v72 = v82;
          v73 = v100;
          goto LABEL_28;
        }
        v92 = v66;
        *(_QWORD *)&v93 = v47;
        v94 = v42;
        v65 = v50;
        v64 = v102;
        if (!(v102 >> 62))
        {
          v67 = *(_QWORD *)((v102 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v67)
          {
LABEL_10:
            if (v67 < 1)
              __break(1u);
            for (i = 0; i != v67; ++i)
            {
              if ((v64 & 0xC000000000000001) != 0)
                v69 = (id)MEMORY[0x242636040](i, v64);
              else
                v69 = *(id *)(v64 + 8 * i + 32);
              v70 = v69;
              objc_msgSend(*(id *)(v65 + 32), sel_deleteObject_, v69);

            }
          }
LABEL_33:
          swift_bridgeObjectRelease();
          v78 = *(void **)(v65 + 32);
          v101 = 0;
          if (!objc_msgSend(v78, sel_save_, &v101))
          {
            v80 = v101;
            sub_23D66BCDC();

            swift_willThrow();
            v46 = v99;
            v60 = v94;
            v59 = (void *)v93;
            (*(void (**)(char *, uint64_t))(v82 + 8))(v100, v83);
            swift_bridgeObjectRelease();
            v61 = v89;
            v63 = v90;
            v62 = v96;
            v58 = v97;
            goto LABEL_3;
          }
          v79 = v101;
          v46 = v99;
          v73 = v100;
          v71 = v83;
          v72 = v82;
          v42 = v94;
          v61 = v92;
          v47 = (id)v93;
LABEL_28:
          (*(void (**)(char *, uint64_t))(v72 + 8))(v73, v71);
          swift_bridgeObjectRelease();

          return v61;
        }
LABEL_32:
        swift_bridgeObjectRetain();
        v67 = sub_23D66C72C();
        swift_bridgeObjectRelease();
        if (v67)
          goto LABEL_10;
        goto LABEL_33;
      }
      swift_bridgeObjectRetain();
      v61 = (id)sub_23D66C72C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v65 = v64;
      v64 &= 0xFFFFFFFFFFFFFF8uLL;
      v61 = *(id *)(v64 + 16);
      if ((unint64_t)v61 > 1)
      {
        v95 = v65;
        swift_bridgeObjectRetain();
        goto LABEL_7;
      }
    }
    if (v61)
    {
      if ((v65 & 0xC000000000000001) != 0)
      {
        v76 = (id)MEMORY[0x242636040](0, v65);
      }
      else
      {
        if (!*(_QWORD *)((v65 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_32;
        }
        v76 = *(id *)(v65 + 32);
      }
      v61 = v76;
    }
    v71 = v83;
    v72 = v82;
    v73 = v100;
    goto LABEL_28;
  }
  (*(void (**)(char *, uint64_t))(v82 + 8))(v100, v83);

  v58 = v48;
  v48 = v47;
  v59 = v42;
  v60 = v96;
  v62 = v89;
  v61 = v90;
  v63 = v46;
LABEL_3:

  return v61;
}

unint64_t sub_23D650B14(uint64_t (*a1)(uint64_t))
{
  _QWORD *v1;
  unint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (!(*v1 >> 62))
  {
    if (*(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
    return 0;
  }
  swift_bridgeObjectRetain();
  v5 = sub_23D66C72C();
  swift_bridgeObjectRelease();
  if (!v5)
    return 0;
LABEL_3:
  result = sub_23D652494(a1);
  if (!result)
  {
    if (*v1 >> 62)
    {
      swift_bridgeObjectRetain();
      v6 = sub_23D66C72C();
      swift_bridgeObjectRelease();
      result = v6 - 1;
      if (!__OFSUB__(v6, 1))
        return sub_23D6523A8(result, a1);
    }
    else
    {
      v4 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = v4 - 1;
      if (!__OFSUB__(v4, 1))
        return sub_23D6523A8(result, a1);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23D650BE8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DeviceToDeviceEncryptedContainerInteraction()
{
  return objc_opt_self();
}

size_t sub_23D650C3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  size_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E8);
  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0) - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      v9 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0) - 8) + 80);
      v10 = sub_23D6520AC(&v11, (uint64_t)v6 + ((v9 + 32) & ~v9), v1, a1);
      swift_bridgeObjectRetain();
      sub_23D5F165C();
      if (v10 == v1)
        return (size_t)v6;
      __break(1u);
      return MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

_QWORD *sub_23D650D74(unint64_t a1, void (*a2)(_QWORD), unint64_t *a3, uint64_t *a4, uint64_t (*a5)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t);

  if (a1 >> 62)
    goto LABEL_10;
  v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v10)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v10 <= 0)
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25431A870);
      v11 = (_QWORD *)swift_allocObject();
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 25;
      v11[2] = v10;
      v11[3] = (2 * (v13 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_23D651A14((unint64_t)(v11 + 4), v10, a1, a2, a3, a4, a5);
    a5 = v14;
    swift_bridgeObjectRelease();
    if (a5 == (uint64_t (*)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))v10)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v10 = sub_23D66C72C();
    swift_bridgeObjectRelease();
    if (!v10)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v11;
}

void sub_23D650E98(uint64_t *a1, void (*a2)(_QWORD), uint64_t (*a3)(id), void (*a4)(id **, void ***, void ***))
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  int v19;
  int v20;
  id *v21;
  void *v22;
  id v23;
  id v24;
  int v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  char v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  char *v80;
  unint64_t v81;
  char *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  id v89;
  id v90;
  char v91;
  char v92;
  void *v93;
  char *v94;
  char *v95;
  uint64_t v96;
  unint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char *v102;
  char *v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void **v113;
  uint64_t v115;
  uint64_t v117;

  v7 = a1[1];
  v8 = sub_23D66C834();
  if (v8 >= v7)
  {
    if (v7 < 0)
      goto LABEL_140;
    if (v7)
      sub_23D651604(0, v7, 1, a1, a3);
    return;
  }
  if (v7 >= 0)
    v9 = v7;
  else
    v9 = v7 + 1;
  if (v7 < -1)
    goto LABEL_149;
  v108 = v8;
  v109 = a1;
  if (v7 < 2)
  {
    v12 = (char *)MEMORY[0x24BEE4AF8];
    v117 = MEMORY[0x24BEE4AF8];
    v113 = (void **)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v7 != 1)
    {
      v34 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_103:
      v95 = v12;
      if (v34 >= 2)
      {
        v96 = *v109;
        do
        {
          v97 = v34 - 2;
          if (v34 < 2)
            goto LABEL_135;
          if (!v96)
            goto LABEL_148;
          v98 = v95;
          v99 = *(_QWORD *)&v95[16 * v97 + 32];
          v100 = *(_QWORD *)&v95[16 * v34 + 24];
          sub_23D6516EC((id *)(v96 + 8 * v99), (id *)(v96 + 8 * *(_QWORD *)&v95[16 * v34 + 16]), v96 + 8 * v100, v113, a3, a4);
          if (v4)
            break;
          if (v100 < v99)
            goto LABEL_136;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v98 = sub_23D644818((uint64_t)v98);
          if (v97 >= *((_QWORD *)v98 + 2))
            goto LABEL_137;
          v101 = v98 + 32;
          v102 = &v98[16 * v97 + 32];
          *(_QWORD *)v102 = v99;
          *((_QWORD *)v102 + 1) = v100;
          v103 = v98;
          v104 = *((_QWORD *)v98 + 2);
          if (v34 > v104)
            goto LABEL_138;
          memmove(&v101[16 * v34 - 16], &v101[16 * v34], 16 * (v104 - v34));
          v95 = v103;
          *((_QWORD *)v103 + 2) = v104 - 1;
          v34 = v104 - 1;
        }
        while (v104 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
LABEL_118:
      *(_QWORD *)((v117 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_23D66C4C8();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    v10 = v9 >> 1;
    a2(0);
    v11 = sub_23D66C4E0();
    *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) = v10;
    v113 = (void **)((v11 & 0xFFFFFFFFFFFFFF8) + 32);
    v117 = v11;
  }
  v13 = 0;
  v14 = *a1;
  v106 = *a1 - 8;
  v107 = *a1 + 16;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v110 = v7;
  v115 = *a1;
LABEL_13:
  v15 = v13++;
  if (v13 >= v7)
    goto LABEL_30;
  v16 = *(void **)(v14 + 8 * v15);
  v17 = *(id *)(v14 + 8 * v13);
  v18 = v16;
  v19 = a3(v17);
  if (v4)
  {
    swift_bridgeObjectRelease();

    goto LABEL_118;
  }
  v20 = v19;

  v13 = v15 + 2;
  if (v15 + 2 >= v7)
    goto LABEL_20;
  v21 = (id *)(v107 + 8 * v15);
  do
  {
    v22 = *(v21 - 1);
    v23 = *v21;
    v24 = v22;
    v25 = a3(v23);

    if (((v20 ^ v25) & 1) != 0)
    {
      v7 = v110;
      v14 = v115;
      if ((v20 & 1) != 0)
        goto LABEL_21;
LABEL_30:
      if (v13 >= v7)
        goto LABEL_39;
      if (__OFSUB__(v13, v15))
        goto LABEL_141;
      if (v13 - v15 >= v108)
        goto LABEL_39;
      if (__OFADD__(v15, v108))
        goto LABEL_142;
      if (v15 + v108 >= v7)
        v31 = v7;
      else
        v31 = v15 + v108;
      if (v31 < v15)
      {
LABEL_143:
        __break(1u);
        goto LABEL_144;
      }
      if (v13 == v31)
      {
LABEL_39:
        if (v13 < v15)
          goto LABEL_139;
        goto LABEL_40;
      }
      v85 = v106 + 8 * v13;
      v105 = v31;
      do
      {
        v86 = *(void **)(v14 + 8 * v13);
        v87 = v15;
        v112 = v85;
        while (1)
        {
          v88 = *(void **)v85;
          v89 = v86;
          v90 = v88;
          v91 = a3(v89);
          if (v4)
          {
            swift_bridgeObjectRelease();

            goto LABEL_118;
          }
          v92 = v91;

          if ((v92 & 1) == 0)
            break;
          v14 = v115;
          if (!v115)
            goto LABEL_146;
          v93 = *(void **)v85;
          v86 = *(void **)(v85 + 8);
          *(_QWORD *)v85 = v86;
          *(_QWORD *)(v85 + 8) = v93;
          v85 -= 8;
          if (v13 == ++v87)
            goto LABEL_98;
        }
        v14 = v115;
LABEL_98:
        ++v13;
        v85 = v112 + 8;
      }
      while (v13 != v105);
      v13 = v105;
      if (v105 < v15)
        goto LABEL_139;
LABEL_40:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v12 = sub_23D6442E4(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
      v33 = *((_QWORD *)v12 + 2);
      v32 = *((_QWORD *)v12 + 3);
      v34 = v33 + 1;
      v14 = v115;
      if (v33 >= v32 >> 1)
      {
        v94 = sub_23D6442E4((char *)(v32 > 1), v33 + 1, 1, v12);
        v14 = v115;
        v12 = v94;
      }
      *((_QWORD *)v12 + 2) = v34;
      v35 = v12 + 32;
      v36 = &v12[16 * v33 + 32];
      *(_QWORD *)v36 = v15;
      *((_QWORD *)v36 + 1) = v13;
      if (v33)
      {
        v111 = v13;
        while (1)
        {
          v37 = v34 - 1;
          if (v34 >= 4)
          {
            v42 = &v35[16 * v34];
            v43 = *((_QWORD *)v42 - 8);
            v44 = *((_QWORD *)v42 - 7);
            v48 = __OFSUB__(v44, v43);
            v45 = v44 - v43;
            if (v48)
              goto LABEL_124;
            v47 = *((_QWORD *)v42 - 6);
            v46 = *((_QWORD *)v42 - 5);
            v48 = __OFSUB__(v46, v47);
            v40 = v46 - v47;
            v41 = v48;
            if (v48)
              goto LABEL_125;
            v49 = v34 - 2;
            v50 = &v35[16 * v34 - 32];
            v52 = *(_QWORD *)v50;
            v51 = *((_QWORD *)v50 + 1);
            v48 = __OFSUB__(v51, v52);
            v53 = v51 - v52;
            if (v48)
              goto LABEL_127;
            v48 = __OFADD__(v40, v53);
            v54 = v40 + v53;
            if (v48)
              goto LABEL_130;
            if (v54 >= v45)
            {
              v72 = &v35[16 * v37];
              v74 = *(_QWORD *)v72;
              v73 = *((_QWORD *)v72 + 1);
              v48 = __OFSUB__(v73, v74);
              v75 = v73 - v74;
              if (v48)
                goto LABEL_134;
              v65 = v40 < v75;
              goto LABEL_77;
            }
          }
          else
          {
            if (v34 != 3)
            {
              v66 = *((_QWORD *)v12 + 4);
              v67 = *((_QWORD *)v12 + 5);
              v48 = __OFSUB__(v67, v66);
              v59 = v67 - v66;
              v60 = v48;
              goto LABEL_71;
            }
            v39 = *((_QWORD *)v12 + 4);
            v38 = *((_QWORD *)v12 + 5);
            v48 = __OFSUB__(v38, v39);
            v40 = v38 - v39;
            v41 = v48;
          }
          if ((v41 & 1) != 0)
            goto LABEL_126;
          v49 = v34 - 2;
          v55 = &v35[16 * v34 - 32];
          v57 = *(_QWORD *)v55;
          v56 = *((_QWORD *)v55 + 1);
          v58 = __OFSUB__(v56, v57);
          v59 = v56 - v57;
          v60 = v58;
          if (v58)
            goto LABEL_129;
          v61 = &v35[16 * v37];
          v63 = *(_QWORD *)v61;
          v62 = *((_QWORD *)v61 + 1);
          v48 = __OFSUB__(v62, v63);
          v64 = v62 - v63;
          if (v48)
            goto LABEL_132;
          if (__OFADD__(v59, v64))
            goto LABEL_133;
          if (v59 + v64 >= v40)
          {
            v65 = v40 < v64;
LABEL_77:
            if (v65)
              v37 = v49;
            goto LABEL_79;
          }
LABEL_71:
          if ((v60 & 1) != 0)
            goto LABEL_128;
          v68 = &v35[16 * v37];
          v70 = *(_QWORD *)v68;
          v69 = *((_QWORD *)v68 + 1);
          v48 = __OFSUB__(v69, v70);
          v71 = v69 - v70;
          if (v48)
            goto LABEL_131;
          if (v71 < v59)
            goto LABEL_88;
LABEL_79:
          v76 = v37 - 1;
          if (v37 - 1 >= v34)
          {
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
          if (!v14)
            goto LABEL_145;
          v77 = v12;
          v78 = &v35[16 * v76];
          v79 = *(_QWORD *)v78;
          v80 = v35;
          v81 = v37;
          v82 = &v35[16 * v37];
          v83 = *((_QWORD *)v82 + 1);
          sub_23D6516EC((id *)(v14 + 8 * *(_QWORD *)v78), (id *)(v14 + 8 * *(_QWORD *)v82), v14 + 8 * v83, v113, a3, a4);
          if (v4)
            goto LABEL_117;
          if (v83 < v79)
            goto LABEL_121;
          if (v81 > *((_QWORD *)v77 + 2))
            goto LABEL_122;
          *(_QWORD *)v78 = v79;
          *(_QWORD *)&v80[16 * v76 + 8] = v83;
          v84 = *((_QWORD *)v77 + 2);
          if (v81 >= v84)
            goto LABEL_123;
          v12 = v77;
          v34 = v84 - 1;
          memmove(v82, v82 + 16, 16 * (v84 - 1 - v81));
          v35 = v80;
          *((_QWORD *)v77 + 2) = v84 - 1;
          v14 = v115;
          v13 = v111;
          if (v84 <= 2)
            goto LABEL_88;
        }
      }
      v34 = 1;
LABEL_88:
      v7 = v110;
      if (v13 >= v110)
        goto LABEL_103;
      goto LABEL_13;
    }
    ++v13;
    ++v21;
    v7 = v110;
  }
  while (v110 != v13);
  v13 = v110;
LABEL_20:
  v14 = v115;
  if ((v20 & 1) == 0)
    goto LABEL_30;
LABEL_21:
  if (v13 >= v15)
  {
    if (v15 < v13)
    {
      v26 = (uint64_t *)(v106 + 8 * v13);
      v27 = v13;
      v28 = v15;
      v29 = (uint64_t *)(v14 + 8 * v15);
      while (1)
      {
        if (v28 != --v27)
        {
          if (!v14)
            goto LABEL_147;
          v30 = *v29;
          *v29 = *v26;
          *v26 = v30;
        }
        ++v28;
        --v26;
        ++v29;
        if (v28 >= v27)
          goto LABEL_30;
      }
    }
    goto LABEL_30;
  }
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
  sub_23D66C714();
  __break(1u);
}

void sub_23D651604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(id))
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  char v15;
  void *v16;
  uint64_t v19;

  if (a3 != a2)
  {
    v7 = a3;
    v8 = a1;
    v9 = *a4;
    v10 = *a4 + 8 * a3 - 8;
LABEL_4:
    v11 = *(void **)(v9 + 8 * v7);
    v19 = v10;
    while (1)
    {
      v12 = *(void **)v10;
      v13 = v11;
      v14 = v12;
      v15 = a5(v13);

      if (v5)
        break;
      if ((v15 & 1) != 0)
      {
        if (!v9)
        {
          __break(1u);
          return;
        }
        v16 = *(void **)v10;
        v11 = *(void **)(v10 + 8);
        *(_QWORD *)v10 = v11;
        *(_QWORD *)(v10 + 8) = v16;
        v10 -= 8;
        if (v7 != ++v8)
          continue;
      }
      ++v7;
      v10 = v19 + 8;
      v8 = a1;
      if (v7 != a2)
        goto LABEL_4;
      return;
    }
  }
}

uint64_t sub_23D6516EC(id *__src, id *a2, unint64_t a3, void **__dst, uint64_t (*a5)(id), void (*a6)(id **, void ***, void ***))
{
  void **v6;
  id *v8;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  id *v17;
  void **v18;
  void *v19;
  id v20;
  id v21;
  char v22;
  char v23;
  id *v24;
  void **v25;
  void **v26;
  id *v27;
  void **v28;
  void **v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  char v34;
  id *v35;
  uint64_t result;
  id *v38;
  id *v39;
  uint64_t v41;
  void **v42;
  void **v43;
  id *v44;

  v6 = __dst;
  v8 = a2;
  v10 = (char *)a2 - (char *)__src;
  v11 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v11 = (char *)a2 - (char *)__src;
  v12 = v11 >> 3;
  v13 = a3 - (_QWORD)a2;
  v14 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v14 = a3 - (_QWORD)a2;
  v15 = v14 >> 3;
  v44 = __src;
  v43 = __dst;
  if (v12 >= v14 >> 3)
  {
    if (v13 >= -7)
    {
      if (__dst != a2 || &a2[v15] <= __dst)
        memmove(__dst, a2, 8 * v15);
      v25 = &v6[v15];
      v42 = v25;
      v44 = v8;
      if (__src < v8 && v13 >= 8)
      {
        v38 = __src;
        v26 = (void **)(a3 - 8);
        v27 = v8;
        while (1)
        {
          v39 = v8;
          v28 = v6;
          v29 = v25;
          v31 = *--v25;
          v30 = v31;
          v32 = *--v27;
          v20 = v30;
          v21 = v32;
          v33 = a5(v20);
          if (v41)
            goto LABEL_46;
          v34 = v33;
          v41 = 0;
          v35 = v26 + 1;

          if ((v34 & 1) != 0)
          {
            v6 = v28;
            v25 = v29;
            if (v35 != v39 || v26 >= v39)
              *v26 = *v27;
            v44 = v27;
          }
          else
          {
            v42 = v25;
            v6 = v28;
            if (v35 < v29 || v26 >= v29 || v35 != v29)
              *v26 = *v25;
            v27 = v39;
          }
          if (v27 > v38)
          {
            --v26;
            v8 = v27;
            if (v25 > v6)
              continue;
          }
          break;
        }
      }
LABEL_45:
      a6(&v44, &v43, &v42);
      return 1;
    }
  }
  else if (v10 >= -7)
  {
    if (__dst != __src || &__src[v12] <= __dst)
      memmove(__dst, __src, 8 * v12);
    v16 = &v6[v12];
    v42 = v16;
    if ((unint64_t)v8 < a3 && v10 >= 8)
    {
      v17 = __src;
      while (1)
      {
        v18 = v6;
        v19 = *v6;
        v20 = *v8;
        v21 = v19;
        v22 = a5(v20);
        if (v41)
          break;
        v23 = v22;

        if ((v23 & 1) != 0)
        {
          v24 = v8 + 1;
          v6 = v18;
          if (v17 < v8 || v17 >= v24 || v17 != v8)
            *v17 = *v8;
        }
        else
        {
          if (v17 != v18)
            *v17 = *v18;
          v6 = v18 + 1;
          v43 = v18 + 1;
          v24 = v8;
        }
        v41 = 0;
        v44 = ++v17;
        if (v6 < v16)
        {
          v8 = v24;
          if ((unint64_t)v24 < a3)
            continue;
        }
        goto LABEL_45;
      }
LABEL_46:

      a6(&v44, &v43, &v42);
      return 1;
    }
    goto LABEL_45;
  }
  result = sub_23D66C768();
  __break(1u);
  return result;
}

uint64_t sub_23D651A14(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD), unint64_t *a5, uint64_t *a6, uint64_t (*a7)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void (*v22)(_BYTE *, _QWORD);
  id *v23;
  id v24;
  uint64_t result;
  _BYTE v26[32];

  v14 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = sub_23D66C72C();
    swift_bridgeObjectRelease();
    if (!v15)
      return a3;
  }
  else
  {
    v15 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v15)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v16 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v14)
  {
    swift_bridgeObjectRetain();
    v18 = sub_23D66C72C();
    swift_bridgeObjectRelease();
    if (v18 <= a2)
    {
      if (v15 >= 1)
      {
        v19 = sub_23D5ED518(a5, a6, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v15; ++i)
        {
          v21 = __swift_instantiateConcreteTypeFromMangledName(a6);
          v22 = (void (*)(_BYTE *, _QWORD))a7(v26, i, a3, v21, v19);
          v24 = *v23;
          v22(v26, 0);
          *(_QWORD *)(a1 + 8 * i) = v24;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v17 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v17 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v16 + 32 >= a1 + 8 * v17 || v16 + 32 + 8 * v17 <= a1)
  {
    a4(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_23D66C768();
  __break(1u);
  return result;
}

uint64_t (*sub_23D651C24(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_23D651CFC(v6, a2, a3);
  return sub_23D651C78;
}

uint64_t (*sub_23D651C7C(void (**a1)(id *), unint64_t a2, uint64_t a3))()
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_23D651D70(v6, a2, a3);
  return sub_23D651C78;
}

void sub_23D651CD0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_23D651CFC(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x242636040](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_23D651D68;
  }
  __break(1u);
  return result;
}

void sub_23D651D68(id *a1)
{

}

void (*sub_23D651D70(void (*result)(id *), unint64_t a2, uint64_t a3))(id *)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x242636040](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_23D6526AC;
  }
  __break(1u);
  return result;
}

char *keypath_get_selector_groupVersion()
{
  return sel_groupVersion;
}

id sub_23D651DF8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_groupVersion);
  *a2 = result;
  return result;
}

id sub_23D651E28(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGroupVersion_, *a1);
}

char *keypath_get_selector_seedType()
{
  return sel_seedType;
}

id sub_23D651E48@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_seedType);
  *a2 = result;
  return result;
}

id sub_23D651E78(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSeedType_, *a1);
}

uint64_t sub_23D651E8C(_QWORD *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  unint64_t v22;
  _OWORD *v23;
  __int128 *v24;
  __int128 v25;
  uint64_t v26;
  _BYTE *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;

  v7 = sub_23D66C018();
  MEMORY[0x24BDAC7A8](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v3, v7);
  sub_23D652664();
  sub_23D66C444();
  v10 = *(_QWORD *)(v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_256C79B20) + 36));
  result = sub_23D5AEF8C(v3, qword_256C79B20);
  v12 = v31;
  v13 = v32;
  if (!a2)
    goto LABEL_6;
  if (!a3)
  {
LABEL_7:
    *a1 = v12;
    a1[1] = v13;
    a1[2] = v10;
    return a3;
  }
  if (a3 < 0)
  {
    __break(1u);
  }
  else
  {
    if (!v10 || (--v10, v14 = *(_QWORD *)(v31 + 16), v32 == v14))
    {
LABEL_6:
      a3 = 0;
      goto LABEL_7;
    }
    if (v32 < v14)
    {
      v15 = v32 + 1;
      *a2 = *(_BYTE *)(v31 + 32 + v32);
      if (a3 == 1)
      {
        ++v13;
      }
      else
      {
        v16 = a3 - 2;
        if (a3 - 2 >= v14 + ~v13)
          v16 = v14 + ~v13;
        if (v16 >= v10)
          v16 = v10;
        v17 = v16 + 1;
        if (v17 <= 0x10 || (v18 = v13 + v12, ((unint64_t)&a2[-v13 - v12] & 0xFFFFFFFFFFFFFFF0) == 0x20))
        {
          v19 = 1;
          v20 = a2;
        }
        else
        {
          v21 = v17 & 0xF;
          if ((v17 & 0xF) == 0)
            v21 = 16;
          v22 = v17 - v21;
          v15 += v17 - v21;
          v20 = &a2[v17 - v21];
          v19 = v22 + 1;
          v10 -= v22;
          v23 = a2 + 1;
          v24 = (__int128 *)(v18 + 33);
          do
          {
            v25 = *v24++;
            *v23++ = v25;
            v22 -= 16;
          }
          while (v22);
        }
        v26 = 0;
        v27 = v20 + 1;
        v28 = v10 - 1;
        v29 = v19;
        while (1)
        {
          if (v10 == v26)
          {
            v10 = 0;
            v13 = v15 + v26;
            a3 = v19 + v26;
            goto LABEL_7;
          }
          v30 = v28;
          if (!(v15 - v14 + v26))
            break;
          ++v29;
          v27[v26] = *(_BYTE *)(v15 + v12 + 32 + v26);
          ++v26;
          --v28;
          if (!(v19 - a3 + v26))
          {
            v13 = v15 + v26;
            v10 = v30;
            goto LABEL_7;
          }
        }
        v13 = v14;
        v10 = v28;
        a3 = v29;
      }
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23D6520AC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t result;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  _QWORD *v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0);
  v41 = *(_QWORD *)(v8 - 8);
  v42 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (uint64_t *)((char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v34 - v13;
  v43 = a4;
  v17 = *(_QWORD *)(a4 + 64);
  v16 = a4 + 64;
  v15 = v17;
  v39 = v16;
  v18 = -1 << *(_BYTE *)(v16 - 32);
  if (-v18 < 64)
    v19 = ~(-1 << -(char)v18);
  else
    v19 = -1;
  v20 = v19 & v15;
  if (!a2)
  {
    v21 = 0;
    a3 = 0;
LABEL_39:
    v33 = v39;
    *a1 = v43;
    a1[1] = v33;
    a1[2] = ~v18;
    a1[3] = v21;
    a1[4] = v20;
    return a3;
  }
  if (!a3)
  {
    v21 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v36 = -1 << *(_BYTE *)(v16 - 32);
  v37 = a1;
  v21 = 0;
  v22 = 0;
  v38 = (unint64_t)(63 - v18) >> 6;
  v35 = v38 - 1;
  v40 = a3;
  if (!v20)
    goto LABEL_9;
LABEL_8:
  v23 = __clz(__rbit64(v20));
  v20 &= v20 - 1;
  v24 = v23 | (v21 << 6);
  while (1)
  {
    ++v22;
    v28 = *(_QWORD *)(v43 + 56);
    v29 = (uint64_t *)(*(_QWORD *)(v43 + 48) + 16 * v24);
    v31 = *v29;
    v30 = v29[1];
    v32 = type metadata accessor for GroupMembership.MemberProperties(0);
    sub_23D65251C(v28 + *(_QWORD *)(*(_QWORD *)(v32 - 8) + 72) * v24, (uint64_t)v11 + *(int *)(v42 + 48));
    *v11 = v31;
    v11[1] = v30;
    sub_23D652560((uint64_t)v11, (uint64_t)v14);
    sub_23D652560((uint64_t)v14, a2);
    a3 = v40;
    if (v22 == v40)
    {
      sub_23D5AFA60(v31, v30);
      goto LABEL_38;
    }
    a2 += *(_QWORD *)(v41 + 72);
    result = sub_23D5AFA60(v31, v30);
    if (v20)
      goto LABEL_8;
LABEL_9:
    v25 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v25 >= v38)
      goto LABEL_33;
    v26 = *(_QWORD *)(v39 + 8 * v25);
    if (!v26)
    {
      v21 += 2;
      if (v25 + 1 >= v38)
      {
        v20 = 0;
        v21 = v25;
      }
      else
      {
        v26 = *(_QWORD *)(v39 + 8 * v21);
        if (v26)
          goto LABEL_14;
        v27 = v25 + 2;
        if (v25 + 2 >= v38)
          goto LABEL_33;
        v26 = *(_QWORD *)(v39 + 8 * v27);
        if (v26)
        {
LABEL_17:
          v25 = v27;
          goto LABEL_18;
        }
        v21 = v25 + 3;
        if (v25 + 3 < v38)
        {
          v26 = *(_QWORD *)(v39 + 8 * v21);
          if (v26)
          {
LABEL_14:
            v25 = v21;
            goto LABEL_18;
          }
          v27 = v25 + 4;
          if (v25 + 4 >= v38)
          {
LABEL_33:
            v20 = 0;
            goto LABEL_37;
          }
          v26 = *(_QWORD *)(v39 + 8 * v27);
          if (!v26)
          {
            while (1)
            {
              v25 = v27 + 1;
              if (__OFADD__(v27, 1))
                goto LABEL_42;
              if (v25 >= v38)
              {
                v20 = 0;
                v21 = v35;
                goto LABEL_37;
              }
              v26 = *(_QWORD *)(v39 + 8 * v25);
              ++v27;
              if (v26)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v20 = 0;
        v21 = v25 + 2;
      }
LABEL_37:
      a3 = v22;
LABEL_38:
      v18 = v36;
      a1 = v37;
      goto LABEL_39;
    }
LABEL_18:
    v20 = (v26 - 1) & v26;
    v24 = __clz(__rbit64(v26)) + (v25 << 6);
    v21 = v25;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_23D6523A8(unint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t *v2;
  uint64_t v5;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v5 = *v2;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v2 = v5;
  if (!isUniquelyReferenced_nonNull_bridgeObject || v5 < 0 || (v5 & 0x4000000000000000) != 0)
  {
    v5 = a2(v5);
    *v2 = v5;
  }
  v7 = v5 & 0xFFFFFFFFFFFFFF8;
  v8 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v8 <= a1)
  {
    __break(1u);
  }
  else
  {
    v9 = v8 - 1;
    v10 = v8 - 1 - a1;
    if (v10 >= 0)
    {
      v11 = v7 + 8 * a1;
      v12 = *(_QWORD *)(v11 + 32);
      memmove((void *)(v11 + 32), (const void *)(v11 + 40), 8 * v10);
      *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFF8) + 0x10) = v9;
      sub_23D66C4C8();
      return v12;
    }
  }
  result = sub_23D66C768();
  __break(1u);
  return result;
}

uint64_t sub_23D652494(uint64_t (*a1)(uint64_t))
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v3;
  if (!(_DWORD)result || v3 < 0 || (v3 & 0x4000000000000000) != 0)
  {
    result = a1(v3);
    v3 = result;
    *v1 = result;
  }
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v6)
  {
    v7 = v6 - 1;
    v8 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 8 * v7 + 0x20);
    *(_QWORD *)(v5 + 16) = v7;
    sub_23D66C4C8();
    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23D65251C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GroupMembership.MemberProperties(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23D652560(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23D6525A8(int8x16_t *a1@<X8>)
{
  uint64_t v1;

  sub_23D64F5F0(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_DWORD *)(v1 + 56), a1);
}

void sub_23D6525CC()
{
  uint64_t v0;

  sub_23D5E63D4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_DWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
}

void sub_23D6525F4()
{
  uint64_t v0;

  sub_23D5E63A8(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_DWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
}

void sub_23D65261C()
{
  uint64_t v0;

  sub_23D64E394(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_DWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
}

void sub_23D652644(unint64_t *a1@<X8>)
{
  uint64_t *v1;

  sub_23D64F3E8(v1[3], v1[4], v1[5], v1[6], a1);
}

unint64_t sub_23D652664()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256C7C020;
  if (!qword_256C7C020)
  {
    v1 = sub_23D66C018();
    result = MEMORY[0x242636790](MEMORY[0x24BDC6300], v1);
    atomic_store(result, (unint64_t *)&qword_256C7C020);
  }
  return result;
}

void sub_23D6526B0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23D6526EC()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (BYTE6(v0) > 0x1BuLL)
  {
    sub_23D5AFA60(v1, v0);
    sub_23D62899C(v1, v0);
    sub_23D66C0FC();
  }
  else
  {
    v2 = sub_23D66BFE8();
    sub_23D5AE928(&qword_256C7C0C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDC61A8], MEMORY[0x24BDC61C0]);
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v3, *MEMORY[0x24BDC61A0], v2);
    swift_willThrow();
  }
  return sub_23D5DDA20(v1, v0);
}

uint64_t sub_23D6527F0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  if (qword_256C78B18 != -1)
    swift_once();
  v0 = qword_256C88B90;
  v1 = *(_QWORD *)algn_256C88B98;
  sub_23D5AFA60(qword_256C88B90, *(unint64_t *)algn_256C88B98);
  v2 = sub_23D628188(0xD000000000000021, 0x800000023D67AAF0);
  v4 = v3;
  qword_256C891F0 = v0;
  *(_QWORD *)algn_256C891F8 = v1;
  sub_23D5AFA60(v0, v1);
  sub_23D5AFA60(v2, v4);
  sub_23D64C120(v2, v4);
  sub_23D5DDA20(v2, v4);
  sub_23D5DDA20(v2, v4);
  return sub_23D5DDA20(v0, v1);
}

uint64_t sub_23D6528CC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _DWORD *a3@<X8>)
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
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  _DWORD *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  _DWORD *v39;
  uint64_t v40;
  os_log_type_t v41;
  int *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  _DWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  _DWORD *v66;
  _DWORD *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  _DWORD *v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  _OWORD v79[2];
  uint64_t v80;
  char v81;

  v75 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C7A648);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v72 = (uint64_t)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v70 = (uint64_t)&v63 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v74 = (char *)&v63 - v10;
  v71 = type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext.Context(0);
  v69 = *(_QWORD *)(v71 - 8);
  v11 = MEMORY[0x24BDAC7A8](v71);
  v68 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v67 = (_DWORD *)((char *)&v63 - v14);
  MEMORY[0x24BDAC7A8](v13);
  v66 = (_DWORD *)((char *)&v63 - v15);
  v73 = sub_23D66C108();
  v16 = *(_QWORD *)(v73 - 8);
  v17 = MEMORY[0x24BDAC7A8](v73);
  v19 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v63 - v20;
  v22 = sub_23D66BE80();
  MEMORY[0x24BDAC7A8](v22);
  v23 = type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext(0);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v63 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v63 - v27;
  v80 = 0;
  memset(v79, 0, sizeof(v79));
  sub_23D5AFA60(a1, a2);
  sub_23D66BE74();
  sub_23D5AE928(&qword_256C7A248, type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext, (uint64_t)&unk_23D670A0C);
  v76 = a1;
  v77 = a2;
  v29 = v78;
  sub_23D66BF10();
  if (v29)
    return sub_23D5DDA20(v76, v77);
  v64 = v16;
  v65 = v19;
  v78 = v21;
  v32 = (uint64_t)v74;
  v31 = v75;
  if (*(_DWORD *)v28 == 1)
  {
    v33 = *((_QWORD *)v28 + 1);
    v34 = *((_QWORD *)v28 + 2);
    sub_23D5AFA60(v33, v34);
    sub_23D6526B0(v33, v34);
    v35 = (uint64_t)&v28[*(int *)(v23 + 28)];
    v36 = v32;
    sub_23D65546C(v35, v32);
    v37 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v69 + 48);
    v38 = v71;
    if (v37(v32, 1, v71) == 1)
    {
      v39 = v66;
      *v66 = 0;
      *(_OWORD *)(v39 + 2) = xmmword_23D66DF40;
      *((_QWORD *)v39 + 3) = 0;
      *((_BYTE *)v39 + 32) = 1;
      sub_23D66BE5C();
      sub_23D5AEF8C(v36, &qword_256C7A648);
    }
    else
    {
      v49 = v32;
      v39 = v66;
      sub_23D655428(v49, (uint64_t)v66);
    }
    v50 = v64;
    v51 = (uint64_t)v68;
    LODWORD(v74) = *v39;
    sub_23D5E6950((uint64_t)v39, type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext.Context);
    (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v65, v78, v73);
    v52 = v70;
    sub_23D65546C(v35, v70);
    v53 = v37(v52, 1, v38);
    v63 = v28;
    v54 = v67;
    if (v53 == 1)
    {
      *v67 = 0;
      *(_OWORD *)(v54 + 2) = xmmword_23D66DF40;
      *((_QWORD *)v54 + 3) = 0;
      *((_BYTE *)v54 + 32) = 1;
      sub_23D66BE5C();
      sub_23D5AEF8C(v52, &qword_256C7A648);
    }
    else
    {
      sub_23D655428(v52, (uint64_t)v67);
    }
    v55 = v38;
    v56 = (uint64_t)v54;
    v57 = *((_QWORD *)v54 + 1);
    v58 = *(_QWORD *)(v56 + 16);
    sub_23D5AFA60(v57, v58);
    sub_23D5E6950(v56, type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext.Context);
    v59 = v72;
    sub_23D65546C(v35, v72);
    if (v37(v59, 1, v55) == 1)
    {
      *(_DWORD *)v51 = 0;
      *(_OWORD *)(v51 + 8) = xmmword_23D66DF40;
      *(_QWORD *)(v51 + 24) = 0;
      *(_BYTE *)(v51 + 32) = 1;
      sub_23D66BE5C();
      sub_23D5AEF8C(v59, &qword_256C7A648);
    }
    else
    {
      sub_23D655428(v59, v51);
    }
    v60 = *(_QWORD *)(v51 + 24);
    v61 = *(_BYTE *)(v51 + 32);
    sub_23D5E6950(v51, type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext.Context);
    sub_23D5AF304(v60, v61, (BOOL *)v79);
    v81 = v79[0];
    sub_23D653034((int)v74, (uint64_t)v65, v57, v58, &v81, v31);
    v62 = v73;
    sub_23D5DDA20(v76, v77);
    (*(void (**)(char *, uint64_t))(v64 + 8))(v78, v62);
    v48 = (uint64_t)v63;
  }
  else
  {
    if (qword_256C78B10 != -1)
      swift_once();
    v40 = sub_23D66BFDC();
    __swift_project_value_buffer(v40, (uint64_t)qword_256C88B78);
    v41 = sub_23D66C588();
    v42 = (int *)v26;
    sub_23D5E7298((uint64_t)v28, (uint64_t)v26, type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext);
    v43 = sub_23D66BFC4();
    v44 = v41;
    if (os_log_type_enabled(v43, v41))
    {
      v45 = swift_slowAlloc();
      *(_DWORD *)v45 = 67109376;
      v46 = *v42;
      sub_23D5E6950((uint64_t)v42, type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext);
      LODWORD(v79[0]) = v46;
      sub_23D66C5D0();
      *(_WORD *)(v45 + 8) = 1024;
      LODWORD(v79[0]) = 1;
      sub_23D66C5D0();
      _os_log_impl(&dword_23D5A8000, v43, v44, "unsupported version, expected %u got %u", (uint8_t *)v45, 0xEu);
      MEMORY[0x242636844](v45, -1, -1);
    }
    else
    {
      sub_23D5E6950((uint64_t)v42, type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D5ED518((unint64_t *)&qword_256C790E0, &qword_256C790D8, (uint64_t)&protocol conformance descriptor for GroupKitCryptoError<A>);
    swift_allocError();
    *(_WORD *)v47 = 305;
    *(_OWORD *)(v47 + 8) = xmmword_23D674760;
    *(_OWORD *)(v47 + 24) = xmmword_23D674770;
    *(_QWORD *)(v47 + 40) = 0x800000023D67A9E0;
    swift_willThrow();
    sub_23D5DDA20(v76, v77);
    v48 = (uint64_t)v28;
  }
  return sub_23D5E6950(v48, type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext);
}

uint64_t sub_23D653034@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, char *a5@<X4>, _DWORD *a6@<X8>)
{
  char v10;
  int *v11;
  char *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t *v15;
  uint64_t v16;
  os_log_type_t v17;
  NSObject *v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (a1)
  {
    v10 = *a5;
    *a6 = a1;
    v11 = (int *)type metadata accessor for GroupAuthenticatedCiphertext();
    v12 = (char *)a6 + v11[5];
    v13 = sub_23D66C108();
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v12, a2, v13);
    v15 = (uint64_t *)((char *)a6 + v11[6]);
    *v15 = a3;
    v15[1] = a4;
    *((_BYTE *)a6 + v11[7]) = v10;
  }
  else
  {
    if (qword_256C78B10 != -1)
      swift_once();
    v16 = sub_23D66BFDC();
    __swift_project_value_buffer(v16, (uint64_t)qword_256C88B78);
    v17 = sub_23D66C588();
    v18 = sub_23D66BFC4();
    if (os_log_type_enabled(v18, v17))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_23D5A8000, v18, v17, "invalid group version", v19, 2u);
      MEMORY[0x242636844](v19, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D5ED518((unint64_t *)&qword_256C790E0, &qword_256C790D8, (uint64_t)&protocol conformance descriptor for GroupKitCryptoError<A>);
    swift_allocError();
    *(_WORD *)v20 = 306;
    *(_OWORD *)(v20 + 8) = xmmword_23D674780;
    *(_QWORD *)(v20 + 24) = 0x800000023D67AAC0;
    *(_QWORD *)(v20 + 32) = 0xD000000000000057;
    *(_QWORD *)(v20 + 40) = 0x800000023D67A9E0;
    swift_willThrow();
    sub_23D5DDA20(a3, a4);
    v21 = sub_23D66C108();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(a2, v21);
  }
  return result;
}

uint64_t sub_23D653238()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v1 = type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GroupAuthenticatedCiphertext();
  v4 = sub_23D66C0F0();
  if (v5 >> 60 == 15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D5ED518((unint64_t *)&qword_256C790E0, &qword_256C790D8, (uint64_t)&protocol conformance descriptor for GroupKitCryptoError<A>);
    swift_allocError();
    *(_WORD *)v6 = 309;
    *(_OWORD *)(v6 + 8) = xmmword_23D674790;
    *(_OWORD *)(v6 + 24) = xmmword_23D6747A0;
    *(_QWORD *)(v6 + 40) = 0x800000023D67A9E0;
    swift_willThrow();
  }
  else
  {
    v7 = v4;
    v8 = v5;
    v9 = MEMORY[0x24BDAC7A8](v4);
    v12[-4] = v0;
    v12[-3] = v9;
    v12[-2] = v10;
    sub_23D5AE928(&qword_256C7A248, type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext, (uint64_t)&unk_23D670A0C);
    sub_23D66BF4C();
    v1 = sub_23D66BF1C();
    sub_23D5E6950((uint64_t)v3, type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext);
    sub_23D5E725C(v7, v8);
  }
  return v1;
}

uint64_t sub_23D65341C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  _BYTE v17[16];
  uint64_t v18;

  v8 = type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext.Context(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(_DWORD *)a1 = 1;
  v18 = a2;
  sub_23D5AE928(&qword_256C7A228, v12, (uint64_t)&unk_23D6708A4);
  sub_23D66BF4C();
  v13 = a1 + *(int *)(type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext(0) + 28);
  sub_23D5AEF8C(v13, &qword_256C7A648);
  sub_23D655428((uint64_t)v11, v13);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(v13, 0, 1, v8);
  v14 = *(_QWORD *)(a1 + 8);
  v15 = *(_QWORD *)(a1 + 16);
  sub_23D5AFA60(a3, a4);
  result = sub_23D5DDA20(v14, v15);
  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = a4;
  return result;
}

uint64_t sub_23D653554(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t result;

  *(_DWORD *)a1 = *a2;
  v4 = type metadata accessor for GroupAuthenticatedCiphertext();
  v5 = (uint64_t *)((char *)a2 + *(int *)(v4 + 24));
  v6 = *v5;
  v7 = v5[1];
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *v5;
  *(_QWORD *)(a1 + 16) = v7;
  sub_23D5AFA60(v6, v7);
  result = sub_23D5DDA20(v8, v9);
  *(_QWORD *)(a1 + 24) = (*((_BYTE *)a2 + *(int *)(v4 + 28)) & 1) == 0;
  *(_BYTE *)(a1 + 32) = 1;
  return result;
}

uint64_t sub_23D6535E4@<X0>(unsigned int a1@<W0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v7;
  uint64_t result;
  uint64_t inited;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t *boxed_opaque_existential_1;
  unsigned __int8 v21;
  uint64_t v22[5];

  v21 = *a2;
  result = sub_23D5D8E78(a1, &v21, v22);
  if (!v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790F0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23D66FC40;
    if (qword_256C78DA0 != -1)
      swift_once();
    v15 = qword_256C891F0;
    v16 = *(_QWORD *)algn_256C891F8;
    *(_QWORD *)(inited + 32) = qword_256C891F0;
    *(_QWORD *)(inited + 40) = v16;
    *(_QWORD *)(inited + 48) = a3;
    *(_QWORD *)(inited + 56) = a4;
    *(_QWORD *)(inited + 64) = a5;
    *(_QWORD *)(inited + 72) = a6;
    sub_23D5AFA60(v15, v16);
    sub_23D5AFA60(a3, a4);
    sub_23D5AFA60(a5, a6);
    v17 = sub_23D62FE18(inited);
    v19 = v18;
    swift_setDeallocating();
    swift_arrayDestroy();
    a7[3] = sub_23D66C054();
    a7[4] = (uint64_t)&off_250E2A1A0;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a7);
    sub_23D61D4A8(v22, 0, (uint64_t)boxed_opaque_existential_1);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    return sub_23D5DDA20(v17, v19);
  }
  return result;
}

uint64_t *Group.open(_:authenticating:entitlementID:keyDiversifier:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, unint64_t a6, uint64_t a7, unint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  unsigned int *v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  os_log_type_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t);
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  os_log_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87[2];
  uint64_t v88;
  unsigned __int8 v89[24];
  uint64_t v90;
  uint64_t v91;
  uint64_t v92[3];
  uint64_t v93;
  uint64_t v94;

  v10 = v8;
  v85 = a7;
  v86 = a8;
  v79 = a4;
  v78 = a3;
  v15 = sub_23D66C054();
  v83 = *(os_log_t *)(v15 - 8);
  v84 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v82 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23D66C108();
  v80 = *(_QWORD *)(v17 - 8);
  v81 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for GroupAuthenticatedCiphertext();
  v21 = MEMORY[0x24BDAC7A8](v20);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v25 = (unsigned int *)((char *)&v76 - v24);
  v26 = OBJC_IVAR____TtC14GroupKitCrypto5Group_state;
  if (*(_BYTE *)(v10 + OBJC_IVAR____TtC14GroupKitCrypto5Group_state) == 6)
  {
    v77 = v22;
    v76 = v23;
    sub_23D5AFA60(a1, a2);
    sub_23D6528CC(a1, a2, v25);
    if (!v9)
    {
      v27 = *v25;
      v28 = v77;
      v89[0] = *((_BYTE *)v25 + *(int *)(v77 + 28));
      sub_23D6535E4(v27, v89, (uint64_t)a5, a6, v85, v86, v92);
      v38 = v93;
      v39 = v94;
      __swift_project_boxed_opaque_existential_1(v92, v93);
      v40 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v39 + 8) + 8))(v38);
      v42 = v41;
      v43 = (uint64_t *)((char *)v25 + *(int *)(v28 + 24));
      v44 = (uint64_t)v25;
      v45 = *v43;
      v46 = v43[1];
      sub_23D5AFA60(*v43, v46);
      sub_23D5E6578(v40, v42);
      v48 = v47;
      sub_23D5DDA20(v45, v46);
      sub_23D5DDA20(v40, v42);
      if ((v48 & 1) != 0)
      {
        v49 = v44 + *(int *)(v28 + 20);
        v50 = v80;
        v51 = v81;
        (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v19, v49, v81);
        sub_23D654E74((uint64_t)v92, (uint64_t)v89);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C028);
        v52 = v82;
        swift_dynamicCast();
        v87[0] = v78;
        v87[1] = v79;
        sub_23D5E6898();
        a5 = (uint64_t *)sub_23D66C090();
        (*(void (**)(char *, uint64_t))(v50 + 8))(v19, v51);
        sub_23D5E6950(v44, (uint64_t (*)(_QWORD))type metadata accessor for GroupAuthenticatedCiphertext);
        ((void (*)(char *, uint64_t))v83[1].isa)(v52, v84);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
      }
      else
      {
        v86 = v44;
        if (qword_256C78B10 != -1)
          swift_once();
        v53 = sub_23D66BFDC();
        __swift_project_value_buffer(v53, (uint64_t)qword_256C88B78);
        v54 = sub_23D66C588();
        sub_23D654E74((uint64_t)v92, (uint64_t)v89);
        v55 = v86;
        v56 = v76;
        sub_23D5E7298(v86, v76, (uint64_t (*)(_QWORD))type metadata accessor for GroupAuthenticatedCiphertext);
        v57 = sub_23D66BFC4();
        if (os_log_type_enabled(v57, v54))
        {
          v58 = swift_slowAlloc();
          v85 = swift_slowAlloc();
          v87[0] = v85;
          *(_DWORD *)v58 = 136315394;
          v82 = (char *)(v58 + 4);
          LODWORD(v84) = v54;
          v60 = v90;
          v59 = v91;
          __swift_project_boxed_opaque_existential_1(v89, v90);
          v61 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(v59 + 8) + 8);
          v83 = v57;
          v62 = v61(v60);
          v64 = v63;
          sub_23D5B06C8(v62, v63);
          v81 = 0;
          v88 = v65;
          __swift_instantiateConcreteTypeFromMangledName(&qword_256C79198);
          sub_23D5ED518((unint64_t *)&qword_256C791A0, &qword_256C79198, MEMORY[0x24BEE12B0]);
          v66 = sub_23D66C378();
          v68 = v67;
          swift_bridgeObjectRelease();
          sub_23D5DDA20(v62, v64);
          v88 = sub_23D5DDBDC(v66, v68, v87);
          sub_23D66C5D0();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v89);
          *(_WORD *)(v58 + 12) = 2080;
          sub_23D5B06C8(*(_QWORD *)(v56 + *(int *)(v77 + 24)), *(_QWORD *)(v56 + *(int *)(v77 + 24) + 8));
          v88 = v69;
          v70 = sub_23D66C378();
          v72 = v71;
          swift_bridgeObjectRelease();
          v88 = sub_23D5DDBDC(v70, v72, v87);
          sub_23D66C5D0();
          swift_bridgeObjectRelease();
          sub_23D5E6950(v56, (uint64_t (*)(_QWORD))type metadata accessor for GroupAuthenticatedCiphertext);
          v57 = v83;
          _os_log_impl(&dword_23D5A8000, v83, (os_log_type_t)v84, "invalid key hash, got %s expected %s", (uint8_t *)v58, 0x16u);
          v73 = v85;
          swift_arrayDestroy();
          MEMORY[0x242636844](v73, -1, -1);
          v74 = v58;
          v55 = v86;
          MEMORY[0x242636844](v74, -1, -1);
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v89);
          sub_23D5E6950(v56, (uint64_t (*)(_QWORD))type metadata accessor for GroupAuthenticatedCiphertext);
        }

        a5 = &qword_256C790D8;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
        sub_23D5ED518((unint64_t *)&qword_256C790E0, &qword_256C790D8, (uint64_t)&protocol conformance descriptor for GroupKitCryptoError<A>);
        swift_allocError();
        *(_WORD *)v75 = 311;
        *(_OWORD *)(v75 + 8) = xmmword_23D6747C0;
        *(_QWORD *)(v75 + 24) = 0x800000023D67A9A0;
        *(_QWORD *)(v75 + 32) = 0xD000000000000057;
        *(_QWORD *)(v75 + 40) = 0x800000023D67A9E0;
        swift_willThrow();
        sub_23D5E6950(v55, (uint64_t (*)(_QWORD))type metadata accessor for GroupAuthenticatedCiphertext);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
      }
    }
  }
  else
  {
    if (qword_256C78B10 != -1)
      swift_once();
    v29 = sub_23D66BFDC();
    __swift_project_value_buffer(v29, (uint64_t)qword_256C88B78);
    v30 = sub_23D66C588();
    swift_retain_n();
    v31 = sub_23D66BFC4();
    if (os_log_type_enabled(v31, v30))
    {
      v32 = swift_slowAlloc();
      v33 = swift_slowAlloc();
      v92[0] = v33;
      *(_DWORD *)v32 = 136315394;
      v34 = sub_23D5B421C(*(_BYTE *)(v10 + v26));
      *(_QWORD *)v89 = sub_23D5DDBDC(v34, v35, v92);
      sub_23D66C5D0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 2080;
      *(_QWORD *)v89 = sub_23D5DDBDC(0x6F724764696C6176, 0xEA00000000007075, v92);
      sub_23D66C5D0();
      _os_log_impl(&dword_23D5A8000, v31, v30, "invalid group state, expected %s got %s", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x242636844](v33, -1, -1);
      MEMORY[0x242636844](v32, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    a5 = &qword_256C790D8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D5ED518((unint64_t *)&qword_256C790E0, &qword_256C790D8, (uint64_t)&protocol conformance descriptor for GroupKitCryptoError<A>);
    swift_allocError();
    *(_WORD *)v36 = 310;
    *(_OWORD *)(v36 + 8) = xmmword_23D6747B0;
    *(_QWORD *)(v36 + 24) = 0x800000023D67A9A0;
    *(_QWORD *)(v36 + 32) = 0xD000000000000057;
    *(_QWORD *)(v36 + 40) = 0x800000023D67A9E0;
    swift_willThrow();
  }
  return a5;
}

uint64_t type metadata accessor for GroupAuthenticatedCiphertext()
{
  uint64_t result;

  result = qword_256C7C088;
  if (!qword_256C7C088)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t Group.seal(_:authenticating:for:entitlementID:keyDiversifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
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
  char v30;
  unsigned int v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  os_log_type_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _DWORD *v51;
  unint64_t v52;
  uint64_t v54;
  uint64_t v55;
  _DWORD *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[7];
  uint64_t v69[3];
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v10 = v9;
  v64 = a4;
  v65 = a8;
  v62 = a2;
  v63 = a3;
  v61 = a1;
  v14 = type metadata accessor for GroupAuthenticatedCiphertext();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (_DWORD *)((char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79980);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_23D66C054();
  v60 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_23D66C108();
  v24 = MEMORY[0x24BDAC7A8](v23);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v29 = OBJC_IVAR____TtC14GroupKitCrypto5Group_state;
  if (*(_BYTE *)(v10 + OBJC_IVAR____TtC14GroupKitCrypto5Group_state) == 6)
  {
    v55 = v28;
    v59 = (char *)&v54 - v26;
    v57 = v27;
    v58 = v25;
    v56 = v16;
    v30 = *a5;
    swift_beginAccess();
    v31 = *(_DWORD *)(v10 + 64);
    LOBYTE(v68[0]) = v30;
    v32 = a7;
    v33 = v10;
    v34 = v72;
    sub_23D6535E4(v31, (unsigned __int8 *)v68, a6, v32, v65, a9, v69);
    if (!v34)
    {
      v68[5] = v61;
      v68[6] = v62;
      sub_23D654E74((uint64_t)v69, (uint64_t)v68);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C028);
      swift_dynamicCast();
      v35 = sub_23D66C0C0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v19, 1, 1, v35);
      v66 = v63;
      v67 = v64;
      sub_23D5E6898();
      v36 = v59;
      sub_23D66C09C();
      sub_23D5AEF8C((uint64_t)v19, &qword_256C79980);
      (*(void (**)(char *, uint64_t))(v60 + 8))(v22, v20);
      v46 = *(_DWORD *)(v10 + 64);
      v47 = v55;
      (*(void (**)(uint64_t, char *, uint64_t))(v57 + 16))(v55, v36, v58);
      v49 = v70;
      v48 = v71;
      __swift_project_boxed_opaque_existential_1(v69, v70);
      v50 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v48 + 8) + 8))(v49);
      LOBYTE(v68[0]) = v30;
      v51 = v56;
      sub_23D653034(v46, v47, v50, v52, (char *)v68, v56);
      v33 = sub_23D653238();
      sub_23D5E6950((uint64_t)v51, (uint64_t (*)(_QWORD))type metadata accessor for GroupAuthenticatedCiphertext);
      (*(void (**)(char *, uint64_t))(v57 + 8))(v59, v58);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v69);
    }
  }
  else
  {
    if (qword_256C78B10 != -1)
      swift_once();
    v37 = sub_23D66BFDC();
    __swift_project_value_buffer(v37, (uint64_t)qword_256C88B78);
    v38 = sub_23D66C588();
    swift_retain_n();
    v39 = sub_23D66BFC4();
    v40 = v38;
    if (os_log_type_enabled(v39, v38))
    {
      v41 = swift_slowAlloc();
      v42 = swift_slowAlloc();
      v69[0] = v42;
      *(_DWORD *)v41 = 136315394;
      v43 = sub_23D5B421C(*(_BYTE *)(v10 + v29));
      v68[0] = sub_23D5DDBDC(v43, v44, v69);
      sub_23D66C5D0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v41 + 12) = 2080;
      v68[0] = sub_23D5DDBDC(0x6F724764696C6176, 0xEA00000000007075, v69);
      sub_23D66C5D0();
      _os_log_impl(&dword_23D5A8000, v39, v40, "invalid group state, got %s expected %s", (uint8_t *)v41, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x242636844](v42, -1, -1);
      MEMORY[0x242636844](v41, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D5ED518((unint64_t *)&qword_256C790E0, &qword_256C790D8, (uint64_t)&protocol conformance descriptor for GroupKitCryptoError<A>);
    swift_allocError();
    *(_WORD *)v45 = 310;
    *(_OWORD *)(v45 + 8) = xmmword_23D6747D0;
    *(_QWORD *)(v45 + 24) = 0x800000023D67AA40;
    *(_QWORD *)(v45 + 32) = 0xD000000000000057;
    *(_QWORD *)(v45 + 40) = 0x800000023D67A9E0;
    swift_willThrow();
  }
  return v33;
}

uint64_t Group.sign(diversifier:authenticatedData:dataToSign:role:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, _BYTE *a7)
{
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  os_log_type_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  os_log_type_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  uint64_t inited;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  _QWORD *v65;
  unint64_t v66;
  ValueMetadata *v67;
  unint64_t v68;
  uint64_t v69;

  v9 = v7;
  v62 = a5;
  v63 = a6;
  v60 = a3;
  v61 = a4;
  v59 = a2;
  v58 = a1;
  v11 = sub_23D66C2DC();
  v57 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v64 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23D66C2AC();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v55 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v55 - v20;
  v22 = OBJC_IVAR____TtC14GroupKitCrypto5Group_state;
  if (*((_BYTE *)v9 + OBJC_IVAR____TtC14GroupKitCrypto5Group_state) != 6)
  {
    if (qword_256C78B10 != -1)
      swift_once();
    v25 = sub_23D66BFDC();
    __swift_project_value_buffer(v25, (uint64_t)qword_256C88B78);
    v26 = sub_23D66C588();
    swift_retain_n();
    v27 = sub_23D66BFC4();
    if (os_log_type_enabled(v27, v26))
    {
      v28 = swift_slowAlloc();
      v29 = swift_slowAlloc();
      v65 = (_QWORD *)v29;
      *(_DWORD *)v28 = 136315394;
      v30 = sub_23D5B421C(*((_BYTE *)v9 + v22));
      v69 = sub_23D5DDBDC(v30, v31, (uint64_t *)&v65);
      sub_23D66C5D0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2080;
      v69 = sub_23D5DDBDC(0x6F724764696C6176, 0xEA00000000007075, (uint64_t *)&v65);
      sub_23D66C5D0();
      _os_log_impl(&dword_23D5A8000, v27, v26, "invalid state transition in group, got %s expected %s", (uint8_t *)v28, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x242636844](v29, -1, -1);
      MEMORY[0x242636844](v28, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D5ED518((unint64_t *)&qword_256C790E0, &qword_256C790D8, (uint64_t)&protocol conformance descriptor for GroupKitCryptoError<A>);
    swift_allocError();
    *(_WORD *)v38 = 347;
    v39 = xmmword_23D6747E0;
    goto LABEL_19;
  }
  if (*a7 != 1)
  {
    v32 = v9[12];
    if (v32 >> 60 != 15)
    {
      v56 = v11;
      v18 = v19;
      v24 = v9[11];
      v41 = v9[13];
      v42 = v9[14];
      v67 = &type metadata for AdminSeed;
      v68 = sub_23D5E803C();
      v43 = (_QWORD *)swift_allocObject();
      v65 = v43;
      v43[2] = v24;
      v43[3] = v32;
      v43[4] = v41;
      v43[5] = v42;
      sub_23D5AFA60(v24, v32);
      sub_23D5E7284(v41, v42);
      sub_23D5AFA60(v24, v32);
      sub_23D5E7284(v41, v42);
      if (qword_256C78D20 != -1)
        swift_once();
      sub_23D61D674((uint64_t)&v65, 1, qword_256C890F0, *(uint64_t *)algn_256C890F8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v65);
      sub_23D5E7220(v24, v32, v41, v42);
      if (!v8)
        goto LABEL_24;
      return v24;
    }
    if (qword_256C78B10 != -1)
      swift_once();
    v33 = sub_23D66BFDC();
    __swift_project_value_buffer(v33, (uint64_t)qword_256C88B78);
    v34 = sub_23D66C588();
    v35 = sub_23D66BFC4();
    v36 = v34;
    if (os_log_type_enabled(v35, v34))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_23D5A8000, v35, v36, "no admin seed", v37, 2u);
      MEMORY[0x242636844](v37, -1, -1);
    }

    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D5ED518((unint64_t *)&qword_256C790E0, &qword_256C790D8, (uint64_t)&protocol conformance descriptor for GroupKitCryptoError<A>);
    swift_allocError();
    *(_WORD *)v38 = 308;
    v39 = xmmword_23D6747F0;
LABEL_19:
    *(_OWORD *)(v38 + 8) = v39;
    *(_QWORD *)(v38 + 24) = 0x800000023D67AA80;
    *(_QWORD *)(v38 + 32) = 0xD000000000000057;
    *(_QWORD *)(v38 + 40) = 0x800000023D67A9E0;
    swift_willThrow();
    return v24;
  }
  v56 = v11;
  v23 = v9[9];
  v24 = v9[10];
  v67 = &type metadata for MemberSeed;
  v68 = sub_23D5ED1F8();
  v65 = (_QWORD *)v23;
  v66 = v24;
  sub_23D5AFA60(v23, v24);
  sub_23D5AFA60(v23, v24);
  if (qword_256C78D48 != -1)
    swift_once();
  sub_23D61D674((uint64_t)&v65, 1, qword_256C89140, *(uint64_t *)algn_256C89148);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v65);
  sub_23D5DDA20(v23, v24);
  if (!v8)
  {
LABEL_24:
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v21, v18, v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790F0);
    inited = swift_initStackObject();
    v45 = v58;
    *(_QWORD *)(inited + 32) = v58;
    *(_OWORD *)(inited + 16) = xmmword_23D66FC40;
    v46 = v59;
    v55 = v13;
    v47 = v60;
    v48 = v61;
    *(_QWORD *)(inited + 40) = v59;
    *(_QWORD *)(inited + 48) = v47;
    v50 = v62;
    v49 = v63;
    *(_QWORD *)(inited + 56) = v48;
    *(_QWORD *)(inited + 64) = v50;
    *(_QWORD *)(inited + 72) = v49;
    sub_23D5AFA60(v45, v46);
    sub_23D5AFA60(v47, v48);
    sub_23D5AFA60(v50, v49);
    v51 = sub_23D62FE18(inited);
    v53 = v52;
    swift_setDeallocating();
    swift_arrayDestroy();
    v65 = (_QWORD *)v51;
    v66 = v53;
    sub_23D5E6898();
    v54 = v64;
    sub_23D66C2A0();
    v24 = sub_23D66C2B8();
    sub_23D5DDA20(v51, v53);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v54, v56);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v21, v55);
  }
  return v24;
}

uint64_t sub_23D654E74(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23D654EB8()
{
  _QWORD *v0;
  unint64_t v1;

  sub_23D5DDA20(v0[2], v0[3]);
  v1 = v0[5];
  if (v1 >> 60 != 15)
    sub_23D5DDA20(v0[4], v1);
  return swift_deallocObject();
}

_QWORD *sub_23D654EF4(_DWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_DWORD *)a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_23D66C108();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[6];
    v12 = (_QWORD *)((char *)v4 + v11);
    v13 = (_QWORD *)((char *)a2 + v11);
    v14 = *v13;
    v15 = v13[1];
    sub_23D5AFA60(*v13, v15);
    *v12 = v14;
    v12[1] = v15;
    *((_BYTE *)v4 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  }
  return v4;
}

uint64_t sub_23D654FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_23D66C108();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return sub_23D5DDA20(*(_QWORD *)(a1 + *(int *)(a2 + 24)), *(_QWORD *)(a1 + *(int *)(a2 + 24) + 8));
}

_DWORD *sub_23D655010(_DWORD *a1, _DWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23D66C108();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[6];
  v11 = (uint64_t *)((char *)a1 + v10);
  v12 = (uint64_t *)((char *)a2 + v10);
  v13 = *v12;
  v14 = v12[1];
  sub_23D5AFA60(*v12, v14);
  *v11 = v13;
  v11[1] = v14;
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  return a1;
}

_DWORD *sub_23D6550A8(_DWORD *a1, _DWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23D66C108();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (uint64_t *)((char *)a1 + v10);
  v12 = (uint64_t *)((char *)a2 + v10);
  v13 = *v12;
  v14 = v12[1];
  sub_23D5AFA60(*v12, v14);
  v15 = *v11;
  v16 = v11[1];
  *v11 = v13;
  v11[1] = v14;
  sub_23D5DDA20(v15, v16);
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  return a1;
}

_DWORD *sub_23D655148(_DWORD *a1, _DWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23D66C108();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *((_BYTE *)a1 + v10) = *((_BYTE *)a2 + v10);
  return a1;
}

_DWORD *sub_23D6551C8(_DWORD *a1, _DWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23D66C108();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = *(_QWORD *)((char *)a1 + v10);
  v12 = *(_QWORD *)((char *)a1 + v10 + 8);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  sub_23D5DDA20(v11, v12);
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  return a1;
}

uint64_t sub_23D655258()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23D655264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = sub_23D66C108();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 28));
  if (v9 >= 2)
    return v9 - 1;
  else
    return 0;
}

uint64_t sub_23D6552E0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23D6552EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23D66C108();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 28)) = a2 + 1;
  return result;
}

uint64_t sub_23D655368()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23D66C108();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23D6553F4(uint64_t a1)
{
  uint64_t v1;

  return sub_23D65341C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_23D655410(uint64_t a1)
{
  uint64_t v1;

  return sub_23D653554(a1, *(_DWORD **)(v1 + 16));
}

uint64_t sub_23D655428(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GKCrypto_GroupAuthenticatedCiphertext.Context(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23D65546C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C7A648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23D6554B4(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v8;

  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v5 = sub_23D5DF4A4(a1);
      if ((v6 & 1) != 0)
      {
        v4 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v5);
        swift_retain();
        return v4;
      }
    }
    return 0;
  }
  swift_retain();
  v3 = sub_23D66C6FC();
  swift_release();
  if (!v3)
    return 0;
  type metadata accessor for SimPCSBag(0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v4 = v8;
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_23D65558C(uint64_t a1)
{
  uint64_t result;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17[2];
  uint64_t v18;

  sub_23D5F15D4();
  result = sub_23D66C534();
  v3 = 0;
  v18 = result;
  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      v3 = v14 + 1;
      if (v14 + 1 >= v8)
        goto LABEL_23;
      v15 = *(_QWORD *)(v4 + 8 * v3);
      if (!v15)
      {
        v3 = v14 + 2;
        if (v14 + 2 >= v8)
          goto LABEL_23;
        v15 = *(_QWORD *)(v4 + 8 * v3);
        if (!v15)
        {
          v3 = v14 + 3;
          if (v14 + 3 >= v8)
            goto LABEL_23;
          v15 = *(_QWORD *)(v4 + 8 * v3);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    sub_23D5AFA60(*v11, v13);
    sub_23D65AF2C(v17, v12, v13);
    result = sub_23D5DDA20(v17[0], v17[1]);
  }
  v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  v15 = *(_QWORD *)(v4 + 8 * v16);
  if (v15)
  {
    v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v3);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_23D655728(uint64_t a1, uint64_t a2)
{
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
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v35[7];
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

  v46 = *MEMORY[0x24BDAC8D0];
  v41 = type metadata accessor for SimPCSID(0);
  v4 = MEMORY[0x24BDAC7A8](v41);
  v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v45 = (uint64_t)v35 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v35 - v9;
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
  {
    v12 = 1 << *(_BYTE *)(a1 + 32);
    if (v12 < 64)
      v13 = ~(-1 << v12);
    else
      v13 = -1;
    v14 = v13 & *(_QWORD *)(a1 + 56);
    v15 = (unint64_t)(v12 + 63) >> 6;
    v44 = a2 + 56;
    v39 = a2;
    v35[5] = a1;
    v35[4] = v10;
    v35[3] = (char *)v35 - v9;
    v35[2] = a1 + 56;
    v35[1] = v15;
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v36 = (v14 - 1) & v14;
      v37 = 0;
LABEL_23:
      v20 = *(_QWORD *)(a1 + 48);
      v43 = *(_QWORD *)(v10 + 72);
      sub_23D65F6D0(v20 + v43 * v16, (uint64_t)v11);
      v21 = v45;
      sub_23D65F750((uint64_t)v11, v45);
      sub_23D66C8E8();
      v22 = sub_23D66C234();
      v24 = v23;
      sub_23D66BDA8();
      sub_23D5DDA20(v22, v24);
      v25 = v41;
      v40 = v21 + *(int *)(v41 + 20);
      v26 = sub_23D66C234();
      v28 = v27;
      sub_23D66BDA8();
      sub_23D5DDA20(v26, v28);
      v38 = *(int *)(v25 + 24);
      sub_23D66C900();
      v29 = sub_23D66C90C();
      v30 = -1 << *(_BYTE *)(a2 + 32);
      v31 = v29 & ~v30;
      if (((*(_QWORD *)(v44 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) != 0)
      {
        v42 = ~v30;
        sub_23D65F6D0(*(_QWORD *)(a2 + 48) + v31 * v43, (uint64_t)v6);
        sub_23D66C234();
        v33 = v32;
        sub_23D66C234();
        __asm { BR              X10 }
      }
      sub_23D65F714(v45);
      return 0;
    }
    if ((unint64_t)(v12 + 63) >> 6 > 1)
    {
      v17 = *(_QWORD *)(a1 + 64);
      v18 = 1;
      if (v17)
        goto LABEL_22;
      v18 = 2;
      if (v15 <= 2)
        return 1;
      v17 = *(_QWORD *)(a1 + 72);
      if (v17)
        goto LABEL_22;
      v18 = 3;
      if (v15 <= 3)
        return 1;
      v17 = *(_QWORD *)(a1 + 80);
      if (v17)
        goto LABEL_22;
      v18 = 4;
      if (v15 <= 4)
        return 1;
      v17 = *(_QWORD *)(a1 + 88);
      if (v17)
      {
LABEL_22:
        v36 = (v17 - 1) & v17;
        v37 = v18;
        v16 = __clz(__rbit64(v17)) + (v18 << 6);
        goto LABEL_23;
      }
      v19 = 5;
      if (v15 > 5)
      {
        v17 = *(_QWORD *)(a1 + 96);
        if (v17)
        {
          v18 = 5;
          goto LABEL_22;
        }
        while (1)
        {
          v18 = v19 + 1;
          if (__OFADD__(v19, 1))
            __break(1u);
          if (v18 >= v15)
            break;
          v17 = *(_QWORD *)(a1 + 56 + 8 * v18);
          ++v19;
          if (v17)
            goto LABEL_22;
        }
      }
    }
    return 1;
  }
  return 0;
}

uint64_t sub_23D656BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v15;

  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
  {
    v3 = 1 << *(_BYTE *)(a1 + 32);
    if (v3 < 64)
      v4 = ~(-1 << v3);
    else
      v4 = -1;
    v5 = v4 & *(_QWORD *)(a1 + 56);
    v15 = (unint64_t)(v3 + 63) >> 6;
    if (v5)
    {
      v6 = __clz(__rbit64(v5));
LABEL_23:
      v10 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v6);
      v12 = *v10;
      v11 = v10[1];
      sub_23D66C8E8();
      sub_23D5AFA60(v12, v11);
      sub_23D5AFA60(v12, v11);
      sub_23D66BDA8();
      sub_23D5DDA20(v12, v11);
      v13 = sub_23D66C90C() & ~(-1 << *(_BYTE *)(a2 + 32));
      if (((*(_QWORD *)(a2 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
        __asm { BR              X8 }
      sub_23D5DDA20(v12, v11);
      return 0;
    }
    if ((unint64_t)(v3 + 63) >> 6 > 1)
    {
      v7 = *(_QWORD *)(a1 + 64);
      v8 = 1;
      if (v7)
        goto LABEL_22;
      v8 = 2;
      if (v15 <= 2)
        return 1;
      v7 = *(_QWORD *)(a1 + 72);
      if (v7)
        goto LABEL_22;
      v8 = 3;
      if (v15 <= 3)
        return 1;
      v7 = *(_QWORD *)(a1 + 80);
      if (v7)
        goto LABEL_22;
      v8 = 4;
      if (v15 <= 4)
        return 1;
      v7 = *(_QWORD *)(a1 + 88);
      if (v7)
      {
LABEL_22:
        v6 = __clz(__rbit64(v7)) + (v8 << 6);
        goto LABEL_23;
      }
      v9 = 5;
      if (v15 > 5)
      {
        v7 = *(_QWORD *)(a1 + 96);
        if (v7)
        {
          v8 = 5;
          goto LABEL_22;
        }
        while (1)
        {
          v8 = v9 + 1;
          if (__OFADD__(v9, 1))
            __break(1u);
          if (v8 >= v15)
            break;
          v7 = *(_QWORD *)(a1 + 56 + 8 * v8);
          ++v9;
          if (v7)
            goto LABEL_22;
        }
      }
    }
    return 1;
  }
  return 0;
}

void sub_23D657708()
{
  void *SigningIdentity;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  os_log_type_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  os_log_type_t v11;
  NSObject *v12;
  uint8_t *v13;
  uint64_t v14;

  SigningIdentity = (void *)_PCSIdentityGetSigningIdentity();
  if (SigningIdentity)
  {
    v1 = SigningIdentity;
    _PCSIdentityGetKey();
    v2 = (void *)_PCSKeyCopyExportedPrivateKey();
    if (v2)
    {
      v3 = v2;
      sub_23D66BD9C();

    }
    else
    {
      if (qword_256C78B10 != -1)
        swift_once();
      v10 = sub_23D66BFDC();
      __swift_project_value_buffer(v10, (uint64_t)qword_256C88B78);
      v11 = sub_23D66C588();
      v12 = sub_23D66BFC4();
      if (os_log_type_enabled(v12, v11))
      {
        v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_23D5A8000, v12, v11, "no signing key returned from PCS identity", v13, 2u);
        MEMORY[0x242636844](v13, -1, -1);
      }

      __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
      sub_23D65F2D4((unint64_t *)&qword_256C790E0, &qword_256C790D8);
      swift_allocError();
      *(_WORD *)v14 = 406;
      *(_OWORD *)(v14 + 8) = xmmword_23D674860;
      *(_OWORD *)(v14 + 24) = xmmword_23D674870;
      *(_QWORD *)(v14 + 40) = 0x800000023D67ABF0;
      swift_willThrow();

    }
  }
  else
  {
    if (qword_256C78B10 != -1)
      swift_once();
    v4 = sub_23D66BFDC();
    __swift_project_value_buffer(v4, (uint64_t)qword_256C88B78);
    v5 = sub_23D66C588();
    v6 = sub_23D66BFC4();
    v7 = v5;
    if (os_log_type_enabled(v6, v5))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_23D5A8000, v6, v7, "no signing identity found", v8, 2u);
      MEMORY[0x242636844](v8, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D65F2D4((unint64_t *)&qword_256C790E0, &qword_256C790D8);
    swift_allocError();
    *(_WORD *)v9 = 405;
    *(_OWORD *)(v9 + 8) = xmmword_23D674880;
    *(_OWORD *)(v9 + 24) = xmmword_23D674870;
    *(_QWORD *)(v9 + 40) = 0x800000023D67ABF0;
    swift_willThrow();
  }
}

uint64_t sub_23D6579E0()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v4;
  os_log_type_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;

  _PCSIdentityGetKey();
  v0 = (void *)_PCSKeyCopyExportedPrivateKey();
  if (v0)
  {
    v1 = v0;
    v2 = sub_23D66BD9C();

    return v2;
  }
  else
  {
    if (qword_256C78B10 != -1)
      swift_once();
    v4 = sub_23D66BFDC();
    __swift_project_value_buffer(v4, (uint64_t)qword_256C88B78);
    v5 = sub_23D66C588();
    v6 = sub_23D66BFC4();
    v7 = v5;
    if (os_log_type_enabled(v6, v5))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_23D5A8000, v6, v7, "no decryption key returned from PCS identity", v8, 2u);
      MEMORY[0x242636844](v8, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D65F2D4((unint64_t *)&qword_256C790E0, &qword_256C790D8);
    swift_allocError();
    *(_WORD *)v9 = 407;
    *(_OWORD *)(v9 + 8) = xmmword_23D674890;
    *(_QWORD *)(v9 + 24) = 0x800000023D67ACB0;
    *(_QWORD *)(v9 + 32) = 0xD00000000000006FLL;
    *(_QWORD *)(v9 + 40) = 0x800000023D67ABF0;
    return swift_willThrow();
  }
}

uint64_t sub_23D657B7C()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

void sub_23D657BA0()
{
  sub_23D657708();
}

uint64_t sub_23D657BC0()
{
  return sub_23D6579E0();
}

uint64_t sub_23D657BE0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  NSObject *v14;
  uint8_t *v15;
  uint64_t v16;

  v2 = v1;
  swift_bridgeObjectRelease();
  v4 = *a1;
  v5 = a1[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C520);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23D66DED0;
  v7 = (void *)*MEMORY[0x24BE7AEB8];
  if (!*MEMORY[0x24BE7AEB8])
    __break(1u);
  v8 = inited;
  *(_QWORD *)(inited + 32) = v7;
  *(_QWORD *)(inited + 40) = v4;
  *(_QWORD *)(inited + 48) = v5;
  v9 = v7;
  sub_23D5B4B88(v8);
  type metadata accessor for CFString(0);
  sub_23D65EAAC(&qword_256C790C8, 255, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_23D66DDFC);
  v10 = (void *)sub_23D66C360();
  swift_bridgeObjectRelease();
  v11 = PCSIdentitySetCreate();

  if (v11)
  {
    *(_QWORD *)(v2 + 16) = v11;
  }
  else
  {
    if (qword_256C78B10 != -1)
      swift_once();
    v12 = sub_23D66BFDC();
    __swift_project_value_buffer(v12, (uint64_t)qword_256C88B78);
    v13 = sub_23D66C588();
    v14 = sub_23D66BFC4();
    if (os_log_type_enabled(v14, v13))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23D5A8000, v14, v13, "failed to set PCS identity", v15, 2u);
      MEMORY[0x242636844](v15, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D65F2D4((unint64_t *)&qword_256C790E0, &qword_256C790D8);
    swift_allocError();
    *(_WORD *)v16 = 409;
    *(_OWORD *)(v16 + 8) = xmmword_23D6748B0;
    *(_QWORD *)(v16 + 24) = 0x800000023D67ABD0;
    *(_QWORD *)(v16 + 32) = 0xD00000000000006FLL;
    *(_QWORD *)(v16 + 40) = 0x800000023D67ABF0;
    swift_willThrow();
    type metadata accessor for PCSIDSet();
    swift_deallocPartialClassInstance();
  }
  return v2;
}

uint64_t sub_23D6580D4(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[28] = a4;
  v5[29] = v4;
  v5[26] = a1;
  v5[27] = a3;
  v6 = a2[1];
  v5[30] = *a2;
  v5[31] = v6;
  return swift_task_switch();
}

uint64_t sub_23D6580F8()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C558);
  result = swift_initStackObject();
  *(_OWORD *)(result + 16) = xmmword_23D66DF10;
  if (*MEMORY[0x24BE7AEB8])
  {
    v2 = result;
    v4 = v0[30];
    v3 = v0[31];
    v5 = (id)*MEMORY[0x24BE7AEB8];
    v0[24] = v5;
    type metadata accessor for CFString(0);
    sub_23D65EAAC(&qword_256C790C8, 255, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_23D66DDFC);
    v6 = v5;
    result = sub_23D66C60C();
    *(_QWORD *)(v2 + 96) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v2 + 72) = v4;
    *(_QWORD *)(v2 + 80) = v3;
    v7 = (void *)*MEMORY[0x24BE7AED8];
    if (*MEMORY[0x24BE7AED8])
    {
      v8 = v0[29];
      v14 = v0[28];
      v9 = v0[26];
      v10 = v0[27];
      swift_bridgeObjectRetain();

      v0[25] = v7;
      sub_23D66C60C();
      *(_QWORD *)(v2 + 168) = MEMORY[0x24BEE1328];
      *(_BYTE *)(v2 + 144) = 1;
      v11 = sub_23D5B4DA4(v2);
      v0[32] = v11;
      v12 = (_QWORD *)swift_task_alloc();
      v0[33] = v12;
      v12[2] = v8;
      v12[3] = v10;
      v12[4] = v14;
      v12[5] = v11;
      *(_QWORD *)(v9 + 24) = type metadata accessor for PCSID();
      *(_QWORD *)(v9 + 32) = &off_250E2B000;
      v13 = (_QWORD *)swift_task_alloc();
      v0[34] = v13;
      *v13 = v0;
      v13[1] = sub_23D6582EC;
      return sub_23D66C870();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23D6582EC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 280) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23D65836C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 208);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  __swift_deallocate_boxed_opaque_existential_1(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23D6583B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD aBlock[6];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C560);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (void *)sub_23D66C390();
  v6 = (void *)sub_23D66C360();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v8 + v7, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_23D65F910;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23D6586D8;
  aBlock[3] = &block_descriptor_2;
  v9 = _Block_copy(aBlock);
  swift_release();
  PCSIdentitySetCreateManatee();
  _Block_release(v9);

}

uint64_t sub_23D65853C(void *a1, void *a2)
{
  id v3;
  uint64_t v6;
  id v7;
  uint64_t v8;

  if (a1)
  {
    type metadata accessor for PCSID();
    *(_QWORD *)(swift_allocObject() + 16) = a1;
    v3 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C560);
    return sub_23D66C528();
  }
  else
  {
    if (a2)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C528);
      sub_23D65F2D4(&qword_256C7C530, &qword_256C7C528);
      swift_allocError();
      *(_BYTE *)v6 = -102;
      *(_QWORD *)(v6 + 8) = a2;
      *(_OWORD *)(v6 + 16) = xmmword_23D6748C0;
      *(_QWORD *)(v6 + 32) = 0x800000023D67AC60;
      *(_QWORD *)(v6 + 40) = 0xD00000000000006FLL;
      *(_QWORD *)(v6 + 48) = 0x800000023D67ABF0;
      v7 = a2;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
      sub_23D65F2D4((unint64_t *)&qword_256C790E0, &qword_256C790D8);
      swift_allocError();
      *(_WORD *)v8 = 411;
      *(_OWORD *)(v8 + 8) = xmmword_23D6748D0;
      *(_QWORD *)(v8 + 24) = 0x800000023D67AC60;
      *(_QWORD *)(v8 + 32) = 0xD00000000000006FLL;
      *(_QWORD *)(v8 + 40) = 0x800000023D67ABF0;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C560);
    return sub_23D66C51C();
  }
}

void sub_23D6586D8(uint64_t a1, void *a2, void *a3)
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

uint64_t sub_23D65874C(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  v10 = *v4;
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_23D63F7FC;
  v11[28] = a4;
  v11[29] = v10;
  v11[26] = a1;
  v11[27] = a3;
  v12 = a2[1];
  v11[30] = *a2;
  v11[31] = v12;
  return swift_task_switch();
}

uint64_t static P256.KeyAgreement.PrivateKey.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_23D658838(a1, a2, MEMORY[0x24BDC6910]);
}

uint64_t P256.KeyAgreement.PrivateKey.hash(into:)(uint64_t a1)
{
  return sub_23D6588C8(a1, MEMORY[0x24BDC6910]);
}

uint64_t P256.KeyAgreement.PrivateKey.hashValue.getter()
{
  return sub_23D65891C((uint64_t (*)(uint64_t))MEMORY[0x24BDC6910]);
}

uint64_t sub_23D6587FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23D658988(a1, a2, a3, a4, MEMORY[0x24BDC6910]);
}

uint64_t sub_23D658808(uint64_t a1, uint64_t a2)
{
  return sub_23D658A18(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6910]);
}

uint64_t sub_23D658814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23D658A84(a1, a2, a3, MEMORY[0x24BDC6910]);
}

uint64_t sub_23D658820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23D658AD8(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6910]);
}

uint64_t static P256.Signing.PrivateKey.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_23D658838(a1, a2, MEMORY[0x24BDC6988]);
}

uint64_t sub_23D658838(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  char v11;

  v4 = a3();
  v6 = v5;
  v7 = a3();
  v9 = v8;
  sub_23D5E6578(v4, v6);
  v11 = v10;
  sub_23D5DDA20(v7, v9);
  sub_23D5DDA20(v4, v6);
  return v11 & 1;
}

uint64_t P256.Signing.PrivateKey.hash(into:)(uint64_t a1)
{
  return sub_23D6588C8(a1, MEMORY[0x24BDC6988]);
}

uint64_t sub_23D6588C8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = a2();
  v4 = v3;
  sub_23D66BDA8();
  return sub_23D5DDA20(v2, v4);
}

uint64_t P256.Signing.PrivateKey.hashValue.getter()
{
  return sub_23D65891C((uint64_t (*)(uint64_t))MEMORY[0x24BDC6988]);
}

uint64_t sub_23D65891C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v2 = sub_23D66C8E8();
  v3 = a1(v2);
  v5 = v4;
  sub_23D66BDA8();
  sub_23D5DDA20(v3, v5);
  return sub_23D66C90C();
}

uint64_t sub_23D65897C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23D658988(a1, a2, a3, a4, MEMORY[0x24BDC6988]);
}

uint64_t sub_23D658988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  char v13;

  v6 = a5();
  v8 = v7;
  v9 = a5();
  v11 = v10;
  sub_23D5E6578(v6, v8);
  v13 = v12;
  sub_23D5DDA20(v9, v11);
  sub_23D5DDA20(v6, v8);
  return v13 & 1;
}

uint64_t sub_23D658A0C(uint64_t a1, uint64_t a2)
{
  return sub_23D658A18(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6988]);
}

uint64_t sub_23D658A18(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = sub_23D66C8E8();
  v5 = a3(v4);
  v7 = v6;
  sub_23D66BDA8();
  sub_23D5DDA20(v5, v7);
  return sub_23D66C90C();
}

uint64_t sub_23D658A78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23D658A84(a1, a2, a3, MEMORY[0x24BDC6988]);
}

uint64_t sub_23D658A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a4();
  v6 = v5;
  sub_23D66BDA8();
  return sub_23D5DDA20(v4, v6);
}

uint64_t sub_23D658ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23D658AD8(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6988]);
}

uint64_t sub_23D658AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = sub_23D66C8E8();
  v6 = a4(v5);
  v8 = v7;
  sub_23D66BDA8();
  sub_23D5DDA20(v6, v8);
  return sub_23D66C90C();
}

uint64_t sub_23D658B34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  _QWORD v12[2];

  v0 = sub_23D66C330();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D66C264();
  v4 = sub_23D66C1E0();
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7 = sub_23D66C234();
  v9 = v8;
  if (v6 >> 60 == 15)
  {
    sub_23D63ED64();
    swift_allocError();
    *v10 = 0;
    swift_willThrow();
    return sub_23D5DDA20(v7, v9);
  }
  else
  {
    v12[0] = v4;
    v12[1] = v6;
    sub_23D5AFA60(v4, v6);
    sub_23D66BDB4();
    sub_23D5E725C(v4, v6);
    sub_23D5DDA20(v7, v9);
    return v12[0];
  }
}

uint64_t sub_23D658C6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  _QWORD v12[2];

  v0 = sub_23D66C210();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SimPCSID(0);
  sub_23D66C228();
  v4 = sub_23D66C1E0();
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7 = sub_23D66C234();
  v9 = v8;
  if (v6 >> 60 == 15)
  {
    sub_23D63ED64();
    swift_allocError();
    *v10 = 1;
    swift_willThrow();
    return sub_23D5DDA20(v7, v9);
  }
  else
  {
    v12[0] = v4;
    v12[1] = v6;
    sub_23D5AFA60(v4, v6);
    sub_23D66BDB4();
    sub_23D5E725C(v4, v6);
    sub_23D5DDA20(v7, v9);
    return v12[0];
  }
}

uint64_t sub_23D658DB8()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  sub_23D66C8E8();
  v0 = sub_23D66C234();
  v2 = v1;
  sub_23D66BDA8();
  sub_23D5DDA20(v0, v2);
  v3 = sub_23D66C234();
  v5 = v4;
  sub_23D66BDA8();
  sub_23D5DDA20(v3, v5);
  sub_23D66C900();
  return sub_23D66C90C();
}

uint64_t sub_23D658E64()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v0 = sub_23D66C234();
  v2 = v1;
  sub_23D66BDA8();
  sub_23D5DDA20(v0, v2);
  v3 = sub_23D66C234();
  v5 = v4;
  sub_23D66BDA8();
  sub_23D5DDA20(v3, v5);
  return sub_23D66C900();
}

uint64_t sub_23D658F00()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  sub_23D66C8E8();
  v0 = sub_23D66C234();
  v2 = v1;
  sub_23D66BDA8();
  sub_23D5DDA20(v0, v2);
  v3 = sub_23D66C234();
  v5 = v4;
  sub_23D66BDA8();
  sub_23D5DDA20(v3, v5);
  sub_23D66C900();
  return sub_23D66C90C();
}

uint64_t sub_23D658FAC()
{
  return sub_23D658B34();
}

uint64_t sub_23D658FC0()
{
  return sub_23D658C6C();
}

uint64_t sub_23D658FD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = v1;
  return swift_task_switch();
}

uint64_t sub_23D658FEC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;

  if (qword_256C78DA8 != -1)
    swift_once();
  swift_beginAccess();
  v1 = qword_256C89200;
  v2 = (_QWORD *)swift_retain();
  v3 = sub_23D6554B4(v2, v1);
  swift_endAccess();
  swift_release();
  if (v3)
  {
    v4 = *(uint64_t **)(v0 + 40);
    v4[3] = type metadata accessor for SimPCSID(0);
    v4[4] = (uint64_t)&off_250E2AF98;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v4);
    sub_23D65F6D0(v3 + OBJC_IVAR____TtC14GroupKitCrypto9SimPCSBag_current, (uint64_t)boxed_opaque_existential_1);
  }
  else
  {
    v6 = *(uint64_t **)(v0 + 40);
    v7 = *(_QWORD **)(v0 + 48);
    type metadata accessor for SimPCSBag(0);
    v8 = swift_allocObject();
    v9 = v8 + OBJC_IVAR____TtC14GroupKitCrypto9SimPCSBag_current;
    sub_23D66C288();
    v10 = type metadata accessor for SimPCSID(0);
    sub_23D66C24C();
    *(_BYTE *)(v9 + *(int *)(v10 + 24)) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C540);
    v11 = *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
    v12 = (v11 + 32) & ~v11;
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_23D66DED0;
    sub_23D65F6D0(v9, v13 + v12);
    v14 = sub_23D65F794(v13);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    *(_QWORD *)(v8 + OBJC_IVAR____TtC14GroupKitCrypto9SimPCSBag_bag) = v14;
    swift_beginAccess();
    swift_retain();
    v15 = swift_retain();
    sub_23D6597B4(v15, v7);
    swift_endAccess();
    swift_release();
    v6[3] = v10;
    v6[4] = (uint64_t)&off_250E2AF98;
    v16 = __swift_allocate_boxed_opaque_existential_1(v6);
    sub_23D65F6D0(v9, (uint64_t)v16);
  }
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23D65923C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23D659268()
{
  sub_23D66C8E8();
  swift_bridgeObjectRetain();
  sub_23D66C3CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23D66C3CC();
  swift_bridgeObjectRelease();
  return sub_23D66C90C();
}

uint64_t sub_23D6592EC()
{
  return sub_23D659268();
}

uint64_t sub_23D65930C()
{
  swift_bridgeObjectRetain();
  sub_23D66C3CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23D66C3CC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23D659378()
{
  sub_23D66C8E8();
  swift_bridgeObjectRetain();
  sub_23D66C3CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23D66C3CC();
  swift_bridgeObjectRelease();
  return sub_23D66C90C();
}

uint64_t sub_23D6593FC(_QWORD **a1, _QWORD **a2)
{
  return sub_23D65F358(*a1, *a2);
}

uint64_t sub_23D659408(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23D63D3E0;
  v5[5] = a1;
  v5[6] = v4;
  return swift_task_switch();
}

uint64_t sub_23D65946C(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v2 = v1;
  v4 = type metadata accessor for SimPCSID(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D65F6D0(v1 + OBJC_IVAR____TtC14GroupKitCrypto9SimPCSBag_current, (uint64_t)v6);
  v7 = sub_23D66C234();
  v9 = v8;
  sub_23D66BDA8();
  sub_23D5DDA20(v7, v9);
  v10 = sub_23D66C234();
  v12 = v11;
  sub_23D66BDA8();
  sub_23D5DDA20(v10, v12);
  sub_23D66C900();
  sub_23D65F714((uint64_t)v6);
  v13 = *(_QWORD *)(v2 + OBJC_IVAR____TtC14GroupKitCrypto9SimPCSBag_bag);
  swift_bridgeObjectRetain();
  sub_23D65E7E8(a1, v13);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23D659588()
{
  uint64_t v0;

  sub_23D65F714(v0 + OBJC_IVAR____TtC14GroupKitCrypto9SimPCSBag_current);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23D6595C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  __int128 v14[4];

  v1 = v0;
  v2 = type metadata accessor for SimPCSID(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D66C8E8();
  sub_23D65F6D0(v0 + OBJC_IVAR____TtC14GroupKitCrypto9SimPCSBag_current, (uint64_t)v4);
  v5 = sub_23D66C234();
  v7 = v6;
  sub_23D66BDA8();
  sub_23D5DDA20(v5, v7);
  v8 = sub_23D66C234();
  v10 = v9;
  sub_23D66BDA8();
  sub_23D5DDA20(v8, v10);
  sub_23D66C900();
  sub_23D65F714((uint64_t)v4);
  v11 = *(_QWORD *)(v1 + OBJC_IVAR____TtC14GroupKitCrypto9SimPCSBag_bag);
  swift_bridgeObjectRetain();
  sub_23D65E7E8(v14, v11);
  swift_bridgeObjectRelease();
  return sub_23D66C90C();
}

uint64_t sub_23D6596F4()
{
  return sub_23D6595C8();
}

uint64_t sub_23D659714(__int128 *a1)
{
  return sub_23D65946C(a1);
}

uint64_t sub_23D659734()
{
  __int128 v1[4];

  sub_23D66C8E8();
  sub_23D65946C(v1);
  return sub_23D66C90C();
}

uint64_t sub_23D659770(uint64_t *a1, uint64_t *a2)
{
  return sub_23D65F4E8(*a1, *a2);
}

unint64_t sub_23D65977C()
{
  unint64_t result;

  result = sub_23D5B4C9C(MEMORY[0x24BEE4AF8]);
  qword_256C89200 = result;
  return result;
}

void sub_23D6597A0()
{
  qword_256C89208 = MEMORY[0x24BEE4B08];
}

uint64_t sub_23D6597B4(uint64_t a1, _QWORD *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) == 0)
    goto LABEL_7;
  if (v6 < 0)
    v7 = *v2;
  else
    v7 = v6 & 0xFFFFFFFFFFFFFF8;
  result = sub_23D66C6F0();
  if (!__OFADD__(result, 1))
  {
    *v3 = sub_23D659854(v7, result + 1);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = *v3;
    *v3 = 0x8000000000000000;
    sub_23D5E04E0(a1, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v10;
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_23D659854(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256C79958);
    v2 = sub_23D66C750();
    v17 = v2;
    sub_23D66C6E4();
    if (sub_23D66C708())
    {
      type metadata accessor for SimPCSIDSet();
      do
      {
        swift_dynamicCast();
        type metadata accessor for SimPCSBag(0);
        swift_dynamicCast();
        v2 = v17;
        v10 = *(_QWORD *)(v17 + 16);
        if (*(_QWORD *)(v17 + 24) <= v10)
        {
          sub_23D664AA0(v10 + 1, 1);
          v2 = v17;
        }
        sub_23D66C8E8();
        swift_bridgeObjectRetain();
        sub_23D66C3CC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_23D66C3CC();
        swift_bridgeObjectRelease();
        result = sub_23D66C90C();
        v4 = v2 + 64;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 64 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 64 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v11 = 0;
          v12 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v12 && (v11 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v13 = v7 == v12;
            if (v7 == v12)
              v7 = 0;
            v11 |= v13;
            v14 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v14 == -1);
          v8 = __clz(__rbit64(~v14)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        v9 = 8 * v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v9) = v16;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v9) = v15;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_23D66C708());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B00];
  }
  return v2;
}

uint64_t sub_23D659ACC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char isUniquelyReferenced_nonNull_native;
  _QWORD v27[13];
  uint64_t v28;
  uint64_t v29;
  uint64_t __s1;
  uint64_t v31;

  v3 = v2;
  v31 = *MEMORY[0x24BDAC8D0];
  v6 = type metadata accessor for SimPCSID(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v27 - v11;
  v13 = *v2;
  sub_23D66C8E8();
  swift_bridgeObjectRetain();
  v14 = sub_23D66C234();
  v16 = v15;
  sub_23D66BDA8();
  sub_23D5DDA20(v14, v16);
  v27[8] = a2 + *(int *)(v6 + 20);
  v17 = sub_23D66C234();
  v19 = v18;
  sub_23D66BDA8();
  sub_23D5DDA20(v17, v19);
  v27[10] = v6;
  v27[6] = *(int *)(v6 + 24);
  sub_23D66C900();
  v20 = sub_23D66C90C();
  v21 = -1 << *(_BYTE *)(v13 + 32);
  v22 = v20 & ~v21;
  v29 = v13 + 56;
  if (((*(_QWORD *)(v13 + 56 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) != 0)
  {
    v27[1] = v12;
    v27[2] = v3;
    v27[3] = a1;
    v27[11] = ~v21;
    v27[12] = v13;
    v28 = *(_QWORD *)(v7 + 72);
    v27[7] = a2;
    sub_23D65F6D0(*(_QWORD *)(v13 + 48) + v28 * v22, (uint64_t)v10);
    sub_23D66C234();
    v24 = v23;
    sub_23D66C234();
    __asm { BR              X10 }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_23D65F6D0(a2, (uint64_t)v12);
  __s1 = *v3;
  *v3 = 0x8000000000000000;
  sub_23D65C03C((uint64_t)v12, v22, isUniquelyReferenced_nonNull_native);
  *v3 = __s1;
  swift_bridgeObjectRelease();
  sub_23D65F750(a2, a1);
  return 1;
}

uint64_t sub_23D65AF2C(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t *v3;
  uint64_t v6;
  unint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v10;
  uint64_t __s1;

  v6 = *v3;
  sub_23D66C8E8();
  swift_bridgeObjectRetain();
  sub_23D5AFA60(a2, a3);
  sub_23D66BDA8();
  sub_23D5DDA20(a2, a3);
  v7 = sub_23D66C90C() & ~(-1 << *(_BYTE *)(v6 + 32));
  if (((*(_QWORD *)(v6 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
    __asm { BR              X8 }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  __s1 = *v10;
  *v10 = 0x8000000000000000;
  sub_23D5AFA60(a2, a3);
  sub_23D65D398(a2, a3, v7, isUniquelyReferenced_nonNull_native);
  *v10 = __s1;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23D65B9A0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;

  v1 = v0;
  v2 = type metadata accessor for SimPCSID(0);
  v42 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C550);
  v6 = sub_23D66C624();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v41 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v39 = v0;
    v40 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v40)
          goto LABEL_33;
        v19 = v41[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v40)
            goto LABEL_33;
          v19 = v41[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v40)
              goto LABEL_33;
            v19 = v41[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v40)
              {
LABEL_33:
                swift_release();
                v1 = v39;
                v37 = 1 << *(_BYTE *)(v5 + 32);
                if (v37 > 63)
                  bzero(v41, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v41 = -1 << v37;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v41[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v40)
                    goto LABEL_33;
                  v19 = v41[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v5 + 48);
      v23 = *(_QWORD *)(v42 + 72);
      sub_23D65F750(v22 + v23 * v17, (uint64_t)v4);
      sub_23D66C8E8();
      v24 = sub_23D66C234();
      v26 = v25;
      sub_23D66BDA8();
      sub_23D5DDA20(v24, v26);
      v27 = sub_23D66C234();
      v29 = v28;
      sub_23D66BDA8();
      sub_23D5DDA20(v27, v29);
      sub_23D66C900();
      result = sub_23D66C90C();
      v30 = -1 << *(_BYTE *)(v7 + 32);
      v31 = result & ~v30;
      v32 = v31 >> 6;
      if (((-1 << v31) & ~*(_QWORD *)(v12 + 8 * (v31 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v12 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v33 = 0;
        v34 = (unint64_t)(63 - v30) >> 6;
        do
        {
          if (++v32 == v34 && (v33 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v35 = v32 == v34;
          if (v32 == v34)
            v32 = 0;
          v33 |= v35;
          v36 = *(_QWORD *)(v12 + 8 * v32);
        }
        while (v36 == -1);
        v15 = __clz(__rbit64(~v36)) + (v32 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = sub_23D65F750((uint64_t)v4, *(_QWORD *)(v7 + 48) + v15 * v23);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_23D65BD48()
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
  uint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C568);
  v3 = sub_23D66C624();
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
      sub_23D66C8E8();
      sub_23D5AFA60(v20, v21);
      sub_23D66BDA8();
      sub_23D5DDA20(v20, v21);
      result = sub_23D66C90C();
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
      v13 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23D65C03C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD v29[4];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v34 = type metadata accessor for SimPCSID(0);
  v7 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v30 = v7;
  v31 = v3;
  if (v11 <= v10 || (a3 & 1) == 0)
  {
    if ((a3 & 1) != 0)
    {
      sub_23D65B9A0();
    }
    else
    {
      if (v11 > v10)
      {
        sub_23D65DE10();
        goto LABEL_10;
      }
      sub_23D65E1B8();
    }
    v12 = *v3;
    sub_23D66C8E8();
    v13 = sub_23D66C234();
    v15 = v14;
    sub_23D66BDA8();
    sub_23D5DDA20(v13, v15);
    v16 = v34;
    v32 = a1 + *(int *)(v34 + 20);
    v17 = sub_23D66C234();
    v19 = v18;
    sub_23D66BDA8();
    sub_23D5DDA20(v17, v19);
    v29[2] = *(int *)(v16 + 24);
    sub_23D66C900();
    v20 = sub_23D66C90C();
    v21 = -1 << *(_BYTE *)(v12 + 32);
    a2 = v20 & ~v21;
    v37 = v12 + 56;
    v38 = v12;
    if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
    {
      v35 = ~v21;
      v36 = *(_QWORD *)(v7 + 72);
      v33 = a1;
      sub_23D65F6D0(*(_QWORD *)(v38 + 48) + v36 * a2, (uint64_t)v9);
      sub_23D66C234();
      v23 = v22;
      sub_23D66C234();
      __asm { BR              X10 }
    }
  }
LABEL_10:
  v24 = *v31;
  *(_QWORD *)(*v31 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = sub_23D65F750(a1, *(_QWORD *)(v24 + 48) + *(_QWORD *)(v30 + 72) * a2);
  v26 = *(_QWORD *)(v24 + 16);
  v27 = __OFADD__(v26, 1);
  v28 = v26 + 1;
  if (v27)
  {
    __break(1u);
    JUMPOUT(0x23D65D1F8);
  }
  *(_QWORD *)(v24 + 16) = v28;
  return result;
}

uint64_t sub_23D65D398(uint64_t result, unint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v7 = result;
  v8 = *(_QWORD *)(*v4 + 16);
  v9 = *(_QWORD *)(*v4 + 24);
  if (v9 <= v8 || (a4 & 1) == 0)
  {
    if ((a4 & 1) != 0)
    {
      sub_23D65BD48();
    }
    else
    {
      if (v9 > v8)
      {
        result = (uint64_t)sub_23D65E008();
        goto LABEL_10;
      }
      sub_23D65E520();
    }
    v10 = *v4;
    sub_23D66C8E8();
    sub_23D5AFA60(v7, a2);
    sub_23D66BDA8();
    sub_23D5DDA20(v7, a2);
    result = sub_23D66C90C();
    a3 = result & ~(-1 << *(_BYTE *)(v10 + 32));
    if (((*(_QWORD *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
      __asm { BR              X8 }
  }
LABEL_10:
  v11 = *v4;
  *(_QWORD *)(*v4 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v12 = (uint64_t *)(*(_QWORD *)(v11 + 48) + 16 * a3);
  *v12 = v7;
  v12[1] = a2;
  v13 = *(_QWORD *)(v11 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
  {
    __break(1u);
    JUMPOUT(0x23D65DD34);
  }
  *(_QWORD *)(v11 + 16) = v15;
  return result;
}

void *sub_23D65DE10()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;

  v1 = v0;
  v2 = type metadata accessor for SimPCSID(0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C550);
  v6 = *v0;
  v7 = sub_23D66C618();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v8;
    return result;
  }
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
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
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    sub_23D65F6D0(*(_QWORD *)(v6 + 48) + v20, (uint64_t)v5);
    result = (void *)sub_23D65F750((uint64_t)v5, *(_QWORD *)(v8 + 48) + v20);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
    goto LABEL_28;
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23D65E008()
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
  __int128 v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C568);
  v2 = *v0;
  v3 = sub_23D66C618();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = *(_OWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_OWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = (void *)sub_23D5AFA60(v17, *((unint64_t *)&v17 + 1));
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23D65E1B8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;

  v1 = v0;
  v2 = type metadata accessor for SimPCSID(0);
  v39 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C550);
  v6 = sub_23D66C624();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v7;
    return result;
  }
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v9 = *(_QWORD *)(v5 + 56);
  v36 = v0;
  v37 = v5 + 56;
  if (v8 < 64)
    v10 = ~(-1 << v8);
  else
    v10 = -1;
  v11 = v10 & v9;
  v38 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 56;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v38)
      goto LABEL_33;
    v19 = *(_QWORD *)(v37 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v38)
        goto LABEL_33;
      v19 = *(_QWORD *)(v37 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v38)
          goto LABEL_33;
        v19 = *(_QWORD *)(v37 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_23:
    v11 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    v21 = *(_QWORD *)(v39 + 72);
    sub_23D65F6D0(*(_QWORD *)(v5 + 48) + v21 * v17, (uint64_t)v4);
    sub_23D66C8E8();
    v22 = sub_23D66C234();
    v24 = v23;
    sub_23D66BDA8();
    sub_23D5DDA20(v22, v24);
    v25 = sub_23D66C234();
    v27 = v26;
    sub_23D66BDA8();
    sub_23D5DDA20(v25, v27);
    sub_23D66C900();
    result = sub_23D66C90C();
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
          goto LABEL_36;
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
    result = sub_23D65F750((uint64_t)v4, *(_QWORD *)(v7 + 48) + v15 * v21);
    ++*(_QWORD *)(v7 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v38)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v36;
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v37 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v38)
      goto LABEL_33;
    v19 = *(_QWORD *)(v37 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23D65E520()
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
  uint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C568);
  v3 = sub_23D66C624();
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
    sub_23D66C8E8();
    sub_23D5AFA60(v20, v21);
    sub_23D5AFA60(v20, v21);
    sub_23D66BDA8();
    sub_23D5DDA20(v20, v21);
    result = sub_23D66C90C();
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
    v13 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v12);
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

uint64_t sub_23D65E7E8(__int128 *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t result;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v32;
  int64_t v33;
  _QWORD v34[3];
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v4 = type metadata accessor for SimPCSID(0);
  v35 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v34 - v8;
  v10 = *((_QWORD *)a1 + 8);
  v11 = a1[1];
  v37 = *a1;
  v38 = v11;
  v12 = a1[2];
  v13 = a1[3];
  v34[1] = a1;
  v39 = v12;
  v40 = v13;
  v41 = v10;
  v34[2] = sub_23D66C90C();
  v14 = a2 + 56;
  v15 = 1 << *(_BYTE *)(a2 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(a2 + 56);
  v18 = (unint64_t)(v15 + 63) >> 6;
  v36 = a2;
  result = swift_bridgeObjectRetain();
  v20 = 0;
  v21 = 0;
  while (1)
  {
    if (v17)
    {
      v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v23 = v22 | (v21 << 6);
      goto LABEL_5;
    }
    if (__OFADD__(v21++, 1))
      goto LABEL_19;
    if (v21 >= v18)
    {
LABEL_17:
      swift_release();
      return sub_23D66C8F4();
    }
    v32 = *(_QWORD *)(v14 + 8 * v21);
    if (!v32)
      break;
LABEL_16:
    v17 = (v32 - 1) & v32;
    v23 = __clz(__rbit64(v32)) + (v21 << 6);
LABEL_5:
    sub_23D65F6D0(*(_QWORD *)(v36 + 48) + *(_QWORD *)(v35 + 72) * v23, (uint64_t)v9);
    sub_23D65F750((uint64_t)v9, (uint64_t)v7);
    sub_23D66C8E8();
    v24 = sub_23D66C234();
    v26 = v25;
    sub_23D66BDA8();
    sub_23D5DDA20(v24, v26);
    v27 = sub_23D66C234();
    v29 = v28;
    sub_23D66BDA8();
    sub_23D5DDA20(v27, v29);
    sub_23D66C900();
    v30 = sub_23D66C90C();
    result = sub_23D65F714((uint64_t)v7);
    v20 ^= v30;
  }
  v33 = v21 + 1;
  if (v21 + 1 >= v18)
    goto LABEL_17;
  v32 = *(_QWORD *)(v14 + 8 * v33);
  if (v32)
  {
    ++v21;
    goto LABEL_16;
  }
  while (1)
  {
    v21 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v21 >= v18)
      goto LABEL_17;
    v32 = *(_QWORD *)(v14 + 8 * v21);
    ++v33;
    if (v32)
      goto LABEL_16;
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_23D65EA4C()
{
  return sub_23D65EAAC(&qword_256C7C0D0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6968], (uint64_t)&protocol conformance descriptor for P256.KeyAgreement.PrivateKey);
}

uint64_t sub_23D65EA7C()
{
  return sub_23D65EAAC(&qword_256C7C0D8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDC69D0], (uint64_t)&protocol conformance descriptor for P256.Signing.PrivateKey);
}

uint64_t sub_23D65EAAC(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x242636790](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23D65EAEC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t type metadata accessor for PCSID()
{
  return objc_opt_self();
}

uint64_t sub_23D65EB24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 16)
                                                                                     + *(_QWORD *)(a6 + 16));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_23D63F7FC;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_23D65EBC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a6 + 24)
                                                                                     + *(_QWORD *)(a6 + 24));
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_23D63D3E0;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t type metadata accessor for PCSIDSet()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for SimPCSIDSet()
{
  return objc_opt_self();
}

uint64_t sub_23D65ECA4()
{
  return type metadata accessor for SimPCSBag(0);
}

uint64_t type metadata accessor for SimPCSBag(uint64_t a1)
{
  return sub_23D5F15A0(a1, qword_256C7C390);
}

uint64_t sub_23D65ECC0()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SimPCSID(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for SimPCSID(uint64_t a1)
{
  return sub_23D5F15A0(a1, qword_256C7C4B8);
}

_QWORD *sub_23D65ED4C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23D66C2AC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23D66C258();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t sub_23D65EE08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23D66C2AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23D66C258();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_23D65EE98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23D66C2AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23D66C258();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_23D65EF28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23D66C2AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23D66C258();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_23D65EFB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23D66C2AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23D66C258();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_23D65F048()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23D65F054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v14;

  v6 = sub_23D66C2AC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_23D66C258();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 2)
    return ((v14 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_23D65F10C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23D65F118(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_23D66C2AC();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_23D66C258();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  return result;
}

uint64_t sub_23D65F1BC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23D66C2AC();
  if (v1 <= 0x3F)
  {
    result = sub_23D66C258();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_23D65F248()
{
  return sub_23D65EAAC(&qword_256C7C4F8, 255, type metadata accessor for SimPCSID, (uint64_t)&unk_23D674A70);
}

uint64_t sub_23D65F278()
{
  return sub_23D65EAAC((unint64_t *)&unk_256C7C500, 255, type metadata accessor for SimPCSBag, (uint64_t)&unk_23D674AD8);
}

uint64_t sub_23D65F2A8(uint64_t a1, uint64_t a2)
{
  return sub_23D65EAAC((unint64_t *)&unk_256C7C510, a2, (uint64_t (*)(uint64_t))type metadata accessor for SimPCSIDSet, (uint64_t)&unk_23D674B50);
}

uint64_t sub_23D65F2D4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x242636790](&protocol conformance descriptor for GroupKitCryptoError<A>, v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23D65F314()
{
  unint64_t result;

  result = qword_256C7C538;
  if (!qword_256C7C538)
  {
    result = MEMORY[0x242636790](&protocol conformance descriptor for PCSError, &type metadata for PCSError);
    atomic_store(result, (unint64_t *)&qword_256C7C538);
  }
  return result;
}

uint64_t sub_23D65F358(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  uint64_t result;

  v4 = a1[2] == a2[2] && a1[3] == a2[3];
  if (v4 || (v5 = sub_23D66C84C(), result = 0, (v5 & 1) != 0))
  {
    if (a1[4] == a2[4] && a1[5] == a2[5])
      return 1;
    else
      return sub_23D66C84C();
  }
  return result;
}

uint64_t sub_23D65F3CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  char v21;

  v4 = sub_23D66C234();
  v6 = v5;
  v7 = sub_23D66C234();
  v9 = v8;
  sub_23D5E6578(v4, v6);
  v11 = v10;
  sub_23D5DDA20(v7, v9);
  sub_23D5DDA20(v4, v6);
  if ((v11 & 1) == 0)
    goto LABEL_4;
  v12 = type metadata accessor for SimPCSID(0);
  v13 = sub_23D66C234();
  v15 = v14;
  v16 = sub_23D66C234();
  v18 = v17;
  sub_23D5E6578(v13, v15);
  v20 = v19;
  sub_23D5DDA20(v16, v18);
  sub_23D5DDA20(v13, v15);
  if ((v20 & 1) != 0)
    v21 = *(_BYTE *)(a1 + *(int *)(v12 + 24)) ^ *(_BYTE *)(a2 + *(int *)(v12 + 24)) ^ 1;
  else
LABEL_4:
    v21 = 0;
  return v21 & 1;
}

uint64_t sub_23D65F4E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  char v29;
  uint64_t v31;

  v4 = type metadata accessor for SimPCSID(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v31 - v8;
  v10 = *(_QWORD *)(a1 + OBJC_IVAR____TtC14GroupKitCrypto9SimPCSBag_bag);
  v11 = *(_QWORD *)(a2 + OBJC_IVAR____TtC14GroupKitCrypto9SimPCSBag_bag);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = sub_23D655728(v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
  {
    sub_23D65F6D0(a1 + OBJC_IVAR____TtC14GroupKitCrypto9SimPCSBag_current, (uint64_t)v9);
    sub_23D65F6D0(a2 + OBJC_IVAR____TtC14GroupKitCrypto9SimPCSBag_current, (uint64_t)v7);
    v13 = sub_23D66C234();
    v15 = v14;
    v16 = sub_23D66C234();
    v18 = v17;
    sub_23D5E6578(v13, v15);
    v20 = v19;
    sub_23D5DDA20(v16, v18);
    sub_23D5DDA20(v13, v15);
    if ((v20 & 1) == 0)
      goto LABEL_6;
    v21 = sub_23D66C234();
    v23 = v22;
    v24 = sub_23D66C234();
    v26 = v25;
    sub_23D5E6578(v21, v23);
    v28 = v27;
    sub_23D5DDA20(v24, v26);
    sub_23D5DDA20(v21, v23);
    if ((v28 & 1) != 0)
      v29 = v9[*(int *)(v4 + 24)] ^ v7[*(int *)(v4 + 24)] ^ 1;
    else
LABEL_6:
      v29 = 0;
    sub_23D65F714((uint64_t)v7);
    sub_23D65F714((uint64_t)v9);
  }
  else
  {
    v29 = 0;
  }
  return v29 & 1;
}

uint64_t sub_23D65F6D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SimPCSID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23D65F714(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SimPCSID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23D65F750(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SimPCSID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23D65F794(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = type metadata accessor for SimPCSID(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v14 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  sub_23D65EAAC(&qword_256C7C548, 255, v10, (uint64_t)&unk_23D674A98);
  result = sub_23D66C534();
  v15 = result;
  if (v9)
  {
    v12 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v13 = *(_QWORD *)(v3 + 72);
    do
    {
      sub_23D65F6D0(v12, (uint64_t)v6);
      sub_23D659ACC((uint64_t)v8, (uint64_t)v6);
      sub_23D65F714((uint64_t)v8);
      v12 += v13;
      --v9;
    }
    while (v9);
    return v15;
  }
  return result;
}

void sub_23D65F8A0(uint64_t a1)
{
  sub_23D6583B4(a1);
}

uint64_t sub_23D65F8AC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C560);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23D65F910(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C560);
  return sub_23D65853C(a1, a2);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_23D65F978(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  unint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7[2];
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  sub_23D5F15D4();
  result = sub_23D66C534();
  v8 = result;
  if (v2)
  {
    v4 = (unint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      sub_23D5AFA60(v5, *v4);
      sub_23D65AF2C(v7, v5, v6);
      sub_23D5DDA20(v7[0], v7[1]);
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SimPCSError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SimPCSError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23D65FAEC + 4 * byte_23D6748E5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23D65FB20 + 4 * byte_23D6748E0[v4]))();
}

uint64_t sub_23D65FB20(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23D65FB28(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23D65FB30);
  return result;
}

uint64_t sub_23D65FB3C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23D65FB44);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23D65FB48(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23D65FB50(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SimPCSError()
{
  return &type metadata for SimPCSError;
}

unint64_t sub_23D65FB70()
{
  unint64_t result;

  result = qword_256C7C570;
  if (!qword_256C7C570)
  {
    result = MEMORY[0x242636790](&unk_23D674C24, &type metadata for SimPCSError);
    atomic_store(result, (unint64_t *)&qword_256C7C570);
  }
  return result;
}

uint64_t sub_23D65FBB8(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  void (*v15)(char *, char *, uint64_t);
  uint64_t AssociatedTypeWitness;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t result;
  char *v34;
  char *v35;
  char *v36;
  _QWORD v37[2];
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, char *);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v40 = a8;
  v41 = a5;
  v9 = v8;
  v53 = a4;
  v54 = a1;
  v55 = a2;
  v39 = *(_QWORD *)(a5 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v52 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v51 = (char *)v37 - v12;
  v45 = v13;
  v15 = v14;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v38 = (char *)v37 - v18;
  v19 = sub_23D66C5B8();
  v42 = *(_QWORD *)(v19 - 8);
  v43 = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v49 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v37 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v37[1] = (char *)v37 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v48 = *((_QWORD *)v15 - 1);
  MEMORY[0x24BDAC7A8](v27);
  v47 = (char *)v37 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = swift_getAssociatedTypeWitness();
  v44 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v46 = (char *)v37 - v29;
  v30 = v15;
  v31 = sub_23D66C450();
  v57 = sub_23D66C6C0();
  v53 = sub_23D66C6CC();
  sub_23D66C6A8();
  (*(void (**)(char *, _QWORD, _QWORD *))(v48 + 16))(v47, v50, v15);
  v32 = v46;
  v50 = v30;
  result = sub_23D66C444();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      sub_23D66C5C4();
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v24, 1, AssociatedTypeWitness);
      if ((_DWORD)result == 1)
        goto LABEL_18;
      v54(v24, v52);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v52, v41);
        return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      }
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      sub_23D66C6B4();
      if (!--v31)
      {
        v34 = v49;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  v34 = v49;
LABEL_9:
  sub_23D66C5C4();
  v52 = *(char **)(v17 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v34, 1, AssociatedTypeWitness) == 1)
  {
    v35 = v49;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v43);
    return v57;
  }
  else
  {
    v50 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v36 = v38;
    v35 = v49;
    while (1)
    {
      v50(v36, v35, AssociatedTypeWitness);
      v54(v36, v51);
      if (v9)
        break;
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
      sub_23D66C6B4();
      sub_23D66C5C4();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v35, 1, AssociatedTypeWitness) == 1)
        goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v51, v41);
  }
}

__n128 UserAndPublicKeyInfo.init(userID:role:keyingInfoBlob:)@<Q0>(__n128 *a1@<X0>, unsigned __int8 *a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, __n128 *a5@<X8>)
{
  unsigned __int8 v5;
  __n128 result;

  v5 = *a2;
  result = *a1;
  *a5 = *a1;
  a5[1].n128_u8[0] = v5;
  a5[1].n128_u64[1] = a3;
  a5[2].n128_u64[0] = a4;
  return result;
}

uint64_t GroupMembership.init<A>(groupMembership:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t AssociatedTypeWitness;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t AssociatedConformanceWitness;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t v47;
  os_log_type_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;

  v4 = v3;
  v54 = a3;
  v66 = type metadata accessor for GroupMembership.MemberProperties(0);
  v7 = MEMORY[0x24BDAC7A8](v66);
  v65 = (uint64_t)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v64 = (char *)&v53 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79170);
  MEMORY[0x24BDAC7A8](v10);
  v68 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79120);
  MEMORY[0x24BDAC7A8](v12);
  v67 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for UserKeyingInfo(0);
  v62 = *(_QWORD *)(v14 - 8);
  v63 = v14;
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (uint64_t *)((char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v55 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v23 = (char *)&v53 - v22;
  v73 = sub_23D5B5054(MEMORY[0x24BEE4AF8]);
  v56 = v18;
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v57 = a1;
  v24(v20, a1, a2);
  sub_23D66C444();
  v58 = a2;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v69 = v23;
  v70 = AssociatedTypeWitness;
  v61 = AssociatedConformanceWitness;
  sub_23D66C5C4();
  v72 = v76;
  if (v76 == 2)
  {
    v26 = v73;
LABEL_7:
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v57, v58);
    result = (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v69, v70);
    *v54 = v26;
  }
  else
  {
    v60 = v17;
    v27 = v74;
    v28 = v75;
    v29 = v77;
    v30 = v78;
    v59 = xmmword_23D66DF30;
    v26 = v73;
    while (1)
    {
      v79 = v26;
      v74 = v27;
      v75 = v28;
      if ((sub_23D662D30(&v74) & 1) != 0)
        break;
      v73 = v26;
      v74 = v27;
      v75 = v28;
      v31 = sub_23D66C2AC();
      v32 = (uint64_t)v67;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v67, 1, 1, v31);
      v33 = sub_23D66C258();
      v34 = (uint64_t)v68;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v68, 1, 1, v33);
      sub_23D5AFA60(v27, v28);
      sub_23D5AFA60(v29, v30);
      sub_23D61F210(&v74, v29, v30, v32, v34, v17);
      if (v4)
      {
        sub_23D662EAC(v27, v28, v72, v29, v30);
        (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v57, v58);
        (*(void (**)(char *, uint64_t))(v55 + 8))(v69, v70);
        return swift_bridgeObjectRelease();
      }
      v71 = v29;
      v35 = v66;
      v36 = v30;
      v37 = v72;
      v38 = (uint64_t)v64;
      v39 = (uint64_t)&v64[*(int *)(v66 + 24)];
      sub_23D5E7298((uint64_t)v17, v39, type metadata accessor for UserKeyingInfo);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v62 + 56))(v39, 0, 1, v63);
      v40 = *(int *)(v35 + 28);
      v4 = 0;
      v41 = v38 + v40;
      v42 = sub_23D66C330();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v41, 1, 1, v42);
      *(_BYTE *)v38 = v37 & 1;
      *(_OWORD *)(v38 + 8) = v59;
      v43 = v65;
      sub_23D5E7F64(v38, v65, type metadata accessor for GroupMembership.MemberProperties);
      sub_23D5AFA60(v27, v28);
      v44 = v73;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v74 = v44;
      sub_23D5E072C(v43, v27, v28, isUniquelyReferenced_nonNull_native);
      v26 = v74;
      swift_bridgeObjectRelease();
      sub_23D5DDA20(v27, v28);
      sub_23D662EAC(v27, v28, v37, v71, v36);
      sub_23D5E6950((uint64_t)v17, type metadata accessor for UserKeyingInfo);
      sub_23D66C5C4();
      v27 = v74;
      v28 = v75;
      v29 = v77;
      v30 = v78;
      v72 = v76;
      if (v76 == 2)
        goto LABEL_7;
    }
    swift_bridgeObjectRelease();
    if (qword_256C78B10 != -1)
      swift_once();
    v47 = sub_23D66BFDC();
    __swift_project_value_buffer(v47, (uint64_t)qword_256C88B78);
    v48 = sub_23D66C588();
    v49 = sub_23D66BFC4();
    v50 = v48;
    if (os_log_type_enabled(v49, v48))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_23D5A8000, v49, v50, "duplicated group member", v51, 2u);
      MEMORY[0x242636844](v51, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D618E34();
    swift_allocError();
    *(_WORD *)v52 = 270;
    *(_OWORD *)(v52 + 8) = xmmword_23D66DF70;
    *(_QWORD *)(v52 + 24) = 0x800000023D678430;
    *(_QWORD *)(v52 + 32) = 0xD00000000000005CLL;
    *(_QWORD *)(v52 + 40) = 0x800000023D6782C0;
    swift_willThrow();
    sub_23D662EAC(v27, v28, v72, v29, v30);
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v57, v58);
    return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v69, v70);
  }
  return result;
}

uint64_t type metadata accessor for GroupMembership.MemberProperties(uint64_t a1)
{
  return sub_23D5F15A0(a1, (uint64_t *)&unk_256C7C710);
}

uint64_t sub_23D6607A0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int isUniquelyReferenced_nonNull_native;
  char v38;
  unint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t *v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t result;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t *v55;
  char *v56;
  uint64_t v57;
  char *v58;
  unint64_t v59;
  uint64_t v60;
  _QWORD *v61;

  v52 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79178);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = type metadata accessor for GroupMembership.MemberProperties(0);
  v6 = *(_QWORD *)(v57 - 8);
  v7 = MEMORY[0x24BDAC7A8](v57);
  v60 = (uint64_t)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v52 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79998);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (uint64_t *)((char *)&v52 - v15);
  v17 = (_QWORD *)sub_23D5B5054(MEMORY[0x24BEE4AF8]);
  v18 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  v19 = 0;
  v58 = v10;
  v55 = v16;
  v56 = v14;
  v53 = v6;
  v54 = v18;
  while (1)
  {
    if (v19 == v18)
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v14, 1, 1, v20);
      v59 = v18;
    }
    else
    {
      if (v19 >= *(_QWORD *)(a1 + 16))
        goto LABEL_27;
      v21 = v5;
      v22 = a1;
      v23 = v19;
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0);
      v25 = *(_QWORD *)(v24 - 8);
      sub_23D5AEF48(v22+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(_QWORD *)(v25 + 72) * v23, (uint64_t)v14, &qword_256C799A0);
      v59 = v23 + 1;
      a1 = v22;
      v5 = v21;
      v6 = v53;
      v26 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56);
      v10 = v58;
      v26(v14, 0, 1, v24);
    }
    sub_23D5F16C4((uint64_t)v14, (uint64_t)v16, &qword_256C79998);
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 48))(v16, 1, v27) == 1)
    {
      result = swift_bridgeObjectRelease_n();
      *v52 = v17;
      return result;
    }
    v28 = v16;
    v30 = *v16;
    v29 = v16[1];
    sub_23D5E7F64((uint64_t)v28 + *(int *)(v27 + 48), (uint64_t)v10, type metadata accessor for GroupMembership.MemberProperties);
    if (v17[2])
    {
      swift_bridgeObjectRetain();
      sub_23D5AFA60(v30, v29);
      v31 = sub_23D5DF32C(v30, v29);
      if ((v32 & 1) != 0)
      {
        sub_23D5E7298(v17[7] + *(_QWORD *)(v6 + 72) * v31, (uint64_t)v5, type metadata accessor for GroupMembership.MemberProperties);
        v33 = 0;
      }
      else
      {
        v33 = 1;
      }
      v34 = v57;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v5, v33, 1, v57);
      sub_23D5DDA20(v30, v29);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v5, 1, v34) != 1)
      {
        sub_23D5AEF8C((uint64_t)v5, &qword_256C79178);
        swift_bridgeObjectRelease_n();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
        sub_23D618E34();
        swift_allocError();
        *(_WORD *)v51 = 270;
        *(_OWORD *)(v51 + 8) = xmmword_23D674C90;
        *(_QWORD *)(v51 + 24) = 0x800000023D678430;
        *(_QWORD *)(v51 + 32) = 0xD00000000000005CLL;
        *(_QWORD *)(v51 + 40) = 0x800000023D6782C0;
        swift_willThrow();
        sub_23D5DDA20(v30, v29);
        swift_bridgeObjectRelease();
        sub_23D5E6950((uint64_t)v10, type metadata accessor for GroupMembership.MemberProperties);
        return swift_bridgeObjectRelease();
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v5, 1, 1, v57);
      swift_bridgeObjectRetain();
    }
    v35 = v6;
    v36 = a1;
    sub_23D5AEF8C((uint64_t)v5, &qword_256C79178);
    swift_bridgeObjectRelease();
    sub_23D5E7298((uint64_t)v10, v60, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D5AFA60(v30, v29);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v61 = v17;
    v39 = sub_23D5DF32C(v30, v29);
    v40 = v17[2];
    v41 = (v38 & 1) == 0;
    v42 = v40 + v41;
    if (__OFADD__(v40, v41))
      break;
    v43 = v38;
    if (v17[3] >= v42)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_23D6672B0(type metadata accessor for GroupMembership.MemberProperties, &qword_256C79AF8);
    }
    else
    {
      sub_23D6654BC(v42, isUniquelyReferenced_nonNull_native, type metadata accessor for GroupMembership.MemberProperties, &qword_256C79AF8);
      v44 = sub_23D5DF32C(v30, v29);
      if ((v43 & 1) != (v45 & 1))
        goto LABEL_29;
      v39 = v44;
    }
    v10 = v58;
    v17 = v61;
    if ((v43 & 1) != 0)
    {
      sub_23D667034(v60, v61[7] + *(_QWORD *)(v35 + 72) * v39);
    }
    else
    {
      v61[(v39 >> 6) + 8] |= 1 << v39;
      v46 = (uint64_t *)(v17[6] + 16 * v39);
      *v46 = v30;
      v46[1] = v29;
      sub_23D5E7F64(v60, v17[7] + *(_QWORD *)(v35 + 72) * v39, type metadata accessor for GroupMembership.MemberProperties);
      v47 = v17[2];
      v48 = __OFADD__(v47, 1);
      v49 = v47 + 1;
      if (v48)
        goto LABEL_28;
      v17[2] = v49;
      sub_23D5AFA60(v30, v29);
    }
    swift_bridgeObjectRelease();
    sub_23D5DDA20(v30, v29);
    sub_23D5DDA20(v30, v29);
    sub_23D5E6950((uint64_t)v10, type metadata accessor for GroupMembership.MemberProperties);
    a1 = v36;
    v6 = v35;
    v16 = v55;
    v14 = v56;
    v18 = v54;
    v19 = v59;
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  result = sub_23D66C894();
  __break(1u);
  return result;
}

uint64_t sub_23D660D88@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
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
  uint64_t *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  int isUniquelyReferenced_nonNull_native;
  char v43;
  unint64_t v44;
  uint64_t v45;
  _BOOL8 v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  char v50;
  uint64_t *v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  uint64_t result;
  uint64_t v56;
  int64_t v57;
  _QWORD *v58;
  uint64_t v59;
  int64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  int64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;

  v58 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79178);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = type metadata accessor for GroupMembership.MemberProperties(0);
  v6 = *(_QWORD *)(v63 - 8);
  v7 = MEMORY[0x24BDAC7A8](v63);
  v67 = (uint64_t)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v57 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79998);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (int64_t *)((char *)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v12);
  v64 = (int64_t *)((char *)&v57 - v15);
  v16 = (_QWORD *)sub_23D5B5054(MEMORY[0x24BEE4AF8]);
  v17 = *(_QWORD *)(a1 + 64);
  v59 = a1 + 64;
  v18 = 1 << *(_BYTE *)(a1 + 32);
  v19 = -1;
  if (v18 < 64)
    v19 = ~(-1 << v18);
  v20 = v19 & v17;
  v60 = (unint64_t)(v18 + 63) >> 6;
  v61 = a1;
  v57 = v60 - 1;
  swift_bridgeObjectRetain();
  v65 = 0;
  v62 = v14;
  while (1)
  {
    if (v20)
    {
      v66 = (v20 - 1) & v20;
      v21 = __clz(__rbit64(v20)) | (v65 << 6);
LABEL_8:
      v22 = (uint64_t *)(*(_QWORD *)(v61 + 48) + 16 * v21);
      v23 = *v22;
      v24 = v22[1];
      v25 = *(_QWORD *)(v61 + 56) + *(_QWORD *)(v6 + 72) * v21;
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0);
      sub_23D5E7298(v25, (uint64_t)v14 + *(int *)(v26 + 48), type metadata accessor for GroupMembership.MemberProperties);
      *v14 = v23;
      v14[1] = v24;
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v14, 0, 1, v26);
      sub_23D5AFA60(v23, v24);
      v27 = v64;
      goto LABEL_30;
    }
    v28 = v65 + 1;
    if (__OFADD__(v65, 1))
      goto LABEL_52;
    v27 = v64;
    if (v28 < v60)
    {
      v29 = *(_QWORD *)(v59 + 8 * v28);
      if (v29)
        goto LABEL_12;
      v30 = v65 + 2;
      ++v65;
      if (v28 + 1 < v60)
      {
        v29 = *(_QWORD *)(v59 + 8 * v30);
        if (v29)
          goto LABEL_15;
        v65 = v28 + 1;
        if (v28 + 2 < v60)
        {
          v29 = *(_QWORD *)(v59 + 8 * (v28 + 2));
          if (v29)
          {
            v28 += 2;
            goto LABEL_12;
          }
          v65 = v28 + 2;
          if (v28 + 3 < v60)
          {
            v29 = *(_QWORD *)(v59 + 8 * (v28 + 3));
            if (v29)
            {
              v28 += 3;
              goto LABEL_12;
            }
            v30 = v28 + 4;
            v65 = v28 + 3;
            if (v28 + 4 < v60)
              break;
          }
        }
      }
    }
LABEL_29:
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0);
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v14, 1, 1, v31);
    v66 = 0;
LABEL_30:
    sub_23D5F16C4((uint64_t)v14, (uint64_t)v27, &qword_256C79998);
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 48))(v27, 1, v32) == 1)
    {
      swift_bridgeObjectRelease();
      result = swift_release();
      *v58 = v16;
      return result;
    }
    v33 = v27;
    v35 = *v27;
    v34 = v27[1];
    sub_23D5E7F64((uint64_t)v33 + *(int *)(v32 + 48), (uint64_t)v10, type metadata accessor for GroupMembership.MemberProperties);
    if (v16[2])
    {
      swift_bridgeObjectRetain();
      sub_23D5AFA60(v35, v34);
      v36 = sub_23D5DF32C(v35, v34);
      if ((v37 & 1) != 0)
      {
        sub_23D5E7298(v16[7] + *(_QWORD *)(v6 + 72) * v36, (uint64_t)v5, type metadata accessor for GroupMembership.MemberProperties);
        v38 = 0;
      }
      else
      {
        v38 = 1;
      }
      v39 = v63;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v5, v38, 1, v63);
      sub_23D5DDA20(v35, v34);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v5, 1, v39) != 1)
      {
        sub_23D5AEF8C((uint64_t)v5, &qword_256C79178);
        swift_bridgeObjectRelease_n();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
        sub_23D618E34();
        swift_allocError();
        *(_WORD *)v56 = 270;
        *(_OWORD *)(v56 + 8) = xmmword_23D674C90;
        *(_QWORD *)(v56 + 24) = 0x800000023D678430;
        *(_QWORD *)(v56 + 32) = 0xD00000000000005CLL;
        *(_QWORD *)(v56 + 40) = 0x800000023D6782C0;
        swift_willThrow();
        sub_23D5DDA20(v35, v34);
        swift_bridgeObjectRelease();
        sub_23D5E6950((uint64_t)v10, type metadata accessor for GroupMembership.MemberProperties);
        return swift_release();
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v5, 1, 1, v63);
      swift_bridgeObjectRetain();
    }
    v40 = v5;
    sub_23D5AEF8C((uint64_t)v5, &qword_256C79178);
    swift_bridgeObjectRelease();
    v41 = (uint64_t)v10;
    sub_23D5E7298((uint64_t)v10, v67, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D5AFA60(v35, v34);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v68 = v16;
    v44 = sub_23D5DF32C(v35, v34);
    v45 = v16[2];
    v46 = (v43 & 1) == 0;
    v47 = v45 + v46;
    if (__OFADD__(v45, v46))
    {
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    v48 = v43;
    if (v16[3] >= v47)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v16 = v68;
        if ((v43 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_23D6672B0(type metadata accessor for GroupMembership.MemberProperties, &qword_256C79AF8);
        v16 = v68;
        if ((v48 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_23D6654BC(v47, isUniquelyReferenced_nonNull_native, type metadata accessor for GroupMembership.MemberProperties, &qword_256C79AF8);
      v49 = sub_23D5DF32C(v35, v34);
      if ((v48 & 1) != (v50 & 1))
        goto LABEL_54;
      v44 = v49;
      v16 = v68;
      if ((v48 & 1) != 0)
      {
LABEL_4:
        sub_23D667034(v67, v16[7] + *(_QWORD *)(v6 + 72) * v44);
        goto LABEL_5;
      }
    }
    v16[(v44 >> 6) + 8] |= 1 << v44;
    v51 = (uint64_t *)(v16[6] + 16 * v44);
    *v51 = v35;
    v51[1] = v34;
    sub_23D5E7F64(v67, v16[7] + *(_QWORD *)(v6 + 72) * v44, type metadata accessor for GroupMembership.MemberProperties);
    v52 = v16[2];
    v53 = __OFADD__(v52, 1);
    v54 = v52 + 1;
    if (v53)
      goto LABEL_51;
    v16[2] = v54;
    sub_23D5AFA60(v35, v34);
LABEL_5:
    swift_bridgeObjectRelease();
    sub_23D5DDA20(v35, v34);
    sub_23D5DDA20(v35, v34);
    v10 = (char *)v41;
    sub_23D5E6950(v41, type metadata accessor for GroupMembership.MemberProperties);
    v5 = v40;
    v14 = v62;
    v20 = v66;
  }
  v29 = *(_QWORD *)(v59 + 8 * v30);
  if (v29)
  {
LABEL_15:
    v28 = v30;
LABEL_12:
    v65 = v28;
    v66 = (v29 - 1) & v29;
    v21 = __clz(__rbit64(v29)) + (v28 << 6);
    goto LABEL_8;
  }
  while (1)
  {
    v28 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v28 >= v60)
    {
      v65 = v57;
      goto LABEL_29;
    }
    v29 = *(_QWORD *)(v59 + 8 * v28);
    ++v30;
    if (v29)
      goto LABEL_12;
  }
LABEL_53:
  __break(1u);
LABEL_54:
  result = sub_23D66C894();
  __break(1u);
  return result;
}

uint64_t GroupMembership.removeUsers<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t AssociatedConformanceWitness;
  char *v19;
  unint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  char v27;
  char v28;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, _QWORD, uint64_t, uint64_t);
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79178);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v44 = (uint64_t)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v39 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v14 = (char *)v36 - v13;
  v15 = *v3;
  v45 = *v3;
  v40 = a1;
  v41 = a3;
  v16 = v47;
  result = sub_23D6639C8(a1, a2);
  if (!v16)
  {
    v43 = v3;
    v37 = v12;
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v39, v40, a2);
    swift_bridgeObjectRetain();
    sub_23D66C444();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v19 = v14;
    sub_23D66C5C4();
    v20 = v46;
    v36[1] = 0;
    if (v46 >> 60 == 15)
    {
      v21 = v43;
    }
    else
    {
      v22 = v44;
      v23 = v45;
      v21 = v43;
      v42 = AssociatedTypeWitness;
      v47 = AssociatedConformanceWitness;
      do
      {
        v25 = v19;
        swift_bridgeObjectRetain();
        v26 = sub_23D5DF32C(v23, v20);
        v28 = v27;
        swift_bridgeObjectRelease();
        if ((v28 & 1) != 0)
        {
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v45 = v15;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_23D6672B0(type metadata accessor for GroupMembership.MemberProperties, &qword_256C79AF8);
            v15 = v45;
          }
          sub_23D5DDA20(*(_QWORD *)(*(_QWORD *)(v15 + 48) + 16 * v26), *(_QWORD *)(*(_QWORD *)(v15 + 48) + 16 * v26 + 8));
          v30 = *(_QWORD *)(v15 + 56);
          v31 = type metadata accessor for GroupMembership.MemberProperties(0);
          v32 = *(_QWORD *)(v31 - 8);
          v33 = v30 + *(_QWORD *)(v32 + 72) * v26;
          v34 = v44;
          sub_23D5E7F64(v33, v44, type metadata accessor for GroupMembership.MemberProperties);
          sub_23D66663C(v26, v15, type metadata accessor for GroupMembership.MemberProperties);
          swift_bridgeObjectRelease();
          v35 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v32 + 56);
          v22 = v34;
          v35(v34, 0, 1, v31);
          AssociatedTypeWitness = v42;
          v21 = v43;
        }
        else
        {
          v24 = type metadata accessor for GroupMembership.MemberProperties(0);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v22, 1, 1, v24);
        }
        sub_23D5AEF8C(v22, &qword_256C79178);
        sub_23D63D24C(v23, v20);
        v19 = v25;
        sub_23D66C5C4();
        v23 = v45;
        v20 = v46;
      }
      while (v46 >> 60 != 15);
    }
    (*(void (**)(char *, uint64_t))(v37 + 8))(v19, AssociatedTypeWitness);
    result = swift_bridgeObjectRelease();
    *v21 = v15;
  }
  return result;
}

uint64_t GroupMembership.changeUserRoles<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD **v3;
  uint64_t v4;
  _QWORD **v5;
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
  uint64_t AssociatedTypeWitness;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t result;
  uint64_t AssociatedConformanceWitness;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  char v34;
  uint64_t v35;
  int v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  int isUniquelyReferenced_nonNull_native;
  char v45;
  unint64_t v46;
  uint64_t v47;
  _BOOL8 v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  char v52;
  _QWORD **v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t *v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  _QWORD v60[2];
  _QWORD **v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  unint64_t v73;
  unsigned __int8 v74;
  uint64_t v75;

  v5 = v3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79178);
  MEMORY[0x24BDAC7A8](v9);
  v67 = (uint64_t)v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = type metadata accessor for GroupMembership.MemberProperties(0);
  v70 = *(_QWORD *)(v68 - 8);
  v11 = MEMORY[0x24BDAC7A8](v68);
  v71 = (uint64_t)v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v66 = (char *)v60 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v69 = (uint64_t)v60 - v16;
  v64 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v20 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v22 = (char *)v60 - v21;
  v65 = (char *)a3;
  v75 = a1;
  v24 = sub_23D65FBB8((void (*)(char *, char *))sub_23D662EE8, 0, a2, (uint64_t)&type metadata for GroupKitUserID, MEMORY[0x24BEE4078], a3, MEMORY[0x24BEE40A8], v23);
  v25 = *v5;
  swift_bridgeObjectRetain();
  sub_23D663370(v24, (uint64_t)v25);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (v4)
    return result;
  v60[1] = 0;
  v63 = v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v18, v75, a2);
  swift_bridgeObjectRetain();
  sub_23D66C444();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v65 = v22;
  v62 = AssociatedConformanceWitness;
  sub_23D66C5C4();
  v64 = AssociatedTypeWitness;
  if (v74 == 2)
  {
    v28 = v63;
LABEL_4:
    (*(void (**)(char *, uint64_t))(v28 + 8))(v65, v64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *v5 = v25;
    return swift_bridgeObjectRelease();
  }
  LODWORD(v75) = v74;
  v29 = (uint64_t)v72;
  v30 = v73;
  v31 = v69;
  v32 = v70;
  v61 = v5;
  while (v25[2])
  {
    sub_23D5AFA60(v29, v30);
    v35 = sub_23D5DF32C(v29, v30);
    v36 = v75;
    if ((v37 & 1) != 0)
    {
      v38 = v67;
      sub_23D5E7298(v25[7] + *(_QWORD *)(v32 + 72) * v35, v67, type metadata accessor for GroupMembership.MemberProperties);
      v39 = 0;
    }
    else
    {
      v39 = 1;
      v38 = v67;
    }
    v40 = v68;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56))(v38, v39, 1, v68);
    sub_23D66700C(v29, v30, v36);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v32 + 48))(v38, 1, v40) == 1)
      goto LABEL_27;
    v32 = v36 & 1;
    sub_23D5E7F64(v38, v31, type metadata accessor for GroupMembership.MemberProperties);
    LODWORD(v75) = v36;
    v41 = *(_QWORD *)(v31 + 8);
    v42 = *(_QWORD *)(v31 + 16);
    v43 = (uint64_t)v66;
    sub_23D5AEF48(v31 + *(int *)(v40 + 24), (uint64_t)&v66[*(int *)(v40 + 24)], &qword_256C79990);
    sub_23D5AEF48(v31 + *(int *)(v40 + 28), v43 + *(int *)(v40 + 28), &qword_256C799E0);
    *(_BYTE *)v43 = v32;
    *(_QWORD *)(v43 + 8) = v41;
    *(_QWORD *)(v43 + 16) = v42;
    sub_23D5E7F64(v43, v71, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D667020(v29, v30, v75);
    sub_23D5E7284(v41, v42);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v72 = v25;
    v46 = sub_23D5DF32C(v29, v30);
    v47 = v25[2];
    v48 = (v45 & 1) == 0;
    v49 = v47 + v48;
    if (__OFADD__(v47, v48))
    {
      __break(1u);
LABEL_25:
      __break(1u);
      break;
    }
    v50 = v45;
    if (v25[3] >= v49)
    {
      v54 = v71;
      v28 = v63;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_23D6672B0(type metadata accessor for GroupMembership.MemberProperties, &qword_256C79AF8);
        v54 = v71;
      }
      v53 = v61;
      v55 = v72;
      if ((v50 & 1) != 0)
        goto LABEL_7;
    }
    else
    {
      sub_23D6654BC(v49, isUniquelyReferenced_nonNull_native, type metadata accessor for GroupMembership.MemberProperties, &qword_256C79AF8);
      v51 = sub_23D5DF32C(v29, v30);
      v28 = v63;
      if ((v50 & 1) != (v52 & 1))
        goto LABEL_28;
      v46 = v51;
      v53 = v61;
      v54 = v71;
      v55 = v72;
      if ((v50 & 1) != 0)
      {
LABEL_7:
        v33 = v55;
        v32 = v70;
        sub_23D667034(v54, v55[7] + *(_QWORD *)(v70 + 72) * v46);
        goto LABEL_8;
      }
    }
    v55[(v46 >> 6) + 8] |= 1 << v46;
    v56 = (uint64_t *)(v55[6] + 16 * v46);
    *v56 = v29;
    v56[1] = v30;
    v32 = v70;
    sub_23D5E7F64(v54, v55[7] + *(_QWORD *)(v70 + 72) * v46, type metadata accessor for GroupMembership.MemberProperties);
    v57 = v55[2];
    v58 = __OFADD__(v57, 1);
    v59 = v57 + 1;
    if (v58)
      goto LABEL_25;
    v33 = v55;
    v55[2] = v59;
    sub_23D5AFA60(v29, v30);
LABEL_8:
    swift_bridgeObjectRelease();
    v34 = v75;
    sub_23D66700C(v29, v30, v75);
    sub_23D66700C(v29, v30, v34);
    v31 = v69;
    sub_23D5E6950(v69, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D66C5C4();
    v29 = (uint64_t)v72;
    v30 = v73;
    LODWORD(v75) = v74;
    v25 = v33;
    v5 = v53;
    if (v74 == 2)
      goto LABEL_4;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56))(v67, 1, 1, v68);
LABEL_27:
  __break(1u);
LABEL_28:
  result = sub_23D66C894();
  __break(1u);
  return result;
}

uint64_t GroupMembership.validMembershipRolesForGroup(memberID:)(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  os_log_type_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  os_log_type_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[2];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v3 = type metadata accessor for GroupMembership.MemberProperties(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v38 - v8;
  v11 = *a1;
  v10 = a1[1];
  v12 = *v1;
  result = sub_23D663D60(v12);
  if ((result & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D618E34();
    swift_allocError();
    *(_WORD *)v26 = 268;
    *(_OWORD *)(v26 + 8) = xmmword_23D66E350;
    *(_QWORD *)(v26 + 24) = 0x800000023D678290;
    *(_QWORD *)(v26 + 32) = 0xD00000000000005CLL;
    *(_QWORD *)(v26 + 40) = 0x800000023D6782C0;
    return swift_willThrow();
  }
  if (v10 >> 60 != 15)
  {
    v14 = *(_QWORD *)(v12 + 16);
    sub_23D5AFA60(v11, v10);
    if (v14 && (v15 = sub_23D5DF32C(v11, v10), (v16 & 1) != 0))
    {
      sub_23D5E7298(*(_QWORD *)(v12 + 56) + *(_QWORD *)(v4 + 72) * v15, (uint64_t)v7, type metadata accessor for GroupMembership.MemberProperties);
      sub_23D5E7F64((uint64_t)v7, (uint64_t)v9, type metadata accessor for GroupMembership.MemberProperties);
      if (*v9 == 1)
      {
        if (qword_256C78B10 != -1)
          swift_once();
        v17 = sub_23D66BFDC();
        __swift_project_value_buffer(v17, (uint64_t)qword_256C88B78);
        v18 = sub_23D66C588();
        sub_23D5E7284(v11, v10);
        sub_23D5AFA60(v11, v10);
        v19 = sub_23D66BFC4();
        v20 = v18;
        if (os_log_type_enabled(v19, v18))
        {
          v21 = (uint8_t *)swift_slowAlloc();
          v39 = swift_slowAlloc();
          v41 = v39;
          *(_DWORD *)v21 = 136315138;
          v38[1] = v21 + 4;
          sub_23D5AFA60(v11, v10);
          v22 = sub_23D66BD30();
          v24 = v23;
          sub_23D63D24C(v11, v10);
          v40 = sub_23D5DDBDC(v22, v24, &v41);
          sub_23D66C5D0();
          swift_bridgeObjectRelease();
          sub_23D63D24C(v11, v10);
          sub_23D63D24C(v11, v10);
          _os_log_impl(&dword_23D5A8000, v19, v20, "member %s is not an administrator in a group", v21, 0xCu);
          v25 = v39;
          swift_arrayDestroy();
          MEMORY[0x242636844](v25, -1, -1);
          MEMORY[0x242636844](v21, -1, -1);
        }
        else
        {
          sub_23D63D24C(v11, v10);
          sub_23D63D24C(v11, v10);
        }

        __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
        sub_23D618E34();
        swift_allocError();
        *(_WORD *)v37 = 376;
        *(_OWORD *)(v37 + 8) = xmmword_23D674CA0;
        *(_QWORD *)(v37 + 24) = 0x800000023D678290;
        *(_QWORD *)(v37 + 32) = 0xD00000000000005CLL;
        *(_QWORD *)(v37 + 40) = 0x800000023D6782C0;
        swift_willThrow();
        sub_23D63D24C(v11, v10);
        return sub_23D5E6950((uint64_t)v9, type metadata accessor for GroupMembership.MemberProperties);
      }
      sub_23D5E6950((uint64_t)v9, type metadata accessor for GroupMembership.MemberProperties);
    }
    else
    {
      if (qword_256C78B10 != -1)
        swift_once();
      v27 = sub_23D66BFDC();
      __swift_project_value_buffer(v27, (uint64_t)qword_256C88B78);
      v28 = sub_23D66C588();
      sub_23D5E7284(v11, v10);
      sub_23D5AFA60(v11, v10);
      v29 = sub_23D66BFC4();
      v30 = v28;
      if (os_log_type_enabled(v29, v28))
      {
        v31 = (uint8_t *)swift_slowAlloc();
        v32 = swift_slowAlloc();
        v41 = v32;
        *(_DWORD *)v31 = 136315138;
        v39 = (uint64_t)(v31 + 4);
        sub_23D5AFA60(v11, v10);
        v33 = sub_23D66BD30();
        v35 = v34;
        sub_23D63D24C(v11, v10);
        v40 = sub_23D5DDBDC(v33, v35, &v41);
        sub_23D66C5D0();
        swift_bridgeObjectRelease();
        sub_23D63D24C(v11, v10);
        sub_23D63D24C(v11, v10);
        _os_log_impl(&dword_23D5A8000, v29, v30, "member %s is not in the group", v31, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242636844](v32, -1, -1);
        MEMORY[0x242636844](v31, -1, -1);
      }
      else
      {
        sub_23D63D24C(v11, v10);
        sub_23D63D24C(v11, v10);
      }

      __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
      sub_23D618E34();
      swift_allocError();
      *(_WORD *)v36 = 377;
      *(_OWORD *)(v36 + 8) = xmmword_23D674CB0;
      *(_QWORD *)(v36 + 24) = 0x800000023D678290;
      *(_QWORD *)(v36 + 32) = 0xD00000000000005CLL;
      *(_QWORD *)(v36 + 40) = 0x800000023D6782C0;
      swift_willThrow();
    }
    return sub_23D63D24C(v11, v10);
  }
  return result;
}

uint64_t GroupMembership.addUsers<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t **v3;
  uint64_t v4;
  uint8_t **v5;
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
  char *v25;
  uint64_t AssociatedTypeWitness;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t result;
  _QWORD *v34;
  uint64_t AssociatedConformanceWitness;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t, uint64_t, uint64_t);
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
  uint64_t *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  char v67;
  unint64_t v68;
  uint64_t v69;
  _BOOL8 v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  BOOL v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t *v83;
  char *v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100[3];
  uint64_t v101;

  v5 = v3;
  v93 = type metadata accessor for GroupMembership.MemberProperties(0);
  v91 = *(_QWORD *)(v93 - 8);
  v9 = MEMORY[0x24BDAC7A8](v93);
  v99 = (uint64_t)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v92 = (char *)&v81 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79170);
  MEMORY[0x24BDAC7A8](v12);
  v85 = (char *)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79120);
  MEMORY[0x24BDAC7A8](v14);
  v84 = (char *)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79990);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v83 = (uint64_t *)((char *)&v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v17);
  v97 = (uint64_t)&v81 - v19;
  v101 = type metadata accessor for UserAndAllInfo(0);
  v88 = *(_QWORD *)(v101 - 8);
  MEMORY[0x24BDAC7A8](v101);
  v96 = (uint64_t)&v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C578);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v94 = (char *)&v81 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v81 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v27 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v29 = (char *)&v81 - v28;
  v98 = (_QWORD *)a3;
  v89 = a1;
  v31 = sub_23D65FBB8((void (*)(char *, char *))sub_23D662EE8, 0, a2, (uint64_t)&type metadata for GroupKitUserID, MEMORY[0x24BEE4078], a3, MEMORY[0x24BEE40A8], v30);
  v32 = *v5;
  swift_bridgeObjectRetain();
  sub_23D662F18(v31, v32);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v95 = v4;
  if (!v4)
  {
    v90 = v27;
    v81 = (uint64_t *)v5;
    v34 = (_QWORD *)sub_23D5B5054(MEMORY[0x24BEE4AF8]);
    (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v25, v89, a2);
    sub_23D66C444();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v36 = (uint64_t)v94;
    v37 = v29;
    v89 = AssociatedConformanceWitness;
    sub_23D66C5C4();
    v88 = *(_QWORD *)(v88 + 48);
    v38 = AssociatedTypeWitness;
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v88)(v36, 1, v101) == 1)
    {
      v39 = v90;
LABEL_4:
      (*(void (**)(char *, uint64_t))(v39 + 8))(v37, v38);
      swift_bridgeObjectRetain();
      v40 = v81;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v100[0] = *v40;
      *v40 = 0x8000000000000000;
      v42 = v95;
      sub_23D667760((uint64_t)v34, (uint64_t)sub_23D6676F0, 0, isUniquelyReferenced_nonNull_native, (uint64_t)v100);
      if (!v42)
      {
        *v40 = v100[0];
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
    }
    else
    {
      v44 = v96;
      v43 = v97;
      v86 = v29;
      v87 = v38;
      while (1)
      {
        v98 = v34;
        sub_23D5E7F64(v36, v44, type metadata accessor for UserAndAllInfo);
        v46 = type metadata accessor for UserKeyingInfo(0);
        v47 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56);
        v47(v43, 1, 1, v46);
        v48 = *(_QWORD *)(v44 + 48);
        if (v48 >> 60 == 15)
        {
          v49 = v43;
          v50 = (uint64_t)v92;
        }
        else
        {
          v51 = *(_QWORD *)(v44 + 40);
          v52 = *(_QWORD *)v44;
          v53 = *(_QWORD *)(v44 + 8);
          v100[0] = v52;
          v100[1] = v53;
          v54 = sub_23D66C2AC();
          v55 = (uint64_t)v84;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))(v84, 1, 1, v54);
          v56 = sub_23D66C258();
          v57 = (uint64_t)v85;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v85, 1, 1, v56);
          sub_23D5E7284(v51, v48);
          sub_23D5AFA60(v52, v53);
          v58 = v83;
          v59 = v95;
          sub_23D61F210(v100, v51, v48, v55, v57, v83);
          v95 = v59;
          if (v59)
          {
            sub_23D5AEF8C(v97, &qword_256C79990);
            sub_23D5E6950(v96, type metadata accessor for UserAndAllInfo);
            (*(void (**)(char *, uint64_t))(v90 + 8))(v86, v87);
            return swift_bridgeObjectRelease();
          }
          v49 = v97;
          sub_23D5AEF8C(v97, &qword_256C79990);
          v47((uint64_t)v58, 0, 1, v46);
          sub_23D5F16C4((uint64_t)v58, v49, &qword_256C79990);
          v50 = (uint64_t)v92;
          v44 = v96;
        }
        v60 = *(_QWORD *)(v44 + 8);
        v40 = (uint64_t *)*(unsigned __int8 *)(v44 + 16);
        v61 = *(_QWORD *)(v44 + 24);
        v62 = *(_QWORD *)(v44 + 32);
        v63 = v93;
        v64 = *(_QWORD *)v44;
        sub_23D5AEF48(v49, v50 + *(int *)(v93 + 24), &qword_256C79990);
        sub_23D5AEF48(v44 + *(int *)(v101 + 32), v50 + *(int *)(v63 + 28), &qword_256C799E0);
        *(_BYTE *)v50 = (_BYTE)v40;
        *(_QWORD *)(v50 + 8) = v61;
        *(_QWORD *)(v50 + 16) = v62;
        sub_23D5E7F64(v50, v99, type metadata accessor for GroupMembership.MemberProperties);
        sub_23D5AFA60(v64, v60);
        sub_23D5E7284(v61, v62);
        v65 = (uint64_t)v98;
        v66 = swift_isUniquelyReferenced_nonNull_native();
        v100[0] = v65;
        v68 = sub_23D5DF32C(v64, v60);
        v69 = *(_QWORD *)(v65 + 16);
        v70 = (v67 & 1) == 0;
        v71 = v69 + v70;
        if (__OFADD__(v69, v70))
          break;
        v72 = v67;
        if (*(_QWORD *)(v65 + 24) >= v71)
        {
          v40 = &qword_256C79990;
          if ((v66 & 1) == 0)
            sub_23D6672B0(type metadata accessor for GroupMembership.MemberProperties, &qword_256C79AF8);
        }
        else
        {
          sub_23D6654BC(v71, v66, type metadata accessor for GroupMembership.MemberProperties, &qword_256C79AF8);
          v73 = sub_23D5DF32C(v64, v60);
          v40 = &qword_256C79990;
          if ((v72 & 1) != (v74 & 1))
            goto LABEL_25;
          v68 = v73;
        }
        v75 = v91;
        v76 = v99;
        v34 = (_QWORD *)v100[0];
        if ((v72 & 1) != 0)
        {
          sub_23D667034(v99, *(_QWORD *)(v100[0] + 56) + *(_QWORD *)(v91 + 72) * v68);
        }
        else
        {
          *(_QWORD *)(v100[0] + 8 * (v68 >> 6) + 64) |= 1 << v68;
          v77 = (uint64_t *)(v34[6] + 16 * v68);
          *v77 = v64;
          v77[1] = v60;
          sub_23D5E7F64(v76, v34[7] + *(_QWORD *)(v75 + 72) * v68, type metadata accessor for GroupMembership.MemberProperties);
          v78 = v34[2];
          v79 = __OFADD__(v78, 1);
          v80 = v78 + 1;
          if (v79)
            goto LABEL_24;
          v34[2] = v80;
          sub_23D5AFA60(v64, v60);
        }
        swift_bridgeObjectRelease();
        sub_23D5DDA20(v64, v60);
        v43 = v97;
        sub_23D5AEF8C(v97, &qword_256C79990);
        v44 = v96;
        sub_23D5E6950(v96, type metadata accessor for UserAndAllInfo);
        v36 = (uint64_t)v94;
        v37 = v86;
        v38 = v87;
        sub_23D66C5C4();
        v45 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v88)(v36, 1, v101);
        v39 = v90;
        if (v45 == 1)
          goto LABEL_4;
      }
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      sub_23D66C894();
      __break(1u);
    }
    *v40 = v100[0];
    result = swift_bridgeObjectRelease();
    __break(1u);
  }
  return result;
}

GroupKitCrypto::GroupMembership __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> GroupMembership.administratorMembership()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  v2 = swift_bridgeObjectRetain();
  v3 = sub_23D667B40(v2);
  swift_bridgeObjectRelease();
  return (GroupKitCrypto::GroupMembership)sub_23D660D88(v3, v1);
}

uint64_t UserAndPublicKeyInfo.userID.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_23D5AFA60(v2, v3);
}

void UserAndPublicKeyInfo.role.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

uint64_t UserAndPublicKeyInfo.keyingInfoBlob.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  sub_23D5AFA60(v1, *(_QWORD *)(v0 + 32));
  return v1;
}

uint64_t GroupMembership.roles.getter()
{
  uint64_t *v0;

  return sub_23D668348(*v0);
}

uint64_t sub_23D662D30(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79178);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v1;
  if (!*(_QWORD *)(v6 + 16))
  {
    v15 = type metadata accessor for GroupMembership.MemberProperties(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v5, 1, 1, v15);
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  v7 = *a1;
  v8 = a1[1];
  sub_23D5AFA60(v7, v8);
  v9 = sub_23D5DF32C(v7, v8);
  if ((v10 & 1) != 0)
  {
    v11 = v9;
    v12 = *(_QWORD *)(v6 + 56);
    v13 = type metadata accessor for GroupMembership.MemberProperties(0);
    v14 = *(_QWORD *)(v13 - 8);
    sub_23D5E7298(v12 + *(_QWORD *)(v14 + 72) * v11, (uint64_t)v5, type metadata accessor for GroupMembership.MemberProperties);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  }
  else
  {
    v13 = type metadata accessor for GroupMembership.MemberProperties(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v5, 1, 1, v13);
  }
  sub_23D5DDA20(v7, v8);
  type metadata accessor for GroupMembership.MemberProperties(0);
  v16 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v5, 1, v13) == 1)
    goto LABEL_7;
LABEL_8:
  sub_23D5AEF8C((uint64_t)v5, &qword_256C79178);
  return v16;
}

uint64_t sub_23D662EAC(uint64_t result, unint64_t a2, char a3, uint64_t a4, unint64_t a5)
{
  if (a3 != 2)
  {
    sub_23D5DDA20(result, a2);
    return sub_23D5DDA20(a4, a5);
  }
  return result;
}

uint64_t sub_23D662EE8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2;
  uint64_t v3;

  v3 = *a1;
  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return sub_23D5AFA60(v3, v2);
}

uint64_t sub_23D662F18(uint64_t a1, uint8_t *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, _QWORD, uint64_t, uint64_t);
  int v25;
  uint64_t v26;
  os_log_type_t v27;
  NSObject *v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD v35[2];
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79178);
  result = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    return result;
  v35[0] = v2;
  swift_bridgeObjectRetain();
  v35[1] = a1;
  v36 = a2;
  v10 = (unint64_t *)(a1 + 40);
  while (1)
  {
    v12 = *(v10 - 1);
    v13 = *v10;
    if (*((_QWORD *)a2 + 2))
      break;
    v11 = type metadata accessor for GroupMembership.MemberProperties(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
    sub_23D5AFA60(v12, v13);
LABEL_4:
    v10 += 2;
    sub_23D5AEF8C((uint64_t)v8, &qword_256C79178);
    sub_23D5DDA20(v12, v13);
    if (!--v9)
      return swift_bridgeObjectRelease();
  }
  sub_23D5AFA60(*(v10 - 1), *v10);
  sub_23D5AFA60(v12, v13);
  v14 = sub_23D5DF32C(v12, v13);
  if ((v15 & 1) != 0)
  {
    v16 = v14;
    v17 = (uint64_t)v8;
    v18 = *((_QWORD *)a2 + 7);
    v19 = type metadata accessor for GroupMembership.MemberProperties(0);
    v20 = v13;
    v21 = v12;
    v22 = *(_QWORD *)(v19 - 8);
    v23 = v18 + *(_QWORD *)(v22 + 72) * v16;
    v8 = (char *)v17;
    sub_23D5E7298(v23, v17, type metadata accessor for GroupMembership.MemberProperties);
    v24 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v22 + 56);
    v12 = v21;
    v13 = v20;
    v24(v17, 0, 1, v19);
  }
  else
  {
    v19 = type metadata accessor for GroupMembership.MemberProperties(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v8, 1, 1, v19);
  }
  sub_23D5DDA20(v12, v13);
  type metadata accessor for GroupMembership.MemberProperties(0);
  v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 48))(v8, 1, v19);
  a2 = v36;
  if (v25 == 1)
    goto LABEL_4;
  sub_23D5AEF8C((uint64_t)v8, &qword_256C79178);
  if (qword_256C78B10 != -1)
    swift_once();
  v26 = sub_23D66BFDC();
  __swift_project_value_buffer(v26, (uint64_t)qword_256C88B78);
  v27 = sub_23D66C588();
  sub_23D5AFA60(v12, v13);
  sub_23D5AFA60(v12, v13);
  v28 = sub_23D66BFC4();
  if (os_log_type_enabled(v28, v27))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    v30 = swift_slowAlloc();
    v38 = v30;
    *(_DWORD *)v29 = 136315138;
    v36 = v29 + 4;
    sub_23D5AFA60(v12, v13);
    v31 = sub_23D66BD30();
    v33 = v32;
    sub_23D5DDA20(v12, v13);
    v37 = sub_23D5DDBDC(v31, v33, &v38);
    sub_23D66C5D0();
    swift_bridgeObjectRelease();
    sub_23D5DDA20(v12, v13);
    sub_23D5DDA20(v12, v13);
    _os_log_impl(&dword_23D5A8000, v28, v27, "member %s is in the group when it should not be", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242636844](v30, -1, -1);
    MEMORY[0x242636844](v29, -1, -1);
  }
  else
  {
    sub_23D5DDA20(v12, v13);
    sub_23D5DDA20(v12, v13);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
  sub_23D618E34();
  swift_allocError();
  *(_WORD *)v34 = 271;
  *(_OWORD *)(v34 + 8) = xmmword_23D674CC0;
  *(_QWORD *)(v34 + 24) = 0x800000023D67ACF0;
  *(_QWORD *)(v34 + 32) = 0xD00000000000005CLL;
  *(_QWORD *)(v34 + 40) = 0x800000023D6782C0;
  swift_willThrow();
  sub_23D5DDA20(v12, v13);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23D663370(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79178);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    v23 = a1;
    v9 = (unint64_t *)(a1 + 40);
    v24 = a2;
    while (1)
    {
      v10 = *(v9 - 1);
      v11 = *v9;
      if (!*(_QWORD *)(a2 + 16))
        break;
      sub_23D5AFA60(*(v9 - 1), *v9);
      sub_23D5AFA60(v10, v11);
      v12 = sub_23D5DF32C(v10, v11);
      if ((v13 & 1) != 0)
      {
        v14 = v12;
        v15 = (uint64_t)v7;
        v16 = *(_QWORD *)(a2 + 56);
        v17 = type metadata accessor for GroupMembership.MemberProperties(0);
        v18 = *(_QWORD *)(v17 - 8);
        v19 = v16 + *(_QWORD *)(v18 + 72) * v14;
        v7 = (char *)v15;
        sub_23D5E7298(v19, v15, type metadata accessor for GroupMembership.MemberProperties);
        v20 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56);
        a2 = v24;
        v20(v15, 0, 1, v17);
      }
      else
      {
        v17 = type metadata accessor for GroupMembership.MemberProperties(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v7, 1, 1, v17);
      }
      sub_23D5DDA20(v10, v11);
      type metadata accessor for GroupMembership.MemberProperties(0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 48))(v7, 1, v17) == 1)
        goto LABEL_12;
      v9 += 2;
      sub_23D5AEF8C((uint64_t)v7, &qword_256C79178);
      sub_23D5DDA20(v10, v11);
      if (!--v8)
        return swift_bridgeObjectRelease();
    }
    v21 = type metadata accessor for GroupMembership.MemberProperties(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v7, 1, 1, v21);
    sub_23D5AFA60(v10, v11);
LABEL_12:
    sub_23D5AEF8C((uint64_t)v7, &qword_256C79178);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
    sub_23D618E34();
    swift_allocError();
    *(_WORD *)v22 = 269;
    *(_OWORD *)(v22 + 8) = xmmword_23D674CD0;
    *(_QWORD *)(v22 + 24) = 0x800000023D67ACD0;
    *(_QWORD *)(v22 + 32) = 0xD00000000000005CLL;
    *(_QWORD *)(v22 + 40) = 0x800000023D6782C0;
    swift_willThrow();
    sub_23D5DDA20(v10, v11);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23D6635F8(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  unint64_t v40;
  int64_t v41;

  v4 = &qword_256C79178;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79178);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 56);
  v38 = a1 + 56;
  v9 = 1 << *(_BYTE *)(a1 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & v8;
  v39 = (unint64_t)(v9 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v13 = 0;
  v37 = a2;
  if (!v11)
    goto LABEL_5;
LABEL_4:
  v14 = __clz(__rbit64(v11));
  v15 = (v11 - 1) & v11;
  for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    v20 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v21 = *v20;
    v22 = v20[1];
    if (!*(_QWORD *)(a2 + 16))
    {
      v34 = type metadata accessor for GroupMembership.MemberProperties(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v7, 1, 1, v34);
      sub_23D5AFA60(v21, v22);
LABEL_29:
      sub_23D5AEF8C((uint64_t)v7, &qword_256C79178);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
      sub_23D618E34();
      swift_allocError();
      *(_WORD *)v35 = 269;
      *(_OWORD *)(v35 + 8) = xmmword_23D674CD0;
      *(_QWORD *)(v35 + 24) = 0x800000023D67ACD0;
      *(_QWORD *)(v35 + 32) = 0xD00000000000005CLL;
      *(_QWORD *)(v35 + 40) = 0x800000023D6782C0;
      swift_willThrow();
      sub_23D5DDA20(v21, v22);
      return swift_release();
    }
    v40 = v15;
    v41 = v13;
    sub_23D5AFA60(v21, v22);
    sub_23D5AFA60(v21, v22);
    v23 = sub_23D5DF32C(v21, v22);
    if ((v24 & 1) != 0)
    {
      v25 = v23;
      v26 = (uint64_t)v7;
      v27 = a1;
      v28 = *(_QWORD *)(a2 + 56);
      v29 = type metadata accessor for GroupMembership.MemberProperties(0);
      v30 = v4;
      v31 = *(_QWORD *)(v29 - 8);
      v32 = v28 + *(_QWORD *)(v31 + 72) * v25;
      a1 = v27;
      v7 = (char *)v26;
      sub_23D5E7298(v32, v26, type metadata accessor for GroupMembership.MemberProperties);
      v33 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v31 + 56);
      v4 = v30;
      a2 = v37;
      v33(v26, 0, 1, v29);
    }
    else
    {
      v29 = type metadata accessor for GroupMembership.MemberProperties(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v7, 1, 1, v29);
    }
    sub_23D5DDA20(v21, v22);
    type metadata accessor for GroupMembership.MemberProperties(0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 48))(v7, 1, v29) == 1)
      goto LABEL_29;
    sub_23D5AEF8C((uint64_t)v7, v4);
    result = sub_23D5DDA20(v21, v22);
    v13 = v41;
    v11 = v40;
    if (v40)
      goto LABEL_4;
LABEL_5:
    v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v17 >= v39)
      return swift_release();
    v18 = *(_QWORD *)(v38 + 8 * v17);
    ++v13;
    if (!v18)
    {
      v13 = v17 + 1;
      if (v17 + 1 >= v39)
        return swift_release();
      v18 = *(_QWORD *)(v38 + 8 * v13);
      if (!v18)
      {
        v13 = v17 + 2;
        if (v17 + 2 >= v39)
          return swift_release();
        v18 = *(_QWORD *)(v38 + 8 * v13);
        if (!v18)
        {
          v13 = v17 + 3;
          if (v17 + 3 >= v39)
            return swift_release();
          v18 = *(_QWORD *)(v38 + 8 * v13);
          if (!v18)
            break;
        }
      }
    }
LABEL_20:
    v15 = (v18 - 1) & v18;
  }
  v19 = v17 + 4;
  if (v19 >= v39)
    return swift_release();
  v18 = *(_QWORD *)(v38 + 8 * v19);
  if (v18)
  {
    v13 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    v13 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v13 >= v39)
      return swift_release();
    v18 = *(_QWORD *)(v38 + 8 * v13);
    ++v19;
    if (v18)
      goto LABEL_20;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_23D6639C8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t AssociatedConformanceWitness;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;

  v35 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79178);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v34 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v13 = (char *)&v33 - v12;
  v14 = *v2;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v35, a2);
  v15 = (uint64_t)v7;
  sub_23D66C444();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_23D66C5C4();
  v17 = v37;
  if (v37 >> 60 == 15)
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v13, AssociatedTypeWitness);
  v18 = v36;
  v38 = v15;
  v35 = AssociatedConformanceWitness;
  while (*(_QWORD *)(v14 + 16))
  {
    sub_23D5AFA60(v18, v17);
    v19 = sub_23D5DF32C(v18, v17);
    if ((v20 & 1) != 0)
    {
      v21 = v19;
      v22 = AssociatedTypeWitness;
      v23 = *(_QWORD *)(v14 + 56);
      v24 = type metadata accessor for GroupMembership.MemberProperties(0);
      v25 = v14;
      v26 = v13;
      v27 = *(_QWORD *)(v24 - 8);
      v28 = v23 + *(_QWORD *)(v27 + 72) * v21;
      AssociatedTypeWitness = v22;
      v15 = v38;
      sub_23D5E7298(v28, v38, type metadata accessor for GroupMembership.MemberProperties);
      v29 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v27 + 56);
      v13 = v26;
      v14 = v25;
      v29(v15, 0, 1, v24);
    }
    else
    {
      v24 = type metadata accessor for GroupMembership.MemberProperties(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v15, 1, 1, v24);
    }
    sub_23D63D24C(v18, v17);
    type metadata accessor for GroupMembership.MemberProperties(0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 48))(v15, 1, v24) == 1)
      goto LABEL_11;
    sub_23D5AEF8C(v15, &qword_256C79178);
    sub_23D63D24C(v18, v17);
    sub_23D66C5C4();
    v18 = v36;
    v17 = v37;
    if (v37 >> 60 == 15)
      return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v13, AssociatedTypeWitness);
  }
  v31 = type metadata accessor for GroupMembership.MemberProperties(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v15, 1, 1, v31);
LABEL_11:
  sub_23D5AEF8C(v15, &qword_256C79178);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C790D8);
  sub_23D618E34();
  swift_allocError();
  *(_WORD *)v32 = 269;
  *(_OWORD *)(v32 + 8) = xmmword_23D674CD0;
  *(_QWORD *)(v32 + 24) = 0x800000023D67ACD0;
  *(_QWORD *)(v32 + 32) = 0xD00000000000005CLL;
  *(_QWORD *)(v32 + 40) = 0x800000023D6782C0;
  swift_willThrow();
  sub_23D63D24C(v18, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v13, AssociatedTypeWitness);
}

uint64_t sub_23D663D60(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (uint64_t *)((char *)&v25 - v6);
  v8 = *(_QWORD *)(a1 + 64);
  v26 = a1 + 64;
  v9 = 1 << *(_BYTE *)(a1 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & v8;
  v27 = (unint64_t)(v9 + 63) >> 6;
  v28 = a1;
  result = swift_bridgeObjectRetain();
  v13 = 0;
  while (1)
  {
    if (v11)
    {
      v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v15 = v14 | (v13 << 6);
      goto LABEL_5;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v21 >= v27)
      goto LABEL_24;
    v22 = *(_QWORD *)(v26 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v27)
        goto LABEL_24;
      v22 = *(_QWORD *)(v26 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v27)
          goto LABEL_24;
        v22 = *(_QWORD *)(v26 + 8 * v13);
        if (!v22)
        {
          v13 = v21 + 3;
          if (v21 + 3 >= v27)
            goto LABEL_24;
          v22 = *(_QWORD *)(v26 + 8 * v13);
          if (!v22)
          {
            v23 = v21 + 4;
            if (v23 >= v27)
            {
LABEL_24:
              v24 = 0;
              goto LABEL_25;
            }
            v22 = *(_QWORD *)(v26 + 8 * v23);
            if (!v22)
            {
              while (1)
              {
                v13 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_27;
                if (v13 >= v27)
                  goto LABEL_24;
                v22 = *(_QWORD *)(v26 + 8 * v13);
                ++v23;
                if (v22)
                  goto LABEL_22;
              }
            }
            v13 = v23;
          }
        }
      }
    }
LABEL_22:
    v11 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_5:
    v16 = *(_QWORD *)(v28 + 56);
    v17 = (uint64_t *)(*(_QWORD *)(v28 + 48) + 16 * v15);
    v18 = *v17;
    v19 = v17[1];
    v20 = type metadata accessor for GroupMembership.MemberProperties(0);
    sub_23D5E7298(v16 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v15, (uint64_t)v7 + *(int *)(v2 + 48), type metadata accessor for GroupMembership.MemberProperties);
    *v7 = v18;
    v7[1] = v19;
    sub_23D5F16C4((uint64_t)v7, (uint64_t)v5, &qword_256C799A0);
    LOBYTE(v16) = v5[*(int *)(v2 + 48)];
    sub_23D5AFA60(v18, v19);
    result = sub_23D5AEF8C((uint64_t)v5, &qword_256C799A0);
    if ((v16 & 1) == 0)
    {
      v24 = 1;
LABEL_25:
      swift_release();
      return v24;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t static GroupMembership.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_23D663FE8(*a1, *a2);
}

uint64_t sub_23D663FE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  unint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unsigned __int8 *v45;
  char v46;
  char v47;
  unsigned __int8 *v48;
  char v49;
  uint64_t v50;
  int64_t v51;
  uint64_t v52;
  int64_t v53;
  uint64_t v54;
  unsigned __int8 *v55;
  int64_t v56;
  _BOOL4 v57;
  uint64_t *v58;
  unint64_t v59;

  v4 = type metadata accessor for GroupMembership.MemberProperties(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v55 = (unsigned __int8 *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (unsigned __int8 *)&v50 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79998);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (uint64_t *)((char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = MEMORY[0x24BDAC7A8](v11);
  v16 = (uint64_t *)((char *)&v50 - v15);
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v56 = 0;
  v54 = a1;
  v19 = *(_QWORD *)(a1 + 64);
  v18 = a1 + 64;
  v17 = v19;
  v20 = 1 << *(_BYTE *)(v18 - 32);
  v21 = -1;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  v22 = v21 & v17;
  v52 = v18;
  v53 = (unint64_t)(v20 + 63) >> 6;
  v51 = v53 - 1;
  v23 = &qword_256C799A0;
  v58 = (uint64_t *)((char *)&v50 - v15);
  while (1)
  {
    if (v22)
    {
      v24 = __clz(__rbit64(v22));
      v25 = (v22 - 1) & v22;
      v26 = v24 | (v56 << 6);
LABEL_8:
      v27 = *(_QWORD *)(v54 + 56);
      v28 = (uint64_t *)(*(_QWORD *)(v54 + 48) + 16 * v26);
      v29 = *v28;
      v30 = v28[1];
      *v13 = *v28;
      v13[1] = v30;
      v31 = v27 + *(_QWORD *)(v5 + 72) * v26;
      v32 = __swift_instantiateConcreteTypeFromMangledName(v23);
      sub_23D5E7298(v31, (uint64_t)v13 + *(int *)(v32 + 48), type metadata accessor for GroupMembership.MemberProperties);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v13, 0, 1, v32);
      sub_23D5AFA60(v29, v30);
      v16 = v58;
      goto LABEL_30;
    }
    v33 = v56 + 1;
    if (__OFADD__(v56, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v33 < v53)
    {
      v34 = *(_QWORD *)(v52 + 8 * v33);
      if (v34)
        goto LABEL_12;
      v35 = v56 + 2;
      ++v56;
      if (v33 + 1 < v53)
      {
        v34 = *(_QWORD *)(v52 + 8 * v35);
        if (v34)
          goto LABEL_15;
        v56 = v33 + 1;
        if (v33 + 2 < v53)
        {
          v34 = *(_QWORD *)(v52 + 8 * (v33 + 2));
          if (v34)
          {
            v33 += 2;
            goto LABEL_12;
          }
          v56 = v33 + 2;
          if (v33 + 3 < v53)
          {
            v34 = *(_QWORD *)(v52 + 8 * (v33 + 3));
            if (v34)
            {
              v33 += 3;
              goto LABEL_12;
            }
            v35 = v33 + 4;
            v56 = v33 + 3;
            if (v33 + 4 < v53)
              break;
          }
        }
      }
    }
LABEL_29:
    v36 = __swift_instantiateConcreteTypeFromMangledName(v23);
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v13, 1, 1, v36);
    v25 = 0;
LABEL_30:
    sub_23D5F16C4((uint64_t)v13, (uint64_t)v16, &qword_256C79998);
    v37 = __swift_instantiateConcreteTypeFromMangledName(v23);
    v38 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 48))(v16, 1, v37);
    v57 = v38 == 1;
    if (v38 == 1)
      return v57;
    v59 = v25;
    v39 = v23;
    v40 = v13;
    v41 = (uint64_t)v16 + *(int *)(v37 + 48);
    v42 = *v16;
    v43 = v16[1];
    sub_23D5E7F64(v41, (uint64_t)v9, type metadata accessor for GroupMembership.MemberProperties);
    v44 = sub_23D5DF32C(v42, v43);
    v45 = v9;
    v47 = v46;
    sub_23D5DDA20(v42, v43);
    if ((v47 & 1) == 0)
    {
      sub_23D5E6950((uint64_t)v45, type metadata accessor for GroupMembership.MemberProperties);
      return 0;
    }
    v48 = v55;
    sub_23D5E7298(*(_QWORD *)(a2 + 56) + *(_QWORD *)(v5 + 72) * v44, (uint64_t)v55, type metadata accessor for GroupMembership.MemberProperties);
    v49 = _s14GroupKitCrypto0A10MembershipV16MemberPropertiesV2eeoiySbAE_AEtFZ_0(v48, v45);
    sub_23D5E6950((uint64_t)v48, type metadata accessor for GroupMembership.MemberProperties);
    result = sub_23D5E6950((uint64_t)v45, type metadata accessor for GroupMembership.MemberProperties);
    v9 = v45;
    v13 = v40;
    v23 = v39;
    v16 = v58;
    v22 = v59;
    if ((v49 & 1) == 0)
      return v57;
  }
  v34 = *(_QWORD *)(v52 + 8 * v35);
  if (v34)
  {
LABEL_15:
    v33 = v35;
LABEL_12:
    v25 = (v34 - 1) & v34;
    v26 = __clz(__rbit64(v34)) + (v33 << 6);
    v56 = v33;
    goto LABEL_8;
  }
  while (1)
  {
    v33 = v35 + 1;
    if (__OFADD__(v35, 1))
      break;
    if (v33 >= v53)
    {
      v56 = v51;
      goto LABEL_29;
    }
    v34 = *(_QWORD *)(v52 + 8 * v33);
    ++v35;
    if (v34)
      goto LABEL_12;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_23D66441C(uint64_t *a1, uint64_t *a2)
{
  return sub_23D663FE8(*a1, *a2);
}

uint64_t sub_23D664428(uint64_t a1, unint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_23D5DF32C(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_23D666AC0(&qword_256C79978);
    v9 = v12;
  }
  sub_23D5DDA20(*(_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v6), *(_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v6 + 8));
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_23D66625C(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23D6644FC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23D66462C(a1, a2, type metadata accessor for GroupMembership.MemberProperties, &qword_256C79AF8, a3);
}

double sub_23D664510@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  _OWORD *v12;
  __int128 v13;
  double result;
  uint64_t v15;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_23D5DF32C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v15 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_23D66708C();
      v11 = v15;
    }
    sub_23D5DDA20(*(_QWORD *)(*(_QWORD *)(v11 + 48) + 16 * v8), *(_QWORD *)(*(_QWORD *)(v11 + 48) + 16 * v8 + 8));
    v12 = (_OWORD *)(*(_QWORD *)(v11 + 56) + 48 * v8);
    v13 = v12[1];
    *a3 = *v12;
    a3[1] = v13;
    a3[2] = v12[2];
    sub_23D66644C(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = xmmword_23D66DF30;
    a3[1] = 0u;
    a3[2] = 0u;
  }
  return result;
}

uint64_t sub_23D664618@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23D66462C(a1, a2, type metadata accessor for MembershipVerifier, &qword_256C79B08, a3);
}

uint64_t sub_23D66462C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t (*a3)(_QWORD)@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t *v5;
  uint64_t *v8;
  unint64_t v12;
  char v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v8 = v5;
  swift_bridgeObjectRetain();
  v12 = sub_23D5DF32C(a1, a2);
  LOBYTE(a2) = v13;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = *v8;
    v21 = *v8;
    *v8 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_23D6672B0(a3, a4);
      v15 = v21;
    }
    sub_23D5DDA20(*(_QWORD *)(*(_QWORD *)(v15 + 48) + 16 * v12), *(_QWORD *)(*(_QWORD *)(v15 + 48) + 16 * v12 + 8));
    v16 = *(_QWORD *)(v15 + 56);
    v17 = a3(0);
    v18 = *(_QWORD *)(v17 - 8);
    sub_23D5E7F64(v16 + *(_QWORD *)(v18 + 72) * v12, a5, a3);
    sub_23D66663C(v12, v15, a3);
    *v8 = v15;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(a5, 0, 1, v17);
  }
  else
  {
    v20 = a3(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a5, 1, 1, v20);
  }
}

uint64_t sub_23D66476C(uint64_t a1, char a2)
{
  return sub_23D664784(a1, a2, &qword_256C7C758);
}

uint64_t sub_23D664778(uint64_t a1, char a2)
{
  return sub_23D664784(a1, a2, &qword_256C79978);
}

uint64_t sub_23D664784(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  int64_t v33;
  _QWORD *v34;
  __int128 v35;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v7 = sub_23D66C744();
  v8 = v7;
  if (*(_QWORD *)(v6 + 16))
  {
    v32 = v3;
    v9 = 1 << *(_BYTE *)(v6 + 32);
    v34 = (_QWORD *)(v6 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v6 + 64);
    v33 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v20 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v21 = v20 | (v14 << 6);
      }
      else
      {
        v22 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v33)
          goto LABEL_33;
        v23 = v34[v22];
        ++v14;
        if (!v23)
        {
          v14 = v22 + 1;
          if (v22 + 1 >= v33)
            goto LABEL_33;
          v23 = v34[v14];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v33)
            {
LABEL_33:
              swift_release();
              v4 = v32;
              if ((a2 & 1) != 0)
              {
                v31 = 1 << *(_BYTE *)(v6 + 32);
                if (v31 >= 64)
                  bzero(v34, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v31;
                *(_QWORD *)(v6 + 16) = 0;
              }
              break;
            }
            v23 = v34[v24];
            if (!v23)
            {
              while (1)
              {
                v14 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v14 >= v33)
                  goto LABEL_33;
                v23 = v34[v14];
                ++v24;
                if (v23)
                  goto LABEL_30;
              }
            }
            v14 = v24;
          }
        }
LABEL_30:
        v11 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v14 << 6);
      }
      v29 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v21);
      v35 = *(_OWORD *)(*(_QWORD *)(v6 + 48) + 16 * v21);
      v30 = *(_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v21 + 8);
      if ((a2 & 1) == 0)
      {
        sub_23D5AFA60(v35, v30);
        swift_bridgeObjectRetain();
      }
      sub_23D66C8E8();
      sub_23D5AFA60(v35, v30);
      sub_23D66BDA8();
      sub_23D5DDA20(v35, v30);
      result = sub_23D66C90C();
      v15 = -1 << *(_BYTE *)(v8 + 32);
      v16 = result & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
        v19 = v35;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v15) >> 6;
        v19 = v35;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v27 = v17 == v26;
          if (v17 == v26)
            v17 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v17);
        }
        while (v28 == -1);
        v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(_OWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18) = v19;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v29;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_23D664AA0(uint64_t a1, char a2)
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
  uint64_t v18;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  char v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79958);
  v35 = a2;
  v6 = sub_23D66C744();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v34 = v5 + 64;
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
    if (v21 >= v33)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v34 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v33)
        goto LABEL_33;
      v23 = *(_QWORD *)(v34 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v33)
        {
LABEL_33:
          swift_release();
          if ((v35 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v34 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v33)
              goto LABEL_33;
            v23 = *(_QWORD *)(v34 + 8 * v13);
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
    v29 = 8 * v20;
    v30 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v29);
    v31 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v29);
    if ((v35 & 1) == 0)
    {
      swift_retain();
      swift_retain();
    }
    sub_23D66C8E8();
    swift_bridgeObjectRetain();
    sub_23D66C3CC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23D66C3CC();
    swift_bridgeObjectRelease();
    result = sub_23D66C90C();
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
    v18 = 8 * v17;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v31;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v35 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23D664DEC(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79928);
  v6 = sub_23D66C744();
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
        sub_23D5F1150(v24, v35);
      }
      else
      {
        sub_23D5F17CC((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_23D66C8E8();
      sub_23D66C3CC();
      result = sub_23D66C90C();
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
      result = (uint64_t)sub_23D5F1150(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23D6650E8(uint64_t a1, int a2)
{
  return sub_23D6654BC(a1, a2, type metadata accessor for GroupMembership.MemberProperties, &qword_256C79AF8);
}

uint64_t sub_23D6650FC(uint64_t a1, char a2)
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
  __int128 v18;
  uint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  __int128 v31;
  uint64_t *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  int64_t v42;
  _QWORD *v43;
  uint64_t i;
  char v45;
  int64_t v46;
  __int128 v47;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79B10);
  v45 = a2;
  v6 = sub_23D66C744();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v43 = (_QWORD *)(v5 + 64);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v41 = v2;
  v42 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  for (i = v5; ; v5 = i)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v46 = v13;
      v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v42)
      break;
    v23 = v43;
    v24 = v43[v22];
    v25 = v13 + 1;
    if (!v24)
    {
      v25 = v13 + 2;
      if (v13 + 2 >= v42)
        goto LABEL_33;
      v24 = v43[v25];
      if (!v24)
      {
        v26 = v13 + 3;
        if (v13 + 3 >= v42)
        {
LABEL_33:
          swift_release();
          v3 = v41;
          if ((v45 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = v43[v26];
        if (!v24)
        {
          while (1)
          {
            v25 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v25 >= v42)
              goto LABEL_33;
            v24 = v43[v25];
            ++v26;
            if (v24)
              goto LABEL_30;
          }
        }
        v25 = v13 + 3;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v46 = v25;
    v21 = __clz(__rbit64(v24)) + (v25 << 6);
LABEL_31:
    v31 = *(_OWORD *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 48 * v21);
    v33 = *v32;
    v34 = v32[1];
    v35 = v32[2];
    v36 = v32[3];
    v37 = v32[4];
    v38 = v32[5];
    v47 = v31;
    v39 = *((_QWORD *)&v31 + 1);
    if ((v45 & 1) == 0)
    {
      sub_23D5AFA60(v31, *((unint64_t *)&v31 + 1));
      sub_23D5AFA60(v33, v34);
      sub_23D5AFA60(v35, v36);
      sub_23D5AFA60(v37, v38);
    }
    sub_23D66C8E8();
    sub_23D5AFA60(v47, v39);
    sub_23D66BDA8();
    sub_23D5DDA20(v47, v39);
    result = sub_23D66C90C();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      v18 = v47;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      v18 = v47;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(_OWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17) = v18;
    v19 = (uint64_t *)(*(_QWORD *)(v7 + 56) + 48 * v17);
    *v19 = v33;
    v19[1] = v34;
    v19[2] = v35;
    v19[3] = v36;
    v13 = v46;
    v19[4] = v37;
    v19[5] = v38;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v41;
  v23 = v43;
  if ((v45 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v40 = 1 << *(_BYTE *)(v5 + 32);
  if (v40 >= 64)
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v40;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23D665494(uint64_t a1, int a2)
{
  return sub_23D6654BC(a1, a2, type metadata accessor for MembershipVerifier, &qword_256C79B08);
}

uint64_t sub_23D6654A8(uint64_t a1, int a2)
{
  return sub_23D6654BC(a1, a2, type metadata accessor for UserKeyingInfo, &qword_256C7C760);
}

uint64_t sub_23D6654BC(uint64_t a1, int a2, uint64_t (*a3)(_QWORD), uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v7;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t result;
  int64_t v21;
  unint64_t v22;
  __int128 v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  _QWORD *v27;
  unint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  int64_t v44;
  _QWORD *v45;
  uint64_t v46;
  int v47;
  __int128 v48;

  v7 = v4;
  v9 = a3(0);
  v46 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v42 - v10;
  v12 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  v47 = a2;
  v13 = sub_23D66C744();
  v14 = v13;
  if (!*(_QWORD *)(v12 + 16))
    goto LABEL_41;
  v15 = 1 << *(_BYTE *)(v12 + 32);
  v16 = *(_QWORD *)(v12 + 64);
  v45 = (_QWORD *)(v12 + 64);
  if (v15 < 64)
    v17 = ~(-1 << v15);
  else
    v17 = -1;
  v18 = v17 & v16;
  v43 = v4;
  v44 = (unint64_t)(v15 + 63) >> 6;
  v19 = v13 + 64;
  result = swift_retain();
  v21 = 0;
  while (1)
  {
    if (v18)
    {
      v24 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v25 = v24 | (v21 << 6);
      goto LABEL_22;
    }
    v26 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v26 >= v44)
      break;
    v27 = v45;
    v28 = v45[v26];
    ++v21;
    if (!v28)
    {
      v21 = v26 + 1;
      if (v26 + 1 >= v44)
        goto LABEL_34;
      v28 = v45[v21];
      if (!v28)
      {
        v29 = v26 + 2;
        if (v29 >= v44)
        {
LABEL_34:
          swift_release();
          v7 = v43;
          if ((v47 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v28 = v45[v29];
        if (!v28)
        {
          while (1)
          {
            v21 = v29 + 1;
            if (__OFADD__(v29, 1))
              goto LABEL_43;
            if (v21 >= v44)
              goto LABEL_34;
            v28 = v45[v21];
            ++v29;
            if (v28)
              goto LABEL_21;
          }
        }
        v21 = v29;
      }
    }
LABEL_21:
    v18 = (v28 - 1) & v28;
    v25 = __clz(__rbit64(v28)) + (v21 << 6);
LABEL_22:
    v30 = *(_QWORD *)(v46 + 72);
    v31 = *(_QWORD *)(v12 + 56) + v30 * v25;
    v32 = *(_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v25 + 8);
    v48 = *(_OWORD *)(*(_QWORD *)(v12 + 48) + 16 * v25);
    if ((v47 & 1) != 0)
    {
      sub_23D5E7F64(v31, (uint64_t)v11, a3);
    }
    else
    {
      sub_23D5E7298(v31, (uint64_t)v11, a3);
      sub_23D5AFA60(v48, v32);
    }
    sub_23D66C8E8();
    v33 = v48;
    sub_23D5AFA60(v48, v32);
    sub_23D66BDA8();
    sub_23D5DDA20(v33, v32);
    result = sub_23D66C90C();
    v34 = -1 << *(_BYTE *)(v14 + 32);
    v35 = result & ~v34;
    v36 = v35 >> 6;
    if (((-1 << v35) & ~*(_QWORD *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v35) & ~*(_QWORD *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
      v23 = v48;
    }
    else
    {
      v37 = 0;
      v38 = (unint64_t)(63 - v34) >> 6;
      v23 = v48;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v39 = v36 == v38;
        if (v36 == v38)
          v36 = 0;
        v37 |= v39;
        v40 = *(_QWORD *)(v19 + 8 * v36);
      }
      while (v40 == -1);
      v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(_QWORD *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_OWORD *)(*(_QWORD *)(v14 + 48) + 16 * v22) = v23;
    result = sub_23D5E7F64((uint64_t)v11, *(_QWORD *)(v14 + 56) + v30 * v22, a3);
    ++*(_QWORD *)(v14 + 16);
  }
  swift_release();
  v7 = v43;
  v27 = v45;
  if ((v47 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v41 = 1 << *(_BYTE *)(v12 + 32);
  if (v41 >= 64)
    bzero(v27, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v27 = -1 << v41;
  *(_QWORD *)(v12 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v7 = v14;
  return result;
}

uint64_t sub_23D665858(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  __int128 v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
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
  uint64_t v43;
  int v44;
  __int128 v45;

  v3 = v2;
  v5 = sub_23D66C330();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C768);
  v44 = a2;
  v10 = sub_23D66C744();
  v11 = v10;
  if (*(_QWORD *)(v9 + 16))
  {
    v40 = v2;
    v12 = 1 << *(_BYTE *)(v9 + 32);
    v13 = *(_QWORD *)(v9 + 64);
    v42 = (_QWORD *)(v9 + 64);
    if (v12 < 64)
      v14 = ~(-1 << v12);
    else
      v14 = -1;
    v15 = v14 & v13;
    v41 = (unint64_t)(v12 + 63) >> 6;
    v16 = v10 + 64;
    result = swift_retain();
    v18 = 0;
    v43 = v5;
    while (1)
    {
      if (v15)
      {
        v21 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        v22 = v21 | (v18 << 6);
      }
      else
      {
        v23 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v23 >= v41)
          goto LABEL_34;
        v24 = v42[v23];
        ++v18;
        if (!v24)
        {
          v18 = v23 + 1;
          if (v23 + 1 >= v41)
            goto LABEL_34;
          v24 = v42[v18];
          if (!v24)
          {
            v25 = v23 + 2;
            if (v25 >= v41)
            {
LABEL_34:
              swift_release();
              v3 = v40;
              if ((v44 & 1) != 0)
              {
                v38 = 1 << *(_BYTE *)(v9 + 32);
                if (v38 >= 64)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v9 + 16) = 0;
              }
              break;
            }
            v24 = v42[v25];
            if (!v24)
            {
              while (1)
              {
                v18 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_41;
                if (v18 >= v41)
                  goto LABEL_34;
                v24 = v42[v18];
                ++v25;
                if (v24)
                  goto LABEL_21;
              }
            }
            v18 = v25;
          }
        }
LABEL_21:
        v15 = (v24 - 1) & v24;
        v22 = __clz(__rbit64(v24)) + (v18 << 6);
      }
      v26 = *(_QWORD *)(v9 + 48);
      v27 = *(_QWORD *)(v6 + 72);
      v28 = *(_QWORD *)(v9 + 56) + v27 * v22;
      v29 = *(_QWORD *)(v26 + 16 * v22 + 8);
      v45 = *(_OWORD *)(v26 + 16 * v22);
      if ((v44 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v28, v5);
      }
      else
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v28, v5);
        sub_23D5AFA60(v45, v29);
      }
      sub_23D66C8E8();
      v30 = v45;
      sub_23D5AFA60(v45, v29);
      sub_23D66BDA8();
      sub_23D5DDA20(v30, v29);
      result = sub_23D66C90C();
      v31 = -1 << *(_BYTE *)(v11 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v16 + 8 * (v32 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v16 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
        v5 = v43;
        v20 = v45;
      }
      else
      {
        v34 = 0;
        v35 = (unint64_t)(63 - v31) >> 6;
        v5 = v43;
        v20 = v45;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v16 + 8 * v33);
        }
        while (v37 == -1);
        v19 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(_OWORD *)(*(_QWORD *)(v11 + 48) + 16 * v19) = v20;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 56) + v27 * v19, v8, v5);
      ++*(_QWORD *)(v11 + 16);
    }
  }
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_23D665BFC(uint64_t a1, char a2)
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
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  __int128 v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C770);
  v6 = sub_23D66C744();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
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
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v14 << 6);
      goto LABEL_31;
    }
    v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v11)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v36 + 8 * v23);
    ++v14;
    if (!v25)
    {
      v14 = v23 + 1;
      if (v23 + 1 >= v11)
        goto LABEL_33;
      v25 = *(_QWORD *)(v36 + 8 * v14);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v36 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v14 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v25 = *(_QWORD *)(v36 + 8 * v14);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v14 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v14 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = *(_OWORD *)(*(_QWORD *)(v5 + 48) + v31);
    v37 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + v31);
    v38 = v32;
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v31 + 8);
    if ((a2 & 1) == 0)
    {
      sub_23D5AFA60(v32, *((unint64_t *)&v32 + 1));
      sub_23D5AFA60(v37, *((unint64_t *)&v37 + 1));
    }
    sub_23D66C8E8();
    sub_23D5AFA60(v38, v33);
    sub_23D66BDA8();
    sub_23D5DDA20(v38, v33);
    result = sub_23D66C90C();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      v19 = v38;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v15) >> 6;
      v19 = v38;
      do
      {
        if (++v17 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v17 == v28;
        if (v17 == v28)
          v17 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v30 == -1);
      v18 = __clz(__rbit64(~v30)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v20 = 16 * v18;
    *(_OWORD *)(*(_QWORD *)(v7 + 48) + v20) = v19;
    *(_OWORD *)(*(_QWORD *)(v7 + 56) + v20) = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v24 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v24, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23D665F34(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t v41;
  char v42;
  int64_t v43;
  unint64_t v44;
  unint64_t v45;

  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79970);
  v42 = a2;
  result = sub_23D66C744();
  v6 = result;
  if (*(_QWORD *)(v4 + 16))
  {
    v7 = 0;
    v40 = (_QWORD *)(v4 + 64);
    v41 = v4;
    v8 = 1 << *(_BYTE *)(v4 + 32);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v4 + 64);
    v39 = (unint64_t)(v8 + 63) >> 6;
    v11 = result + 64;
    while (1)
    {
      if (v10)
      {
        v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v43 = v7;
        v18 = v17 | (v7 << 6);
      }
      else
      {
        v19 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        result = (uint64_t)v40;
        if (v19 >= v39)
          goto LABEL_33;
        v20 = v40[v19];
        v21 = v7 + 1;
        if (!v20)
        {
          v21 = v7 + 2;
          if (v7 + 2 >= v39)
            goto LABEL_33;
          v20 = v40[v21];
          if (!v20)
          {
            v22 = v7 + 3;
            if (v7 + 3 >= v39)
            {
LABEL_33:
              if ((v42 & 1) == 0)
                break;
              v36 = 1 << *(_BYTE *)(v4 + 32);
              if (v36 >= 64)
                bzero(v40, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v40 = -1 << v36;
              v37 = v38;
              *(_QWORD *)(v4 + 16) = 0;
              result = swift_release();
              goto LABEL_39;
            }
            v20 = v40[v22];
            if (!v20)
            {
              while (1)
              {
                v21 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_41;
                if (v21 >= v39)
                  goto LABEL_33;
                v20 = v40[v21];
                ++v22;
                if (v20)
                  goto LABEL_30;
              }
            }
            v21 = v7 + 3;
          }
        }
LABEL_30:
        v10 = (v20 - 1) & v20;
        v43 = v21;
        v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      v27 = *(_QWORD *)(v4 + 56);
      v28 = *(unsigned int *)(*(_QWORD *)(v4 + 48) + 4 * v18);
      v29 = (uint64_t *)(v27 + (v18 << 6));
      v30 = *v29;
      v31 = v29[1];
      v32 = v29[2];
      v33 = v29[3];
      v34 = v29[4];
      v35 = v29[6];
      v44 = v29[7];
      v45 = v29[5];
      if ((v42 & 1) == 0)
      {
        sub_23D5AFA60(v30, v31);
        sub_23D5AFA60(v32, v33);
        sub_23D5AFA60(v34, v45);
        sub_23D5AFA60(v35, v44);
      }
      result = MEMORY[0x2426362BC](*(_QWORD *)(v6 + 40), v28, 4);
      v12 = -1 << *(_BYTE *)(v6 + 32);
      v13 = result & ~v12;
      v14 = v13 >> 6;
      if (((-1 << v13) & ~*(_QWORD *)(v11 + 8 * (v13 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v11 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v12) >> 6;
        do
        {
          if (++v14 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v25 = v14 == v24;
          if (v14 == v24)
            v14 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v11 + 8 * v14);
        }
        while (v26 == -1);
        v15 = __clz(__rbit64(~v26)) + (v14 << 6);
      }
      *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_DWORD *)(*(_QWORD *)(v6 + 48) + 4 * v15) = v28;
      v16 = (uint64_t *)(*(_QWORD *)(v6 + 56) + (v15 << 6));
      *v16 = v30;
      v16[1] = v31;
      v16[2] = v32;
      v16[3] = v33;
      v16[4] = v34;
      v16[5] = v45;
      v7 = v43;
      v16[6] = v35;
      v16[7] = v44;
      ++*(_QWORD *)(v6 + 16);
      v4 = v41;
    }
  }
  result = swift_release();
  v37 = v38;
LABEL_39:
  *v37 = v6;
  return result;
}

unint64_t sub_23D66625C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
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
    result = sub_23D66C5E8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v10 = *v9;
        v11 = v9[1];
        sub_23D66C8E8();
        sub_23D5AFA60(v10, v11);
        sub_23D66BDA8();
        v12 = sub_23D66C90C();
        result = sub_23D5DDA20(v10, v11);
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8)
            goto LABEL_5;
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          v14 = *(_QWORD *)(a2 + 48);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || v15 >= v16 + 1)
            *v15 = *v16;
          v17 = *(_QWORD *)(a2 + 56);
          v18 = (_QWORD *)(v17 + 8 * v3);
          v19 = (_QWORD *)(v17 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v18 >= v19 + 1))
          {
            *v18 = *v19;
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

unint64_t sub_23D666440(unint64_t a1, uint64_t a2)
{
  return sub_23D66663C(a1, a2, type metadata accessor for GroupMembership.MemberProperties);
}

unint64_t sub_23D66644C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  __int128 *v20;
  __int128 *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23D66C5E8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v11 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v12 = *v11;
        v13 = v11[1];
        sub_23D66C8E8();
        sub_23D5AFA60(v12, v13);
        sub_23D66BDA8();
        v14 = sub_23D66C90C();
        result = sub_23D5DDA20(v12, v13);
        v15 = v14 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v15 < v8)
            goto LABEL_5;
        }
        else if (v15 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v15)
        {
LABEL_11:
          v16 = *(_QWORD *)(a2 + 48);
          v17 = (_OWORD *)(v16 + 16 * v3);
          v18 = (_OWORD *)(v16 + 16 * v6);
          if (v3 != v6 || v17 >= v18 + 1)
            *v17 = *v18;
          v19 = *(_QWORD *)(a2 + 56);
          v20 = (__int128 *)(v19 + 48 * v3);
          v21 = (__int128 *)(v19 + 48 * v6);
          if (v3 != v6 || (v3 = v6, v20 >= v21 + 3))
          {
            v9 = *v21;
            v10 = v21[2];
            v20[1] = v21[1];
            v20[2] = v10;
            *v20 = v9;
            v3 = v6;
          }
        }
LABEL_5:
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

unint64_t sub_23D66663C(unint64_t result, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  int64_t v22;
  unint64_t v23;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;

  v4 = result;
  v5 = a2 + 64;
  v6 = -1 << *(_BYTE *)(a2 + 32);
  v7 = (result + 1) & ~v6;
  if (((1 << v7) & *(_QWORD *)(a2 + 64 + 8 * (v7 >> 6))) != 0)
  {
    v9 = ~v6;
    result = sub_23D66C5E8();
    if ((*(_QWORD *)(v5 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
    {
      v10 = (result + 1) & v9;
      while (1)
      {
        v11 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v7);
        v12 = *v11;
        v13 = v11[1];
        sub_23D66C8E8();
        sub_23D5AFA60(v12, v13);
        sub_23D66BDA8();
        v14 = sub_23D66C90C();
        result = sub_23D5DDA20(v12, v13);
        v15 = v14 & v9;
        if (v4 >= (uint64_t)v10)
          break;
        if (v15 < v10)
          goto LABEL_11;
LABEL_12:
        v16 = *(_QWORD *)(a2 + 48);
        v17 = (_OWORD *)(v16 + 16 * v4);
        v18 = (_OWORD *)(v16 + 16 * v7);
        if (v4 != v7 || v17 >= v18 + 1)
          *v17 = *v18;
        v19 = *(_QWORD *)(a2 + 56);
        v20 = *(_QWORD *)(*(_QWORD *)(a3(0) - 8) + 72);
        v21 = v20 * v4;
        result = v19 + v20 * v4;
        v22 = v20 * v7;
        v23 = v19 + v20 * v7 + v20;
        if (v21 < v22 || result >= v23)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v4 = v7;
          if (v21 == v22)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v4 = v7;
LABEL_6:
        v7 = (v7 + 1) & v9;
        if (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
          goto LABEL_21;
      }
      if (v15 < v10)
        goto LABEL_6;
LABEL_11:
      if (v4 < (uint64_t)v15)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v25 = (uint64_t *)(v5 + 8 * ((unint64_t)v4 >> 6));
    v26 = *v25;
    v27 = (-1 << v4) - 1;
  }
  else
  {
    v25 = (uint64_t *)(v5 + 8 * (result >> 6));
    v27 = *v25;
    v26 = (-1 << result) - 1;
  }
  *v25 = v27 & v26;
  v28 = *(_QWORD *)(a2 + 16);
  v29 = __OFSUB__(v28, 1);
  v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_23D666850(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

unint64_t sub_23D666898(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  a4[(result >> 6) + 8] |= 1 << result;
  v4 = 8 * result;
  *(_QWORD *)(a4[6] + v4) = a2;
  *(_QWORD *)(a4[7] + v4) = a3;
  v5 = a4[2];
  v6 = __OFADD__(v5, 1);
  v7 = v5 + 1;
  if (v6)
    __break(1u);
  else
    a4[2] = v7;
  return result;
}

_OWORD *sub_23D6668E0(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_23D5F1150(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_23D666948(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  return sub_23D6669BC(a1, a2, a3, a4, a5, type metadata accessor for GroupMembership.MemberProperties);
}

unint64_t sub_23D666954(unint64_t result, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v5;
  _OWORD *v6;
  __int128 v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  v6 = (_OWORD *)(a5[7] + 48 * result);
  v7 = a4[1];
  *v6 = *a4;
  v6[1] = v7;
  v6[2] = a4[2];
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_23D6669B0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  return sub_23D6669BC(a1, a2, a3, a4, a5, type metadata accessor for MembershipVerifier);
}

uint64_t sub_23D6669BC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t (*a6)(_QWORD))
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v10 = (_QWORD *)(a5[6] + 16 * a1);
  *v10 = a2;
  v10[1] = a3;
  v11 = a5[7];
  v12 = a6(0);
  result = sub_23D5E7F64(a4, v11 + *(_QWORD *)(*(_QWORD *)(v12 - 8) + 72) * a1, a6);
  v14 = a5[2];
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    a5[2] = v16;
  return result;
}

unint64_t sub_23D666A54(unint64_t result, int a2, _OWORD *a3, _QWORD *a4)
{
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_DWORD *)(a4[6] + 4 * result) = a2;
  v4 = (_OWORD *)(a4[7] + (result << 6));
  v5 = a3[1];
  *v4 = *a3;
  v4[1] = v5;
  v6 = a3[3];
  v4[2] = a3[2];
  v4[3] = v6;
  v7 = a4[2];
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  if (v8)
    __break(1u);
  else
    a4[2] = v9;
  return result;
}

void *sub_23D666AA8()
{
  return sub_23D666AC0(&qword_256C7C758);
}

void *sub_23D666AB4()
{
  return sub_23D666AC0(&qword_256C79978);
}

void *sub_23D666AC0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_23D66C738();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v21 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v14)
      goto LABEL_26;
    v22 = *(_QWORD *)(v7 + 8 * v21);
    ++v10;
    if (!v22)
    {
      v10 = v21 + 1;
      if (v21 + 1 >= v14)
        goto LABEL_26;
      v22 = *(_QWORD *)(v7 + 8 * v10);
      if (!v22)
        break;
    }
LABEL_25:
    v13 = (v22 - 1) & v22;
    v16 = __clz(__rbit64(v22)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v16);
    v19 = 16 * v16;
    v20 = *(_OWORD *)(*(_QWORD *)(v3 + 48) + v19);
    *(_OWORD *)(*(_QWORD *)(v5 + 48) + v19) = v20;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v17) = v18;
    sub_23D5AFA60(v20, *((unint64_t *)&v20 + 1));
    result = (void *)swift_bridgeObjectRetain();
  }
  v23 = v21 + 2;
  if (v23 >= v14)
    goto LABEL_26;
  v22 = *(_QWORD *)(v7 + 8 * v23);
  if (v22)
  {
    v10 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v22 = *(_QWORD *)(v7 + 8 * v10);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23D666C6C()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79958);
  v2 = *v0;
  v3 = sub_23D66C738();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    swift_retain();
    result = (void *)swift_retain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23D666E14()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79928);
  v2 = *v0;
  v3 = sub_23D66C738();
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
    sub_23D5F17CC(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_23D5F1150(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

void *sub_23D666FF8()
{
  return sub_23D6672B0(type metadata accessor for GroupMembership.MemberProperties, &qword_256C79AF8);
}

uint64_t sub_23D66700C(uint64_t a1, unint64_t a2, char a3)
{
  if (a3 != 2)
    return sub_23D5DDA20(a1, a2);
  return a1;
}

uint64_t sub_23D667020(uint64_t a1, unint64_t a2, char a3)
{
  if (a3 != 2)
    return sub_23D5AFA60(a1, a2);
  return a1;
}

uint64_t sub_23D667034(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GroupMembership.MemberProperties(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for UserAndAllInfo(uint64_t a1)
{
  return sub_23D5F15A0(a1, (uint64_t *)&unk_256C7C668);
}

void *sub_23D66708C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *result;
  unint64_t v5;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  __int128 v22;
  uint64_t *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t *v27;
  int64_t v28;
  uint64_t v29;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79B10);
  v27 = v0;
  v1 = *v0;
  v2 = sub_23D66C738();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v27 = v3;
    return result;
  }
  result = (void *)(v2 + 64);
  v5 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5)
    result = memmove(result, (const void *)(v1 + 64), 8 * v5);
  v29 = v1 + 64;
  v7 = 0;
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v1 + 16);
  v8 = 1 << *(_BYTE *)(v1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(v1 + 64);
  v28 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      v11 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v12 = v11 | (v7 << 6);
      goto LABEL_12;
    }
    v24 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v28)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v24);
    ++v7;
    if (!v25)
    {
      v7 = v24 + 1;
      if (v24 + 1 >= v28)
        goto LABEL_26;
      v25 = *(_QWORD *)(v29 + 8 * v7);
      if (!v25)
        break;
    }
LABEL_25:
    v10 = (v25 - 1) & v25;
    v12 = __clz(__rbit64(v25)) + (v7 << 6);
LABEL_12:
    v13 = 16 * v12;
    v14 = 48 * v12;
    v15 = (uint64_t *)(*(_QWORD *)(v1 + 56) + v14);
    v16 = *v15;
    v17 = v15[1];
    v18 = v15[2];
    v19 = v15[3];
    v20 = v15[4];
    v21 = v15[5];
    v22 = *(_OWORD *)(*(_QWORD *)(v1 + 48) + v13);
    *(_OWORD *)(*(_QWORD *)(v3 + 48) + v13) = v22;
    v23 = (uint64_t *)(*(_QWORD *)(v3 + 56) + v14);
    *v23 = v16;
    v23[1] = v17;
    v23[2] = v18;
    v23[3] = v19;
    v23[4] = v20;
    v23[5] = v21;
    sub_23D5AFA60(v22, *((unint64_t *)&v22 + 1));
    sub_23D5AFA60(v16, v17);
    sub_23D5AFA60(v18, v19);
    result = (void *)sub_23D5AFA60(v20, v21);
  }
  v26 = v24 + 2;
  if (v26 >= v28)
    goto LABEL_26;
  v25 = *(_QWORD *)(v29 + 8 * v26);
  if (v25)
  {
    v7 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v7 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v7 >= v28)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v7);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23D66729C()
{
  return sub_23D6672B0(type metadata accessor for MembershipVerifier, &qword_256C79B08);
}

void *sub_23D6672B0(uint64_t (*a1)(_QWORD), uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *result;
  unint64_t v12;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t *v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;

  v5 = a1(0);
  v32 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v29 - v6;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v29 = v2;
  v8 = *v2;
  v9 = sub_23D66C738();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v29 = v10;
    return result;
  }
  result = (void *)(v9 + 64);
  v12 = (unint64_t)((1 << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12)
    result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  v30 = v8 + 64;
  v14 = 0;
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v8 + 16);
  v15 = 1 << *(_BYTE *)(v8 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(v8 + 64);
  v31 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      v18 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v19 = v18 | (v14 << 6);
      goto LABEL_12;
    }
    v26 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v31)
      goto LABEL_26;
    v27 = *(_QWORD *)(v30 + 8 * v26);
    ++v14;
    if (!v27)
    {
      v14 = v26 + 1;
      if (v26 + 1 >= v31)
        goto LABEL_26;
      v27 = *(_QWORD *)(v30 + 8 * v14);
      if (!v27)
        break;
    }
LABEL_25:
    v17 = (v27 - 1) & v27;
    v19 = __clz(__rbit64(v27)) + (v14 << 6);
LABEL_12:
    v20 = 16 * v19;
    v21 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v19);
    v22 = *v21;
    v23 = v21[1];
    v24 = *(_QWORD *)(v32 + 72) * v19;
    sub_23D5E7298(*(_QWORD *)(v8 + 56) + v24, (uint64_t)v7, a1);
    v25 = (uint64_t *)(*(_QWORD *)(v10 + 48) + v20);
    *v25 = v22;
    v25[1] = v23;
    sub_23D5E7F64((uint64_t)v7, *(_QWORD *)(v10 + 56) + v24, a1);
    result = (void *)sub_23D5AFA60(v22, v23);
  }
  v28 = v26 + 2;
  if (v28 >= v31)
    goto LABEL_26;
  v27 = *(_QWORD *)(v30 + 8 * v28);
  if (v27)
  {
    v14 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v14 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v14 >= v31)
      goto LABEL_26;
    v27 = *(_QWORD *)(v30 + 8 * v14);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23D6674E4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *result;
  unint64_t v5;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t *v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  int64_t v30;
  uint64_t v31;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79970);
  v29 = v0;
  v1 = *v0;
  v2 = sub_23D66C738();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v29 = v3;
    return result;
  }
  result = (void *)(v2 + 64);
  v5 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5)
    result = memmove(result, (const void *)(v1 + 64), 8 * v5);
  v31 = v1 + 64;
  v7 = 0;
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v1 + 16);
  v8 = 1 << *(_BYTE *)(v1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(v1 + 64);
  v30 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      v11 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v12 = v11 | (v7 << 6);
      goto LABEL_12;
    }
    v26 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v30)
      goto LABEL_26;
    v27 = *(_QWORD *)(v31 + 8 * v26);
    ++v7;
    if (!v27)
    {
      v7 = v26 + 1;
      if (v26 + 1 >= v30)
        goto LABEL_26;
      v27 = *(_QWORD *)(v31 + 8 * v7);
      if (!v27)
        break;
    }
LABEL_25:
    v10 = (v27 - 1) & v27;
    v12 = __clz(__rbit64(v27)) + (v7 << 6);
LABEL_12:
    v13 = 4 * v12;
    v14 = *(_DWORD *)(*(_QWORD *)(v1 + 48) + 4 * v12);
    v15 = v12 << 6;
    v16 = (uint64_t *)(*(_QWORD *)(v1 + 56) + v15);
    v17 = *v16;
    v18 = v16[1];
    v19 = v16[2];
    v20 = v16[3];
    v21 = v16[4];
    v22 = v16[5];
    v23 = v16[6];
    v24 = v16[7];
    *(_DWORD *)(*(_QWORD *)(v3 + 48) + v13) = v14;
    v25 = (uint64_t *)(*(_QWORD *)(v3 + 56) + v15);
    *v25 = v17;
    v25[1] = v18;
    v25[2] = v19;
    v25[3] = v20;
    v25[4] = v21;
    v25[5] = v22;
    v25[6] = v23;
    v25[7] = v24;
    sub_23D5AFA60(v17, v18);
    sub_23D5AFA60(v19, v20);
    sub_23D5AFA60(v21, v22);
    result = (void *)sub_23D5AFA60(v23, v24);
  }
  v28 = v26 + 2;
  if (v28 >= v30)
    goto LABEL_26;
  v27 = *(_QWORD *)(v31 + 8 * v28);
  if (v27)
  {
    v7 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v7 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v7 >= v30)
      goto LABEL_26;
    v27 = *(_QWORD *)(v31 + 8 * v7);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23D6676F0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = (uint64_t)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0) + 48);
  v5 = (uint64_t)a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256C79AD8) + 48);
  v7 = *a1;
  v6 = a1[1];
  *a2 = v7;
  a2[1] = v6;
  sub_23D5E7298(v4, v5, type metadata accessor for GroupMembership.MemberProperties);
  return sub_23D5AFA60(v7, v6);
}

uint64_t sub_23D667760(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  char v35;
  unint64_t v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  char v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  _QWORD v48[3];
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v10 = type metadata accessor for GroupMembership.MemberProperties(0);
  v59 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v50 = (uint64_t)v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v49 = (uint64_t)v48 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v48 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256C7C790);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (_QWORD *)((char *)v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v20 = -1 << *(_BYTE *)(a1 + 32);
  v21 = ~v20;
  v22 = *(_QWORD *)(a1 + 64);
  v23 = -v20;
  v52 = a1;
  v53 = a1 + 64;
  if (v23 < 64)
    v24 = ~(-1 << v23);
  else
    v24 = -1;
  v54 = v21;
  v55 = 0;
  v56 = v24 & v22;
  v57 = a2;
  v58 = a3;
  v48[2] = a1;
  swift_bridgeObjectRetain();
  v48[1] = a3;
  swift_retain();
  sub_23D5E5C48((uint64_t)v19);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79AD8);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 48))(v19, 1, v25) == 1)
  {
LABEL_5:
    swift_release();
    swift_bridgeObjectRelease();
    sub_23D5F165C();
    return swift_release();
  }
  v51 = v19;
  while (1)
  {
    v32 = *v19;
    v31 = v19[1];
    v33 = (uint64_t)v16;
    sub_23D5E7F64((uint64_t)v19 + *(int *)(v25 + 48), (uint64_t)v16, type metadata accessor for GroupMembership.MemberProperties);
    v34 = *(_QWORD **)a5;
    v36 = sub_23D5DF32C(v32, v31);
    v37 = v34[2];
    v38 = (v35 & 1) == 0;
    v39 = v37 + v38;
    if (__OFADD__(v37, v38))
      break;
    v40 = v35;
    if (v34[3] >= v39)
    {
      if ((a4 & 1) != 0)
      {
        v43 = *(_QWORD **)a5;
        if ((v35 & 1) != 0)
          goto LABEL_7;
      }
      else
      {
        sub_23D6672B0(type metadata accessor for GroupMembership.MemberProperties, &qword_256C79AF8);
        v43 = *(_QWORD **)a5;
        if ((v40 & 1) != 0)
          goto LABEL_7;
      }
    }
    else
    {
      sub_23D6654BC(v39, a4 & 1, type metadata accessor for GroupMembership.MemberProperties, &qword_256C79AF8);
      v41 = sub_23D5DF32C(v32, v31);
      if ((v40 & 1) != (v42 & 1))
        goto LABEL_22;
      v36 = v41;
      v43 = *(_QWORD **)a5;
      if ((v40 & 1) != 0)
      {
LABEL_7:
        v27 = v43[7];
        v28 = *(_QWORD *)(v59 + 72) * v36;
        v29 = v50;
        sub_23D5E7298(v27 + v28, v50, type metadata accessor for GroupMembership.MemberProperties);
        v30 = v49;
        sub_23D5E7298(v29, v49, type metadata accessor for GroupMembership.MemberProperties);
        sub_23D5E6950(v29, type metadata accessor for GroupMembership.MemberProperties);
        v16 = (char *)v33;
        sub_23D5E6950(v33, type metadata accessor for GroupMembership.MemberProperties);
        sub_23D5DDA20(v32, v31);
        sub_23D667034(v30, *(_QWORD *)(*(_QWORD *)a5 + 56) + v28);
        goto LABEL_8;
      }
    }
    v43[(v36 >> 6) + 8] |= 1 << v36;
    v44 = (uint64_t *)(v43[6] + 16 * v36);
    *v44 = v32;
    v44[1] = v31;
    v16 = (char *)v33;
    sub_23D5E7F64(v33, v43[7] + *(_QWORD *)(v59 + 72) * v36, type metadata accessor for GroupMembership.MemberProperties);
    v45 = v43[2];
    v46 = __OFADD__(v45, 1);
    v47 = v45 + 1;
    if (v46)
      goto LABEL_21;
    v43[2] = v47;
LABEL_8:
    v19 = v51;
    sub_23D5E5C48((uint64_t)v51);
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79AD8);
    a4 = 1;
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 48))(v19, 1, v25) == 1)
      goto LABEL_5;
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  result = sub_23D66C894();
  __break(1u);
  return result;
}

uint64_t sub_23D667B40(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  unint64_t v4;
  size_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  v4 = (unint64_t)((1 << v3) + 63) >> 6;
  v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    v6 = sub_23D667C90((_QWORD *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, v2);
    if (v1)
      swift_willThrow();
    else
      return v6;
  }
  else
  {
    v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    v2 = sub_23D667C90((unint64_t *)v7, v4, v2);
    MEMORY[0x242636844](v7, -1, -1);
  }
  return v2;
}

uint64_t sub_23D667C90(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  unint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  char *v36;
  uint64_t *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  int64_t v43;

  v31 = a2;
  v32 = a1;
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799A0);
  v4 = MEMORY[0x24BDAC7A8](v40);
  v36 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v37 = (uint64_t *)((char *)&v30 - v6);
  v7 = type metadata accessor for GroupMembership.MemberProperties(0);
  v39 = *(_QWORD *)(v7 - 8);
  result = MEMORY[0x24BDAC7A8](v7);
  v38 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = 0;
  v41 = (_QWORD *)a3;
  v11 = *(_QWORD *)(a3 + 64);
  v33 = 0;
  v34 = a3 + 64;
  v12 = 1 << *(_BYTE *)(a3 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v35 = (unint64_t)(v12 + 63) >> 6;
  v15 = v37;
  v16 = (uint64_t)v38;
  v17 = v36;
  while (1)
  {
    if (v14)
    {
      v42 = (v14 - 1) & v14;
      v43 = v10;
      v18 = __clz(__rbit64(v14)) | (v10 << 6);
      goto LABEL_5;
    }
    v25 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v25 >= v35)
      return sub_23D667FD0(v32, v31, v33, v41);
    v26 = *(_QWORD *)(v34 + 8 * v25);
    v27 = v10 + 1;
    if (!v26)
    {
      v27 = v10 + 2;
      if (v10 + 2 >= v35)
        return sub_23D667FD0(v32, v31, v33, v41);
      v26 = *(_QWORD *)(v34 + 8 * v27);
      if (!v26)
      {
        v27 = v10 + 3;
        if (v10 + 3 >= v35)
          return sub_23D667FD0(v32, v31, v33, v41);
        v26 = *(_QWORD *)(v34 + 8 * v27);
        if (!v26)
          break;
      }
    }
LABEL_20:
    v42 = (v26 - 1) & v26;
    v43 = v27;
    v18 = __clz(__rbit64(v26)) + (v27 << 6);
LABEL_5:
    v19 = (uint64_t *)(v41[6] + 16 * v18);
    v21 = *v19;
    v20 = v19[1];
    sub_23D5E7298(v41[7] + *(_QWORD *)(v39 + 72) * v18, v16, type metadata accessor for GroupMembership.MemberProperties);
    v22 = v40;
    v23 = (uint64_t)v15 + *(int *)(v40 + 48);
    *v15 = v21;
    v15[1] = v20;
    sub_23D5E7298(v16, v23, type metadata accessor for GroupMembership.MemberProperties);
    v24 = &v17[*(int *)(v22 + 48)];
    *(_QWORD *)v17 = v21;
    *((_QWORD *)v17 + 1) = v20;
    sub_23D5E7298(v23, (uint64_t)v24, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D5AFA60(v21, v20);
    sub_23D5AFA60(v21, v20);
    sub_23D5AFA60(v21, v20);
    sub_23D5AEF8C((uint64_t)v15, &qword_256C799A0);
    sub_23D5DDA20(*(_QWORD *)v17, *((_QWORD *)v17 + 1));
    LOBYTE(v23) = *v24;
    sub_23D5E6950((uint64_t)v24, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D5E6950(v16, type metadata accessor for GroupMembership.MemberProperties);
    result = sub_23D5DDA20(v21, v20);
    v10 = v43;
    v14 = v42;
    if ((v23 & 1) == 0)
    {
      *(unint64_t *)((char *)v32 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      if (__OFADD__(v33++, 1))
      {
        __break(1u);
        return sub_23D667FD0(v32, v31, v33, v41);
      }
    }
  }
  v28 = v10 + 4;
  if (v10 + 4 >= v35)
    return sub_23D667FD0(v32, v31, v33, v41);
  v26 = *(_QWORD *)(v34 + 8 * v28);
  if (v26)
  {
    v27 = v10 + 4;
    goto LABEL_20;
  }
  while (1)
  {
    v27 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v27 >= v35)
      return sub_23D667FD0(v32, v31, v33, v41);
    v26 = *(_QWORD *)(v34 + 8 * v27);
    ++v28;
    if (v26)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_23D667FD0(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
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
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v39;
  unint64_t *v40;
  _QWORD *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;

  v40 = a1;
  v7 = type metadata accessor for GroupMembership.MemberProperties(0);
  v44 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  MEMORY[0x24BDAC7A8](v8);
  v43 = (char *)&v39 - v10;
  if (!a3)
    return MEMORY[0x24BEE4B00];
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  v42 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C79AF8);
  result = sub_23D66C75C();
  v12 = result;
  v39 = a2;
  if (a2 < 1)
    v13 = 0;
  else
    v13 = *v40;
  v14 = 0;
  v15 = result + 64;
  v16 = v42;
  v17 = (uint64_t)v43;
  v41 = a4;
  while (1)
  {
    if (v13)
    {
      v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v45 = v14;
      v19 = v18 | (v14 << 6);
    }
    else
    {
      v20 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_40;
      if (v20 >= v39)
        return v12;
      v21 = v40[v20];
      v22 = v14 + 1;
      if (!v21)
      {
        v22 = v14 + 2;
        if (v14 + 2 >= v39)
          return v12;
        v21 = v40[v22];
        if (!v21)
        {
          v22 = v14 + 3;
          if (v14 + 3 >= v39)
            return v12;
          v21 = v40[v22];
          if (!v21)
          {
            v23 = v14 + 4;
            if (v14 + 4 >= v39)
              return v12;
            v21 = v40[v23];
            if (!v21)
            {
              while (1)
              {
                v22 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v22 >= v39)
                  return v12;
                v21 = v40[v22];
                ++v23;
                if (v21)
                  goto LABEL_24;
              }
            }
            v22 = v14 + 4;
          }
        }
      }
LABEL_24:
      v13 = (v21 - 1) & v21;
      v45 = v22;
      v19 = __clz(__rbit64(v21)) + (v22 << 6);
    }
    v24 = a4[7];
    v25 = (uint64_t *)(a4[6] + 16 * v19);
    v26 = *v25;
    v27 = v25[1];
    v28 = *(_QWORD *)(v44 + 72);
    sub_23D5E7298(v24 + v28 * v19, v17, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D5E7F64(v17, v16, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D66C8E8();
    sub_23D5AFA60(v26, v27);
    sub_23D5AFA60(v26, v27);
    sub_23D66BDA8();
    sub_23D5DDA20(v26, v27);
    result = sub_23D66C90C();
    v29 = -1 << *(_BYTE *)(v12 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v15 + 8 * (v30 >> 6))) != 0)
    {
      v32 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v15 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      v16 = v42;
    }
    else
    {
      v33 = 0;
      v34 = (unint64_t)(63 - v29) >> 6;
      v16 = v42;
      do
      {
        if (++v31 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v35 = v31 == v34;
        if (v31 == v34)
          v31 = 0;
        v33 |= v35;
        v36 = *(_QWORD *)(v15 + 8 * v31);
      }
      while (v36 == -1);
      v32 = __clz(__rbit64(~v36)) + (v31 << 6);
    }
    *(_QWORD *)(v15 + ((v32 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v32;
    v37 = (uint64_t *)(*(_QWORD *)(v12 + 48) + 16 * v32);
    *v37 = v26;
    v37[1] = v27;
    result = sub_23D5E7F64(v16, *(_QWORD *)(v12 + 56) + v32 * v28, type metadata accessor for GroupMembership.MemberProperties);
    ++*(_QWORD *)(v12 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v41;
    v14 = v45;
    if (!a3)
      return v12;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_23D668348(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  unint64_t v13;
  int64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v2 = type metadata accessor for GroupMembership.MemberProperties(0);
  v34 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v32 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C778);
  result = sub_23D66C738();
  v5 = 0;
  v35 = a1;
  v8 = *(_QWORD *)(a1 + 64);
  v7 = a1 + 64;
  v6 = v8;
  v9 = 1 << *(_BYTE *)(v7 - 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & v6;
  v29 = v7;
  v30 = (unint64_t)(v9 + 63) >> 6;
  v33 = result + 64;
  v31 = result;
  v12 = v32;
  if ((v10 & v6) == 0)
    goto LABEL_5;
LABEL_4:
  v13 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  v14 = v5;
  for (i = v13 | (v5 << 6); ; i = __clz(__rbit64(v17)) + (v18 << 6))
  {
    v20 = (uint64_t *)(*(_QWORD *)(v35 + 48) + 16 * i);
    v21 = *v20;
    v22 = v20[1];
    sub_23D5E7298(*(_QWORD *)(v35 + 56) + *(_QWORD *)(v34 + 72) * i, (uint64_t)v12, type metadata accessor for GroupMembership.MemberProperties);
    v23 = *v12;
    sub_23D5AFA60(v21, v22);
    sub_23D5E6950((uint64_t)v12, type metadata accessor for GroupMembership.MemberProperties);
    *(_QWORD *)(v33 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    result = v31;
    v24 = (uint64_t *)(*(_QWORD *)(v31 + 48) + 16 * i);
    *v24 = v21;
    v24[1] = v22;
    *(_BYTE *)(*(_QWORD *)(result + 56) + i) = v23;
    v25 = *(_QWORD *)(result + 16);
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    *(_QWORD *)(result + 16) = v27;
    v5 = v14;
    if (v11)
      goto LABEL_4;
LABEL_5:
    v16 = v5 + 1;
    if (__OFADD__(v5, 1))
      goto LABEL_24;
    if (v16 >= v30)
      return result;
    v17 = *(_QWORD *)(v29 + 8 * v16);
    v18 = v5 + 1;
    if (!v17)
    {
      v18 = v5 + 2;
      if (v5 + 2 >= v30)
        return result;
      v17 = *(_QWORD *)(v29 + 8 * v18);
      if (!v17)
      {
        v18 = v5 + 3;
        if (v5 + 3 >= v30)
          return result;
        v17 = *(_QWORD *)(v29 + 8 * v18);
        if (!v17)
          break;
      }
    }
LABEL_18:
    v11 = (v17 - 1) & v17;
    v14 = v18;
  }
  v19 = v5 + 4;
  if (v5 + 4 >= v30)
    return result;
  v17 = *(_QWORD *)(v29 + 8 * v19);
  if (v17)
  {
    v18 = v5 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    v18 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v18 >= v30)
      return result;
    v17 = *(_QWORD *)(v29 + 8 * v18);
    ++v19;
    if (v17)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t _s14GroupKitCrypto0A10MembershipV16MemberPropertiesV2eeoiySbAE_AEtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
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
  char *v28;
  uint64_t v29;
  char *v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t (*v34)(_QWORD);
  uint64_t (*v35)(_QWORD);
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char v48;
  char v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t, uint64_t);
  int v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t, uint64_t);
  int v72;
  void (*v73)(void);
  char *v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  char v81;
  void (*v82)(char *, uint64_t);
  uint64_t v83;
  char *v84;
  char *v85;
  char *v86;
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
  unsigned __int8 *v97;
  unsigned __int8 *v98;
  char *v99;
  uint64_t v100;

  v4 = sub_23D66C330();
  v90 = *(_QWORD *)(v4 - 8);
  v91 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v85 = (char *)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v86 = (char *)&v83 - v7;
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C780);
  MEMORY[0x24BDAC7A8](v88);
  v89 = (uint64_t)&v83 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for UserKeyingInfo(0);
  v94 = *(_QWORD *)(v9 - 8);
  v95 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v87 = (uint64_t)&v83 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79990);
  MEMORY[0x24BDAC7A8](v11);
  v92 = (uint64_t)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C7C788);
  MEMORY[0x24BDAC7A8](v93);
  v14 = (char *)&v83 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for GroupMembership.MemberProperties(0);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v83 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v83 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v100 = (uint64_t)&v83 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v96 = (uint64_t)&v83 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v83 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v83 - v29;
  v31 = *a1;
  v32 = *a2;
  v97 = a1;
  v33 = (uint64_t)a1;
  v35 = v34;
  sub_23D5E7298(v33, (uint64_t)&v83 - v29, v34);
  v98 = a2;
  sub_23D5E7298((uint64_t)a2, (uint64_t)v28, v35);
  v99 = v21;
  if (v31 != v32)
  {
    sub_23D5E6950((uint64_t)v28, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D5E6950((uint64_t)v30, type metadata accessor for GroupMembership.MemberProperties);
LABEL_9:
    v42 = (uint64_t)v97;
    v43 = (uint64_t)v98;
    v41 = v96;
    v44 = v100;
    sub_23D5E7298((uint64_t)v97, v96, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D5E7298(v43, v44, type metadata accessor for GroupMembership.MemberProperties);
LABEL_10:
    sub_23D5E6950(v44, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D5E6950(v41, type metadata accessor for GroupMembership.MemberProperties);
    v47 = (uint64_t)v99;
LABEL_11:
    sub_23D5E7298(v42, v47, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D5E7298(v43, (uint64_t)v18, type metadata accessor for GroupMembership.MemberProperties);
LABEL_12:
    v48 = 0;
    goto LABEL_13;
  }
  v36 = v15;
  v84 = v18;
  v38 = *((_QWORD *)v30 + 1);
  v37 = *((_QWORD *)v30 + 2);
  v40 = *((_QWORD *)v28 + 1);
  v39 = *((_QWORD *)v28 + 2);
  if (v37 >> 60 == 15)
  {
    sub_23D5E7284(*((_QWORD *)v28 + 1), *((_QWORD *)v28 + 2));
    sub_23D5E6950((uint64_t)v28, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D5E6950((uint64_t)v30, type metadata accessor for GroupMembership.MemberProperties);
    if (v39 >> 60 == 15)
    {
      sub_23D63D24C(v38, v37);
      v41 = v96;
      v42 = (uint64_t)v97;
      sub_23D5E7298((uint64_t)v97, v96, type metadata accessor for GroupMembership.MemberProperties);
      v43 = (uint64_t)v98;
      v44 = v100;
      sub_23D5E7298((uint64_t)v98, v100, type metadata accessor for GroupMembership.MemberProperties);
      v18 = v84;
      goto LABEL_15;
    }
LABEL_8:
    sub_23D63D24C(v38, v37);
    sub_23D63D24C(v40, v39);
    v18 = v84;
    goto LABEL_9;
  }
  v45 = *((_QWORD *)v30 + 1);
  v46 = *((_QWORD *)v30 + 2);
  if (v39 >> 60 == 15)
  {
    sub_23D5AFA60(v45, v46);
    sub_23D5AFA60(v38, v37);
    sub_23D5E6950((uint64_t)v28, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D5E6950((uint64_t)v30, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D5DDA20(v38, v37);
    goto LABEL_8;
  }
  sub_23D5E7284(v45, v46);
  sub_23D5E7284(v40, v39);
  sub_23D5E7284(v38, v37);
  sub_23D5E6578(v38, v37);
  v51 = v50;
  sub_23D63D24C(v40, v39);
  sub_23D5E6950((uint64_t)v28, type metadata accessor for GroupMembership.MemberProperties);
  sub_23D5E6950((uint64_t)v30, type metadata accessor for GroupMembership.MemberProperties);
  sub_23D5DDA20(v38, v37);
  sub_23D63D24C(v38, v37);
  v41 = v96;
  v42 = (uint64_t)v97;
  sub_23D5E7298((uint64_t)v97, v96, type metadata accessor for GroupMembership.MemberProperties);
  v43 = (uint64_t)v98;
  v44 = v100;
  sub_23D5E7298((uint64_t)v98, v100, type metadata accessor for GroupMembership.MemberProperties);
  v18 = v84;
  if ((v51 & 1) == 0)
    goto LABEL_10;
LABEL_15:
  v52 = v36;
  v53 = *(int *)(v36 + 24);
  v54 = v44 + v53;
  v55 = (uint64_t)v14;
  v56 = (uint64_t)&v14[*(int *)(v93 + 48)];
  v57 = v44;
  sub_23D5AEF48(v41 + v53, v55, &qword_256C79990);
  sub_23D5AEF48(v54, v56, &qword_256C79990);
  v58 = v95;
  v59 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v94 + 48);
  if (v59(v55, 1, v95) == 1)
  {
    v100 = v52;
    sub_23D5E6950(v57, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D5E6950(v41, type metadata accessor for GroupMembership.MemberProperties);
    v60 = v59(v56, 1, v58);
    v47 = (uint64_t)v99;
    if (v60 == 1)
    {
      sub_23D5AEF8C(v55, &qword_256C79990);
      sub_23D5E7298(v42, v47, type metadata accessor for GroupMembership.MemberProperties);
      sub_23D5E7298(v43, (uint64_t)v18, type metadata accessor for GroupMembership.MemberProperties);
      v52 = v100;
      goto LABEL_22;
    }
LABEL_20:
    sub_23D5AEF8C(v55, &qword_256C7C788);
    goto LABEL_11;
  }
  v61 = v92;
  sub_23D5AEF48(v55, v92, &qword_256C79990);
  if (v59(v56, 1, v58) == 1)
  {
    sub_23D5E6950(v100, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D5E6950(v41, type metadata accessor for GroupMembership.MemberProperties);
    sub_23D5E6950(v61, type metadata accessor for UserKeyingInfo);
    v47 = (uint64_t)v99;
    goto LABEL_20;
  }
  v62 = v87;
  sub_23D5E7F64(v56, v87, type metadata accessor for UserKeyingInfo);
  v63 = _s14GroupKitCrypto14UserKeyingInfoV2eeoiySbAC_ACtFZ_0(v61, v62);
  sub_23D5E6950(v62, type metadata accessor for UserKeyingInfo);
  sub_23D5E6950(v100, type metadata accessor for GroupMembership.MemberProperties);
  sub_23D5E6950(v41, type metadata accessor for GroupMembership.MemberProperties);
  sub_23D5E6950(v61, type metadata accessor for UserKeyingInfo);
  sub_23D5AEF8C(v55, &qword_256C79990);
  v47 = (uint64_t)v99;
  sub_23D5E7298(v42, (uint64_t)v99, type metadata accessor for GroupMembership.MemberProperties);
  sub_23D5E7298(v43, (uint64_t)v18, type metadata accessor for GroupMembership.MemberProperties);
  if ((v63 & 1) == 0)
    goto LABEL_12;
LABEL_22:
  v64 = *(int *)(v52 + 28);
  v65 = v18;
  v66 = (uint64_t)&v18[v64];
  v67 = v89;
  v68 = v89 + *(int *)(v88 + 48);
  sub_23D5AEF48(v47 + v64, v89, &qword_256C799E0);
  sub_23D5AEF48(v66, v68, &qword_256C799E0);
  v70 = v90;
  v69 = v91;
  v71 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v90 + 48);
  LODWORD(v66) = v71(v67, 1, v91);
  v72 = v71(v68, 1, v69);
  if ((_DWORD)v66 == 1)
  {
    v18 = v65;
    if (v72 == 1)
    {
      v48 = 1;
      goto LABEL_13;
    }
    sub_23D5AEF8C(v68, &qword_256C799E0);
    goto LABEL_12;
  }
  if (v72 == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v67, v69);
    v48 = 0;
  }
  else
  {
    v73 = *(void (**)(void))(v70 + 32);
    v73();
    v74 = v85;
    ((void (*)(char *, uint64_t, uint64_t))v73)(v85, v68, v69);
    v75 = sub_23D66C1D4();
    v77 = v76;
    v78 = sub_23D66C1D4();
    v80 = v79;
    sub_23D5E6578(v75, v77);
    v48 = v81;
    sub_23D5DDA20(v78, v80);
    sub_23D5DDA20(v75, v77);
    v82 = *(void (**)(char *, uint64_t))(v70 + 8);
    v82(v74, v69);
    v82(v86, v69);
  }
  v18 = v65;
LABEL_13:
  sub_23D5E6950((uint64_t)v18, type metadata accessor for GroupMembership.MemberProperties);
  sub_23D5E6950(v47, type metadata accessor for GroupMembership.MemberProperties);
  return v48 & 1;
}

uint64_t destroy for UserAndPublicKeyInfo(uint64_t a1)
{
  sub_23D5DDA20(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return sub_23D5DDA20(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32));
}

uint64_t initializeWithCopy for UserAndPublicKeyInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_23D5AFA60(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  sub_23D5AFA60(v7, v6);
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v6;
  return a1;
}

uint64_t assignWithCopy for UserAndPublicKeyInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_23D5AFA60(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  sub_23D5DDA20(v6, v7);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  sub_23D5AFA60(v9, v8);
  v10 = *(_QWORD *)(a1 + 24);
  v11 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v8;
  sub_23D5DDA20(v10, v11);
  return a1;
}

uint64_t assignWithTake for UserAndPublicKeyInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_23D5DDA20(v4, v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  sub_23D5DDA20(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserAndPublicKeyInfo(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for UserAndPublicKeyInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserAndPublicKeyInfo()
{
  return &type metadata for UserAndPublicKeyInfo;
}

uint64_t destroy for UserAndKeyShare(uint64_t a1)
{
  sub_23D5DDA20(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return sub_23D5DDA20(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t *initializeWithCopy for UserAndKeyShare(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  sub_23D5AFA60(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  v7 = a2[2];
  v6 = a2[3];
  sub_23D5AFA60(v7, v6);
  a1[2] = v7;
  a1[3] = v6;
  return a1;
}

uint64_t *assignWithCopy for UserAndKeyShare(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v4 = *a2;
  v5 = a2[1];
  sub_23D5AFA60(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_23D5DDA20(v6, v7);
  v9 = a2[2];
  v8 = a2[3];
  sub_23D5AFA60(v9, v8);
  v10 = a1[2];
  v11 = a1[3];
  a1[2] = v9;
  a1[3] = v8;
  sub_23D5DDA20(v10, v11);
  return a1;
}

uint64_t *assignWithTake for UserAndKeyShare(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_23D5DDA20(v4, v5);
  v6 = a1[2];
  v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_23D5DDA20(v6, v7);
  return a1;
}

ValueMetadata *type metadata accessor for UserAndKeyShare()
{
  return &type metadata for UserAndKeyShare;
}

uint64_t getEnumTagSinglePayload for UserAndDiversifiedVerificationKey()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23D669168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 12)
  {
    v4 = *(_QWORD *)(a1 + 8) >> 60;
    if (((4 * (_DWORD)v4) & 0xC) != 0)
      return 16 - ((4 * (_DWORD)v4) & 0xC | (v4 >> 2));
    else
      return 0;
  }
  else
  {
    v8 = sub_23D66C330();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for UserAndDiversifiedVerificationKey()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_23D6691FC(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 12)
  {
    *(_QWORD *)result = 0;
    *((_QWORD *)result + 1) = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  }
  else
  {
    v7 = sub_23D66C330();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for UserAndDiversifiedVerificationKey(uint64_t a1)
{
  return sub_23D5F15A0(a1, qword_256C7C5D8);
}

uint64_t sub_23D66928C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23D66C330();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23D669304(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_23D5AFA60(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithCopy for UserAndRole(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_23D5AFA60(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  sub_23D5DDA20(v6, v7);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for UserAndRole(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_23D5DDA20(v4, v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserAndRole(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for UserAndRole(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)(result + 16) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserAndRole()
{
  return &type metadata for UserAndRole;
}

unint64_t initializeBufferWithCopyOfBuffer for UserAndAllInfo(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v11 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = *(_QWORD *)a2;
    v8 = *(_QWORD *)(a2 + 8);
    sub_23D5AFA60(*(_QWORD *)a2, v8);
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v8;
    *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
    v9 = (uint64_t *)(a2 + 24);
    v10 = *(_QWORD *)(a2 + 32);
    if (v10 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 24) = *(_OWORD *)v9;
    }
    else
    {
      v12 = *v9;
      sub_23D5AFA60(*v9, *(_QWORD *)(a2 + 32));
      *(_QWORD *)(a1 + 24) = v12;
      *(_QWORD *)(a1 + 32) = v10;
    }
    v13 = (uint64_t *)(a2 + 40);
    v14 = *(_QWORD *)(a2 + 48);
    if (v14 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 40) = *(_OWORD *)v13;
    }
    else
    {
      v15 = *v13;
      sub_23D5AFA60(*v13, *(_QWORD *)(a2 + 48));
      *(_QWORD *)(a1 + 40) = v15;
      *(_QWORD *)(a1 + 48) = v14;
    }
    v16 = *(int *)(a3 + 32);
    v17 = (void *)(a1 + v16);
    v18 = (const void *)(a2 + v16);
    v19 = sub_23D66C330();
    v20 = *(_QWORD *)(v19 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
  }
  return a1;
}

uint64_t destroy for UserAndAllInfo(uint64_t *a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  sub_23D5DDA20(*a1, a1[1]);
  v4 = a1[4];
  if (v4 >> 60 != 15)
    sub_23D5DDA20(a1[3], v4);
  v5 = a1[6];
  if (v5 >> 60 != 15)
    sub_23D5DDA20(a1[5], v5);
  v6 = (char *)a1 + *(int *)(a2 + 32);
  v7 = sub_23D66C330();
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  return result;
}

uint64_t initializeWithCopy for UserAndAllInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  sub_23D5AFA60(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v8 = (uint64_t *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 32);
  if (v9 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v8;
  }
  else
  {
    v10 = *v8;
    sub_23D5AFA60(*v8, *(_QWORD *)(a2 + 32));
    *(_QWORD *)(a1 + 24) = v10;
    *(_QWORD *)(a1 + 32) = v9;
  }
  v11 = (uint64_t *)(a2 + 40);
  v12 = *(_QWORD *)(a2 + 48);
  if (v12 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)v11;
  }
  else
  {
    v13 = *v11;
    sub_23D5AFA60(*v11, *(_QWORD *)(a2 + 48));
    *(_QWORD *)(a1 + 40) = v13;
    *(_QWORD *)(a1 + 48) = v12;
  }
  v14 = *(int *)(a3 + 32);
  v15 = (void *)(a1 + v14);
  v16 = (const void *)(a2 + v14);
  v17 = sub_23D66C330();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v15, v16, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

uint64_t assignWithCopy for UserAndAllInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(void *, uint64_t, uint64_t);
  int v28;
  int v29;
  uint64_t v30;

  v6 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  sub_23D5AFA60(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  sub_23D5DDA20(v8, v9);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v10 = (uint64_t *)(a2 + 24);
  v11 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 32) >> 60 == 15)
  {
    if (v11 >> 60 != 15)
    {
      v12 = *v10;
      sub_23D5AFA60(*v10, *(_QWORD *)(a2 + 32));
      *(_QWORD *)(a1 + 24) = v12;
      *(_QWORD *)(a1 + 32) = v11;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v11 >> 60 == 15)
  {
    sub_23D63B5EC(a1 + 24);
LABEL_6:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v10;
    goto LABEL_8;
  }
  v13 = *v10;
  sub_23D5AFA60(*v10, *(_QWORD *)(a2 + 32));
  v14 = *(_QWORD *)(a1 + 24);
  v15 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = v13;
  *(_QWORD *)(a1 + 32) = v11;
  sub_23D5DDA20(v14, v15);
LABEL_8:
  v16 = (uint64_t *)(a2 + 40);
  v17 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)(a1 + 48) >> 60 == 15)
  {
    if (v17 >> 60 != 15)
    {
      v18 = *v16;
      sub_23D5AFA60(*v16, *(_QWORD *)(a2 + 48));
      *(_QWORD *)(a1 + 40) = v18;
      *(_QWORD *)(a1 + 48) = v17;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v17 >> 60 == 15)
  {
    sub_23D5EE998(a1 + 40);
LABEL_13:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)v16;
    goto LABEL_15;
  }
  v19 = *v16;
  sub_23D5AFA60(*v16, *(_QWORD *)(a2 + 48));
  v20 = *(_QWORD *)(a1 + 40);
  v21 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v19;
  *(_QWORD *)(a1 + 48) = v17;
  sub_23D5DDA20(v20, v21);
LABEL_15:
  v22 = *(int *)(a3 + 32);
  v23 = (void *)(a1 + v22);
  v24 = (void *)(a2 + v22);
  v25 = sub_23D66C330();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v26 + 48);
  v28 = v27(v23, 1, v25);
  v29 = v27(v24, 1, v25);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v26 + 24))(v23, v24, v25);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v26 + 8))(v23, v25);
    goto LABEL_20;
  }
  if (v29)
  {
LABEL_20:
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v26 + 16))(v23, v24, v25);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
  return a1;
}

uint64_t initializeWithTake for UserAndAllInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v4 = *(int *)(a3 + 32);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = sub_23D66C330();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for UserAndAllInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  _OWORD *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;

  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_23D5DDA20(v6, v7);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v8 = (_OWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9 >> 60 == 15)
    goto LABEL_4;
  v10 = *(_QWORD *)(a2 + 32);
  if (v10 >> 60 == 15)
  {
    sub_23D63B5EC(a1 + 24);
LABEL_4:
    *(_OWORD *)(a1 + 24) = *v8;
    goto LABEL_6;
  }
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)v8;
  *(_QWORD *)(a1 + 32) = v10;
  sub_23D5DDA20(v11, v9);
LABEL_6:
  v12 = (_OWORD *)(a2 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  if (v13 >> 60 == 15)
  {
LABEL_9:
    *(_OWORD *)(a1 + 40) = *v12;
    goto LABEL_11;
  }
  v14 = *(_QWORD *)(a2 + 48);
  if (v14 >> 60 == 15)
  {
    sub_23D5EE998(a1 + 40);
    goto LABEL_9;
  }
  v15 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)v12;
  *(_QWORD *)(a1 + 48) = v14;
  sub_23D5DDA20(v15, v13);
LABEL_11:
  v16 = *(int *)(a3 + 32);
  v17 = (void *)(a1 + v16);
  v18 = (void *)(a2 + v16);
  v19 = sub_23D66C330();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 40))(v17, v18, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_16;
  }
  if (v23)
  {
LABEL_16:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 32))(v17, v18, v19);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserAndAllInfo()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23D669CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;

  if ((_DWORD)a2 == 254)
  {
    v4 = *(unsigned __int8 *)(a1 + 16);
    if (v4 >= 2)
      return v4 - 1;
    else
      return 0;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for UserAndAllInfo()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23D669D24(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 254)
  {
    *(_BYTE *)(result + 16) = a2 + 1;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

void sub_23D669D98()
{
  unint64_t v0;

  sub_23D5F5B08(319, qword_256C7C678, (void (*)(uint64_t))MEMORY[0x24BDC6A60]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

ValueMetadata *type metadata accessor for GroupMembership()
{
  return &type metadata for GroupMembership;
}

uint64_t *initializeBufferWithCopyOfBuffer for GroupMembership.MemberProperties(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *__dst;
  uint64_t v52;
  uint64_t v53;

  v4 = (uint64_t *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a3;
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a2 + 1;
    v8 = a2[2];
    if (v8 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 8) = *(_OWORD *)v7;
    }
    else
    {
      v10 = *v7;
      sub_23D5AFA60(*v7, a2[2]);
      v4[1] = v10;
      v4[2] = v8;
    }
    v11 = *(int *)(v6 + 24);
    v12 = (uint64_t *)((char *)v4 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    v14 = (int *)type metadata accessor for UserKeyingInfo(0);
    v15 = *((_QWORD *)v14 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v15 + 48))(v13, 1, v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79990);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      v52 = v6;
      v53 = v15;
      v17 = *v13;
      v18 = v13[1];
      sub_23D5AFA60(*v13, v18);
      *v12 = v17;
      v12[1] = v18;
      v19 = v14[5];
      v20 = (char *)v12 + v19;
      v21 = (char *)v13 + v19;
      v22 = sub_23D66C210();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
      v23 = v14[6];
      v24 = (char *)v12 + v23;
      v25 = (char *)v13 + v23;
      v26 = sub_23D66C2DC();
      v27 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16);
      v27(v24, v25, v26);
      v28 = v14[7];
      v29 = (char *)v12 + v28;
      v30 = (char *)v13 + v28;
      v31 = sub_23D66C330();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(v29, v30, v31);
      v27((char *)v12 + v14[8], (char *)v13 + v14[8], v26);
      *(_QWORD *)((char *)v12 + v14[9]) = *(uint64_t *)((char *)v13 + v14[9]);
      v32 = v14[10];
      __dst = (char *)v12 + v32;
      v33 = (char *)v13 + v32;
      v34 = sub_23D66C258();
      v35 = *(_QWORD *)(v34 - 8);
      v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
      swift_bridgeObjectRetain();
      if (v36(v33, 1, v34))
      {
        v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79170);
        memcpy(__dst, v33, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v35 + 16))(__dst, v33, v34);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(__dst, 0, 1, v34);
      }
      v38 = v14[11];
      v39 = (char *)v12 + v38;
      v40 = (char *)v13 + v38;
      v41 = sub_23D66C2AC();
      v42 = *(_QWORD *)(v41 - 8);
      v6 = v52;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41))
      {
        v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79120);
        memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v39, v40, v41);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
      }
      (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v53 + 56))(v12, 0, 1, v14);
    }
    v44 = *(int *)(v6 + 28);
    v45 = (char *)v4 + v44;
    v46 = (char *)a2 + v44;
    v47 = sub_23D66C330();
    v48 = *(_QWORD *)(v47 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48))(v46, 1, v47))
    {
      v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
      memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v49 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v45, v46, v47);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v45, 0, 1, v47);
    }
  }
  return v4;
}

uint64_t destroy for GroupMembership.MemberProperties(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
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
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4 >> 60 != 15)
    sub_23D5DDA20(*(_QWORD *)(a1 + 8), v4);
  v5 = a1 + *(int *)(a2 + 24);
  v6 = (int *)type metadata accessor for UserKeyingInfo(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((_QWORD *)v6 - 1) + 48))(v5, 1, v6))
  {
    sub_23D5DDA20(*(_QWORD *)v5, *(_QWORD *)(v5 + 8));
    v7 = v5 + v6[5];
    v8 = sub_23D66C210();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
    v9 = v5 + v6[6];
    v10 = sub_23D66C2DC();
    v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
    v11(v9, v10);
    v12 = v5 + v6[7];
    v13 = sub_23D66C330();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
    v11(v5 + v6[8], v10);
    swift_bridgeObjectRelease();
    v14 = v5 + v6[10];
    v15 = sub_23D66C258();
    v16 = *(_QWORD *)(v15 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
    v17 = v5 + v6[11];
    v18 = sub_23D66C2AC();
    v19 = *(_QWORD *)(v18 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  }
  v20 = a1 + *(int *)(a2 + 28);
  v21 = sub_23D66C330();
  v22 = *(_QWORD *)(v21 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
  return result;
}

uint64_t initializeWithCopy for GroupMembership.MemberProperties(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *__dst;
  uint64_t v50;
  uint64_t v51;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = (uint64_t *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)v6;
  }
  else
  {
    v8 = *v6;
    sub_23D5AFA60(*v6, *(_QWORD *)(a2 + 16));
    *(_QWORD *)(a1 + 8) = v8;
    *(_QWORD *)(a1 + 16) = v7;
  }
  v9 = *(int *)(a3 + 24);
  v10 = (_QWORD *)(a1 + v9);
  v11 = (uint64_t *)(a2 + v9);
  v12 = (int *)type metadata accessor for UserKeyingInfo(0);
  v13 = *((_QWORD *)v12 - 1);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79990);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    v50 = v13;
    v51 = a3;
    v15 = *v11;
    v16 = v11[1];
    sub_23D5AFA60(*v11, v16);
    *v10 = v15;
    v10[1] = v16;
    v17 = v12[5];
    v18 = (char *)v10 + v17;
    v19 = (char *)v11 + v17;
    v20 = sub_23D66C210();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    v21 = v12[6];
    v22 = (char *)v10 + v21;
    v23 = (char *)v11 + v21;
    v24 = sub_23D66C2DC();
    v25 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
    v25(v22, v23, v24);
    v26 = v12[7];
    v27 = (char *)v10 + v26;
    v28 = (char *)v11 + v26;
    v29 = sub_23D66C330();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v27, v28, v29);
    v25((char *)v10 + v12[8], (char *)v11 + v12[8], v24);
    *(_QWORD *)((char *)v10 + v12[9]) = *(uint64_t *)((char *)v11 + v12[9]);
    v30 = v12[10];
    __dst = (char *)v10 + v30;
    v31 = (char *)v11 + v30;
    v32 = sub_23D66C258();
    v33 = *(_QWORD *)(v32 - 8);
    v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48);
    swift_bridgeObjectRetain();
    if (v34(v31, 1, v32))
    {
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79170);
      memcpy(__dst, v31, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(__dst, v31, v32);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(__dst, 0, 1, v32);
    }
    v36 = v12[11];
    v37 = (char *)v10 + v36;
    v38 = (char *)v11 + v36;
    v39 = sub_23D66C2AC();
    v40 = *(_QWORD *)(v39 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
    {
      v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79120);
      memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v37, v38, v39);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
    }
    a3 = v51;
    (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v50 + 56))(v10, 0, 1, v12);
  }
  v42 = *(int *)(a3 + 28);
  v43 = (void *)(a1 + v42);
  v44 = (const void *)(a2 + v42);
  v45 = sub_23D66C330();
  v46 = *(_QWORD *)(v45 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v46 + 48))(v44, 1, v45))
  {
    v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
    memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v46 + 16))(v43, v44, v45);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
  }
  return a1;
}

uint64_t assignWithCopy for GroupMembership.MemberProperties(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  char *v4;
  _OWORD *v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  int *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t *, uint64_t, int *);
  int v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  size_t v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(char *, uint64_t, uint64_t);
  int v68;
  size_t v69;
  void *v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t (*v82)(void *, uint64_t, uint64_t);
  int v83;
  int v84;
  uint64_t v85;
  uint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t (*v92)(char *, uint64_t, uint64_t);
  int v93;
  int v94;
  char *__dst;
  void *__dsta;
  char *__src;
  uint64_t v98;
  uint64_t v99;

  v4 = a2;
  *(_BYTE *)a1 = *a2;
  v6 = (_OWORD *)(a1 + 8);
  v7 = (uint64_t *)(a2 + 8);
  v8 = *((_QWORD *)a2 + 2);
  if (*(_QWORD *)(a1 + 16) >> 60 == 15)
  {
    if (v8 >> 60 != 15)
    {
      v9 = *v7;
      sub_23D5AFA60(*v7, *((_QWORD *)a2 + 2));
      *(_QWORD *)(a1 + 8) = v9;
      *(_QWORD *)(a1 + 16) = v8;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v8 >> 60 == 15)
  {
    sub_23D63B5EC(a1 + 8);
LABEL_6:
    *v6 = *(_OWORD *)v7;
    goto LABEL_8;
  }
  v10 = *v7;
  sub_23D5AFA60(*v7, *((_QWORD *)a2 + 2));
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v10;
  *(_QWORD *)(a1 + 16) = v8;
  sub_23D5DDA20(v11, v12);
LABEL_8:
  v13 = *(int *)(a3 + 24);
  v14 = (uint64_t *)(a1 + v13);
  v15 = (uint64_t *)&v4[v13];
  v16 = (int *)type metadata accessor for UserKeyingInfo(0);
  v17 = *((_QWORD *)v16 - 1);
  v18 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v17 + 48);
  v19 = v18(v14, 1, v16);
  v20 = v18(v15, 1, v16);
  if (!v19)
  {
    if (v20)
    {
      sub_23D5E6950((uint64_t)v14, type metadata accessor for UserKeyingInfo);
      goto LABEL_14;
    }
    v99 = a3;
    v45 = *v15;
    v46 = v15[1];
    sub_23D5AFA60(*v15, v46);
    v47 = *v14;
    v48 = v14[1];
    *v14 = v45;
    v14[1] = v46;
    sub_23D5DDA20(v47, v48);
    v49 = v16[5];
    v50 = (char *)v14 + v49;
    v51 = (char *)v15 + v49;
    v52 = sub_23D66C210();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v52 - 8) + 24))(v50, v51, v52);
    v53 = v16[6];
    v54 = (char *)v14 + v53;
    v55 = (char *)v15 + v53;
    v56 = sub_23D66C2DC();
    v57 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v56 - 8) + 24);
    v57(v54, v55, v56);
    v58 = v16[7];
    v59 = (char *)v14 + v58;
    v60 = (char *)v15 + v58;
    v61 = sub_23D66C330();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v61 - 8) + 24))(v59, v60, v61);
    v57((char *)v14 + v16[8], (char *)v15 + v16[8], v56);
    *(uint64_t *)((char *)v14 + v16[9]) = *(uint64_t *)((char *)v15 + v16[9]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v62 = v16[10];
    v63 = (char *)v14 + v62;
    v64 = (char *)v15 + v62;
    v65 = sub_23D66C258();
    v66 = *(_QWORD *)(v65 - 8);
    v67 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v66 + 48);
    __dsta = v63;
    LODWORD(v63) = v67(v63, 1, v65);
    v68 = v67(v64, 1, v65);
    if ((_DWORD)v63)
    {
      if (!v68)
      {
        (*(void (**)(void *, char *, uint64_t))(v66 + 16))(__dsta, v64, v65);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v66 + 56))(__dsta, 0, 1, v65);
        goto LABEL_37;
      }
      v69 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256C79170) - 8) + 64);
      v70 = __dsta;
    }
    else
    {
      if (!v68)
      {
        (*(void (**)(void *, char *, uint64_t))(v66 + 24))(__dsta, v64, v65);
        goto LABEL_37;
      }
      (*(void (**)(void *, uint64_t))(v66 + 8))(__dsta, v65);
      v69 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256C79170) - 8) + 64);
      v70 = __dsta;
    }
    memcpy(v70, v64, v69);
LABEL_37:
    v87 = v16[11];
    v88 = (char *)v14 + v87;
    v89 = (char *)v15 + v87;
    v90 = sub_23D66C2AC();
    v91 = *(_QWORD *)(v90 - 8);
    v92 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v91 + 48);
    v93 = v92(v88, 1, v90);
    v94 = v92(v89, 1, v90);
    a3 = v99;
    if (v93)
    {
      if (!v94)
      {
        (*(void (**)(char *, char *, uint64_t))(v91 + 16))(v88, v89, v90);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v91 + 56))(v88, 0, 1, v90);
        goto LABEL_24;
      }
    }
    else
    {
      if (!v94)
      {
        (*(void (**)(char *, char *, uint64_t))(v91 + 24))(v88, v89, v90);
        goto LABEL_24;
      }
      (*(void (**)(char *, uint64_t))(v91 + 8))(v88, v90);
    }
    v42 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256C79120) - 8) + 64);
    v43 = (uint64_t *)v88;
    v44 = (uint64_t *)v89;
LABEL_15:
    memcpy(v43, v44, v42);
    goto LABEL_24;
  }
  if (v20)
  {
LABEL_14:
    v42 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256C79990) - 8) + 64);
    v43 = v14;
    v44 = v15;
    goto LABEL_15;
  }
  __src = v4;
  v98 = a3;
  v21 = *v15;
  v22 = v15[1];
  sub_23D5AFA60(*v15, v22);
  *v14 = v21;
  v14[1] = v22;
  v23 = v16[5];
  v24 = (char *)v14 + v23;
  v25 = (char *)v15 + v23;
  v26 = sub_23D66C210();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
  v27 = v16[6];
  v28 = (char *)v14 + v27;
  v29 = (char *)v15 + v27;
  v30 = sub_23D66C2DC();
  v31 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16);
  v31(v28, v29, v30);
  v32 = v16[7];
  v33 = (char *)v14 + v32;
  v34 = (char *)v15 + v32;
  v35 = sub_23D66C330();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 16))(v33, v34, v35);
  v31((char *)v14 + v16[8], (char *)v15 + v16[8], v30);
  *(uint64_t *)((char *)v14 + v16[9]) = *(uint64_t *)((char *)v15 + v16[9]);
  v36 = v16[10];
  __dst = (char *)v14 + v36;
  v37 = (char *)v15 + v36;
  v38 = sub_23D66C258();
  v39 = *(_QWORD *)(v38 - 8);
  v40 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
  swift_bridgeObjectRetain();
  if (v40(v37, 1, v38))
  {
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79170);
    memcpy(__dst, v37, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))(__dst, v37, v38);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(__dst, 0, 1, v38);
  }
  v71 = v16[11];
  v72 = (char *)v14 + v71;
  v73 = (char *)v15 + v71;
  v74 = sub_23D66C2AC();
  v75 = *(_QWORD *)(v74 - 8);
  v4 = __src;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v75 + 48))(v73, 1, v74))
  {
    v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79120);
    memcpy(v72, v73, *(_QWORD *)(*(_QWORD *)(v76 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v72, v73, v74);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v75 + 56))(v72, 0, 1, v74);
  }
  a3 = v98;
  (*(void (**)(uint64_t *, _QWORD, uint64_t, int *))(v17 + 56))(v14, 0, 1, v16);
LABEL_24:
  v77 = *(int *)(a3 + 28);
  v78 = (void *)(a1 + v77);
  v79 = &v4[v77];
  v80 = sub_23D66C330();
  v81 = *(_QWORD *)(v80 - 8);
  v82 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v81 + 48);
  v83 = v82(v78, 1, v80);
  v84 = v82(v79, 1, v80);
  if (!v83)
  {
    if (!v84)
    {
      (*(void (**)(void *, char *, uint64_t))(v81 + 24))(v78, v79, v80);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v81 + 8))(v78, v80);
    goto LABEL_29;
  }
  if (v84)
  {
LABEL_29:
    v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
    memcpy(v78, v79, *(_QWORD *)(*(_QWORD *)(v85 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, char *, uint64_t))(v81 + 16))(v78, v79, v80);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v81 + 56))(v78, 0, 1, v80);
  return a1;
}

uint64_t initializeWithTake for GroupMembership.MemberProperties(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = *(int *)(a3 + 24);
  v7 = (_OWORD *)(a1 + v6);
  v8 = (_OWORD *)(a2 + v6);
  v9 = (int *)type metadata accessor for UserKeyingInfo(0);
  v10 = *((_QWORD *)v9 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79990);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v44 = v10;
    *v7 = *v8;
    v12 = v9[5];
    v13 = (char *)v7 + v12;
    v14 = (char *)v8 + v12;
    v15 = sub_23D66C210();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
    v16 = v9[6];
    v17 = (char *)v7 + v16;
    v18 = (char *)v8 + v16;
    v19 = sub_23D66C2DC();
    v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32);
    v20(v17, v18, v19);
    v21 = v9[7];
    v22 = (char *)v7 + v21;
    v23 = (char *)v8 + v21;
    v24 = sub_23D66C330();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
    v20((char *)v7 + v9[8], (char *)v8 + v9[8], v19);
    *(_QWORD *)((char *)v7 + v9[9]) = *(_QWORD *)((char *)v8 + v9[9]);
    v25 = v9[10];
    v26 = (char *)v7 + v25;
    v27 = (char *)v8 + v25;
    v28 = sub_23D66C258();
    v29 = *(_QWORD *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
    {
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79170);
      memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v26, v27, v28);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
    }
    v31 = v9[11];
    v32 = (char *)v7 + v31;
    v33 = (char *)v8 + v31;
    v34 = sub_23D66C2AC();
    v35 = *(_QWORD *)(v34 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
    {
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79120);
      memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v32, v33, v34);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
    }
    (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v44 + 56))(v7, 0, 1, v9);
  }
  v37 = *(int *)(a3 + 28);
  v38 = (void *)(a1 + v37);
  v39 = (const void *)(a2 + v37);
  v40 = sub_23D66C330();
  v41 = *(_QWORD *)(v40 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v41 + 48))(v39, 1, v40))
  {
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v41 + 32))(v38, v39, v40);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
  }
  return a1;
}

uint64_t assignWithTake for GroupMembership.MemberProperties(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v6;
  _OWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  int *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t *, uint64_t, int *);
  int v17;
  int v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  void (*v49)(char *, char *, uint64_t);
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(char *, uint64_t, uint64_t);
  int v60;
  size_t v61;
  void *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t (*v74)(char *, uint64_t, uint64_t);
  int v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t (*v83)(void *, uint64_t, uint64_t);
  int v84;
  int v85;
  uint64_t v86;
  void *v88;
  uint64_t v89;
  uint64_t v90;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = (_OWORD *)(a1 + 8);
  v7 = (_OWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a1 + 16);
  if (v8 >> 60 == 15)
    goto LABEL_4;
  v9 = *(_QWORD *)(a2 + 16);
  if (v9 >> 60 == 15)
  {
    sub_23D63B5EC(a1 + 8);
LABEL_4:
    *v6 = *v7;
    goto LABEL_6;
  }
  v10 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)v7;
  *(_QWORD *)(a1 + 16) = v9;
  sub_23D5DDA20(v10, v8);
LABEL_6:
  v11 = *(int *)(a3 + 24);
  v12 = (uint64_t *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v14 = (int *)type metadata accessor for UserKeyingInfo(0);
  v15 = *((_QWORD *)v14 - 1);
  v16 = *(uint64_t (**)(uint64_t *, uint64_t, int *))(v15 + 48);
  v17 = v16(v12, 1, v14);
  v18 = v16(v13, 1, v14);
  if (!v17)
  {
    if (v18)
    {
      sub_23D5E6950((uint64_t)v12, type metadata accessor for UserKeyingInfo);
      goto LABEL_12;
    }
    v90 = a3;
    v39 = *v12;
    v40 = v12[1];
    *(_OWORD *)v12 = *(_OWORD *)v13;
    sub_23D5DDA20(v39, v40);
    v41 = v14[5];
    v42 = (char *)v12 + v41;
    v43 = (char *)v13 + v41;
    v44 = sub_23D66C210();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 40))(v42, v43, v44);
    v45 = v14[6];
    v46 = (char *)v12 + v45;
    v47 = (char *)v13 + v45;
    v48 = sub_23D66C2DC();
    v49 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v48 - 8) + 40);
    v49(v46, v47, v48);
    v50 = v14[7];
    v51 = (char *)v12 + v50;
    v52 = (char *)v13 + v50;
    v53 = sub_23D66C330();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v53 - 8) + 40))(v51, v52, v53);
    v49((char *)v12 + v14[8], (char *)v13 + v14[8], v48);
    *(uint64_t *)((char *)v12 + v14[9]) = *(uint64_t *)((char *)v13 + v14[9]);
    swift_bridgeObjectRelease();
    v54 = v14[10];
    v55 = (char *)v12 + v54;
    v56 = (char *)v13 + v54;
    v57 = sub_23D66C258();
    v58 = *(_QWORD *)(v57 - 8);
    v59 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v58 + 48);
    v88 = v55;
    LODWORD(v55) = v59(v55, 1, v57);
    v60 = v59(v56, 1, v57);
    if ((_DWORD)v55)
    {
      if (v60)
      {
        v61 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256C79170) - 8) + 64);
        v62 = v88;
LABEL_23:
        memcpy(v62, v56, v61);
        goto LABEL_26;
      }
      (*(void (**)(void *, char *, uint64_t))(v58 + 32))(v88, v56, v57);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v58 + 56))(v88, 0, 1, v57);
    }
    else
    {
      if (v60)
      {
        (*(void (**)(void *, uint64_t))(v58 + 8))(v88, v57);
        v61 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256C79170) - 8) + 64);
        v62 = v88;
        goto LABEL_23;
      }
      (*(void (**)(void *, char *, uint64_t))(v58 + 40))(v88, v56, v57);
    }
LABEL_26:
    v69 = v14[11];
    v70 = (char *)v12 + v69;
    v71 = (char *)v13 + v69;
    v72 = sub_23D66C2AC();
    v73 = *(_QWORD *)(v72 - 8);
    v74 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v73 + 48);
    v75 = v74(v70, 1, v72);
    v76 = v74(v71, 1, v72);
    if (v75)
    {
      if (!v76)
      {
        (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v70, v71, v72);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v73 + 56))(v70, 0, 1, v72);
LABEL_32:
        a3 = v90;
        goto LABEL_33;
      }
    }
    else
    {
      if (!v76)
      {
        (*(void (**)(char *, char *, uint64_t))(v73 + 40))(v70, v71, v72);
        goto LABEL_32;
      }
      (*(void (**)(char *, uint64_t))(v73 + 8))(v70, v72);
    }
    v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79120);
    memcpy(v70, v71, *(_QWORD *)(*(_QWORD *)(v77 - 8) + 64));
    goto LABEL_32;
  }
  if (v18)
  {
LABEL_12:
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79990);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    goto LABEL_33;
  }
  v89 = a3;
  *(_OWORD *)v12 = *(_OWORD *)v13;
  v19 = v14[5];
  v20 = (char *)v12 + v19;
  v21 = (char *)v13 + v19;
  v22 = sub_23D66C210();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
  v23 = v14[6];
  v24 = (char *)v12 + v23;
  v25 = (char *)v13 + v23;
  v26 = sub_23D66C2DC();
  v27 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 32);
  v27(v24, v25, v26);
  v28 = v14[7];
  v29 = (char *)v12 + v28;
  v30 = (char *)v13 + v28;
  v31 = sub_23D66C330();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v29, v30, v31);
  v27((char *)v12 + v14[8], (char *)v13 + v14[8], v26);
  *(uint64_t *)((char *)v12 + v14[9]) = *(uint64_t *)((char *)v13 + v14[9]);
  v32 = v14[10];
  v33 = (char *)v12 + v32;
  v34 = (char *)v13 + v32;
  v35 = sub_23D66C258();
  v36 = *(_QWORD *)(v35 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
  {
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79170);
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v33, v34, v35);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
  }
  v63 = v14[11];
  v64 = (char *)v12 + v63;
  v65 = (char *)v13 + v63;
  v66 = sub_23D66C2AC();
  v67 = *(_QWORD *)(v66 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v67 + 48))(v65, 1, v66))
  {
    v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79120);
    memcpy(v64, v65, *(_QWORD *)(*(_QWORD *)(v68 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v67 + 32))(v64, v65, v66);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v67 + 56))(v64, 0, 1, v66);
  }
  a3 = v89;
  (*(void (**)(uint64_t *, _QWORD, uint64_t, int *))(v15 + 56))(v12, 0, 1, v14);
LABEL_33:
  v78 = *(int *)(a3 + 28);
  v79 = (void *)(a1 + v78);
  v80 = (void *)(a2 + v78);
  v81 = sub_23D66C330();
  v82 = *(_QWORD *)(v81 - 8);
  v83 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v82 + 48);
  v84 = v83(v79, 1, v81);
  v85 = v83(v80, 1, v81);
  if (!v84)
  {
    if (!v85)
    {
      (*(void (**)(void *, void *, uint64_t))(v82 + 40))(v79, v80, v81);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v82 + 8))(v79, v81);
    goto LABEL_38;
  }
  if (v85)
  {
LABEL_38:
    v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
    memcpy(v79, v80, *(_QWORD *)(*(_QWORD *)(v86 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v82 + 32))(v79, v80, v81);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v82 + 56))(v79, 0, 1, v81);
  return a1;
}

uint64_t getEnumTagSinglePayload for GroupMembership.MemberProperties()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23D66B720(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 254)
  {
    v4 = *a1;
    if (v4 >= 2)
      return v4 - 1;
    else
      return 0;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79990);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 24);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 28);
    }
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for GroupMembership.MemberProperties()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_23D66B7CC(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 254)
  {
    *result = a2 + 1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C79990);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 24);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C799E0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 28);
    }
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

void sub_23D66B86C()
{
  unint64_t v0;
  unint64_t v1;

  sub_23D5F5B08(319, qword_256C7C720, (void (*)(uint64_t))type metadata accessor for UserKeyingInfo);
  if (v0 <= 0x3F)
  {
    sub_23D5F5B08(319, qword_256C7C678, (void (*)(uint64_t))MEMORY[0x24BDC6A60]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

id static GroupAccessInfoBlob.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_23D66C390();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_23D66B98C()
{
  return MEMORY[0x24BEE0948];
}

void sub_23D66B998(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_msgSend(*a1, sel_groupAccessInfo);
  if (v3)
  {
    v4 = v3;
    v5 = sub_23D66BD9C();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_23D66B9FC(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
    v3 = 0;
  else
    v3 = sub_23D66BD84();
  v4 = (id)v3;
  objc_msgSend(v2, sel_setGroupAccessInfo_);

}

void sub_23D66BA60(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256C7B588);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D618DEC(a1, (uint64_t)v6);
  v7 = *a2;
  v8 = sub_23D66BE20();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_23D66BDE4();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setGroupID_, v10);

}

uint64_t sub_23D66BB3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for GroupAccessInfoBlob();
  result = sub_23D66C648();
  *a1 = result;
  return result;
}

char *keypath_get_selector_groupAccessInfo()
{
  return sel_groupAccessInfo;
}

char *keypath_get_selector_version()
{
  return sel_version;
}

id sub_23D66BBAC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_version);
  *a2 = result;
  return result;
}

id sub_23D66BBDC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setVersion_, *a1);
}

uint64_t sub_23D66BBF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for GroupKitCryptoGroupBlob();
  result = sub_23D66C648();
  *a1 = result;
  return result;
}

uint64_t sub_23D66BC30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for GroupKitCryptoGroupSeed();
  result = sub_23D66C648();
  *a1 = result;
  return result;
}

uint64_t sub_23D66BC70()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_23D66BC7C()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_23D66BC88()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23D66BC94()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_23D66BCA0()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23D66BCAC()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23D66BCB8()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_23D66BCC4()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_23D66BCD0()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23D66BCDC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23D66BCE8()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_23D66BCF4()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23D66BD00()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23D66BD0C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23D66BD18()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_23D66BD24()
{
  return MEMORY[0x24BDCDBC8]();
}

uint64_t sub_23D66BD30()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_23D66BD3C()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_23D66BD48()
{
  return MEMORY[0x24BDCDC20]();
}

uint64_t sub_23D66BD54()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_23D66BD60()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_23D66BD6C()
{
  return MEMORY[0x24BDCDC58]();
}

uint64_t sub_23D66BD78()
{
  return MEMORY[0x24BDCDC68]();
}

uint64_t sub_23D66BD84()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23D66BD90()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_23D66BD9C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23D66BDA8()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_23D66BDB4()
{
  return MEMORY[0x24BDCDD40]();
}

uint64_t sub_23D66BDC0()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t sub_23D66BDCC()
{
  return MEMORY[0x24BDCDD88]();
}

uint64_t sub_23D66BDD8()
{
  return MEMORY[0x24BDCDE70]();
}

uint64_t sub_23D66BDE4()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_23D66BDF0()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23D66BDFC()
{
  return MEMORY[0x24BDCEA10]();
}

uint64_t sub_23D66BE08()
{
  return MEMORY[0x24BDCEA18]();
}

uint64_t sub_23D66BE14()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23D66BE20()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23D66BE2C()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_23D66BE38()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_23D66BE44()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_23D66BE50()
{
  return MEMORY[0x24BE5BF00]();
}

uint64_t sub_23D66BE5C()
{
  return MEMORY[0x24BE5BF08]();
}

uint64_t sub_23D66BE68()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t sub_23D66BE74()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_23D66BE80()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_23D66BE8C()
{
  return MEMORY[0x24BE5C008]();
}

uint64_t sub_23D66BE98()
{
  return MEMORY[0x24BE5C010]();
}

uint64_t sub_23D66BEA4()
{
  return MEMORY[0x24BE5C018]();
}

uint64_t sub_23D66BEB0()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t sub_23D66BEBC()
{
  return MEMORY[0x24BE5C078]();
}

uint64_t sub_23D66BEC8()
{
  return MEMORY[0x24BE5C080]();
}

uint64_t sub_23D66BED4()
{
  return MEMORY[0x24BE5C0A8]();
}

uint64_t sub_23D66BEE0()
{
  return MEMORY[0x24BE5C130]();
}

uint64_t sub_23D66BEEC()
{
  return MEMORY[0x24BE5C148]();
}

uint64_t sub_23D66BEF8()
{
  return MEMORY[0x24BE5C160]();
}

uint64_t sub_23D66BF04()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t sub_23D66BF10()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_23D66BF1C()
{
  return MEMORY[0x24BE5C1C0]();
}

uint64_t sub_23D66BF28()
{
  return MEMORY[0x24BE5C1C8]();
}

uint64_t sub_23D66BF34()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_23D66BF40()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t sub_23D66BF4C()
{
  return MEMORY[0x24BE5C1F0]();
}

uint64_t sub_23D66BF58()
{
  return MEMORY[0x24BE5C278]();
}

uint64_t sub_23D66BF64()
{
  return MEMORY[0x24BE5C280]();
}

uint64_t sub_23D66BF70()
{
  return MEMORY[0x24BE5C298]();
}

uint64_t sub_23D66BF7C()
{
  return MEMORY[0x24BE5C2F0]();
}

uint64_t sub_23D66BF88()
{
  return MEMORY[0x24BE5C300]();
}

uint64_t sub_23D66BF94()
{
  return MEMORY[0x24BE5C310]();
}

uint64_t sub_23D66BFA0()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t sub_23D66BFAC()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t sub_23D66BFB8()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t sub_23D66BFC4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23D66BFD0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23D66BFDC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23D66BFE8()
{
  return MEMORY[0x24BDC61A8]();
}

uint64_t sub_23D66BFF4()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_23D66C000()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t sub_23D66C00C()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t sub_23D66C018()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_23D66C024()
{
  return MEMORY[0x24BDC6380]();
}

uint64_t sub_23D66C030()
{
  return MEMORY[0x24BDC63A0]();
}

uint64_t sub_23D66C03C()
{
  return MEMORY[0x24BDC63B0]();
}

uint64_t sub_23D66C048()
{
  return MEMORY[0x24BDC63C0]();
}

uint64_t sub_23D66C054()
{
  return MEMORY[0x24BDC63E0]();
}

uint64_t sub_23D66C060()
{
  return MEMORY[0x24BDC64F0]();
}

uint64_t sub_23D66C06C()
{
  return MEMORY[0x24BDC6500]();
}

uint64_t sub_23D66C078()
{
  return MEMORY[0x24BDC6508]();
}

uint64_t sub_23D66C084()
{
  return MEMORY[0x24BDC6510]();
}

uint64_t sub_23D66C090()
{
  return MEMORY[0x24BDC6590]();
}

uint64_t sub_23D66C09C()
{
  return MEMORY[0x24BDC6598]();
}

uint64_t sub_23D66C0A8()
{
  return MEMORY[0x24BDC65B8]();
}

uint64_t sub_23D66C0B4()
{
  return MEMORY[0x24BDC65C8]();
}

uint64_t sub_23D66C0C0()
{
  return MEMORY[0x24BDC65D0]();
}

uint64_t sub_23D66C0CC()
{
  return MEMORY[0x24BDC65F8]();
}

uint64_t sub_23D66C0D8()
{
  return MEMORY[0x24BDC6600]();
}

uint64_t sub_23D66C0E4()
{
  return MEMORY[0x24BDC6608]();
}

uint64_t sub_23D66C0F0()
{
  return MEMORY[0x24BDC6620]();
}

uint64_t sub_23D66C0FC()
{
  return MEMORY[0x24BDC6628]();
}

uint64_t sub_23D66C108()
{
  return MEMORY[0x24BDC6638]();
}

uint64_t sub_23D66C114()
{
  return MEMORY[0x24BDC66B8]();
}

uint64_t sub_23D66C120()
{
  return MEMORY[0x24BDC66C8]();
}

uint64_t sub_23D66C12C()
{
  return MEMORY[0x24BDC66D8]();
}

uint64_t sub_23D66C138()
{
  return MEMORY[0x24BDC66E0]();
}

uint64_t sub_23D66C144()
{
  return MEMORY[0x24BDC6738]();
}

uint64_t sub_23D66C150()
{
  return MEMORY[0x24BDC6740]();
}

uint64_t sub_23D66C15C()
{
  return MEMORY[0x24BDC6760]();
}

uint64_t sub_23D66C168()
{
  return MEMORY[0x24BDC6770]();
}

uint64_t sub_23D66C174()
{
  return MEMORY[0x24BDC6788]();
}

uint64_t sub_23D66C180()
{
  return MEMORY[0x24BDC67B0]();
}

uint64_t sub_23D66C18C()
{
  return MEMORY[0x24BDC67B8]();
}

uint64_t sub_23D66C198()
{
  return MEMORY[0x24BDC67C8]();
}

uint64_t sub_23D66C1A4()
{
  return MEMORY[0x24BDC67E0]();
}

uint64_t sub_23D66C1B0()
{
  return MEMORY[0x24BDC6810]();
}

uint64_t sub_23D66C1BC()
{
  return MEMORY[0x24BDC6820]();
}

uint64_t sub_23D66C1C8()
{
  return MEMORY[0x24BDC6840]();
}

uint64_t sub_23D66C1D4()
{
  return MEMORY[0x24BDC6878]();
}

uint64_t sub_23D66C1E0()
{
  return MEMORY[0x24BDC68A0]();
}

uint64_t sub_23D66C1EC()
{
  return MEMORY[0x24BDC68A8]();
}

uint64_t sub_23D66C1F8()
{
  return MEMORY[0x24BDC68B0]();
}

uint64_t sub_23D66C204()
{
  return MEMORY[0x24BDC68B8]();
}

uint64_t sub_23D66C210()
{
  return MEMORY[0x24BDC68D0]();
}

uint64_t sub_23D66C21C()
{
  return MEMORY[0x24BDC68F0]();
}

uint64_t sub_23D66C228()
{
  return MEMORY[0x24BDC68F8]();
}

uint64_t sub_23D66C234()
{
  return MEMORY[0x24BDC6910]();
}

uint64_t sub_23D66C240()
{
  return MEMORY[0x24BDC6918]();
}

uint64_t sub_23D66C24C()
{
  return MEMORY[0x24BDC6940]();
}

uint64_t sub_23D66C258()
{
  return MEMORY[0x24BDC6968]();
}

uint64_t sub_23D66C264()
{
  return MEMORY[0x24BDC6980]();
}

uint64_t sub_23D66C270()
{
  return MEMORY[0x24BDC6988]();
}

uint64_t sub_23D66C27C()
{
  return MEMORY[0x24BDC6990]();
}

uint64_t sub_23D66C288()
{
  return MEMORY[0x24BDC69A8]();
}

uint64_t sub_23D66C294()
{
  return MEMORY[0x24BDC69B0]();
}

uint64_t sub_23D66C2A0()
{
  return MEMORY[0x24BDC69C0]();
}

uint64_t sub_23D66C2AC()
{
  return MEMORY[0x24BDC69D0]();
}

uint64_t sub_23D66C2B8()
{
  return MEMORY[0x24BDC69E0]();
}

uint64_t sub_23D66C2C4()
{
  return MEMORY[0x24BDC69E8]();
}

uint64_t sub_23D66C2D0()
{
  return MEMORY[0x24BDC69F0]();
}

uint64_t sub_23D66C2DC()
{
  return MEMORY[0x24BDC6A00]();
}

uint64_t sub_23D66C2E8()
{
  return MEMORY[0x24BDC6A10]();
}

uint64_t sub_23D66C2F4()
{
  return MEMORY[0x24BDC6A18]();
}

uint64_t sub_23D66C300()
{
  return MEMORY[0x24BDC6A38]();
}

uint64_t sub_23D66C30C()
{
  return MEMORY[0x24BDC6A48]();
}

uint64_t sub_23D66C318()
{
  return MEMORY[0x24BDC6A50]();
}

uint64_t sub_23D66C324()
{
  return MEMORY[0x24BDC6A58]();
}

uint64_t sub_23D66C330()
{
  return MEMORY[0x24BDC6A60]();
}

uint64_t sub_23D66C33C()
{
  return MEMORY[0x24BDC6AD8]();
}

uint64_t sub_23D66C348()
{
  return MEMORY[0x24BDC6AF0]();
}

uint64_t sub_23D66C354()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_23D66C360()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23D66C36C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23D66C378()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23D66C384()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23D66C390()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23D66C39C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23D66C3A8()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23D66C3B4()
{
  return MEMORY[0x24BDCFB30]();
}

uint64_t sub_23D66C3C0()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_23D66C3CC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23D66C3D8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23D66C3E4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23D66C3F0()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_23D66C3FC()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_23D66C408()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_23D66C414()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_23D66C420()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_23D66C42C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23D66C438()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23D66C444()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_23D66C450()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_23D66C45C()
{
  return MEMORY[0x24BEE0EF0]();
}

uint64_t sub_23D66C468()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23D66C474()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t sub_23D66C480()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t sub_23D66C48C()
{
  return MEMORY[0x24BEE1078]();
}

uint64_t sub_23D66C498()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23D66C4A4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23D66C4B0()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_23D66C4BC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23D66C4C8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23D66C4D4()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23D66C4E0()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23D66C4EC()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_23D66C4F8()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_23D66C504()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23D66C510()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_23D66C51C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_23D66C528()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23D66C534()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23D66C540()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_23D66C54C()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_23D66C558()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_23D66C564()
{
  return MEMORY[0x24BDCFE28]();
}

uint64_t sub_23D66C570()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23D66C57C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23D66C588()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23D66C594()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23D66C5A0()
{
  return MEMORY[0x24BDBB390]();
}

uint64_t sub_23D66C5AC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23D66C5B8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23D66C5C4()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_23D66C5D0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23D66C5DC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23D66C5E8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23D66C5F4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23D66C600()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_23D66C60C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23D66C618()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23D66C624()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23D66C630()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23D66C63C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23D66C648()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_23D66C654()
{
  return MEMORY[0x24BEE2610]();
}

uint64_t sub_23D66C660()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23D66C66C()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23D66C678()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23D66C684()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23D66C690()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23D66C69C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23D66C6A8()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_23D66C6B4()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_23D66C6C0()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_23D66C6CC()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_23D66C6D8()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23D66C6E4()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_23D66C6F0()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_23D66C6FC()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_23D66C708()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_23D66C714()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23D66C720()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23D66C72C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23D66C738()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23D66C744()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23D66C750()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_23D66C75C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23D66C768()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23D66C774()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23D66C780()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23D66C78C()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23D66C798()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23D66C7A4()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23D66C7B0()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23D66C7BC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23D66C7C8()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23D66C7D4()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_23D66C7E0()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23D66C7EC()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23D66C7F8()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23D66C804()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23D66C810()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23D66C81C()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_23D66C828()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_23D66C834()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23D66C840()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23D66C84C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23D66C858()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t sub_23D66C864()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_23D66C870()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23D66C87C()
{
  return MEMORY[0x24BEE3E18]();
}

uint64_t sub_23D66C888()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23D66C894()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23D66C8A0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23D66C8AC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23D66C8B8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23D66C8C4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23D66C8D0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23D66C8DC()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_23D66C8E8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23D66C8F4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23D66C900()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23D66C90C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23D66C918()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23D66C924()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23D66C930()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23D66C93C()
{
  return MEMORY[0x24BEE4A10]();
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

uint64_t PCSIdentitySetCreate()
{
  return MEMORY[0x24BE7ADE0]();
}

uint64_t PCSIdentitySetCreateManatee()
{
  return MEMORY[0x24BE7ADE8]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x24BDE89F0](*(_QWORD *)&status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x24BDE8CC8](rnd, count, bytes);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _PCSIdentityGetKey()
{
  return MEMORY[0x24BE7AE58]();
}

uint64_t _PCSIdentityGetSigningIdentity()
{
  return MEMORY[0x24BE7AE60]();
}

uint64_t _PCSKeyCopyExportedPrivateKey()
{
  return MEMORY[0x24BE7AE68]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x24BEE4C90]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x24BEE4E80]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x24BDB0260](__b1, __b2, __len);
}


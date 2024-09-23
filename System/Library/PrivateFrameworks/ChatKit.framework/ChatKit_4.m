_QWORD *sub_18E723020(void *a1)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD *result;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void (*v36)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v37;
  uint64_t v38;
  _QWORD *v39;
  unsigned int v40;
  unint64_t v41;
  id v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  _QWORD *v55;
  unint64_t v56;
  int64_t v57;
  char *v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  _QWORD *v62;
  unint64_t v63;
  int64_t v64;
  _QWORD *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  int64_t v88;
  int64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  _QWORD *v93;
  unint64_t v94;
  int64_t v95;
  _QWORD *v96;
  uint64_t v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  unsigned int (*v104)(uint64_t, uint64_t, uint64_t);
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  unint64_t v110;
  void (*v111)(char *, uint64_t);
  id v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  id v117;
  void *v118;
  void *v119;
  unint64_t v120;
  unint64_t v121;
  unint64_t v122;
  _QWORD *v123;
  unint64_t v124;
  unint64_t v125;
  id v126;
  _QWORD *v127;
  unint64_t v128;
  unint64_t v129;
  _QWORD *v130;
  int64_t v131;
  int64_t v132;
  char *v133;
  uint64_t v134;
  unsigned int (*v135)(char *, uint64_t, uint64_t);
  id v136;
  id v137;
  void (*v138)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v139;
  uint64_t v140;
  id v141;
  uint64_t v142;
  char *v143;
  id v144;
  char *v145;
  char *v146;
  char *v147;
  char v148[32];
  id v149;
  unint64_t v150;

  v2 = sub_18E7661A0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v133 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0FBD30);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v133 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v133 - v10;
  MEMORY[0x1E0C80A78](v12);
  v147 = (char *)&v133 - v13;
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v133 - v15;
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v133 - v18;
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v133 - v21;
  objc_opt_self();
  v23 = swift_dynamicCastObjCClass();
  if (!v23)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  v24 = (void *)v23;
  v145 = v16;
  v146 = v11;
  v25 = a1;
  v26 = objc_msgSend(v24, sel_IMChatItem);
  if (!v26)
  {
LABEL_8:

    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v27 = v26;
  v143 = v8;
  v28 = objc_msgSend(v26, sel_dataSource);
  if (!v28)
  {

    goto LABEL_8;
  }
  v29 = v28;
  result = objc_msgSend(v28, sel_bundleID);
  if (result)
  {
    v31 = result;
    v141 = (id)sub_18E768984();
    v33 = v32;

    v149 = 0;
    v150 = 0xE000000000000000;
    v34 = objc_msgSend(v29, "url");
    if (v34)
    {
      v35 = v34;
      sub_18E76617C();

      v36 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
      v37 = v19;
      v38 = 0;
    }
    else
    {
      v36 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
      v37 = v19;
      v38 = 1;
    }
    v138 = v36;
    v36((uint64_t)v37, v38, 1, v2);
    v142 = 7104878;
    sub_18E57272C((uint64_t)v19, (uint64_t)v22);
    v135 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
    v40 = v135(v22, 1, v2);
    v134 = v3;
    if (v40 == 1)
    {
      sub_18E57F2EC((uint64_t)v22);
    }
    else
    {
      sub_18E766140();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v22, v2);
    }
    sub_18E768A14();
    swift_bridgeObjectRelease();
    v42 = v149;
    v41 = v150;
    v43 = objc_msgSend(v29, sel_wantsStatusItem);
    v44 = 1702195828;
    if (!v43)
      v44 = 0x65736C6166;
    v140 = v44;
    if (v43)
      v45 = 0xE400000000000000;
    else
      v45 = 0xE500000000000000;
    v46 = objc_msgSend(v29, sel_attachmentGUIDs);
    v144 = v29;
    v136 = v27;
    v137 = v25;
    v139 = v2;
    v133 = v5;
    if (v46)
    {
      v47 = v46;
      v48 = sub_18E768AE0();

    }
    else
    {
      v48 = 0;
    }
    v149 = (id)v48;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1119B0);
    v49 = sub_18E7689A8();
    v51 = v50;
    v39 = sub_18E518CCC(0, 4, 1, MEMORY[0x1E0DEE9D8]);
    v52 = v39[2];
    v53 = v39[3];
    v54 = v52 + 1;
    sub_18E7669BC();
    if (v52 >= v53 >> 1)
      v39 = sub_18E518CCC((_QWORD *)(v53 > 1), v52 + 1, 1, v39);
    v39[2] = v54;
    v55 = &v39[4 * v52];
    v55[4] = 0xD000000000000013;
    v55[5] = 0x800000018E81C250;
    v55[6] = v141;
    v55[7] = v33;
    v56 = v39[3];
    v57 = v52 + 2;
    sub_18E7669BC();
    if (v54 >= v56 >> 1)
      v39 = sub_18E518CCC((_QWORD *)(v56 > 1), v57, 1, v39);
    v39[2] = v57;
    v58 = (char *)&v39[4 * v54];
    strcpy(v58 + 32, "dataSource.url");
    v58[47] = -18;
    *((_QWORD *)v58 + 6) = v42;
    *((_QWORD *)v58 + 7) = v41;
    v59 = v39[2];
    v60 = v39[3];
    v61 = v59 + 1;
    sub_18E7669BC();
    if (v59 >= v60 >> 1)
      v39 = sub_18E518CCC((_QWORD *)(v60 > 1), v59 + 1, 1, v39);
    v39[2] = v61;
    v62 = &v39[4 * v59];
    v62[4] = 0xD00000000000001ALL;
    v62[5] = 0x800000018E81C270;
    v62[6] = v140;
    v62[7] = v45;
    v63 = v39[3];
    v64 = v59 + 2;
    sub_18E7669BC();
    if (v61 >= v63 >> 1)
      v39 = sub_18E518CCC((_QWORD *)(v63 > 1), v64, 1, v39);
    v39[2] = v64;
    v65 = &v39[4 * v61];
    v65[4] = 0xD000000000000017;
    v65[5] = 0x800000018E81C290;
    v65[6] = v49;
    v65[7] = v51;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v66 = v144;
    v67 = objc_msgSend(v144, sel_pluginPayload);
    if (!v67)
    {
      v73 = v138;
      v72 = v139;
      goto LABEL_52;
    }
    v68 = v67;
    v69 = objc_msgSend(v67, sel_attachments);
    if (v69)
    {
      v70 = v69;
      v71 = sub_18E768AE0();

    }
    else
    {
      v71 = MEMORY[0x1E0DEE9D8];
    }
    v74 = *(_QWORD *)(v71 + 16);
    v141 = v68;
    if (v74)
    {
      v75 = v71 + 32;
      sub_18E7669BC();
      v76 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      do
      {
        sub_18E00F118(v75, (uint64_t)&v149);
        sub_18E00F118((uint64_t)&v149, (uint64_t)v148);
        v77 = sub_18E7689A8();
        v79 = v78;
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v149);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v76 = sub_18E517EA8(0, v76[2] + 1, 1, v76);
        v81 = v76[2];
        v80 = v76[3];
        if (v81 >= v80 >> 1)
          v76 = sub_18E517EA8((_QWORD *)(v80 > 1), v81 + 1, 1, v76);
        v76[2] = v81 + 1;
        v82 = &v76[2 * v81];
        v82[4] = v77;
        v82[5] = v79;
        v75 += 32;
        --v74;
      }
      while (v74);
      swift_bridgeObjectRelease_n();
      v66 = v144;
      v68 = v141;
    }
    else
    {
      swift_bridgeObjectRelease();
      v76 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    v149 = objc_msgSend(v68, sel_text, v133);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1119B8);
    v73 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_18E7689A8();
    v84 = v83;
    v149 = v76;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0F4FF0);
    sub_18E724940();
    v85 = sub_18E7688C4();
    v87 = v86;
    swift_bridgeObjectRelease();
    v88 = v39[2];
    v89 = v88 + 2;
    if (__OFADD__(v88, 2))
    {
      __break(1u);
      goto LABEL_79;
    }
    if (v89 > v39[3] >> 1)
      goto LABEL_80;
    while (1)
    {
      v90 = v39[2];
      v91 = v39[3];
      v92 = v90 + 1;
      sub_18E7669BC();
      if (v90 >= v91 >> 1)
        v39 = sub_18E518CCC((_QWORD *)(v91 > 1), v90 + 1, 1, v39);
      v39[2] = v92;
      v93 = &v39[4 * v90];
      v93[4] = 0xD000000000000012;
      v93[5] = 0x800000018E81C310;
      v93[6] = v73;
      v93[7] = v84;
      v94 = v39[3];
      v95 = v90 + 2;
      sub_18E7669BC();
      if (v92 >= v94 >> 1)
        v39 = sub_18E518CCC((_QWORD *)(v94 > 1), v95, 1, v39);
      v73 = v138;
      v72 = v139;
      v39[2] = v95;
      v96 = &v39[4 * v92];
      v96[4] = 0xD000000000000019;
      v96[5] = 0x800000018E81C330;
      v96[6] = v85;
      v96[7] = v87;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_52:
      v97 = (uint64_t)v146;
      v85 = (uint64_t)v143;
      v98 = objc_msgSend(v66, sel_richLinkMetadata, v133);
      if (!v98)
      {

        return v39;
      }
      v99 = v98;
      v100 = objc_msgSend(v98, sel_URL);
      if (v100)
      {
        v101 = v100;
        v102 = (uint64_t)v147;
        sub_18E76617C();

        v103 = 0;
      }
      else
      {
        v103 = 1;
        v102 = (uint64_t)v147;
      }
      v104 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v135;
      v73(v102, v103, 1, v72);
      v105 = (uint64_t)v145;
      sub_18E57272C(v102, (uint64_t)v145);
      if (v104(v105, 1, v72))
      {
        sub_18E57F2EC(v105);
        v106 = 0xE300000000000000;
        v107 = 7104878;
      }
      else
      {
        v108 = v134;
        v109 = v133;
        (*(void (**)(char *, uint64_t, uint64_t))(v134 + 16))(v133, v105, v72);
        sub_18E57F2EC(v105);
        v107 = sub_18E766140();
        v106 = v110;
        v111 = *(void (**)(char *, uint64_t))(v108 + 8);
        v104 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v135;
        v111(v109, v72);
      }
      v112 = objc_msgSend(v99, sel_originalURL);
      if (v112)
      {
        v113 = v112;
        sub_18E76617C();

        v114 = 0;
      }
      else
      {
        v114 = 1;
      }
      v73(v85, v114, 1, v72);
      sub_18E57272C(v85, v97);
      if (v104(v97, 1, v72))
      {
        sub_18E57F2EC(v97);
        v87 = 0xE300000000000000;
        v84 = 7104878;
      }
      else
      {
        v115 = v134;
        v85 = (uint64_t)v133;
        (*(void (**)(char *, uint64_t, uint64_t))(v134 + 16))(v133, v97, v72);
        sub_18E57F2EC(v97);
        v84 = sub_18E766140();
        v87 = v116;
        (*(void (**)(uint64_t, uint64_t))(v115 + 8))(v85, v72);
      }
      v117 = objc_msgSend(v99, sel_title);
      if (v117)
      {
        v118 = v117;
        v142 = sub_18E768984();
        v66 = v119;

      }
      else
      {
        v66 = (id)0xE300000000000000;
      }
      v88 = v39[2];
      v89 = v88 + 3;
      if (!__OFADD__(v88, 3))
        break;
LABEL_79:
      __break(1u);
LABEL_80:
      if (v88 <= v89)
        v131 = v89;
      else
        v131 = v88;
      v39 = sub_18E518CCC((_QWORD *)1, v131, 1, v39);
    }
    if (v89 > v39[3] >> 1)
    {
      if (v88 <= v89)
        v132 = v88 + 3;
      else
        v132 = v39[2];
      v39 = sub_18E518CCC((_QWORD *)1, v132, 1, v39);
    }
    v120 = v39[2];
    v121 = v39[3];
    v122 = v120 + 1;
    sub_18E7669BC();
    if (v120 >= v121 >> 1)
      v39 = sub_18E518CCC((_QWORD *)(v121 > 1), v120 + 1, 1, v39);
    v39[2] = v122;
    v123 = &v39[4 * v120];
    v123[4] = 0xD000000000000010;
    v123[5] = 0x800000018E81C2B0;
    v123[6] = v107;
    v123[7] = v106;
    v124 = v39[3];
    v125 = v120 + 2;
    sub_18E7669BC();
    if (v122 >= v124 >> 1)
      v39 = sub_18E518CCC((_QWORD *)(v124 > 1), v120 + 2, 1, v39);
    v126 = v144;
    v39[2] = v125;
    v127 = &v39[4 * v122];
    v127[4] = 0xD000000000000018;
    v127[5] = 0x800000018E81C2D0;
    v127[6] = v84;
    v127[7] = v87;
    v128 = v39[2];
    v129 = v39[3];
    sub_18E7669BC();
    if (v128 >= v129 >> 1)
      v39 = sub_18E518CCC((_QWORD *)(v129 > 1), v128 + 1, 1, v39);
    v39[2] = v128 + 1;
    v130 = &v39[4 * v128];
    v130[4] = 0xD000000000000012;
    v130[5] = 0x800000018E81C2F0;
    v130[6] = v142;
    v130[7] = v66;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v39;
  }
  __break(1u);
  return result;
}

uint64_t sub_18E723C50(void *a1)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  id v40;
  unint64_t v41;
  const char *v42;
  unint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  id v51;
  id v52;
  unint64_t v53;
  id v54;
  unint64_t v55;
  id v56;
  unint64_t v57;
  id v58;
  id v59;
  void *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  _QWORD *v86;
  id v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  _QWORD *v91;
  id v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  _QWORD *v108;
  id v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  _QWORD *v113;
  id v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  _QWORD *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  _QWORD *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unsigned int (*v129)(char *, uint64_t, uint64_t);
  uint64_t v130;
  uint64_t v131;
  _QWORD v132[2];
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  char *v138;
  id v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  id ObjectType;
  unint64_t v145;

  v2 = sub_18E7662C0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v129 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0FBD30);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v129 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v129 - v10;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v129 - v13;
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v129 - v16;
  objc_opt_self();
  v18 = swift_dynamicCastObjCClass();
  if (!v18)
    return MEMORY[0x1E0DEE9D8];
  v19 = (void *)v18;
  v141 = v3;
  v139 = a1;
  v20 = objc_msgSend(v19, sel_transferGUID);
  v21 = sub_18E768984();
  v135 = v22;
  v136 = v21;

  v23 = objc_msgSend(v19, sel_mediaObject);
  ObjectType = (id)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE111998);
  v24 = sub_18E7689A8();
  v133 = v25;
  v134 = v24;
  if (objc_msgSend(v23, sel_balloonViewClass))
  {
    ObjectType = (id)swift_getObjCClassMetadata();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10AFB8);
    v132[0] = sub_18E7689A8();
    v132[1] = v26;
  }
  else
  {
    BYTE5(v132[1]) = 0;
    HIWORD(v132[1]) = -5120;
    strcpy((char *)v132, "{ unknown }}");
  }
  v142 = v2;
  v28 = objc_msgSend(v23, sel_fileURL);
  if (v28)
  {
    v29 = v28;
    sub_18E76617C();

    v30 = sub_18E7661A0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v14, 0, 1, v30);
  }
  else
  {
    v30 = sub_18E7661A0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v14, 1, 1, v30);
  }
  v137 = v8;
  v138 = v11;
  sub_18E57272C((uint64_t)v14, (uint64_t)v17);
  sub_18E7661A0();
  v31 = *(_QWORD *)(v30 - 8);
  v129 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48);
  if (v129(v17, 1, v30) == 1)
  {
    sub_18E57F2EC((uint64_t)v17);
    v32 = 0xE300000000000000;
    v33 = 7104878;
  }
  else
  {
    v33 = sub_18E766140();
    v32 = v34;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v17, v30);
  }
  v140 = v5;
  v35 = objc_msgSend(v23, sel_UTIType);
  v130 = v31;
  if (v35)
  {
    v36 = v35;
    v37 = sub_18E768984();
    v39 = v38;

  }
  else
  {
    v37 = 0;
    v39 = 0;
  }
  v40 = objc_msgSend(v23, sel_commSafetySensitive);
  v143 = v23;
  v131 = v30;
  if (v40)
  {
    if (v40 == (id)2)
    {
      v41 = 0xD000000000000016;
      v42 = ".isSensitiveIsViewable";
    }
    else if (v40 == (id)1)
    {
      v41 = 0xD000000000000017;
      v42 = ".isSensitiveNotViewable";
    }
    else
    {
      v41 = 0xD000000000000012;
      v42 = "{ unhandled case }";
    }
    v43 = (unint64_t)(v42 - 32) | 0x8000000000000000;
  }
  else
  {
    v43 = 0xED00006576697469;
    v41 = 0x736E6553746F6E2ELL;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE108628);
  v44 = swift_allocObject();
  v45 = (_QWORD *)v44;
  *(_OWORD *)(v44 + 16) = xmmword_18E7DDE20;
  strcpy((char *)(v44 + 32), "transferGUID");
  *(_BYTE *)(v44 + 45) = 0;
  *(_WORD *)(v44 + 46) = -5120;
  v46 = v135;
  *(_QWORD *)(v44 + 48) = v136;
  *(_QWORD *)(v44 + 56) = v46;
  *(_QWORD *)(v44 + 64) = 0xD000000000000014;
  *(_QWORD *)(v44 + 72) = 0x800000018E81C040;
  v47 = v133;
  *(_QWORD *)(v44 + 80) = v134;
  *(_QWORD *)(v44 + 88) = v47;
  *(_QWORD *)(v44 + 96) = 0xD000000000000014;
  *(_QWORD *)(v44 + 104) = 0x800000018E81C060;
  v48 = v132[1];
  *(_QWORD *)(v44 + 112) = v132[0];
  *(_QWORD *)(v44 + 120) = v48;
  *(_QWORD *)(v44 + 128) = 0x4C5255656C6966;
  *(_QWORD *)(v44 + 136) = 0xE700000000000000;
  *(_QWORD *)(v44 + 144) = v33;
  *(_QWORD *)(v44 + 152) = v32;
  v49 = 0x6E776F6E6B6E757BLL;
  if (v39)
    v49 = v37;
  v50 = 0xE90000000000007DLL;
  if (v39)
    v50 = v39;
  *(_QWORD *)(v44 + 160) = 0x65707954697475;
  *(_QWORD *)(v44 + 168) = 0xE700000000000000;
  *(_QWORD *)(v44 + 176) = v49;
  *(_QWORD *)(v44 + 184) = v50;
  strcpy((char *)(v44 + 192), "sensitiveState");
  *(_BYTE *)(v44 + 207) = -18;
  *(_QWORD *)(v44 + 208) = v41;
  *(_QWORD *)(v44 + 216) = v43;
  ObjectType = 0;
  v145 = 0xE000000000000000;
  v51 = v143;
  objc_msgSend(v143, sel_generatePreviewOutOfProcess);
  sub_18E768A14();
  swift_bridgeObjectRelease();
  v52 = ObjectType;
  v53 = v145;
  v45[28] = 0xD00000000000001BLL;
  v45[29] = 0x800000018E81C080;
  v45[30] = v52;
  v45[31] = v53;
  ObjectType = 0;
  v145 = 0xE000000000000000;
  objc_msgSend(v51, sel_shouldSuppressPreview);
  sub_18E768A14();
  swift_bridgeObjectRelease();
  v54 = ObjectType;
  v55 = v145;
  v45[32] = 0xD000000000000015;
  v45[33] = 0x800000018E81C0A0;
  v45[34] = v54;
  v45[35] = v55;
  ObjectType = 0;
  v145 = 0xE000000000000000;
  objc_msgSend(v51, sel_forceInlinePreviewGeneration);
  sub_18E768A14();
  swift_bridgeObjectRelease();
  v56 = ObjectType;
  v57 = v145;
  v58 = v51;
  v45[36] = 0xD00000000000001CLL;
  v45[37] = 0x800000018E81C0C0;
  v45[38] = v56;
  v45[39] = v57;
  v59 = objc_msgSend(v51, sel_previewFilenameExtension);
  if (v59)
  {
    v60 = v59;
    v61 = sub_18E768984();
    v63 = v62;

  }
  else
  {
    v61 = 0;
    v63 = 0;
  }
  v65 = (uint64_t)v137;
  v64 = (uint64_t)v138;
  v66 = v131;
  ObjectType = (id)v61;
  v145 = v63;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE109800);
  v67 = sub_18E7689A8();
  v45[40] = 0xD000000000000020;
  v45[41] = 0x800000018E81C0E0;
  v45[42] = v67;
  v45[43] = v68;
  v69 = objc_msgSend(v51, sel_transfer);
  if (v69)
  {
    v70 = v69;
    v71 = objc_msgSend(v69, sel_fileURL);
    if (v71)
    {
      v72 = v71;
      sub_18E76617C();

      v73 = 0;
    }
    else
    {
      v73 = 1;
    }
    v79 = v130;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v130 + 56))(v65, v73, 1, v66);
    sub_18E57272C(v65, v64);
    if (v129((char *)v64, 1, v66) == 1)
    {
      sub_18E57F2EC(v64);
      v80 = 0xE300000000000000;
      v81 = 7104878;
    }
    else
    {
      v81 = sub_18E766140();
      v82 = v79;
      v80 = v83;
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v64, v66);
    }
    v85 = v45[2];
    v84 = v45[3];
    if (v85 >= v84 >> 1)
      v45 = sub_18E518CCC((_QWORD *)(v84 > 1), v85 + 1, 1, v45);
    v45[2] = v85 + 1;
    v86 = &v45[4 * v85];
    v86[4] = 0xD000000000000014;
    v86[5] = 0x800000018E81C110;
    v86[6] = v81;
    v86[7] = v80;
    ObjectType = 0;
    v145 = 0xE000000000000000;
    objc_msgSend(v70, sel_isDownloadable);
    sub_18E768A14();
    swift_bridgeObjectRelease();
    v87 = ObjectType;
    v88 = v145;
    v90 = v45[2];
    v89 = v45[3];
    if (v90 >= v89 >> 1)
      v45 = sub_18E518CCC((_QWORD *)(v89 > 1), v90 + 1, 1, v45);
    v45[2] = v90 + 1;
    v91 = &v45[4 * v90];
    v91[4] = 0xD00000000000001BLL;
    v91[5] = 0x800000018E81C130;
    v91[6] = v87;
    v91[7] = v88;
    ObjectType = 0;
    v145 = 0xE000000000000000;
    objc_msgSend(v70, sel_isDownloading);
    sub_18E768A14();
    swift_bridgeObjectRelease();
    v92 = ObjectType;
    v93 = v145;
    v95 = v45[2];
    v94 = v45[3];
    if (v95 >= v94 >> 1)
      v45 = sub_18E518CCC((_QWORD *)(v94 > 1), v95 + 1, 1, v45);
    v45[2] = v95 + 1;
    v96 = &v45[4 * v95];
    v96[4] = 0xD00000000000001ALL;
    v96[5] = 0x800000018E81C150;
    v96[6] = v92;
    v96[7] = v93;
    ObjectType = objc_msgSend(v70, sel_currentBytes);
    v97 = sub_18E7693D4();
    v99 = v98;
    v101 = v45[2];
    v100 = v45[3];
    if (v101 >= v100 >> 1)
      v45 = sub_18E518CCC((_QWORD *)(v100 > 1), v101 + 1, 1, v45);
    v45[2] = v101 + 1;
    v102 = &v45[4 * v101];
    v102[4] = 0xD000000000000019;
    v102[5] = 0x800000018E81C170;
    v102[6] = v97;
    v102[7] = v99;
    ObjectType = objc_msgSend(v70, sel_totalBytes);
    v103 = sub_18E7693D4();
    v105 = v104;
    v107 = v45[2];
    v106 = v45[3];
    if (v107 >= v106 >> 1)
      v45 = sub_18E518CCC((_QWORD *)(v106 > 1), v107 + 1, 1, v45);
    v45[2] = v107 + 1;
    v108 = &v45[4 * v107];
    v108[4] = 0xD000000000000017;
    v108[5] = 0x800000018E81C190;
    v108[6] = v103;
    v108[7] = v105;
    ObjectType = 0;
    v145 = 0xE000000000000000;
    objc_msgSend(v70, sel_isThumbnail);
    sub_18E768A14();
    swift_bridgeObjectRelease();
    v109 = ObjectType;
    v110 = v145;
    v112 = v45[2];
    v111 = v45[3];
    if (v112 >= v111 >> 1)
      v45 = sub_18E518CCC((_QWORD *)(v111 > 1), v112 + 1, 1, v45);
    v45[2] = v112 + 1;
    v113 = &v45[4 * v112];
    v113[4] = 0xD000000000000018;
    v113[5] = 0x800000018E81C1B0;
    v113[6] = v109;
    v113[7] = v110;
    ObjectType = 0;
    v145 = 0xE000000000000000;
    objc_msgSend(v70, sel_isFromMomentShare);
    sub_18E768A14();
    swift_bridgeObjectRelease();
    v114 = ObjectType;
    v115 = v145;
    v117 = v45[2];
    v116 = v45[3];
    if (v117 >= v116 >> 1)
      v45 = sub_18E518CCC((_QWORD *)(v116 > 1), v117 + 1, 1, v45);
    v45[2] = v117 + 1;
    v118 = &v45[4 * v117];
    v118[4] = 0xD00000000000001ELL;
    v118[5] = 0x800000018E81C1D0;
    v118[6] = v114;
    v118[7] = v115;
    ObjectType = objc_msgSend(v70, sel_error);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1119A8);
    v119 = sub_18E7689A8();
    v121 = v120;
    v123 = v45[2];
    v122 = v45[3];
    if (v123 >= v122 >> 1)
      v45 = sub_18E518CCC((_QWORD *)(v122 > 1), v123 + 1, 1, v45);
    v45[2] = v123 + 1;
    v124 = &v45[4 * v123];
    v124[4] = 0xD000000000000012;
    v124[5] = 0x800000018E81C1F0;
    v124[6] = v119;
    v124[7] = v121;
    swift_unknownObjectRelease();
    v76 = v142;
    v58 = v143;
    v77 = v140;
  }
  else
  {
    v75 = v45[2];
    v74 = v45[3];
    if (v75 >= v74 >> 1)
      v45 = sub_18E518CCC((_QWORD *)(v74 > 1), v75 + 1, 1, v45);
    v76 = v142;
    v77 = v140;
    v45[2] = v75 + 1;
    v78 = (char *)&v45[4 * v75];
    strcpy(v78 + 32, "fileTransfer");
    v78[45] = 0;
    *((_WORD *)v78 + 23) = -5120;
    *((_QWORD *)v78 + 6) = 7104878;
    *((_QWORD *)v78 + 7) = 0xE300000000000000;
  }
  sub_18E7662B4();
  v125 = sub_18E766290();
  v127 = v126;
  (*(void (**)(char *, uint64_t))(v141 + 8))(v77, v76);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1119A0);
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_18E7CE760;
  *(_QWORD *)(v27 + 32) = 0x726566736E617254;
  *(_QWORD *)(v27 + 40) = 0xE800000000000000;
  *(_QWORD *)(v27 + 48) = v45;
  *(_QWORD *)(v27 + 56) = v125;
  *(_QWORD *)(v27 + 64) = v127;

  return v27;
}

unint64_t sub_18E724940()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE10C3D0;
  if (!qword_1EE10C3D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE0F4FF0);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, (unint64_t *)&qword_1EE10C3D0);
  }
  return result;
}

uint64_t _s9ViewModelV7StickerVMa(uint64_t a1)
{
  return sub_18E520164(a1, qword_1EE111AD0);
}

uint64_t _s9ViewModelV7TapbackVMa(uint64_t a1)
{
  return sub_18E520164(a1, qword_1EE111A28);
}

_QWORD *sub_18E7249B4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
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
  uint64_t v17;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v15 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    v6 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v6;
    v7 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v7;
    v8 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v8;
    v9 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v9;
    v10 = a2[11];
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_QWORD *)(a1 + 88) = v10;
    v11 = *(int *)(a3 + 44);
    v17 = (uint64_t)a2 + v11;
    v12 = a1 + v11;
    *(_BYTE *)(a1 + 96) = *((_BYTE *)a2 + 96);
    v13 = sub_18E7662C0();
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    sub_18E7669BC();
    sub_18E7669BC();
    sub_18E7669BC();
    sub_18E7669BC();
    sub_18E7669BC();
    sub_18E7669BC();
    v14(v12, v17, v13);
  }
  return v3;
}

uint64_t sub_18E724AC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 44);
  v5 = sub_18E7662C0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_18E724B34(uint64_t a1, uint64_t a2, uint64_t a3)
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
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  v10 = *(int *)(a3 + 44);
  v15 = a2 + v10;
  v11 = a1 + v10;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  v12 = sub_18E7662C0();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  sub_18E7669BC();
  sub_18E7669BC();
  sub_18E7669BC();
  sub_18E7669BC();
  sub_18E7669BC();
  sub_18E7669BC();
  v13(v11, v15, v12);
  return a1;
}

uint64_t sub_18E724C18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  v6 = *(int *)(a3 + 44);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_18E7662C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_18E724D3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  v7 = *(int *)(a3 + 44);
  v8 = a2 + v7;
  v9 = a1 + v7;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  v10 = sub_18E7662C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, v8, v10);
  return a1;
}

uint64_t sub_18E724DB0(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v11;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  v12 = *(int *)(a3 + 44);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_18E7662C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_18E724E74()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18E724E80(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_18E7662C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 44), a2, v8);
  }
}

uint64_t sub_18E724EFC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_18E724F08(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_18E7662C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 44), a2, a2, v7);
  }
  return result;
}

uint64_t sub_18E724F7C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_18E7662C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_18E725004(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
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

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v15 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    v6 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v6;
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    v7 = a2[6];
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_QWORD *)(a1 + 48) = v7;
    v8 = a2[8];
    *(_QWORD *)(a1 + 56) = a2[7];
    *(_QWORD *)(a1 + 64) = v8;
    v9 = a2[10];
    v10 = *(int *)(a3 + 40);
    v11 = (uint64_t)a2 + v10;
    v12 = a1 + v10;
    *(_QWORD *)(a1 + 72) = a2[9];
    *(_QWORD *)(a1 + 80) = v9;
    v13 = sub_18E7662C0();
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    sub_18E7669BC();
    sub_18E7669BC();
    sub_18E7669BC();
    sub_18E7669BC();
    sub_18E7669BC();
    v14(v12, v11, v13);
  }
  return v3;
}

uint64_t sub_18E7250F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 40);
  v5 = sub_18E7662C0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_18E725160(uint64_t a1, uint64_t a2, uint64_t a3)
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
  void (*v13)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  v8 = *(_QWORD *)(a2 + 80);
  v9 = *(int *)(a3 + 40);
  v10 = a2 + v9;
  v11 = a1 + v9;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  v12 = sub_18E7662C0();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  sub_18E7669BC();
  sub_18E7669BC();
  sub_18E7669BC();
  sub_18E7669BC();
  sub_18E7669BC();
  v13(v11, v10, v12);
  return a1;
}

uint64_t sub_18E725228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 40);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_18E7662C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_18E72532C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v5 = *(int *)(a3 + 40);
  v6 = a1 + v5;
  v7 = a2 + v5;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v8 = sub_18E7662C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_18E7253A8(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v10;
  swift_bridgeObjectRelease();
  v11 = *(int *)(a3 + 40);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_18E7662C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_18E72545C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18E725468(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_18E7662C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, v8);
  }
}

uint64_t sub_18E7254E4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_18E7254F0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_18E7662C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }
  return result;
}

uint64_t sub_18E725564()
{
  uint64_t result;
  unint64_t v1;

  result = sub_18E7662C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t _s9ViewModelV18DetailRowInfoGroupVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s9ViewModelV18DetailRowInfoGroupVwcp(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  sub_18E7669BC();
  sub_18E7669BC();
  sub_18E7669BC();
  return a1;
}

_QWORD *_s9ViewModelV18DetailRowInfoGroupVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s9ViewModelV18DetailRowInfoGroupVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *_s9ViewModelV18DetailRowInfoGroupVMa()
{
  return &_s9ViewModelV18DetailRowInfoGroupVN;
}

ValueMetadata *_s9ViewModelV13DetailRowInfoVMa()
{
  return &_s9ViewModelV13DetailRowInfoVN;
}

void _s9ViewModelV7ServiceVwxx(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

_QWORD *_s9ViewModelV7ServiceVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  a1[2] = v4;
  sub_18E7669BC();
  v5 = v4;
  return a1;
}

_QWORD *_s9ViewModelV7ServiceVwca(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

  return a1;
}

uint64_t _s9ViewModelV7ServiceVwta(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

ValueMetadata *_s9ViewModelV7ServiceVMa()
{
  return &_s9ViewModelV7ServiceVN;
}

_QWORD *sub_18E72587C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    v7 = a2[4];
    sub_18E7669BC();
    if (v7)
    {
      v4[3] = a2[3];
      v4[4] = v7;
      v8 = (void *)a2[5];
      v4[5] = v8;
      sub_18E7669BC();
      v9 = v8;
    }
    else
    {
      *(_OWORD *)(v4 + 3) = *(_OWORD *)(a2 + 3);
      v4[5] = a2[5];
    }
    v11 = a2[7];
    v4[6] = a2[6];
    v4[7] = v11;
    v12 = a2[9];
    v4[8] = a2[8];
    v4[9] = v12;
    v13 = a2[11];
    v4[10] = a2[10];
    v4[11] = v13;
    v4[12] = a2[12];
    v14 = a2[14];
    sub_18E7669BC();
    sub_18E7669BC();
    sub_18E7669BC();
    sub_18E7669BC();
    if (v14)
    {
      v4[13] = a2[13];
      v4[14] = v14;
      v15 = a2[16];
      v4[15] = a2[15];
      v4[16] = v15;
      sub_18E7669BC();
      sub_18E7669BC();
    }
    else
    {
      v16 = *(_OWORD *)(a2 + 15);
      *(_OWORD *)(v4 + 13) = *(_OWORD *)(a2 + 13);
      *(_OWORD *)(v4 + 15) = v16;
    }
    v17 = a2[18];
    v4[17] = a2[17];
    v4[18] = v17;
    v18 = a2[20];
    v4[19] = a2[19];
    v4[20] = v18;
    v19 = a2[21];
    v20 = a2[22];
    v21 = *(int *)(a3 + 68);
    v22 = (char *)a2 + v21;
    v23 = (char *)v4 + v21;
    v4[21] = v19;
    v4[22] = v20;
    v24 = sub_18E7662C0();
    v25 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
    sub_18E7669BC();
    sub_18E7669BC();
    sub_18E7669BC();
    sub_18E7669BC();
    sub_18E7669BC();
    v25(v23, v22, v24);
  }
  return v4;
}

uint64_t sub_18E725A2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 32))
  {
    swift_bridgeObjectRelease();

  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 112))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 68);
  v5 = sub_18E7662C0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_18E725AE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 32);
  sub_18E7669BC();
  if (v6)
  {
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = v6;
    v7 = *(void **)(a2 + 40);
    *(_QWORD *)(a1 + 40) = v7;
    sub_18E7669BC();
    v8 = v7;
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  }
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  v10 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v10;
  v11 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v11;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v12 = *(_QWORD *)(a2 + 112);
  sub_18E7669BC();
  sub_18E7669BC();
  sub_18E7669BC();
  sub_18E7669BC();
  if (v12)
  {
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
    *(_QWORD *)(a1 + 112) = v12;
    v13 = *(_QWORD *)(a2 + 128);
    *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 128) = v13;
    sub_18E7669BC();
    sub_18E7669BC();
  }
  else
  {
    v14 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v14;
  }
  v15 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v15;
  v16 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v16;
  v17 = *(_QWORD *)(a2 + 168);
  v18 = *(_QWORD *)(a2 + 176);
  v19 = *(int *)(a3 + 68);
  v20 = a2 + v19;
  v21 = a1 + v19;
  *(_QWORD *)(a1 + 168) = v17;
  *(_QWORD *)(a1 + 176) = v18;
  v22 = sub_18E7662C0();
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16);
  sub_18E7669BC();
  sub_18E7669BC();
  sub_18E7669BC();
  sub_18E7669BC();
  sub_18E7669BC();
  v23(v21, v20, v22);
  return a1;
}

_QWORD *sub_18E725C68(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _OWORD *v6;
  _OWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  v6 = a1 + 3;
  v7 = a2 + 3;
  v8 = a2[4];
  if (a1[4])
  {
    if (v8)
    {
      a1[3] = a2[3];
      a1[4] = a2[4];
      sub_18E7669BC();
      swift_bridgeObjectRelease();
      v9 = (void *)a2[5];
      v10 = (void *)a1[5];
      a1[5] = v9;
      v11 = v9;

    }
    else
    {
      sub_18E63BF04((uint64_t)(a1 + 3));
      v14 = a2[5];
      *v6 = *v7;
      a1[5] = v14;
    }
  }
  else if (v8)
  {
    a1[3] = a2[3];
    a1[4] = a2[4];
    v12 = (void *)a2[5];
    a1[5] = v12;
    sub_18E7669BC();
    v13 = v12;
  }
  else
  {
    v15 = *v7;
    a1[5] = a2[5];
    *v6 = v15;
  }
  a1[6] = a2[6];
  a1[7] = a2[7];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  v16 = a1 + 13;
  v17 = a2 + 13;
  v18 = a2[14];
  if (a1[14])
  {
    if (v18)
    {
      a1[13] = a2[13];
      a1[14] = a2[14];
      sub_18E7669BC();
      swift_bridgeObjectRelease();
      a1[15] = a2[15];
      a1[16] = a2[16];
      sub_18E7669BC();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_18E63BF38((uint64_t)(a1 + 13));
      v19 = *(_OWORD *)(a2 + 15);
      *v16 = *v17;
      *(_OWORD *)(a1 + 15) = v19;
    }
  }
  else if (v18)
  {
    a1[13] = a2[13];
    a1[14] = a2[14];
    a1[15] = a2[15];
    a1[16] = a2[16];
    sub_18E7669BC();
    sub_18E7669BC();
  }
  else
  {
    v20 = *(_OWORD *)(a2 + 15);
    *v16 = *v17;
    *(_OWORD *)(a1 + 15) = v20;
  }
  a1[17] = a2[17];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  a1[18] = a2[18];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  a1[19] = a2[19];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  a1[20] = a2[20];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  a1[21] = a2[21];
  a1[22] = a2[22];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  v21 = *(int *)(a3 + 68);
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = sub_18E7662C0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  return a1;
}

uint64_t sub_18E725F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v5 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = v5;
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  v6 = *(int *)(a3 + 68);
  v7 = a1 + v6;
  v8 = a2 + v6;
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  v9 = sub_18E7662C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

uint64_t sub_18E725FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(_QWORD *)(a2 + 32);
    if (v6)
    {
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = v6;
      swift_bridgeObjectRelease();
      v7 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);

      goto LABEL_6;
    }
    sub_18E63BF04(a1 + 24);
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
LABEL_6:
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
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(a1 + 112))
  {
LABEL_10:
    v13 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v13;
    goto LABEL_11;
  }
  v11 = *(_QWORD *)(a2 + 112);
  if (!v11)
  {
    sub_18E63BF38(a1 + 104);
    goto LABEL_10;
  }
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v12;
  swift_bridgeObjectRelease();
LABEL_11:
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v14;
  swift_bridgeObjectRelease();
  v15 = *(int *)(a3 + 68);
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = sub_18E7662C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v16, v17, v18);
  return a1;
}

uint64_t sub_18E72618C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18E726198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_18E7662C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 68), a2, v8);
  }
}

uint64_t sub_18E726214()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_18E726220(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v7 = sub_18E7662C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 68), a2, a2, v7);
  }
  return result;
}

uint64_t sub_18E726294()
{
  uint64_t result;
  unint64_t v1;

  result = sub_18E7662C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_18E72634C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

id CKCatchUpButtonManager.catchUpButtonHost.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC7ChatKit22CKCatchUpButtonManager_catchUpButtonHost);
}

id CKCatchUpButtonManager.__allocating_init(didTapButton:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return CKCatchUpButtonManager.init(didTapButton:)(a1, a2);
}

id CKCatchUpButtonManager.init(didTapButton:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  id result;
  void *v12;
  id v13;
  id v14;
  id v15;
  objc_super v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = sub_18E7679A0();
  MEMORY[0x1E0C80A78](v5);
  v6 = OBJC_IVAR____TtC7ChatKit22CKCatchUpButtonManager_animator;
  type metadata accessor for CKCatchUpButtonManager.Animator();
  v7 = swift_allocObject();
  *(_WORD *)(v7 + 16) = 0;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  *(_QWORD *)(v7 + 56) = 0x3FF0000000000000;
  *(_OWORD *)(v7 + 64) = 0u;
  *(_OWORD *)(v7 + 80) = 0u;
  *(_QWORD *)(v7 + 96) = 0;
  v8 = v2;
  sub_18E766488();
  *(_QWORD *)&v2[v6] = v7;
  v8[OBJC_IVAR____TtC7ChatKit22CKCatchUpButtonManager_didAnimate] = 0;
  v17 = a1;
  v18 = a2;
  v19 = v7;
  v20 = 0x4030000000000000;
  v9 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE111C00));
  swift_retain_n();
  swift_retain_n();
  v10 = (void *)sub_18E7675EC();
  sub_18E7670E8();
  sub_18E7675E0();
  result = objc_msgSend(v10, sel_view);
  if (result)
  {
    v12 = result;
    v13 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v12, sel_setBackgroundColor_, v13);

    sub_18E767988();
    sub_18E7675D4();
    *(_QWORD *)&v8[OBJC_IVAR____TtC7ChatKit22CKCatchUpButtonManager_catchUpButtonHost] = v10;
    v14 = v10;

    v16.receiver = v8;
    v16.super_class = (Class)type metadata accessor for CKCatchUpButtonManager();
    v15 = objc_msgSendSuper2(&v16, sel_init);

    swift_release_n();
    swift_release_n();
    return v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for CKCatchUpButtonManager.Animator()
{
  uint64_t result;

  result = qword_1EE111C08;
  if (!qword_1EE111C08)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata accessor for CKCatchUpButtonManager()
{
  return objc_opt_self();
}

void sub_18E726654(char a1)
{
  char *v1;
  id v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char *v16;
  uint64_t v17;
  double v18;
  _QWORD v19[6];
  CGRect v20;
  CGRect v21;

  if ((a1 & 1) != 0)
  {
    sub_18E726D00();
  }
  else
  {
    v2 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC7ChatKit22CKCatchUpButtonManager_catchUpButtonHost], sel_view);
    if (v2)
    {
      v3 = v2;
      objc_msgSend(v2, sel_frame);
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;

      v12 = OBJC_IVAR____TtC7ChatKit22CKCatchUpButtonManager_didAnimate;
      if ((v1[OBJC_IVAR____TtC7ChatKit22CKCatchUpButtonManager_didAnimate] & 1) != 0)
      {
        v13 = (void *)objc_opt_self();
        v14 = swift_allocObject();
        *(_QWORD *)(v14 + 16) = v1;
        v19[4] = sub_18E7275C8;
        v19[5] = v14;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 1107296256;
        v19[2] = sub_18E521C9C;
        v19[3] = &block_descriptor_68;
        v15 = _Block_copy(v19);
        v16 = v1;
        swift_release();
        objc_msgSend(v13, sel_animateWithDuration_animations_, v15, 0.1);
        _Block_release(v15);
      }
      else
      {
        v21.origin.x = 0.0;
        v21.origin.y = 0.0;
        v21.size.width = 0.0;
        v21.size.height = 0.0;
        v20.origin.x = v5;
        v20.origin.y = v7;
        v20.size.width = v9;
        v20.size.height = v11;
        if (!CGRectEqualToRect(v20, v21))
        {
          v1[v12] = 1;
          v17 = *(_QWORD *)&v1[OBJC_IVAR____TtC7ChatKit22CKCatchUpButtonManager_animator];
          v18 = v7 * 0.5;
          swift_getKeyPath();
          sub_18E7273BC();
          sub_18E766464();
          swift_release();
          swift_getKeyPath();
          sub_18E76647C();
          swift_release();
          *(double *)(v17 + 32) = v18;
          swift_getKeyPath();
          sub_18E766470();
          swift_release();
          swift_getKeyPath();
          sub_18E766464();
          swift_release();
          swift_getKeyPath();
          sub_18E76647C();
          swift_release();
          *(double *)(v17 + 72) = v18;
          swift_getKeyPath();
          sub_18E766470();
          swift_release();
          swift_getKeyPath();
          sub_18E766464();
          swift_release();
          v19[0] = v17;
          swift_getKeyPath();
          sub_18E76647C();
          swift_release();
          *(_BYTE *)(v17 + 16) = (*(_BYTE *)(v17 + 16) & 1) == 0;
          v19[0] = v17;
          swift_getKeyPath();
          sub_18E766470();
          swift_release();
        }
      }
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_18E7269E4(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t KeyPath;
  void *v5;
  uint64_t v6;
  void *v7;
  char *v8;
  _QWORD aBlock[6];

  if (a1)
  {
    v3 = *(_QWORD *)&v1[OBJC_IVAR____TtC7ChatKit22CKCatchUpButtonManager_animator];
    KeyPath = swift_getKeyPath();
    MEMORY[0x1E0C80A78](KeyPath);
    sub_18E7273BC();
    swift_retain();
    sub_18E766458();
    swift_release();
    swift_getKeyPath();
    sub_18E766464();
    swift_release();
    aBlock[0] = v3;
    swift_getKeyPath();
    sub_18E76647C();
    swift_release();
    *(_BYTE *)(v3 + 17) = (*(_BYTE *)(v3 + 17) & 1) == 0;
    aBlock[0] = v3;
    swift_getKeyPath();
    sub_18E766470();
    swift_release();
    sub_18E011A40(a1);
  }
  else
  {
    v5 = (void *)objc_opt_self();
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v1;
    aBlock[4] = sub_18E7275E4;
    aBlock[5] = v6;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_18E521C9C;
    aBlock[3] = &block_descriptor_14_1;
    v7 = _Block_copy(aBlock);
    v8 = v1;
    swift_release();
    objc_msgSend(v5, sel_animateWithDuration_animations_, v7, 0.1);
    _Block_release(v7);
  }
}

void sub_18E726C04(uint64_t a1, double a2)
{
  id v3;
  id v4;

  v3 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                             + OBJC_IVAR____TtC7ChatKit22CKCatchUpButtonManager_catchUpButtonHost), sel_view));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setAlpha_, a2);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_18E726D00()
{
  uint64_t v0;
  uint64_t v1;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC7ChatKit22CKCatchUpButtonManager_didAnimate) = 1;
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC7ChatKit22CKCatchUpButtonManager_animator);
  swift_getKeyPath();
  sub_18E7273BC();
  sub_18E766464();
  swift_release();
  swift_getKeyPath();
  sub_18E76647C();
  swift_release();
  *(_QWORD *)(v1 + 32) = 0;
  swift_getKeyPath();
  sub_18E766470();
  swift_release();
  swift_getKeyPath();
  sub_18E766464();
  swift_release();
  swift_getKeyPath();
  sub_18E76647C();
  swift_release();
  *(_QWORD *)(v1 + 24) = 0x3FF0000000000000;
  swift_getKeyPath();
  sub_18E766470();
  return swift_release();
}

id CKCatchUpButtonManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CKCatchUpButtonManager.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CKCatchUpButtonManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CKCatchUpButtonManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18E726F44()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_18E7273BC();
  sub_18E766464();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_18E726FB0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_18E7273BC();
  sub_18E766464();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 16);
  return result;
}

uint64_t sub_18E727024()
{
  swift_getKeyPath();
  sub_18E7273BC();
  sub_18E766458();
  return swift_release();
}

uint64_t sub_18E7270B4()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_18E7273BC();
  sub_18E766464();
  swift_release();
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_18E727120@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_18E7273BC();
  sub_18E766464();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 17);
  return result;
}

uint64_t sub_18E727194()
{
  swift_getKeyPath();
  sub_18E7273BC();
  sub_18E766458();
  return swift_release();
}

double sub_18E727224()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_18E7273BC();
  sub_18E766464();
  swift_release();
  return *(double *)(v0 + 24);
}

__n128 sub_18E727294@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_18E7273BC();
  sub_18E766464();
  swift_release();
  result = *(__n128 *)(v3 + 24);
  v5 = *(_OWORD *)(v3 + 40);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_18E727310()
{
  swift_getKeyPath();
  sub_18E7273BC();
  sub_18E766458();
  return swift_release();
}

unint64_t sub_18E7273BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE10F500;
  if (!qword_1EE10F500)
  {
    v1 = type metadata accessor for CKCatchUpButtonManager.Animator();
    result = MEMORY[0x193FF4E54](&unk_18E7DE1A8, v1);
    atomic_store(result, (unint64_t *)&qword_1EE10F500);
  }
  return result;
}

double sub_18E727404()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_18E7273BC();
  sub_18E766464();
  swift_release();
  return *(double *)(v0 + 56);
}

__n128 sub_18E727474@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_18E7273BC();
  sub_18E766464();
  swift_release();
  result = *(__n128 *)(v3 + 56);
  v5 = *(_OWORD *)(v3 + 72);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_18E7274F0()
{
  swift_getKeyPath();
  sub_18E7273BC();
  sub_18E766458();
  return swift_release();
}

uint64_t sub_18E7275A4()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_18E7275C8()
{
  uint64_t v0;

  sub_18E726C04(*(_QWORD *)(v0 + 16), 1.0);
}

void sub_18E7275E4()
{
  uint64_t v0;

  sub_18E726C04(*(_QWORD *)(v0 + 16), 0.0);
}

uint64_t sub_18E727600()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_18E7273BC();
  sub_18E766464();
  swift_release();
  v1 = *(_QWORD *)(v0 + 88);
  sub_18E52242C(v1);
  return v1;
}

uint64_t sub_18E727680@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = *a1;
  swift_getKeyPath();
  sub_18E7273BC();
  sub_18E766464();
  swift_release();
  v4 = *(_QWORD *)(v3 + 88);
  v5 = *(_QWORD *)(v3 + 96);
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_18E00F35C;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_18E52242C(v4);
}

uint64_t sub_18E727734(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t KeyPath;

  v2 = *a1;
  v1 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v2;
    *(_QWORD *)(v3 + 24) = v1;
    v4 = sub_18E00F35C;
  }
  else
  {
    v4 = 0;
  }
  KeyPath = swift_getKeyPath();
  MEMORY[0x1E0C80A78](KeyPath);
  sub_18E52242C(v2);
  sub_18E7273BC();
  sub_18E766458();
  sub_18E011A40((uint64_t)v4);
  return swift_release();
}

uint64_t sub_18E727844()
{
  return sub_18E7279EC();
}

uint64_t method lookup function for CKCatchUpButtonManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CKCatchUpButtonManager.__allocating_init(didTapButton:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of CKCatchUpButtonManager.animateIn(resumingFromBackground:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CKCatchUpButtonManager.animateOut(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t sub_18E7278AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_18E011A40(*(_QWORD *)(v0 + 88));
  v1 = v0 + OBJC_IVAR____TtCC7ChatKit22CKCatchUpButtonManager8Animator___observationRegistrar;
  v2 = sub_18E766494();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_18E727904()
{
  return type metadata accessor for CKCatchUpButtonManager.Animator();
}

uint64_t sub_18E72790C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_18E766494();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for CKCatchUpButtonManager.Animator.AnimationValues()
{
  return &type metadata for CKCatchUpButtonManager.Animator.AnimationValues;
}

uint64_t sub_18E7279AC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_18E7279D0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_18E7279DC()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 17) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_18E7279EC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v0[2];
  v1 = v0[3];
  v3 = v0[4];
  v4 = *(_QWORD *)(v2 + 88);
  *(_QWORD *)(v2 + 88) = v1;
  *(_QWORD *)(v2 + 96) = v3;
  sub_18E52242C(v1);
  return sub_18E011A40(v4);
}

uint64_t sub_18E727A34()
{
  swift_release();
  return swift_deallocObject();
}

void sub_18E727A58()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 16) = *(_BYTE *)(v0 + 24);
}

__n128 sub_18E727A68()
{
  uint64_t v0;
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(v0 + 16);
  result = *(__n128 *)(v0 + 24);
  v3 = *(_OWORD *)(v0 + 40);
  *(__n128 *)(v1 + 56) = result;
  *(_OWORD *)(v1 + 72) = v3;
  return result;
}

__n128 sub_18E727A80()
{
  uint64_t v0;
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(v0 + 16);
  result = *(__n128 *)(v0 + 24);
  v3 = *(_OWORD *)(v0 + 40);
  *(__n128 *)(v1 + 24) = result;
  *(_OWORD *)(v1 + 40) = v3;
  return result;
}

uint64_t sub_18E727AB0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_18E727B00()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Inspection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Inspection);
}

void sub_18E727B38(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t *v39;
  unsigned int *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
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
  char *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  char *v61;
  uint64_t v62;
  char *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0F47E0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0F47C8);
  MEMORY[0x1E0C80A78](v7);
  v68 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_18E765D80();
  v69 = *(_QWORD *)(v9 - 8);
  v70 = v9;
  MEMORY[0x1E0C80A78](v9);
  v67 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v64 = (uint64_t *)((char *)&v59 - v12);
  v13 = sub_18E765D68();
  v71 = *(_QWORD *)(v13 - 8);
  v72 = v13;
  MEMORY[0x1E0C80A78](v13);
  v63 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (uint64_t *)((char *)&v59 - v16);
  v18 = sub_18E765D8C();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_18E765DA4();
  v65 = *(_QWORD *)(v22 - 8);
  v66 = v22;
  MEMORY[0x1E0C80A78](v22);
  v76 = (char *)&v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_18E765D98();
  v74 = *(_QWORD *)(v24 - 8);
  v75 = v24;
  MEMORY[0x1E0C80A78](v24);
  v26 = (char *)&v59 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v28 = MEMORY[0x1E0C80A78](v27).n128_u64[0];
  v73 = (uint64_t *)((char *)&v59 - v29);
  v30 = v2;
  v31 = objc_msgSend(v2, sel_defaultIMHandle, v28);
  if (v31)
  {
    v32 = v31;
    v61 = v6;
    v62 = a1;
    v33 = objc_msgSend(v31, sel_ID);

    v34 = v33;
    if (!v33)
    {
      sub_18E768984();
      v34 = (void *)sub_18E768954();
      swift_bridgeObjectRelease();
    }
    v35 = sub_18E768984();
    v37 = v36;
    v38 = objc_msgSend(v34, sel__appearsToBeEmail);

    v39 = v73;
    *v73 = v35;
    v39[1] = v37;
    v40 = (unsigned int *)MEMORY[0x1E0C90908];
    v42 = v74;
    v41 = v75;
    if (!v38)
      v40 = (unsigned int *)MEMORY[0x1E0C908F8];
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v74 + 104))(v39, *v40, v75);
    (*(void (**)(char *, uint64_t *, uint64_t))(v42 + 16))(v26, v39, v41);
    (*(void (**)(char *, _QWORD, uint64_t))(v19 + 104))(v21, *MEMORY[0x1E0C90898], v18);
    sub_18E765DB0();
    if (qword_1EE0F4750 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0F5030);
    v43 = (void *)sub_18E768AC8();
    v44 = objc_msgSend(v30, sel_cnContactWithKeys_, v43);

    if (v44)
    {
      v45 = objc_msgSend(v44, sel_identifier);
      v46 = sub_18E768984();
      v60 = v44;
      v47 = v46;
      v49 = v48;

      *v17 = v47;
      v17[1] = v49;
      v50 = v72;
      v51 = v71;
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(v71 + 104))(v17, *MEMORY[0x1E0C90800], v72);
      v52 = v64;
      *v64 = 0;
      v52[1] = 0xE000000000000000;
      v54 = v69;
      v53 = v70;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(v69 + 104))(v52, *MEMORY[0x1E0C90838], v70);
      (*(void (**)(char *, uint64_t *, uint64_t))(v51 + 16))(v63, v17, v50);
      (*(void (**)(char *, _QWORD *, uint64_t))(v54 + 16))(v67, v52, v53);
      v55 = v65;
      v56 = v66;
      v57 = v68;
      (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v68, v76, v66);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v55 + 56))(v57, 0, 1, v56);
      v58 = sub_18E765E40();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v61, 1, 1, v58);
      sub_18E765D74();

      (*(void (**)(_QWORD *, uint64_t))(v54 + 8))(v52, v53);
      (*(void (**)(uint64_t *, uint64_t))(v71 + 8))(v17, v72);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v76, v56);
      (*(void (**)(uint64_t *, uint64_t))(v74 + 8))(v73, v75);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_18E728078()
{
  uint64_t v0;
  void *v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0FB970);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_18E7CC390;
  v2 = (void *)*MEMORY[0x1E0C966E8];
  v3 = v0;
  *(_QWORD *)(v0 + 32) = *MEMORY[0x1E0C966E8];
  sub_18E768AF8();
  qword_1EE12DC70 = v3;
  return v2;
}

void sub_18E7280E4(void *a1)
{
  sub_18E5B7C90(a1);
  sub_18E7280F8();
}

void sub_18E7280F8()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[6];

  objc_msgSend(v0, sel_setAlpha_, 1.0);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA9D8]), sel_initWithMass_stiffness_damping_initialVelocity_, 1.0, 800.0, 50.0, 0.0, 0.0);
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEABC8]), sel_initWithDuration_timingParameters_, v1, 0.0);
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v0;
  v6[4] = sub_18E537DAC;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_18E521C9C;
  v6[3] = &block_descriptor_12_8;
  v4 = _Block_copy(v6);
  v5 = v0;
  swift_release();
  objc_msgSend(v2, sel_addAnimations_, v4);
  _Block_release(v4);
  objc_msgSend(v2, sel_startAnimationAfterDelay_, 0.0);

}

void sub_18E72823C(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;

  sub_18E6F42FC();
  if (a1)
  {
    v2 = sub_18E599634();
    v3 = v2;
    if (v2 >> 62)
      goto LABEL_16;
    v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_18E7669BC();
    for (; v4; v4 = sub_18E769338())
    {
      v5 = 4;
      while (1)
      {
        v6 = (v3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x193FF25B0](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
        v7 = v6;
        v8 = v5 - 3;
        if (__OFADD__(v5 - 4, 1))
          break;
        if (*((_BYTE *)v6 + OBJC_IVAR___CKTapbackPlatterView_isSent) == 1)
        {
          swift_bridgeObjectRelease_n();
          sub_18E5B9F10(v7);

          goto LABEL_13;
        }

        ++v5;
        if (v8 == v4)
          goto LABEL_11;
      }
      __break(1u);
LABEL_16:
      sub_18E7669BC();
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
  }
  sub_18E5BB090();
LABEL_13:
  sub_18E7280F8();
}

void sub_18E728360(void *a1)
{
  char *v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id (*v16)();
  uint64_t v17;

  sub_18E5BBE6C(a1);
  v2 = *(_QWORD *)&v1[OBJC_IVAR____TtC7ChatKit26TapbackPickerContainerView_currentDisplayMode];
  objc_msgSend(v1, sel_setAlpha_, 0.0);
  v3 = objc_allocWithZone(MEMORY[0x1E0CEA9D8]);
  if (v2 == 1)
  {
    v4 = objc_msgSend(v3, sel_initWithMass_stiffness_damping_initialVelocity_, 1.0, 700.0, 50.0, 0.0, 0.0);
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEABC8]), sel_initWithDuration_timingParameters_, v4, 0.0);
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v1;
    v16 = sub_18E72862C;
    v17 = v6;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 1107296256;
    v14 = sub_18E521C9C;
    v15 = &block_descriptor_6_11;
    v7 = _Block_copy(&v12);
    v8 = v1;
    swift_release();
    objc_msgSend(v5, sel_addAnimations_, v7);
    _Block_release(v7);
    objc_msgSend(v5, sel_startAnimationAfterDelay_, 0.25);
  }
  else
  {
    v4 = objc_msgSend(v3, sel_initWithMass_stiffness_damping_initialVelocity_, 1.0, 400.0, 50.0, 0.0, 0.0);
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEABC8]), sel_initWithDuration_timingParameters_, v4, 0.0);
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v1;
    v16 = sub_18E537D90;
    v17 = v9;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 1107296256;
    v14 = sub_18E521C9C;
    v15 = &block_descriptor_69;
    v10 = _Block_copy(&v12);
    v11 = v1;
    swift_release();
    objc_msgSend(v5, sel_addAnimations_, v10);
    _Block_release(v10);
    objc_msgSend(v5, sel_startAnimationAfterDelay_, 0.2);
  }

}

id sub_18E7285A8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TapbackPickerBalloonMaskContainer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TapbackPickerBalloonMaskContainer()
{
  return objc_opt_self();
}

uint64_t sub_18E7285F8()
{
  uint64_t v0;

  return swift_deallocObject();
}

double TapbackGlyphView.attributionScaleFactor.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR___CKTapbackGlyphView_attributionScaleFactor);
}

double TapbackGlyphView.platterEdgeInsets.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR___CKTapbackGlyphView_platterEdgeInsets);
}

uint64_t sub_18E7286D0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CKTapbackGlyphView_delegate;
  swift_beginAccess();
  return MEMORY[0x193FF501C](v1);
}

uint64_t sub_18E728768()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_18E7287C0(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CKTapbackGlyphView_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x193FF501C](v5);
  return sub_18E53B788;
}

id TapbackGlyphView.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id TapbackGlyphView.init()()
{
  char *v0;
  char *v1;
  char *v8;
  id v9;
  void *v10;
  id v11;
  id result;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  objc_super v22;

  *(_QWORD *)&v0[OBJC_IVAR___CKTapbackGlyphView_attributionScaleFactor] = 0x3FE6A09E667F3BCDLL;
  v1 = &v0[OBJC_IVAR___CKTapbackGlyphView_platterEdgeInsets];
  __asm
  {
    FMOV            V0.2D, #4.0
    FMOV            V1.2D, #-4.0
  }
  *(_OWORD *)v1 = _Q0;
  *((_OWORD *)v1 + 1) = _Q1;
  v8 = v0;
  swift_unknownObjectWeakInit();
  v8[OBJC_IVAR___CKTapbackGlyphView_isSelected] = 0;

  v22.receiver = v8;
  v22.super_class = (Class)type metadata accessor for TapbackGlyphView();
  v9 = objc_msgSendSuper2(&v22, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v10 = (void *)objc_opt_self();
  v11 = v9;
  result = objc_msgSend(v10, sel_sharedBehaviors);
  if (result)
  {
    v13 = result;
    v14 = v11;
    v15 = objc_msgSend(v13, sel_emojiStickerTranscriptCellFont);
    objc_msgSend(v14, sel_setFont_, v15);

    objc_msgSend(v14, sel_setAdjustsFontSizeToFitWidth_, 1);
    objc_msgSend(v14, sel_setUserInteractionEnabled_, 0);
    v16 = v14;
    result = objc_msgSend(v13, sel_theme);
    if (result)
    {
      v17 = result;
      v18 = objc_msgSend(result, sel_primaryLabelColor);

      objc_msgSend(v16, sel_setTextColor_, v18);
      objc_msgSend(v16, sel_setTextAlignment_, 1);
      v19 = (void *)objc_opt_self();
      v20 = v16;
      v21 = objc_msgSend(v19, sel_clearColor);
      objc_msgSend(v20, sel_setBackgroundColor_, v21);

      objc_msgSend(v20, sel_setNumberOfLines_, 1);
      return v20;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for TapbackGlyphView()
{
  return objc_opt_self();
}

uint64_t sub_18E728B18()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___CKTapbackGlyphView_isSelected);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_18E728BA4(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___CKTapbackGlyphView_isSelected);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_18E728BEC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_18E728C30()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  id v7;
  id v8;
  id v9;

  v1 = (void *)sub_18E768954();
  objc_msgSend(v0, sel_setText_, v1);

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_tapbackPickerSizingFont);
    objc_msgSend(v0, sel_setFont_, v4);

    objc_msgSend(v0, sel_setAdjustsFontSizeToFitWidth_, 0);
    LODWORD(v5) = 1148846080;
    objc_msgSend(v0, sel_setContentCompressionResistancePriority_forAxis_, 1, v5);
    LODWORD(v6) = 1148846080;
    objc_msgSend(v0, sel_setContentHuggingPriority_forAxis_, 1, v6);
    v7 = objc_msgSend(v0, sel_heightAnchor);
    v8 = objc_msgSend(v0, sel_widthAnchor);
    v9 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v8);

    objc_msgSend(v9, sel_setActive_, 1);
  }
  else
  {
    __break(1u);
  }
}

id TapbackGlyphView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void TapbackGlyphView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TapbackGlyphView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TapbackGlyphView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void TapbackGlyphView.configure(for:isSelected:)(void *a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  objc_opt_self();
  v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = a1;
    v6 = objc_msgSend(v4, sel_associatedMessageEmoji);
    sub_18E768984();

    v7 = (id)sub_18E768954();
    objc_msgSend(v1, sel_setText_, v7);

    swift_bridgeObjectRelease();
  }
}

Swift::Void __swiftcall TapbackGlyphView.prepareForAppearingAnimation()()
{
  void *v0;

  objc_msgSend(v0, sel_setHidden_, 1);
}

Swift::Void __swiftcall TapbackGlyphView.performViewControllerAppearingAnimation()()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  CGAffineTransform v5;

  objc_msgSend(v0, sel_setHidden_, 0);
  CGAffineTransformMakeScale(&v5, 0.001, 0.001);
  objc_msgSend(v0, sel_setTransform_, &v5);
  if (qword_1EE107490 != -1)
    swift_once();
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEABC8]), sel_initWithDuration_timingParameters_, qword_1EE12E038, 0.0);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  *(_QWORD *)&v5.tx = sub_18E672348;
  *(_QWORD *)&v5.ty = v2;
  *(_QWORD *)&v5.a = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v5.b = 1107296256;
  *(_QWORD *)&v5.c = sub_18E521C9C;
  *(_QWORD *)&v5.d = &block_descriptor_70;
  v3 = _Block_copy(&v5);
  v4 = v0;
  swift_release();
  objc_msgSend(v1, sel_addAnimations_, v3);
  _Block_release(v3);
  objc_msgSend(v1, sel_startAnimationAfterDelay_, 0.0);

}

uint64_t sub_18E7292AC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_18E729308@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR___CKTapbackGlyphView_delegate;
  swift_beginAccess();
  result = MEMORY[0x193FF501C](v3);
  *a2 = result;
  return result;
}

uint64_t sub_18E72935C()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_18E7293B0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR___CKTapbackGlyphView_isSelected);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_18E729400(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR___CKTapbackGlyphView_isSelected);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t method lookup function for TapbackGlyphView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TapbackGlyphView.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TapbackGlyphView.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of TapbackGlyphView.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of TapbackGlyphView.isSelected.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of TapbackGlyphView.isSelected.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of TapbackGlyphView.isSelected.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of TapbackGlyphView.configureAsPrototype()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t RichLinkCardStackChatItem.viewClass.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___CKRichLinkCardStackChatItem_viewClass);
}

double RichLinkCardStackChatItem.balloonSize.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR___CKRichLinkCardStackChatItem_balloonSize);
}

double sub_18E7295AC()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;

  v1 = objc_msgSend(v0, sel_IMChatItem);
  if (!v1)
    return *MEMORY[0x1E0CEB4B0];
  v2 = v1;
  objc_opt_self();
  v3 = (void *)swift_dynamicCastObjCClass();
  if (!v3)

  v4 = objc_msgSend(v3, sel_richCards);
  if (!v4)
    return *MEMORY[0x1E0CEB4B0];
  v5 = objc_msgSend(v4, sel_cards);

  sub_18E768CD8();
  v6 = sub_18E768AE0();

  if (v6 >> 62)
  {
    sub_18E7669BC();
    v7 = sub_18E769338();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v7 > 1)
    return 0.0;
  else
    return *MEMORY[0x1E0CEB4B0];
}

id sub_18E7296E0()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;

  v1 = objc_msgSend(v0, sel_IMChatItem);
  if (!v1)
    return 0;
  v2 = v1;
  objc_opt_self();
  v3 = (void *)swift_dynamicCastObjCClass();
  if (v3)
    v4 = objc_msgSend(v3, sel_selectedIndex);
  else
    v4 = 0;

  return v4;
}

uint64_t sub_18E7297A0()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;

  v1 = objc_msgSend(v0, sel_IMChatItem);
  if (!v1)
    return type metadata accessor for RichLinkCardStackItemView();
  v2 = v1;
  objc_opt_self();
  v3 = (void *)swift_dynamicCastObjCClass();
  if (!v3)

  v4 = objc_msgSend(v3, sel_richCards);
  if (!v4)
    return type metadata accessor for RichLinkCardStackItemView();
  v5 = objc_msgSend(v4, sel_cards);

  sub_18E768CD8();
  v6 = sub_18E768AE0();

  if (v6 >> 62)
  {
    sub_18E7669BC();
    v7 = sub_18E769338();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v7 >= 2)
    return type metadata accessor for RichCardCarouselBalloonView();
  else
    return type metadata accessor for RichLinkCardStackItemView();
}

id sub_18E72995C()
{
  void *v0;
  id v1;
  void *v2;

  v1 = objc_msgSend(v0, sel_IMChatItem);
  if (v1)
  {
    objc_opt_self();
    v2 = (void *)swift_dynamicCastObjCClass();
    if (!v2)

    v1 = objc_msgSend(v2, sel_richCards);
  }
  return v1;
}

id RichLinkCardStackChatItem.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id RichLinkCardStackChatItem.init()()
{
  char *v0;
  uint64_t v1;
  objc_super v3;

  v1 = OBJC_IVAR___CKRichLinkCardStackChatItem_viewClass;
  *(_QWORD *)&v0[v1] = type metadata accessor for RichLinkCardStackItemView();
  *(int64x2_t *)&v0[OBJC_IVAR___CKRichLinkCardStackChatItem_balloonSize] = vdupq_n_s64(0x407F400000000000uLL);
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for RichLinkCardStackChatItem();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for RichLinkCardStackChatItem()
{
  return objc_opt_self();
}

id RichLinkCardStackChatItem.__allocating_init(imChatItem:maxWidth:)(void *a1, double a2)
{
  return sub_18E67AA70(a1, (SEL *)&selRef_initWithIMChatItem_maxWidth_, a2);
}

id RichLinkCardStackChatItem.init(imChatItem:maxWidth:)(void *a1, double a2)
{
  return sub_18E729B24(a1, (SEL *)&selRef_initWithIMChatItem_maxWidth_, a2);
}

id RichLinkCardStackChatItem.__allocating_init(notification:maxWidth:)(void *a1, double a2)
{
  return sub_18E67AA70(a1, (SEL *)&selRef_initWithNotification_maxWidth_, a2);
}

id RichLinkCardStackChatItem.init(notification:maxWidth:)(void *a1, double a2)
{
  return sub_18E729B24(a1, (SEL *)&selRef_initWithNotification_maxWidth_, a2);
}

id sub_18E729B24(void *a1, SEL *a2, double a3)
{
  char *v3;
  uint64_t v7;
  id v8;
  objc_super v10;

  v7 = OBJC_IVAR___CKRichLinkCardStackChatItem_viewClass;
  *(_QWORD *)&v3[v7] = type metadata accessor for RichLinkCardStackItemView();
  *(int64x2_t *)&v3[OBJC_IVAR___CKRichLinkCardStackChatItem_balloonSize] = vdupq_n_s64(0x407F400000000000uLL);
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for RichLinkCardStackChatItem();
  v8 = objc_msgSendSuper2(&v10, *a2, a1, a3);

  return v8;
}

id sub_18E729BC0(char *a1, double a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v9;
  objc_super v11;

  v9 = OBJC_IVAR___CKRichLinkCardStackChatItem_viewClass;
  *(_QWORD *)&a1[v9] = type metadata accessor for RichLinkCardStackItemView();
  *(int64x2_t *)&a1[OBJC_IVAR___CKRichLinkCardStackChatItem_balloonSize] = vdupq_n_s64(0x407F400000000000uLL);
  v11.receiver = a1;
  v11.super_class = (Class)type metadata accessor for RichLinkCardStackChatItem();
  return objc_msgSendSuper2(&v11, *a5, a4, a2);
}

id RichLinkCardStackChatItem.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RichLinkCardStackChatItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for RichLinkCardStackChatItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RichLinkCardStackChatItem.selectedIndex.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of RichLinkCardStackChatItem.richCards.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

id TapbackEmojiView.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

double TapbackEmojiView.attributionScaleFactor.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR___CKTapbackEmojiView_attributionScaleFactor);
}

double TapbackEmojiView.platterEdgeInsets.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR___CKTapbackEmojiView_platterEdgeInsets);
}

uint64_t sub_18E729D70()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___CKTapbackEmojiView_isSelected);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_18E729DFC(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___CKTapbackEmojiView_isSelected);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_18E729E44())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_18E729ED0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CKTapbackEmojiView_delegate;
  swift_beginAccess();
  return MEMORY[0x193FF501C](v1);
}

uint64_t sub_18E729F68()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_18E729FC0(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CKTapbackEmojiView_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x193FF501C](v5);
  return sub_18E53B788;
}

char *TapbackEmojiView.init()()
{
  _BYTE *v0;
  _OWORD *v1;
  _QWORD *v8;
  char *v9;
  char *v10;
  id v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  objc_super v20;

  *(_QWORD *)&v0[OBJC_IVAR___CKTapbackEmojiView_attributionScaleFactor] = 0x3FE6A09E667F3BCDLL;
  v1 = &v0[OBJC_IVAR___CKTapbackEmojiView_platterEdgeInsets];
  __asm
  {
    FMOV            V0.2D, #4.0
    FMOV            V1.2D, #-4.0
  }
  *v1 = _Q0;
  v1[1] = _Q1;
  v8 = &v0[OBJC_IVAR___CKTapbackEmojiView_emoji];
  *v8 = 0;
  v8[1] = 0;
  v0[OBJC_IVAR___CKTapbackEmojiView_isSelected] = 0;
  v9 = v0;
  swift_unknownObjectWeakInit();
  v10 = &v9[OBJC_IVAR___CKTapbackEmojiView_frameSize];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  *(_QWORD *)&v9[OBJC_IVAR___CKTapbackEmojiView_displayScale] = 0;
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA658]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)&v9[OBJC_IVAR___CKTapbackEmojiView_contentView] = v11;

  v20.receiver = v9;
  v20.super_class = (Class)type metadata accessor for TapbackEmojiView();
  v12 = (char *)objc_msgSendSuper2(&v20, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v13 = *(_QWORD *)&v12[OBJC_IVAR___CKTapbackEmojiView_contentView];
  v14 = v12;
  objc_msgSend(v14, sel_addSubview_, v13);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECF63C80);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_18E7CE760;
  v16 = sub_18E766794();
  v17 = MEMORY[0x1E0CE9B40];
  *(_QWORD *)(v15 + 32) = v16;
  *(_QWORD *)(v15 + 40) = v17;
  v18 = v14;
  MEMORY[0x193FF2244](v15, sel_displayScaleChanged);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v18;
}

uint64_t type metadata accessor for TapbackEmojiView()
{
  return objc_opt_self();
}

void sub_18E72A2BC()
{
  char *v0;
  double v1;
  double v2;
  double v3;
  char *v4;
  double v5;
  BOOL v6;
  double v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  int IsSingleEmoji;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  double Height;
  char *v19;
  void *v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  CGAffineTransform v40;
  __int128 v41;
  __int128 v42;
  double v43;
  double v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  if (*(_QWORD *)&v0[OBJC_IVAR___CKTapbackEmojiView_emoji + 8])
  {
    sub_18E7669BC();
    objc_msgSend(v0, sel_frame);
    if (v2 == 0.0 && v1 == 0.0)
      goto LABEL_10;
    objc_msgSend(v0, sel_frame);
    v4 = &v0[OBJC_IVAR___CKTapbackEmojiView_frameSize];
    v6 = v5 == *(double *)&v0[OBJC_IVAR___CKTapbackEmojiView_frameSize]
      && v3 == *(double *)&v0[OBJC_IVAR___CKTapbackEmojiView_frameSize + 8];
    if (v6
      && (v7 = *(double *)&v0[OBJC_IVAR___CKTapbackEmojiView_displayScale],
          v8 = objc_msgSend(v0, sel_traitCollection),
          objc_msgSend(v8, sel_displayScale),
          v10 = v9,
          v8,
          v7 == v10))
    {
LABEL_10:
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = (void *)sub_18E768954();
      IsSingleEmoji = CEMStringIsSingleEmoji();

      if (IsSingleEmoji)
      {
        objc_msgSend(v0, sel_frame);
        *(_QWORD *)v4 = v13;
        *((_QWORD *)v4 + 1) = v14;
        v15 = objc_msgSend(v0, sel_traitCollection);
        objc_msgSend(v15, sel_displayScale);
        v17 = v16;

        *(_QWORD *)&v0[OBJC_IVAR___CKTapbackEmojiView_displayScale] = v17;
        v41 = 0x3FF0000000000000uLL;
        *(_QWORD *)&v42 = 0;
        *((_QWORD *)&v42 + 1) = 0x3FF0000000000000;
        v43 = 0.0;
        v44 = 0.0;
        objc_msgSend(v0, sel_frame);
        Height = CGRectGetHeight(v45);
        v19 = &v0[OBJC_IVAR___CKTapbackEmojiView_delegate];
        swift_beginAccess();
        v20 = (void *)MEMORY[0x193FF501C](v19);
        if (v20)
        {
          objc_msgSend(v20, sel_tapbackContentContainerRect);
          x = v46.origin.x;
          y = v46.origin.y;
          width = v46.size.width;
          v24 = v46.size.height;
          v25 = CGRectGetWidth(v46);
          v47.origin.x = x;
          v47.origin.y = y;
          v47.size.width = width;
          v47.size.height = v24;
          v26 = CGRectGetHeight(v47);
          swift_unknownObjectRelease();
          if (v26 >= v25)
            v26 = v25;
        }
        else
        {
          v26 = Height;
        }
        v27 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
        if (v27)
        {
          v28 = v27;
          objc_msgSend(v27, sel_emojiTapbackScaleFactor);

          v29 = sub_18E7664F4();
          if (v29)
          {
            v30 = (void *)v29;
            v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA638]), sel_initWithCGImage_, v29);
            v32 = *(void **)&v0[OBJC_IVAR___CKTapbackEmojiView_contentView];
            objc_msgSend(v32, sel_setImage_, v31);
            v33 = (void *)sub_18E768954();
            swift_bridgeObjectRelease();
            objc_msgSend(v32, sel_setAccessibilityLabel_, v33);

            objc_msgSend(v32, sel_setContentMode_, 0);
            v48.origin.x = 0.0;
            v48.origin.y = 0.0;
            v48.size.width = v26;
            v48.size.height = v26;
            v34 = (CGRectGetHeight(v48) - Height) * 0.5;
            v35 = v43 - v34;
            v36 = v44 - v34;
            objc_msgSend(v31, sel_size);
            v49.size.width = v37;
            v49.size.height = v38;
            *(_OWORD *)&v40.a = v41;
            *(_OWORD *)&v40.c = v42;
            v40.tx = v35;
            v40.ty = v36;
            v49.origin.x = 0.0;
            v49.origin.y = 0.0;
            v50 = CGRectApplyAffineTransform(v49, &v40);
            v39 = (v50.size.height - v26) * 0.5;
            if (v26 >= v50.size.height)
              v39 = 0.0;
            objc_msgSend(v32, sel_setFrame_, v50.origin.x - v39, v50.origin.y - v39, v50.size.width);

          }
          else
          {
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          __break(1u);
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_18E72A6C4();
      }
    }
  }
}

void sub_18E72A6C4()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char *v12;
  char **v13;
  id v14;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_, 50.0);
  v3 = *(void **)&v0[OBJC_IVAR___CKTapbackEmojiView_contentView];
  v4 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_scale_, v2, 3);
  v5 = (void *)sub_18E768954();
  v6 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_withConfiguration_, v5, v4);

  objc_msgSend(v3, sel_setImage_, v6);
  v7 = (void *)sub_18E768954();
  objc_msgSend(v3, sel_setAccessibilityLabel_, v7);

  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v3, sel_setFrame_);
  objc_msgSend(v3, sel_setContentMode_, 1);
  v8 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
  if (!v8)
  {
    __break(1u);
    goto LABEL_7;
  }
  v9 = v8;
  v10 = objc_msgSend(v8, sel_theme);
  if (!v10)
  {
LABEL_7:
    __break(1u);
    return;
  }
  v11 = v10;
  v12 = &v1[OBJC_IVAR___CKTapbackEmojiView_isSelected];
  swift_beginAccess();
  v13 = &selRef_messageAcknowledgmentWhiteColor;
  if (!*v12)
    v13 = &selRef_messageAcknowledgmentGrayColor;
  v14 = objc_msgSend(v11, *v13);
  objc_msgSend(v3, sel_setTintColor_, v14);

}

id TapbackEmojiView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void TapbackEmojiView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TapbackEmojiView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TapbackEmojiView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t TapbackEmojiView.configure(for:isSelected:)(void *a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;

  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v6 = (void *)result;
    v7 = a1;
    v8 = objc_msgSend(v6, sel_associatedMessageEmoji);
    v9 = sub_18E768984();
    v11 = v10;

    v12 = (_BYTE *)(v2 + OBJC_IVAR___CKTapbackEmojiView_isSelected);
    swift_beginAccess();
    *v12 = a2 & 1;
    v13 = (uint64_t *)(v2 + OBJC_IVAR___CKTapbackEmojiView_emoji);
    v14 = *(_QWORD *)(v2 + OBJC_IVAR___CKTapbackEmojiView_emoji + 8);
    if (!v14 || (*v13 == v9 ? (v15 = v14 == v11) : (v15 = 0), !v15 && (sub_18E7693F8() & 1) == 0))
    {
      *v13 = v9;
      v13[1] = v11;
      sub_18E7669BC();
      swift_bridgeObjectRelease();
      sub_18E72A2BC();
    }

    return swift_bridgeObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall TapbackEmojiView.performSendAnimation()()
{
  void *v0;

  objc_msgSend(v0, sel_performViewControllerAppearingAnimation);
}

Swift::Void __swiftcall TapbackEmojiView.prepareForAppearingAnimation()()
{
  void *v0;

  objc_msgSend(v0, sel_setHidden_, 1);
}

Swift::Void __swiftcall TapbackEmojiView.performViewControllerAppearingAnimation()()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  CGAffineTransform v5;

  objc_msgSend(v0, sel_setHidden_, 0);
  CGAffineTransformMakeScale(&v5, 0.001, 0.001);
  objc_msgSend(v0, sel_setTransform_, &v5);
  if (qword_1EE107490 != -1)
    swift_once();
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEABC8]), sel_initWithDuration_timingParameters_, qword_1EE12E038, 0.0);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  *(_QWORD *)&v5.tx = sub_18E672348;
  *(_QWORD *)&v5.ty = v2;
  *(_QWORD *)&v5.a = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v5.b = 1107296256;
  *(_QWORD *)&v5.c = sub_18E521C9C;
  *(_QWORD *)&v5.d = &block_descriptor_71;
  v3 = _Block_copy(&v5);
  v4 = v0;
  swift_release();
  objc_msgSend(v1, sel_addAnimations_, v3);
  _Block_release(v3);
  objc_msgSend(v1, sel_startAnimationAfterDelay_, 0.0);

}

uint64_t sub_18E72AD38()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_18E72AD94@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR___CKTapbackEmojiView_isSelected);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_18E72ADE4(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR___CKTapbackEmojiView_isSelected);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_18E72AE30@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR___CKTapbackEmojiView_delegate;
  swift_beginAccess();
  result = MEMORY[0x193FF501C](v3);
  *a2 = result;
  return result;
}

uint64_t sub_18E72AE84()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t method lookup function for TapbackEmojiView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TapbackEmojiView.isSelected.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of TapbackEmojiView.isSelected.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of TapbackEmojiView.isSelected.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of TapbackEmojiView.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of TapbackEmojiView.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of TapbackEmojiView.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

void sub_18E72AF90()
{
  _BYTE *v0;
  _OWORD *v1;
  _QWORD *v8;
  _QWORD *v9;

  *(_QWORD *)&v0[OBJC_IVAR___CKTapbackEmojiView_attributionScaleFactor] = 0x3FE6A09E667F3BCDLL;
  v1 = &v0[OBJC_IVAR___CKTapbackEmojiView_platterEdgeInsets];
  __asm
  {
    FMOV            V0.2D, #4.0
    FMOV            V1.2D, #-4.0
  }
  *v1 = _Q0;
  v1[1] = _Q1;
  v8 = &v0[OBJC_IVAR___CKTapbackEmojiView_emoji];
  *v8 = 0;
  v8[1] = 0;
  v0[OBJC_IVAR___CKTapbackEmojiView_isSelected] = 0;
  swift_unknownObjectWeakInit();
  v9 = &v0[OBJC_IVAR___CKTapbackEmojiView_frameSize];
  *v9 = 0;
  v9[1] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CKTapbackEmojiView_displayScale] = 0;

  sub_18E769320();
  __break(1u);
}

uint64_t sub_18E72B06C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  swift_getKeyPath();
  sub_18E50F680(&qword_1EE10A778, (uint64_t (*)(uint64_t))type metadata accessor for TapbackAttributionAnimationController, (uint64_t)&unk_18E7D1740);
  sub_18E766464();
  swift_release();
  v4 = v3 + OBJC_IVAR____TtC7ChatKit37TapbackAttributionAnimationController__delegate;
  result = MEMORY[0x193FF501C](v3 + OBJC_IVAR____TtC7ChatKit37TapbackAttributionAnimationController__delegate);
  v6 = *(_QWORD *)(v4 + 8);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_18E72B10C()
{
  swift_getKeyPath();
  sub_18E50F680(&qword_1EE10A778, (uint64_t (*)(uint64_t))type metadata accessor for TapbackAttributionAnimationController, (uint64_t)&unk_18E7D1740);
  swift_unknownObjectRetain();
  sub_18E766458();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_18E72B1C8@<X0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_18E50F680((unint64_t *)&unk_1EE10EED0, (uint64_t (*)(uint64_t))type metadata accessor for TapbackAttributionViewModel, (uint64_t)&protocol conformance descriptor for TapbackAttributionViewModel);
  sub_18E766464();
  swift_release();
  *a2 = *(_OWORD *)(v3 + OBJC_IVAR____TtC7ChatKit27TapbackAttributionViewModel__delegate);
  return swift_unknownObjectRetain();
}

uint64_t sub_18E72B264()
{
  swift_getKeyPath();
  sub_18E50F680((unint64_t *)&unk_1EE10EED0, (uint64_t (*)(uint64_t))type metadata accessor for TapbackAttributionViewModel, (uint64_t)&protocol conformance descriptor for TapbackAttributionViewModel);
  swift_unknownObjectRetain();
  sub_18E766458();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_18E72B320@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_18E50F680((unint64_t *)&unk_1EE10EED0, (uint64_t (*)(uint64_t))type metadata accessor for TapbackAttributionViewModel, (uint64_t)&protocol conformance descriptor for TapbackAttributionViewModel);
  sub_18E766464();
  swift_release();
  *a2 = *(_QWORD *)(v3 + OBJC_IVAR____TtC7ChatKit27TapbackAttributionViewModel__tapbackItems);
  return sub_18E7669BC();
}

uint64_t sub_18E72B3B8()
{
  swift_getKeyPath();
  sub_18E50F680((unint64_t *)&unk_1EE10EED0, (uint64_t (*)(uint64_t))type metadata accessor for TapbackAttributionViewModel, (uint64_t)&protocol conformance descriptor for TapbackAttributionViewModel);
  sub_18E7669BC();
  sub_18E766458();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18E72B470@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_18E50F680((unint64_t *)&unk_1EE10EED0, (uint64_t (*)(uint64_t))type metadata accessor for TapbackAttributionViewModel, (uint64_t)&protocol conformance descriptor for TapbackAttributionViewModel);
  sub_18E766464();
  swift_release();
  v4 = v3 + OBJC_IVAR____TtC7ChatKit27TapbackAttributionViewModel__selectedItem;
  swift_beginAccess();
  return sub_18E6817E8(v4, a2);
}

uint64_t sub_18E72B520(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10AB10);
  MEMORY[0x1E0C80A78](v4);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_18E6817E8(a1, (uint64_t)v6);
  v7 = *a2;
  swift_getKeyPath();
  v10 = v7;
  v11 = v6;
  v12 = v7;
  sub_18E50F680((unint64_t *)&unk_1EE10EED0, (uint64_t (*)(uint64_t))type metadata accessor for TapbackAttributionViewModel, (uint64_t)&protocol conformance descriptor for TapbackAttributionViewModel);
  sub_18E766458();
  swift_release();
  return sub_18E72C910((uint64_t)v6);
}

uint64_t sub_18E72B614@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  char v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_18E50F680((unint64_t *)&unk_1EE10EED0, (uint64_t (*)(uint64_t))type metadata accessor for TapbackAttributionViewModel, (uint64_t)&protocol conformance descriptor for TapbackAttributionViewModel);
  sub_18E766464();
  result = swift_release();
  v5 = *(_BYTE *)(v3 + OBJC_IVAR____TtC7ChatKit27TapbackAttributionViewModel__maxViewWidth + 8);
  *(_QWORD *)a2 = *(_QWORD *)(v3 + OBJC_IVAR____TtC7ChatKit27TapbackAttributionViewModel__maxViewWidth);
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_18E72B6B4()
{
  swift_getKeyPath();
  sub_18E50F680((unint64_t *)&unk_1EE10EED0, (uint64_t (*)(uint64_t))type metadata accessor for TapbackAttributionViewModel, (uint64_t)&protocol conformance descriptor for TapbackAttributionViewModel);
  sub_18E766458();
  return swift_release();
}

uint64_t sub_18E72B7B8()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t sub_18E72B864(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_delegate);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_18E72B8B4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_delegate);
  swift_beginAccess();
  *v3 = v2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_18E72B91C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

char *CKTapbackAttributionView.__allocating_init(messagePartChatItem:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return CKTapbackAttributionView.init(messagePartChatItem:)(a1);
}

char *CKTapbackAttributionView.init(messagePartChatItem:)(void *a1)
{
  char *v1;
  id v2;
  char *v3;
  _QWORD *v4;
  id v5;
  char *v6;
  uint64_t v7;
  double v8;
  id v14;
  char *v15;
  void *v16;
  char *v17;
  id v18;
  void *v19;
  char *v20;
  id v21;
  objc_super v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  *(_QWORD *)&v1[OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_delegate] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_hostedView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_messagePartChatItem] = a1;
  v2 = a1;
  v3 = v1;
  v4 = (_QWORD *)sub_18E67FE9C(v2);
  v5 = objc_allocWithZone((Class)type metadata accessor for TapbackAttributionViewModel());
  v6 = (char *)sub_18E68151C(v2, v4);
  *(_QWORD *)&v3[OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_viewModel] = v6;
  swift_getKeyPath();
  v24 = *(double *)&v6;
  sub_18E50F680((unint64_t *)&unk_1EE10EED0, (uint64_t (*)(uint64_t))type metadata accessor for TapbackAttributionViewModel, (uint64_t)&protocol conformance descriptor for TapbackAttributionViewModel);
  sub_18E766464();
  swift_release();
  v7 = *(_QWORD *)(*(_QWORD *)&v6[OBJC_IVAR____TtC7ChatKit27TapbackAttributionViewModel__tapbackItems] + 16);
  v8 = dbl_18E7DE300[v7 == 2];
  if (v7 == 1)
    v8 = 0.3;
  v24 = v8;
  v25 = xmmword_18E7DE310;
  v26 = xmmword_18E7DE320;
  __asm { FMOV            V0.2D, #1.0 }
  v27 = _Q0;
  v28 = xmmword_18E7C9190;
  v29 = 0;
  v14 = objc_allocWithZone((Class)type metadata accessor for TapbackAttributionAnimationController());
  *(_QWORD *)&v3[OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_transitionController] = sub_18E57FE3C((__int128 *)&v24);

  v23.receiver = v3;
  v23.super_class = (Class)type metadata accessor for CKTapbackAttributionView();
  v15 = (char *)objc_msgSendSuper2(&v23, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v16 = *(void **)&v15[OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_viewModel];
  swift_getKeyPath();
  v17 = v15;
  v18 = v16;
  sub_18E766458();

  swift_release();
  v19 = *(void **)&v17[OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_transitionController];
  swift_getKeyPath();
  sub_18E50F680(&qword_1EE10A778, (uint64_t (*)(uint64_t))type metadata accessor for TapbackAttributionAnimationController, (uint64_t)&unk_18E7D1740);
  v20 = v17;
  v21 = v19;
  sub_18E766458();

  swift_release();
  sub_18E72BD40();

  return v20;
}

uint64_t sub_18E72BD40()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112C30);
  MEMORY[0x1E0C80A78](v2);
  v4 = (uint64_t *)((char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = type metadata accessor for TapbackAttributionView();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (uint64_t *)((char *)&v22 - v9);
  v11 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v1, sel_setBackgroundColor_, v11);

  v12 = *(void **)&v1[OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_viewModel];
  v13 = *(void **)&v1[OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_transitionController];
  *v4 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)((char *)v10 + *(int *)(v5 + 28)) = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE108780);
  swift_storeEnumTagMultiPayload();
  v23 = v12;
  type metadata accessor for TapbackAttributionViewModel();
  v14 = v12;
  v15 = v13;
  sub_18E768210();
  v16 = v25;
  *v10 = v24;
  v10[1] = v16;
  v23 = v15;
  type metadata accessor for TapbackAttributionAnimationController();
  sub_18E768210();
  v17 = v25;
  v10[2] = v24;
  v10[3] = v17;
  sub_18E72CC5C((uint64_t)v4, (uint64_t)v10 + *(int *)(v5 + 24));
  sub_18E72CCA4((uint64_t)v10, (uint64_t)v7);
  v18 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE111DF8));
  v19 = sub_18E766FD4();
  objc_msgSend(v1, sel_addSubview_, v19);
  v20 = *(void **)&v1[OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_hostedView];
  *(_QWORD *)&v1[OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_hostedView] = v19;

  return sub_18E565AE0((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for TapbackAttributionView);
}

void sub_18E72BF98()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t KeyPath;
  id v5;
  void *v6;
  objc_super v7;

  v1 = v0;
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for CKTapbackAttributionView();
  objc_msgSendSuper2(&v7, sel_layoutSubviews);
  v2 = *(void **)&v0[OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_hostedView];
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v0, sel_bounds);
    KeyPath = swift_getKeyPath();
    MEMORY[0x1E0C80A78](KeyPath);
    sub_18E50F680((unint64_t *)&unk_1EE10EED0, (uint64_t (*)(uint64_t))type metadata accessor for TapbackAttributionViewModel, (uint64_t)&protocol conformance descriptor for TapbackAttributionViewModel);
    sub_18E766458();
    swift_release();
    v5 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_attributionViewHeight);

      objc_msgSend(v1, sel_bounds);
      objc_msgSend(v3, sel_setFrame_, 0.0, 0.0);

    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_18E72C16C()
{
  return sub_18E72C1A8("Presenting tapback attribution view.", sub_18E57FF50);
}

uint64_t sub_18E72C194()
{
  return sub_18E72C1A8("Dismissing tapback attribution view.", sub_18E5805D0);
}

uint64_t sub_18E72C1A8(const char *a1, uint64_t (*a2)(void))
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  if (qword_1EE1075C8 != -1)
    swift_once();
  v4 = sub_18E7666F8();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EE12E0B0);
  v5 = sub_18E7666E0();
  v6 = sub_18E768D50();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_18DFCD000, v5, v6, a1, v7, 2u);
    MEMORY[0x193FF4F20](v7, -1, -1);
  }

  return a2();
}

void sub_18E72C2A8(void *a1, uint64_t a2, const char *a3, void (*a4)(void))
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;

  v6 = qword_1EE1075C8;
  v11 = a1;
  if (v6 != -1)
    swift_once();
  v7 = sub_18E7666F8();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EE12E0B0);
  v8 = sub_18E7666E0();
  v9 = sub_18E768D50();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_18DFCD000, v8, v9, a3, v10, 2u);
    MEMORY[0x193FF4F20](v10, -1, -1);
  }

  a4();
}

id sub_18E72C3A8(uint64_t a1, CGFloat a2, CGFloat a3)
{
  char *v3;
  void *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  objc_class *v21;
  id v22;
  objc_class *v23;
  uint64_t v25;
  objc_super v26;
  objc_super v27;
  uint64_t v28;
  CGPoint v29;
  CGRect v30;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10AB10);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for AttributedTapbackItem();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)&v3[OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_viewModel];
  swift_getKeyPath();
  v28 = v15;
  sub_18E50F680((unint64_t *)&unk_1EE10EED0, (uint64_t (*)(uint64_t))type metadata accessor for TapbackAttributionViewModel, (uint64_t)&protocol conformance descriptor for TapbackAttributionViewModel);
  sub_18E766464();
  swift_release();
  v16 = v15 + OBJC_IVAR____TtC7ChatKit27TapbackAttributionViewModel__selectedItem;
  swift_beginAccess();
  sub_18E6817E8(v16, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_18E72C910((uint64_t)v10);
    v17 = sub_18E67E570();
  }
  else
  {
    sub_18E681838((uint64_t)v10, (uint64_t)v14);
    v17 = sub_18E67D808((uint64_t)v14);
    sub_18E565AE0((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for AttributedTapbackItem);
  }
  objc_msgSend(v4, sel_bounds);
  if (v18 <= v17)
  {
    v23 = (objc_class *)type metadata accessor for CKTapbackAttributionView();
    v26.receiver = v4;
    v26.super_class = v23;
    v22 = objc_msgSendSuper2(&v26, sel_hitTest_withEvent_, a1, a2, a3);
    return v22;
  }
  objc_msgSend(v4, sel_bounds);
  v20 = (v19 - v17) * 0.5;
  objc_msgSend(v4, sel_bounds);
  v30.origin.y = 0.0;
  v30.origin.x = v20;
  v30.size.width = v17;
  v29.x = a2;
  v29.y = a3;
  if (CGRectContainsPoint(v30, v29))
  {
    v21 = (objc_class *)type metadata accessor for CKTapbackAttributionView();
    v27.receiver = v4;
    v27.super_class = v21;
    v22 = objc_msgSendSuper2(&v27, sel_hitTest_withEvent_, a1, a2, a3);
    return v22;
  }
  return 0;
}

id CKTapbackAttributionView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void CKTapbackAttributionView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CKTapbackAttributionView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CKTapbackAttributionView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CKTapbackAttributionView()
{
  return objc_opt_self();
}

uint64_t sub_18E72C8A4()
{
  uint64_t *v0;

  return sub_18E67D9A4(v0[2], v0[3], v0[4]);
}

uint64_t sub_18E72C8C8()
{
  uint64_t *v0;

  return sub_18E57F6A4(v0[2], v0[3], v0[4]);
}

uint64_t sub_18E72C8EC()
{
  uint64_t v0;

  return sub_18E67DCAC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
}

uint64_t sub_18E72C910(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10AB10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_18E72C950@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_delegate);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t method lookup function for CKTapbackAttributionView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CKTapbackAttributionView.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CKTapbackAttributionView.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of CKTapbackAttributionView.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CKTapbackAttributionView.__allocating_init(messagePartChatItem:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of CKTapbackAttributionView.present()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of CKTapbackAttributionView.dismiss()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

void sub_18E72CA48()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[4];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10AB10);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for AttributedTapbackItem();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)&v0[OBJC_IVAR____TtC7ChatKit24CKTapbackAttributionView_viewModel];
  swift_getKeyPath();
  v13[1] = v9;
  sub_18E50F680((unint64_t *)&unk_1EE10EED0, (uint64_t (*)(uint64_t))type metadata accessor for TapbackAttributionViewModel, (uint64_t)&protocol conformance descriptor for TapbackAttributionViewModel);
  sub_18E766464();
  swift_release();
  v10 = v9 + OBJC_IVAR____TtC7ChatKit27TapbackAttributionViewModel__selectedItem;
  swift_beginAccess();
  sub_18E6817E8(v10, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_18E72C910((uint64_t)v4);
    sub_18E67E570();
  }
  else
  {
    sub_18E681838((uint64_t)v4, (uint64_t)v8);
    sub_18E67D808((uint64_t)v8);
    sub_18E565AE0((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for AttributedTapbackItem);
  }
  objc_msgSend(v1, sel_bounds);
  v11 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, sel_attributionViewHeight);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_18E72CC5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112C30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18E72CCA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TapbackAttributionView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18E72CCE8()
{
  uint64_t v0;

  return sub_18E67DA78(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_18E72CD00()
{
  return sub_18E72C8EC();
}

uint64_t sub_18E72CD14()
{
  return sub_18E72C8C8();
}

uint64_t sub_18E72CD28()
{
  return sub_18E72C8A4();
}

uint64_t _s11ContentViewVwxx_0(id *a1)
{

  return swift_release();
}

uint64_t _s11ContentViewVwcp_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v5 = v3;
  swift_retain();
  return a1;
}

uint64_t _s11ContentViewVwca_0(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s11ContentViewVwta_0(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  return a1;
}

ValueMetadata *_s11ContentViewVMa_0()
{
  return &_s11ContentViewVN_0;
}

uint64_t sub_18E72CE74()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_18E72CE84@<X0>(void *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id result;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t OpaqueTypeConformance2;
  char v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v43 = a5;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE111E08);
  v44 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = a1;
  v46 = a2;
  v42 = a3;
  v47 = a3 & 1;
  v48 = a4;
  result = CKFrameworkBundle();
  if (result)
  {
    v13 = result;
    v14 = (void *)sub_18E768954();
    v15 = (void *)sub_18E768954();
    v16 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v14, 0, v15);

    v17 = sub_18E768984();
    v19 = v18;

    v57 = v17;
    v58 = v19;
    sub_18E5201D4();
    v57 = sub_18E767C94();
    v58 = v20;
    LOBYTE(v59) = v21 & 1;
    v60 = v22;
    result = CKFrameworkBundle();
    if (result)
    {
      v23 = result;
      v24 = (void *)sub_18E768954();
      v25 = (void *)sub_18E768954();
      v26 = objc_msgSend(v23, sel_localizedStringForKey_value_table_, v24, 0, v25);

      v27 = sub_18E768984();
      v29 = v28;

      v53 = v27;
      v54 = v29;
      v53 = sub_18E767C94();
      v54 = v30;
      v55 = v31 & 1;
      v56 = v32;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE111E38);
      v33 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE111E18);
      v34 = sub_18E76746C();
      v35 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE111E20);
      v36 = sub_18E514BB4(&qword_1EE111E28, &qword_1EE111E20, MEMORY[0x1E0CDFBB8]);
      v49 = v35;
      v50 = v36;
      OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
      v49 = v33;
      v50 = v34;
      v51 = OpaqueTypeConformance2;
      v52 = MEMORY[0x1E0CDAA98];
      swift_getOpaqueTypeConformance2();
      sub_18E7683CC();
      v57 = a2;
      v38 = v42 & 1;
      LOBYTE(v58) = v42 & 1;
      v59 = a4;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE111E40);
      sub_18E76821C();
      v57 = v53;
      LOBYTE(v58) = v54;
      v39 = swift_allocObject();
      *(_QWORD *)(v39 + 16) = a1;
      *(_QWORD *)(v39 + 24) = a2;
      *(_BYTE *)(v39 + 32) = v38;
      *(_QWORD *)(v39 + 40) = a4;
      swift_retain();
      v40 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10DBB8);
      sub_18E72DF7C();
      sub_18E72E0E8(&qword_1EE111E30, &qword_1EE107E10, (uint64_t)&unk_18E7CC930, MEMORY[0x1E0DEE998]);
      sub_18E767FE8();
      swift_release();
      return (id)(*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v11, v9);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_18E72D288@<X0>(uint64_t a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
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
  _QWORD v21[4];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v25 = a4;
  v24 = sub_18E76746C();
  v26 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE111E20);
  v22 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE111E18);
  v23 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_18E767544();
  v21[2] = v16;
  v21[3] = v15;
  v21[1] = v17;
  v27 = a1;
  v28 = a2 & 1;
  v29 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE111E40);
  sub_18E768234();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10DBB8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE111E48);
  sub_18E72E0E8(&qword_1EE111E50, &qword_1EE111E58, (uint64_t)&unk_18E7CC8EC, MEMORY[0x1E0DEE990]);
  sub_18E514BB4(&qword_1EE111E60, &qword_1EE111E48, MEMORY[0x1E0CE0680]);
  sub_18E7682E8();
  v18 = sub_18E514BB4(&qword_1EE111E28, &qword_1EE111E20, MEMORY[0x1E0CDFBB8]);
  sub_18E767D78();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v9);
  sub_18E767460();
  v30 = v9;
  v31 = v18;
  swift_getOpaqueTypeConformance2();
  v19 = v24;
  sub_18E767D48();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v12);
}

id sub_18E72D53C@<X0>(uint64_t a1@<X8>)
{
  id result;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  char v62;
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
  char v75;
  char v76;
  char v77;
  int v78;
  __int16 v79;
  _BYTE v80[7];
  int v81;
  char v82;
  int v83;
  __int16 v84;
  _BYTE v85[7];
  int v86;
  char v87;
  int v88;
  __int16 v89;
  _BYTE v90[7];
  int v91;
  char v92;
  int v93;
  __int16 v94;
  _BYTE v95[7];
  int v96;
  char v97;
  int v98;
  __int16 v99;
  int v100;
  char v101;
  int v102;
  __int16 v103;
  uint64_t v104;

  result = CKFrameworkBundle();
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  v3 = result;
  v4 = (void *)sub_18E768954();
  v5 = (void *)sub_18E768954();
  v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_18E768984();
  sub_18E5201D4();
  v7 = sub_18E767C94();
  v9 = v8;
  v61 = v10;
  v12 = v11;
  result = CKFrameworkBundle();
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v13 = result;
  v14 = (void *)sub_18E768954();
  v15 = (void *)sub_18E768954();
  v16 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v14, 0, v15);

  sub_18E768984();
  v17 = sub_18E767C94();
  v19 = v18;
  v60 = v20;
  v22 = v21;
  result = CKFrameworkBundle();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v23 = result;
  v70 = v19;
  v74 = v17;
  v24 = (void *)sub_18E768954();
  v25 = (void *)sub_18E768954();
  v26 = objc_msgSend(v23, sel_localizedStringForKey_value_table_, v24, 0, v25);

  sub_18E768984();
  v27 = sub_18E767C94();
  v72 = v28;
  v73 = v27;
  v30 = v29;
  v69 = v31;
  result = CKFrameworkBundle();
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v32 = result;
  v33 = (void *)sub_18E768954();
  v34 = (void *)sub_18E768954();
  v35 = objc_msgSend(v32, sel_localizedStringForKey_value_table_, v33, 0, v34);

  sub_18E768984();
  v36 = sub_18E767C94();
  v66 = v37;
  v67 = v36;
  v39 = v38;
  v68 = v40;
  result = CKFrameworkBundle();
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v41 = result;
  v71 = v12;
  v65 = v7;
  v42 = (void *)sub_18E768954();
  v43 = (void *)sub_18E768954();
  v44 = objc_msgSend(v41, sel_localizedStringForKey_value_table_, v42, 0, v43);

  sub_18E768984();
  v59 = sub_18E767C94();
  v63 = v45;
  v64 = v46;
  v48 = v47;
  result = CKFrameworkBundle();
  if (result)
  {
    v49 = result;
    v50 = (void *)sub_18E768954();
    v51 = (void *)sub_18E768954();
    v52 = objc_msgSend(v49, sel_localizedStringForKey_value_table_, v50, 0, v51);

    v53 = sub_18E768984();
    v104 = v53;
    v54 = sub_18E767C94();
    v77 = v61 & 1;
    v76 = v48 & 1;
    v75 = v55 & 1;
    *(_QWORD *)a1 = v65;
    *(_QWORD *)(a1 + 8) = v9;
    *(_BYTE *)(a1 + 16) = v61 & 1;
    *(_QWORD *)(a1 + 24) = v71;
    *(_QWORD *)(a1 + 32) = 1;
    *(_WORD *)(a1 + 40) = 0;
    *(_DWORD *)(a1 + 42) = v102;
    *(_WORD *)(a1 + 46) = v103;
    *(_QWORD *)(a1 + 48) = 1;
    *(_WORD *)(a1 + 56) = 0;
    *(_BYTE *)(a1 + 58) = 0;
    *(_DWORD *)(a1 + 59) = v100;
    *(_BYTE *)(a1 + 63) = v101;
    *(_QWORD *)(a1 + 64) = v74;
    *(_QWORD *)(a1 + 72) = v70;
    *(_BYTE *)(a1 + 80) = v60 & 1;
    *(_DWORD *)(a1 + 84) = *(_DWORD *)((char *)&v104 + 3);
    *(_DWORD *)(a1 + 81) = v104;
    *(_QWORD *)(a1 + 88) = v22;
    *(_QWORD *)(a1 + 96) = 2;
    *(_WORD *)(a1 + 104) = 0;
    *(_WORD *)(a1 + 110) = v99;
    *(_DWORD *)(a1 + 106) = v98;
    *(_QWORD *)(a1 + 112) = 2;
    *(_WORD *)(a1 + 120) = 0;
    *(_BYTE *)(a1 + 122) = 0;
    *(_DWORD *)(a1 + 123) = v96;
    *(_BYTE *)(a1 + 127) = v97;
    *(_QWORD *)(a1 + 128) = v73;
    *(_QWORD *)(a1 + 136) = v72;
    *(_BYTE *)(a1 + 144) = v30 & 1;
    *(_DWORD *)(a1 + 148) = *(_DWORD *)&v95[3];
    *(_DWORD *)(a1 + 145) = *(_DWORD *)v95;
    *(_QWORD *)(a1 + 152) = v69;
    *(_QWORD *)(a1 + 160) = 3;
    *(_WORD *)(a1 + 168) = 0;
    *(_DWORD *)(a1 + 170) = v93;
    *(_WORD *)(a1 + 174) = v94;
    *(_QWORD *)(a1 + 176) = 3;
    *(_WORD *)(a1 + 184) = 0;
    *(_BYTE *)(a1 + 186) = 0;
    *(_BYTE *)(a1 + 191) = v92;
    *(_DWORD *)(a1 + 187) = v91;
    *(_QWORD *)(a1 + 192) = v67;
    *(_QWORD *)(a1 + 200) = v66;
    *(_BYTE *)(a1 + 208) = v39 & 1;
    *(_DWORD *)(a1 + 209) = *(_DWORD *)v90;
    *(_DWORD *)(a1 + 212) = *(_DWORD *)&v90[3];
    *(_QWORD *)(a1 + 216) = v68;
    *(_QWORD *)(a1 + 224) = 4;
    *(_WORD *)(a1 + 232) = 0;
    *(_WORD *)(a1 + 238) = v89;
    *(_DWORD *)(a1 + 234) = v88;
    *(_QWORD *)(a1 + 240) = 4;
    *(_WORD *)(a1 + 248) = 0;
    *(_BYTE *)(a1 + 250) = 0;
    *(_BYTE *)(a1 + 255) = v87;
    *(_DWORD *)(a1 + 251) = v86;
    *(_QWORD *)(a1 + 256) = v59;
    *(_QWORD *)(a1 + 264) = v63;
    *(_BYTE *)(a1 + 272) = v48 & 1;
    *(_DWORD *)(a1 + 273) = *(_DWORD *)v85;
    *(_DWORD *)(a1 + 276) = *(_DWORD *)&v85[3];
    *(_QWORD *)(a1 + 280) = v64;
    *(_QWORD *)(a1 + 288) = 5;
    *(_WORD *)(a1 + 296) = 0;
    *(_DWORD *)(a1 + 298) = v83;
    *(_WORD *)(a1 + 302) = v84;
    *(_QWORD *)(a1 + 304) = 5;
    *(_WORD *)(a1 + 312) = 0;
    *(_BYTE *)(a1 + 314) = 0;
    *(_DWORD *)(a1 + 315) = v81;
    *(_BYTE *)(a1 + 319) = v82;
    *(_QWORD *)(a1 + 320) = v54;
    *(_QWORD *)(a1 + 328) = v56;
    v57 = v56;
    *(_BYTE *)(a1 + 336) = v55 & 1;
    *(_DWORD *)(a1 + 340) = *(_DWORD *)&v80[3];
    *(_DWORD *)(a1 + 337) = *(_DWORD *)v80;
    *(_QWORD *)(a1 + 344) = v58;
    *(_QWORD *)(a1 + 352) = 6;
    *(_WORD *)(a1 + 360) = 0;
    *(_WORD *)(a1 + 366) = v79;
    *(_DWORD *)(a1 + 362) = v78;
    *(_QWORD *)(a1 + 368) = 6;
    *(_WORD *)(a1 + 376) = 0;
    *(_BYTE *)(a1 + 378) = 0;
    v62 = v55 & 1;
    sub_18E5282E4(v65, v9, v77);
    sub_18E7669BC();
    sub_18E5282E4(v74, v70, v60 & 1);
    sub_18E7669BC();
    sub_18E5282E4(v73, v72, v30 & 1);
    sub_18E7669BC();
    sub_18E5282E4(v67, v66, v39 & 1);
    sub_18E7669BC();
    sub_18E5282E4(v59, v63, v76);
    sub_18E7669BC();
    sub_18E5282E4(v54, v57, v75);
    sub_18E7669BC();
    sub_18E52836C(v54, v57, v62);
    swift_bridgeObjectRelease();
    sub_18E52836C(v59, v63, v76);
    swift_bridgeObjectRelease();
    sub_18E52836C(v67, v66, v39 & 1);
    swift_bridgeObjectRelease();
    sub_18E52836C(v73, v72, v30 & 1);
    swift_bridgeObjectRelease();
    sub_18E52836C(v74, v70, v60 & 1);
    swift_bridgeObjectRelease();
    sub_18E52836C(v65, v9, v77);
    return (id)swift_bridgeObjectRelease();
  }
LABEL_13:
  __break(1u);
  return result;
}

void sub_18E72DDE8(int a1, uint64_t a2, char *a3)
{
  char v3;
  char *v4;
  id v5;
  id v6;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = &a3[OBJC_IVAR___CKReportSpamReasonContoller_reportSpamReson];
  *(_QWORD *)v4 = *(_QWORD *)a2;
  v4[8] = v3;
  v5 = objc_msgSend(a3, sel_navigationItem);
  v6 = objc_msgSend(v5, sel_rightBarButtonItem);

  if (v6)
  {
    objc_msgSend(v6, sel_setEnabled_, 1);

  }
}

uint64_t sub_18E72DE90()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE111E00);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE111E08);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE10DBB8);
  sub_18E72DF7C();
  sub_18E72E0E8(&qword_1EE111E30, &qword_1EE107E10, (uint64_t)&unk_18E7CC930, MEMORY[0x1E0DEE998]);
  swift_getOpaqueTypeConformance2();
  return sub_18E767BA4();
}

uint64_t sub_18E72DF70()
{
  return sub_18E72E088((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))sub_18E72CE84);
}

unint64_t sub_18E72DF7C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t OpaqueTypeConformance2;
  _QWORD v5[7];

  result = qword_1EE111E10;
  if (!qword_1EE111E10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE111E08);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE111E18);
    v3 = sub_18E76746C();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE111E20);
    sub_18E514BB4(&qword_1EE111E28, &qword_1EE111E20, MEMORY[0x1E0CDFBB8]);
    v5[3] = v2;
    v5[4] = v3;
    v5[5] = swift_getOpaqueTypeConformance2();
    v5[6] = MEMORY[0x1E0CDAA98];
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v5[0] = MEMORY[0x1E0CDDD58];
    v5[1] = OpaqueTypeConformance2;
    v5[2] = MEMORY[0x1E0CDDD58];
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CDFF98], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1EE111E10);
  }
  return result;
}

uint64_t sub_18E72E07C()
{
  return sub_18E72E088((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))sub_18E72D288);
}

uint64_t sub_18E72E088(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v1;

  return a1(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_18E72E0A4()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_18E72E0D0(int a1, uint64_t a2)
{
  uint64_t v2;

  sub_18E72DDE8(a1, a2, *(char **)(v2 + 16));
}

uint64_t sub_18E72E0E8(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE10DBB8);
    v10 = sub_18DFD2324(a2, a3);
    result = MEMORY[0x193FF4E54](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18E72E164()
{
  return sub_18E514BB4(&qword_1EE111E68, (uint64_t *)&unk_1EE111E70, MEMORY[0x1E0CDD898]);
}

void sub_18E72E190()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v1 = OBJC_IVAR___CKCarouselBalloonView_carouselStackView;
  v2 = *(void **)&v0[OBJC_IVAR___CKCarouselBalloonView_carouselStackView];
  if (v2)
    objc_msgSend(v2, sel_removeFromSuperview);
  v3 = objc_msgSend((id)objc_opt_self(), sel_genericStackViewWithItemAspectRatio_, *(double *)&v0[OBJC_IVAR___CKCarouselBalloonView_preferredBalloonSize]/ *(double *)&v0[OBJC_IVAR___CKCarouselBalloonView_preferredBalloonSize + 8]);
  if (v3)
  {
    v4 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v3;
    v5 = v3;

    v11 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CarouselBalloonViewDataSourceManager()), sel_init);
    objc_msgSend(v5, sel_setDataSourceManager_, v11);
    v6 = objc_msgSend(v11, sel_dataSource);
    type metadata accessor for CarouselBalloonViewDataSource();
    v7 = swift_dynamicCastClass();
    if (!v7)
    {

      v7 = 0;
    }
    v8 = *(void **)&v0[OBJC_IVAR___CKCarouselBalloonView_dataSource];
    *(_QWORD *)&v0[OBJC_IVAR___CKCarouselBalloonView_dataSource] = v7;

    objc_msgSend(v5, sel_setViewClass_, swift_getObjCClassFromMetadata());
    objc_msgSend(v5, sel_setCarouselDelegate_, v0);
    objc_msgSend(v0, sel_addSubview_, v5);

    v9 = v11;
  }
  else
  {
    v10 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = 0;

    v9 = *(void **)&v0[OBJC_IVAR___CKCarouselBalloonView_dataSource];
    *(_QWORD *)&v0[OBJC_IVAR___CKCarouselBalloonView_dataSource] = 0;
  }

}

id sub_18E72E4F8()
{
  return sub_18E52E5A8(type metadata accessor for CarouselBalloonView);
}

uint64_t type metadata accessor for CarouselBalloonView()
{
  return objc_opt_self();
}

id sub_18E72E6A8()
{
  return sub_18E52E5A8(type metadata accessor for CarouselBalloonViewDataSourceManager);
}

uint64_t type metadata accessor for CarouselBalloonViewDataSourceManager()
{
  return objc_opt_self();
}

id sub_18E72E760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  id result;
  uint64_t v8;

  v4 = *(_QWORD *)(v3 + OBJC_IVAR____TtC7ChatKit29CarouselBalloonViewDataSource_items);
  if (!v4)
    return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E38]), sel_init);
  if (v4 >> 62)
  {
    sub_18E7669BC();
    result = (id)sub_18E769338();
    if ((uint64_t)result > a3)
      goto LABEL_4;
    goto LABEL_10;
  }
  v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  result = (id)sub_18E7669BC();
  if (v6 <= a3)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E38]), sel_init);
  }
LABEL_4:
  if ((v4 & 0xC000000000000001) != 0)
  {
    v8 = MEMORY[0x193FF25B0](a3, v4);
    goto LABEL_8;
  }
  if (a3 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a3)
  {
    v8 = *(_QWORD *)(v4 + 8 * a3 + 32);
    swift_unknownObjectRetain();
LABEL_8:
    swift_bridgeObjectRelease();
    return (id)v8;
  }
  __break(1u);
  return result;
}

id sub_18E72E8E0()
{
  return sub_18E52E5A8(type metadata accessor for CarouselBalloonViewDataSource);
}

uint64_t type metadata accessor for CarouselBalloonViewDataSource()
{
  return objc_opt_self();
}

double CGSizeScaledToFit(double a1, double a2, double a3, double a4)
{
  return a3 * fmin(a1 / a3, a2 / a4);
}

id sub_18E72EB08()
{
  char *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  objc_super v7;

  *(_QWORD *)&v0[OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for TapbackPickerInputController();
  v1 = objc_msgSendSuper2(&v7, sel_initWithFrame_textContainer_, 0, 0.0, 0.0, 0.0, 0.0);
  if (CKIsRunningInMessagesNotificationExtension())
    objc_msgSend(v1, sel_setKeyboardAppearance_, 1);
  objc_msgSend(v1, sel_setKeyboardType_, 124);
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v3 = objc_msgSend(v2, sel_payloadDelegate);
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  if (v2)
  {
    objc_msgSend(v2, sel_setPayloadDelegate_, v1);
    v4 = v2;
    v5 = (void *)sub_18E768AC8();
    objc_msgSend(v4, sel_setSupportedPayloadIds_, v5);

  }
  objc_msgSend(v1, sel_setForceDisableDictation_, 1);

  return v1;
}

id sub_18E72ECA8()
{
  char *v0;
  id result;
  void *v2;
  objc_super v3;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v2 = result;
    objc_msgSend(result, sel_setPayloadDelegate_, MEMORY[0x193FF501C](&v0[OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_previousPayloadDelegate]));
    swift_unknownObjectRelease();

    v3.receiver = v0;
    v3.super_class = (Class)type metadata accessor for TapbackPickerInputController();
    return objc_msgSendSuper2(&v3, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_18E72EE34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t ObjectType;
  os_log_type_t v29;
  uint8_t *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  uint8_t *v39;
  NSObject *v40;
  uint8_t *v41;
  id v42;
  NSObject *v43;
  NSObject *oslog;

  v4 = v3;
  if (qword_1EE0FAEB8 != -1)
    swift_once();
  v8 = sub_18E7666F8();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EE12DCA8);
  v9 = sub_18E7666E0();
  v10 = sub_18E768D50();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_18DFCD000, v9, v10, "handlePayloadCalled!", v11, 2u);
    MEMORY[0x193FF4F20](v11, -1, -1);
  }

  v12 = sub_18E768984();
  if (!a3)
  {
    swift_bridgeObjectRelease();
    if (!a1)
      goto LABEL_21;
LABEL_14:
    if (sub_18E72F358(a1))
    {
      v16 = (void *)sub_18E768864();
      swift_bridgeObjectRelease();
      v17 = __ck_UIStickerCreateStickerFromTextInputPayload(v16);

      if (!v17)
      {
        oslog = sub_18E7666E0();
        v29 = sub_18E768D68();
        if (!os_log_type_enabled(oslog, v29))
          goto LABEL_36;
        v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v30 = 0;
        v31 = "Could not convert payload to _UISticker";
        goto LABEL_23;
      }
      oslog = v17;
      v18 = -[NSObject _ck_plainStringEmojiText](oslog, sel__ck_plainStringEmojiText);
      if (!v18)
      {
        v35 = -[NSObject _ck_shouldInsertInTapbackAsAdaptiveImageGlyph](oslog, sel__ck_shouldInsertInTapbackAsAdaptiveImageGlyph);
        v36 = sub_18E7666E0();
        v37 = sub_18E768D5C();
        v38 = os_log_type_enabled(v36, v37);
        if (v35)
        {
          if (v38)
          {
            v39 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v39 = 0;
            _os_log_impl(&dword_18DFCD000, v36, v37, "Handling sticker tapback payload as adaptive image glyph backed sticker", v39, 2u);
            MEMORY[0x193FF4F20](v39, -1, -1);
          }

          v43 = __ck_UIStickerCreateAdaptiveImageGlyphFromSticker();
        }
        else
        {
          if (v38)
          {
            v41 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v41 = 0;
            _os_log_impl(&dword_18DFCD000, v36, v37, "Handling sticker tapback payload as non-adaptive sticker", v41, 2u);
            MEMORY[0x193FF4F20](v41, -1, -1);
          }

          v43 = 0;
        }
        v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D39B18]), sel_initWithUISticker_adaptiveImageGlyph_, oslog, v43);
        sub_18E72F7BC(v42);

        v40 = v43;
        goto LABEL_37;
      }
      v19 = v18;
      v20 = sub_18E768984();
      v22 = v21;

      v23 = sub_18E7666E0();
      v24 = sub_18E768D5C();
      if (os_log_type_enabled(v23, v24))
      {
        v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_18DFCD000, v23, v24, "Handling sticker tapback payload as emoji string", v25, 2u);
        MEMORY[0x193FF4F20](v25, -1, -1);
      }

      v26 = v4 + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate;
      if (MEMORY[0x193FF501C](v4 + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate))
      {
        v27 = *(_QWORD *)(v26 + 8);
        ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 16))(v4, v20, v22, ObjectType, v27);
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }

LABEL_36:
      v40 = oslog;
LABEL_37:

      return;
    }
LABEL_21:
    oslog = sub_18E7666E0();
    v29 = sub_18E768D68();
    if (os_log_type_enabled(oslog, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      v31 = "Could not convert payload to expected dictionary type";
LABEL_23:
      _os_log_impl(&dword_18DFCD000, oslog, v29, v31, v30, 2u);
      MEMORY[0x193FF4F20](v30, -1, -1);
      goto LABEL_36;
    }
    goto LABEL_36;
  }
  if (v12 == a2 && v13 == a3)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = sub_18E7693F8();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      if (!a1)
        goto LABEL_21;
      goto LABEL_14;
    }
  }
  v32 = v3 + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate;
  if (MEMORY[0x193FF501C](v3 + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate))
  {
    v33 = *(_QWORD *)(v32 + 8);
    v34 = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 24))(v3, a1, a2, a3, v34, v33);
    swift_unknownObjectRelease();
  }
}

unint64_t sub_18E72F358(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t result;
  int64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  __int128 v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  __int128 v24;
  _OWORD v25[2];
  _OWORD v26[2];
  __int128 v27;
  _OWORD v28[2];
  _OWORD v29[2];
  _OWORD v30[2];
  _OWORD v31[2];
  uint64_t v32;
  _OWORD v33[2];
  _OWORD v34[2];
  uint64_t v35;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0F5100);
    v2 = (_QWORD *)sub_18E769368();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v23 = a1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(a1 + 64);
  v22 = (unint64_t)(63 - v4) >> 6;
  result = sub_18E7669BC();
  v7 = 0;
  while (1)
  {
    if (v5)
    {
      v10 = (v5 - 1) & v5;
      v11 = __clz(__rbit64(v5)) | (v7 << 6);
      v12 = v7;
    }
    else
    {
      v13 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_37;
      if (v13 >= v22)
      {
LABEL_33:
        sub_18E5361E8();
        return (unint64_t)v2;
      }
      v14 = *(_QWORD *)(v23 + 8 * v13);
      v12 = v7 + 1;
      if (!v14)
      {
        v12 = v7 + 2;
        if (v7 + 2 >= v22)
          goto LABEL_33;
        v14 = *(_QWORD *)(v23 + 8 * v12);
        if (!v14)
        {
          v12 = v7 + 3;
          if (v7 + 3 >= v22)
            goto LABEL_33;
          v14 = *(_QWORD *)(v23 + 8 * v12);
          if (!v14)
          {
            v12 = v7 + 4;
            if (v7 + 4 >= v22)
              goto LABEL_33;
            v14 = *(_QWORD *)(v23 + 8 * v12);
            if (!v14)
            {
              v15 = v7 + 5;
              if (v7 + 5 >= v22)
                goto LABEL_33;
              v14 = *(_QWORD *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  v12 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    goto LABEL_38;
                  if (v12 >= v22)
                    goto LABEL_33;
                  v14 = *(_QWORD *)(v23 + 8 * v12);
                  ++v15;
                  if (v14)
                    goto LABEL_26;
                }
              }
              v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      v10 = (v14 - 1) & v14;
      v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_18E546AA0(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_18E00F118(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_18E546AA0((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_18E72FC14((uint64_t)v30);
      swift_bridgeObjectRelease();
      sub_18E5361E8();
      swift_release();
      return 0;
    }
    sub_18E00F118((uint64_t)v31 + 8, (uint64_t)v25);
    sub_18E72FC14((uint64_t)v30);
    sub_18E00F154(v25, v26);
    v27 = v24;
    sub_18E00F154(v26, v28);
    v16 = v27;
    sub_18E00F154(v28, v29);
    sub_18E00F154(v29, &v27);
    result = sub_18E543F24(v16, *((uint64_t *)&v16 + 1));
    v17 = result;
    if ((v18 & 1) != 0)
    {
      v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v8 = v16;
      v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
      result = (unint64_t)sub_18E00F154(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    result = (unint64_t)sub_18E00F154(&v27, (_OWORD *)(v2[7] + 32 * result));
    v19 = v2[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_36;
    v2[2] = v21;
LABEL_8:
    v7 = v12;
    v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

void sub_18E72F7BC(void *a1)
{
  uint64_t v1;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t ObjectType;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD *v20;
  id v21;
  id v22;
  id v23;

  objc_msgSend(a1, sel_prepareToSend);
  v23 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (!v23)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    return;
  }
  v3 = objc_msgSend(a1, sel_getSafeExternalURI);
  if (!v3)
  {
    sub_18E768984();
    v3 = (id)sub_18E768954();
    swift_bridgeObjectRelease();
  }
  v4 = objc_msgSend((id)objc_opt_self(), sel_userInfoDictionaryWithExternalURI_, v3);

  sub_18E76887C();
  v5 = (void *)sub_18E768864();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(v23, sel_mediaObjectWithSticker_stickerUserInfo_, a1, v5);

  if (v22)
  {
    v6 = v1 + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate;
    if (!MEMORY[0x193FF501C](v1 + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate))
    {
      v14 = v23;
      goto LABEL_14;
    }
    v7 = *(_QWORD *)(v6 + 8);
    v22 = v22;
    v8 = objc_msgSend(v22, sel_transferGUID);
    if (v8)
    {
      v9 = v8;
      ObjectType = swift_getObjectType();
      v11 = sub_18E768984();
      v13 = v12;

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 8))(v1, v11, v13, ObjectType, v7);
      swift_bridgeObjectRelease();

      swift_unknownObjectRelease();
      v14 = v22;
LABEL_14:

      return;
    }
    goto LABEL_17;
  }
  if (qword_1EE0FAEB8 != -1)
    swift_once();
  v15 = sub_18E7666F8();
  __swift_project_value_buffer(v15, (uint64_t)qword_1EE12DCA8);
  v16 = a1;
  v17 = sub_18E7666E0();
  v18 = sub_18E768D68();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v19 = 138412290;
    v21 = v16;
    sub_18E769140();
    *v20 = a1;

    _os_log_impl(&dword_18DFCD000, v17, v18, "Creating media object for sticker: %@ failed", v19, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0FB0D0);
    swift_arrayDestroy();
    MEMORY[0x193FF4F20](v20, -1, -1);
    MEMORY[0x193FF4F20](v19, -1, -1);

  }
  else
  {

  }
}

uint64_t type metadata accessor for TapbackPickerInputController()
{
  return objc_opt_self();
}

uint64_t sub_18E72FC14(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE111F88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_18E72FC54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t ObjectType;
  void (*v19)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  NSObject *v23;
  NSObject *v24;

  v2 = v1;
  if (qword_1EE0FAEB8 != -1)
    swift_once();
  v4 = sub_18E7666F8();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EE12DCA8);
  v5 = sub_18E7666E0();
  v6 = sub_18E768D68();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_18DFCD000, v5, v6, "Received inserted adaptive image glyph, but we should have received an stageSticker payload. Resulting sticker will have no attribution.", v7, 2u);
    MEMORY[0x193FF4F20](v7, -1, -1);
  }

  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D39B18]), sel_initWithAdaptiveImageGlyphFromUnknownSource_, a1);
  v8 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, sel_mediaObjectWithSticker_stickerUserInfo_, v24, 0);

    if (v10)
    {
      v11 = -[NSObject transferGUID](v10, sel_transferGUID);
      if (v11)
      {
        v12 = v11;
        v13 = sub_18E768984();
        v15 = v14;

        v16 = v2 + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate;
        if (MEMORY[0x193FF501C](v2 + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate))
        {
          v17 = *(_QWORD *)(v16 + 8);
          ObjectType = swift_getObjectType();
          v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 8);
          swift_unknownObjectRetain();
          v19(v2, v13, v15, ObjectType, v17);
          swift_bridgeObjectRelease();

          swift_unknownObjectRelease_n();
        }
        else
        {
          swift_bridgeObjectRelease();

        }
        goto LABEL_15;
      }

      v23 = v10;
    }
    else
    {
      v20 = sub_18E7666E0();
      v21 = sub_18E768D68();
      if (!os_log_type_enabled(v20, v21))
      {

LABEL_15:
        v23 = v24;
        goto LABEL_16;
      }
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_18DFCD000, v20, v21, "Creating media object for adaptive image glyph failed", v22, 2u);
      MEMORY[0x193FF4F20](v22, -1, -1);

      v23 = v20;
    }
LABEL_16:

    return;
  }
  __break(1u);
}

id sub_18E72FEEC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  unsigned int v3;
  int v4;
  int v5;
  id result;
  void *v7;
  unsigned int v8;

  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  v1 = (void *)objc_opt_self();
  v2 = *(void **)(v0 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration_conversation);
  v3 = objc_msgSend(v1, sel_isFaceTimeAudioAvailable_, v2);
  swift_getKeyPath();
  sub_18E766464();
  swift_release();
  v4 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isGroupConversation);
  v5 = v4 ^ 1 | v3;
  if ((v4 & 1) == 0 && (v3 & 1) == 0)
    v5 = objc_msgSend(v1, sel_isTelephonyAvailable);
  result = objc_msgSend(v2, sel_chat);
  if (result)
  {
    v7 = result;
    v8 = objc_msgSend(result, sel_supportsCapabilities_, 0x4000);

    return (id)(v8 & v5);
  }
  return result;
}

id sub_18E730030()
{
  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  return objc_msgSend((id)objc_opt_self(), sel_isTelephonyAvailable);
}

id sub_18E7300B0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  unsigned int v3;
  id result;
  void *v5;
  unsigned int v6;

  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  v1 = (void *)objc_opt_self();
  v2 = *(void **)(v0 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration_conversation);
  v3 = objc_msgSend(v1, sel_isFaceTimeVideoAvailable_, v2);
  result = objc_msgSend(v2, sel_chat);
  if (result)
  {
    v5 = result;
    v6 = objc_msgSend(result, sel_supportsCapabilities_, 0x4000);

    return (id)(v6 & v3);
  }
  return result;
}

id sub_18E730180@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_18E730BA0(a1, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__contactsManager, a2);
}

void sub_18E730194(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_18E5F8FAC();
  v2 = v1;
  sub_18E766458();
  swift_release();

}

__CFString *sub_18E730230()
{
  qword_1EE12E118 = (uint64_t)CFSTR("CKConversationParticipantsDidChangeNotification");
  return CFSTR("CKConversationParticipantsDidChangeNotification");
}

__CFString *sub_18E730248()
{
  qword_1EE12E120 = (uint64_t)CFSTR("CKConversationJoinStateDidChangeNotification");
  return CFSTR("CKConversationJoinStateDidChangeNotification");
}

id sub_18E730260()
{
  qword_1EE12E128 = *MEMORY[0x1E0D353E8];
  return (id)qword_1EE12E128;
}

id sub_18E730278()
{
  qword_1EE12E130 = *MEMORY[0x1E0D35450];
  return (id)qword_1EE12E130;
}

id sub_18E730290()
{
  qword_1EE12E138 = *MEMORY[0x1E0D35448];
  return (id)qword_1EE12E138;
}

id sub_18E7302A8()
{
  qword_1EE12E140 = *MEMORY[0x1E0D35458];
  return (id)qword_1EE12E140;
}

id sub_18E7302C0()
{
  qword_1EE12E148 = *MEMORY[0x1E0D35308];
  return (id)qword_1EE12E148;
}

id sub_18E7302D8()
{
  qword_1EE12E150 = *MEMORY[0x1E0D352F0];
  return (id)qword_1EE12E150;
}

id sub_18E7302F0()
{
  qword_1EE12E158 = *MEMORY[0x1E0D373C0];
  return (id)qword_1EE12E158;
}

void sub_18E730308(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;

  sub_18E7669BC();
  sub_18E7689E4();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(a2, sel_entity);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_defaultIMHandle);

    sub_18E7694B8();
    if (v5)
    {
      v6 = v5;
      sub_18E768F60();

    }
  }
  else
  {
    __break(1u);
  }
}

id sub_18E7303EC(void *a1)
{
  id result;
  void *v3;
  id v4;
  id v5;

  sub_18E7694A0();
  sub_18E7669BC();
  sub_18E7689E4();
  swift_bridgeObjectRelease();
  result = objc_msgSend(a1, sel_entity);
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(result, sel_defaultIMHandle);

    sub_18E7694B8();
    if (v4)
    {
      v5 = v4;
      sub_18E768F60();

    }
    return (id)sub_18E7694DC();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_18E7304C8()
{
  void **v0;

  return sub_18E7303EC(*v0);
}

void sub_18E7304D4(uint64_t a1)
{
  void **v1;

  sub_18E730308(a1, *v1);
}

id sub_18E7304E0()
{
  void **v0;
  void *v1;
  id result;
  void *v3;
  id v4;
  id v5;

  v1 = *v0;
  sub_18E7694A0();
  sub_18E7669BC();
  sub_18E7689E4();
  swift_bridgeObjectRelease();
  result = objc_msgSend(v1, sel_entity);
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(result, sel_defaultIMHandle);

    sub_18E7694B8();
    if (v4)
    {
      v5 = v4;
      sub_18E768F60();

    }
    return (id)sub_18E7694DC();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_18E7305B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FB950);
  if ((sub_18E768F54() & 1) == 0)
    return 0;
  if (v2 == v4 && v3 == v5)
    return 1;
  else
    return sub_18E7693F8();
}

uint64_t sub_18E73065C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  return MEMORY[0x193FF501C](v0 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__delegate);
}

uint64_t sub_18E7306D4()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_18E7306F4()
{
  return sub_18E730860((uint64_t)&unk_18E7DEB28, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__alertPresenter);
}

uint64_t sub_18E730708@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  v4 = v3 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__alertPresenter;
  result = MEMORY[0x193FF501C](v3 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__alertPresenter);
  v6 = *(_QWORD *)(v4 + 8);
  *a2 = result;
  a2[1] = v6;
  return result;
}

void sub_18E730790(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_18E5F8FAC();
  v2 = v1;
  sub_18E766458();
  swift_release();

}

uint64_t sub_18E730830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18E7308F4(a1, a2, a3, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__alertPresenter);
}

uint64_t sub_18E73084C()
{
  return sub_18E730860((uint64_t)&unk_18E7DEB00, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__presentingViewController);
}

uint64_t sub_18E730860(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  return MEMORY[0x193FF501C](v2 + *a2);
}

uint64_t sub_18E7308D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18E7308F4(a1, a2, a3, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__presentingViewController);
}

uint64_t sub_18E7308F4(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  *(_QWORD *)(a1 + *a4 + 8) = a3;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_18E730914()
{
  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  return sub_18E7669BC();
}

uint64_t sub_18E73098C(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__participants) = a2;
  sub_18E7669BC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18E7309CC()
{
  return sub_18E73250C((uint64_t)&unk_18E7DE9E8, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__hasLeftConversation);
}

uint64_t sub_18E7309E0(uint64_t result, char a2)
{
  *(_BYTE *)(result + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__hasLeftConversation) = a2;
  return result;
}

uint64_t sub_18E7309F0()
{
  return sub_18E73250C((uint64_t)&unk_18E7DEA38, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isGroupConversation);
}

uint64_t sub_18E730A04(uint64_t result, char a2)
{
  *(_BYTE *)(result + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isGroupConversation) = a2;
  return result;
}

uint64_t sub_18E730A14()
{
  return sub_18E73250C((uint64_t)&unk_18E7DEA60, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__supportsSendingReadReceipts);
}

uint64_t sub_18E730A28(uint64_t result, char a2)
{
  *(_BYTE *)(result + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__supportsSendingReadReceipts) = a2;
  return result;
}

id sub_18E730A38()
{
  return sub_18E730B20((uint64_t)&unk_18E7DEAB0, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__contactsManager);
}

uint64_t sub_18E730A4C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__contactsManager);
  *(_QWORD *)(a1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__contactsManager) = a2;
  v3 = a2;

  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766458();

  return swift_release();
}

id sub_18E730B0C()
{
  return sub_18E730B20((uint64_t)&unk_18E7DEA88, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__suggestionsEnabledContactsStore);
}

id sub_18E730B20(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  return *(id *)(v2 + *a2);
}

id sub_18E730B8C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_18E730BA0(a1, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__suggestionsEnabledContactsStore, a2);
}

id sub_18E730BA0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X4>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  void *v6;

  v5 = *a1;
  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  v6 = *(void **)(v5 + *a2);
  *a3 = v6;
  return v6;
}

void sub_18E730C20(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_18E5F8FAC();
  v2 = v1;
  sub_18E766458();
  swift_release();

}

id sub_18E730CBC(void *a1)
{
  _BYTE *v1;
  uint64_t v3;
  id v4;
  _BYTE *v5;
  id v6;
  id v7;
  id v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  objc_super v16;

  v3 = (uint64_t)&v1[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__delegate];
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__alertPresenter + 8] = 0;
  *(_QWORD *)(swift_unknownObjectWeakInit() + 8) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__presentingViewController + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__participants] = MEMORY[0x1E0DEE9D8];
  v1[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__hasLeftConversation] = 0;
  v1[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isGroupConversation] = 0;
  v1[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__supportsSendingReadReceipts] = 0;
  v4 = objc_allocWithZone((Class)CKDetailsContactsManager);
  v5 = v1;
  v6 = objc_msgSend(v4, sel_init);
  *(_QWORD *)&v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__contactsManager] = v6;
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C972A0]), sel_init);
  objc_msgSend(v7, sel_setIncludeDonatedContacts_, 1);
  objc_msgSend(v7, sel_setIncludeIncludeManagedAppleIDs_, 1);
  objc_msgSend(v7, sel_setIncludeSuggestedContacts_, objc_msgSend((id)objc_opt_self(), sel_suggestionsEnabled));
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97298]), sel_initWithConfiguration_, v7);

  *(_QWORD *)&v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__suggestionsEnabledContactsStore] = v8;
  v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__ktEnhancedProtectionStatusCellState] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__ktHandlesForKTChatStatus] = 0;
  v9 = &v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__ktChatState];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__presentedEntity] = 0;
  v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isParticipantListCollapsible] = 1;
  v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__assetDownloadState] = 0;
  v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isParticipantListExpanded] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__supportsSharingFocusStatus] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isSharingFocusStatus] = 0;
  v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isSharingFocusStatusToggleOn] = 0;
  v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__manualScrollEdgeAppearanceEnabled] = 2;
  *(_QWORD *)&v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__visibleConversationDetailsSections] = -1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__participantListBehaviors] = -1;
  sub_18E766488();
  *(_QWORD *)&v5[OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration_conversation] = a1;
  swift_unknownObjectRetain();
  v10 = a1;
  sub_18E522F74(v3);
  swift_unknownObjectWeakInit();

  swift_unknownObjectRelease();
  v16.receiver = v5;
  v16.super_class = (Class)type metadata accessor for DetailsViewConfiguration();
  v11 = objc_msgSendSuper2(&v16, sel_init);
  v12 = objc_allocWithZone((Class)CKDetailsContactsManager);
  v13 = v11;
  v14 = objc_msgSend(v12, sel_initWithConversation_delegate_, v10, v13);
  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766458();
  swift_release();

  swift_getKeyPath();
  sub_18E766458();
  swift_release();
  sub_18E731068();
  sub_18E7316F8();

  swift_unknownObjectRelease();
  return v13;
}

uint64_t sub_18E731068()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD aBlock[7];

  v1 = *(void **)(v0 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration_conversation);
  objc_msgSend(v1, sel_isGroupConversation);
  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766458();
  swift_release();
  swift_getKeyPath();
  sub_18E766458();
  swift_release();
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_18E732BEC;
  aBlock[5] = v2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18E54B5FC;
  aBlock[3] = &block_descriptor_72;
  v3 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v1, sel_canShareFocusStatusWithCompletion_, v3);
  _Block_release(v3);
  swift_getKeyPath();
  aBlock[0] = v0;
  sub_18E766458();
  return swift_release();
}

void sub_18E731238(uint64_t a1)
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  BOOL v21;
  uint64_t KeyPath;
  unint64_t v23;
  unint64_t v24;

  swift_getKeyPath();
  v23 = sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  v2 = objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__contactsManager), sel_viewModelsSortedByIsContact_alphabetically_, 1, 1, v23);
  sub_18E00F31C(0, (unint64_t *)&qword_1EE112090);
  v3 = sub_18E768AE0();

  if (v3 >> 62)
  {
LABEL_20:
    sub_18E7669BC();
    v4 = sub_18E769338();
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_18E7669BC();
  }
  v5 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (v4)
  {
    v24 = v3 & 0xC000000000000001;
    v6 = 4;
    v7 = v3;
    while (1)
    {
      v8 = v6 - 4;
      if (v24)
      {
        v9 = (id)MEMORY[0x193FF25B0](v6 - 4, v3);
        v3 = v6 - 3;
        if (__OFADD__(v8, 1))
          goto LABEL_19;
      }
      else
      {
        v9 = *(id *)(v3 + 8 * v6);
        v3 = v6 - 3;
        if (__OFADD__(v8, 1))
        {
LABEL_19:
          __break(1u);
          goto LABEL_20;
        }
      }
      v10 = v9;
      v11 = objc_msgSend(v10, sel_entity);
      if (!v11)
        break;
      v12 = v11;
      v13 = objc_msgSend(v11, sel_defaultIMHandle);

      if (!v13)
        goto LABEL_22;
      v14 = objc_msgSend(v13, sel_ID);

      v15 = sub_18E768984();
      v17 = v16;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v5 = sub_18E5196F0(0, v5[2] + 1, 1, v5);
      v19 = v5[2];
      v18 = v5[3];
      if (v19 >= v18 >> 1)
        v5 = sub_18E5196F0((_QWORD *)(v18 > 1), v19 + 1, 1, v5);
      v5[2] = v19 + 1;
      v20 = &v5[3 * v19];
      v20[4] = v10;
      v20[5] = v15;
      v20[6] = v17;
      ++v6;
      v21 = v3 == v4;
      v3 = v7;
      if (v21)
        goto LABEL_18;
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  else
  {
LABEL_18:
    swift_bridgeObjectRelease_n();
    KeyPath = swift_getKeyPath();
    MEMORY[0x1E0C80A78](KeyPath);
    sub_18E766458();
    swift_release();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_18E73153C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration_conversation), sel_hasLeftGroupChat);
  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766458();
  return swift_release();
}

uint64_t sub_18E7315F8(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t KeyPath;

  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                             + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration_conversation), sel_chat));
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_supportsSendingReadReceipts);

  }
  KeyPath = swift_getKeyPath();
  MEMORY[0x1E0C80A78](KeyPath);
  sub_18E5F8FAC();
  sub_18E766458();
  return swift_release();
}

void sub_18E7316F8()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;

  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_defaultCenter);
  if (qword_1EE107610 != -1)
    swift_once();
  v3 = *(void **)(v0 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration_conversation);
  objc_msgSend(v2, sel_addObserver_selector_name_object_, v0, sel_conversationJoinStateChanged_, qword_1EE12E120, v3);

  v4 = objc_msgSend(v1, sel_defaultCenter);
  if (qword_1EE107608 != -1)
    swift_once();
  objc_msgSend(v4, sel_addObserver_selector_name_object_, v0, sel_conversationParticipantsChanged_, qword_1EE12E118, v3);

  v5 = objc_msgSend(v1, sel_defaultCenter);
  if (qword_1EE107618 != -1)
    swift_once();
  objc_msgSend(v5, sel_addObserver_selector_name_object_, v0, sel_handleKeyTransparencyStatusChanged_, qword_1EE12E128, v3);

  v6 = objc_msgSend(v1, sel_defaultCenter);
  if (qword_1EE107620 != -1)
    swift_once();
  v7 = qword_1EE12E130;
  v8 = objc_msgSend(v3, sel_chat);
  objc_msgSend(v6, sel_addObserver_selector_name_object_, v0, sel_batchDownloadNotificationFired_, v7, v8);

  v9 = objc_msgSend(v1, sel_defaultCenter);
  if (qword_1EE107628 != -1)
    swift_once();
  v10 = qword_1EE12E138;
  v11 = objc_msgSend(v3, sel_chat);
  objc_msgSend(v9, sel_addObserver_selector_name_object_, v0, sel_batchDownloadNotificationFired_, v10, v11);

  v12 = objc_msgSend(v1, sel_defaultCenter);
  if (qword_1EE107630 != -1)
    swift_once();
  v13 = qword_1EE12E140;
  v14 = objc_msgSend(v3, sel_chat);
  objc_msgSend(v12, sel_addObserver_selector_name_object_, v0, sel_chatAutoDonatingHandleUpdateNotification_, v13, v14);

  v15 = objc_msgSend(v1, sel_defaultCenter);
  objc_msgSend(v15, sel_addObserver_selector_name_object_, v0, sel_accountDefaultsChanged_, *MEMORY[0x1E0D352A0], 0);

  v16 = objc_msgSend(v1, sel_defaultCenter);
  v17 = *MEMORY[0x1E0D354D0];
  v18 = objc_msgSend(v3, sel_chat);
  objc_msgSend(v16, sel_addObserver_selector_name_object_, v0, sel_serviceForSendingChanged_, v17, v18);

}

id sub_18E731DA4()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;

  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration_conversation), sel_chat));
  if (!v1)
    return 0;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_isSMS);

  return v3;
}

id sub_18E731E54()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration_conversation), sel_isBusinessConversation);
}

BOOL sub_18E731ED4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v4;
  _QWORD *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;

  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  v1 = *(void **)(v0 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration_conversation);
  if ((objc_msgSend(v1, sel_isBusinessConversation) & 1) != 0)
    return 0;
  swift_getKeyPath();
  sub_18E766464();
  swift_release();
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__hasLeftConversation) & 1) != 0)
    return 0;
  v4 = objc_msgSend(v1, sel_sendingService);
  v5 = (_QWORD *)MEMORY[0x1E0D38E20];
  if (v4)
  {
    v6 = v4;
    v7 = objc_msgSend(v4, sel_supportsCapability_, *MEMORY[0x1E0D38E20]);

  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(v1, sel_chat);
  if (v8)
  {
    v9 = v8;
    v2 = objc_msgSend(v8, sel_hasMessageWithServiceCapability_, *v5);

    if ((v7 & 1) == 0)
      return (BOOL)v2;
    return 1;
  }
  return v7 != 0;
}

uint64_t sub_18E732040()
{
  return sub_18E73250C((uint64_t)&unk_18E7DE998, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__ktEnhancedProtectionStatusCellState);
}

uint64_t sub_18E732054(uint64_t result, char a2)
{
  *(_BYTE *)(result + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__ktEnhancedProtectionStatusCellState) = a2;
  return result;
}

uint64_t sub_18E732064()
{
  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  return sub_18E7669BC();
}

uint64_t sub_18E7320DC(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__ktHandlesForKTChatStatus) = a2;
  sub_18E7669BC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18E73211C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  return *(_QWORD *)(v0 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__ktChatState);
}

uint64_t sub_18E732198(uint64_t result, uint64_t a2, char a3)
{
  uint64_t v3;

  v3 = result + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__ktChatState;
  *(_QWORD *)v3 = a2;
  *(_BYTE *)(v3 + 8) = a3 & 1;
  return result;
}

void *sub_18E7321B4()
{
  return sub_18E73244C((uint64_t)&unk_18E7DE920, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__presentedEntity);
}

id sub_18E7321C8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  v4 = *(void **)(v3 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__presentedEntity);
  *a2 = v4;
  return v4;
}

void sub_18E732244(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_18E5F8FAC();
  v2 = v1;
  sub_18E766458();
  swift_release();

}

void sub_18E7322E0(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__presentedEntity);
  *(_QWORD *)(a1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__presentedEntity) = a2;
  v3 = a2;

}

uint64_t sub_18E732318()
{
  return sub_18E73250C((uint64_t)&unk_18E7DE8F8, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isParticipantListCollapsible);
}

uint64_t sub_18E73232C(uint64_t result, char a2)
{
  *(_BYTE *)(result + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isParticipantListCollapsible) = a2;
  return result;
}

uint64_t sub_18E73233C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  result = swift_release();
  *a1 = *(_BYTE *)(v1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__assetDownloadState);
  return result;
}

uint64_t sub_18E7323B8(uint64_t result, char a2)
{
  *(_BYTE *)(result + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__assetDownloadState) = a2;
  return result;
}

uint64_t sub_18E7323C8()
{
  return sub_18E73250C((uint64_t)&unk_18E7DE8A8, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isParticipantListExpanded);
}

uint64_t sub_18E7323DC(uint64_t result, char a2)
{
  *(_BYTE *)(result + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isParticipantListExpanded) = a2;
  return result;
}

void *sub_18E7323EC()
{
  return sub_18E73244C((uint64_t)&unk_18E7DE880, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__supportsSharingFocusStatus);
}

void sub_18E732400(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__supportsSharingFocusStatus);
  *(_QWORD *)(a1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__supportsSharingFocusStatus) = a2;
  v3 = a2;

}

void *sub_18E732438()
{
  return sub_18E73244C((uint64_t)&unk_18E7DE858, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isSharingFocusStatus);
}

void *sub_18E73244C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  void *v4;
  id v5;

  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  v4 = *(void **)(v2 + *a2);
  v5 = v4;
  return v4;
}

void sub_18E7324C0(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isSharingFocusStatus);
  *(_QWORD *)(a1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isSharingFocusStatus) = a2;
  v3 = a2;

}

uint64_t sub_18E7324F8()
{
  return sub_18E73250C((uint64_t)&unk_18E7DE7B8, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isSharingFocusStatusToggleOn);
}

uint64_t sub_18E73250C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  return *(unsigned __int8 *)(v2 + *a2);
}

void sub_18E732578(uint64_t a1, char a2)
{
  uint64_t v3;

  v3 = OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isSharingFocusStatusToggleOn;
  *(_BYTE *)(a1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isSharingFocusStatusToggleOn) = a2;
  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  sub_18E6E5050(*(_BYTE *)(a1 + v3));
}

uint64_t sub_18E732600()
{
  return sub_18E73250C((uint64_t)&unk_18E7DE830, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__manualScrollEdgeAppearanceEnabled);
}

uint64_t sub_18E732614@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__manualScrollEdgeAppearanceEnabled);
  return result;
}

uint64_t sub_18E732690()
{
  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766458();
  return swift_release();
}

uint64_t sub_18E732720(uint64_t result, char a2)
{
  *(_BYTE *)(result + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__manualScrollEdgeAppearanceEnabled) = a2;
  return result;
}

uint64_t sub_18E732730()
{
  return sub_18E732768((uint64_t)&unk_18E7DE808, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__visibleConversationDetailsSections);
}

uint64_t sub_18E732744(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__visibleConversationDetailsSections) = a2;
  return result;
}

uint64_t sub_18E732754()
{
  return sub_18E732768((uint64_t)&unk_18E7DE7E0, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__participantListBehaviors);
}

uint64_t sub_18E732768(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  swift_getKeyPath();
  sub_18E5F8FAC();
  sub_18E766464();
  swift_release();
  return *(_QWORD *)(v2 + *a2);
}

uint64_t sub_18E7327D4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__participantListBehaviors) = a2;
  return result;
}

id sub_18E732810()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DetailsViewConfiguration();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18E732934()
{
  return type metadata accessor for DetailsViewConfiguration();
}

uint64_t type metadata accessor for DetailsViewConfiguration()
{
  uint64_t result;

  result = qword_1EE112078;
  if (!qword_1EE112078)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_18E732978()
{
  uint64_t result;
  unint64_t v1;

  result = sub_18E766494();
  if (v1 <= 0x3F)
    return swift_updateClassMetadata2();
  return result;
}

ValueMetadata *type metadata accessor for DetailsViewParticipant()
{
  return &type metadata for DetailsViewParticipant;
}

unint64_t sub_18E732A80()
{
  unint64_t result;

  result = qword_1EE112088;
  if (!qword_1EE112088)
  {
    result = MEMORY[0x193FF4E54](&unk_18E7DE6F8, &type metadata for DetailsViewParticipant);
    atomic_store(result, (unint64_t *)&qword_1EE112088);
  }
  return result;
}

void sub_18E732AE4()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__manualScrollEdgeAppearanceEnabled) = *(_BYTE *)(v0 + 24);
}

void sub_18E732B2C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__presentedEntity);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__presentedEntity) = v2;
  v4 = v2;

}

void sub_18E732B98()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isGroupConversation) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_18E732BB0()
{
  uint64_t v0;

  return sub_18E73153C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_18E732BC8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_18E732BEC(char a1)
{
  uint64_t v1;

  sub_18E6E3930(a1, v1);
}

uint64_t sub_18E732BFC()
{
  uint64_t v0;

  return sub_18E7315F8(*(_QWORD *)(v0 + 16));
}

void sub_18E732C14()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__supportsSendingReadReceipts) = *(_BYTE *)(v0 + 24);
}

void sub_18E732C2C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__hasLeftConversation) = *(_BYTE *)(v0 + 24);
}

id sub_18E732C44@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_18E730BA0(a1, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__suggestionsEnabledContactsStore, a2);
}

void sub_18E732C6C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__suggestionsEnabledContactsStore);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__suggestionsEnabledContactsStore) = v2;
  v4 = v2;

}

id sub_18E732CA8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_18E730BA0(a1, &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__contactsManager, a2);
}

void sub_18E732CD8()
{
  uint64_t v0;

  sub_18E731238(*(_QWORD *)(v0 + 16));
}

uint64_t sub_18E732CF0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__participants) = *(_QWORD *)(v0 + 24);
  sub_18E7669BC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18E732D40()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__alertPresenter + 8) = *(_QWORD *)(v0 + 32);
  return swift_unknownObjectWeakAssign();
}

id sub_18E732D7C@<X0>(_BYTE *a1@<X8>)
{
  id result;

  result = sub_18E72FEEC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_18E732DA8()
{
  return sub_18E732BFC();
}

void sub_18E732DBC()
{
  sub_18E732CD8();
}

uint64_t sub_18E732DD0()
{
  return sub_18E732BB0();
}

uint64_t sub_18E732DE4()
{
  return sub_18E583184();
}

id sub_18E732DF8()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  double Height;
  double v41;
  double Width;
  CGFloat v43;
  double v44;
  double v45;
  objc_super v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v1 = v0;
  v47.receiver = v0;
  v47.super_class = (Class)type metadata accessor for TapbackPickerCollectionViewContainer();
  objc_msgSendSuper2(&v47, sel_layoutSubviews);
  v2 = objc_msgSend(v0, sel_layer);
  v3 = objc_msgSend(v2, sel_mask);

  v4 = &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isParticipantListCollapsible;
  if (!v3)
  {
    v5 = *(void **)&v1[OBJC_IVAR____TtC7ChatKit36TapbackPickerCollectionViewContainer_parentMaskLayer];
    v6 = (void *)objc_opt_self();
    v7 = objc_msgSend(v6, sel_clearColor);
    v8 = objc_msgSend(v7, sel_CGColor);

    objc_msgSend(v5, sel_setBackgroundColor_, v8);
    v9 = *MEMORY[0x1E0CD2F58];
    v10 = *(void **)&v1[OBJC_IVAR____TtC7ChatKit36TapbackPickerCollectionViewContainer_leadingGradientLayer];
    objc_msgSend(v10, sel_setType_, *MEMORY[0x1E0CD2F58]);
    v11 = *(void **)&v1[OBJC_IVAR____TtC7ChatKit36TapbackPickerCollectionViewContainer_trailingGradientLayer];
    objc_msgSend(v11, sel_setType_, v9);
    objc_msgSend(v10, sel_setStartPoint_, 0.5, 0.5);
    objc_msgSend(v10, sel_setEndPoint_, 0.0, 0.0);
    objc_msgSend(v11, sel_setStartPoint_, 0.5, 0.5);
    objc_msgSend(v11, sel_setEndPoint_, 0.0, 0.0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0FB970);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_18E7D2720;
    sub_18E5D3D1C();
    *(_QWORD *)(v12 + 32) = sub_18E768F30();
    *(_QWORD *)(v12 + 40) = sub_18E768F30();
    *(_QWORD *)(v12 + 48) = sub_18E768F3C();
    sub_18E768AF8();
    v13 = (void *)sub_18E768AC8();
    swift_bridgeObjectRelease();
    objc_msgSend(v10, sel_setLocations_, v13);

    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_18E7D2720;
    *(_QWORD *)(v14 + 32) = sub_18E768F30();
    *(_QWORD *)(v14 + 40) = sub_18E768F30();
    *(_QWORD *)(v14 + 48) = sub_18E768F3C();
    sub_18E768AF8();
    v15 = (void *)sub_18E768AC8();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_setLocations_, v15);

    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECF63C90);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_18E7D76C0;
    v17 = objc_msgSend(v6, sel_whiteColor);
    v18 = objc_msgSend(v17, (SEL)&selRef___ck_isScrolledToBottom);

    type metadata accessor for CGColor(0);
    v20 = v19;
    *(_QWORD *)(v16 + 56) = v19;
    *(_QWORD *)(v16 + 32) = v18;
    v21 = objc_msgSend(v6, sel_clearColor);
    v22 = objc_msgSend(v21, (SEL)&selRef___ck_isScrolledToBottom);

    *(_QWORD *)(v16 + 88) = v20;
    *(_QWORD *)(v16 + 64) = v22;
    v23 = objc_msgSend(v6, sel_clearColor);
    v24 = objc_msgSend(v23, (SEL)&selRef___ck_isScrolledToBottom);

    *(_QWORD *)(v16 + 120) = v20;
    *(_QWORD *)(v16 + 96) = v24;
    v25 = (void *)sub_18E768AC8();
    swift_bridgeObjectRelease();
    objc_msgSend(v10, sel_setColors_, v25);

    v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_18E7D76C0;
    v27 = objc_msgSend(v6, sel_whiteColor);
    v28 = objc_msgSend(v27, (SEL)&selRef___ck_isScrolledToBottom);

    *(_QWORD *)(v26 + 56) = v20;
    *(_QWORD *)(v26 + 32) = v28;
    v29 = objc_msgSend(v6, sel_clearColor);
    v30 = objc_msgSend(v29, (SEL)&selRef___ck_isScrolledToBottom);

    *(_QWORD *)(v26 + 88) = v20;
    *(_QWORD *)(v26 + 64) = v30;
    v31 = objc_msgSend(v6, sel_clearColor);
    v32 = objc_msgSend(v31, (SEL)&selRef___ck_isScrolledToBottom);

    *(_QWORD *)(v26 + 120) = v20;
    *(_QWORD *)(v26 + 96) = v32;
    v33 = (void *)sub_18E768AC8();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_setColors_, v33);

    objc_msgSend(v5, sel_addSublayer_, v10);
    v34 = v11;
    v4 = &OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isParticipantListCollapsible;
    objc_msgSend(v5, sel_addSublayer_, v34);
    v35 = *(void **)&v1[OBJC_IVAR____TtC7ChatKit36TapbackPickerCollectionViewContainer_centerMask];
    v36 = objc_msgSend(v6, sel_whiteColor);
    v37 = objc_msgSend(v36, (SEL)&selRef___ck_isScrolledToBottom);

    objc_msgSend(v35, sel_setBackgroundColor_, v37);
    objc_msgSend(v5, sel_addSublayer_, v35);
    v38 = objc_msgSend(v1, sel_layer);
    objc_msgSend(v38, sel_setMask_, v5);

  }
  v39 = *(void **)&v1[OBJC_IVAR____TtC7ChatKit36TapbackPickerCollectionViewContainer_parentMaskLayer];
  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v39, sel_setFrame_);
  objc_msgSend(v1, sel_bounds);
  Height = CGRectGetHeight(v48);
  objc_msgSend(v1, sel_bounds);
  v41 = CGRectGetHeight(v49);
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC7ChatKit36TapbackPickerCollectionViewContainer_leadingGradientLayer], sel_setFrame_, 0.0, 0.0, Height, v41);
  objc_msgSend(v1, sel_bounds);
  Width = CGRectGetWidth(v50);
  v51.origin.x = 0.0;
  v51.origin.y = 0.0;
  v51.size.width = Height;
  v51.size.height = v41;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC7ChatKit36TapbackPickerCollectionViewContainer_trailingGradientLayer], sel_setFrame_, Width - CGRectGetWidth(v51), 0.0, Height, v41);
  objc_msgSend(v1, sel_bounds);
  v43 = CGRectGetHeight(v52) * 0.5;
  objc_msgSend(v1, sel_bounds);
  v44 = CGRectGetWidth(v53);
  objc_msgSend(v1, sel_bounds);
  v45 = v44 - CGRectGetHeight(v54);
  objc_msgSend(v1, sel_bounds);
  return objc_msgSend(*(id *)&v1[v4[21]], sel_setFrame_, v43, 0.0, v45, CGRectGetHeight(v55));
}

void sub_18E73353C(char a1, double a2, double a3, double a4, double a5)
{
  char *v5;
  uint64_t v11;
  id v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v11 = OBJC_IVAR____TtC7ChatKit36TapbackPickerCollectionViewContainer_parentMaskLayer;
  v12 = objc_allocWithZone(MEMORY[0x1E0CD27A8]);
  v13 = v5;
  *(_QWORD *)&v5[v11] = objc_msgSend(v12, sel_init);
  v14 = OBJC_IVAR____TtC7ChatKit36TapbackPickerCollectionViewContainer_centerMask;
  *(_QWORD *)&v13[v14] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD27A8]), sel_init);
  v15 = OBJC_IVAR____TtC7ChatKit36TapbackPickerCollectionViewContainer_leadingGradientLayer;
  *(_QWORD *)&v13[v15] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2790]), sel_init);
  v16 = OBJC_IVAR____TtC7ChatKit36TapbackPickerCollectionViewContainer_trailingGradientLayer;
  *(_QWORD *)&v13[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2790]), sel_init);

  sub_18E670988(a1, a2, a3, a4, a5);
}

void sub_18E73363C()
{
  uint64_t v0;

}

id sub_18E733688()
{
  return sub_18E52E5A8(type metadata accessor for TapbackPickerCollectionViewContainer);
}

uint64_t type metadata accessor for TapbackPickerCollectionViewContainer()
{
  return objc_opt_self();
}

id sub_18E733730(void *a1, double a2, double a3, double a4, double a5)
{
  char *v5;
  char *v11;
  uint64_t v12;
  char *v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  objc_super v23;

  *(_QWORD *)&v5[OBJC_IVAR___CKTapbackPickerCollectionView_scrollDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v11 = &v5[OBJC_IVAR___CKTapbackPickerCollectionView_xPointForBoundaryBetweenSections];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = OBJC_IVAR___CKTapbackPickerCollectionView_itemWidth;
  v13 = v5;
  sub_18E706A7C();
  sub_18E7070C0();
  v14 = sub_18E706A7C() * 44.0;
  v15 = sub_18E707638();
  *(double *)&v5[v12] = v14 + v15 + v15;

  v23.receiver = v13;
  v23.super_class = (Class)type metadata accessor for TapbackPickerCollectionView();
  v16 = objc_msgSendSuper2(&v23, sel_initWithFrame_collectionViewLayout_, a1, a2, a3, a4, a5);
  sub_18E768984();
  v17 = objc_allocWithZone(MEMORY[0x1E0CD2780]);
  v18 = v16;
  v19 = (void *)sub_18E768954();
  v20 = objc_msgSend(v17, sel_initWithType_, v19);

  sub_18E62A9DC(v20);
  swift_bridgeObjectRelease();

  v21 = v18;
  objc_msgSend(v21, sel_setSemanticContentAttribute_, 3);

  return v21;
}

uint64_t sub_18E73391C(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  objc_super v6;

  v3 = a2;
  if (!a2)
    goto LABEL_7;
  if ((a1 != 0xD000000000000020 || a2 != (void *)0x800000018E80C4A0) && (sub_18E7693F8() & 1) == 0)
  {
    v3 = (void *)sub_18E768954();
LABEL_7:
    v6.receiver = v2;
    v6.super_class = (Class)type metadata accessor for TapbackPickerCollectionView();
    v4 = objc_msgSendSuper2(&v6, sel__shouldAnimatePropertyWithKey_, v3);

    return (uint64_t)v4;
  }
  return 1;
}

id sub_18E733B18()
{
  return sub_18E52E5A8(type metadata accessor for TapbackPickerCollectionView);
}

uint64_t type metadata accessor for TapbackPickerCollectionView()
{
  return objc_opt_self();
}

void sub_18E733B54()
{
  char *v0;
  char *v1;
  uint64_t v2;
  double v3;
  double v4;

  *(_QWORD *)&v0[OBJC_IVAR___CKTapbackPickerCollectionView_scrollDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v1 = &v0[OBJC_IVAR___CKTapbackPickerCollectionView_xPointForBoundaryBetweenSections];
  *(_QWORD *)v1 = 0;
  v1[8] = 1;
  v2 = OBJC_IVAR___CKTapbackPickerCollectionView_itemWidth;
  sub_18E706A7C();
  sub_18E7070C0();
  v3 = sub_18E706A7C() * 44.0;
  v4 = sub_18E707638();
  *(double *)&v0[v2] = v3 + v4 + v4;

  sub_18E769320();
  __break(1u);
}

id IMEmojiTapback.emojiToken.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_associatedMessageEmoji);
  sub_18E768984();

  v2 = (void *)sub_18E768954();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend((id)objc_opt_self(), sel_emojiTokenWithString_localeData_, v2, 0);

  return v3;
}

id IMEmojiTapback.isEqualIgnoringModifiers(to:)(void *a1)
{
  void *v1;
  void *v2;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v2 = v1;
  v4 = objc_msgSend(v2, sel_associatedMessageEmoji);
  sub_18E768984();

  v5 = (void *)sub_18E768954();
  swift_bridgeObjectRelease();
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_emojiTokenWithString_localeData_, v5, 0);

  if (!v7)
    return 0;
  v8 = objc_msgSend(a1, sel_associatedMessageEmoji);
  sub_18E768984();

  v9 = (void *)sub_18E768954();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v6, sel_emojiTokenWithString_localeData_, v9, 0);

  if (v10)
  {
    v11 = objc_msgSend(v7, sel_isEqualIgnoringModifiers_, v10);

    v7 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t sub_18E733E04(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  LOBYTE(a1) = IMEmojiTapback.isEqualIgnoringModifiers(to:)(v4);

  return a1 & 1;
}

double static TapbackPickerBalloonLayoutTemplate.pickerPillBottomTailBaseline.getter()
{
  if (qword_1EE107668 != -1)
    swift_once();
  return (*(double *)&qword_1EE12E178 + 52.8) * 0.64278761 + 15.4 + 37.4;
}

double static TapbackPickerBalloonLayoutTemplate.widthConstrainedBaseline(displayConfiguration:)(uint64_t a1)
{
  uint64_t v1;
  double v2;

  v1 = a1 + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_pickerPillPreferredContentSize;
  swift_beginAccess();
  v2 = *(double *)(v1 + 8);
  if (qword_1EE107650 != -1)
    swift_once();
  return v2 + 44.0 + *(double *)&qword_1EE12E160;
}

double static TapbackPickerBalloonLayoutTemplate.pickerPillBubbleMargin.getter()
{
  return 5.0;
}

double static TapbackPickerBalloonLayoutTemplate.emojiTailBubbleMargin.getter()
{
  return 6.0;
}

void sub_18E733F7C()
{
  qword_1EE12E160 = 0xC0143D70A3D70A3ELL;
}

void sub_18E733F98()
{
  qword_1EE12E168 = 0xC0195810624DD2F2;
}

void sub_18E733FB4()
{
  qword_1EE12E170 = 0xC01C28F5C28F5C2ALL;
}

void sub_18E733FD0()
{
  qword_1EE12E178 = 0xC0227AE147AE147ALL;
}

double sub_18E733FEC()
{
  double result;

  result = -10.0;
  xmmword_1EE12E180 = xmmword_18E7DECB0;
  return result;
}

double sub_18E734000()
{
  double result;

  result = -5.0;
  xmmword_1EE12E190 = xmmword_18E7DECC0;
  return result;
}

double static TapbackPickerBalloonLayoutTemplate.topOffsetForUnobscuredTranscriptPresentation.getter()
{
  return 110.6;
}

double static TapbackPickerBalloonLayoutTemplate.requiredDisplayHeight.getter()
{
  double v0;
  double v1;

  if (qword_1EE107668 != -1)
    swift_once();
  v0 = (*(double *)&qword_1EE12E178 + 52.8) * 0.64278761 + 15.4 + 37.4;
  _s7ChatKit34TapbackPickerBalloonLayoutTemplateC17selectionTailSizeSo6CGSizeVvgZ_0();
  return v1 + v0;
}

id TapbackPickerBalloonLayoutTemplate.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id TapbackPickerBalloonLayoutTemplate.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TapbackPickerBalloonLayoutTemplate();
  return objc_msgSendSuper2(&v2, sel_init);
}

id TapbackPickerBalloonLayoutTemplate.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TapbackPickerBalloonLayoutTemplate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double _s7ChatKit34TapbackPickerBalloonLayoutTemplateC17selectionTailSizeSo6CGSizeVvgZ_0()
{
  double v0;

  if (qword_1EE107658 != -1)
    swift_once();
  v0 = *(double *)&qword_1EE12E168;
  if (qword_1EE107650 != -1)
    swift_once();
  return (v0 + 29.92) * 0.559192903 + 22.0 + 9.00315275 + 3.96;
}

uint64_t type metadata accessor for TapbackPickerBalloonLayoutTemplate()
{
  return objc_opt_self();
}

id sub_18E734408()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
  if (result)
    qword_1EE112100 = (uint64_t)result;
  else
    __break(1u);
  return result;
}

uint64_t getEnumTagSinglePayload for KTStatusMenu(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[40])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for KTStatusMenu(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for KTStatusMenu()
{
  return &type metadata for KTStatusMenu;
}

_QWORD *assignWithCopy for KTStatusLabelStyle(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for KTStatusLabelStyle(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for KTStatusLabelStyle()
{
  return &type metadata for KTStatusLabelStyle;
}

uint64_t sub_18E734580()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E734590@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t KeyPath;
  uint64_t *v20;
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
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v41 = a1;
  v1 = sub_18E767814();
  v39 = *(_QWORD *)(v1 - 8);
  v40 = v1;
  MEMORY[0x1E0C80A78](v1);
  v36 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112120);
  MEMORY[0x1E0C80A78](v38);
  v35 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v37 = (uint64_t)&v34 - v5;
  v6 = sub_18E768174();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_18E7677FC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112128);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v34 = (uint64_t)&v34 - v18;
  sub_18E767808();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0CDF7D0], v6);
  KeyPath = swift_getKeyPath();
  v20 = (uint64_t *)&v16[*(int *)(v14 + 36)];
  v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE112BD0);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v20 + *(int *)(v21 + 28), v9, v6);
  *v20 = KeyPath;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v13, v10);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v22 = v34;
  sub_18E520BEC((uint64_t)v16, v34, &qword_1EE112128);
  v23 = v36;
  sub_18E767820();
  v24 = swift_getKeyPath();
  v26 = v39;
  v25 = v40;
  v27 = (uint64_t)v35;
  (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v35, v23, v40);
  v28 = v27 + *(int *)(v38 + 36);
  v29 = v27;
  *(_QWORD *)v28 = v24;
  *(_BYTE *)(v28 + 8) = 0;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v23, v25);
  v30 = v37;
  sub_18E520BEC(v27, v37, &qword_1EE112120);
  sub_18E5106A0(v22, (uint64_t)v16, &qword_1EE112128);
  sub_18E5106A0(v30, v27, &qword_1EE112120);
  v31 = v41;
  sub_18E5106A0((uint64_t)v16, v41, &qword_1EE112128);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112130);
  sub_18E5106A0(v29, v31 + *(int *)(v32 + 48), &qword_1EE112120);
  sub_18E00FA98(v30, &qword_1EE112120);
  sub_18E00FA98(v22, &qword_1EE112128);
  sub_18E00FA98(v29, &qword_1EE112120);
  return sub_18E00FA98((uint64_t)v16, &qword_1EE112128);
}

uint64_t sub_18E7348F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112108);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v6 = v1[1];
  *(_QWORD *)v5 = sub_18E7674B4();
  *((_QWORD *)v5 + 1) = v7;
  v5[16] = 0;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112110);
  sub_18E734590((uint64_t)&v5[*(int *)(v8 + 44)]);
  sub_18E5106A0((uint64_t)v5, a1, &qword_1EE112108);
  *(_QWORD *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE112118) + 36)) = v6;
  swift_retain();
  return sub_18E00FA98((uint64_t)v5, &qword_1EE112108);
}

uint64_t sub_18E7349CC@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v26;

  v10 = sub_18E767838();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112188);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112190);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E767844();
  v20 = sub_18E767850();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v13, v10);
  v21 = &v16[*(int *)(v14 + 36)];
  *(_QWORD *)v21 = 0;
  v21[8] = v20 & 1;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v22 = sub_18E7670DC();
  LOBYTE(v10) = sub_18E767A78();
  sub_18E5106A0((uint64_t)v16, (uint64_t)v19, &qword_1EE112188);
  v23 = &v19[*(int *)(v17 + 36)];
  *(_QWORD *)v23 = v22;
  v23[8] = v10;
  sub_18E00FA98((uint64_t)v16, &qword_1EE112188);
  LOBYTE(v22) = sub_18E767A78();
  sub_18E5106A0((uint64_t)v19, a1, &qword_1EE112190);
  v24 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE112198) + 36);
  *(_BYTE *)v24 = v22;
  *(double *)(v24 + 8) = a2;
  *(double *)(v24 + 16) = a3;
  *(double *)(v24 + 24) = a4;
  *(double *)(v24 + 32) = a5;
  *(_BYTE *)(v24 + 40) = 0;
  return sub_18E00FA98((uint64_t)v19, &qword_1EE112190);
}

uint64_t sub_18E734BB8@<X0>(uint64_t a1@<X8>)
{
  double *v1;

  return sub_18E7349CC(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_18E734BC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  char v14;
  uint64_t v15;
  __int128 v16;
  uint64_t KeyPath;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;

  v23 = a1;
  v24 = a2;
  v3 = sub_18E767238();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112138);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112140);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_BYTE *)v2;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112148);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v9, v23, v15);
  v9[*(int *)(v7 + 36)] = v14;
  v16 = *(_OWORD *)(v2 + 24);
  v25 = *(_OWORD *)(v2 + 8);
  v26 = v16;
  sub_18E734E74();
  sub_18E734EF8();
  sub_18E767D30();
  sub_18E00FA98((uint64_t)v9, &qword_1EE112138);
  sub_18E767214();
  KeyPath = swift_getKeyPath();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112168);
  v19 = v24;
  v20 = (uint64_t *)(v24 + *(int *)(v18 + 36));
  v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0F4EF8);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v20 + *(int *)(v21 + 28), v6, v3);
  *v20 = KeyPath;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v19, v13, v10);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_18E734DC4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E734DDC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_18E76737C();
  *a1 = result;
  return result;
}

uint64_t sub_18E734E04@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_18E76737C();
  *a1 = result;
  return result;
}

uint64_t sub_18E734E2C()
{
  return sub_18E767388();
}

uint64_t sub_18E734E50()
{
  return sub_18E767388();
}

unint64_t sub_18E734E74()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112150;
  if (!qword_1EE112150)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112138);
    v2[0] = sub_18E514BB4(&qword_1EE112158, &qword_1EE112148, MEMORY[0x1E0CDBF10]);
    v2[1] = sub_18E594334();
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112150);
  }
  return result;
}

unint64_t sub_18E734EF8()
{
  unint64_t result;

  result = qword_1EE112160;
  if (!qword_1EE112160)
  {
    result = MEMORY[0x193FF4E54](&unk_18E7DEE64, &type metadata for KTStatusButtonStyle);
    atomic_store(result, (unint64_t *)&qword_1EE112160);
  }
  return result;
}

ValueMetadata *type metadata accessor for KTStatusButtonStyle()
{
  return &type metadata for KTStatusButtonStyle;
}

unint64_t sub_18E734F58()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112170;
  if (!qword_1EE112170)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112118);
    v2[0] = sub_18E514BB4(&qword_1EE112178, &qword_1EE112108, MEMORY[0x1E0CDFB10]);
    v2[1] = sub_18E514BB4(&qword_1EE108AA0, &qword_1EE108AA8, MEMORY[0x1E0CDC718]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112170);
  }
  return result;
}

unint64_t sub_18E734FF8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_1EE112180;
  if (!qword_1EE112180)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112168);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112138);
    v2[3] = &type metadata for KTStatusButtonStyle;
    v2[4] = sub_18E734E74();
    v2[5] = sub_18E734EF8();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_18E514BB4(&qword_1EE0F4EF0, (uint64_t *)&unk_1EE0F4EF8, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112180);
  }
  return result;
}

uint64_t sub_18E7350C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E7350D0()
{
  return sub_18E5659F4(&qword_1EE1121A0, &qword_1EE112198, sub_18E735104, MEMORY[0x1E0CD9758]);
}

uint64_t sub_18E735104()
{
  return sub_18E5659F4(&qword_1EE1121A8, &qword_1EE112190, (uint64_t (*)(void))sub_18E735128, MEMORY[0x1E0CDCF90]);
}

unint64_t sub_18E735128()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE1121B0;
  if (!qword_1EE1121B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112188);
    v2[0] = sub_18E7351AC();
    v2[1] = sub_18E514BB4(&qword_1EE109B80, &qword_1EE109B88, MEMORY[0x1E0CDB148]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE1121B0);
  }
  return result;
}

unint64_t sub_18E7351AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE109B68;
  if (!qword_1EE109B68)
  {
    v1 = sub_18E767838();
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CDC520], v1);
    atomic_store(result, (unint64_t *)&qword_1EE109B68);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TapbackAttributionPresentationValues(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TapbackAttributionPresentationValues(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
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
  *(_BYTE *)(result + 80) = v3;
  return result;
}

ValueMetadata *type metadata accessor for TapbackAttributionPresentationValues()
{
  return &type metadata for TapbackAttributionPresentationValues;
}

id sub_18E735264()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC7ChatKit22CKSuggestedReplyButton____lazy_storage___titleLabel;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC7ChatKit22CKSuggestedReplyButton____lazy_storage___titleLabel);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC7ChatKit22CKSuggestedReplyButton____lazy_storage___titleLabel);
  }
  else
  {
    v4 = sub_18E7352C0();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_18E7352C0()
{
  id v0;
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;
  id v6;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA700]), sel_init);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  LODWORD(v1) = 1148846080;
  objc_msgSend(v0, sel_setContentCompressionResistancePriority_forAxis_, 0, v1);
  LODWORD(v2) = 1148846080;
  objc_msgSend(v0, sel_setContentCompressionResistancePriority_forAxis_, 1, v2);
  LODWORD(v3) = 1148846080;
  objc_msgSend(v0, sel_setContentHuggingPriority_forAxis_, 0, v3);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v0, sel_setContentHuggingPriority_forAxis_, 1, v4);
  v5 = objc_msgSend((id)objc_opt_self(), sel_tintColor);
  objc_msgSend(v0, sel_setTextColor_, v5);

  objc_msgSend(v0, sel_setMinimumScaleFactor_, 0.4);
  objc_msgSend(v0, sel_setAdjustsFontSizeToFitWidth_, 1);
  v6 = sub_18E735E5C(*MEMORY[0x1E0CEB590], 0x8000, 0, 1, 1, 0.0);
  objc_msgSend(v0, sel_setFont_, v6);

  objc_msgSend(v0, sel_setNumberOfLines_, 0);
  return v0;
}

id sub_18E73542C(uint64_t a1, uint64_t a2, char a3)
{
  char *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  double v45;
  double v46;
  id v47;
  double v48;
  id v49;
  void *v50;
  objc_super v53;

  *(_QWORD *)&v3[OBJC_IVAR____TtC7ChatKit22CKSuggestedReplyButton____lazy_storage___titleLabel] = 0;
  v53.receiver = v3;
  v53.super_class = (Class)type metadata accessor for CKSuggestedReplyButton();
  v4 = objc_msgSendSuper2(&v53, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v4, sel_setIsAccessibilityElement_, 1);
  objc_msgSend(v4, sel_setAccessibilityTraits_, *MEMORY[0x1E0CEB110]);
  v5 = v4;
  v6 = (void *)sub_18E768954();
  objc_msgSend(v5, sel_setAccessibilityLabel_, v6);

  v7 = sub_18E735264();
  v8 = (void *)sub_18E768954();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setText_, v8);

  v9 = v5;
  v10 = sub_18E735264();
  objc_msgSend(v9, sel_addSubview_, v10);

  v11 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0FB970);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_18E7CFB20;
  v13 = sub_18E735264();
  v14 = objc_msgSend(v13, sel_leadingAnchor);

  v15 = objc_msgSend(v9, sel_leadingAnchor);
  v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_constant_, v15, 12.0);

  *(_QWORD *)(v12 + 32) = v16;
  v17 = sub_18E735264();
  v18 = objc_msgSend(v17, sel_trailingAnchor);

  v19 = objc_msgSend(v9, sel_trailingAnchor);
  v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_constant_, v19, -12.0);

  *(_QWORD *)(v12 + 40) = v20;
  v21 = sub_18E735264();
  v22 = objc_msgSend(v21, sel_topAnchor);

  v23 = objc_msgSend(v9, sel_topAnchor);
  v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v23, 12.0);

  *(_QWORD *)(v12 + 48) = v24;
  v25 = sub_18E735264();
  v26 = objc_msgSend(v25, sel_bottomAnchor);

  v27 = objc_msgSend(v9, sel_bottomAnchor);
  v28 = objc_msgSend(v26, sel_constraintEqualToAnchor_constant_, v27, -12.0);

  *(_QWORD *)(v12 + 56) = v28;
  sub_18E768AF8();
  sub_18E53F578();
  v29 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_activateConstraints_, v29);

  if ((a3 & 1) != 0)
  {
    v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEABB0]), sel_init);
    objc_msgSend(v30, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v31 = objc_msgSend((id)objc_opt_self(), sel_separatorColor);
    objc_msgSend(v30, sel_setBackgroundColor_, v31);

    objc_msgSend(v9, sel_addSubview_, v30);
    v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_18E7CFB20;
    v33 = objc_msgSend(v30, sel_leadingAnchor);
    v34 = sub_18E735264();
    v35 = objc_msgSend(v34, sel_leadingAnchor);

    v36 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v35);
    *(_QWORD *)(v32 + 32) = v36;
    v37 = objc_msgSend(v30, sel_trailingAnchor);
    v38 = objc_msgSend(v9, sel_trailingAnchor);
    v39 = objc_msgSend(v37, sel_constraintEqualToAnchor_, v38);

    *(_QWORD *)(v32 + 40) = v39;
    v40 = objc_msgSend(v30, sel_bottomAnchor);
    v41 = objc_msgSend(v9, sel_bottomAnchor);
    v42 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v41);

    *(_QWORD *)(v32 + 48) = v42;
    v43 = objc_msgSend(v30, sel_heightAnchor);
    v44 = objc_msgSend(v9, sel_traitCollection);
    objc_msgSend(v44, sel_displayScale);
    v46 = v45;

    if (v46 <= 0.0)
    {
      v47 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
      objc_msgSend(v47, sel_scale);
      v46 = v48;

      if (v46 <= 0.0)
        v46 = 1.0;
    }
    v49 = objc_msgSend(v43, sel_constraintEqualToConstant_, 1.0 / v46, 4, 9);

    *(_QWORD *)(v32 + 56) = v49;
    sub_18E768AF8();
    v50 = (void *)sub_18E768AC8();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_activateConstraints_, v50);

  }
  return v9;
}

void sub_18E735B9C(char a1)
{
  void *v1;
  id v3;
  unsigned int v4;
  double v5;
  id v6;
  _BOOL4 v7;
  objc_super v8;

  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for CKSuggestedReplyButton();
  objc_msgSendSuper2(&v8, sel_setHighlighted_, a1 & 1);
  v3 = sub_18E735264();
  v4 = objc_msgSend(v1, sel_isHighlighted);
  v5 = 1.0;
  if (v4)
  {
    v6 = objc_msgSend(v1, sel_traitCollection, 1.0);
    v7 = objc_msgSend(v6, sel_userInterfaceStyle) == (id)2;

    v5 = *(double *)&qword_18E7CBE90[v7];
  }
  objc_msgSend(v3, sel_setAlpha_, v5);

}

id sub_18E735DFC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CKSuggestedReplyButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CKSuggestedReplyButton()
{
  return objc_opt_self();
}

id sub_18E735E5C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, double a6)
{
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t inited;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  unint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v12 = objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_, a1);
  v13 = v12;
  if ((_DWORD)a2)
  {
    v14 = objc_msgSend(v12, sel_fontDescriptorWithSymbolicTraits_, a2);
    if (v14)
    {
      v15 = v14;

      v13 = v15;
    }
  }
  if ((a4 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1121E8);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_18E7CE760;
    v17 = (void *)*MEMORY[0x1E0DC13C0];
    *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC13C0];
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1121F0);
    v18 = swift_initStackObject();
    *(_OWORD *)(v18 + 16) = xmmword_18E7CE760;
    v19 = (void *)*MEMORY[0x1E0DC1458];
    *(_QWORD *)(v18 + 32) = *MEMORY[0x1E0DC1458];
    *(_QWORD *)(v18 + 40) = a3;
    v20 = v17;
    v21 = v19;
    v22 = sub_18E50D88C(v18);
    *(_QWORD *)(inited + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1121F8);
    *(_QWORD *)(inited + 40) = v22;
    sub_18E50D994(inited);
    type metadata accessor for AttributeName(0);
    sub_18E736098();
    v23 = (void *)sub_18E768864();
    swift_bridgeObjectRelease();
    v24 = objc_msgSend(v13, sel_fontDescriptorByAddingAttributes_, v23);

    v13 = v24;
  }
  v25 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v13, a6);
  if ((a5 & 1) != 0 && a6 > 0.0)
  {
    v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA5F8]), sel_initForTextStyle_, a1);
    v27 = objc_msgSend(v26, sel_scaledFontForFont_, v25);

    v25 = v27;
  }

  return v25;
}

unint64_t sub_18E736098()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE0FA7B8;
  if (!qword_1EE0FA7B8)
  {
    type metadata accessor for AttributeName(255);
    result = MEMORY[0x193FF4E54](&unk_18E7CE684, v1);
    atomic_store(result, (unint64_t *)&qword_1EE0FA7B8);
  }
  return result;
}

uint64_t sub_18E7360E0()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;

  v1 = v0[1];
  v2 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0)
    v2 = *v0 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return 0;
  sub_18E7689FC();
  return sub_18E768A20();
}

void sub_18E736140(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  int *v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char v22;
  _QWORD *v23;
  char *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  id v33;
  id v34;
  double v35;
  uint64_t v36;
  uint64_t v37;

  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  v14 = (int *)type metadata accessor for ClarityUIEntryView(0);
  sub_18E520BEC(a5, (uint64_t)a9 + v14[5], &qword_1EE10EF20);
  v15 = (char *)a9 + v14[6];
  v16 = sub_18E766E3C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v15, a6, v16);
  v17 = (_QWORD *)((char *)a9 + v14[7]);
  *v17 = a7;
  v17[1] = a8;
  v18 = (char *)a9 + v14[8];
  sub_18E768210();
  *v18 = v36;
  *((_QWORD *)v18 + 1) = v37;
  v19 = (char *)a9 + v14[9];
  sub_18E768210();
  *v19 = v36;
  *((_QWORD *)v19 + 1) = v37;
  v20 = (char *)a9 + v14[10];
  *v20 = sub_18E766C38() & 1;
  *((_QWORD *)v20 + 1) = v21;
  v20[16] = v22 & 1;
  v23 = (_QWORD *)((char *)a9 + v14[11]);
  sub_18E768210();
  *v23 = v36;
  v23[1] = v37;
  v24 = (char *)a9 + v14[12];
  sub_18E768210();
  *v24 = v36;
  *((_QWORD *)v24 + 1) = v37;
  v25 = v14[13];
  v26 = (void *)objc_opt_self();
  v27 = objc_msgSend(v26, sel_currentDevice);
  v28 = objc_msgSend(v27, sel_userInterfaceIdiom);

  *((_BYTE *)a9 + v25) = v28 == (id)1;
  v29 = v14[14];
  sub_18E7670F4();
  *(_QWORD *)((char *)a9 + v29) = v30;
  v31 = v14[15];
  sub_18E7670F4();
  *(double *)((char *)a9 + v31) = v32 * 0.5;
  v33 = objc_msgSend(v26, sel_currentDevice);
  v34 = objc_msgSend(v33, sel_userInterfaceIdiom);

  v35 = 114.0;
  if (v34 == (id)1)
    v35 = 143.0;
  *(double *)((char *)a9 + v14[16]) = v35;
}

uint64_t type metadata accessor for ClarityUIEntryView(uint64_t a1)
{
  return sub_18E520164(a1, (uint64_t *)&unk_1EE112200);
}

BOOL sub_18E73639C()
{
  void *v0;
  unsigned __int8 v1;
  unsigned int v2;
  unsigned __int8 v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  unsigned __int8 v14;

  v1 = objc_msgSend(v0, sel_softwareKeyboardEnabled);
  v2 = objc_msgSend(v0, sel_videoRecordingEnabled);
  v3 = objc_msgSend(v0, sel_emojiKeyboardEnabled);
  v14 = v3;
  v4 = MEMORY[0x1E0DEE9D8];
  if ((v1 & 1) != 0)
  {
    v13 = MEMORY[0x1E0DEE9D8];
    sub_18E709B20(0, 1, 1);
    v4 = v13;
    v6 = *(_QWORD *)(v13 + 16);
    v5 = *(_QWORD *)(v13 + 24);
    if (v6 >= v5 >> 1)
    {
      sub_18E709B20(v5 > 1, v6 + 1, 1);
      v4 = v13;
    }
    *(_QWORD *)(v4 + 16) = v6 + 1;
    *(_BYTE *)(v4 + v6 + 32) = 1;
  }
  if (v2)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      sub_18E709B20(0, *(_QWORD *)(v4 + 16) + 1, 1);
    v8 = *(_QWORD *)(v4 + 16);
    v7 = *(_QWORD *)(v4 + 24);
    if (v8 >= v7 >> 1)
      sub_18E709B20(v7 > 1, v8 + 1, 1);
    *(_QWORD *)(v4 + 16) = v8 + 1;
    *(_BYTE *)(v4 + v8 + 32) = 1;
    if ((v14 & 1) == 0)
      goto LABEL_11;
  }
  else if ((v3 & 1) == 0)
  {
LABEL_11:
    v9 = *(_QWORD *)(v4 + 16);
    goto LABEL_18;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    sub_18E709B20(0, *(_QWORD *)(v4 + 16) + 1, 1);
  v11 = *(_QWORD *)(v4 + 16);
  v10 = *(_QWORD *)(v4 + 24);
  v9 = v11 + 1;
  if (v11 >= v10 >> 1)
    sub_18E709B20(v10 > 1, v11 + 1, 1);
  *(_QWORD *)(v4 + 16) = v9;
  *(_BYTE *)(v4 + v11 + 32) = 1;
LABEL_18:
  swift_release();
  return v9 == 1;
}

uint64_t sub_18E73657C()
{
  void *v0;

  if (!sub_18E73639C())
    return 1;
  if ((objc_msgSend(v0, sel_softwareKeyboardEnabled) & 1) != 0)
    return 2;
  if ((objc_msgSend(v0, sel_videoRecordingEnabled) & 1) != 0)
    return 3;
  if (objc_msgSend(v0, sel_emojiKeyboardEnabled))
    return 4;
  return 0;
}

uint64_t sub_18E7365FC()
{
  sub_18E768534();
  sub_18E766EC0();
  return swift_release();
}

uint64_t sub_18E736658@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t v14;
  uint64_t *v15;
  _BYTE v17[56];
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE10B6B0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112480);
  MEMORY[0x1E0C80A78](v8);
  v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17[48] = a1;
  v17[16] = a1;
  sub_18E768198();
  if (a1)
  {
    if (a1 == 1)
      v11 = sub_18E7680B4();
    else
      v11 = sub_18E768078();
  }
  else
  {
    v11 = sub_18E768084();
  }
  v12 = v11;
  KeyPath = swift_getKeyPath();
  v18 = v12;
  swift_retain();
  v14 = sub_18E766D88();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16))(v10, v7, v4);
  swift_release();
  v15 = (uint64_t *)&v10[*(int *)(v8 + 36)];
  *v15 = KeyPath;
  v15[1] = v14;
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  return sub_18E520BEC((uint64_t)v10, a2, &qword_1EE112480);
}

uint64_t sub_18E73680C@<X0>(uint64_t a1@<X8>)
{
  id v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  sub_18E767544();
  v2 = CKFrameworkBundle();
  result = sub_18E767C88();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

void sub_18E7368F8(uint64_t *a1@<X8>)
{
  id *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*v1, sel_string);
  if (v3)
  {
    v4 = v3;
    v5 = sub_18E768984();
    v7 = v6;

    *a1 = v5;
    a1[1] = v7;
  }
  else
  {
    __break(1u);
  }
}

id sub_18E736954()
{
  id result;

  sub_18E00F31C(0, &qword_1EE110600);
  result = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  qword_1EE12E1A0 = (uint64_t)result;
  return result;
}

uint64_t sub_18E73699C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  id v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (**v39)(uint64_t);
  void (*v40)(char *, uint64_t);
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (**v46)(uint64_t);
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v53;
  void (*v54)(char *, char *, uint64_t);
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  char v73;

  v70 = a1;
  v2 = sub_18E766F38();
  v68 = *(_QWORD *)(v2 - 8);
  v69 = v2;
  MEMORY[0x1E0C80A78](v2);
  v67 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v66 = (char *)&v53 - v5;
  v6 = type metadata accessor for ClarityUIEntryView(0);
  v7 = *(_QWORD *)(v6 - 8);
  v61 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_18E768E7C();
  v62 = *(_QWORD *)(v64 - 8);
  MEMORY[0x1E0C80A78](v64);
  v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112218);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112220);
  v59 = *(_QWORD *)(v15 - 8);
  v60 = v15;
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112228);
  MEMORY[0x1E0C80A78](v58);
  v19 = (char *)&v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112230);
  MEMORY[0x1E0C80A78](v65);
  v63 = (uint64_t)&v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v14 = sub_18E7675B0();
  *((_QWORD *)v14 + 1) = 0;
  v14[16] = 0;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112238);
  sub_18E736F0C(v1, (uint64_t)&v14[*(int *)(v21 + 44)]);
  v22 = v1 + *(int *)(v6 + 48);
  v23 = v1;
  v57 = v1;
  v24 = *(_BYTE *)v22;
  v25 = *(_QWORD *)(v22 + 8);
  v71 = v24;
  v72 = v25;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE110990);
  sub_18E76821C();
  v71 = v73;
  sub_18E514BB4(&qword_1EE112240, &qword_1EE112218, MEMORY[0x1E0CDFCC0]);
  sub_18E767FE8();
  sub_18E00FA98((uint64_t)v14, &qword_1EE112218);
  v56 = (id)objc_opt_self();
  v26 = objc_msgSend(v56, sel_defaultCenter);
  v27 = v11;
  sub_18E768E88();

  v53 = v9;
  sub_18E520220(v23, (uint64_t)v9, type metadata accessor for ClarityUIEntryView);
  v28 = *(unsigned __int8 *)(v7 + 80);
  v29 = (v28 + 16) & ~v28;
  v61 += v29;
  v55 = v28 | 7;
  v30 = swift_allocObject();
  sub_18E740868((uint64_t)v9, v30 + v29);
  v32 = v59;
  v31 = v60;
  v33 = (uint64_t)v19;
  v34 = v17;
  (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v19, v17, v60);
  v35 = v58;
  v36 = &v19[*(int *)(v58 + 52)];
  v37 = v62;
  v54 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
  v38 = v64;
  v54(v36, v27, v64);
  v39 = (uint64_t (**)(uint64_t))(v33 + *(int *)(v35 + 56));
  *v39 = sub_18E7408AC;
  v39[1] = (uint64_t (*)(uint64_t))v30;
  v40 = *(void (**)(char *, uint64_t))(v37 + 8);
  v40(v27, v38);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v31);
  v41 = objc_msgSend(v56, sel_defaultCenter);
  sub_18E768E88();

  v42 = (uint64_t)v53;
  sub_18E520220(v57, (uint64_t)v53, type metadata accessor for ClarityUIEntryView);
  v43 = swift_allocObject();
  sub_18E740868(v42, v43 + v29);
  v44 = v63;
  sub_18E5106A0(v33, v63, &qword_1EE112228);
  v45 = v65;
  v54((char *)(v44 + *(int *)(v65 + 52)), v27, v38);
  v46 = (uint64_t (**)(uint64_t))(v44 + *(int *)(v45 + 56));
  *v46 = sub_18E740A2C;
  v46[1] = (uint64_t (*)(uint64_t))v43;
  v40(v27, v38);
  sub_18E00FA98(v33, &qword_1EE112228);
  v47 = v66;
  sub_18E766F2C();
  v48 = v68;
  v49 = v69;
  (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v67, v47, v69);
  sub_18E50F680(&qword_1EE112248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD93F0], MEMORY[0x1E0CD93E8]);
  v50 = sub_18E766DE8();
  v51 = v70;
  sub_18E5106A0(v44, v70, &qword_1EE112230);
  *(_QWORD *)(v51 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE112250) + 36)) = v50;
  (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v49);
  return sub_18E00FA98(v44, &qword_1EE112230);
}

void sub_18E736F0C(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v24;
  char v25;
  uint64_t v26;
  _QWORD v27[3];
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char v56;
  uint64_t v57;

  v53 = a2;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112260);
  MEMORY[0x1E0C80A78](v54);
  v34 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112268);
  MEMORY[0x1E0C80A78](v43);
  v35 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112270);
  MEMORY[0x1E0C80A78](v40);
  v42 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112278);
  MEMORY[0x1E0C80A78](v49);
  v44 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112280);
  MEMORY[0x1E0C80A78](v7);
  v30 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112288);
  MEMORY[0x1E0C80A78](v29);
  v33 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112290);
  MEMORY[0x1E0C80A78](v38);
  v31 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v36 = (char *)v27 - v12;
  v28 = sub_18E766F38();
  v27[2] = *(_QWORD *)(v28 - 8);
  MEMORY[0x1E0C80A78](v28);
  v27[1] = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112298);
  MEMORY[0x1E0C80A78](v15);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1122A0);
  MEMORY[0x1E0C80A78](v41);
  MEMORY[0x1E0C80A78](v16);
  v32 = (char *)v27 - v17;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1122A8);
  MEMORY[0x1E0C80A78](v50);
  v52 = (char *)v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1122B0);
  MEMORY[0x1E0C80A78](v45);
  v47 = (char *)v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1122B8);
  MEMORY[0x1E0C80A78](v37);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1122C0);
  MEMORY[0x1E0C80A78](v46);
  v39 = (char *)v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1122C8);
  MEMORY[0x1E0C80A78](v51);
  v48 = (char *)v27 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for ClarityUIEntryView(0);
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)(a1 + *(int *)(v23 + 36));
  v25 = *v24;
  v26 = *((_QWORD *)v24 + 1);
  v56 = v25;
  v57 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112258);
  sub_18E76821C();
  __asm { BR              X10 }
}

uint64_t sub_18E73740C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  char v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  sub_18E520220(v2, v3, type metadata accessor for ClarityUIEntryView);
  v5 = (*(unsigned __int8 *)(v0 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  v6 = swift_allocObject();
  sub_18E740868(v3, v6 + v5);
  sub_18E7684D4();
  sub_18E766D7C();
  v7 = *(_QWORD *)(v4 - 152);
  v8 = *(_BYTE *)(v4 - 144);
  v9 = *(_QWORD *)(v4 - 136);
  v10 = *(_BYTE *)(v4 - 128);
  *(_QWORD *)(v4 - 256) = *(_QWORD *)(v4 - 120);
  *(_QWORD *)(v4 - 248) = v7;
  *(_QWORD *)(v4 - 264) = *(_QWORD *)(v4 - 112);
  v11 = sub_18E767A6C();
  v12 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v13 = objc_msgSend(v12, sel_userInterfaceIdiom);

  if (v13 == (id)1)
  {
    sub_18E766E18();
    sub_18E76713C();
    sub_18E766E18();
  }
  else
  {
    sub_18E767130();
  }
  sub_18E766C14();
  *(_QWORD *)v1 = sub_18E740F74;
  *(_QWORD *)(v1 + 8) = v6;
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v4 - 248);
  *(_BYTE *)(v1 + 24) = v8;
  *(_QWORD *)(v1 + 32) = v9;
  *(_BYTE *)(v1 + 40) = v10;
  v14 = *(_QWORD *)(v4 - 264);
  *(_QWORD *)(v1 + 48) = *(_QWORD *)(v4 - 256);
  *(_QWORD *)(v1 + 56) = v14;
  *(_BYTE *)(v1 + 64) = v11;
  *(_QWORD *)(v1 + 72) = v15;
  *(_QWORD *)(v1 + 80) = v16;
  *(_QWORD *)(v1 + 88) = v17;
  *(_QWORD *)(v1 + 96) = v18;
  *(_BYTE *)(v1 + 104) = 0;
  swift_storeEnumTagMultiPayload();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1122E8);
  sub_18E740AA8();
  sub_18E740B34();
  v19 = *(_QWORD *)(v4 - 288);
  sub_18E767688();
  sub_18E5106A0(v19, *(_QWORD *)(v4 - 224), &qword_1EE1122C0);
  swift_storeEnumTagMultiPayload();
  sub_18E740A84();
  sub_18E740BD0();
  v20 = *(_QWORD *)(v4 - 216);
  sub_18E767688();
  sub_18E00FA98(v19, &qword_1EE1122C0);
  sub_18E5106A0(v20, *(_QWORD *)(v4 - 184), &qword_1EE1122C8);
  swift_storeEnumTagMultiPayload();
  sub_18E5216E0(&qword_1EE1122D0, &qword_1EE1122C8, sub_18E740A84, sub_18E740BD0);
  sub_18E5659F4(&qword_1EE112388, &qword_1EE112260, sub_18E740E04, MEMORY[0x1E0CDC8B0]);
  sub_18E767688();
  sub_18E00FA98(v20, &qword_1EE1122C8);
  return swift_release();
}

uint64_t sub_18E737C78()
{
  if (qword_1EE107688 != -1)
    swift_once();
  sub_18E73657C();
  type metadata accessor for ClarityUIEntryView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112258);
  return sub_18E768228();
}

uint64_t sub_18E737D24@<X0>(uint64_t a1@<X8>)
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
  char *v11;
  int *v12;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (**v39)();
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD v44[3];
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;

  v56 = a1;
  v2 = sub_18E766F38();
  v54 = *(_QWORD *)(v2 - 8);
  v55 = v2;
  MEMORY[0x1E0C80A78](v2);
  v53 = (char *)v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v52 = (char *)v44 - v5;
  v44[0] = type metadata accessor for ClarityUIEntryView(0);
  v6 = *(_QWORD *)(v44[0] - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x1E0C80A78](v44[0]);
  v8 = (char *)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v44 - v10;
  v12 = (int *)type metadata accessor for ClarityCameraView();
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112368);
  MEMORY[0x1E0C80A78](v47);
  v45 = (uint64_t)v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112358);
  MEMORY[0x1E0C80A78](v49);
  v48 = (uint64_t)v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112348);
  MEMORY[0x1E0C80A78](v51);
  v50 = (uint64_t)v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = v11;
  sub_18E520220(v1, (uint64_t)v11, type metadata accessor for ClarityUIEntryView);
  v18 = *(unsigned __int8 *)(v6 + 80);
  v19 = (v18 + 16) & ~v18;
  v44[1] = v18 | 7;
  v44[2] = v19 + v7;
  v20 = swift_allocObject();
  sub_18E740868((uint64_t)v11, v20 + v19);
  sub_18E520220(v1, (uint64_t)v8, type metadata accessor for ClarityUIEntryView);
  v21 = swift_allocObject();
  v22 = v19;
  sub_18E740868((uint64_t)v8, v21 + v19);
  v23 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF20);
  sub_18E76836C();
  *(_QWORD *)v14 = sub_18E6ADBB4;
  *((_QWORD *)v14 + 1) = 0;
  v14[16] = 0;
  *((_QWORD *)v14 + 3) = sub_18E740FF0;
  *((_QWORD *)v14 + 4) = v20;
  *((_QWORD *)v14 + 5) = sub_18E74128C;
  *((_QWORD *)v14 + 6) = v21;
  v24 = &v14[v12[8]];
  LOBYTE(v57) = 0;
  sub_18E768210();
  v25 = *((_QWORD *)&v58 + 1);
  *v24 = v58;
  *((_QWORD *)v24 + 1) = v25;
  v26 = v12[9];
  v57 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112548);
  sub_18E768210();
  *(_OWORD *)&v14[v26] = v58;
  v27 = &v14[v12[10]];
  LOBYTE(v57) = 0;
  sub_18E768210();
  v28 = *((_QWORD *)&v58 + 1);
  *v27 = v58;
  *((_QWORD *)v27 + 1) = v28;
  v29 = v45;
  sub_18E520220((uint64_t)v14, v45, (uint64_t (*)(_QWORD))type metadata accessor for ClarityCameraView);
  *(_BYTE *)(v29 + *(int *)(v47 + 36)) = 0;
  sub_18E565AE0((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for ClarityCameraView);
  v30 = v52;
  sub_18E766F2C();
  v31 = v54;
  v32 = v55;
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v53, v30, v55);
  sub_18E50F680(&qword_1EE112248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD93F0], MEMORY[0x1E0CD93E8]);
  v33 = v32;
  v34 = sub_18E766DE8();
  v35 = v48;
  sub_18E5106A0(v29, v48, &qword_1EE112368);
  *(_QWORD *)(v35 + *(int *)(v49 + 36)) = v34;
  (*(void (**)(char *, uint64_t))(v31 + 8))(v30, v33);
  sub_18E00FA98(v29, &qword_1EE112368);
  v36 = (uint64_t)v46;
  sub_18E520220(v23, (uint64_t)v46, type metadata accessor for ClarityUIEntryView);
  v37 = swift_allocObject();
  sub_18E740868(v36, v37 + v22);
  v38 = v50;
  sub_18E5106A0(v35, v50, &qword_1EE112358);
  v39 = (uint64_t (**)())(v38 + *(int *)(v51 + 36));
  *v39 = sub_18E74129C;
  v39[1] = (uint64_t (*)())v37;
  v39[2] = 0;
  v39[3] = 0;
  sub_18E00FA98(v35, &qword_1EE112358);
  sub_18E520220(v23, v36, type metadata accessor for ClarityUIEntryView);
  v40 = swift_allocObject();
  sub_18E740868(v36, v40 + v22);
  v41 = v56;
  sub_18E5106A0(v38, v56, &qword_1EE112348);
  v42 = (_QWORD *)(v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE112268) + 36));
  *v42 = 0;
  v42[1] = 0;
  v42[2] = sub_18E7412B0;
  v42[3] = v40;
  return sub_18E00FA98(v38, &qword_1EE112348);
}

uint64_t sub_18E73826C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
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
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t (**v27)();
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v39 = a1;
  v2 = type metadata accessor for ClarityUIEntryView(0);
  v3 = *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64);
  v37 = *(_QWORD *)(v2 - 8);
  v38 = v3;
  MEMORY[0x1E0C80A78](v2);
  v36 = (uint64_t)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_18E766F38();
  v34 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v32 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1123C8);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1123B8);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1123A8);
  MEMORY[0x1E0C80A78](v33);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112398);
  MEMORY[0x1E0C80A78](v35);
  v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v13 = sub_18E7675B0();
  *((_QWORD *)v13 + 1) = 0;
  v13[16] = 1;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112550);
  sub_18E73B84C(v1, (uint64_t)&v13[*(int *)(v21 + 44)]);
  sub_18E5106A0((uint64_t)v13, (uint64_t)v16, &qword_1EE1123C8);
  v16[*(int *)(v14 + 36)] = 0;
  sub_18E00FA98((uint64_t)v13, &qword_1EE1123C8);
  sub_18E766F2C();
  v22 = v34;
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v7, v10, v5);
  sub_18E50F680(&qword_1EE112248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD93F0], MEMORY[0x1E0CD93E8]);
  v23 = sub_18E766DE8();
  sub_18E5106A0((uint64_t)v16, (uint64_t)v18, &qword_1EE1123B8);
  *(_QWORD *)&v18[*(int *)(v33 + 36)] = v23;
  (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v5);
  sub_18E00FA98((uint64_t)v16, &qword_1EE1123B8);
  v24 = v36;
  sub_18E520220((uint64_t)v1, v36, type metadata accessor for ClarityUIEntryView);
  v25 = (*(unsigned __int8 *)(v37 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  v26 = swift_allocObject();
  sub_18E740868(v24, v26 + v25);
  sub_18E5106A0((uint64_t)v18, (uint64_t)v20, &qword_1EE1123A8);
  v27 = (uint64_t (**)())&v20[*(int *)(v35 + 36)];
  *v27 = sub_18E74129C;
  v27[1] = (uint64_t (*)())v26;
  v27[2] = 0;
  v27[3] = 0;
  sub_18E00FA98((uint64_t)v18, &qword_1EE1123A8);
  sub_18E520220((uint64_t)v1, v24, type metadata accessor for ClarityUIEntryView);
  v28 = swift_allocObject();
  sub_18E740868(v24, v28 + v25);
  v29 = v39;
  sub_18E5106A0((uint64_t)v20, v39, &qword_1EE112398);
  v30 = (_QWORD *)(v29 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE112260) + 36));
  *v30 = 0;
  v30[1] = 0;
  v30[2] = sub_18E7412B0;
  v30[3] = v28;
  return sub_18E00FA98((uint64_t)v20, &qword_1EE112398);
}

void sub_18E738638(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  id v3;

  v2 = *a2;
  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  objc_msgSend(v3, sel_setIdleTimerDisabled_, v2);

}

uint64_t sub_18E738694(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE110660);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_18E765F3C();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  sub_18E738758((uint64_t)v4, 1);
  return sub_18E00FA98((uint64_t)v4, &qword_1EE110660);
}

uint64_t sub_18E738758(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  unsigned __int8 v15;
  char *v16;
  char v17;
  uint64_t v18;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE110660);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E5106A0(a1, (uint64_t)v8, &qword_1EE110660);
  v9 = sub_18E765F3C();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_18E00FA98((uint64_t)v8, &qword_1EE110660);
LABEL_7:
    v28 = 0u;
    v29 = 0u;
LABEL_8:
    sub_18E00FA98((uint64_t)&v28, qword_1EE0FB3F0);
    goto LABEL_9;
  }
  v11 = sub_18E765F30();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
  if (!v11)
    goto LABEL_7;
  v25[1] = sub_18E768984();
  v25[2] = v12;
  sub_18E7691F4();
  if (*(_QWORD *)(v11 + 16) && (v13 = sub_18E543F88((uint64_t)&v26), (v14 & 1) != 0))
  {
    sub_18E00F118(*(_QWORD *)(v11 + 56) + 32 * v13, (uint64_t)&v28);
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_18E52A958((uint64_t)&v26);
  if (!*((_QWORD *)&v29 + 1))
    goto LABEL_8;
  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FB940);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v20 = v26;
    objc_msgSend(v26, sel_doubleValue);
    v22 = v21;
    v23 = v3 + *(int *)(type metadata accessor for ClarityUIEntryView(0) + 44);
    v24 = *(_QWORD *)(v23 + 8);
    v26 = *(id *)v23;
    v27 = v24;
    *(_QWORD *)&v28 = v22;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10A938);
    sub_18E768228();
    swift_release();

  }
LABEL_9:
  if ((a2 & 1) != 0)
    v15 = 1;
  else
    v15 = objc_msgSend((id)objc_opt_self(), sel_isInHardwareKeyboardMode);
  v16 = (char *)(v3 + *(int *)(type metadata accessor for ClarityUIEntryView(0) + 32));
  v17 = *v16;
  v18 = *((_QWORD *)v16 + 1);
  LOBYTE(v26) = v17;
  v27 = v18;
  LOBYTE(v28) = v15;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE110990);
  return sub_18E768228();
}

uint64_t sub_18E7389EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[16];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE110660);
  MEMORY[0x1E0C80A78](v4);
  v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  result = (uint64_t)objc_msgSend((id)objc_opt_self(), sel_isInHardwareKeyboardMode);
  if ((result & 1) == 0)
  {
    MEMORY[0x1E0C80A78](result);
    *(_QWORD *)&v10[-16] = a2;
    sub_18E768534();
    sub_18E766EC0();
    swift_release();
    v8 = sub_18E765F3C();
    v9 = *(_QWORD *)(v8 - 8);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(v6, a1, v8);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    sub_18E738758((uint64_t)v6, 0);
    return sub_18E00FA98((uint64_t)v6, &qword_1EE110660);
  }
  return result;
}

uint64_t sub_18E738B28@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(_QWORD);
  unint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  id v26;
  id v27;
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
  uint64_t v51;
  char v52;
  uint64_t v53;
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
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  _OWORD *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  unsigned __int8 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  _OWORD *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
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
  int v112;
  uint64_t v113;
  uint64_t v114;
  _OWORD *v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  uint64_t v119;
  uint64_t v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _OWORD v129[2];
  _QWORD v130[3];
  char v131;
  _BYTE v132[7];
  uint64_t v133;
  char v134;
  _BYTE v135[7];
  uint64_t v136;
  uint64_t v137;
  char v138;
  _BYTE v139[7];
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char v144;
  _BYTE v145[7];
  char v146;
  _BYTE v147[7];
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char v152;
  unsigned __int8 v153;
  _BYTE v154[7];
  _BYTE v155[7];
  unsigned __int8 v156;
  _BYTE v157[7];
  _BYTE v158[7];
  unsigned __int8 v159;
  _BYTE v160[7];
  unsigned __int8 v161;
  uint64_t v162;
  unsigned __int8 v163;
  uint64_t v164;
  unsigned __int8 v165;
  uint64_t v166;
  uint64_t v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;

  v115 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1123E0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1123E8);
  MEMORY[0x1E0C80A78](v95);
  v101 = (uint64_t)&v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1123F0);
  MEMORY[0x1E0C80A78](v96);
  v104 = (uint64_t)&v94 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1123F8);
  MEMORY[0x1E0C80A78](v100);
  v103 = (uint64_t)&v94 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112400);
  MEMORY[0x1E0C80A78](v99);
  v10 = (char *)&v94 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112408);
  MEMORY[0x1E0C80A78](v97);
  v102 = (uint64_t)&v94 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112410);
  MEMORY[0x1E0C80A78](v98);
  v13 = (char *)&v94 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112418);
  MEMORY[0x1E0C80A78](v109);
  v117 = (uint64_t)&v94 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v110 = (uint64_t)&v94 - v16;
  MEMORY[0x1E0C80A78](v17);
  v116 = (uint64_t)&v94 - v18;
  v19 = type metadata accessor for ClarityUIEntryView(0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(_QWORD *)(v20 + 64);
  MEMORY[0x1E0C80A78](v19);
  sub_18E520220(a1, (uint64_t)&v94 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v22);
  v23 = (*(unsigned __int8 *)(v20 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v120 = swift_allocObject();
  sub_18E740868((uint64_t)&v94 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v120 + v23);
  sub_18E7684D4();
  sub_18E766D7C();
  v111 = v162;
  v24 = v163;
  v119 = v164;
  v25 = v165;
  v113 = v167;
  v114 = v166;
  v112 = sub_18E767A6C();
  v26 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v27 = objc_msgSend(v26, sel_userInterfaceIdiom);

  if (v27 == (id)1)
  {
    sub_18E766E18();
    sub_18E76713C();
    sub_18E766E18();
  }
  else
  {
    sub_18E767130();
  }
  sub_18E766C14();
  v107 = v29;
  v108 = v28;
  v105 = v31;
  v106 = v30;
  v118 = sub_18E767A90();
  sub_18E766C14();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v161 = v24;
  v159 = v25;
  v156 = 0;
  v153 = 0;
  *(_QWORD *)v5 = sub_18E7675B0();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112420);
  sub_18E739550(a1, (uint64_t)&v5[*(int *)(v40 + 44)]);
  v41 = sub_18E767A84();
  sub_18E767100();
  sub_18E766C14();
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v50 = v101;
  sub_18E5106A0((uint64_t)v5, v101, &qword_1EE1123E0);
  v51 = v50 + *(int *)(v95 + 36);
  *(_BYTE *)v51 = v41;
  *(_QWORD *)(v51 + 8) = v43;
  *(_QWORD *)(v51 + 16) = v45;
  *(_QWORD *)(v51 + 24) = v47;
  *(_QWORD *)(v51 + 32) = v49;
  *(_BYTE *)(v51 + 40) = 0;
  sub_18E00FA98((uint64_t)v5, &qword_1EE1123E0);
  v52 = sub_18E767A6C();
  sub_18E766C14();
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v60 = v59;
  v61 = v104;
  sub_18E5106A0(v50, v104, &qword_1EE1123E8);
  v62 = v61 + *(int *)(v96 + 36);
  *(_BYTE *)v62 = v52;
  *(_QWORD *)(v62 + 8) = v54;
  *(_QWORD *)(v62 + 16) = v56;
  *(_QWORD *)(v62 + 24) = v58;
  *(_QWORD *)(v62 + 32) = v60;
  *(_BYTE *)(v62 + 40) = 0;
  sub_18E00FA98(v50, &qword_1EE1123E8);
  v63 = sub_18E768060();
  LOBYTE(v50) = sub_18E767A78();
  v64 = v103;
  sub_18E5106A0(v61, v103, &qword_1EE1123F0);
  v65 = v64 + *(int *)(v100 + 36);
  *(_QWORD *)v65 = v63;
  *(_BYTE *)(v65 + 8) = v50;
  sub_18E00FA98(v61, &qword_1EE1123F0);
  sub_18E5106A0(v64, (uint64_t)v10, &qword_1EE1123F8);
  *(_WORD *)&v10[*(int *)(v99 + 36)] = 256;
  sub_18E00FA98(v64, &qword_1EE1123F8);
  v66 = v102;
  sub_18E5106A0((uint64_t)v10, v102, &qword_1EE112400);
  *(_BYTE *)(v66 + *(int *)(v97 + 36)) = 0;
  sub_18E00FA98((uint64_t)v10, &qword_1EE112400);
  v67 = sub_18E7670DC();
  LOBYTE(v50) = sub_18E767A78();
  sub_18E5106A0(v66, (uint64_t)v13, &qword_1EE112408);
  v68 = &v13[*(int *)(v98 + 36)];
  *(_QWORD *)v68 = v67;
  v68[8] = v50;
  sub_18E00FA98(v66, &qword_1EE112408);
  sub_18E766E18();
  sub_18E7684D4();
  sub_18E7671F0();
  v69 = v110;
  sub_18E5106A0((uint64_t)v13, v110, &qword_1EE112410);
  v70 = (_OWORD *)(v69 + *(int *)(v109 + 36));
  v71 = v173;
  v70[4] = v172;
  v70[5] = v71;
  v70[6] = v174;
  v72 = v169;
  *v70 = v168;
  v70[1] = v72;
  v73 = v171;
  v70[2] = v170;
  v70[3] = v73;
  sub_18E00FA98((uint64_t)v13, &qword_1EE112410);
  v74 = v116;
  sub_18E520BEC(v69, v116, &qword_1EE112418);
  LOBYTE(v67) = v161;
  LODWORD(v110) = v161;
  LOBYTE(v50) = v159;
  LODWORD(v103) = v159;
  v75 = v156;
  LODWORD(v104) = v156;
  LOBYTE(v69) = v153;
  LODWORD(v109) = v153;
  v76 = v117;
  sub_18E5106A0(v74, v117, &qword_1EE112418);
  *(_QWORD *)&v121 = sub_18E740FF0;
  *((_QWORD *)&v121 + 1) = v120;
  v77 = v111;
  *(_QWORD *)&v122 = v111;
  BYTE8(v122) = v67;
  *(_DWORD *)((char *)&v122 + 9) = *(_DWORD *)v160;
  HIDWORD(v122) = *(_DWORD *)&v160[3];
  *(_QWORD *)&v123 = v119;
  BYTE8(v123) = v50;
  *(_DWORD *)((char *)&v123 + 9) = *(_DWORD *)v158;
  HIDWORD(v123) = *(_DWORD *)&v158[3];
  v79 = v113;
  v78 = v114;
  *(_QWORD *)&v124 = v114;
  *((_QWORD *)&v124 + 1) = v113;
  v80 = v112;
  LOBYTE(v125) = v112;
  DWORD1(v125) = *(_DWORD *)&v157[3];
  *(_DWORD *)((char *)&v125 + 1) = *(_DWORD *)v157;
  v82 = v107;
  v81 = v108;
  *((_QWORD *)&v125 + 1) = v108;
  *(_QWORD *)&v126 = v107;
  v84 = v105;
  v83 = v106;
  *((_QWORD *)&v126 + 1) = v106;
  *(_QWORD *)&v127 = v105;
  BYTE8(v127) = v75;
  *(_DWORD *)((char *)&v127 + 9) = *(_DWORD *)v155;
  HIDWORD(v127) = *(_DWORD *)&v155[3];
  LOBYTE(v128) = v118;
  *(_DWORD *)((char *)&v128 + 1) = *(_DWORD *)v154;
  DWORD1(v128) = *(_DWORD *)&v154[3];
  *((_QWORD *)&v128 + 1) = v33;
  *(_QWORD *)&v129[0] = v35;
  *((_QWORD *)&v129[0] + 1) = v37;
  *(_QWORD *)&v129[1] = v39;
  BYTE8(v129[1]) = v69;
  v85 = v122;
  v86 = v115;
  *v115 = v121;
  v86[1] = v85;
  v87 = v126;
  v86[4] = v125;
  v86[5] = v87;
  v88 = v124;
  v86[2] = v123;
  v86[3] = v88;
  v89 = v127;
  v90 = v128;
  v91 = v129[0];
  *(_OWORD *)((char *)v86 + 137) = *(_OWORD *)((char *)v129 + 9);
  v86[7] = v90;
  v86[8] = v91;
  v86[6] = v89;
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112428);
  sub_18E5106A0(v76, (uint64_t)v86 + *(int *)(v92 + 48), &qword_1EE112418);
  sub_18E741004((uint64_t)&v121);
  sub_18E00FA98(v74, &qword_1EE112418);
  sub_18E00FA98(v76, &qword_1EE112418);
  v130[0] = sub_18E740FF0;
  v130[1] = v120;
  v130[2] = v77;
  v131 = v110;
  *(_DWORD *)v132 = *(_DWORD *)v160;
  *(_DWORD *)&v132[3] = *(_DWORD *)&v160[3];
  v133 = v119;
  v134 = v103;
  *(_DWORD *)v135 = *(_DWORD *)v158;
  *(_DWORD *)&v135[3] = *(_DWORD *)&v158[3];
  v136 = v78;
  v137 = v79;
  v138 = v80;
  *(_DWORD *)&v139[3] = *(_DWORD *)&v157[3];
  *(_DWORD *)v139 = *(_DWORD *)v157;
  v140 = v81;
  v141 = v82;
  v142 = v83;
  v143 = v84;
  v144 = v104;
  *(_DWORD *)v145 = *(_DWORD *)v155;
  *(_DWORD *)&v145[3] = *(_DWORD *)&v155[3];
  v146 = v118;
  *(_DWORD *)v147 = *(_DWORD *)v154;
  *(_DWORD *)&v147[3] = *(_DWORD *)&v154[3];
  v148 = v33;
  v149 = v35;
  v150 = v37;
  v151 = v39;
  v152 = v109;
  return sub_18E6FB568((uint64_t)v130);
}

uint64_t sub_18E7394E4()
{
  type metadata accessor for ClarityUIEntryView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112258);
  return sub_18E768228();
}

uint64_t sub_18E739550@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char v35;
  id v36;
  id v37;
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
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, char *, uint64_t);
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v71 = a2;
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112430);
  v70 = *(_QWORD *)(v73 - 8);
  MEMORY[0x1E0C80A78](v73);
  v72 = (char *)&v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v69 = (char *)&v61 - v5;
  v61 = type metadata accessor for ClarityUIEntryView(0);
  v6 = *(_QWORD *)(v61 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x1E0C80A78](v61);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE10A470);
  v63 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112438);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112440);
  MEMORY[0x1E0C80A78](v62);
  v16 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112448);
  MEMORY[0x1E0C80A78](v65);
  v68 = (uint64_t)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18);
  v64 = (uint64_t)&v61 - v19;
  MEMORY[0x1E0C80A78](v20);
  v66 = (uint64_t)&v61 - v21;
  v67 = a1;
  sub_18E520220(a1, (uint64_t)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ClarityUIEntryView);
  v22 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v23 = swift_allocObject();
  sub_18E740868((uint64_t)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE10B6B0);
  sub_18E514BB4(&qword_1EE10A480, (uint64_t *)&unk_1EE10B6B0, MEMORY[0x1E0CDF8C8]);
  sub_18E768258();
  v24 = sub_18E7680E4();
  v74 = 0;
  v75 = v24;
  sub_18E514BB4(&qword_1EE10E0C8, (uint64_t *)&unk_1EE10A470, MEMORY[0x1E0CDFA58]);
  sub_18E6B1F4C();
  sub_18E767D30();
  swift_release();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v10, v8);
  v25 = sub_18E767A90();
  sub_18E767100();
  sub_18E766C14();
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v16, v14, v11);
  v34 = &v16[*(int *)(v62 + 36)];
  *v34 = v25;
  *((_QWORD *)v34 + 1) = v27;
  *((_QWORD *)v34 + 2) = v29;
  *((_QWORD *)v34 + 3) = v31;
  *((_QWORD *)v34 + 4) = v33;
  v34[40] = 0;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v35 = sub_18E767A6C();
  v36 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v37 = objc_msgSend(v36, sel_userInterfaceIdiom);

  if (v37 == (id)1)
  {
    v38 = v67;
    sub_18E766E18();
    sub_18E76713C();
    sub_18E766E18();
  }
  else
  {
    sub_18E767130();
    v38 = v67;
  }
  sub_18E766C14();
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v47 = v64;
  sub_18E5106A0((uint64_t)v16, v64, &qword_1EE112440);
  v48 = v47 + *(int *)(v65 + 36);
  *(_BYTE *)v48 = v35;
  *(_QWORD *)(v48 + 8) = v40;
  *(_QWORD *)(v48 + 16) = v42;
  *(_QWORD *)(v48 + 24) = v44;
  *(_QWORD *)(v48 + 32) = v46;
  *(_BYTE *)(v48 + 40) = 0;
  sub_18E00FA98((uint64_t)v16, &qword_1EE112440);
  v49 = v66;
  v50 = sub_18E520BEC(v47, v66, &qword_1EE112448);
  MEMORY[0x1E0C80A78](v50);
  *(&v61 - 2) = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112450);
  sub_18E514BB4(&qword_1EE112458, &qword_1EE112450, MEMORY[0x1E0CE0680]);
  v51 = v69;
  sub_18E767BB0();
  v52 = v68;
  sub_18E5106A0(v49, v68, &qword_1EE112448);
  v53 = v70;
  v54 = *(void (**)(char *, char *, uint64_t))(v70 + 16);
  v56 = v72;
  v55 = v73;
  v54(v72, v51, v73);
  v57 = v71;
  sub_18E5106A0(v52, v71, &qword_1EE112448);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112460);
  v54((char *)(v57 + *(int *)(v58 + 48)), v56, v55);
  v59 = *(void (**)(char *, uint64_t))(v53 + 8);
  v59(v51, v55);
  sub_18E00FA98(v49, &qword_1EE112448);
  v59(v56, v55);
  return sub_18E00FA98(v52, &qword_1EE112448);
}

uint64_t sub_18E739AE8()
{
  return sub_18E768198();
}

uint64_t sub_18E739B24@<X0>(uint64_t a1@<X8>)
{
  return sub_18E73CCFC(a1);
}

uint64_t sub_18E739B30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v50 = a1;
  v48 = a2;
  v2 = type metadata accessor for ClarityUIEntryView(0);
  v49 = *(_QWORD *)(v2 - 8);
  v3 = *(_QWORD *)(v49 + 64);
  MEMORY[0x1E0C80A78](v2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112468);
  MEMORY[0x1E0C80A78](v4);
  v47 = (uint64_t)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v46 = (uint64_t)&v43 - v7;
  MEMORY[0x1E0C80A78](v8);
  v45 = (uint64_t)&v43 - v9;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v43 - v11;
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v43 - v14;
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v43 - v17;
  if (qword_1EE107688 != -1)
    swift_once();
  v19 = &qword_1EE12E000;
  if (objc_msgSend((id)qword_1EE12E1A0, sel_softwareKeyboardEnabled))
  {
    sub_18E520220(v50, (uint64_t)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ClarityUIEntryView);
    v20 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    v21 = swift_allocObject();
    sub_18E740868((uint64_t)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20);
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = sub_18E741134;
    *(_QWORD *)(v22 + 24) = v21;
    MEMORY[0x1E0C80A78](v22);
    *((_BYTE *)&v43 - 16) = 0;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112480);
    sub_18E741080();
    v19 = &qword_1EE12E000;
    sub_18E768258();
    swift_release();
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112470);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v18, 0, 1, v23);
  }
  else
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112470);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v18, 1, 1, v24);
  }
  if (objc_msgSend((id)v19[52], sel_videoRecordingEnabled))
  {
    sub_18E520220(v50, (uint64_t)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ClarityUIEntryView);
    v25 = *(unsigned __int8 *)(v49 + 80);
    v44 = v12;
    v26 = v19;
    v27 = (v25 + 16) & ~v25;
    v28 = swift_allocObject();
    sub_18E740868((uint64_t)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v28 + v27);
    v29 = swift_allocObject();
    *(_QWORD *)(v29 + 16) = sub_18E741120;
    *(_QWORD *)(v29 + 24) = v28;
    MEMORY[0x1E0C80A78](v29);
    *((_BYTE *)&v43 - 16) = 1;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112480);
    sub_18E741080();
    v19 = v26;
    v12 = v44;
    sub_18E768258();
    swift_release();
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112470);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v15, 0, 1, v30);
  }
  else
  {
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112470);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v15, 1, 1, v31);
  }
  if (objc_msgSend((id)v19[52], sel_emojiKeyboardEnabled))
  {
    sub_18E520220(v50, (uint64_t)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ClarityUIEntryView);
    v32 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    v33 = swift_allocObject();
    sub_18E740868((uint64_t)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v33 + v32);
    v34 = swift_allocObject();
    *(_QWORD *)(v34 + 16) = sub_18E74103C;
    *(_QWORD *)(v34 + 24) = v33;
    MEMORY[0x1E0C80A78](v34);
    *((_BYTE *)&v43 - 16) = 2;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112480);
    sub_18E741080();
    sub_18E768258();
    swift_release();
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112470);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v12, 0, 1, v35);
  }
  else
  {
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112470);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v12, 1, 1, v36);
  }
  v37 = v45;
  sub_18E5106A0((uint64_t)v18, v45, &qword_1EE112468);
  v38 = v46;
  sub_18E5106A0((uint64_t)v15, v46, &qword_1EE112468);
  v39 = v47;
  sub_18E5106A0((uint64_t)v12, v47, &qword_1EE112468);
  v40 = v48;
  sub_18E5106A0(v37, v48, &qword_1EE112468);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112478);
  sub_18E5106A0(v38, v40 + *(int *)(v41 + 48), &qword_1EE112468);
  sub_18E5106A0(v39, v40 + *(int *)(v41 + 64), &qword_1EE112468);
  sub_18E00FA98((uint64_t)v12, &qword_1EE112468);
  sub_18E00FA98((uint64_t)v15, &qword_1EE112468);
  sub_18E00FA98((uint64_t)v18, &qword_1EE112468);
  sub_18E00FA98(v39, &qword_1EE112468);
  sub_18E00FA98(v38, &qword_1EE112468);
  return sub_18E00FA98(v37, &qword_1EE112468);
}

uint64_t sub_18E73A160()
{
  type metadata accessor for ClarityUIEntryView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112258);
  return sub_18E768228();
}

uint64_t sub_18E73A1C8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(void);
  uint64_t v25;
  _QWORD *v26;
  int *v27;
  uint64_t v28;
  char *v29;
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
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  __int128 v49;
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
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;

  v113 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112498);
  MEMORY[0x1E0C80A78](v3);
  v101 = (uint64_t *)((char *)&v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1124A0);
  MEMORY[0x1E0C80A78](v94);
  v97 = (uint64_t)&v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1124A8);
  MEMORY[0x1E0C80A78](v6);
  v99 = (uint64_t *)((char *)&v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1124B0);
  MEMORY[0x1E0C80A78](v93);
  v98 = (uint64_t)&v91 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1124B8);
  MEMORY[0x1E0C80A78](v92);
  v102 = (uint64_t)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1124C0);
  MEMORY[0x1E0C80A78](v96);
  v100 = (uint64_t)&v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1124C8);
  v111 = *(_QWORD *)(v109 - 8);
  MEMORY[0x1E0C80A78](v109);
  v95 = (uint64_t)&v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1124D0);
  MEMORY[0x1E0C80A78](v12);
  v112 = (uint64_t)&v91 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v108 = (char *)&v91 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1124D8);
  MEMORY[0x1E0C80A78](v16);
  v18 = (uint64_t *)((char *)&v91 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1124E0);
  MEMORY[0x1E0C80A78](v107);
  v20 = (char *)&v91 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v106 = (uint64_t)&v91 - v22;
  v23 = sub_18E7671C0();
  v24 = MEMORY[0x1E0CDA088];
  MEMORY[0x1E0C80A78](v23);
  v26 = (uint64_t *)((char *)&v91 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  v27 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE1124E8);
  MEMORY[0x1E0C80A78](v27);
  v29 = (char *)&v91 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v30);
  v103 = (uint64_t)&v91 - v31;
  v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1124F0);
  MEMORY[0x1E0C80A78](v105);
  v110 = (uint64_t)&v91 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v33);
  v35 = (char *)&v91 - v34;
  MEMORY[0x1E0C80A78](v36);
  v104 = (char *)&v91 - v37;
  sub_18E767118();
  v39 = v38;
  v40 = (char *)v26 + *(int *)(v23 + 20);
  v41 = *MEMORY[0x1E0CDB0C0];
  v42 = sub_18E767574();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 104))(v40, v41, v42);
  *v26 = v39;
  v26[1] = v39;
  v43 = v27[14];
  *(_QWORD *)&v29[v43] = sub_18E76809C();
  *(_DWORD *)&v29[v27[15]] = 1056964608;
  *(_QWORD *)&v29[v27[16]] = 0x4010000000000000;
  *(_QWORD *)&v29[v27[17]] = 0x4000000000000000;
  sub_18E520220((uint64_t)v26, (uint64_t)v29, (uint64_t (*)(_QWORD))v24);
  *v18 = sub_18E7684D4();
  v18[1] = v44;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1124F8);
  v46 = (uint64_t)a1;
  sub_18E73AADC(a1, (char *)v18 + *(int *)(v45 + 44));
  type metadata accessor for ClarityUIEntryView(0);
  sub_18E7684D4();
  v47 = 1;
  sub_18E766D7C();
  sub_18E5106A0((uint64_t)v18, (uint64_t)v20, &qword_1EE1124D8);
  v48 = &v20[*(int *)(v107 + 36)];
  v49 = v115;
  *(_OWORD *)v48 = v114;
  *((_OWORD *)v48 + 1) = v49;
  *((_OWORD *)v48 + 2) = v116;
  v50 = (uint64_t)v18;
  v51 = (uint64_t)v108;
  sub_18E00FA98(v50, &qword_1EE1124D8);
  v52 = (uint64_t)v20;
  v53 = v106;
  sub_18E520BEC(v52, v106, &qword_1EE1124E0);
  sub_18E565AE0((uint64_t)v26, (uint64_t (*)(_QWORD))MEMORY[0x1E0CDA088]);
  v54 = v27[13];
  v55 = v109;
  sub_18E520BEC(v53, (uint64_t)&v29[v54], &qword_1EE1124E0);
  v56 = v103;
  sub_18E520BEC((uint64_t)v29, v103, &qword_1EE1124E8);
  LOBYTE(v26) = sub_18E767A78();
  sub_18E766C14();
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;
  sub_18E5106A0(v56, (uint64_t)v35, &qword_1EE1124E8);
  v65 = (uint64_t)v104;
  v66 = &v35[*(int *)(v105 + 36)];
  *v66 = (char)v26;
  *((_QWORD *)v66 + 1) = v58;
  *((_QWORD *)v66 + 2) = v60;
  *((_QWORD *)v66 + 3) = v62;
  *((_QWORD *)v66 + 4) = v64;
  v66[40] = 0;
  sub_18E00FA98(v56, &qword_1EE1124E8);
  sub_18E520BEC((uint64_t)v35, v65, &qword_1EE1124F0);
  if (objc_msgSend((id)objc_opt_self(), sel_isInHardwareKeyboardMode))
  {
    v67 = sub_18E7675B0();
    v68 = (uint64_t)v99;
    *v99 = v67;
    *(_QWORD *)(v68 + 8) = 0;
    *(_BYTE *)(v68 + 16) = 1;
    v69 = v68 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE112508) + 44);
    v70 = sub_18E7674B4();
    v71 = (uint64_t)v101;
    *v101 = v70;
    *(_QWORD *)(v71 + 8) = 0;
    *(_BYTE *)(v71 + 16) = 1;
    v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112510);
    sub_18E73AF9C(v46, (char *)(v71 + *(int *)(v72 + 44)));
    v73 = sub_18E767A78();
    v74 = v97;
    sub_18E5106A0(v71, v97, &qword_1EE112498);
    v75 = v74 + *(int *)(v94 + 36);
    *(_BYTE *)v75 = v73;
    *(_OWORD *)(v75 + 8) = 0u;
    *(_OWORD *)(v75 + 24) = 0u;
    *(_BYTE *)(v75 + 40) = 1;
    sub_18E00FA98(v71, &qword_1EE112498);
    sub_18E520BEC(v74, v69, &qword_1EE1124A0);
    v76 = sub_18E768060();
    v77 = sub_18E767A78();
    v78 = v98;
    sub_18E5106A0(v68, v98, &qword_1EE1124A8);
    v79 = v78 + *(int *)(v93 + 36);
    *(_QWORD *)v79 = v76;
    *(_BYTE *)(v79 + 8) = v77;
    sub_18E00FA98(v68, &qword_1EE1124A8);
    v80 = v102;
    sub_18E5106A0(v78, v102, &qword_1EE1124B0);
    *(_WORD *)(v80 + *(int *)(v92 + 36)) = 256;
    sub_18E00FA98(v78, &qword_1EE1124B0);
    v81 = sub_18E7670DC();
    v82 = sub_18E767A78();
    v83 = v100;
    sub_18E5106A0(v80, v100, &qword_1EE1124B8);
    v84 = v83 + *(int *)(v96 + 36);
    *(_QWORD *)v84 = v81;
    *(_BYTE *)(v84 + 8) = v82;
    sub_18E00FA98(v80, &qword_1EE1124B8);
    v85 = v95;
    sub_18E5106A0(v83, v95, &qword_1EE1124C0);
    *(_BYTE *)(v85 + *(int *)(v55 + 36)) = 0;
    sub_18E00FA98(v83, &qword_1EE1124C0);
    sub_18E520BEC(v85, v51, &qword_1EE1124C8);
    v47 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v111 + 56))(v51, v47, 1, v55);
  v86 = v110;
  sub_18E5106A0(v65, v110, &qword_1EE1124F0);
  v87 = v112;
  sub_18E5106A0(v51, v112, &qword_1EE1124D0);
  v88 = v113;
  sub_18E5106A0(v86, v113, &qword_1EE1124F0);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112500);
  sub_18E5106A0(v87, v88 + *(int *)(v89 + 48), &qword_1EE1124D0);
  sub_18E00FA98(v51, &qword_1EE1124D0);
  sub_18E00FA98(v65, &qword_1EE1124F0);
  sub_18E00FA98(v87, &qword_1EE1124D0);
  return sub_18E00FA98(v86, &qword_1EE1124F0);
}

uint64_t sub_18E73AADC@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
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
  char *v14;
  uint64_t v15;
  char *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char v26;
  unint64_t v27;
  char v28;
  uint64_t KeyPath;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v61 = a2;
  v47 = type metadata accessor for Placeholder(0);
  MEMORY[0x1E0C80A78](v47);
  v48 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112520);
  v5 = *(_QWORD *)(v4 - 8);
  v55 = v4;
  v56 = v5;
  MEMORY[0x1E0C80A78](v4);
  v46 = (uint64_t)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112528);
  MEMORY[0x1E0C80A78](v7);
  v60 = (uint64_t)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v53 = (uint64_t)&v44 - v10;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112530);
  v57 = *(_QWORD *)(v59 - 8);
  MEMORY[0x1E0C80A78](v59);
  v58 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v44 - v13;
  v52 = *a1;
  v51 = a1[1];
  v50 = a1[2];
  v49 = a1[3];
  v70 = v52;
  v71 = v51;
  v72 = v50;
  v73 = v49;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF58);
  sub_18E76836C();
  v69 = xmmword_18E7DEEF0;
  v45 = type metadata accessor for ClarityUIEntryView(0);
  v16 = (char *)a1 + *(int *)(v45 + 40);
  v17 = *v16;
  v18 = *((_QWORD *)v16 + 1);
  LOBYTE(v16) = v16[16];
  v62 = v17;
  v63 = v18;
  v64 = (char)v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112490);
  sub_18E766C2C();
  sub_18E741238();
  v54 = v14;
  sub_18E767F94();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v65 = v52;
  v66 = v51;
  v67 = v50;
  v68 = v49;
  MEMORY[0x193FF16A4](&v70, v15);
  v19 = v70;
  v20 = v71;
  swift_bridgeObjectRelease();
  v21 = HIBYTE(v20) & 0xF;
  if ((v20 & 0x2000000000000000) == 0)
    v21 = v19 & 0xFFFFFFFFFFFFLL;
  if (v21)
  {
    v22 = 1;
    v23 = v53;
    v24 = v55;
  }
  else
  {
    v25 = (char *)a1 + *(int *)(v45 + 32);
    v26 = *v25;
    v27 = *((_QWORD *)v25 + 1);
    LOBYTE(v65) = v26;
    v66 = v27;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE110990);
    sub_18E76821C();
    v28 = v70;
    KeyPath = swift_getKeyPath();
    v30 = v47;
    v31 = v48;
    *(_QWORD *)&v48[*(int *)(v47 + 24)] = KeyPath;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
    swift_storeEnumTagMultiPayload();
    *v31 = v28;
    v31[1] = 0;
    *(_QWORD *)&v31[*(int *)(v30 + 28)] = 0x402C000000000000;
    *(_QWORD *)&v31[*(int *)(v30 + 32)] = 0x4018000000000000;
    v32 = v46;
    sub_18E520220((uint64_t)v31, v46, type metadata accessor for Placeholder);
    v33 = v55;
    *(_BYTE *)(v32 + *(int *)(v55 + 36)) = 0;
    sub_18E565AE0((uint64_t)v31, type metadata accessor for Placeholder);
    v23 = v53;
    sub_18E520BEC(v32, v53, &qword_1EE112520);
    v22 = 0;
    v24 = v33;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 56))(v23, v22, 1, v24);
  v35 = v57;
  v34 = v58;
  v36 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
  v37 = v54;
  v38 = v59;
  v36(v58, v54, v59);
  v39 = v60;
  sub_18E5106A0(v23, v60, &qword_1EE112528);
  v40 = v61;
  v36(v61, v34, v38);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112540);
  sub_18E5106A0(v39, (uint64_t)&v40[*(int *)(v41 + 48)], &qword_1EE112528);
  sub_18E00FA98(v23, &qword_1EE112528);
  v42 = *(void (**)(char *, uint64_t))(v35 + 8);
  v42(v37, v38);
  sub_18E00FA98(v39, &qword_1EE112528);
  return ((uint64_t (*)(char *, uint64_t))v42)(v34, v38);
}

uint64_t sub_18E73AF9C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  _QWORD v43[3];
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v48 = a1;
  v52 = a2;
  v3 = type metadata accessor for ClarityUIEntryView(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10FE40);
  v49 = *(_QWORD *)(v53 - 8);
  MEMORY[0x1E0C80A78](v53);
  v8 = (char *)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10FE48);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v51 = (char *)v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v50 = (char *)v43 - v13;
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v43 - v15;
  MEMORY[0x1E0C80A78](v17);
  v54 = (char *)v43 - v18;
  v44 = v6;
  sub_18E520220(a1, (uint64_t)v6, type metadata accessor for ClarityUIEntryView);
  v19 = *(unsigned __int8 *)(v4 + 80);
  v46 = ((v19 + 16) & ~v19) + v5;
  v47 = (v19 + 16) & ~v19;
  v20 = v47;
  v45 = v19 | 7;
  v21 = swift_allocObject();
  sub_18E740868((uint64_t)v6, v21 + v20);
  v43[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10FE50);
  v22 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EE10B6B0);
  v23 = sub_18E767A30();
  v24 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CDD278];
  v25 = sub_18E514BB4(&qword_1EE10A480, (uint64_t *)&unk_1EE10B6B0, MEMORY[0x1E0CDF8C8]);
  v26 = sub_18E50F680(&qword_1EE10FE58, v24, MEMORY[0x1E0CDD268]);
  v55 = v22;
  v56 = v23;
  v57 = v25;
  v58 = v26;
  swift_getOpaqueTypeConformance2();
  sub_18E768258();
  v27 = sub_18E76809C();
  v55 = 0;
  v56 = v27;
  v43[1] = sub_18E514BB4(&qword_1EE10FE60, &qword_1EE10FE40, MEMORY[0x1E0CDFA58]);
  sub_18E6B1F4C();
  v28 = v53;
  sub_18E767D30();
  swift_release();
  v29 = *(void (**)(char *, uint64_t))(v49 + 8);
  v29(v8, v28);
  v30 = v10;
  v31 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v31(v54, v16, v9);
  v32 = (uint64_t)v44;
  sub_18E520220(v48, (uint64_t)v44, type metadata accessor for ClarityUIEntryView);
  v33 = swift_allocObject();
  sub_18E740868(v32, v33 + v47);
  sub_18E768258();
  v55 = sub_18E768078();
  v56 = 0;
  v34 = v50;
  v35 = v53;
  sub_18E767D30();
  swift_release();
  v29(v8, v35);
  v31(v16, v34, v9);
  v36 = *(void (**)(char *, char *, uint64_t))(v30 + 16);
  v37 = v54;
  v36(v34, v54, v9);
  v38 = v51;
  v36(v51, v16, v9);
  v39 = v52;
  v36(v52, v34, v9);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112518);
  v36(&v39[*(int *)(v40 + 48)], v38, v9);
  v41 = *(void (**)(char *, uint64_t))(v30 + 8);
  v41(v16, v9);
  v41(v37, v9);
  v41(v38, v9);
  return ((uint64_t (*)(char *, uint64_t))v41)(v34, v9);
}

uint64_t sub_18E73B3EC()
{
  return sub_18E73B4D8();
}

uint64_t sub_18E73B400()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_1EE1074F0 != -1)
    swift_once();
  objc_msgSend(v0, sel_postNotificationName_object_, qword_1EE12E040, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF58);
  return sub_18E768354();
}

uint64_t sub_18E73B4C4()
{
  return sub_18E73B4D8();
}

uint64_t sub_18E73B4D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v0 = sub_18E767A30();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE10B6B0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E768198();
  sub_18E767A24();
  sub_18E514BB4(&qword_1EE10A480, (uint64_t *)&unk_1EE10B6B0, MEMORY[0x1E0CDF8C8]);
  sub_18E50F680(&qword_1EE10FE58, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDD278], MEMORY[0x1E0CDD268]);
  sub_18E767D0C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_18E73B650@<X0>(uint64_t a1@<X8>)
{
  return sub_18E73CCFC(a1);
}

uint64_t sub_18E73B65C()
{
  type metadata accessor for ClarityUIEntryView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112490);
  sub_18E766C20();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE110990);
  return sub_18E768228();
}

uint64_t sub_18E73B710()
{
  sub_18E768534();
  sub_18E766EC0();
  return swift_release();
}

uint64_t sub_18E73B76C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ClarityUIEntryView(0);
  (*(void (**)(void))(a1 + *(int *)(v2 + 28)))();
  sub_18E768534();
  sub_18E766EC0();
  return swift_release();
}

uint64_t sub_18E73B7E4()
{
  type metadata accessor for ClarityUIEntryView(0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE110990);
  return sub_18E768228();
}

uint64_t sub_18E73B84C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(void);
  uint64_t v21;
  _QWORD *v22;
  int *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  char *v42;
  __int128 v43;
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
  _OWORD *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char *v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;

  v80 = a1;
  v94 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112558);
  MEMORY[0x1E0C80A78](v2);
  v83 = (uint64_t *)((char *)&v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112560);
  MEMORY[0x1E0C80A78](v87);
  v85 = (uint64_t)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112568);
  MEMORY[0x1E0C80A78](v86);
  v84 = (uint64_t)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112570);
  MEMORY[0x1E0C80A78](v88);
  v82 = (char *)&v78 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112578);
  MEMORY[0x1E0C80A78](v90);
  v93 = (uint64_t)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v91 = (uint64_t)&v78 - v9;
  MEMORY[0x1E0C80A78](v10);
  v92 = (uint64_t)&v78 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112580);
  MEMORY[0x1E0C80A78](v12);
  v14 = (uint64_t *)((char *)&v78 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v89 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE112588);
  MEMORY[0x1E0C80A78](v89);
  v16 = (char *)&v78 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v81 = (uint64_t)&v78 - v18;
  v19 = sub_18E7671C0();
  v20 = MEMORY[0x1E0CDA088];
  MEMORY[0x1E0C80A78](v19);
  v22 = (char **)((char *)&v78 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v23 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE112590);
  MEMORY[0x1E0C80A78](v23);
  v25 = (char *)&v78 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v26);
  v28 = (char *)&v78 - v27;
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112598);
  MEMORY[0x1E0C80A78](v79);
  v78 = (char *)&v78 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v30);
  v32 = (char *)&v78 - v31;
  sub_18E767118();
  v34 = v33;
  v35 = (char *)v22 + *(int *)(v19 + 20);
  v36 = *MEMORY[0x1E0CDB0C0];
  v37 = sub_18E767574();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 104))(v35, v36, v37);
  *v22 = v34;
  v22[1] = v34;
  v38 = v23[14];
  *(_QWORD *)&v25[v38] = sub_18E76809C();
  *(_DWORD *)&v25[v23[15]] = 1056964608;
  *(_QWORD *)&v25[v23[16]] = 0x4010000000000000;
  *(_QWORD *)&v25[v23[17]] = 0x4000000000000000;
  sub_18E520220((uint64_t)v22, (uint64_t)v25, (uint64_t (*)(_QWORD))v20);
  *v14 = sub_18E7684D4();
  v14[1] = v39;
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1125A0);
  v41 = v80;
  sub_18E73C100(v80, (uint64_t)v14 + *(int *)(v40 + 44));
  type metadata accessor for ClarityUIEntryView(0);
  sub_18E7684D4();
  sub_18E766D7C();
  sub_18E5106A0((uint64_t)v14, (uint64_t)v16, &qword_1EE112580);
  v42 = &v16[*((int *)v89 + 9)];
  v43 = v96;
  *(_OWORD *)v42 = v95;
  *((_OWORD *)v42 + 1) = v43;
  *((_OWORD *)v42 + 2) = v97;
  sub_18E00FA98((uint64_t)v14, &qword_1EE112580);
  v44 = (uint64_t)v16;
  v45 = (uint64_t)v82;
  v46 = v81;
  sub_18E520BEC(v44, v81, &qword_1EE112588);
  sub_18E565AE0((uint64_t)v22, (uint64_t (*)(_QWORD))MEMORY[0x1E0CDA088]);
  sub_18E520BEC(v46, (uint64_t)&v25[v23[13]], &qword_1EE112588);
  v47 = (uint64_t)v25;
  v48 = (uint64_t)v78;
  sub_18E520BEC(v47, (uint64_t)v28, &qword_1EE112590);
  LOBYTE(v22) = sub_18E767A78();
  sub_18E766C14();
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  sub_18E5106A0((uint64_t)v28, v48, &qword_1EE112590);
  v57 = v48 + *(int *)(v79 + 36);
  *(_BYTE *)v57 = (_BYTE)v22;
  *(_QWORD *)(v57 + 8) = v50;
  *(_QWORD *)(v57 + 16) = v52;
  *(_QWORD *)(v57 + 24) = v54;
  *(_QWORD *)(v57 + 32) = v56;
  *(_BYTE *)(v57 + 40) = 0;
  sub_18E00FA98((uint64_t)v28, &qword_1EE112590);
  v89 = v32;
  sub_18E520BEC(v48, (uint64_t)v32, &qword_1EE112598);
  v58 = sub_18E7675B0();
  v59 = (uint64_t)v83;
  *v83 = v58;
  *(_QWORD *)(v59 + 8) = 0;
  *(_BYTE *)(v59 + 16) = 1;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1125A8);
  sub_18E73C43C((uint64_t)v41, v59 + *(int *)(v60 + 44));
  v61 = sub_18E768060();
  LOBYTE(v23) = sub_18E767A78();
  v62 = v85;
  sub_18E5106A0(v59, v85, &qword_1EE112558);
  v63 = v62 + *(int *)(v87 + 36);
  *(_QWORD *)v63 = v61;
  *(_BYTE *)(v63 + 8) = (_BYTE)v23;
  sub_18E00FA98(v59, &qword_1EE112558);
  v64 = v84;
  sub_18E5106A0(v62, v84, &qword_1EE112560);
  *(_WORD *)(v64 + *(int *)(v86 + 36)) = 256;
  sub_18E00FA98(v62, &qword_1EE112560);
  v65 = sub_18E7670DC();
  LOBYTE(v23) = sub_18E767A78();
  sub_18E5106A0(v64, v45, &qword_1EE112568);
  v66 = v45 + *(int *)(v88 + 36);
  *(_QWORD *)v66 = v65;
  *(_BYTE *)(v66 + 8) = (_BYTE)v23;
  sub_18E00FA98(v64, &qword_1EE112568);
  sub_18E766E18();
  sub_18E7684D4();
  sub_18E7671F0();
  v67 = v91;
  sub_18E5106A0(v45, v91, &qword_1EE112570);
  v68 = (_OWORD *)(v67 + *(int *)(v90 + 36));
  v69 = v103;
  v68[4] = v102;
  v68[5] = v69;
  v68[6] = v104;
  v70 = v99;
  *v68 = v98;
  v68[1] = v70;
  v71 = v101;
  v68[2] = v100;
  v68[3] = v71;
  sub_18E00FA98(v45, &qword_1EE112570);
  v72 = v92;
  sub_18E520BEC(v67, v92, &qword_1EE112578);
  v73 = (uint64_t)v89;
  sub_18E5106A0((uint64_t)v89, v48, &qword_1EE112598);
  v74 = v93;
  sub_18E5106A0(v72, v93, &qword_1EE112578);
  v75 = v94;
  sub_18E5106A0(v48, v94, &qword_1EE112598);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1125B0);
  sub_18E5106A0(v74, v75 + *(int *)(v76 + 48), &qword_1EE112578);
  sub_18E00FA98(v72, &qword_1EE112578);
  sub_18E00FA98(v73, &qword_1EE112598);
  sub_18E00FA98(v74, &qword_1EE112578);
  return sub_18E00FA98(v48, &qword_1EE112598);
}

uint64_t sub_18E73C100@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
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
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char v22;
  unint64_t v23;
  char v24;
  uint64_t KeyPath;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v36 = type metadata accessor for Placeholder(0);
  MEMORY[0x1E0C80A78](v36);
  v37 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112520);
  v40 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v35 = (uint64_t)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112528);
  MEMORY[0x1E0C80A78](v7);
  v43 = (uint64_t)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v34 - v10;
  v13 = a1[1];
  v15 = a1[2];
  v14 = a1[3];
  v44 = *a1;
  v12 = v44;
  v45 = v13;
  v46 = v15;
  v47 = v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF58);
  sub_18E76836C();
  v41 = v49;
  v42 = v48;
  v38 = v50;
  v39 = v51;
  v48 = v12;
  v49 = v13;
  v50 = v15;
  v51 = v14;
  MEMORY[0x193FF16A4](&v44, v16);
  v18 = v44;
  v17 = v45;
  swift_bridgeObjectRelease();
  v19 = HIBYTE(v17) & 0xF;
  if ((v17 & 0x2000000000000000) == 0)
    v19 = v18 & 0xFFFFFFFFFFFFLL;
  v20 = 1;
  if (!v19)
  {
    v21 = (char *)a1 + *(int *)(type metadata accessor for ClarityUIEntryView(0) + 32);
    v22 = *v21;
    v23 = *((_QWORD *)v21 + 1);
    LOBYTE(v48) = v22;
    v49 = v23;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE110990);
    sub_18E76821C();
    v24 = v44;
    KeyPath = swift_getKeyPath();
    v27 = v36;
    v26 = v37;
    *(_QWORD *)&v37[*(int *)(v36 + 24)] = KeyPath;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
    swift_storeEnumTagMultiPayload();
    *v26 = v24;
    v26[1] = 1;
    *(_QWORD *)&v26[*(int *)(v27 + 28)] = 0x402C000000000000;
    *(_QWORD *)&v26[*(int *)(v27 + 32)] = 0x4018000000000000;
    v28 = v35;
    sub_18E520220((uint64_t)v26, v35, type metadata accessor for Placeholder);
    *(_BYTE *)(v28 + *(int *)(v5 + 36)) = 0;
    sub_18E565AE0((uint64_t)v26, type metadata accessor for Placeholder);
    sub_18E520BEC(v28, (uint64_t)v11, &qword_1EE112520);
    v20 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v40 + 56))(v11, v20, 1, v5);
  v29 = v43;
  sub_18E5106A0((uint64_t)v11, v43, &qword_1EE112528);
  v30 = v41;
  *(_QWORD *)a2 = v42;
  *(_QWORD *)(a2 + 8) = v30;
  v31 = v39;
  *(_QWORD *)(a2 + 16) = v38;
  *(_QWORD *)(a2 + 24) = v31;
  *(_OWORD *)(a2 + 32) = xmmword_18E7DEEF0;
  *(_BYTE *)(a2 + 48) = 0;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112640);
  sub_18E5106A0(v29, a2 + *(int *)(v32 + 48), &qword_1EE112528);
  swift_retain();
  swift_retain();
  sub_18E7669BC();
  sub_18E00FA98((uint64_t)v11, &qword_1EE112528);
  sub_18E00FA98(v29, &qword_1EE112528);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_18E73C43C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  char v18;
  char *v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v30 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1125B8);
  v29 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v28 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v27 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112498);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1124A0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v27 - v15;
  *(_QWORD *)v10 = sub_18E7674B4();
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112510);
  sub_18E73C6D4(a1, &v10[*(int *)(v17 + 44)]);
  v18 = sub_18E767A78();
  sub_18E5106A0((uint64_t)v10, (uint64_t)v13, &qword_1EE112498);
  v19 = &v13[*(int *)(v11 + 36)];
  *v19 = v18;
  *(_OWORD *)(v19 + 8) = 0u;
  *(_OWORD *)(v19 + 24) = 0u;
  v19[40] = 1;
  sub_18E00FA98((uint64_t)v10, &qword_1EE112498);
  sub_18E520BEC((uint64_t)v13, (uint64_t)v16, &qword_1EE1124A0);
  v31 = a1;
  sub_18E767A60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1125C0);
  sub_18E7412D0();
  sub_18E766C50();
  sub_18E5106A0((uint64_t)v16, (uint64_t)v13, &qword_1EE1124A0);
  v20 = v28;
  v21 = v29;
  v22 = *(void (**)(char *, char *, uint64_t))(v29 + 16);
  v22(v28, v7, v3);
  v23 = v30;
  sub_18E5106A0((uint64_t)v13, v30, &qword_1EE1124A0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1125E0);
  v22((char *)(v23 + *(int *)(v24 + 48)), v20, v3);
  v25 = *(void (**)(char *, uint64_t))(v21 + 8);
  v25(v7, v3);
  sub_18E00FA98((uint64_t)v16, &qword_1EE1124A0);
  v25(v20, v3);
  return sub_18E00FA98((uint64_t)v13, &qword_1EE1124A0);
}

uint64_t sub_18E73C6D4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  _QWORD v43[3];
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v48 = a1;
  v52 = a2;
  v3 = type metadata accessor for ClarityUIEntryView(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10FE40);
  v49 = *(_QWORD *)(v53 - 8);
  MEMORY[0x1E0C80A78](v53);
  v8 = (char *)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10FE48);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v51 = (char *)v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v50 = (char *)v43 - v13;
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v43 - v15;
  MEMORY[0x1E0C80A78](v17);
  v54 = (char *)v43 - v18;
  v44 = v6;
  sub_18E520220(a1, (uint64_t)v6, type metadata accessor for ClarityUIEntryView);
  v19 = *(unsigned __int8 *)(v4 + 80);
  v46 = ((v19 + 16) & ~v19) + v5;
  v47 = (v19 + 16) & ~v19;
  v20 = v47;
  v45 = v19 | 7;
  v21 = swift_allocObject();
  sub_18E740868((uint64_t)v6, v21 + v20);
  v43[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10FE50);
  v22 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EE10B6B0);
  v23 = sub_18E767A30();
  v24 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CDD278];
  v25 = sub_18E514BB4(&qword_1EE10A480, (uint64_t *)&unk_1EE10B6B0, MEMORY[0x1E0CDF8C8]);
  v26 = sub_18E50F680(&qword_1EE10FE58, v24, MEMORY[0x1E0CDD268]);
  v55 = v22;
  v56 = v23;
  v57 = v25;
  v58 = v26;
  swift_getOpaqueTypeConformance2();
  sub_18E768258();
  v27 = sub_18E76809C();
  v55 = 0;
  v56 = v27;
  v43[1] = sub_18E514BB4(&qword_1EE10FE60, &qword_1EE10FE40, MEMORY[0x1E0CDFA58]);
  sub_18E6B1F4C();
  v28 = v53;
  sub_18E767D30();
  swift_release();
  v29 = *(void (**)(char *, uint64_t))(v49 + 8);
  v29(v8, v28);
  v30 = v10;
  v31 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v31(v54, v16, v9);
  v32 = (uint64_t)v44;
  sub_18E520220(v48, (uint64_t)v44, type metadata accessor for ClarityUIEntryView);
  v33 = swift_allocObject();
  sub_18E740868(v32, v33 + v47);
  sub_18E768258();
  v55 = sub_18E768078();
  v56 = 0;
  v34 = v50;
  v35 = v53;
  sub_18E767D30();
  swift_release();
  v29(v8, v35);
  v31(v16, v34, v9);
  v36 = *(void (**)(char *, char *, uint64_t))(v30 + 16);
  v37 = v54;
  v36(v34, v54, v9);
  v38 = v51;
  v36(v51, v16, v9);
  v39 = v52;
  v36(v52, v34, v9);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112518);
  v36(&v39[*(int *)(v40 + 48)], v38, v9);
  v41 = *(void (**)(char *, uint64_t))(v30 + 8);
  v41(v16, v9);
  v41(v37, v9);
  v41(v38, v9);
  return ((uint64_t (*)(char *, uint64_t))v41)(v34, v9);
}

uint64_t sub_18E73CB24()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF58);
  sub_18E768354();
  sub_18E768534();
  sub_18E766EC0();
  return swift_release();
}

uint64_t sub_18E73CBB8()
{
  return sub_18E73B4D8();
}

uint64_t sub_18E73CBCC()
{
  id v0;
  uint64_t v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_1EE1074F0 != -1)
    swift_once();
  objc_msgSend(v0, sel_postNotificationName_object_, qword_1EE12E040, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF58);
  v1 = sub_18E768354();
  MEMORY[0x1E0C80A78](v1);
  sub_18E768534();
  sub_18E766EC0();
  return swift_release();
}

uint64_t sub_18E73CCE8()
{
  return sub_18E73B4D8();
}

uint64_t sub_18E73CCFC@<X0>(uint64_t a1@<X8>)
{
  id v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  sub_18E767544();
  v2 = CKFrameworkBundle();
  result = sub_18E767C88();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_18E73CDA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_18E768138();
  *a1 = result;
  return result;
}

uint64_t sub_18E73CDDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  double v8;
  double v9;
  char v10;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;

  v23 = a2;
  v3 = sub_18E767778();
  MEMORY[0x1E0C80A78](v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1125D8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ClarityUIEntryView(0);
  sub_18E766E18();
  sub_18E73CFE0(v8, v9);
  v24 = a1;
  sub_18E7675B0();
  v25 = 0;
  sub_18E50F680(&qword_1EE10D700, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDBDB8], MEMORY[0x1E0CDBDD8]);
  sub_18E7694F4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1125E8);
  sub_18E514BB4(&qword_1EE1125F0, &qword_1EE1125E8, MEMORY[0x1E0CE0680]);
  sub_18E768570();
  v10 = sub_18E767A84();
  sub_18E766C14();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = v23;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 16))(v23, v7, v4);
  v20 = v19 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE1125C0) + 36);
  *(_BYTE *)v20 = v10;
  *(_QWORD *)(v20 + 8) = v12;
  *(_QWORD *)(v20 + 16) = v14;
  *(_QWORD *)(v20 + 24) = v16;
  *(_QWORD *)(v20 + 32) = v18;
  *(_BYTE *)(v20 + 40) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_18E73CFE0(double a1, double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v5 = sub_18E76845C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (uint64_t *)((char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = sub_18E768468();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E7670F4();
  v12 = *(unsigned __int8 *)(v2 + *(int *)(type metadata accessor for ClarityUIEntryView(0) + 52));
  if (a2 >= a1)
    v13 = 4;
  else
    v13 = 6;
  sub_18E767124();
  *v8 = 0;
  v8[1] = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0CE0110], v5);
  if (v12)
    v15 = v13;
  else
    v15 = 3;
  sub_18E768474();
  return sub_18E624EB8((uint64_t)v11, v15);
}

uint64_t sub_18E73D128@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  void (*v21)(char *, char *, uint64_t);
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  void (*v32)(char *, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  ValueMetadata *v41;
  unint64_t v42;
  uint64_t v43;

  v39 = a2;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1125F8);
  v38 = *(_QWORD *)(v36 - 8);
  MEMORY[0x1E0C80A78](v36);
  v37 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v34 = (char *)&v34 - v5;
  v6 = type metadata accessor for ClarityUIEntryView(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112600);
  v40 = *(_QWORD *)(v35 - 8);
  MEMORY[0x1E0C80A78](v35);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v34 - v13;
  sub_18E520220(a1, (uint64_t)v9, type metadata accessor for ClarityUIEntryView);
  v15 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v16 = swift_allocObject();
  sub_18E740868((uint64_t)v9, v16 + v15);
  sub_18E74136C();
  sub_18E767D84();
  swift_release();
  sub_18E7413B0();
  v43 = v17;
  sub_18E520220(a1, (uint64_t)v9, type metadata accessor for ClarityUIEntryView);
  v18 = swift_allocObject();
  sub_18E740868((uint64_t)v9, v18 + v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112610);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112618);
  sub_18E514BB4(&qword_1EE112620, &qword_1EE112610, MEMORY[0x1E0DEAF48]);
  v19 = sub_18E741698();
  v41 = &type metadata for EmojiButton;
  v42 = v19;
  swift_getOpaqueTypeConformance2();
  sub_18E7416DC();
  v20 = v34;
  sub_18E7683A8();
  v21 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  v22 = v14;
  v23 = v14;
  v24 = v35;
  v21(v11, v23, v35);
  v25 = v37;
  v26 = v38;
  v27 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
  v28 = v36;
  v27(v37, v20, v36);
  v29 = v39;
  v21(v39, v11, v24);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112638);
  v27(&v29[*(int *)(v30 + 48)], v25, v28);
  v31 = *(void (**)(char *, uint64_t))(v26 + 8);
  v31(v20, v28);
  v32 = *(void (**)(char *, uint64_t))(v40 + 8);
  v32(v22, v24);
  v31(v25, v28);
  return ((uint64_t (*)(char *, uint64_t))v32)(v11, v24);
}

uint64_t sub_18E73D474()
{
  uint64_t v1;

  swift_retain();
  swift_retain();
  sub_18E7669BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF58);
  MEMORY[0x193FF16A4](&v1);
  sub_18E7360E0();
  swift_bridgeObjectRelease();
  sub_18E768354();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

void sub_18E73D530(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t (*v8)(_QWORD);
  unint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = type metadata accessor for ClarityUIEntryView(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  v13 = *a1;
  v7 = v13;
  sub_18E520220(a2, (uint64_t)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v10 = swift_allocObject();
  sub_18E740868((uint64_t)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  *(_QWORD *)(v10 + ((v6 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = v7;
  sub_18E741698();
  v11 = v7;
  sub_18E767D84();
  swift_release();

}

id sub_18E73D64C(int a1, id a2)
{
  id result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a2, sel_string);
  if (result)
  {
    v3 = result;
    sub_18E768984();

    swift_retain();
    swift_retain();
    sub_18E7669BC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF58);
    MEMORY[0x193FF16A4](&v4);
    sub_18E768A14();
    swift_bridgeObjectRelease();
    sub_18E768354();
    swift_bridgeObjectRelease();
    swift_release();
    return (id)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_18E73D758@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112770);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v14 - v8;
  *(_QWORD *)v9 = sub_18E7674B4();
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112778);
  sub_18E73D874(a1, &v9[*(int *)(v10 + 44)]);
  sub_18E5106A0((uint64_t)v9, (uint64_t)v6, &qword_1EE112770);
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112780);
  sub_18E5106A0((uint64_t)v6, a2 + *(int *)(v11 + 48), &qword_1EE112770);
  v12 = a2 + *(int *)(v11 + 64);
  *(_QWORD *)v12 = 0;
  *(_BYTE *)(v12 + 8) = 1;
  sub_18E00FA98((uint64_t)v9, &qword_1EE112770);
  return sub_18E00FA98((uint64_t)v6, &qword_1EE112770);
}

uint64_t sub_18E73D874@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t);
  void *v23;
  char **v24;
  uint64_t v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
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
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  char *v57;
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
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;

  v68 = a2;
  v3 = sub_18E766C80();
  v59 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v57 - v7;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112788);
  v61 = *(_QWORD *)(v64 - 8);
  MEMORY[0x1E0C80A78](v64);
  v57 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112790);
  MEMORY[0x1E0C80A78](v60);
  v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112798);
  MEMORY[0x1E0C80A78](v63);
  v58 = (uint64_t)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1127A0);
  MEMORY[0x1E0C80A78](v66);
  v67 = (uint64_t)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v62 = (uint64_t)&v57 - v15;
  MEMORY[0x1E0C80A78](v16);
  v65 = (uint64_t)&v57 - v17;
  v70 = a1;
  v69 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10FEB8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1127A8);
  v18 = MEMORY[0x1E0CDB8A0];
  sub_18E743148(&qword_1EE10FEB0, &qword_1EE10FEB8, MEMORY[0x1E0CDDD58], MEMORY[0x1E0CDB8A0]);
  sub_18E743148(&qword_1EE1127B0, &qword_1EE1127A8, MEMORY[0x1E0CDF820], v18);
  v19 = v57;
  sub_18E768198();
  type metadata accessor for Placeholder(0);
  sub_18E5A4138((uint64_t)v8);
  v20 = v59;
  (*(void (**)(char *, _QWORD, uint64_t))(v59 + 104))(v5, *MEMORY[0x1E0CD86D0], v3);
  v21 = sub_18E766C74();
  v22 = *(void (**)(char *, uint64_t))(v20 + 8);
  v22(v5, v3);
  v22(v8, v3);
  v23 = (void *)objc_opt_self();
  v24 = &selRef_systemLightGrayColor;
  if ((v21 & 1) == 0)
    v24 = &selRef_systemDarkGrayColor;
  v25 = MEMORY[0x193FF1398](objc_msgSend(v23, *v24));
  KeyPath = swift_getKeyPath();
  v27 = v61;
  v28 = v64;
  (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v11, v19, v64);
  v29 = (uint64_t *)&v11[*(int *)(v60 + 36)];
  *v29 = KeyPath;
  v29[1] = v25;
  (*(void (**)(char *, uint64_t))(v27 + 8))(v19, v28);
  LOBYTE(v25) = sub_18E767A6C();
  sub_18E766C14();
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v38 = v58;
  sub_18E5106A0((uint64_t)v11, v58, &qword_1EE112790);
  v39 = v38 + *(int *)(v63 + 36);
  *(_BYTE *)v39 = v25;
  *(_QWORD *)(v39 + 8) = v31;
  *(_QWORD *)(v39 + 16) = v33;
  *(_QWORD *)(v39 + 24) = v35;
  *(_QWORD *)(v39 + 32) = v37;
  *(_BYTE *)(v39 + 40) = 0;
  sub_18E00FA98((uint64_t)v11, &qword_1EE112790);
  LOBYTE(v25) = sub_18E767AC0();
  sub_18E766C14();
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v48 = v62;
  sub_18E5106A0(v38, v62, &qword_1EE112798);
  v49 = v48 + *(int *)(v66 + 36);
  *(_BYTE *)v49 = v25;
  *(_QWORD *)(v49 + 8) = v41;
  *(_QWORD *)(v49 + 16) = v43;
  *(_QWORD *)(v49 + 24) = v45;
  *(_QWORD *)(v49 + 32) = v47;
  *(_BYTE *)(v49 + 40) = 0;
  sub_18E00FA98(v38, &qword_1EE112798);
  v50 = v65;
  sub_18E520BEC(v48, v65, &qword_1EE1127A0);
  v51 = v67;
  sub_18E5106A0(v50, v67, &qword_1EE1127A0);
  v52 = v68;
  *v68 = 0;
  *((_BYTE *)v52 + 8) = 1;
  v53 = v52;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1127B8);
  sub_18E5106A0(v51, (uint64_t)v53 + *(int *)(v54 + 48), &qword_1EE1127A0);
  v55 = (uint64_t)v53 + *(int *)(v54 + 64);
  *(_QWORD *)v55 = 0;
  *(_BYTE *)(v55 + 8) = 1;
  sub_18E00FA98(v50, &qword_1EE1127A0);
  return sub_18E00FA98(v51, &qword_1EE1127A0);
}

double sub_18E73DD6C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  double result;
  __int128 v5;
  __int128 v6;
  char v7;

  if (*(_BYTE *)(a1 + 1) == 1)
  {
    sub_18E767544();
  }
  else
  {
    sub_18E767544();
    v3 = CKFrameworkBundle();
  }
  sub_18E767C88();
  sub_18E767688();
  result = *(double *)&v5;
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  *(_BYTE *)(a2 + 32) = v7;
  return result;
}

double sub_18E73DEB8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  __int128 v5;
  char v6;

  if (*(_BYTE *)(a1 + 1) == 1)
  {
    sub_18E768138();
    sub_18E767CA0();
  }
  else
  {
    sub_18E768138();
  }
  sub_18E767688();
  result = *(double *)&v4;
  *(_OWORD *)a2 = v4;
  *(_OWORD *)(a2 + 16) = v5;
  *(_BYTE *)(a2 + 32) = v6;
  return result;
}

uint64_t sub_18E73DF84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = sub_18E7675B0();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112768);
  return sub_18E73D758(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_18E73DFCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  char *v23;
  __int128 v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  v44 = a1;
  v1 = sub_18E768048();
  v42 = *(_QWORD *)(v1 - 8);
  v43 = v1;
  MEMORY[0x1E0C80A78](v1);
  v41 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE112BD0);
  MEMORY[0x1E0C80A78](v35);
  v4 = (uint64_t *)((char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = sub_18E768174();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10F4C8);
  MEMORY[0x1E0C80A78](v34);
  v10 = (uint64_t *)((char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112740);
  MEMORY[0x1E0C80A78](v36);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112748);
  MEMORY[0x1E0C80A78](v38);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112750);
  MEMORY[0x1E0C80A78](v40);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112758);
  MEMORY[0x1E0C80A78](v39);
  v37 = (uint64_t)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_18E768138();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0CDF7C0], v5);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)v4 + *(int *)(v35 + 28), v8, v5);
  *v4 = KeyPath;
  sub_18E5106A0((uint64_t)v4, (uint64_t)v10 + *(int *)(v34 + 36), (uint64_t *)&unk_1EE112BD0);
  *v10 = v18;
  swift_retain();
  sub_18E00FA98((uint64_t)v4, (uint64_t *)&unk_1EE112BD0);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_release();
  v20 = sub_18E7680C0();
  v21 = swift_getKeyPath();
  sub_18E5106A0((uint64_t)v10, (uint64_t)v12, &qword_1EE10F4C8);
  v22 = (uint64_t *)&v12[*(int *)(v36 + 36)];
  *v22 = v21;
  v22[1] = v20;
  sub_18E00FA98((uint64_t)v10, &qword_1EE10F4C8);
  sub_18E767124();
  sub_18E767124();
  sub_18E7684D4();
  sub_18E766D7C();
  sub_18E5106A0((uint64_t)v12, (uint64_t)v14, &qword_1EE112740);
  v23 = &v14[*(int *)(v38 + 36)];
  v24 = v46;
  *(_OWORD *)v23 = v45;
  *((_OWORD *)v23 + 1) = v24;
  *((_OWORD *)v23 + 2) = v47;
  sub_18E00FA98((uint64_t)v12, &qword_1EE112740);
  v25 = sub_18E76806C();
  LOBYTE(v21) = sub_18E767A78();
  sub_18E5106A0((uint64_t)v14, (uint64_t)v16, &qword_1EE112748);
  v26 = &v16[*(int *)(v40 + 36)];
  *(_QWORD *)v26 = v25;
  v26[8] = v21;
  sub_18E00FA98((uint64_t)v14, &qword_1EE112748);
  v27 = v37;
  sub_18E5106A0((uint64_t)v16, v37, &qword_1EE112750);
  *(_WORD *)(v27 + *(int *)(v39 + 36)) = 256;
  sub_18E00FA98((uint64_t)v16, &qword_1EE112750);
  sub_18E76710C();
  v29 = v28;
  (*(void (**)(char *, _QWORD, uint64_t))(v42 + 104))(v41, *MEMORY[0x1E0CDF3D8], v43);
  v30 = sub_18E768108();
  v31 = v44;
  sub_18E5106A0(v27, v44, &qword_1EE112758);
  v32 = (uint64_t *)(v31 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE112760) + 36));
  *v32 = v30;
  v32[1] = v29;
  v32[2] = 0;
  v32[3] = 0;
  return sub_18E00FA98(v27, &qword_1EE112758);
}

id sub_18E73E488@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  _BYTE *v8;
  id result;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  _BYTE v34[12];
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  int v42;
  char v43;
  _BYTE v44[7];
  char v45;
  _BYTE v46[7];
  char v47;
  _BYTE v48[7];
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;

  v41 = sub_18E768048();
  v39 = *(_QWORD *)(v41 - 8);
  MEMORY[0x1E0C80A78](v41);
  v40 = &v34[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE108BE0);
  *(_QWORD *)&v6 = MEMORY[0x1E0C80A78](v5).n128_u64[0];
  v8 = &v34[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  result = objc_msgSend(a1, sel_string, v6);
  if (result)
  {
    v10 = result;
    v11 = sub_18E768984();
    v13 = v12;

    v50 = v11;
    v51 = v13;
    sub_18E5201D4();
    v14 = sub_18E767C94();
    v16 = v15;
    v18 = v17 & 1;
    v19 = sub_18E767AFC();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v8, 1, 1, v19);
    sub_18E767B38();
    sub_18E00FA98((uint64_t)v8, &qword_1EE108BE0);
    v20 = sub_18E767C7C();
    v36 = v21;
    v37 = v20;
    v35 = v22;
    v38 = v23;
    swift_release();
    sub_18E52836C(v14, v16, v18);
    swift_bridgeObjectRelease();
    sub_18E767124();
    sub_18E767124();
    sub_18E7684D4();
    sub_18E766D7C();
    v24 = v50;
    LOBYTE(v16) = v51;
    v25 = v52;
    v26 = v53;
    v28 = v54;
    v27 = v55;
    v29 = sub_18E768054();
    LOBYTE(v10) = sub_18E767A78();
    sub_18E76710C();
    v31 = v30;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v39 + 104))(v40, *MEMORY[0x1E0CDF3D8], v41);
    result = (id)sub_18E768108();
    v32 = v35 & 1;
    v49 = v35 & 1;
    v47 = v16;
    v45 = v26;
    v33 = v36;
    *(_QWORD *)a2 = v37;
    *(_QWORD *)(a2 + 8) = v33;
    *(_BYTE *)(a2 + 16) = v32;
    *(_DWORD *)(a2 + 17) = *(_DWORD *)v48;
    *(_DWORD *)(a2 + 20) = *(_DWORD *)&v48[3];
    *(_QWORD *)(a2 + 24) = v38;
    *(_QWORD *)(a2 + 32) = v24;
    *(_BYTE *)(a2 + 40) = v16;
    *(_DWORD *)(a2 + 41) = *(_DWORD *)v46;
    *(_DWORD *)(a2 + 44) = *(_DWORD *)&v46[3];
    *(_QWORD *)(a2 + 48) = v25;
    *(_BYTE *)(a2 + 56) = v26;
    *(_DWORD *)(a2 + 57) = *(_DWORD *)v44;
    *(_DWORD *)(a2 + 60) = *(_DWORD *)&v44[3];
    *(_QWORD *)(a2 + 64) = v28;
    *(_QWORD *)(a2 + 72) = v27;
    *(_QWORD *)(a2 + 80) = v29;
    *(_BYTE *)(a2 + 88) = (_BYTE)v10;
    *(_WORD *)(a2 + 89) = 256;
    *(_DWORD *)(a2 + 91) = v42;
    *(_BYTE *)(a2 + 95) = v43;
    *(_QWORD *)(a2 + 96) = result;
    *(_QWORD *)(a2 + 104) = v31;
    *(_QWORD *)(a2 + 112) = 0;
    *(_QWORD *)(a2 + 120) = 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_18E73E778@<X0>(uint64_t a1@<X8>)
{
  void **v1;

  return sub_18E73E488(*v1, a1);
}

uint64_t sub_18E73E780@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v27 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE10A470);
  v30 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1126E8);
  v28 = *(_QWORD *)(v6 - 8);
  v29 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v27 - v10;
  v12 = sub_18E7671C0();
  MEMORY[0x1E0C80A78](v12);
  v14 = (uint64_t *)((char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_18E767118();
  v16 = v15;
  v17 = (char *)v14 + *(int *)(v12 + 20);
  v18 = *MEMORY[0x1E0CDB0C0];
  v19 = sub_18E767574();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v17, v18, v19);
  *v14 = v16;
  v14[1] = v16;
  v20 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE1126F0);
  v21 = v20[14];
  *(_QWORD *)(a2 + v21) = sub_18E76809C();
  *(_DWORD *)(a2 + v20[15]) = 1056964608;
  *(_QWORD *)(a2 + v20[16]) = 0x4010000000000000;
  *(_QWORD *)(a2 + v20[17]) = 0x4000000000000000;
  sub_18E520220((uint64_t)v14, a2, (uint64_t (*)(_QWORD))MEMORY[0x1E0CDA088]);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE10B6B0);
  sub_18E514BB4(&qword_1EE10A480, (uint64_t *)&unk_1EE10B6B0, MEMORY[0x1E0CDF8C8]);
  sub_18E768258();
  v22 = sub_18E768054();
  sub_18E7680E4();
  v23 = sub_18E7680D8();
  swift_release();
  v31 = v22;
  v32 = v23;
  sub_18E514BB4(&qword_1EE10E0C8, (uint64_t *)&unk_1EE10A470, MEMORY[0x1E0CDFA58]);
  sub_18E742B7C();
  sub_18E767D30();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v3);
  v24 = v29;
  v25 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
  v25(v11, v8, v29);
  sub_18E565AE0((uint64_t)v14, (uint64_t (*)(_QWORD))MEMORY[0x1E0CDA088]);
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v25)(a2 + v20[13], v11, v24);
}

uint64_t sub_18E73EA60()
{
  return sub_18E768198();
}

uint64_t sub_18E73EA9C@<X0>(uint64_t a1@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;

  sub_18E767544();
  v2 = CKFrameworkBundle();
  v3 = sub_18E767C88();
  v5 = v4;
  v7 = v6 & 1;
  sub_18E767AD8();
  v8 = sub_18E767C7C();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  swift_release();
  sub_18E52836C(v3, v5, v7);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v8;
  *(_QWORD *)(a1 + 8) = v10;
  *(_BYTE *)(a1 + 16) = v12 & 1;
  *(_QWORD *)(a1 + 24) = v14;
  return result;
}

uint64_t sub_18E73EBC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_18E768138();
  *a1 = result;
  return result;
}

uint64_t sub_18E73EC04@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_18E73E780(*v1, a1);
}

uint64_t sub_18E73EC0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t OpaqueTypeConformance2;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __n128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  _QWORD v38[2];
  char *v39;
  uint64_t v40;
  uint64_t v41;
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
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  uint64_t v64;
  uint64_t v65;

  v53 = a2;
  v3 = *(_QWORD *)(a1 + 16);
  v50 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](a1);
  v48 = (char *)v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(v5 + 24);
  v49 = *(_QWORD *)(v5 + 40);
  v44 = *(_QWORD *)(v49 + 8);
  v7 = sub_18E766CEC();
  v8 = MEMORY[0x193FF4E54](MEMORY[0x1E0CD8A50], v7);
  v64 = v7;
  v65 = v8;
  MEMORY[0x193FF4E0C](255, &v64, MEMORY[0x1E0CDE1B0], 0);
  v9 = sub_18E7670B8();
  v64 = v7;
  v65 = v8;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v11 = sub_18E594334();
  v63[0] = OpaqueTypeConformance2;
  v63[1] = v11;
  v40 = v9;
  v41 = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v9, v63);
  v43 = sub_18E7671FC();
  v12 = sub_18E7670B8();
  v46 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)v38 - v13;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE10FCC8);
  v15 = sub_18E7670B8();
  v51 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v39 = (char *)v38 - v16;
  v38[1] = v6;
  v47 = sub_18E766CE0();
  v17 = sub_18E7670B8();
  v52 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v42 = (char *)v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x1E0C80A78](v19);
  v45 = (uint64_t)v38 - v21;
  v22 = v54;
  v23 = v50;
  v24 = v48;
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v50 + 16))(v48, v54 + *(int *)(a1 + 52), v3, v20);
  v55 = v3;
  v56 = v6;
  v25 = *(_QWORD *)(a1 + 32);
  v57 = v25;
  v58 = v49;
  v59 = v22;
  sub_18E7684D4();
  sub_18E767FA0();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v3);
  v64 = sub_18E768054();
  sub_18E767A78();
  v26 = MEMORY[0x193FF4E54](MEMORY[0x1E0CDA280], v43);
  v62[0] = v25;
  v62[1] = v26;
  v27 = MEMORY[0x1E0CD9C20];
  v28 = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v12, v62);
  v29 = v39;
  sub_18E767CE8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v14, v12);
  v30 = sub_18E514BB4(&qword_1EE10FCC0, &qword_1EE10FCC8, MEMORY[0x1E0CDC6D0]);
  v61[0] = v28;
  v61[1] = v30;
  v31 = MEMORY[0x193FF4E54](v27, v15, v61);
  v32 = (uint64_t)v42;
  sub_18E768018();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v29, v15);
  v33 = MEMORY[0x193FF4E54](MEMORY[0x1E0CD89F0], v47);
  v60[0] = v31;
  v60[1] = v33;
  MEMORY[0x193FF4E54](v27, v17, v60);
  v34 = v45;
  v35 = v32;
  sub_18E5CA524(v32, v17, v45);
  v36 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
  v36(v35, v17);
  sub_18E5C6A40(v34, v17, v53);
  return ((uint64_t (*)(uint64_t, uint64_t))v36)(v34, v17);
}

void sub_18E73F0B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_18E766CEC();
  v8 = MEMORY[0x1E0C80A78](v7);
  v14 = v7;
  v15 = MEMORY[0x193FF4E54](MEMORY[0x1E0CD8A50], v7, v8);
  v9 = MEMORY[0x193FF4E0C](0, &v14, MEMORY[0x1E0CDE1B0], 0);
  MEMORY[0x1E0C80A78](v9);
  v10 = sub_18E7670B8();
  MEMORY[0x1E0C80A78](v10);
  MEMORY[0x1E0C80A78](v11);
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  type metadata accessor for InnerShadowedContent();
}

uint64_t sub_18E73F218(uint64_t a1)
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
  float v11;
  uint64_t v12;
  uint64_t OpaqueTypeConformance2;
  unint64_t v14;
  void (*v15)(uint64_t, uint64_t);

  sub_18E7681BC();
  v11 = *(float *)(v2 + *(int *)(a1 + 60));
  *(_DWORD *)(v9 - 168) = 1065353216;
  *(_QWORD *)(v9 - 156) = 0;
  *(_QWORD *)(v9 - 164) = 0;
  *(_QWORD *)(v9 - 148) = 0x3F80000000000000;
  *(_QWORD *)(v9 - 132) = 0;
  *(_QWORD *)(v9 - 140) = 0;
  *(_QWORD *)(v9 - 124) = 0x3F80000000000000;
  *(_QWORD *)(v9 - 116) = 0;
  *(_QWORD *)(v9 - 108) = 0;
  *(_DWORD *)(v9 - 100) = 0;
  *(float *)(v9 - 96) = -v11;
  *(float *)(v9 - 92) = v11;
  v12 = *(_QWORD *)(v9 - 240);
  sub_18E767D6C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 224) + 8))(v8, v4);
  *(_QWORD *)(v9 - 184) = v4;
  *(_QWORD *)(v9 - 176) = v12;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_18E767E14();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 232) + 8))(v1, v6);
  v14 = sub_18E594334();
  *(_QWORD *)(v9 - 200) = OpaqueTypeConformance2;
  *(_QWORD *)(v9 - 192) = v14;
  MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v3, v9 - 200);
  sub_18E5CA524(v7, v3, v5);
  v15 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 216) + 8);
  v15(v7, v3);
  sub_18E5C6A40(v5, v3, *(_QWORD *)(v9 - 208));
  return ((uint64_t (*)(uint64_t, uint64_t))v15)(v5, v3);
}

uint64_t sub_18E73F388(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v3 = sub_18E767484();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_18E76785C();
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = *v1;
  (*(void (**)(char *, uint64_t, __n128))(v11 + 16))((char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v13[1] = v10;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0CDABD0], v3);
  swift_retain();
  swift_retain();
  return sub_18E7677C0();
}

uint64_t sub_18E73F4A8@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  char v18;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t KeyPath;
  uint64_t *v41;
  char *v42;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _OWORD v50[4];
  __int128 v51;
  __int128 v52;

  v49 = a1;
  v2 = sub_18E766C68();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112700);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112708);
  MEMORY[0x1E0C80A78](v44);
  v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112710);
  MEMORY[0x1E0C80A78](v48);
  v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112718);
  v46 = *(_QWORD *)(v13 - 8);
  v47 = v13;
  MEMORY[0x1E0C80A78](v13);
  v45 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v1[1];
  v51 = *v1;
  v52 = v15;
  v16 = v1[1];
  v50[0] = *v1;
  v50[1] = v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF58);
  sub_18E76836C();
  sub_18E766C5C();
  v18 = sub_18E767A6C();
  sub_18E766C14();
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v8, v5, v2);
  v27 = &v8[*(int *)(v6 + 36)];
  *v27 = v18;
  *((_QWORD *)v27 + 1) = v20;
  *((_QWORD *)v27 + 2) = v22;
  *((_QWORD *)v27 + 3) = v24;
  *((_QWORD *)v27 + 4) = v26;
  v27[40] = 0;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  LOBYTE(v2) = sub_18E767AC0();
  sub_18E766C14();
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  sub_18E5106A0((uint64_t)v8, (uint64_t)v10, &qword_1EE112700);
  v36 = &v10[*(int *)(v44 + 36)];
  *v36 = v2;
  *((_QWORD *)v36 + 1) = v29;
  *((_QWORD *)v36 + 2) = v31;
  *((_QWORD *)v36 + 3) = v33;
  *((_QWORD *)v36 + 4) = v35;
  v36[40] = 0;
  sub_18E00FA98((uint64_t)v8, &qword_1EE112700);
  v50[2] = v51;
  v50[3] = v52;
  MEMORY[0x193FF16A4](v50, v17);
  v37 = (void *)sub_18E768954();
  LODWORD(v6) = objc_msgSend(v37, sel___ck_shouldUseBigEmoji);

  if ((_DWORD)v6)
    v38 = sub_18E767AF0();
  else
    v38 = sub_18E767AD8();
  v39 = v38;
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  sub_18E5106A0((uint64_t)v10, (uint64_t)v12, &qword_1EE112708);
  v41 = (uint64_t *)&v12[*(int *)(v48 + 36)];
  *v41 = KeyPath;
  v41[1] = v39;
  sub_18E00FA98((uint64_t)v10, &qword_1EE112708);
  sub_18E742BC8();
  v42 = v45;
  sub_18E767F1C();
  sub_18E00FA98((uint64_t)v12, &qword_1EE112710);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v46 + 32))(v49, v42, v47);
}

uint64_t storeEnumTagSinglePayload for ClarityUIEntryView.EntryState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_18E73F864 + 4 * byte_18E7DEF05[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_18E73F898 + 4 * byte_18E7DEF00[v4]))();
}

uint64_t sub_18E73F898(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18E73F8A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18E73F8A8);
  return result;
}

uint64_t sub_18E73F8B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18E73F8BCLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_18E73F8C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18E73F8C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ClarityUIEntryView.EntryState()
{
  return &type metadata for ClarityUIEntryView.EntryState;
}

_QWORD *sub_18E73F8E4(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v3;
  uint64_t v4;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (_QWORD *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    v7 = a1;
    v8 = a2[2];
    a1[1] = a2[1];
    a1[2] = v8;
    a1[3] = a2[3];
    v9 = a3[5];
    v10 = (_QWORD *)((char *)a1 + v9);
    v11 = (char *)a2 + v9;
    v12 = *(_QWORD *)((char *)a2 + v9 + 8);
    *v10 = *(_QWORD *)((char *)a2 + v9);
    v10[1] = v12;
    swift_retain();
    swift_retain();
    sub_18E7669BC();
    swift_retain();
    swift_retain();
    v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF20) + 32);
    v14 = (char *)v10 + v13;
    v15 = &v11[v13];
    v16 = sub_18E7661A0();
    v17 = *(_QWORD *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0FBD30);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    v19 = a3[6];
    v20 = (char *)v7 + v19;
    v21 = (char *)a2 + v19;
    v22 = sub_18E766E3C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
    v23 = a3[7];
    v24 = a3[8];
    v25 = (_QWORD *)((char *)v7 + v23);
    v26 = (_QWORD *)((char *)a2 + v23);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    v28 = (char *)v7 + v24;
    v29 = (char *)a2 + v24;
    *v28 = *v29;
    *((_QWORD *)v28 + 1) = *((_QWORD *)v29 + 1);
    v30 = a3[9];
    v31 = a3[10];
    v32 = (char *)v7 + v30;
    v33 = (char *)a2 + v30;
    *v32 = *v33;
    *((_QWORD *)v32 + 1) = *((_QWORD *)v33 + 1);
    v34 = (char *)v7 + v31;
    v35 = (char *)a2 + v31;
    *v34 = *v35;
    *((_QWORD *)v34 + 1) = *((_QWORD *)v35 + 1);
    v34[16] = v35[16];
    v36 = a3[11];
    v37 = a3[12];
    v38 = (_QWORD *)((char *)v7 + v36);
    v39 = (_QWORD *)((char *)a2 + v36);
    v40 = v39[1];
    *v38 = *v39;
    v38[1] = v40;
    v41 = (char *)v7 + v37;
    v42 = (char *)a2 + v37;
    *v41 = *v42;
    *((_QWORD *)v41 + 1) = *((_QWORD *)v42 + 1);
    v43 = a3[14];
    *((_BYTE *)v7 + a3[13]) = *((_BYTE *)a2 + a3[13]);
    *(_QWORD *)((char *)v7 + v43) = *(_QWORD *)((char *)a2 + v43);
    v44 = a3[16];
    *(_QWORD *)((char *)v7 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
    *(_QWORD *)((char *)v7 + v44) = *(_QWORD *)((char *)a2 + v44);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t sub_18E73FB44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  swift_release();
  swift_release();
  v5 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF20) + 32);
  v6 = sub_18E7661A0();
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v8 = a1 + *(int *)(a2 + 24);
  v9 = sub_18E766E3C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *sub_18E73FC70(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a3[5];
  v9 = (_QWORD *)((char *)a1 + v8);
  v10 = (char *)a2 + v8;
  v11 = *(_QWORD *)((char *)a2 + v8 + 8);
  *v9 = *(_QWORD *)((char *)a2 + v8);
  v9[1] = v11;
  swift_retain();
  swift_retain();
  sub_18E7669BC();
  swift_retain();
  swift_retain();
  v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF20) + 32);
  v13 = (char *)v9 + v12;
  v14 = &v10[v12];
  v15 = sub_18E7661A0();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0FBD30);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  v18 = a3[6];
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = sub_18E766E3C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
  v22 = a3[7];
  v23 = a3[8];
  v24 = (_QWORD *)((char *)a1 + v22);
  v25 = (_QWORD *)((char *)a2 + v22);
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  v27 = (char *)a1 + v23;
  v28 = (char *)a2 + v23;
  *v27 = *v28;
  *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
  v29 = a3[9];
  v30 = a3[10];
  v31 = (char *)a1 + v29;
  v32 = (char *)a2 + v29;
  *v31 = *v32;
  *((_QWORD *)v31 + 1) = *((_QWORD *)v32 + 1);
  v33 = (char *)a1 + v30;
  v34 = (char *)a2 + v30;
  *v33 = *v34;
  *((_QWORD *)v33 + 1) = *((_QWORD *)v34 + 1);
  v33[16] = v34[16];
  v35 = a3[11];
  v36 = a3[12];
  v37 = (_QWORD *)((char *)a1 + v35);
  v38 = (_QWORD *)((char *)a2 + v35);
  v39 = v38[1];
  *v37 = *v38;
  v37[1] = v39;
  v40 = (char *)a1 + v36;
  v41 = (char *)a2 + v36;
  *v40 = *v41;
  *((_QWORD *)v40 + 1) = *((_QWORD *)v41 + 1);
  v42 = a3[14];
  *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
  *(_QWORD *)((char *)a1 + v42) = *(_QWORD *)((char *)a2 + v42);
  v43 = a3[16];
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  *(_QWORD *)((char *)a1 + v43) = *(_QWORD *)((char *)a2 + v43);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_18E73FEA4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  char *v39;
  char *v40;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_QWORD *)((char *)a1 + v6) = *(_QWORD *)((char *)a2 + v6);
  swift_retain();
  swift_release();
  *((_QWORD *)v7 + 1) = *((_QWORD *)v8 + 1);
  swift_retain();
  swift_release();
  v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF20) + 32);
  v10 = &v7[v9];
  v11 = &v8[v9];
  v12 = sub_18E7661A0();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0FBD30);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  v18 = a3[6];
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = sub_18E766E3C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 24))(v19, v20, v21);
  v22 = a3[7];
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  swift_retain();
  swift_release();
  v26 = a3[8];
  v27 = (char *)a1 + v26;
  v28 = (char *)a2 + v26;
  *v27 = *v28;
  *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
  swift_retain();
  swift_release();
  v29 = a3[9];
  v30 = (char *)a1 + v29;
  v31 = (char *)a2 + v29;
  *v30 = *v31;
  *((_QWORD *)v30 + 1) = *((_QWORD *)v31 + 1);
  swift_retain();
  swift_release();
  v32 = a3[10];
  v33 = (char *)a1 + v32;
  v34 = (char *)a2 + v32;
  *v33 = *((_BYTE *)a2 + v32);
  *((_QWORD *)v33 + 1) = *(_QWORD *)((char *)a2 + v32 + 8);
  swift_retain();
  swift_release();
  v33[16] = v34[16];
  v35 = a3[11];
  v36 = (_QWORD *)((char *)a1 + v35);
  v37 = (_QWORD *)((char *)a2 + v35);
  *v36 = *v37;
  v36[1] = v37[1];
  swift_retain();
  swift_release();
  v38 = a3[12];
  v39 = (char *)a1 + v38;
  v40 = (char *)a2 + v38;
  *v39 = *v40;
  *((_QWORD *)v39 + 1) = *((_QWORD *)v40 + 1);
  swift_retain();
  swift_release();
  *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
  *(_QWORD *)((char *)a1 + a3[14]) = *(_QWORD *)((char *)a2 + a3[14]);
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  *(_QWORD *)((char *)a1 + a3[16]) = *(_QWORD *)((char *)a2 + a3[16]);
  return a1;
}

_OWORD *sub_18E7401B0(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (char *)a2 + v7;
  v10 = *(_QWORD *)((char *)a2 + v7 + 8);
  *v8 = *(_QWORD *)((char *)a2 + v7);
  v8[1] = v10;
  v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF20) + 32);
  v12 = (char *)v8 + v11;
  v13 = &v9[v11];
  v14 = sub_18E7661A0();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0FBD30);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  v17 = a3[6];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = sub_18E766E3C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
  v21 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v21) = *(_OWORD *)((char *)a2 + v21);
  v22 = a3[10];
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  v23[16] = v24[16];
  *(_OWORD *)v23 = *(_OWORD *)v24;
  v25 = a3[12];
  *(_OWORD *)((char *)a1 + a3[11]) = *(_OWORD *)((char *)a2 + a3[11]);
  *(_OWORD *)((char *)a1 + v25) = *(_OWORD *)((char *)a2 + v25);
  v26 = a3[14];
  *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
  *(_QWORD *)((char *)a1 + v26) = *(_QWORD *)((char *)a2 + v26);
  v27 = a3[16];
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  *(_QWORD *)((char *)a1 + v27) = *(_QWORD *)((char *)a2 + v27);
  return a1;
}

_QWORD *sub_18E74033C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  *(_QWORD *)((char *)a1 + v7) = *(_QWORD *)((char *)a2 + v7);
  swift_release();
  *((_QWORD *)v8 + 1) = *((_QWORD *)v9 + 1);
  swift_release();
  v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF20) + 32);
  v11 = &v8[v10];
  v12 = &v9[v10];
  v13 = sub_18E7661A0();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0FBD30);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  v19 = a3[6];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = sub_18E766E3C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v20, v21, v22);
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  swift_release();
  v23 = a3[8];
  v24 = (char *)a1 + v23;
  v25 = (char *)a2 + v23;
  *v24 = *v25;
  *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
  swift_release();
  v26 = a3[9];
  v27 = (char *)a1 + v26;
  v28 = (char *)a2 + v26;
  *v27 = *v28;
  *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
  swift_release();
  v29 = a3[10];
  v30 = (char *)a1 + v29;
  v31 = (char *)a2 + v29;
  *v30 = *((_BYTE *)a2 + v29);
  *((_QWORD *)v30 + 1) = *(_QWORD *)((char *)a2 + v29 + 8);
  swift_release();
  v30[16] = v31[16];
  v32 = a3[11];
  v33 = (_QWORD *)((char *)a1 + v32);
  v34 = (_QWORD *)((char *)a2 + v32);
  *v33 = *v34;
  v33[1] = v34[1];
  swift_release();
  v35 = a3[12];
  v36 = (char *)a1 + v35;
  v37 = (char *)a2 + v35;
  *v36 = *v37;
  *((_QWORD *)v36 + 1) = *((_QWORD *)v37 + 1);
  swift_release();
  v38 = a3[14];
  *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
  *(_QWORD *)((char *)a1 + v38) = *(_QWORD *)((char *)a2 + v38);
  v39 = a3[16];
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  *(_QWORD *)((char *)a1 + v39) = *(_QWORD *)((char *)a2 + v39);
  return a1;
}

uint64_t sub_18E7405DC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18E7405E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF20);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = sub_18E766E3C();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_18E74068C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_18E740698(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF20);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = sub_18E766E3C();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_18E740738()
{
  unint64_t v0;
  unint64_t v1;

  sub_18E6B1BE8();
  if (v0 <= 0x3F)
  {
    sub_18E766E3C();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_18E74080C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_18E740820()
{
  unint64_t result;

  result = qword_1EE112210;
  if (!qword_1EE112210)
  {
    result = MEMORY[0x193FF4E54](&unk_18E7DF038, &type metadata for ClarityUIEntryView.EntryState);
    atomic_store(result, (unint64_t *)&qword_1EE112210);
  }
  return result;
}

uint64_t sub_18E740868(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ClarityUIEntryView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18E7408AC(uint64_t a1)
{
  return sub_18E740A38(a1, (uint64_t (*)(uint64_t, uint64_t))sub_18E738694);
}

uint64_t objectdestroyTm_16()
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

  v1 = type metadata accessor for ClarityUIEntryView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 20);
  swift_release();
  swift_release();
  v5 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF20) + 32);
  v6 = sub_18E7661A0();
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v8 = v3 + *(int *)(v1 + 24);
  v9 = sub_18E766E3C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18E740A2C(uint64_t a1)
{
  return sub_18E740A38(a1, sub_18E7389EC);
}

uint64_t sub_18E740A38(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ClarityUIEntryView(0) - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

uint64_t sub_18E740A84()
{
  return sub_18E5216E0(&qword_1EE1122D8, &qword_1EE1122C0, sub_18E740AA8, (uint64_t (*)(void))sub_18E740B34);
}

uint64_t sub_18E740AA8()
{
  return sub_18E5659F4(&qword_1EE1122E0, &qword_1EE1122E8, sub_18E740ACC, MEMORY[0x1E0CD9758]);
}

uint64_t sub_18E740ACC()
{
  return sub_18E5659F4(&qword_1EE1122F0, &qword_1EE1122F8, (uint64_t (*)(void))sub_18E740AF0, MEMORY[0x1E0CD8D70]);
}

unint64_t sub_18E740AF0()
{
  unint64_t result;

  result = qword_1EE112300;
  if (!qword_1EE112300)
  {
    result = MEMORY[0x193FF4E54](&unk_18E7DF31C, &type metadata for NewMessageButton);
    atomic_store(result, (unint64_t *)&qword_1EE112300);
  }
  return result;
}

unint64_t sub_18E740B34()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112308;
  if (!qword_1EE112308)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE1122A0);
    v2[0] = sub_18E514BB4(&qword_1EE112310, &qword_1EE112298, MEMORY[0x1E0CDFCC0]);
    v2[1] = sub_18E514BB4(&qword_1EE10AC40, &qword_1EE10AC48, MEMORY[0x1E0CDBEF0]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112308);
  }
  return result;
}

uint64_t sub_18E740BD0()
{
  return sub_18E5216E0(&qword_1EE112318, &qword_1EE112278, sub_18E740BF4, sub_18E740C9C);
}

uint64_t sub_18E740BF4()
{
  return sub_18E5659F4(&qword_1EE112320, &qword_1EE112290, (uint64_t (*)(void))sub_18E740C18, MEMORY[0x1E0CDC8B0]);
}

unint64_t sub_18E740C18()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112328;
  if (!qword_1EE112328)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112288);
    v2[0] = sub_18E514BB4(&qword_1EE112330, &qword_1EE112280, MEMORY[0x1E0CDFCC0]);
    v2[1] = MEMORY[0x1E0CDC8B0];
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112328);
  }
  return result;
}

uint64_t sub_18E740C9C()
{
  return sub_18E5659F4(&qword_1EE112338, &qword_1EE112268, sub_18E740CC0, MEMORY[0x1E0CDC8B0]);
}

uint64_t sub_18E740CC0()
{
  return sub_18E5659F4(&qword_1EE112340, &qword_1EE112348, (uint64_t (*)(void))sub_18E740CE4, MEMORY[0x1E0CDC8B0]);
}

unint64_t sub_18E740CE4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112350;
  if (!qword_1EE112350)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112358);
    v2[0] = sub_18E740D68();
    v2[1] = sub_18E514BB4(&qword_1EE10AC40, &qword_1EE10AC48, MEMORY[0x1E0CDBEF0]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112350);
  }
  return result;
}

unint64_t sub_18E740D68()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112360;
  if (!qword_1EE112360)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112368);
    v2[0] = sub_18E50F680(&qword_1EE112370, (uint64_t (*)(uint64_t))type metadata accessor for ClarityCameraView, (uint64_t)&unk_18E7DB410);
    v2[1] = sub_18E514BB4(&qword_1EE112378, &qword_1EE112380, MEMORY[0x1E0CDCAD0]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112360);
  }
  return result;
}

uint64_t sub_18E740E04()
{
  return sub_18E5659F4(&qword_1EE112390, &qword_1EE112398, (uint64_t (*)(void))sub_18E740E28, MEMORY[0x1E0CDC8B0]);
}

unint64_t sub_18E740E28()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE1123A0;
  if (!qword_1EE1123A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE1123A8);
    v2[0] = sub_18E740EAC();
    v2[1] = sub_18E514BB4(&qword_1EE10AC40, &qword_1EE10AC48, MEMORY[0x1E0CDBEF0]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE1123A0);
  }
  return result;
}

unint64_t sub_18E740EAC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE1123B0;
  if (!qword_1EE1123B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE1123B8);
    v2[0] = sub_18E514BB4(&qword_1EE1123C0, &qword_1EE1123C8, MEMORY[0x1E0CDFCC0]);
    v2[1] = sub_18E514BB4(&qword_1EE112378, &qword_1EE112380, MEMORY[0x1E0CDCAD0]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE1123B0);
  }
  return result;
}

uint64_t sub_18E740F4C()
{
  return sub_18E740F88(1, (uint64_t (*)(uint64_t, uint64_t))sub_18E73B65C);
}

uint64_t sub_18E740F60()
{
  return sub_18E740F88(0, (uint64_t (*)(uint64_t, uint64_t))sub_18E73B65C);
}

uint64_t sub_18E740F74()
{
  return sub_18E740F88((uint64_t)sub_18E740FD4, (uint64_t (*)(uint64_t, uint64_t))sub_18E73B710);
}

uint64_t sub_18E740F88(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ClarityUIEntryView(0) - 8) + 80);
  return a2(v2 + ((v5 + 16) & ~v5), a1);
}

uint64_t sub_18E740FD4()
{
  return sub_18E737C78();
}

uint64_t sub_18E740FF0()
{
  return sub_18E740F88((uint64_t)sub_18E7433E0, (uint64_t (*)(uint64_t, uint64_t))sub_18E73B710);
}

uint64_t sub_18E741004(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_18E741030@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_18E739B30(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_18E74103C()
{
  return sub_18E740F88(4, (uint64_t (*)(uint64_t, uint64_t))sub_18E73A160);
}

uint64_t sub_18E74104C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18E741070()
{
  return sub_18E7365FC();
}

uint64_t sub_18E741078@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_18E736658(*(_BYTE *)(v1 + 16), a1);
}

unint64_t sub_18E741080()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112488;
  if (!qword_1EE112488)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112480);
    v2[0] = sub_18E514BB4(&qword_1EE10A480, (uint64_t *)&unk_1EE10B6B0, MEMORY[0x1E0CDF8C8]);
    v2[1] = sub_18E514BB4(&qword_1EE108928, (uint64_t *)&unk_1EE108930, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112488);
  }
  return result;
}

uint64_t sub_18E741120()
{
  return sub_18E740F88(3, (uint64_t (*)(uint64_t, uint64_t))sub_18E73A160);
}

uint64_t sub_18E741134()
{
  return sub_18E740F88(2, (uint64_t (*)(uint64_t, uint64_t))sub_18E73A160);
}

uint64_t sub_18E741144@<X0>(uint64_t a1@<X8>)
{
  return sub_18E73680C(a1);
}

uint64_t sub_18E74114C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_18E768138();
  *a1 = result;
  return result;
}

uint64_t sub_18E7411D4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_18E741200()
{
  return sub_18E740F88((uint64_t)sub_18E7433E0, (uint64_t (*)(uint64_t, uint64_t))sub_18E73CB24);
}

uint64_t sub_18E741218()
{
  return sub_18E7418F8((uint64_t (*)(uint64_t))sub_18E73B400);
}

uint64_t type metadata accessor for Placeholder(uint64_t a1)
{
  return sub_18E520164(a1, qword_1EE112648);
}

unint64_t sub_18E741238()
{
  unint64_t result;

  result = qword_1EE112538;
  if (!qword_1EE112538)
  {
    result = MEMORY[0x193FF4E54](&unk_18E7DF2CC, &type metadata for MessageTextEditor);
    atomic_store(result, (unint64_t *)&qword_1EE112538);
  }
  return result;
}

uint64_t sub_18E74128C()
{
  return sub_18E7418F8(sub_18E73B76C);
}

uint64_t sub_18E74129C()
{
  return sub_18E740F88(1, (uint64_t (*)(uint64_t, uint64_t))sub_18E73B7E4);
}

uint64_t sub_18E7412B0()
{
  return sub_18E740F88(0, (uint64_t (*)(uint64_t, uint64_t))sub_18E73B7E4);
}

uint64_t sub_18E7412C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_18E73CDDC(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_18E7412D0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE1125C8;
  if (!qword_1EE1125C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE1125C0);
    v2[0] = sub_18E514BB4(&qword_1EE1125D0, &qword_1EE1125D8, MEMORY[0x1E0CE04E8]);
    v2[1] = MEMORY[0x1E0CD9758];
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE1125C8);
  }
  return result;
}

uint64_t sub_18E741354@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_18E73D128(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_18E741360()
{
  return sub_18E7418F8((uint64_t (*)(uint64_t))sub_18E73D474);
}

unint64_t sub_18E74136C()
{
  unint64_t result;

  result = qword_1EE112608;
  if (!qword_1EE112608)
  {
    result = MEMORY[0x193FF4E54](&unk_18E7DF27C, &type metadata for DeleteButton);
    atomic_store(result, (unint64_t *)&qword_1EE112608);
  }
  return result;
}

void sub_18E7413B0()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_categoryIdentifierList);
  v2 = MEMORY[0x1E0DEE9D8];
  if (!v1)
    return;
  v3 = v1;
  v4 = sub_18E768AE0();

  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v6 = 0;
  v17 = v4;
  v16 = *(_QWORD *)(v4 + 16);
  while (v6 < *(_QWORD *)(v4 + 16))
  {
    sub_18E7669BC();
    v8 = (void *)sub_18E768954();
    swift_bridgeObjectRelease();
    v9 = objc_msgSend(v0, sel_categoryWithIdentifier_, v8);

    if (v9)
    {
      v10 = objc_msgSend(v9, sel_emojiTokensForLocaleData_, 0);
      if (!v10)
        goto LABEL_25;
      v11 = v10;
      sub_18E00F31C(0, &qword_1EE110468);
      v12 = sub_18E768AE0();

      if (v12 >> 62)
      {
        sub_18E7669BC();
        v13 = sub_18E769338();
        swift_bridgeObjectRelease();
        if (!v13)
        {
LABEL_19:
          swift_bridgeObjectRelease();
          v7 = v2;
          goto LABEL_5;
        }
      }
      else
      {
        v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (!v13)
          goto LABEL_19;
      }
      sub_18E76929C();
      if (v13 < 0)
        goto LABEL_24;
      v14 = 0;
      do
      {
        if ((v12 & 0xC000000000000001) != 0)
          MEMORY[0x193FF25B0](v14, v12);
        else
          v15 = *(id *)(v12 + 8 * v14 + 32);
        ++v14;
        sub_18E769284();
        sub_18E7692A8();
        sub_18E7692B4();
        sub_18E769290();
      }
      while (v13 != v14);
      v7 = v2;
      swift_bridgeObjectRelease();
      v2 = MEMORY[0x1E0DEE9D8];
      v5 = v16;
      v4 = v17;
    }
    else
    {
      v7 = v2;
    }
LABEL_5:
    ++v6;
    sub_18E543A48(v7);

    if (v6 == v5)
    {
      swift_bridgeObjectRelease();
      return;
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
}

void sub_18E74164C(id *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ClarityUIEntryView(0) - 8) + 80);
  sub_18E73D530(a1, v1 + ((v3 + 16) & ~v3));
}

unint64_t sub_18E741698()
{
  unint64_t result;

  result = qword_1EE112628;
  if (!qword_1EE112628)
  {
    result = MEMORY[0x193FF4E54](&unk_18E7DF22C, &type metadata for EmojiButton);
    atomic_store(result, (unint64_t *)&qword_1EE112628);
  }
  return result;
}

unint64_t sub_18E7416DC()
{
  unint64_t result;

  result = qword_1EE112630;
  if (!qword_1EE112630)
  {
    result = MEMORY[0x193FF4E54](&unk_18E7DF1F4, &type metadata for Emoji);
    atomic_store(result, (unint64_t *)&qword_1EE112630);
  }
  return result;
}

uint64_t sub_18E741720()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v1 = type metadata accessor for ClarityUIEntryView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v5 = v0 + v3 + *(int *)(v1 + 20);
  swift_release();
  swift_release();
  v6 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE10EF20) + 32);
  v7 = sub_18E7661A0();
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
    (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v6, v7);
  v9 = v0 + v3 + *(int *)(v1 + 24);
  v10 = sub_18E766E3C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

id sub_18E7418A4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for ClarityUIEntryView(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_18E73D64C((int)v0 + (int)v2, *(id *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_18E7418EC()
{
  return sub_18E7418F8((uint64_t (*)(uint64_t))sub_18E73CBCC);
}

uint64_t sub_18E7418F8(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ClarityUIEntryView(0) - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_18E741934()
{
  return sub_18E7394E4();
}

ValueMetadata *type metadata accessor for EmojiButton()
{
  return &type metadata for EmojiButton;
}

ValueMetadata *type metadata accessor for Emoji()
{
  return &type metadata for Emoji;
}

ValueMetadata *type metadata accessor for DeleteButton()
{
  return &type metadata for DeleteButton;
}

uint64_t *sub_18E74197C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    v7 = a3[6];
    v8 = (uint64_t *)((char *)a1 + v7);
    v9 = (uint64_t *)((char *)a2 + v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_18E766C80();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v12 = a3[8];
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)v4 + v12) = *(uint64_t *)((char *)a2 + v12);
  }
  return v4;
}

uint64_t sub_18E741A70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v3 = sub_18E766C80();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_WORD *sub_18E741AD8(_WORD *a1, _WORD *a2, int *a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v6 = a3[6];
  v7 = (_QWORD *)((char *)a1 + v6);
  v8 = (_QWORD *)((char *)a2 + v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_18E766C80();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  }
  else
  {
    *v7 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v10 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  return a1;
}

_BYTE *sub_18E741BA0(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  if (a1 != a2)
  {
    v6 = a3[6];
    v7 = &a1[v6];
    v8 = &a2[v6];
    sub_18E00FA98((uint64_t)&a1[v6], &qword_1EE112B20);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_18E766C80();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  return a1;
}

_WORD *sub_18E741C8C(_WORD *a1, _WORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_18E766C80();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  return a1;
}

_BYTE *sub_18E741D58(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  a1[1] = a2[1];
  if (a1 != a2)
  {
    v6 = a3[6];
    v7 = &a1[v6];
    v8 = &a2[v6];
    sub_18E00FA98((uint64_t)&a1[v6], &qword_1EE112B20);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_18E766C80();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
  }
  v11 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  *(_QWORD *)&a1[v11] = *(_QWORD *)&a2[v11];
  return a1;
}

uint64_t sub_18E741E44()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18E741E50(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  BOOL v5;
  int v6;
  uint64_t v10;

  if ((_DWORD)a2 == 254)
  {
    v4 = *a1;
    v5 = v4 >= 2;
    v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5)
      return (v6 + 1);
    else
      return 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112C30);
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v10);
  }
}

uint64_t sub_18E741ED0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_18E741EDC(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 254)
  {
    *result = a2 + 1;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112C30);
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

void sub_18E741F50()
{
  unint64_t v0;

  sub_18E688F70();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t destroy for MessageTextEditor()
{
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MessageTextEditor(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_retain();
  swift_retain();
  sub_18E7669BC();
  return a1;
}

_QWORD *assignWithCopy for MessageTextEditor(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  return a1;
}

uint64_t assignWithTake for MessageTextEditor(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  return a1;
}

ValueMetadata *type metadata accessor for MessageTextEditor()
{
  return &type metadata for MessageTextEditor;
}

uint64_t sub_18E742148()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_18E742150()
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
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_18E742208(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _DWORD *v19;
  _DWORD *v20;
  _QWORD *v21;
  _QWORD *v22;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = *(_QWORD *)(v7 + 64) + 7;
  v11 = v8 | *(_DWORD *)(v6 + 80) & 0xF8;
  if (v11 > 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) != 0
    || ((((((((v10 + (v9 & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 11) & 0xFFFFFFFFFFFFFFF8) + 11) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
     + 8 > 0x18)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + (((v11 | 7) + 16) & ~(unint64_t)(v11 | 7)));
  }
  else
  {
    v15 = ~v8;
    (*(void (**)(uint64_t *, uint64_t *))(v6 + 16))(a1, a2);
    v16 = ((unint64_t)a2 + v9) & v15;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(((unint64_t)v4 + v9) & v15, v16, v5);
    v17 = (_QWORD *)((v10 + (((unint64_t)v4 + v9) & v15)) & 0xFFFFFFFFFFFFF8);
    v18 = (_QWORD *)((v10 + v16) & 0xFFFFFFFFFFFFF8);
    *v17 = *v18;
    v19 = (_DWORD *)(((unint64_t)v17 + 11) & 0xFFFFFFFFFFFFF8);
    v20 = (_DWORD *)(((unint64_t)v18 + 11) & 0xFFFFFFFFFFFFF8);
    *v19 = *v20;
    v21 = (_QWORD *)(((unint64_t)v19 + 11) & 0xFFFFFFFFFFFFF8);
    v22 = (_QWORD *)(((unint64_t)v20 + 11) & 0xFFFFFFFFFFFFF8);
    *v21 = *v22;
    *(_QWORD *)(((unint64_t)v21 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFF8);
  }
  swift_retain();
  return v4;
}

uint64_t sub_18E74235C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 24) - 8);
  (*(void (**)(void))(v4 + 8))();
  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((*(_QWORD *)(v4 + 64)
                                                                                            + a1
                                                                                            + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
  return swift_release();
}

uint64_t sub_18E7423D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _DWORD *v16;
  _DWORD *v17;
  _QWORD *v18;
  _QWORD *v19;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64) + 7;
  v14 = (_QWORD *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8);
  v15 = (_QWORD *)((v13 + v12) & 0xFFFFFFFFFFFFFFF8);
  *v14 = *v15;
  v16 = (_DWORD *)(((unint64_t)v14 + 11) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_DWORD *)(((unint64_t)v15 + 11) & 0xFFFFFFFFFFFFFFF8);
  *v16 = *v17;
  v18 = (_QWORD *)(((unint64_t)v16 + 11) & 0xFFFFFFFFFFFFF8);
  v19 = (_QWORD *)(((unint64_t)v17 + 11) & 0xFFFFFFFFFFFFF8);
  *v18 = *v19;
  *(_QWORD *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

uint64_t sub_18E742498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64) + 7;
  v14 = (v13 + v11) & 0xFFFFFFFFFFFFFFF8;
  v15 = v13 + v12;
  v16 = (v15 & 0xFFFFFFFFFFFFFFF8) + 11;
  *(_QWORD *)v14 = *(_QWORD *)(v15 & 0xFFFFFFFFFFFFFFF8);
  v14 += 11;
  swift_retain();
  swift_release();
  *(_DWORD *)(v14 & 0xFFFFFFFFFFFFF8) = *(_DWORD *)(v16 & 0xFFFFFFFFFFFFF8);
  v17 = (_QWORD *)(((v14 & 0xFFFFFFFFFFFFF8) + 11) & 0xFFFFFFFFFFFFF8);
  v18 = (_QWORD *)(((v16 & 0xFFFFFFFFFFFFF8) + 11) & 0xFFFFFFFFFFFFF8);
  *v17 = *v18;
  *(_QWORD *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_18E74256C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _DWORD *v16;
  _DWORD *v17;
  _QWORD *v18;
  _QWORD *v19;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64) + 7;
  v14 = (_QWORD *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8);
  v15 = (_QWORD *)((v13 + v12) & 0xFFFFFFFFFFFFFFF8);
  *v14 = *v15;
  v16 = (_DWORD *)(((unint64_t)v14 + 11) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_DWORD *)(((unint64_t)v15 + 11) & 0xFFFFFFFFFFFFFFF8);
  *v16 = *v17;
  v18 = (_QWORD *)(((unint64_t)v16 + 11) & 0xFFFFFFFFFFFFF8);
  v19 = (_QWORD *)(((unint64_t)v17 + 11) & 0xFFFFFFFFFFFFF8);
  *v18 = *v19;
  *(_QWORD *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_18E742630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64) + 7;
  v14 = (v13 + v11) & 0xFFFFFFFFFFFFFFF8;
  v15 = (v13 + v12) & 0xFFFFFFFFFFFFFFF8;
  v16 = *(_QWORD *)v15;
  v15 += 11;
  *(_QWORD *)v14 = v16;
  v14 += 11;
  swift_release();
  *(_DWORD *)(v14 & 0xFFFFFFFFFFFFF8) = *(_DWORD *)(v15 & 0xFFFFFFFFFFFFF8);
  v17 = (_QWORD *)(((v14 & 0xFFFFFFFFFFFFF8) + 11) & 0xFFFFFFFFFFFFF8);
  v18 = (_QWORD *)(((v15 & 0xFFFFFFFFFFFFF8) + 11) & 0xFFFFFFFFFFFFF8);
  *v17 = *v18;
  *(_QWORD *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_18E7426FC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v17;
  unint64_t v18;

  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 84);
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8 <= v6)
    v9 = *(_DWORD *)(v5 + 84);
  else
    v9 = *(_DWORD *)(v7 + 84);
  if (v9 <= 0x7FFFFFFF)
    v9 = 0x7FFFFFFF;
  if (!a2)
    return 0;
  v10 = *(unsigned __int8 *)(v7 + 80);
  v11 = *(_QWORD *)(v5 + 64) + v10;
  v12 = *(_QWORD *)(v7 + 64) + 7;
  if (v9 >= a2)
  {
    if (v6 == v9)
    {
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v5 + 48))(a1, *(unsigned int *)(v5 + 84), v4);
    }
    else
    {
      v17 = (v11 + a1) & ~v10;
      if (v8 == v9)
      {
        return (*(uint64_t (**)(uint64_t))(v7 + 48))(v17);
      }
      else
      {
        v18 = *(_QWORD *)((v12 + v17) & 0xFFFFFFFFFFFFF8);
        if (v18 >= 0xFFFFFFFF)
          LODWORD(v18) = -1;
        return (v18 + 1);
      }
    }
  }
  else
  {
    if (((((((((((v12 + (v11 & ~v10)) & 0xFFFFFFFFFFFFFFF8) + 11) & 0xFFFFFFFFFFFFFFF8) + 11) & 0xFFFFFFFFFFFFFFF8)
           + 15) & 0xFFFFFFFFFFFFFFF8)
         + 8) & 0xFFFFFFF8) != 0)
      v13 = 2;
    else
      v13 = a2 - v9 + 1;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v15 = v14;
    else
      v15 = 0;
    return ((uint64_t (*)(void))((char *)&loc_18E7427B4 + 4 * byte_18E7DEF0A[v15]))();
  }
}

void sub_18E74285C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  v8 = *(unsigned __int8 *)(v6 + 80);
  if (v7 >= a3)
  {
    v11 = 0u;
    if (a2 <= v7)
      goto LABEL_19;
  }
  else
  {
    if (((((((((*(_DWORD *)(v6 + 64) + 7 + ((*(_DWORD *)(v5 + 64) + (_DWORD)v8) & ~(_DWORD)v8)) & 0xFFFFFFF8) + 11) & 0xFFFFFFF8)
           + 11) & 0xFFFFFFF8)
         + 15) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v9 = a3 - v7 + 1;
    else
      v9 = 2;
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
    if (a2 <= v7)
LABEL_19:
      __asm { BR              X0 }
  }
  if (((((((((*(_DWORD *)(v6 + 64) + 7 + ((*(_DWORD *)(v5 + 64) + (_DWORD)v8) & ~(_DWORD)v8)) & 0xFFFFFFF8) + 11) & 0xFFFFFFF8)
         + 11) & 0xFFFFFFF8)
       + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v12 = ~v7 + a2;
    bzero(a1, ((((((((*(_QWORD *)(v6 + 64) + 7 + ((*(_QWORD *)(v5 + 64) + v8) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 11) & 0xFFFFFFFFFFFFFFF8)+ 11) & 0xFFFFFFFFFFFFFFF8)+ 15) & 0xFFFFFFFFFFFFFFF8)+ 8);
    *a1 = v12;
  }
  __asm { BR              X10 }
}

void sub_18E742990()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x18E742A1CLL);
}

void sub_18E742998(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18E7429A0);
  JUMPOUT(0x18E742A1CLL);
}

void sub_18E7429E4()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x18E742A1CLL);
}

void sub_18E7429EC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x18E742A1CLL);
}

uint64_t sub_18E7429F4(uint64_t a1, int a2, int a3)
{
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_WORD *)(v12 + v13) = 0;
  if (!a2)
    JUMPOUT(0x18E742A1CLL);
  if (v6 == v9)
  {
    v3 = *(uint64_t (**)(uint64_t))(v10 + 56);
    v4 = v12;
  }
  else
  {
    v4 = (v11 + v12) & v7;
    if (a3 != v9)
      JUMPOUT(0x18E742A00);
    v3 = *(uint64_t (**)(uint64_t))(v8 + 56);
  }
  return v3(v4);
}

void type metadata accessor for InnerShadowedContent()
{
  JUMPOUT(0x193FF4DC4);
}

ValueMetadata *type metadata accessor for NewMessageButton()
{
  return &type metadata for NewMessageButton;
}

unint64_t sub_18E742A5C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE1126D8;
  if (!qword_1EE1126D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112250);
    v2[0] = sub_18E514BB4(&qword_1EE1126E0, &qword_1EE112230, MEMORY[0x1E0CDA108]);
    v2[1] = sub_18E514BB4(&qword_1EE10AC40, &qword_1EE10AC48, MEMORY[0x1E0CDBEF0]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE1126D8);
  }
  return result;
}

uint64_t sub_18E742AF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E742B2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E742B3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E742B4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E742B5C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E742B6C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_18E742B7C()
{
  unint64_t result;

  result = qword_1EE1126F8;
  if (!qword_1EE1126F8)
  {
    result = MEMORY[0x193FF4E54](&unk_18E7DF418, &type metadata for NewMessageButtonStyle);
    atomic_store(result, (unint64_t *)&qword_1EE1126F8);
  }
  return result;
}

unint64_t sub_18E742BC8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112720;
  if (!qword_1EE112720)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112710);
    v2[0] = sub_18E5659F4(&qword_1EE112728, &qword_1EE112708, (uint64_t (*)(void))sub_18E742C6C, MEMORY[0x1E0CD9758]);
    v2[1] = sub_18E514BB4(&qword_1EE0F4F08, &qword_1EE0F4F10, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112720);
  }
  return result;
}

unint64_t sub_18E742C6C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112730;
  if (!qword_1EE112730)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112700);
    v2[0] = sub_18E50F680(&qword_1EE112738, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD85E0], MEMORY[0x1E0CD85D8]);
    v2[1] = MEMORY[0x1E0CD9758];
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112730);
  }
  return result;
}

double sub_18E742D00@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_18E73DD6C(*(_QWORD *)(v1 + 16), a1);
}

double sub_18E742D08@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_18E73DEB8(*(_QWORD *)(v1 + 16), a1);
}

void sub_18E742D10()
{
  uint64_t *v0;

  sub_18E73F0B4(v0[6], v0[2], v0[3], v0[4], v0[5]);
}

_QWORD *assignWithCopy for NewMessageButtonStyle(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for NewMessageButtonStyle()
{
  return &type metadata for NewMessageButtonStyle;
}

uint64_t sub_18E742D8C()
{
  return sub_18E514BB4(&qword_1EE1127C0, &qword_1EE1126F0, (uint64_t)&unk_18E7DF154);
}

uint64_t sub_18E742DB8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112710);
  sub_18E742BC8();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E742E04()
{
  return sub_18E5659F4(&qword_1EE1127C8, &qword_1EE112760, (uint64_t (*)(void))sub_18E742E38, MEMORY[0x1E0CD9100]);
}

unint64_t sub_18E742E38()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE1127D0;
  if (!qword_1EE1127D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112758);
    v2[0] = sub_18E742EBC();
    v2[1] = sub_18E514BB4(&qword_1EE109F28, &qword_1EE109F30, MEMORY[0x1E0CD89F0]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE1127D0);
  }
  return result;
}

unint64_t sub_18E742EBC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE1127D8;
  if (!qword_1EE1127D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112750);
    v2[0] = sub_18E5659F4(&qword_1EE1127E0, &qword_1EE112748, (uint64_t (*)(void))sub_18E742F60, MEMORY[0x1E0CD8D70]);
    v2[1] = sub_18E514BB4(&qword_1EE10FCC0, &qword_1EE10FCC8, MEMORY[0x1E0CDC6D0]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE1127D8);
  }
  return result;
}

unint64_t sub_18E742F60()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE1127E8;
  if (!qword_1EE1127E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112740);
    v2[0] = sub_18E69B328();
    v2[1] = sub_18E514BB4((unint64_t *)&qword_1EE0F4F18, &qword_1EE0F4F20, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE1127E8);
  }
  return result;
}

uint64_t sub_18E742FE4()
{
  return sub_18E5659F4(&qword_1EE1127F0, &qword_1EE1127F8, (uint64_t (*)(void))sub_18E743018, MEMORY[0x1E0CD9100]);
}

unint64_t sub_18E743018()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112800;
  if (!qword_1EE112800)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112808);
    v2[0] = sub_18E74309C();
    v2[1] = sub_18E514BB4(&qword_1EE109F28, &qword_1EE109F30, MEMORY[0x1E0CD89F0]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112800);
  }
  return result;
}

unint64_t sub_18E74309C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EE112810;
  if (!qword_1EE112810)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112818);
    v2 = MEMORY[0x1E0CD9C20];
    v3[0] = sub_18E743148((unint64_t *)&qword_1EE110210, &qword_1EE110208, MEMORY[0x1E0CD8D70], MEMORY[0x1E0CD9C20]);
    v3[1] = sub_18E514BB4(&qword_1EE10FCC0, &qword_1EE10FCC8, MEMORY[0x1E0CDC6D0]);
    result = MEMORY[0x193FF4E54](v2, v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EE112810);
  }
  return result;
}

uint64_t sub_18E743148(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = MEMORY[0x1E0CDDD58];
    v9[1] = a3;
    result = MEMORY[0x193FF4E54](a4, v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18E7431AC()
{
  return sub_18E514BB4(&qword_1EE112820, &qword_1EE112828, MEMORY[0x1E0CDFCC0]);
}

uint64_t sub_18E7431D8(uint64_t a1)
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
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = sub_18E766CEC();
  v3 = MEMORY[0x193FF4E54](MEMORY[0x1E0CD8A50], v2);
  v16 = v2;
  v17 = v3;
  MEMORY[0x193FF4E0C](255, &v16, MEMORY[0x1E0CDE1B0], 0);
  v4 = sub_18E7670B8();
  v16 = v2;
  v17 = v3;
  v15[0] = swift_getOpaqueTypeConformance2();
  v15[1] = sub_18E594334();
  v5 = MEMORY[0x1E0CD9C20];
  MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v4, v15);
  v6 = sub_18E7671FC();
  v7 = sub_18E7670B8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE10FCC8);
  v8 = sub_18E7670B8();
  v9 = sub_18E766CE0();
  v10 = sub_18E7670B8();
  v14[0] = v1;
  v14[1] = MEMORY[0x193FF4E54](MEMORY[0x1E0CDA280], v6);
  v13[0] = MEMORY[0x193FF4E54](v5, v7, v14);
  v13[1] = sub_18E514BB4(&qword_1EE10FCC0, &qword_1EE10FCC8, MEMORY[0x1E0CDC6D0]);
  v12[0] = MEMORY[0x193FF4E54](v5, v8, v13);
  v12[1] = MEMORY[0x193FF4E54](MEMORY[0x1E0CD89F0], v9);
  return MEMORY[0x193FF4E54](v5, v10, v12);
}

uint64_t sub_18E7433A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E7433B4()
{
  return sub_18E514BB4(&qword_1EE112830, &qword_1EE112838, MEMORY[0x1E0CDC060]);
}

uint64_t sub_18E7433E0()
{
  return sub_18E741934();
}

__n128 DebugMenuDefaultCell.init(defaultItem:pinningEnabled:forceDisplayToggle:)@<Q0>(unsigned __int8 a1@<W1>, unsigned __int8 a2@<W2>, __n128 *a3@<X8>)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __n128 result;
  __n128 v12;
  unint64_t v13;

  type metadata accessor for PinnedUserDefault(0);
  sub_18E50F680((unint64_t *)&qword_1EE10B9B8, type metadata accessor for PinnedUserDefault, (uint64_t)&unk_18E7D8734);
  v6 = sub_18E767274();
  v8 = v7;
  sub_18E768210();
  sub_18E768210();
  type metadata accessor for UserDefaultItem(0);
  sub_18E50F680(&qword_1EE10E868, type metadata accessor for UserDefaultItem, (uint64_t)&protocol conformance descriptor for UserDefaultItem);
  v9 = sub_18E766F8C();
  a3->n128_u64[0] = v6;
  a3->n128_u64[1] = v8;
  a3[1].n128_u64[0] = v9;
  a3[1].n128_u64[1] = v10;
  a3[2].n128_u8[0] = v12.n128_u8[0];
  a3[2].n128_u64[1] = v12.n128_u64[1];
  result = v12;
  a3[3] = v12;
  a3[4].n128_u64[0] = v13;
  a3[4].n128_u8[8] = a1;
  a3[4].n128_u8[9] = a2;
  return result;
}

uint64_t DebugMenuButtonCell.body.getter()
{
  sub_18E5201D4();
  sub_18E7669BC();
  swift_retain();
  return sub_18E768288();
}

uint64_t sub_18E7435B4()
{
  sub_18E5201D4();
  sub_18E7669BC();
  swift_retain();
  return sub_18E768288();
}

__n128 DebugMenuDefaultDetails.body.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  __n128 result;
  __int128 v8;
  __n128 v9;
  char v10;
  uint64_t v11;
  __int128 v12;
  char v13;
  uint64_t v14;

  v2 = sub_18E7675BC();
  sub_18E7436B0((uint64_t)&v9);
  v3 = v10;
  v4 = v11;
  v5 = v13;
  v6 = v14;
  result = v9;
  v8 = v12;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(_BYTE *)(a1 + 40) = v3;
  *(_QWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 56) = v8;
  *(_BYTE *)(a1 + 72) = v5;
  *(_QWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t sub_18E7436B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  sub_18E5201D4();
  sub_18E7669BC();
  v2 = sub_18E767C94();
  v4 = v3;
  v6 = v5 & 1;
  sub_18E767B5C();
  v7 = sub_18E767C7C();
  v31 = v8;
  v32 = v7;
  v10 = v9;
  v33 = v11;
  swift_release();
  v30 = v10 & 1;
  sub_18E52836C(v2, v4, v6);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18E766B90();
  swift_release();
  swift_release();
  swift_release();
  v12 = sub_18E767C94();
  v14 = v13;
  v16 = v15 & 1;
  sub_18E767B5C();
  v17 = sub_18E767C7C();
  v19 = v18;
  v21 = v20;
  swift_release();
  sub_18E52836C(v12, v14, v16);
  swift_bridgeObjectRelease();
  sub_18E7680F0();
  v22 = sub_18E767C64();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  swift_release();
  sub_18E52836C(v17, v19, v21 & 1);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v32;
  *(_QWORD *)(a1 + 8) = v31;
  *(_BYTE *)(a1 + 16) = v30;
  *(_QWORD *)(a1 + 24) = v33;
  *(_QWORD *)(a1 + 32) = v22;
  *(_QWORD *)(a1 + 40) = v24;
  *(_BYTE *)(a1 + 48) = v26 & 1;
  *(_QWORD *)(a1 + 56) = v28;
  sub_18E5282E4(v32, v31, v30);
  sub_18E7669BC();
  sub_18E5282E4(v22, v24, v26 & 1);
  sub_18E7669BC();
  sub_18E52836C(v22, v24, v26 & 1);
  swift_bridgeObjectRelease();
  sub_18E52836C(v32, v31, v30);
  return swift_bridgeObjectRelease();
}

__n128 sub_18E743924@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  __n128 result;
  __int128 v8;
  __n128 v9;
  char v10;
  uint64_t v11;
  __int128 v12;
  char v13;
  uint64_t v14;

  v2 = sub_18E7675BC();
  sub_18E7436B0((uint64_t)&v9);
  v3 = v10;
  v4 = v11;
  v5 = v13;
  v6 = v14;
  result = v9;
  v8 = v12;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(_BYTE *)(a1 + 40) = v3;
  *(_QWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 56) = v8;
  *(_BYTE *)(a1 + 72) = v5;
  *(_QWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t DebugMenuDefaultCell.body.getter@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char *v13;
  _DWORD v15[2];
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD *v21;
  _OWORD *v22;
  _OWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  __int128 v28;
  _OWORD v29[2];
  __int128 v30;
  _BYTE v31[26];

  v19 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112840);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112848);
  v20 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v17 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = v1[3];
  v30 = v1[2];
  *(_OWORD *)v31 = v6;
  *(_OWORD *)&v31[10] = *(_OWORD *)((char *)v1 + 58);
  v7 = v1[1];
  v29[0] = *v1;
  v29[1] = v7;
  sub_18E743C9C((uint64_t)v29, (uint64_t)v4);
  v23 = v29;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112850);
  v9 = sub_18E744FB4();
  v10 = sub_18E514BB4(&qword_1EE112890, &qword_1EE112850, MEMORY[0x1E0CE0680]);
  sub_18E767D90();
  sub_18E00FA98((uint64_t)v4, &qword_1EE112840);
  v16 = sub_18E767544();
  v15[1] = v11;
  v28 = v30;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE110990);
  sub_18E768234();
  v15[0] = v26;
  v22 = v29;
  v21 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112898);
  v24 = v2;
  v25 = v8;
  v26 = v9;
  v27 = v10;
  swift_getOpaqueTypeConformance2();
  sub_18E514BB4(&qword_1EE1128A0, &qword_1EE112898, MEMORY[0x1E0CE0680]);
  v12 = v18;
  v13 = v17;
  sub_18E767F58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v13, v12);
}

uint64_t sub_18E743C9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  __int128 v21;

  v18 = a2;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112888);
  MEMORY[0x1E0C80A78](v19);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1128F8);
  MEMORY[0x1E0C80A78](v17);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112900);
  MEMORY[0x1E0C80A78](v16);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112878);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(_OWORD *)(a1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18E766B90();
  swift_release();
  swift_release();
  v11 = sub_18E6FB568((uint64_t)&v21);
  if ((v20 & 1) != 0)
  {
    *(_QWORD *)v4 = sub_18E7674B4();
    *((_QWORD *)v4 + 1) = 0;
    v4[16] = 1;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112918);
    sub_18E74411C(a1, &v4[*(int *)(v12 + 44)]);
    sub_18E5106A0((uint64_t)v4, (uint64_t)v6, &qword_1EE112888);
    swift_storeEnumTagMultiPayload();
    sub_18E514BB4(&qword_1EE112870, &qword_1EE112878, MEMORY[0x1E0CD9468]);
    sub_18E514BB4(&qword_1EE112880, &qword_1EE112888, MEMORY[0x1E0CDFB10]);
    sub_18E767688();
    return sub_18E00FA98((uint64_t)v4, &qword_1EE112888);
  }
  else
  {
    MEMORY[0x1E0C80A78](v11);
    *(&v15 - 2) = a1;
    sub_18E767A60();
    sub_18E746338();
    v14 = sub_18E766C50();
    MEMORY[0x1E0C80A78](v14);
    *(&v15 - 2) = a1;
    sub_18E514BB4(&qword_1EE112910, &qword_1EE112900, MEMORY[0x1E0CD8558]);
    sub_18E766F44();
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
    swift_storeEnumTagMultiPayload();
    sub_18E514BB4(&qword_1EE112870, &qword_1EE112878, MEMORY[0x1E0CD9468]);
    sub_18E514BB4(&qword_1EE112880, &qword_1EE112888, MEMORY[0x1E0CDFB10]);
    sub_18E767688();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

uint64_t sub_18E744044@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for UserDefaultItem(0);
  sub_18E50F680(&qword_1EE10E868, type metadata accessor for UserDefaultItem, (uint64_t)&protocol conformance descriptor for UserDefaultItem);
  swift_retain();
  result = sub_18E766F8C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_18E7440B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_18E5201D4();
  sub_18E7669BC();
  result = sub_18E767C94();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_18E74411C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  _OWORD *v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  uint64_t v41;
  char *v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  _QWORD v46[2];
  char *v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;

  v59 = a2;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112920);
  v49 = *(_QWORD *)(v51 - 8);
  MEMORY[0x1E0C80A78](v51);
  v48 = (char *)v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112928);
  v52 = *(_QWORD *)(v4 - 8);
  v53 = v4;
  MEMORY[0x1E0C80A78](v4);
  v50 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112930);
  v54 = *(_QWORD *)(v57 - 8);
  MEMORY[0x1E0C80A78](v57);
  v47 = (char *)v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112938);
  MEMORY[0x1E0C80A78](v7);
  v58 = (uint64_t)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v46 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112940);
  v55 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v56 = (char *)v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v46 - v15;
  v17 = sub_18E7674B4();
  v46[1] = *(_QWORD *)(a1 + 16);
  type metadata accessor for UserDefaultItem(0);
  sub_18E50F680(&qword_1EE10E868, type metadata accessor for UserDefaultItem, (uint64_t)&protocol conformance descriptor for UserDefaultItem);
  swift_retain();
  v18 = sub_18E766F8C();
  v60 = v17;
  v61 = 0;
  LOBYTE(v62) = 1;
  v63 = v18;
  v64 = v19;
  v65 = 0;
  v66 = 1;
  v20 = (_OWORD *)swift_allocObject();
  v21 = *(_OWORD *)(a1 + 48);
  v20[3] = *(_OWORD *)(a1 + 32);
  v20[4] = v21;
  *(_OWORD *)((char *)v20 + 74) = *(_OWORD *)(a1 + 58);
  v22 = *(_OWORD *)(a1 + 16);
  v20[1] = *(_OWORD *)a1;
  v20[2] = v22;
  sub_18E7461A0(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112948);
  sub_18E514BB4(&qword_1EE112950, &qword_1EE112948, MEMORY[0x1E0CDFB10]);
  sub_18E767D84();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18E766B90();
  swift_release();
  swift_release();
  swift_release();
  if (v63)
  {
    if (swift_dynamicCast())
    {
LABEL_8:
      v46[0] = v16;
      v27 = MEMORY[0x1E0DEAFA0];
      sub_18E7461A0(a1);
      sub_18E766F98();
      sub_18E7462C0(a1);
      swift_getKeyPath();
      sub_18E766FA4();
      swift_release();
      swift_release();
      v28 = v48;
      sub_18E76830C();
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_18E766B90();
      swift_release();
      swift_release();
      swift_release();
      v29 = (_OWORD *)swift_allocObject();
      v30 = *(_OWORD *)(a1 + 48);
      v29[3] = *(_OWORD *)(a1 + 32);
      v29[4] = v30;
      *(_OWORD *)((char *)v29 + 74) = *(_OWORD *)(a1 + 58);
      v31 = *(_OWORD *)(a1 + 16);
      v29[1] = *(_OWORD *)a1;
      v29[2] = v31;
      sub_18E7461A0(a1);
      v32 = sub_18E514BB4(&qword_1EE112958, &qword_1EE112920, MEMORY[0x1E0CDFC78]);
      v33 = MEMORY[0x1E0DEAFB8];
      v35 = v50;
      v34 = v51;
      sub_18E767FF4();
      swift_release();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v28, v34);
      v60 = v34;
      v61 = v27;
      v16 = (char *)v46[0];
      v62 = v32;
      v63 = v33;
      swift_getOpaqueTypeConformance2();
      v36 = v47;
      v37 = v53;
      sub_18E767D78();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v35, v37);
      v26 = v54;
      v25 = v57;
      (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v11, v36, v57);
      v24 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    sub_18E00FA98((uint64_t)&v60, qword_1EE0FB3F0);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18E766B90();
  swift_release();
  swift_release();
  swift_release();
  v23 = v63;
  sub_18E00FA98((uint64_t)&v60, qword_1EE0FB3F0);
  if (!v23 || (*(_BYTE *)(a1 + 73) & 1) != 0)
    goto LABEL_8;
  v24 = 1;
  v25 = v57;
  v26 = v54;
LABEL_9:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56))(v11, v24, 1, v25);
  v39 = v55;
  v38 = v56;
  v40 = *(void (**)(char *, char *, uint64_t))(v55 + 16);
  v40(v56, v16, v12);
  v41 = v58;
  sub_18E5106A0((uint64_t)v11, v58, &qword_1EE112938);
  v42 = v59;
  v40(v59, v38, v12);
  v43 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE112960);
  sub_18E5106A0(v41, (uint64_t)&v42[*(int *)(v43 + 48)], &qword_1EE112938);
  sub_18E00FA98((uint64_t)v11, &qword_1EE112938);
  v44 = *(void (**)(char *, uint64_t))(v39 + 8);
  v44(v16, v12);
  sub_18E00FA98(v41, &qword_1EE112938);
  return ((uint64_t (*)(char *, uint64_t))v44)(v38, v12);
}

uint64_t sub_18E7447C4(uint64_t a1)
{
  uint64_t result;
  __int128 v3;
  uint64_t v4;
  __int128 v5;

  v5 = *(_OWORD *)(a1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18E766B90();
  swift_release();
  swift_release();
  result = sub_18E6FB568((uint64_t)&v5);
  if (v3 == 1)
  {
    v3 = *(_OWORD *)(a1 + 32);
    sub_18E7461A0(a1);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE110990);
    sub_18E768228();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18E766B90();
    swift_release();
    swift_release();
    sub_18E6FB568((uint64_t)&v5);
    sub_18E665F34((uint64_t)&v3);
    sub_18E00FA98((uint64_t)&v3, qword_1EE0FB3F0);
    v3 = *(_OWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 64);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10E808);
    sub_18E768228();
    return sub_18E7462C0(a1);
  }
  return result;
}

uint64_t sub_18E744930(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t result;
  __int128 v7;

  v7 = *(_OWORD *)(a1 + 16);
  v2 = *(void **)(*((_QWORD *)&v7 + 1) + 16);
  swift_retain();
  v3 = (void *)sub_18E768954();
  v4 = objc_msgSend(v2, sel_BOOLForKey_, v3, (_QWORD)v7);

  v5 = (void *)sub_18E768954();
  objc_msgSend(v2, sel_setBool_forKey_, v4 ^ 1, v5);

  sub_18E66520C();
  sub_18E6FB568((uint64_t)&v7);
  if (*(_QWORD *)a1)
  {
    swift_retain();
    sub_18E665724();
    return swift_release();
  }
  else
  {
    sub_18E7461A0(a1);
    type metadata accessor for PinnedUserDefault(0);
    sub_18E50F680((unint64_t *)&qword_1EE10B9B8, type metadata accessor for PinnedUserDefault, (uint64_t)&unk_18E7D8734);
    result = sub_18E767268();
    __break(1u);
  }
  return result;
}

uint64_t sub_18E744A58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _OWORD *v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t KeyPath;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD *v31;
  __int128 v32;
  __int128 v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;

  v59 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1128B8);
  v52 = *(_QWORD *)(v3 - 8);
  v53 = v3;
  MEMORY[0x1E0C80A78](v3);
  v49 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1128C0);
  v55 = *(_QWORD *)(v57 - 8);
  MEMORY[0x1E0C80A78](v57);
  v50 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v51 = (uint64_t)&v49 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1128C8);
  MEMORY[0x1E0C80A78](v8);
  v58 = (uint64_t)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v56 = (char *)&v49 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE10A470);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1128D0);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v49 - v20;
  v22 = (_OWORD *)swift_allocObject();
  v23 = *(_OWORD *)(a1 + 48);
  v22[3] = *(_OWORD *)(a1 + 32);
  v22[4] = v23;
  *(_OWORD *)((char *)v22 + 74) = *(_OWORD *)(a1 + 58);
  v24 = *(_OWORD *)(a1 + 16);
  v22[1] = *(_OWORD *)a1;
  v22[2] = v24;
  sub_18E7461A0(a1);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE10B6B0);
  sub_18E514BB4(&qword_1EE10A480, (uint64_t *)&unk_1EE10B6B0, MEMORY[0x1E0CDF8C8]);
  sub_18E768258();
  v25 = sub_18E768090();
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v18, v15, v12);
  v27 = (uint64_t *)&v18[*(int *)(v16 + 36)];
  *v27 = KeyPath;
  v27[1] = v25;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v54 = v21;
  sub_18E520BEC((uint64_t)v18, (uint64_t)v21, &qword_1EE1128D0);
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    v31 = (_OWORD *)swift_allocObject();
    v32 = *(_OWORD *)(a1 + 48);
    v31[3] = *(_OWORD *)(a1 + 32);
    v31[4] = v32;
    *(_OWORD *)((char *)v31 + 74) = *(_OWORD *)(a1 + 58);
    v33 = *(_OWORD *)(a1 + 16);
    v31[1] = *(_OWORD *)a1;
    v31[2] = v33;
    MEMORY[0x1E0C80A78](v31);
    *(&v49 - 2) = (char *)a1;
    sub_18E7461A0(a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1128E0);
    sub_18E74622C();
    v34 = v49;
    sub_18E768258();
    v61 = *(_OWORD *)(a1 + 16);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18E766B90();
    swift_release();
    swift_release();
    sub_18E6FB568((uint64_t)&v61);
    if (v60 == 1)
      v35 = sub_18E768084();
    else
      v35 = sub_18E7680CC();
    v36 = v35;
    v30 = (uint64_t)v56;
    v29 = v57;
    v37 = swift_getKeyPath();
    v60 = v36;
    swift_retain();
    v38 = sub_18E766D88();
    v40 = v52;
    v39 = v53;
    v41 = (uint64_t)v50;
    (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v50, v34, v53);
    swift_release();
    v42 = (uint64_t *)(v41 + *(int *)(v29 + 36));
    *v42 = v37;
    v42[1] = v38;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v34, v39);
    v43 = v51;
    sub_18E520BEC(v41, v51, &qword_1EE1128C0);
    sub_18E520BEC(v43, v30, &qword_1EE1128C0);
    v28 = 0;
  }
  else
  {
    v28 = 1;
    v30 = (uint64_t)v56;
    v29 = v57;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 56))(v30, v28, 1, v29);
  v44 = (uint64_t)v54;
  sub_18E5106A0((uint64_t)v54, (uint64_t)v18, &qword_1EE1128D0);
  v45 = v58;
  sub_18E5106A0(v30, v58, &qword_1EE1128C8);
  v46 = v59;
  sub_18E5106A0((uint64_t)v18, v59, &qword_1EE1128D0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1128D8);
  sub_18E5106A0(v45, v46 + *(int *)(v47 + 48), &qword_1EE1128C8);
  sub_18E00FA98(v30, &qword_1EE1128C8);
  sub_18E00FA98(v44, &qword_1EE1128D0);
  sub_18E00FA98(v45, &qword_1EE1128C8);
  return sub_18E00FA98((uint64_t)v18, &qword_1EE1128D0);
}

uint64_t sub_18E744FAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_18E744A58(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_18E744FB4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_1EE112858;
  if (!qword_1EE112858)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112840);
    v2 = sub_18E745018();
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CDF690], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EE112858);
  }
  return result;
}

unint64_t sub_18E745018()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112860;
  if (!qword_1EE112860)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112868);
    v2[0] = sub_18E514BB4(&qword_1EE112870, &qword_1EE112878, MEMORY[0x1E0CD9468]);
    v2[1] = sub_18E514BB4(&qword_1EE112880, &qword_1EE112888, MEMORY[0x1E0CDFB10]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112860);
  }
  return result;
}

uint64_t sub_18E7450B4(uint64_t a1)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;

  v3 = *(_OWORD *)(a1 + 32);
  LOBYTE(v5) = 1;
  sub_18E7461A0(a1);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE110990);
  sub_18E768228();
  v5 = *(_OWORD *)(a1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18E766B90();
  swift_release();
  swift_release();
  sub_18E6FB568((uint64_t)&v5);
  sub_18E665F34((uint64_t)&v3);
  sub_18E00FA98((uint64_t)&v3, qword_1EE0FB3F0);
  v3 = *(_OWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10E808);
  sub_18E768228();
  return sub_18E7462C0(a1);
}

uint64_t sub_18E7451C4()
{
  sub_18E767544();
  return sub_18E7681A4();
}

uint64_t sub_18E745208(uint64_t a1)
{
  uint64_t result;
  __int128 v3;

  v3 = *(_OWORD *)(a1 + 16);
  swift_retain();
  sub_18E664E7C();
  sub_18E6FB568((uint64_t)&v3);
  if (*(_QWORD *)a1)
  {
    swift_retain();
    sub_18E665724();
    return swift_release();
  }
  else
  {
    sub_18E7461A0(a1);
    type metadata accessor for PinnedUserDefault(0);
    sub_18E50F680((unint64_t *)&qword_1EE10B9B8, type metadata accessor for PinnedUserDefault, (uint64_t)&unk_18E7D8734);
    result = sub_18E767268();
    __break(1u);
  }
  return result;
}

uint64_t sub_18E7452B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[15];
  __int128 v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1128F0);
  MEMORY[0x1E0C80A78](v2);
  v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE10B6B0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = *(_OWORD *)(a1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18E766B90();
  swift_release();
  swift_release();
  sub_18E6FB568((uint64_t)&v11);
  sub_18E767544();
  sub_18E7681A4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 16))(v4, v8, v5);
  swift_storeEnumTagMultiPayload();
  sub_18E514BB4(&qword_1EE10A480, (uint64_t *)&unk_1EE10B6B0, MEMORY[0x1E0CDF8C8]);
  sub_18E767688();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_18E7454D0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  char *v17;
  _OWORD *v18;
  __int128 v19;
  __int128 v20;
  char *v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, char *, uint64_t);
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  void (*v37)(char *, uint64_t);
  uint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;

  v49 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE10C3B0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0FB1F0);
  v46 = *(_QWORD *)(v48 - 8);
  MEMORY[0x1E0C80A78](v48);
  v47 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v45 = (char *)&v39 - v8;
  MEMORY[0x1E0C80A78](v9);
  v44 = (char *)&v39 - v10;
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v39 - v12;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1128A8);
  v50 = *(_QWORD *)(v43 - 8);
  MEMORY[0x1E0C80A78](v43);
  v42 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v39 - v16;
  sub_18E767544();
  v51 = *(_OWORD *)(a1 + 48);
  v52 = *(_QWORD *)(a1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10E808);
  sub_18E768234();
  v41 = v17;
  sub_18E768588();
  sub_18E767544();
  v18 = (_OWORD *)swift_allocObject();
  v19 = *(_OWORD *)(a1 + 48);
  v18[3] = *(_OWORD *)(a1 + 32);
  v18[4] = v19;
  *(_OWORD *)((char *)v18 + 74) = *(_OWORD *)(a1 + 58);
  v20 = *(_OWORD *)(a1 + 16);
  v18[1] = *(_OWORD *)a1;
  v18[2] = v20;
  sub_18E7461A0(a1);
  v21 = v13;
  v40 = v13;
  sub_18E76827C();
  sub_18E767544();
  sub_18E766BF0();
  v22 = sub_18E766BFC();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v5, 0, 1, v22);
  v23 = v44;
  sub_18E768264();
  v24 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
  v25 = v42;
  v26 = v17;
  v27 = v43;
  v24(v42, v26, v43);
  v28 = v45;
  v29 = v46;
  v30 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
  v31 = v21;
  v32 = v48;
  v30(v45, v31, v48);
  v33 = v47;
  v30(v47, v23, v32);
  v34 = v49;
  v24(v49, v25, v27);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1128B0);
  v30(&v34[*(int *)(v35 + 48)], v28, v32);
  v30(&v34[*(int *)(v35 + 64)], v33, v32);
  v36 = *(void (**)(char *, uint64_t))(v29 + 8);
  v36(v23, v32);
  v36(v40, v32);
  v37 = *(void (**)(char *, uint64_t))(v50 + 8);
  v37(v41, v27);
  v36(v33, v32);
  v36(v28, v32);
  return ((uint64_t (*)(char *, uint64_t))v37)(v25, v27);
}

uint64_t sub_18E7458DC@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_18E7454D0(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_18E7458E4(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t result;
  __int128 v6;
  uint64_t v7;
  __int128 v8;

  v8 = *(_OWORD *)(a1 + 16);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  v2 = *(id *)(*((_QWORD *)&v8 + 1) + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10E808);
  sub_18E76821C();
  v3 = (void *)sub_18E768954();
  swift_bridgeObjectRelease();
  sub_18E7669BC();
  v4 = (void *)sub_18E768954();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setValue_forKey_, v3, v4, v6, v7);

  swift_retain();
  sub_18E66520C();
  sub_18E6FB568((uint64_t)&v8);
  if (*(_QWORD *)a1)
  {
    swift_retain();
    sub_18E665724();
    return swift_release();
  }
  else
  {
    sub_18E7461A0(a1);
    type metadata accessor for PinnedUserDefault(0);
    sub_18E50F680((unint64_t *)&qword_1EE10B9B8, type metadata accessor for PinnedUserDefault, (uint64_t)&unk_18E7D8734);
    result = sub_18E767268();
    __break(1u);
  }
  return result;
}

uint64_t sub_18E745A38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v2 = sub_18E767538();
  MEMORY[0x1E0C80A78](v2);
  sub_18E76752C();
  sub_18E767520();
  sub_18E7669BC();
  sub_18E767514();
  swift_bridgeObjectRelease();
  sub_18E767520();
  sub_18E767550();
  result = sub_18E767C88();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_18E745B3C@<X0>(uint64_t a1@<X8>)
{
  return sub_18E745A38(a1);
}

uint64_t sub_18E745B44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E745B54()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E745B64()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for DebugMenuButtonCell()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for DebugMenuButtonCell(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  sub_18E7669BC();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for DebugMenuButtonCell(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  a1[1] = a2[1];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for DebugMenuButtonCell(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for DebugMenuButtonCell()
{
  return &type metadata for DebugMenuButtonCell;
}

_QWORD *assignWithCopy for DebugMenuDefaultDetails(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for DebugMenuDefaultDetails(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for DebugMenuDefaultDetails()
{
  return &type metadata for DebugMenuDefaultDetails;
}

uint64_t destroy for DebugMenuDefaultCell()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for DebugMenuDefaultCell(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v3 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v3;
  v4 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v4;
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_18E7669BC();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DebugMenuDefaultCell(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  return a1;
}

__n128 __swift_memcpy74_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 58) = *(_OWORD *)(a2 + 58);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for DebugMenuDefaultCell(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  return a1;
}

uint64_t getEnumTagSinglePayload for DebugMenuDefaultCell(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 74))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DebugMenuDefaultCell(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 72) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 74) = 1;
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
    *(_BYTE *)(result + 74) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DebugMenuDefaultCell()
{
  return &type metadata for DebugMenuDefaultCell;
}

uint64_t sub_18E746034()
{
  return sub_18E514BB4((unint64_t *)&unk_1EE0FB1E0, (uint64_t *)&unk_1EE0FB1F0, MEMORY[0x1E0CDFA58]);
}

uint64_t sub_18E746060()
{
  return sub_18E514BB4(&qword_1EE10F628, &qword_1EE10F630, MEMORY[0x1E0CDFCC0]);
}

uint64_t sub_18E74608C()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112848);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112898);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112840);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112850);
  sub_18E744FB4();
  v0 = MEMORY[0x1E0CE0680];
  sub_18E514BB4(&qword_1EE112890, &qword_1EE112850, MEMORY[0x1E0CE0680]);
  swift_getOpaqueTypeConformance2();
  sub_18E514BB4(&qword_1EE1128A0, &qword_1EE112898, v0);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E746198()
{
  uint64_t v0;

  return sub_18E7458E4(v0 + 16);
}

uint64_t sub_18E7461A0(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_18E7669BC();
  return a1;
}

uint64_t sub_18E746208()
{
  uint64_t v0;

  return sub_18E7450B4(v0 + 16);
}

uint64_t sub_18E74621C()
{
  uint64_t v0;

  return sub_18E745208(v0 + 16);
}

uint64_t sub_18E746224()
{
  uint64_t v0;

  return sub_18E7452B4(*(_QWORD *)(v0 + 16));
}

unint64_t sub_18E74622C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE1128E8;
  if (!qword_1EE1128E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE1128E0);
    v2[0] = sub_18E514BB4(&qword_1EE10A480, (uint64_t *)&unk_1EE10B6B0, MEMORY[0x1E0CDF8C8]);
    v2[1] = v2[0];
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE1128E8);
  }
  return result;
}

uint64_t sub_18E7462C0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_18E746330@<X0>(uint64_t *a1@<X8>)
{
  return sub_18E744044(a1);
}

unint64_t sub_18E746338()
{
  unint64_t result;

  result = qword_1EE112908;
  if (!qword_1EE112908)
  {
    result = MEMORY[0x193FF4E54](&protocol conformance descriptor for DebugMenuDefaultDetails, &type metadata for DebugMenuDefaultDetails);
    atomic_store(result, (unint64_t *)&qword_1EE112908);
  }
  return result;
}

uint64_t sub_18E74637C@<X0>(uint64_t a1@<X8>)
{
  return sub_18E7440B0(a1);
}

uint64_t sub_18E746388()
{
  uint64_t v0;

  return sub_18E7447C4(v0 + 16);
}

uint64_t objectdestroyTm_17()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18E7463E0()
{
  uint64_t v0;

  return sub_18E744930(v0 + 16);
}

uint64_t sub_18E7463F0()
{
  uint64_t v0;

  v0 = sub_18E7666F8();
  __swift_allocate_value_buffer(v0, qword_1EE12E1A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EE12E1A8);
  return sub_18E7666EC();
}

id sub_18E746470(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  char *v10;
  id v11;
  uint64_t v12;
  void (**v13)();
  uint64_t v14;
  id v15;
  uint64_t v16;
  char *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v40;
  char *v41;
  id v42;
  uint64_t v43;
  objc_super v44;

  v41 = (char *)type metadata accessor for SendLaterRootView(0);
  MEMORY[0x1E0C80A78](v41);
  v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112AA0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR___CKSendLaterView_cancellables] = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)&v1[OBJC_IVAR___CKSendLaterView_hostingView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___CKSendLaterView_pluginContext] = a1;
  v9 = objc_allocWithZone((Class)type metadata accessor for SendLaterRootViewModel(0));
  v42 = a1;
  v10 = (char *)sub_18E746FDC(v42);
  v44.receiver = v1;
  v44.super_class = (Class)CKSendLaterView;
  v11 = objc_msgSendSuper2(&v44, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v13 = (void (**)())&v10[OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel_onRequestPresentation];
  v14 = *(_QWORD *)&v10[OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel_onRequestPresentation];
  *v13 = sub_18E74ABC8;
  v13[1] = (void (*)())v12;
  v15 = v11;
  sub_18E011A40(v14);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE112A90);
  sub_18E766B78();
  swift_endAccess();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_18E514BB4(&qword_1EE112AA8, &qword_1EE112AA0, MEMORY[0x1E0C96190]);
  sub_18E766BC0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_beginAccess();
  sub_18E766B3C();
  swift_endAccess();
  swift_release();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v10;
  *(_QWORD *)v4 = sub_18E74ABD8;
  *((_QWORD *)v4 + 1) = v16;
  v4[16] = 0;
  v17 = &v4[*((int *)v41 + 5)];
  v41 = v10;
  sub_18E747DAC(v17);
  v18 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE112AB0));
  v19 = (void *)sub_18E766FD4();
  v20 = (void *)objc_opt_self();
  v21 = objc_msgSend(v20, sel_clearColor);
  objc_msgSend(v19, sel_setBackgroundColor_, v21);

  objc_msgSend(v19, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v15, sel_addSubview_, v19);
  v22 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0FB970);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_18E7CFB20;
  v24 = objc_msgSend(v19, sel_leadingAnchor);
  v25 = objc_msgSend(v15, sel_leadingAnchor);
  v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

  *(_QWORD *)(v23 + 32) = v26;
  v27 = objc_msgSend(v19, sel_trailingAnchor);
  v28 = objc_msgSend(v15, sel_trailingAnchor);
  v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v28);

  *(_QWORD *)(v23 + 40) = v29;
  v30 = objc_msgSend(v19, sel_topAnchor);
  v31 = objc_msgSend(v15, sel_topAnchor);
  v32 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v31);

  *(_QWORD *)(v23 + 48) = v32;
  v33 = objc_msgSend(v19, sel_bottomAnchor);
  v34 = objc_msgSend(v15, sel_bottomAnchor);
  v35 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v34);

  *(_QWORD *)(v23 + 56) = v35;
  v43 = v23;
  sub_18E768AF8();
  sub_18E00F31C(0, (unint64_t *)&qword_1EE0F5050);
  v36 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_activateConstraints_, v36);

  v37 = v15;
  v38 = objc_msgSend(v20, sel_clearColor);
  objc_msgSend(v37, sel_setBackgroundColor_, v38);

  return v37;
}

void sub_18E746A2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x193FF501C](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)MEMORY[0x193FF501C](v2 + OBJC_IVAR___CKSendLaterView_delegate);
    if (v4)
    {
      objc_msgSend(v4, sel_ckSendLaterViewWantsDatePickerPresented_, v3);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

void sub_18E746AB0(char *a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = *a1;
  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x193FF501C](v3);
  if (v4)
  {
    v5 = (void *)v4;
    if ((v2 & 1) != 0 && (v6 = (void *)MEMORY[0x193FF501C](v4 + OBJC_IVAR___CKSendLaterView_delegate)) != 0)
    {
      objc_msgSend(v6, sel_ckSendLaterViewCancelled_, v5);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

void __swiftcall CKSendLaterView.init(coder:)(CKSendLaterView_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

void CKSendLaterView.init(coder:)()
{
  char *v0;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR___CKSendLaterView_cancellables] = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)&v0[OBJC_IVAR___CKSendLaterView_hostingView] = 0;

  sub_18E769320();
  __break(1u);
}

void __swiftcall CKSendLaterView.init(frame:)(CKSendLaterView *__return_ptr retstr, __C::CGRect frame)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

void CKSendLaterView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t type metadata accessor for CKSendLaterView(uint64_t a1)
{
  return sub_18E00F31C(a1, &qword_1EE112998);
}

uint64_t sub_18E746E98()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18E766B90();
  swift_release();
  return swift_release();
}

uint64_t sub_18E746EFC()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18E766B90();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_18E746F6C()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18E766B90();
  swift_release();
  swift_release();
  return v1;
}

id sub_18E746FDC(void *a1)
{
  char *v1;
  uint64_t v3;
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
  char *v15;
  char *v16;
  id v17;
  id v18;
  objc_class *v19;
  id v20;
  objc_super v22;
  char v23;
  char v24;

  v3 = sub_18E766284();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v22 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE112A90);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = &v1[OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel_onRequestPresentation];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v15 = &v1[OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel__state];
  v24 = 0;
  v16 = v1;
  sub_18E766B6C();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v13, v10);
  v17 = objc_msgSend(a1, sel_selectedDate);
  sub_18E766254();

  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
  sub_18E766B6C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  swift_endAccess();
  *(_QWORD *)&v16[OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel_pluginContext] = a1;
  v18 = a1;
  LOBYTE(v3) = objc_msgSend(v18, sel_showingDatePicker);
  swift_beginAccess();
  v23 = v3;
  sub_18E766B6C();
  swift_endAccess();

  v19 = (objc_class *)type metadata accessor for SendLaterRootViewModel(0);
  v22.receiver = v16;
  v22.super_class = v19;
  v20 = objc_msgSendSuper2(&v22, sel_init);
  objc_msgSend(v18, sel_addObserver_, v20);

  return v20;
}

void sub_18E747230(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  void *v34;
  _QWORD aBlock[6];

  v3 = sub_18E768678();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_18E768690();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v33 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_18E766284();
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v15 = MEMORY[0x1E0C80A78](v13).n128_u64[0];
  v17 = (char *)&v29 - v16;
  v34 = v1;
  if (*(void **)&v1[OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel_pluginContext] == a1)
  {
    v31 = v14;
    v18 = objc_msgSend(a1, sel_selectedDate, v15);
    sub_18E766254();

    swift_getKeyPath();
    swift_getKeyPath();
    v32 = v8;
    v30 = v4;
    sub_18E766B90();
    swift_release();
    v19 = v3;
    v20 = v32;
    swift_release();
    sub_18E50F680((unint64_t *)&unk_1EE112A80, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B8]);
    LOBYTE(v18) = sub_18E768900();
    v21 = *(void (**)(char *, uint64_t))(v31 + 8);
    v21(v12, v10);
    v21(v17, v10);
    if ((v18 & 1) == 0)
    {
      sub_18E00F31C(0, (unint64_t *)&qword_1EE0FB910);
      v22 = (void *)sub_18E768E1C();
      v23 = swift_allocObject();
      v24 = v34;
      *(_QWORD *)(v23 + 16) = v34;
      aBlock[4] = sub_18E74AAD8;
      aBlock[5] = v23;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_18E521C9C;
      aBlock[3] = &block_descriptor_15_5;
      v25 = _Block_copy(aBlock);
      v26 = v24;
      swift_release();
      v27 = v7;
      v28 = v33;
      sub_18E768684();
      aBlock[0] = MEMORY[0x1E0DEE9D8];
      sub_18E50F680((unint64_t *)&qword_1EE0FB8D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0FB8E0);
      sub_18E514BB4((unint64_t *)&qword_1EE0FB8F0, (uint64_t *)&unk_1EE0FB8E0, MEMORY[0x1E0DEAF38]);
      sub_18E7691AC();
      MEMORY[0x193FF2184](0, v28, v6, v25);
      _Block_release(v25);

      (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v19);
      (*(void (**)(char *, uint64_t))(v20 + 8))(v28, v27);
    }
  }
}

uint64_t sub_18E747598(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char *v9;
  id v10;
  char *v11;
  uint64_t v13;

  v2 = sub_18E766284();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v7 = MEMORY[0x1E0C80A78](v6).n128_u64[0];
  v9 = (char *)&v13 - v8;
  v10 = objc_msgSend(*(id *)&a1[OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel_pluginContext], sel_selectedDate, v7);
  sub_18E766254();

  swift_getKeyPath();
  swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v9, v2);
  v11 = a1;
  sub_18E766B9C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
}

void sub_18E747704(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  char *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];

  v3 = sub_18E768678();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_18E768690();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void **)&v1[OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel_pluginContext] == a1)
  {
    sub_18E00F31C(0, (unint64_t *)&qword_1EE0FB910);
    v17 = sub_18E768E1C();
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v1;
    *(_QWORD *)(v11 + 24) = a1;
    aBlock[4] = sub_18E747DA4;
    aBlock[5] = v11;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_18E521C9C;
    aBlock[3] = &block_descriptor_73;
    v12 = _Block_copy(aBlock);
    v13 = v1;
    v14 = a1;
    swift_release();
    sub_18E768684();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_18E50F680((unint64_t *)&qword_1EE0FB8D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0FB8E0);
    sub_18E514BB4((unint64_t *)&qword_1EE0FB8F0, (uint64_t *)&unk_1EE0FB8E0, MEMORY[0x1E0DEAF38]);
    sub_18E7691AC();
    v15 = (void *)v17;
    MEMORY[0x193FF2184](0, v10, v6, v12);
    _Block_release(v12);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

uint64_t sub_18E747928(void *a1, id a2)
{
  id v3;

  objc_msgSend(a2, sel_showingDatePicker);
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = a1;
  return sub_18E766B9C();
}

id sub_18E747A28()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SendLaterRootViewModel(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18E747B1C()
{
  return type metadata accessor for SendLaterRootViewModel(0);
}

uint64_t type metadata accessor for SendLaterRootViewModel(uint64_t a1)
{
  return sub_18E520164(a1, qword_1EE112A50);
}

void sub_18E747B38()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_18E5A2AB4(319, (unint64_t *)&qword_1EE10FB40, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  if (v0 <= 0x3F)
  {
    sub_18E6667FC(319, (unint64_t *)&unk_1EE112A68);
    if (v1 <= 0x3F)
    {
      sub_18E6667FC(319, (unint64_t *)&qword_1EE0F4CD0);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

uint64_t storeEnumTagSinglePayload for SendLaterRootViewModel.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_18E747C74 + 4 * byte_18E7DF775[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_18E747CA8 + 4 * byte_18E7DF770[v4]))();
}

uint64_t sub_18E747CA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18E747CB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18E747CB8);
  return result;
}

uint64_t sub_18E747CC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18E747CCCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_18E747CD0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18E747CD8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SendLaterRootViewModel.State()
{
  return &type metadata for SendLaterRootViewModel.State;
}

unint64_t sub_18E747CF8()
{
  unint64_t result;

  result = qword_1EE112A78;
  if (!qword_1EE112A78)
  {
    result = MEMORY[0x193FF4E54](&unk_18E7DF808, &type metadata for SendLaterRootViewModel.State);
    atomic_store(result, (unint64_t *)&qword_1EE112A78);
  }
  return result;
}

uint64_t sub_18E747D3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for SendLaterRootViewModel(0);
  result = sub_18E766B60();
  *a1 = result;
  return result;
}

uint64_t sub_18E747D78()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_18E747DA4()
{
  uint64_t v0;

  return sub_18E747928(*(void **)(v0 + 16), *(id *)(v0 + 24));
}

uint64_t sub_18E747DAC@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t result;
  char *v17;
  void (*v18)(char *, char *, uint64_t);
  char *v19;
  void (*v20)(char *, char *, uint64_t);
  void (*v21)(char *, uint64_t);
  char *v22;
  uint64_t v23;
  uint64_t v24;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE10FC90);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v24 - v6;
  v8 = sub_18E766284();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870];
  v10 = *(_QWORD **)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v24 - v14;
  sub_18E5D381C((uint64_t)&v24 - v14);
  sub_18E5D3A4C((uint64_t)v12);
  sub_18E50F680(&qword_1EE112AC0, v9, MEMORY[0x1E0CB08B0]);
  result = sub_18E7688E8();
  if ((result & 1) != 0)
  {
    v17 = &v7[*(int *)(v2 + 48)];
    v18 = (void (*)(char *, char *, uint64_t))v10[4];
    v18(v7, v15, v8);
    v18(v17, v12, v8);
    v19 = &v4[*(int *)(v2 + 48)];
    v20 = (void (*)(char *, char *, uint64_t))v10[2];
    v20(v4, v7, v8);
    v20(v19, v17, v8);
    v18(a1, v4, v8);
    v21 = (void (*)(char *, uint64_t))v10[1];
    v21(v19, v8);
    v22 = &v4[*(int *)(v2 + 48)];
    v18(v4, v7, v8);
    v18(v22, v17, v8);
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE107F50);
    v18(&a1[*(int *)(v23 + 36)], v22, v8);
    return ((uint64_t (*)(char *, uint64_t))v21)(v4, v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_18E747FB0()
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
  void *v9;
  void *v10;
  void (*v11)(char *, uint64_t);
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38[2];

  v1 = v0;
  v2 = sub_18E766284();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v36 - v7;
  v9 = (void *)objc_opt_self();
  sub_18E766260();
  v10 = (void *)sub_18E76620C();
  v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v8, v2);
  v12 = (void *)sub_18E76620C();
  v13 = objc_msgSend(v9, sel_relativeDateFormatterFromDate_toDate_, v10, v12);

  if (v13)
  {
    objc_msgSend(v13, sel_setFormattingContext_, 2);
    v14 = (void *)sub_18E76620C();
    v15 = objc_msgSend(v13, sel_stringFromDate_, v14);

    v16 = sub_18E768984();
  }
  else
  {
    sub_18E74B348();
    v17 = (void *)swift_allocError();
    swift_willThrow();
    v18 = v17;
    if (qword_1EE107690 != -1)
      swift_once();
    v19 = sub_18E7666F8();
    __swift_project_value_buffer(v19, (uint64_t)qword_1EE12E1A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
    v20 = v17;
    v21 = v17;
    v22 = sub_18E7666E0();
    v23 = sub_18E768D68();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = swift_slowAlloc();
      v36 = swift_slowAlloc();
      v38[0] = v36;
      *(_DWORD *)v24 = 136315394;
      sub_18E50F680((unint64_t *)&unk_1EE0F4640, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08F0]);
      v25 = sub_18E7693D4();
      v37 = sub_18E012440(v25, v26, v38);
      sub_18E769140();
      swift_bridgeObjectRelease();
      v11(v5, v2);
      *(_WORD *)(v24 + 12) = 2080;
      v37 = (uint64_t)v17;
      v27 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE110690);
      v28 = sub_18E7689C0();
      v37 = sub_18E012440(v28, v29, v38);
      sub_18E769140();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_18DFCD000, v22, v23, "Failed to create formatter for date: %s, reason: %s", (uint8_t *)v24, 0x16u);
      v30 = v36;
      swift_arrayDestroy();
      MEMORY[0x193FF4F20](v30, -1, -1);
      MEMORY[0x193FF4F20](v24, -1, -1);
    }
    else
    {
      v11(v5, v2);

    }
    v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3578]), sel_init);
    objc_msgSend(v31, sel_setDateStyle_, 2);
    objc_msgSend(v31, sel_setTimeStyle_, 1);
    v32 = (void *)sub_18E768954();
    objc_msgSend(v31, sel_setLocalizedDateFormatFromTemplate_, v32);

    objc_msgSend(v31, sel_setFormattingContext_, 2);
    v33 = (void *)sub_18E76620C();
    v34 = objc_msgSend(v31, sel_stringFromDate_, v33);

    v16 = sub_18E768984();
  }
  return v16;
}

id sub_18E748448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  id result;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  void (*v34)(char *, uint64_t);
  unsigned int *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t (*v40)(void);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v55 = a1;
  v56 = a2;
  v52 = sub_18E766C80();
  v49 = *(_QWORD *)(v52 - 8);
  MEMORY[0x1E0C80A78](v52);
  v3 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v46 - v5;
  v7 = sub_18E768564();
  v53 = *(_QWORD *)(v7 - 8);
  v54 = v7;
  MEMORY[0x1E0C80A78](v7);
  v50 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112CE8);
  MEMORY[0x1E0C80A78](v48);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_18E7671C0();
  MEMORY[0x1E0C80A78](v11);
  v13 = (double *)((char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112CF0);
  MEMORY[0x1E0C80A78](v46);
  v51 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112CF8);
  MEMORY[0x1E0C80A78](v47);
  v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (void *)objc_opt_self();
  result = objc_msgSend(v17, sel_sharedBehaviors);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  v19 = result;
  objc_msgSend(result, sel_entryViewCoverMinHeight);
  v21 = v20;

  result = objc_msgSend(v17, sel_sharedBehaviors);
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  v22 = result;
  v23 = v21 * 0.5;
  objc_msgSend(result, sel_messageEntryContentViewSendLaterInsets);
  v25 = v24;

  v26 = v23 - v25;
  v27 = (char *)v13 + *(int *)(v11 + 20);
  v28 = *MEMORY[0x1E0CDB0C0];
  v29 = sub_18E767574();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 104))(v27, v28, v29);
  *v13 = v26;
  v13[1] = v26;
  sub_18E74885C(&v57);
  v30 = v57;
  sub_18E5A4138((uint64_t)v6);
  v31 = v49;
  v32 = v52;
  (*(void (**)(char *, _QWORD, uint64_t))(v49 + 104))(v3, *MEMORY[0x1E0CD86E0], v52);
  v33 = sub_18E766C74();
  v34 = *(void (**)(char *, uint64_t))(v31 + 8);
  v34(v3, v32);
  v34(v6, v32);
  v35 = (unsigned int *)MEMORY[0x1E0CE0350];
  v37 = v53;
  v36 = v54;
  if ((v33 & 1) == 0)
    v35 = (unsigned int *)MEMORY[0x1E0CE0368];
  v38 = v50;
  (*(void (**)(char *, _QWORD, uint64_t))(v53 + 104))(v50, *v35, v54);
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(&v10[*(int *)(v48 + 36)], v38, v36);
  *(_QWORD *)v10 = v30;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v36);
  v39 = (uint64_t)v51;
  sub_18E5106A0((uint64_t)v10, (uint64_t)&v51[*(int *)(v46 + 36)], &qword_1EE112CE8);
  v40 = MEMORY[0x1E0CDA088];
  sub_18E520220((uint64_t)v13, v39, (uint64_t (*)(_QWORD))MEMORY[0x1E0CDA088]);
  sub_18E00FA98((uint64_t)v10, &qword_1EE112CE8);
  sub_18E565AE0((uint64_t)v13, (uint64_t (*)(_QWORD))v40);
  v41 = sub_18E7684D4();
  v43 = v42;
  v44 = (uint64_t)&v16[*(int *)(v47 + 36)];
  sub_18E748A20(v44);
  v45 = (uint64_t *)(v44 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE112D00) + 36));
  *v45 = v41;
  v45[1] = v43;
  sub_18E520BEC(v39, (uint64_t)v16, &qword_1EE112CF0);
  return (id)sub_18E520BEC((uint64_t)v16, v56, &qword_1EE112CF8);
}

void sub_18E74885C(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  int v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;

  v2 = v1;
  v4 = type metadata accessor for SendLaterRootView.DatePickerButtonStyle(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_18E767850();
  sub_18E520220(v2, (uint64_t)v6, type metadata accessor for SendLaterRootView.DatePickerButtonStyle);
  if ((v7 & 1) != 0)
  {
    sub_18E565AE0((uint64_t)v6, type metadata accessor for SendLaterRootView.DatePickerButtonStyle);
  }
  else
  {
    v8 = v6[*(int *)(v4 + 20)];
    sub_18E565AE0((uint64_t)v6, type metadata accessor for SendLaterRootView.DatePickerButtonStyle);
    if (v8 != 1)
      goto LABEL_8;
  }
  v9 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
  if (!v9)
  {
    __break(1u);
    goto LABEL_13;
  }
  v10 = v9;
  v11 = objc_msgSend(v9, sel_theme);

  if (!v11)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v12 = objc_msgSend(v11, sel_entryFieldSendLaterPressedBalloonColor);

  if (v12)
  {
LABEL_11:
    *a1 = MEMORY[0x193FF1398](v12);
    return;
  }
  __break(1u);
LABEL_8:
  v13 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
  if (!v13)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v13;
  v15 = objc_msgSend(v13, sel_theme);

  if (!v15)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v12 = objc_msgSend(v15, sel_entryFieldSendLaterBalloonColor);

  if (v12)
    goto LABEL_11;
LABEL_16:
  __break(1u);
}

void sub_18E748A20(uint64_t a1@<X8>)
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
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
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

  v29 = a1;
  v1 = sub_18E767838();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112D08);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112D10);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E767844();
  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_sharedBehaviors);
  if (!v12)
  {
    __break(1u);
    goto LABEL_7;
  }
  v13 = v12;
  v14 = objc_msgSend(v12, sel_theme);

  if (!v14)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v15 = objc_msgSend(v14, sel_balloonTextColorForColorType_, 15);

  if (!v15)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v16 = MEMORY[0x193FF1398](v15);
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v7, v4, v1);
  *(_QWORD *)&v7[*(int *)(v5 + 36)] = v16;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v17 = objc_msgSend(v11, sel_sharedBehaviors);
  if (v17)
  {
    v18 = v17;
    objc_msgSend(v17, sel_messageEntryContentViewSendLaterDateInsets);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    LOBYTE(v18) = sub_18E767A78();
    sub_18E5106A0((uint64_t)v7, (uint64_t)v10, &qword_1EE112D08);
    v27 = &v10[*(int *)(v8 + 36)];
    *v27 = (char)v18;
    *((_QWORD *)v27 + 1) = v20;
    *((_QWORD *)v27 + 2) = v22;
    *((_QWORD *)v27 + 3) = v24;
    *((_QWORD *)v27 + 4) = v26;
    v27[40] = 0;
    sub_18E00FA98((uint64_t)v7, &qword_1EE112D08);
    sub_18E520BEC((uint64_t)v10, v29, &qword_1EE112D10);
    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t sub_18E748C88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t KeyPath;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v48 = a1;
  v1 = sub_18E766FF8();
  v46 = *(_QWORD *)(v1 - 8);
  v47 = v1;
  MEMORY[0x1E0C80A78](v1);
  v45 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE112BD0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (uint64_t *)((char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_18E768174();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10F4C8);
  MEMORY[0x1E0C80A78](v38);
  v11 = (uint64_t *)((char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112BE0);
  v43 = *(_QWORD *)(v12 - 8);
  v44 = v12;
  MEMORY[0x1E0C80A78](v12);
  v39 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112BE8);
  MEMORY[0x1E0C80A78](v42);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v41 = (uint64_t)&v37 - v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112BF0);
  MEMORY[0x1E0C80A78](v18);
  v40 = (uint64_t)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v37 - v21;
  *(_QWORD *)v22 = sub_18E7674B4();
  *((_QWORD *)v22 + 1) = 0x4014000000000000;
  v22[16] = 0;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112BF8);
  sub_18E749100((uint64_t)&v22[*(int *)(v23 + 44)]);
  v24 = sub_18E768138();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0CDF7D0], v6);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v5 + *(int *)(v3 + 28), v9, v6);
  *v5 = KeyPath;
  sub_18E5106A0((uint64_t)v5, (uint64_t)v11 + *(int *)(v38 + 36), (uint64_t *)&unk_1EE112BD0);
  *v11 = v24;
  swift_retain();
  sub_18E00FA98((uint64_t)v5, (uint64_t *)&unk_1EE112BD0);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();
  v27 = v45;
  v26 = v46;
  v28 = v47;
  (*(void (**)(char *, _QWORD, uint64_t))(v46 + 104))(v45, *MEMORY[0x1E0CD9910], v47);
  sub_18E74B4C4((unint64_t *)&qword_1EE112C00, &qword_1EE10F4C8, &qword_1EE10C2B0, (uint64_t *)&unk_1EE112BD0);
  v29 = v39;
  sub_18E767DCC();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
  sub_18E00FA98((uint64_t)v11, &qword_1EE10F4C8);
  v31 = v43;
  v30 = v44;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v15, v29, v44);
  v15[*(int *)(v42 + 36)] = 1;
  (*(void (**)(char *, uint64_t))(v31 + 8))(v29, v30);
  v32 = v41;
  sub_18E520BEC((uint64_t)v15, v41, &qword_1EE112BE8);
  v33 = v40;
  sub_18E5106A0((uint64_t)v22, v40, &qword_1EE112BF0);
  sub_18E5106A0(v32, (uint64_t)v15, &qword_1EE112BE8);
  v34 = v48;
  sub_18E5106A0(v33, v48, &qword_1EE112BF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE112C10);
  sub_18E5106A0((uint64_t)v15, v34 + *(int *)(v35 + 48), &qword_1EE112BE8);
  sub_18E00FA98(v32, &qword_1EE112BE8);
  sub_18E00FA98((uint64_t)v22, &qword_1EE112BF0);
  sub_18E00FA98((uint64_t)v15, &qword_1EE112BE8);
  return sub_18E00FA98(v33, &qword_1EE112BF0);
}

void sub_18E749100(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  int v25;
  id v26;
  id v27;
  id v28;
  id v29;
  char *v30;
  char *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t KeyPath;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;

  v63 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE108BE0);
  MEMORY[0x1E0C80A78](v1);
  v62 = (char *)&v54 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_18E766284();
  v59 = *(_QWORD *)(v3 - 8);
  v60 = v3;
  MEMORY[0x1E0C80A78](v3);
  v58 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10FC30);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = type metadata accessor for DynamicClockRepresentable();
  MEMORY[0x1E0C80A78](v55);
  v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112C20);
  MEMORY[0x1E0C80A78](v57);
  v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v54 - v13;
  MEMORY[0x1E0C80A78](v15);
  v61 = (uint64_t)&v54 - v16;
  v17 = type metadata accessor for SendLaterRootViewModel(0);
  sub_18E50F680(&qword_1EE112B18, type metadata accessor for SendLaterRootViewModel, (uint64_t)&unk_18E7DF830);
  v64 = v17;
  v18 = (void *)sub_18E766CBC();
  swift_getKeyPath();
  v56 = v7;
  sub_18E766FA4();

  swift_release();
  v19 = (void *)objc_opt_self();
  v20 = objc_msgSend(v19, sel_sharedBehaviors);
  if (!v20)
  {
    __break(1u);
    goto LABEL_14;
  }
  v21 = v20;
  v22 = objc_msgSend(v20, sel_theme);

  if (!v22)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v54 = v11;
  v23 = objc_msgSend(v22, sel_balloonTextColorForColorType_, 15);

  if (!v23)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v24 = (void *)sub_18E766CB0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18E766B90();

  swift_release();
  swift_release();
  v25 = v67;
  v26 = objc_msgSend(v19, sel_sharedBehaviors);
  v27 = v26;
  if (v25 != 1)
    goto LABEL_9;
  if (!v26)
    goto LABEL_16;
  v28 = objc_msgSend(v26, sel_theme);

  if (!v28)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v27 = objc_msgSend(v28, sel_entryFieldSendLaterPressedBalloonColor);

  if (v27)
  {
LABEL_12:
    sub_18E520BEC((uint64_t)v56, (uint64_t)v9, &qword_1EE10FC30);
    v30 = &v9[*(int *)(v55 + 20)];
    *(_QWORD *)v30 = v23;
    *((_QWORD *)v30 + 1) = v27;
    sub_18E7684D4();
    sub_18E766D7C();
    sub_18E520220((uint64_t)v9, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for DynamicClockRepresentable);
    v31 = &v14[*(int *)(v57 + 36)];
    v32 = v68;
    *(_OWORD *)v31 = v67;
    *((_OWORD *)v31 + 1) = v32;
    *((_OWORD *)v31 + 2) = v69;
    sub_18E565AE0((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for DynamicClockRepresentable);
    v33 = (uint64_t)v14;
    v34 = v61;
    sub_18E520BEC(v33, v61, &qword_1EE112C20);
    v35 = (void *)sub_18E766CB0();
    swift_getKeyPath();
    swift_getKeyPath();
    v36 = v58;
    sub_18E766B90();

    swift_release();
    swift_release();
    v37 = sub_18E747FB0();
    v39 = v38;
    (*(void (**)(char *, uint64_t))(v59 + 8))(v36, v60);
    v65 = v37;
    v66 = v39;
    sub_18E5201D4();
    v40 = sub_18E767C94();
    v42 = v41;
    v44 = v43;
    v46 = v45 & 1;
    v47 = sub_18E767AFC();
    v48 = (uint64_t)v62;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v62, 1, 1, v47);
    v49 = sub_18E767B38();
    sub_18E00FA98(v48, &qword_1EE108BE0);
    KeyPath = swift_getKeyPath();
    v51 = (uint64_t)v54;
    sub_18E5106A0(v34, (uint64_t)v54, &qword_1EE112C20);
    v52 = v63;
    sub_18E5106A0(v51, v63, &qword_1EE112C20);
    v53 = v52 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE112C28) + 48);
    *(_QWORD *)v53 = v40;
    *(_QWORD *)(v53 + 8) = v42;
    *(_BYTE *)(v53 + 16) = v46;
    *(_QWORD *)(v53 + 24) = v44;
    *(_WORD *)(v53 + 32) = 256;
    *(_QWORD *)(v53 + 40) = KeyPath;
    *(_QWORD *)(v53 + 48) = v49;
    sub_18E5282E4(v40, v42, v46);
    sub_18E7669BC();
    swift_retain();
    swift_retain();
    sub_18E00FA98(v34, &qword_1EE112C20);
    sub_18E52836C(v40, v42, v46);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_18E00FA98(v51, &qword_1EE112C20);
    return;
  }
  __break(1u);
LABEL_9:
  if (!v27)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v29 = objc_msgSend(v27, sel_theme);

  if (!v29)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v27 = objc_msgSend(v29, sel_entryFieldSendLaterBalloonColor);

  if (v27)
    goto LABEL_12;
LABEL_20:
  __break(1u);
}

uint64_t sub_18E749758()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18E766B90();
  swift_release();
  return swift_release();
}

uint64_t sub_18E7497C0(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t, __n128);
  void *v13;
  id v14;
  uint64_t v16;

  v4 = sub_18E766284();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v16 - v10;
  v12 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v5 + 16);
  v12((char *)&v16 - v10, a1, v4, v9);
  v13 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  ((void (*)(char *, char *, uint64_t))v12)(v7, v11, v4);
  v14 = v13;
  sub_18E766B9C();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v4);
}

id sub_18E7498C0@<X0>(uint64_t a1@<X8>)
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
  uint64_t *v10;
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
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t OpaqueTypeConformance2;
  char *v38;
  uint64_t v39;
  void *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id result;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  char *v92;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
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

  v2 = v1;
  v77 = a1;
  v3 = sub_18E7677E4();
  v97 = *(_QWORD *)(v3 - 8);
  v98 = v3;
  MEMORY[0x1E0C80A78](v3);
  v96 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_18E766284();
  v94 = *(_QWORD *)(v5 - 8);
  v95 = v5;
  MEMORY[0x1E0C80A78](v5);
  v92 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = sub_18E7678C8();
  v87 = *(_QWORD *)(v88 - 8);
  MEMORY[0x1E0C80A78](v88);
  v85 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SendLaterRootView.DatePickerButtonStyle(0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (uint64_t *)((char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = type metadata accessor for SendLaterRootView(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x1E0C80A78](v11);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112AE8);
  v82 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112AF0);
  v84 = *(_QWORD *)(v83 - 8);
  MEMORY[0x1E0C80A78](v83);
  v80 = (char *)&v75 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112AF8);
  v91 = *(_QWORD *)(v89 - 8);
  MEMORY[0x1E0C80A78](v89);
  v81 = (char *)&v75 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B00);
  MEMORY[0x1E0C80A78](v104);
  v86 = (char *)&v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v90 = (char *)&v75 - v21;
  MEMORY[0x1E0C80A78](v22);
  v93 = (char *)&v75 - v23;
  MEMORY[0x1E0C80A78](v24);
  v99 = (char *)&v75 - v25;
  MEMORY[0x1E0C80A78](v26);
  v76 = (char *)&v75 - v27;
  v79 = (uint64_t)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E520220(v2, v79, type metadata accessor for SendLaterRootView);
  v28 = *(unsigned __int8 *)(v12 + 80);
  v29 = (v28 + 16) & ~v28;
  v101 = v29;
  v102 = v28 | 7;
  v103 = v29 + v13;
  v30 = swift_allocObject();
  sub_18E74B1E4((uint64_t)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v30 + v29);
  v105 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B08);
  sub_18E514BB4(&qword_1EE112B10, &qword_1EE112B08, MEMORY[0x1E0CDFB10]);
  sub_18E768258();
  v78 = type metadata accessor for SendLaterRootViewModel(0);
  sub_18E50F680(&qword_1EE112B18, type metadata accessor for SendLaterRootViewModel, (uint64_t)&unk_18E7DF830);
  v31 = (void *)sub_18E766CB0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18E766B90();

  swift_release();
  swift_release();
  LOBYTE(v31) = v108;
  *v10 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
  swift_storeEnumTagMultiPayload();
  *((_BYTE *)v10 + *(int *)(v8 + 20)) = (_BYTE)v31;
  v32 = sub_18E514BB4(&qword_1EE112B28, &qword_1EE112AE8, MEMORY[0x1E0CDFA58]);
  v33 = sub_18E50F680((unint64_t *)&unk_1EE112B30, type metadata accessor for SendLaterRootView.DatePickerButtonStyle, (uint64_t)&unk_18E7DFB38);
  v34 = v80;
  sub_18E767D30();
  sub_18E565AE0((uint64_t)v10, type metadata accessor for SendLaterRootView.DatePickerButtonStyle);
  (*(void (**)(char *, uint64_t))(v82 + 8))(v16, v14);
  v35 = v85;
  sub_18E7678B0();
  v108 = v14;
  v109 = v8;
  v110 = v32;
  v111 = v33;
  v36 = v2;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v38 = v81;
  v39 = v83;
  sub_18E767EEC();
  (*(void (**)(char *, uint64_t))(v87 + 8))(v35, v88);
  (*(void (**)(char *, uint64_t))(v84 + 8))(v34, v39);
  v100 = v36;
  v40 = (void *)sub_18E766CB0();
  swift_getKeyPath();
  swift_getKeyPath();
  v41 = v92;
  sub_18E766B90();

  swift_release();
  swift_release();
  v42 = sub_18E747FB0();
  v44 = v43;
  (*(void (**)(char *, unint64_t))(v94 + 8))(v41, v95);
  v108 = v42;
  v109 = v44;
  v106 = v39;
  v107 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v45 = sub_18E5201D4();
  v46 = (uint64_t)v86;
  v47 = v89;
  v95 = v45;
  sub_18E767E74();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v91 + 8))(v38, v47);
  v48 = v79;
  sub_18E520220(v36, v79, type metadata accessor for SendLaterRootView);
  v49 = swift_allocObject();
  v50 = v101;
  sub_18E74B1E4(v48, v49 + v101);
  v51 = v96;
  sub_18E7677D8();
  v52 = (uint64_t)v90;
  sub_18E7670AC();
  swift_release();
  v53 = v98;
  v97 = *(_QWORD *)(v97 + 8);
  ((void (*)(char *, uint64_t))v97)(v51, v98);
  sub_18E00FA98(v46, &qword_1EE112B00);
  sub_18E7677CC();
  sub_18E520220(v100, v48, type metadata accessor for SendLaterRootView);
  v54 = swift_allocObject() + v50;
  v55 = v48;
  sub_18E74B1E4(v48, v54);
  v56 = (uint64_t)v93;
  sub_18E7670AC();
  swift_release();
  ((void (*)(char *, uint64_t))v97)(v51, v53);
  sub_18E00FA98(v52, &qword_1EE112B00);
  result = CKFrameworkBundle();
  if (result)
  {
    v58 = result;
    v59 = (void *)sub_18E768954();
    v60 = (void *)sub_18E768954();
    v61 = objc_msgSend(v58, sel_localizedStringForKey_value_table_, v59, 0, v60);

    v62 = sub_18E768984();
    v64 = v63;

    v108 = v62;
    v109 = v64;
    sub_18E767088();
    swift_bridgeObjectRelease();
    sub_18E00FA98(v56, &qword_1EE112B00);
    result = CKFrameworkBundle();
    if (result)
    {
      v65 = result;
      v66 = (void *)sub_18E768954();
      v67 = (void *)sub_18E768954();
      v68 = objc_msgSend(v65, sel_localizedStringForKey_value_table_, v66, 0, v67);

      v69 = sub_18E768984();
      v71 = v70;

      v108 = v69;
      v109 = v71;
      sub_18E520220(v100, v55, type metadata accessor for SendLaterRootView);
      v72 = swift_allocObject();
      sub_18E74B1E4(v55, v72 + v101);
      v73 = (uint64_t)v76;
      v74 = (uint64_t)v99;
      sub_18E7670A0();
      swift_release();
      swift_bridgeObjectRelease();
      sub_18E00FA98(v74, &qword_1EE112B00);
      return (id)sub_18E520BEC(v73, v77, &qword_1EE112B00);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_18E74A310@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *(_QWORD *)a2 = sub_18E7674B4();
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B48);
  return sub_18E74A35C(a1, (char *)(a2 + *(int *)(v4 + 44)));
}

uint64_t sub_18E74A35C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, uint64_t);
  void (*v34)(char *, uint64_t);
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v45 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B50);
  v43 = *(_QWORD *)(v3 - 8);
  v44 = v3;
  MEMORY[0x1E0C80A78](v3);
  v42 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v41 = (char *)&v36 - v6;
  v7 = type metadata accessor for SendLaterRootView(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B58);
  v39 = *(_QWORD *)(v11 - 8);
  v40 = v11;
  MEMORY[0x1E0C80A78](v11);
  v38 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v36 - v14;
  sub_18E520220(a1, (uint64_t)v10, type metadata accessor for SendLaterRootView);
  v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v17 = swift_allocObject();
  sub_18E74B1E4((uint64_t)v10, v17 + v16);
  v47 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B60);
  v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112B68);
  v19 = sub_18E514BB4(&qword_1EE112B70, &qword_1EE112B68, MEMORY[0x1E0CDFB10]);
  v48 = v18;
  v49 = v19;
  swift_getOpaqueTypeConformance2();
  v37 = v15;
  sub_18E768258();
  sub_18E520220(a1, (uint64_t)v10, type metadata accessor for SendLaterRootView);
  v20 = swift_allocObject();
  sub_18E74B1E4((uint64_t)v10, v20 + v16);
  v46 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B78);
  sub_18E74B3A4();
  v21 = v41;
  sub_18E768258();
  v23 = v38;
  v22 = v39;
  v24 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
  v25 = v40;
  v24(v38, v15, v40);
  v26 = v42;
  v27 = v43;
  v28 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
  v29 = v44;
  v28(v42, v21, v44);
  v30 = v45;
  v24(v45, v23, v25);
  v31 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE112BB8);
  v32 = &v30[*(int *)(v31 + 48)];
  *(_QWORD *)v32 = 0;
  v32[8] = 1;
  v28(&v30[*(int *)(v31 + 64)], v26, v29);
  v33 = *(void (**)(char *, uint64_t))(v27 + 8);
  v33(v21, v29);
  v34 = *(void (**)(char *, uint64_t))(v22 + 8);
  v34(v37, v25);
  v33(v26, v29);
  return ((uint64_t (*)(char *, uint64_t))v34)(v23, v25);
}

uint64_t sub_18E74A69C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B68);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v2 = sub_18E7674B4();
  *((_QWORD *)v2 + 1) = 0x4000000000000000;
  v2[16] = 0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112BC8);
  sub_18E748C88((uint64_t)&v2[*(int *)(v3 + 44)]);
  sub_18E767B14();
  sub_18E514BB4(&qword_1EE112B70, &qword_1EE112B68, MEMORY[0x1E0CDFB10]);
  sub_18E767D00();
  return sub_18E00FA98((uint64_t)v2, &qword_1EE112B68);
}

double sub_18E74A784@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  double result;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  __int128 v18;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE108BE0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_18E768138();
  sub_18E767B08();
  v6 = sub_18E767AFC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v4, 1, 1, v6);
  v7 = sub_18E767B38();
  sub_18E00FA98((uint64_t)v4, &qword_1EE108BE0);
  KeyPath = swift_getKeyPath();
  sub_18E7684EC();
  sub_18E766D7C();
  v9 = v14;
  v10 = v15;
  v11 = v16;
  v12 = v17;
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = KeyPath;
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v9;
  *(_BYTE *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 40) = v11;
  *(_BYTE *)(a1 + 48) = v12;
  result = *(double *)&v18;
  *(_OWORD *)(a1 + 56) = v18;
  *(_QWORD *)(a1 + 72) = 0xC046000000000000;
  *(_BYTE *)(a1 + 80) = 0;
  return result;
}

void sub_18E74A8C8()
{
  void *v0;
  char *v1;
  void (*v2)(uint64_t);
  uint64_t v3;

  type metadata accessor for SendLaterRootViewModel(0);
  sub_18E50F680(&qword_1EE112B18, type metadata accessor for SendLaterRootViewModel, (uint64_t)&unk_18E7DF830);
  v0 = (void *)sub_18E766CB0();
  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  sub_18E766B9C();
  v2 = *(void (**)(uint64_t))&v1[OBJC_IVAR____TtC7ChatKit22SendLaterRootViewModel_onRequestPresentation];
  if (v2)
  {
    v3 = swift_retain();
    v2(v3);
    sub_18E011A40((uint64_t)v2);
  }

}

uint64_t sub_18E74A9B4()
{
  type metadata accessor for SendLaterRootViewModel(0);
  sub_18E50F680(&qword_1EE112B18, type metadata accessor for SendLaterRootViewModel, (uint64_t)&unk_18E7DF830);
  sub_18E766CB0();
  swift_getKeyPath();
  swift_getKeyPath();
  return sub_18E766B9C();
}

uint64_t sub_18E74AA64@<X0>(_BYTE *a1@<X8>)
{
  return sub_18E665E3C(a1);
}

uint64_t sub_18E74AA88(uint64_t a1, void **a2)
{
  return sub_18E74AB04(a1, a2);
}

uint64_t sub_18E74AAB4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_18E74AAD8()
{
  uint64_t v0;

  return sub_18E747598(*(char **)(v0 + 16));
}

uint64_t sub_18E74AAE0@<X0>(_BYTE *a1@<X8>)
{
  return sub_18E665E3C(a1);
}

uint64_t sub_18E74AB04(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_18E766B9C();
}

uint64_t sub_18E74AB6C(uint64_t a1, void **a2)
{
  return sub_18E74AB04(a1, a2);
}

uint64_t type metadata accessor for SendLaterRootView(uint64_t a1)
{
  return sub_18E520164(a1, (uint64_t *)&unk_1EE112AC8);
}

uint64_t sub_18E74ABA4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_18E74ABC8()
{
  uint64_t v0;

  sub_18E746A2C(v0);
}

void sub_18E74ABD0(char *a1)
{
  uint64_t v1;

  sub_18E746AB0(a1, v1);
}

id sub_18E74ABD8()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

unint64_t sub_18E74ABE0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v16 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = *(_QWORD *)a2;
    v8 = *(void **)(a2 + 8);
    v9 = *(_BYTE *)(a2 + 16);
    sub_18E6B1204(*(_QWORD *)a2, v8, v9);
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v8;
    *(_BYTE *)(a1 + 16) = v9;
    v10 = *(int *)(a3 + 20);
    v11 = a1 + v10;
    v12 = a2 + v10;
    v13 = sub_18E766284();
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    v14(v11, v12, v13);
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE107F50);
    v14(v11 + *(int *)(v15 + 36), v12 + *(int *)(v15 + 36), v13);
  }
  return a1;
}

uint64_t sub_18E74ACB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v8)(uint64_t, uint64_t);

  sub_18E6B12FC(*(_QWORD *)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_18E766284();
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v8(v4, v5);
  v6 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE107F50) + 36);
  return ((uint64_t (*)(uint64_t, uint64_t))v8)(v6, v5);
}

uint64_t sub_18E74AD38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;

  v6 = *(_QWORD *)a2;
  v7 = *(void **)(a2 + 8);
  v8 = *(_BYTE *)(a2 + 16);
  sub_18E6B1204(*(_QWORD *)a2, v7, v8);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_18E766284();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  v13(v10, v11, v12);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE107F50);
  v13(v10 + *(int *)(v14 + 36), v11 + *(int *)(v14 + 36), v12);
  return a1;
}

uint64_t sub_18E74ADE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;

  v6 = *(_QWORD *)a2;
  v7 = *(void **)(a2 + 8);
  v8 = *(_BYTE *)(a2 + 16);
  sub_18E6B1204(*(_QWORD *)a2, v7, v8);
  v9 = *(_QWORD *)a1;
  v10 = *(void **)(a1 + 8);
  v11 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  sub_18E6B12FC(v9, v10, v11);
  v12 = *(int *)(a3 + 20);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_18E766284();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24);
  v16(v13, v14, v15);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE107F50);
  v16(v13 + *(int *)(v17 + 36), v14 + *(int *)(v17 + 36), v15);
  return a1;
}

uint64_t sub_18E74AE94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(int *)(a3 + 20);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_18E766284();
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32);
  v8(v5, v6, v7);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE107F50);
  v8(v5 + *(int *)(v9 + 36), v6 + *(int *)(v9 + 36), v7);
  return a1;
}

uint64_t sub_18E74AF24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;

  v6 = *(_BYTE *)(a2 + 16);
  v7 = *(_QWORD *)a1;
  v8 = *(void **)(a1 + 8);
  v9 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v6;
  sub_18E6B12FC(v7, v8, v9);
  v10 = *(int *)(a3 + 20);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_18E766284();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40);
  v14(v11, v12, v13);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE107F50);
  v14(v11 + *(int *)(v15 + 36), v12 + *(int *)(v15 + 36), v13);
  return a1;
}

uint64_t sub_18E74AFCC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18E74AFD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;

  if ((_DWORD)a2 == 254)
  {
    v4 = *(unsigned __int8 *)(a1 + 16);
    if (v4 > 1)
      return (v4 ^ 0xFF) + 1;
    else
      return 0;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE107F50);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_18E74B050()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_18E74B05C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 254)
  {
    *(_BYTE *)(result + 16) = -(char)a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE107F50);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

void sub_18E74B0D0()
{
  unint64_t v0;

  sub_18E74B144();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_18E74B144()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EE112AD8)
  {
    sub_18E766284();
    sub_18E50F680(&qword_1EE112AC0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B0]);
    v0 = sub_18E7688F4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EE112AD8);
  }
}

uint64_t sub_18E74B1BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for SendLaterRootView.DatePickerButtonStyle(uint64_t a1)
{
  return sub_18E520164(a1, (uint64_t *)&unk_1EE112C90);
}

uint64_t sub_18E74B1E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SendLaterRootView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18E74B228()
{
  return sub_18E74B2F8((uint64_t (*)(uint64_t))sub_18E74A8C8);
}

uint64_t sub_18E74B234@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_18E74A310(*(_QWORD *)(v1 + 16), a1);
}

uint64_t objectdestroy_30Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  v1 = type metadata accessor for SendLaterRootView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  sub_18E6B12FC(*(_QWORD *)v3, *(void **)(v3 + 8), *(_BYTE *)(v3 + 16));
  v4 = v3 + *(int *)(v1 + 20);
  v5 = sub_18E766284();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE107F50);
  v6(v4 + *(int *)(v7 + 36), v5);
  return swift_deallocObject();
}

uint64_t sub_18E74B2F8(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SendLaterRootView(0) - 8) + 80);
  return a1(v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_18E74B338()
{
  return sub_18E74B2F8((uint64_t (*)(uint64_t))sub_18E74A9B4);
}

unint64_t sub_18E74B348()
{
  unint64_t result;

  result = qword_1EE112B40;
  if (!qword_1EE112B40)
  {
    result = MEMORY[0x193FF4E54](&unk_18E7DFAF8, &_s6ErrorsON);
    atomic_store(result, (unint64_t *)&qword_1EE112B40);
  }
  return result;
}

uint64_t sub_18E74B390()
{
  return sub_18E74A69C();
}

double sub_18E74B39C@<D0>(uint64_t a1@<X8>)
{
  return sub_18E74A784(a1);
}

unint64_t sub_18E74B3A4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112B80;
  if (!qword_1EE112B80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112B78);
    v2[0] = sub_18E74B428();
    v2[1] = sub_18E514BB4(&qword_1EE112BA8, &qword_1EE112BB0, MEMORY[0x1E0CDBE48]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112B80);
  }
  return result;
}

unint64_t sub_18E74B428()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112B88;
  if (!qword_1EE112B88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EE112B90);
    v2[0] = sub_18E74B4C4((unint64_t *)&qword_1EE10C250, &qword_1EE112BA0, &qword_1EE0F4F08, &qword_1EE0F4F10);
    v2[1] = MEMORY[0x1E0CD8D70];
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112B88);
  }
  return result;
}

uint64_t sub_18E74B4C4(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = sub_18E514BB4(a3, a4, MEMORY[0x1E0CDCF80]);
    v10[0] = MEMORY[0x1E0CDF820];
    v10[1] = v9;
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v8, v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _s6ErrorsOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_18E74B584 + 4 * byte_18E7DF77A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_18E74B5A4 + 4 * byte_18E7DF77F[v4]))();
}

_BYTE *sub_18E74B584(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_18E74B5A4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_18E74B5AC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_18E74B5B4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_18E74B5BC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_18E74B5C4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *_s6ErrorsOMa()
{
  return &_s6ErrorsON;
}

_QWORD *sub_18E74B5E0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_18E766C80();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_18E74B6B8(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v2 = sub_18E766C80();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

_QWORD *sub_18E74B71C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_18E766C80();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *sub_18E74B7C8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_18E00FA98((uint64_t)a1, &qword_1EE112B20);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_18E766C80();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_18E74B88C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_18E766C80();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_18E74B934(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_18E00FA98((uint64_t)a1, &qword_1EE112B20);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112B20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_18E766C80();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_18E74B9F4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18E74BA00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112C30);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_18E74BA90()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_18E74BA9C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112C30);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  return result;
}

void sub_18E74BB18()
{
  unint64_t v0;

  sub_18E5A2AB4(319, (unint64_t *)&qword_1EE112CA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD86F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CD87D0]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

unint64_t sub_18E74BBA4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[6];

  result = qword_1EE112CD0;
  if (!qword_1EE112CD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112B00);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112AF0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112AE8);
    type metadata accessor for SendLaterRootView.DatePickerButtonStyle(255);
    v3[4] = sub_18E514BB4(&qword_1EE112B28, &qword_1EE112AE8, MEMORY[0x1E0CDFA58]);
    v3[5] = sub_18E50F680((unint64_t *)&unk_1EE112B30, type metadata accessor for SendLaterRootView.DatePickerButtonStyle, (uint64_t)&unk_18E7DFB38);
    v3[2] = v2;
    v3[3] = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    v3[1] = sub_18E50F680(&qword_1EE10A900, MEMORY[0x1E0CDCFD0], MEMORY[0x1E0CDCFB8]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EE112CD0);
  }
  return result;
}

unint64_t sub_18E74BCD8()
{
  unint64_t result;

  result = qword_1EE112CE0;
  if (!qword_1EE112CE0)
  {
    result = MEMORY[0x193FF4E54](&unk_18E7DFAD0, &_s6ErrorsON);
    atomic_store(result, (unint64_t *)&qword_1EE112CE0);
  }
  return result;
}

uint64_t sub_18E74BD1C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_18E74BD30()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112D18;
  if (!qword_1EE112D18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112CF8);
    v2[0] = sub_18E74BDB4();
    v2[1] = sub_18E514BB4((unint64_t *)&unk_1EE112D40, &qword_1EE112D00, MEMORY[0x1E0CDA280]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112D18);
  }
  return result;
}

unint64_t sub_18E74BDB4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112D20;
  if (!qword_1EE112D20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112CF0);
    v2[0] = sub_18E50F680(&qword_1EE112D28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDA088], MEMORY[0x1E0CDA070]);
    v2[1] = sub_18E514BB4(&qword_1EE112D30, &qword_1EE112D38, MEMORY[0x1E0CDC718]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112D20);
  }
  return result;
}

unint64_t AudioMessageRecordingView.State.init(rawValue:)(unint64_t a1)
{
  return sub_18E62CEE0(a1);
}

uint64_t sub_18E74BEC0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CKAudioMessageRecordingView_delegate;
  swift_beginAccess();
  return MEMORY[0x193FF501C](v1);
}

uint64_t sub_18E74BF58()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_18E74BFB0(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CKAudioMessageRecordingView_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x193FF501C](v5);
  return sub_18E53B788;
}

uint64_t sub_18E74C064()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CKAudioMessageRecordingView_state;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

void sub_18E74C114(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)(v1 + OBJC_IVAR___CKAudioMessageRecordingView_state);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  sub_18E74C16C(v4);
}

void sub_18E74C16C(uint64_t a1)
{
  char *v1;
  char *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  CFTimeInterval v8;
  CFTimeInterval *v9;
  char *v10;
  double *v11;
  double v12;
  char v13;
  char *v14;
  char *v15;
  char *v16;
  double *v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char *v22;
  _QWORD aBlock[6];

  v3 = &v1[OBJC_IVAR___CKAudioMessageRecordingView_state];
  swift_beginAccess();
  if (*(_QWORD *)v3 != a1)
  {
    if (*(_QWORD *)v3 == 1)
    {
      v4 = *(void **)&v1[OBJC_IVAR___CKAudioMessageRecordingView_displayLink];
      if (v4)
      {
        v5 = (void *)objc_opt_self();
        v6 = v4;
        v7 = objc_msgSend(v5, sel_mainRunLoop);
        objc_msgSend(v6, sel_addToRunLoop_forMode_, v7, *MEMORY[0x1E0C99860]);

      }
      v8 = CACurrentMediaTime();
      v9 = (CFTimeInterval *)&v1[OBJC_IVAR___CKAudioMessageRecordingView_recordingStartTime];
      *v9 = v8;
      *((_BYTE *)v9 + 8) = 0;
      v10 = *(char **)&v1[OBJC_IVAR___CKAudioMessageRecordingView_waveformView];
      v11 = (double *)&v10[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_intensityOffset];
      swift_beginAccess();
      v12 = *v11;
      v13 = *((_BYTE *)v11 + 8);
      *v11 = 0.0;
      *((_BYTE *)v11 + 8) = 0;
      if ((v13 & 1) != 0 || v12 != 0.0)
        objc_msgSend(v10, sel_setNeedsLayout, v12);
    }
    sub_18E74F7B8();
    if (!*(_QWORD *)v3)
    {
      v14 = *(char **)&v1[OBJC_IVAR___CKAudioMessageRecordingView_waveformView];
      v15 = &v14[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_intensities];
      swift_beginAccess();
      *(_QWORD *)v15 = MEMORY[0x1E0DEE9D8];
      swift_bridgeObjectRelease();
      objc_msgSend(v14, sel_setNeedsLayout);
      v16 = &v1[OBJC_IVAR___CKAudioMessageRecordingView_playbackCurrentTime];
      swift_beginAccess();
      *(_QWORD *)v16 = 0x7FF8000000000000;
      sub_18E74F7B8();
      v17 = (double *)&v1[OBJC_IVAR___CKAudioMessageRecordingView_playbackDuration];
      swift_beginAccess();
      v18 = *v17;
      *v17 = 0.0;
      if (v18 != 0.0)
        sub_18E74F7B8();
    }
    objc_msgSend(v1, sel_setNeedsLayout);
    v19 = (void *)objc_opt_self();
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v1;
    aBlock[4] = sub_18E750AE0;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_18E521C9C;
    aBlock[3] = &block_descriptor_27_0;
    v21 = _Block_copy(aBlock);
    v22 = v1;
    swift_release();
    objc_msgSend(v19, sel_animateWithDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion_, 2, v21, 0, 0.6, 0.0, 0.86, 0.0);
    _Block_release(v21);
  }
}

void (*sub_18E74C438(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CKAudioMessageRecordingView_state;
  v3[4] = v1;
  v3[5] = v4;
  v5 = (_QWORD *)(v1 + v4);
  swift_beginAccess();
  v3[3] = *v5;
  return sub_18E74C4A4;
}

void sub_18E74C4A4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v5 = *(_QWORD *)(v3 + v2);
  *(_QWORD *)(v3 + v2) = v4;
  sub_18E74C16C(v5);
  free(v1);
}

double sub_18E74C51C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CKAudioMessageRecordingView_cornerRadius;
  swift_beginAccess();
  return *(double *)v1;
}

id sub_18E74C5D0(double a1)
{
  char *v1;
  double *v3;
  id result;
  double v5;

  v3 = (double *)&v1[OBJC_IVAR___CKAudioMessageRecordingView_cornerRadius];
  result = (id)swift_beginAccess();
  v5 = *v3;
  *v3 = a1;
  if (v5 != a1)
    return objc_msgSend(v1, sel_setNeedsLayout);
  return result;
}

id sub_18E74C63C(double *a1, void **a2)
{
  double v2;
  void *v3;
  double *v4;
  id result;
  double v6;

  v2 = *a1;
  v3 = *a2;
  v4 = (double *)((char *)*a2 + OBJC_IVAR___CKAudioMessageRecordingView_cornerRadius);
  result = (id)swift_beginAccess();
  v6 = *v4;
  *v4 = v2;
  if (v2 != v6)
    return objc_msgSend(v3, sel_setNeedsLayout);
  return result;
}

void (*sub_18E74C6AC(_QWORD *a1))(id **a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CKAudioMessageRecordingView_cornerRadius;
  v3[4] = v1;
  v3[5] = v4;
  v5 = (_QWORD *)(v1 + v4);
  swift_beginAccess();
  v3[3] = *v5;
  return sub_18E74C718;
}

void sub_18E74C718(id **a1)
{
  id *v1;
  double v2;
  char *v3;
  id v4;
  double v5;

  v1 = *a1;
  v2 = *((double *)*a1 + 3);
  v4 = (*a1)[4];
  v3 = (char *)(*a1)[5];
  v5 = *(double *)&v3[(_QWORD)v4];
  *(double *)&v3[(_QWORD)v4] = v2;
  if (v2 != v5)
    objc_msgSend(v1[4], sel_setNeedsLayout);
  free(v1);
}

uint64_t sub_18E74C7A8()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_isStopButtonHighlighted);
  swift_beginAccess();
  return *v1;
}

id sub_18E74C868(char a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE *v4;
  id result;
  int v6;

  v3 = a1 & 1;
  v4 = (_BYTE *)(v1 + OBJC_IVAR___CKAudioMessageRecordingView_isStopButtonHighlighted);
  result = (id)swift_beginAccess();
  v6 = *v4;
  *v4 = a1;
  if (v6 != (_DWORD)v3)
    return objc_msgSend(*(id *)(v1 + OBJC_IVAR___CKAudioMessageRecordingView_stopButton), sel_setHighlighted_, v3);
  return result;
}

id sub_18E74C8E4(unsigned __int8 *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  id result;
  int v6;

  v2 = *a1;
  v3 = *a2;
  v4 = (_BYTE *)(*a2 + OBJC_IVAR___CKAudioMessageRecordingView_isStopButtonHighlighted);
  result = (id)swift_beginAccess();
  v6 = *v4;
  *v4 = v2;
  if ((_DWORD)v2 != v6)
    return objc_msgSend(*(id *)(v3 + OBJC_IVAR___CKAudioMessageRecordingView_stopButton), sel_setHighlighted_, v2);
  return result;
}

void (*sub_18E74C960(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _BYTE *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CKAudioMessageRecordingView_isStopButtonHighlighted;
  v3[3] = v1;
  v3[4] = v4;
  v5 = (_BYTE *)(v1 + v4);
  swift_beginAccess();
  *((_BYTE *)v3 + 40) = *v5;
  return sub_18E74C9CC;
}

void sub_18E74C9CC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;

  v1 = *(_QWORD **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v4 = *(unsigned __int8 *)(*(_QWORD *)a1 + 40);
  v5 = *(unsigned __int8 *)(v3 + v2);
  *(_BYTE *)(v3 + v2) = v4;
  if (v4 != v5)
    objc_msgSend(*(id *)(v1[3] + OBJC_IVAR___CKAudioMessageRecordingView_stopButton), sel_setHighlighted_);
  free(v1);
}

double sub_18E74CA64()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CKAudioMessageRecordingView_playbackDuration;
  swift_beginAccess();
  return *(double *)v1;
}

id sub_18E74CAB4(double a1)
{
  return sub_18E74CC3C(&OBJC_IVAR___CKAudioMessageRecordingView_playbackDuration, a1);
}

uint64_t (*sub_18E74CAC0(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CKAudioMessageRecordingView_playbackDuration;
  v3[4] = v1;
  v3[5] = v4;
  v5 = (_QWORD *)(v1 + v4);
  swift_beginAccess();
  v3[3] = *v5;
  return sub_18E74CB2C;
}

double sub_18E74CB74()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CKAudioMessageRecordingView_playbackCurrentTime;
  swift_beginAccess();
  return *(double *)v1;
}

void sub_18E74CBC4(char *a1, double a2, uint64_t a3, _QWORD *a4)
{
  double *v6;
  double v7;
  char *v8;

  v6 = (double *)&a1[*a4];
  swift_beginAccess();
  v7 = *v6;
  *v6 = a2;
  if (v7 != a2)
  {
    v8 = a1;
    sub_18E74F7B8();

  }
}

id sub_18E74CC30(double a1)
{
  return sub_18E74CC3C(&OBJC_IVAR___CKAudioMessageRecordingView_playbackCurrentTime, a1);
}

id sub_18E74CC3C(_QWORD *a1, double a2)
{
  uint64_t v2;
  double *v4;
  id result;
  double v6;

  v4 = (double *)(v2 + *a1);
  result = (id)swift_beginAccess();
  v6 = *v4;
  *v4 = a2;
  if (v6 != a2)
    return sub_18E74F7B8();
  return result;
}

id sub_18E74CC98(double *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  double v5;
  double *v6;
  id result;
  double v8;

  v5 = *a1;
  v6 = (double *)(*a2 + *a5);
  result = (id)swift_beginAccess();
  v8 = *v6;
  *v6 = v5;
  if (v5 != v8)
    return sub_18E74F7B8();
  return result;
}

uint64_t (*sub_18E74CCF8(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CKAudioMessageRecordingView_playbackCurrentTime;
  v3[4] = v1;
  v3[5] = v4;
  v5 = (_QWORD *)(v1 + v4);
  swift_beginAccess();
  v3[3] = *v5;
  return sub_18E74CB2C;
}

void sub_18E74CD64(uint64_t a1)
{
  void *v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  double v5;

  v1 = *(void **)a1;
  v2 = *(double *)(*(_QWORD *)a1 + 24);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v5 = *(double *)(v4 + v3);
  *(double *)(v4 + v3) = v2;
  if (v2 != v5)
    sub_18E74F7B8();
  free(v1);
}

uint64_t sub_18E74CE20()
{
  swift_beginAccess();
  return sub_18E7669BC();
}

id AudioMessageRecordingView.backgroundView.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_backgroundView);
}

id sub_18E74CEE0()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_service);
  swift_beginAccess();
  return *v1;
}

void sub_18E74CFCC(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;
  id *v6;

  v3 = (void **)(v1 + OBJC_IVAR___CKAudioMessageRecordingView_service);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  v6 = (id *)(v1 + OBJC_IVAR___CKAudioMessageRecordingView_sendButton);
  swift_beginAccess();
  objc_msgSend(*v6, sel_setNeedsUpdateConfiguration);

}

void sub_18E74D060(void **a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  id *v7;

  v2 = *a1;
  v3 = *a2;
  v4 = (void **)(*a2 + OBJC_IVAR___CKAudioMessageRecordingView_service);
  swift_beginAccess();
  v5 = *v4;
  *v4 = v2;
  v6 = v2;

  v7 = (id *)(v3 + OBJC_IVAR___CKAudioMessageRecordingView_sendButton);
  swift_beginAccess();
  objc_msgSend(*v7, sel_setNeedsUpdateConfiguration);

}

id (*sub_18E74D0FC(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_18E74D144;
}

id sub_18E74D144(uint64_t a1, char a2)
{
  id result;
  id *v5;

  result = (id)swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v5 = (id *)(*(_QWORD *)(a1 + 24) + OBJC_IVAR___CKAudioMessageRecordingView_sendButton);
    swift_beginAccess();
    return objc_msgSend(*v5, sel_setNeedsUpdateConfiguration);
  }
  return result;
}

id AudioMessageRecordingView.stopButton.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_stopButton);
}

id sub_18E74D210()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_sendButton);
  swift_beginAccess();
  return *v1;
}

void sub_18E74D2B0(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___CKAudioMessageRecordingView_sendButton);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

void sub_18E74D300(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___CKAudioMessageRecordingView_sendButton);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t (*sub_18E74D360())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id AudioMessageRecordingView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id AudioMessageRecordingView.init(frame:)(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  char *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v17;
  id v18;
  char *v19;
  void *v20;
  id result;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  objc_super v39;

  *(_QWORD *)&v4[OBJC_IVAR___CKAudioMessageRecordingView_minimumWaveformWidth] = 0x403E000000000000;
  *(_QWORD *)&v4[OBJC_IVAR___CKAudioMessageRecordingView_stateChangeAnimationDuration] = 0x3FE3333333333333;
  *(_QWORD *)&v4[OBJC_IVAR___CKAudioMessageRecordingView_stateChangeSpringDamping] = 0x3FEB851EB851EB85;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v4[OBJC_IVAR___CKAudioMessageRecordingView_state] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___CKAudioMessageRecordingView_cornerRadius] = 0;
  v4[OBJC_IVAR___CKAudioMessageRecordingView_isStopButtonHighlighted] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___CKAudioMessageRecordingView_playbackDuration] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___CKAudioMessageRecordingView_playbackCurrentTime] = 0x7FF8000000000000;
  *(_QWORD *)&v4[OBJC_IVAR___CKAudioMessageRecordingView_lastIntensityTime] = 0;
  v9 = &v4[OBJC_IVAR___CKAudioMessageRecordingView_recordingStartTime];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v4[OBJC_IVAR___CKAudioMessageRecordingView_isScrubbing] = 0;
  v10 = &v4[OBJC_IVAR___CKAudioMessageRecordingView_scrubStartLocation];
  *v10 = 0;
  v10[1] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___CKAudioMessageRecordingView_scrubStartTime] = 0;
  v11 = &v4[OBJC_IVAR___CKAudioMessageRecordingView_scrubOffset];
  *v11 = 0;
  v11[1] = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v4[OBJC_IVAR___CKAudioMessageRecordingView_scrubScale] = _Q0;
  v17 = OBJC_IVAR___CKAudioMessageRecordingView_backgroundView;
  v18 = objc_allocWithZone(MEMORY[0x1E0CEABB0]);
  v19 = v4;
  *(_QWORD *)&v4[v17] = objc_msgSend(v18, sel_init);
  v20 = (void *)objc_opt_self();
  result = objc_msgSend(v20, sel_iMessageService);
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  *(_QWORD *)&v19[OBJC_IVAR___CKAudioMessageRecordingView_service] = result;
  v22 = OBJC_IVAR___CKAudioMessageRecordingView_durationAppendButton;
  type metadata accessor for AudioMessageRecordingAppendButton();
  *(_QWORD *)&v19[v22] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  result = objc_msgSend(v20, sel_iMessageService);
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v23 = result;
  v24 = OBJC_IVAR___CKAudioMessageRecordingView_closeButton;
  sub_18E62CEF0();
  v26 = v25;

  *(_QWORD *)&v19[v24] = v26;
  result = objc_msgSend(v20, sel_iMessageService);
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v27 = result;
  v28 = OBJC_IVAR___CKAudioMessageRecordingView_stopButton;
  sub_18E62D444();
  v30 = v29;

  *(_QWORD *)&v19[v28] = v30;
  result = objc_msgSend(v20, sel_iMessageService);
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v31 = result;
  v32 = OBJC_IVAR___CKAudioMessageRecordingView_playButton;
  v33 = sub_18E62D7CC();

  *(_QWORD *)&v19[v32] = v33;
  result = objc_msgSend(v20, sel_iMessageService);
  if (result)
  {
    v34 = result;
    v35 = OBJC_IVAR___CKAudioMessageRecordingView_sendButton;
    sub_18E62D1C0();
    v37 = v36;

    *(_QWORD *)&v19[v35] = v37;
    v38 = OBJC_IVAR___CKAudioMessageRecordingView_waveformView;
    type metadata accessor for AudioMessageRecordingWaveformView();
    *(_QWORD *)&v19[v38] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    *(_QWORD *)&v19[OBJC_IVAR___CKAudioMessageRecordingView_displayLink] = 0;

    v39.receiver = v19;
    v39.super_class = (Class)type metadata accessor for AudioMessageRecordingView();
    return objc_msgSendSuper2(&v39, sel_initWithFrame_, a1, a2, a3, a4);
  }
LABEL_11:
  __break(1u);
  return result;
}

char *AudioMessageRecordingView.__allocating_init(frame:service:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return AudioMessageRecordingView.init(frame:service:)(a1);
}

char *AudioMessageRecordingView.init(frame:service:)(void *a1)
{
  void *v1;
  char *v3;
  void **v4;
  void *v5;
  char *v6;
  id v7;
  void **v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[6];

  v3 = (char *)objc_msgSend(v1, sel_initWithFrame_);
  v4 = (void **)&v3[OBJC_IVAR___CKAudioMessageRecordingView_service];
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;
  v6 = v3;
  v7 = a1;

  v8 = (void **)&v6[OBJC_IVAR___CKAudioMessageRecordingView_sendButton];
  swift_beginAccess();
  v9 = *v8;
  v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v14[4] = sub_18E7501B4;
  v14[5] = v10;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 1107296256;
  v14[2] = sub_18E52243C;
  v14[3] = &block_descriptor_74;
  v11 = _Block_copy(v14);
  v12 = v9;
  swift_release();
  objc_msgSend(v12, sel_setConfigurationUpdateHandler_, v11);
  _Block_release(v11);

  sub_18E74DF44();
  return v6;
}

void sub_18E74D940()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;

  v1 = OBJC_IVAR___CKAudioMessageRecordingView_displayLink;
  if (!*(_QWORD *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_displayLink))
  {
    v2 = objc_msgSend((id)objc_opt_self(), sel_displayLinkWithTarget_selector_, v0, sel_displayLinkFiredFrom_);
    v3 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v2;

  }
}

void sub_18E74DA68()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = OBJC_IVAR___CKAudioMessageRecordingView_displayLink;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_displayLink), sel_invalidate);
  v2 = *(void **)(v0 + v1);
  *(_QWORD *)(v0 + v1) = 0;

}

id AudioMessageRecordingView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_18E74DB6C(void *a1, uint64_t a2)
{
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
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  id v18;
  id *v19;
  id v20;
  id v21;
  id v22;
  unsigned int v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0FA800);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v32 - v8;
  v10 = sub_18E7690A4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v14 = MEMORY[0x193FF501C](a2 + 16);
  if (!v14)
    return;
  v15 = (char *)v14;
  sub_18E7690BC();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {

    sub_18E00FA98((uint64_t)v9, &qword_1EE0FA800);
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
  v16 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
  if (!v16)
  {
    __break(1u);
    goto LABEL_21;
  }
  v17 = v16;
  v18 = objc_msgSend(v16, sel_theme);

  if (!v18)
  {
LABEL_21:
    __break(1u);
    return;
  }
  v19 = (id *)&v15[OBJC_IVAR___CKAudioMessageRecordingView_service];
  swift_beginAccess();
  v20 = objc_msgSend(v18, sel_sendButtonColorForColorType_, objc_msgSend(*v19, sel___ck_displayColor));

  if (objc_msgSend(a1, sel_isHighlighted))
  {
    if (v20)
      v21 = objc_msgSend(v20, sel_colorWithAlphaComponent_, 0.4);
    else
      v21 = 0;
  }
  else
  {
    v22 = v20;
    v21 = v20;
  }
  v23 = objc_msgSend(a1, sel_isEnabled);
  v33 = v21;
  if (v23)
  {
    v24 = v21;
  }
  else
  {
    v25 = objc_msgSend((id)objc_opt_self(), sel_systemGrayColor);
    v26 = objc_msgSend(v25, sel_colorWithAlphaComponent_, 0.1);

  }
  sub_18E769014();
  if (objc_msgSend(a1, sel_isHighlighted)
    && (v27 = objc_msgSend(a1, sel_traitCollection),
        v28 = objc_msgSend(v27, sel_userInterfaceStyle),
        v27,
        v28 == (id)2))
  {
    v29 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
    v30 = objc_msgSend(v29, sel_colorWithAlphaComponent_, 0.4);

  }
  else
  {
    v31 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  }
  sub_18E769020();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v6, v13, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  sub_18E7690C8();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

void sub_18E74DF44()
{
  char *v0;
  void *v1;
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char *v9;
  id v10;

  v1 = *(void **)&v0[OBJC_IVAR___CKAudioMessageRecordingView_closeButton];
  objc_msgSend(v0, sel_addSubview_, v1);
  v2 = *(void **)&v0[OBJC_IVAR___CKAudioMessageRecordingView_backgroundView];
  objc_msgSend(v0, sel_addSubview_, v2);
  v3 = (id *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_sendButton];
  swift_beginAccess();
  objc_msgSend(v2, sel_addSubview_, *v3);
  v4 = *(void **)&v0[OBJC_IVAR___CKAudioMessageRecordingView_playButton];
  objc_msgSend(v2, sel_addSubview_, v4);
  v5 = *(void **)&v0[OBJC_IVAR___CKAudioMessageRecordingView_stopButton];
  objc_msgSend(v2, sel_addSubview_, v5);
  v6 = *(_QWORD *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_durationAppendButton];
  objc_msgSend(v2, sel_addSubview_, v6);
  v7 = *(void **)&v0[OBJC_IVAR___CKAudioMessageRecordingView_waveformView];
  objc_msgSend(v2, sel_addSubview_, v7);
  objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v0, sel_closeFrom_, 0x2000);
  objc_msgSend(*v3, sel_addTarget_action_forControlEvents_, v0, sel_sendFrom_, 0x2000);
  objc_msgSend(v4, sel_addTarget_action_forControlEvents_, v0, sel_playFrom_, 0x2000);
  objc_msgSend(v5, sel_addTarget_action_forControlEvents_, v0, sel_stopFrom_, 0x2000);
  v8 = *(void **)(v6 + OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingAppendButton_durationButton);
  v9 = v0;
  objc_msgSend(v8, sel_addTarget_action_forControlEvents_, v9, sel_resumeFrom_, 0x2000);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEA730]), sel_initWithTarget_action_, v9, sel_scrubFrom_);

  objc_msgSend(v10, sel_setDelegate_, v9);
  objc_msgSend(v10, sel_setMinimumPressDuration_, 0.1);
  objc_msgSend(v10, sel_setAllowableMovement_, 1.79769313e308);
  objc_msgSend(v7, sel_addGestureRecognizer_, v10);

}

void sub_18E74E194()
{
  char *v0;
  void *v1;
  CGFloat v2;
  char *v3;
  double v4;
  objc_super v5;
  CGRect v6;
  CGRect v7;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for AudioMessageRecordingView();
  objc_msgSendSuper2(&v5, sel_layoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR___CKAudioMessageRecordingView_closeButton];
  objc_msgSend(v1, sel_sizeToFit);
  objc_msgSend(v1, sel_bounds);
  v2 = CGRectGetWidth(v6) * 0.5;
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setCenter_, v2, CGRectGetMidY(v7));
  v3 = &v0[OBJC_IVAR___CKAudioMessageRecordingView_state];
  swift_beginAccess();
  v4 = 0.0;
  if ((*(_QWORD *)v3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    v4 = 1.0;
  objc_msgSend(v1, sel_setAlpha_, v4);
  sub_18E74E298();
  sub_18E74E5A8();
  sub_18E74E718();
  sub_18E74E8D4();
  sub_18E74EC9C();
}

void sub_18E74E298()
{
  _BYTE *v0;
  double v1;
  _QWORD *v2;
  unint64_t v3;
  double Width;
  double v5;
  void *v6;
  double MaxX;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double MidX;
  void *v20;
  double MidY;
  id v22;
  double *v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  if (v0[OBJC_IVAR___CKAudioMessageRecordingView_isScrubbing])
    v1 = 1.02;
  else
    v1 = 1.0;
  v2 = &v0[OBJC_IVAR___CKAudioMessageRecordingView_state];
  swift_beginAccess();
  v3 = *v2 & 0xFFFFFFFFFFFFFFFELL;
  objc_msgSend(v0, sel_bounds);
  Width = CGRectGetWidth(v28);
  v5 = *(double *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_scrubScale];
  if (v3 != 2)
  {
    v20 = *(void **)&v0[OBJC_IVAR___CKAudioMessageRecordingView_backgroundView];
    objc_msgSend(v0, sel_bounds);
    MidX = CGRectGetMidX(v32);
    objc_msgSend(v0, sel_bounds);
    MidY = CGRectGetMidY(v33);
    goto LABEL_9;
  }
  v6 = *(void **)&v0[OBJC_IVAR___CKAudioMessageRecordingView_closeButton];
  objc_msgSend(v6, sel_bounds);
  MaxX = CGRectGetMaxX(v29);
  v8 = (void *)objc_opt_self();
  v9 = objc_msgSend(v8, sel_sharedBehaviors);
  if (!v9)
  {
    __break(1u);
    goto LABEL_13;
  }
  v10 = v9;
  objc_msgSend(v9, sel_audioRecordingViewButtonSpacing);
  v12 = v11;

  objc_msgSend(v6, sel_bounds);
  v13 = CGRectGetMaxX(v30);
  v14 = objc_msgSend(v8, sel_sharedBehaviors);
  if (!v14)
  {
LABEL_13:
    __break(1u);
    return;
  }
  v15 = v14;
  v16 = v1 * (Width * v5) - MaxX - v12;
  objc_msgSend(v14, sel_audioRecordingViewButtonSpacing);
  v18 = v17;

  MidX = v16 * 0.5 + v13 + v18;
  v20 = *(void **)&v0[OBJC_IVAR___CKAudioMessageRecordingView_backgroundView];
  objc_msgSend(v0, sel_bounds);
  MidY = CGRectGetHeight(v31) * 0.5;
LABEL_9:
  objc_msgSend(v20, sel_setCenter_, MidX, MidY);
  objc_msgSend(v0, sel_bounds);
  CGRectGetHeight(v34);
  objc_msgSend(v20, sel_bounds);
  objc_msgSend(v20, sel_setBounds_);
  v22 = objc_msgSend(v20, sel_layer);
  v23 = (double *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_cornerRadius];
  swift_beginAccess();
  v24 = *v23;
  objc_msgSend(v20, sel_bounds);
  v25 = CGRectGetHeight(v35) * 0.5;
  if (v25 >= v24)
    v25 = v24;
  objc_msgSend(v22, sel_setCornerRadius_, v25);

  v26 = objc_msgSend(v20, sel_layer);
  objc_msgSend(v26, sel_setCornerCurve_, *MEMORY[0x1E0CD2A68]);

  v27 = (void *)sub_18E74FE28();
  objc_msgSend(v20, sel_setBackgroundColor_, v27);

}

id sub_18E74E5A8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double MidY;
  _QWORD *v12;
  double v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v1 = *(void **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_playButton);
  v2 = *(void **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_backgroundView);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v1, sel_sizeThatFits_, v3, v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v2, sel_bounds);
  v9 = (CGRectGetHeight(v15) - v8) * 0.5;
  objc_msgSend(v2, sel_bounds);
  v10 = v6 * 0.5 + v9 + CGRectGetMinX(v16);
  objc_msgSend(v2, sel_bounds);
  MidY = CGRectGetMidY(v17);
  v12 = (_QWORD *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_state);
  swift_beginAccess();
  objc_msgSend(v1, sel_setSelected_, *v12 == 3);
  objc_msgSend(v1, sel_sizeToFit);
  objc_msgSend(v1, sel_setCenter_, v10, MidY);
  v13 = 0.0;
  if ((*v12 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v13 = 1.0;
    if (*(_BYTE *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_isScrubbing))
      v13 = 0.0;
  }
  return objc_msgSend(v1, sel_setAlpha_, v13);
}

id sub_18E74E718()
{
  uint64_t v0;
  void *v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double MidY;
  id *v12;
  _QWORD *v13;
  double v14;
  double v15;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v1 = *(void **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_stopButton);
  v2 = *(void **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_backgroundView);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v1, sel_sizeThatFits_, v3, v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v2, sel_bounds);
  v9 = (CGRectGetHeight(v17) - v8) * 0.5;
  objc_msgSend(v2, sel_bounds);
  v10 = CGRectGetMaxX(v18) - v9 - v6 * 0.5;
  objc_msgSend(v2, sel_bounds);
  MidY = CGRectGetMidY(v19);
  v12 = (id *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_sendButton);
  swift_beginAccess();
  objc_msgSend(*v12, sel_sizeToFit);
  objc_msgSend(*v12, sel_setCenter_, v10, MidY);
  v13 = (_QWORD *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_state);
  swift_beginAccess();
  v14 = 0.0;
  if ((*v13 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v14 = 1.0;
    if (*(_BYTE *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_isScrubbing))
      v14 = 0.0;
  }
  objc_msgSend(*v12, sel_setAlpha_, v14);
  objc_msgSend(v1, sel_sizeToFit);
  objc_msgSend(v1, sel_setCenter_, v10, MidY);
  v15 = 1.0;
  if (*v13 != 1)
    v15 = 0.0;
  return objc_msgSend(v1, sel_setAlpha_, v15);
}

void sub_18E74E8D4()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t *v3;
  char v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  id v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  double MaxX;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double MinX;
  id v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v1 = v0;
  v2 = *(_BYTE **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_durationAppendButton);
  sub_18E71FFC8((id)*MEMORY[0x1E0CEB558]);
  v3 = (uint64_t *)(v1 + OBJC_IVAR___CKAudioMessageRecordingView_state);
  swift_beginAccess();
  if (*v3 == 2)
    v4 = *(_BYTE *)(v1 + OBJC_IVAR___CKAudioMessageRecordingView_isScrubbing) ^ 1;
  else
    v4 = 0;
  v5 = &v2[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingAppendButton_isEnabled];
  swift_beginAccess();
  v6 = *v5;
  *v5 = v4 & 1;
  if ((v4 & 1) != v6)
  {
    v2[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingAppendButton_needsUpdateConfiguration] = 1;
    objc_msgSend(v2, sel_setNeedsLayout);
  }
  objc_msgSend(v2, sel_setHidden_, *v3 == 0);
  if ((unint64_t)*v3 >= 4)
    goto LABEL_18;
  v7 = *v3;
  v8 = objc_msgSend((id)objc_opt_self(), *off_1E276D3E8[v7]);
  sub_18E7201CC(v8);
  v9 = *(void **)(v1 + OBJC_IVAR___CKAudioMessageRecordingView_playButton);
  v10 = (id *)(v1 + OBJC_IVAR___CKAudioMessageRecordingView_sendButton);
  swift_beginAccess();
  v11 = *(void **)(v1 + OBJC_IVAR___CKAudioMessageRecordingView_backgroundView);
  v12 = *v10;
  objc_msgSend(v11, sel_bounds);
  objc_msgSend(v2, sel_sizeThatFits_, v13, v14);
  v30 = v12;
  objc_msgSend(v12, sel_frame);
  CGRectGetMinX(v31);
  objc_msgSend(v9, sel_frame);
  CGRectGetMaxX(v32);
  v15 = (void *)objc_opt_self();
  v16 = objc_msgSend(v15, sel_sharedBehaviors);
  if (v16)
  {
    v17 = v16;
    objc_msgSend(v16, sel_audioRecordingViewDurationSpacing);

    objc_msgSend(v2, sel_bounds);
    objc_msgSend(v2, sel_setBounds_);
    if ((unint64_t)*v3 <= 3 && (*(_BYTE *)(v1 + OBJC_IVAR___CKAudioMessageRecordingView_isScrubbing) & 1) == 0)
    {
      v24 = v30;
      objc_msgSend(v30, sel_frame);
      MinX = CGRectGetMinX(v35);
      v26 = objc_msgSend(v15, sel_sharedBehaviors);
      if (v26)
      {
        v27 = v26;
        objc_msgSend(v26, sel_audioRecordingViewDurationSpacing);
        v29 = v28;

        objc_msgSend(v2, (SEL)&selRef_baselineOffsetInLayoutManager_glyphIndex_);
        v23 = MinX - v29 + CGRectGetWidth(v36) * -0.5;
        goto LABEL_14;
      }
      goto LABEL_17;
    }
    objc_msgSend(v11, (SEL)&selRef_baselineOffsetInLayoutManager_glyphIndex_);
    MaxX = CGRectGetMaxX(v33);
    v19 = objc_msgSend(v15, sel_sharedBehaviors);
    if (v19)
    {
      v20 = v19;
      objc_msgSend(v19, sel_audioRecordingViewButtonSpacing);
      v22 = v21;

      objc_msgSend(v2, (SEL)&selRef_baselineOffsetInLayoutManager_glyphIndex_);
      v23 = MaxX - v22 - CGRectGetMidX(v34);
      v24 = v30;
LABEL_14:
      objc_msgSend(v11, (SEL)&selRef_baselineOffsetInLayoutManager_glyphIndex_);
      objc_msgSend(v2, sel_setCenter_, v23, CGRectGetMidY(v37));

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  sub_18E76941C();
  __break(1u);
}

void sub_18E74EC9C()
{
  uint64_t v0;
  void *v1;
  uint64_t *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double MinX;
  double Width;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  char *v21;
  double v22;
  double v23;
  _BOOL8 v24;
  uint64_t v25;
  id v26;
  void **v27;
  void *v28;
  id v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v1 = *(void **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_playButton);
  v2 = (uint64_t *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_state);
  swift_beginAccess();
  if ((*v2 & 0xFFFFFFFFFFFFFFFELL) == 2
    && (*(_BYTE *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_isScrubbing) & 1) == 0)
  {
    objc_msgSend(*(id *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_backgroundView), sel_bounds);
    MinX = CGRectGetMinX(v30);
    objc_msgSend(v1, sel_bounds);
    Width = CGRectGetWidth(v31);
    v9 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
    if (!v9)
    {
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    v10 = v9;
    v11 = MinX + Width;
    objc_msgSend(v9, sel_audioRecordingViewDurationSpacing);
    v13 = v12;

    v6 = v11 + v13 + v13;
  }
  else
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
    if (!v3)
    {
      __break(1u);
      goto LABEL_20;
    }
    v4 = v3;
    objc_msgSend(v3, sel_audioRecordingViewButtonSpacing);
    v6 = v5;

  }
  if ((unint64_t)*v2 > 3 || (*(_BYTE *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_isScrubbing) & 1) != 0)
  {
    v14 = (void *)objc_opt_self();
    v15 = objc_msgSend(v14, sel_sharedBehaviors);
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v15, sel_audioRecordingViewButtonSpacing);

      objc_msgSend(*(id *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_durationAppendButton), sel_bounds);
      CGRectGetWidth(v32);
      v17 = objc_msgSend(v14, sel_sharedBehaviors);
      if (v17)
      {
        v18 = v17;
        goto LABEL_14;
      }
      goto LABEL_21;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  objc_msgSend(*(id *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_backgroundView), sel_bounds);
  CGRectGetWidth(v33);
  objc_msgSend(*(id *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_durationAppendButton), sel_frame);
  CGRectGetMinX(v34);
  v19 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
  if (!v19)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v18 = v19;
LABEL_14:
  objc_msgSend(v18, sel_audioRecordingViewDurationSpacing);

  v20 = *(void **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_backgroundView);
  objc_msgSend(v20, sel_bounds);
  CGRectGetHeight(v35);
  v21 = *(char **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_waveformView);
  objc_msgSend(v20, sel_bounds);
  CGRectGetWidth(v36);
  objc_msgSend(v21, sel_bounds);
  objc_msgSend(v21, sel_setBounds_);
  objc_msgSend(v21, sel_bounds);
  v22 = v6 + CGRectGetMidX(v37);
  objc_msgSend(v20, sel_bounds);
  objc_msgSend(v21, sel_setCenter_, v22, CGRectGetMidY(v38));
  if (*v2)
  {
    objc_msgSend(v21, sel_bounds);
    v24 = v23 < 30.0;
  }
  else
  {
    v24 = 1;
  }
  objc_msgSend(v21, sel_setHidden_, v24);
  if ((unint64_t)*v2 < 4)
  {
    v25 = *v2;
    v26 = objc_msgSend((id)objc_opt_self(), *off_1E276D3E8[v25]);
    v27 = (void **)&v21[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_foregroundColor];
    swift_beginAccess();
    v28 = *v27;
    *v27 = v26;
    v29 = v26;

    objc_msgSend(v21, sel_setNeedsLayout);
    return;
  }
LABEL_24:
  sub_18E76941C();
  __break(1u);
}

void sub_18E74F0C8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  void *v9;

  v1 = *(void **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_playButton);
  v2 = *(void **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_backgroundView);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v1, sel_sizeThatFits_, v3, v4);
  v5 = *(void **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_stopButton);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v5, sel_sizeThatFits_, v6, v7);
  v8 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, sel_audioRecordingViewPadding);

  }
  else
  {
    __break(1u);
  }
}

void sub_18E74F29C()
{
  uint64_t v0;
  void *v1;
  id v2;
  double v3;
  double v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  BOOL v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  double v37;
  _BYTE *v38;
  double *v39;
  double v40;
  double *v41;
  double v42;
  char *v43;
  double v44;
  double *v45;
  double v46;
  char v47;
  char *v48;
  char v49;
  _QWORD *v50;
  unint64_t v51;
  _QWORD *v52;
  unint64_t v53;

  v1 = *(void **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_displayLink);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v2, sel_targetTimestamp);
    v4 = v3;
    v5 = (_QWORD *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_state);
    swift_beginAccess();
    if (*v5 != 1
      || (v6 = v0 + OBJC_IVAR___CKAudioMessageRecordingView_delegate,
          swift_beginAccess(),
          (v7 = (void *)MEMORY[0x193FF501C](v6)) == 0)
      || ((objc_msgSend(v7, sel_powerLevelForAudioMessageRecordingView_, v0),
           v9 = v8,
           swift_unknownObjectRelease(),
           (~*(_QWORD *)&v9 & 0x7FF0000000000000) == 0)
        ? (v10 = (*(_QWORD *)&v9 & 0xFFFFFFFFFFFFFLL) == 0)
        : (v10 = 1),
          !v10))
    {
LABEL_34:

      return;
    }
    v11 = (void *)objc_opt_self();
    v12 = objc_msgSend(v11, sel_sharedBehaviors);
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, sel_audioRecordingViewTimeBetweenWaveformSegments);
      v15 = v14;

      v16 = OBJC_IVAR___CKAudioMessageRecordingView_lastIntensityTime;
      v17 = (v4 - *(double *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_lastIntensityTime)) / v15;
      if (v17 < 1.0)
      {
LABEL_26:
        if ((*(_BYTE *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_recordingStartTime + 8) & 1) == 0)
        {
          v37 = *(double *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_recordingStartTime);
          v38 = *(_BYTE **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_durationAppendButton);
          v39 = (double *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_playbackDuration);
          swift_beginAccess();
          v40 = v4 - v37 + *v39;
          v41 = (double *)&v38[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingAppendButton_duration];
          swift_beginAccess();
          v42 = *v41;
          *v41 = v40;
          if (floor(v40) != floor(v42))
          {
            v38[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingAppendButton_needsUpdateConfiguration] = 1;
            objc_msgSend(v38, sel_setNeedsLayout);
          }
          v43 = *(char **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_waveformView);
          v44 = fmod(v17, 1.0);
          v45 = (double *)&v43[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_intensityOffset];
          swift_beginAccess();
          v46 = *v45;
          v47 = *((_BYTE *)v45 + 8);
          *v45 = v44;
          *((_BYTE *)v45 + 8) = 0;
          if ((v47 & 1) != 0 || v44 != v46)
            objc_msgSend(v43, sel_setNeedsLayout, v46, v53);
          v48 = &v43[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_fillAmount];
          swift_beginAccess();
          v49 = v48[8];
          *(_QWORD *)v48 = 0;
          v48[8] = 1;
          if ((v49 & 1) == 0)
            objc_msgSend(v43, sel_setNeedsLayout);
        }
        goto LABEL_34;
      }
      v18 = objc_msgSend(v11, sel_sharedBehaviors);
      if (v18)
      {
        v19 = v18;
        objc_msgSend(v18, sel_audioRecordingViewMinimumDBLevel);
        v21 = v20;

        v22 = objc_msgSend(v11, sel_sharedBehaviors);
        if (v22)
        {
          v23 = v22;
          objc_msgSend(v22, sel_audioRecordingViewMaximumDBLevel);
          v25 = v24;

          if (v25 >= v9)
            v26 = v9;
          else
            v26 = v25;
          if (v26 <= v21)
            v26 = v21;
          v27 = (v26 - v21) / (v25 - v21);
          v28 = *(char **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_waveformView);
          v29 = &v28[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_intensities];
          swift_beginAccess();
          v30 = *(_QWORD *)(*(_QWORD *)v29 + 16);
          if (v30)
          {
            v31 = *(_QWORD *)v29 + 32 + 8 * v30;
            v27 = v27 * 0.7 + *(double *)(v31 - 8) * 0.3;
            if (v30 != 1)
              v27 = v27 * 0.85 + *(double *)(v31 - 16) * 0.15;
          }
          swift_beginAccess();
          v32 = *(_QWORD **)v29;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)v29 = v32;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v32 = sub_18E5183F8(0, v32[2] + 1, 1, v32);
            *(_QWORD *)v29 = v32;
          }
          v34 = v32[2];
          v35 = v32[3];
          v36 = v34 + 1;
          if (v34 >= v35 >> 1)
          {
            v53 = v34 + 1;
            v50 = v32;
            v51 = v32[2];
            v52 = sub_18E5183F8((_QWORD *)(v35 > 1), v34 + 1, 1, v50);
            v34 = v51;
            v36 = v53;
            v32 = v52;
            *(_QWORD *)v29 = v52;
          }
          v32[2] = v36;
          *(double *)&v32[v34 + 4] = v27;
          swift_endAccess();
          objc_msgSend(v28, sel_setNeedsLayout);
          *(double *)(v0 + v16) = v4;
          goto LABEL_26;
        }
LABEL_38:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_38;
  }
}

id sub_18E74F7B8()
{
  uint64_t v0;
  uint64_t *v1;
  id result;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  double *v6;
  double v7;
  double *v8;
  double v9;
  char *v10;
  char *v11;
  char v12;
  double *v13;
  double v14;
  double v15;
  double *v16;
  double *v17;
  double v18;
  char v19;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_state);
  result = (id)swift_beginAccess();
  v3 = *v1;
  if ((unint64_t)*v1 >= 2)
  {
    if (v3 == 3)
    {
      v4 = *(_BYTE **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_durationAppendButton);
      v5 = OBJC_IVAR___CKAudioMessageRecordingView_playbackCurrentTime;
    }
    else
    {
      if (v3 != 2)
      {
        result = (id)sub_18E76941C();
        __break(1u);
        return result;
      }
      v4 = *(_BYTE **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_durationAppendButton);
      v5 = OBJC_IVAR___CKAudioMessageRecordingView_playbackDuration;
    }
    v6 = (double *)(v0 + v5);
    swift_beginAccess();
    v7 = *v6;
    v8 = (double *)&v4[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingAppendButton_duration];
    swift_beginAccess();
    v9 = *v8;
    *v8 = v7;
    if (floor(v7) != floor(v9))
    {
      v4[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingAppendButton_needsUpdateConfiguration] = 1;
      objc_msgSend(v4, sel_setNeedsLayout);
    }
    v10 = *(char **)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_waveformView);
    v11 = &v10[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_intensityOffset];
    swift_beginAccess();
    v12 = v11[8];
    *(_QWORD *)v11 = 0;
    v11[8] = 1;
    if ((v12 & 1) == 0)
      objc_msgSend(v10, sel_setNeedsLayout);
    v13 = (double *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_playbackDuration);
    swift_beginAccess();
    v14 = *v13;
    v15 = 0.0;
    if (*v13 > 0.0)
    {
      v16 = (double *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_playbackCurrentTime);
      swift_beginAccess();
      v15 = *v16 / v14;
    }
    v17 = (double *)&v10[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_fillAmount];
    result = (id)swift_beginAccess();
    v18 = *v17;
    v19 = *((_BYTE *)v17 + 8);
    *v17 = v15;
    *((_BYTE *)v17 + 8) = v14 <= 0.0;
    if (v14 <= 0.0)
    {
      if ((v19 & 1) != 0)
        return result;
      return objc_msgSend(v10, sel_setNeedsLayout, v18);
    }
    if (v15 != v18)
      v19 = 1;
    if ((v19 & 1) != 0)
      return objc_msgSend(v10, sel_setNeedsLayout, v18);
  }
  return result;
}

id sub_18E74FA00(uint64_t a1)
{
  uint64_t v1;
  char *v3;
  char *v4;

  v3 = *(char **)(v1 + OBJC_IVAR___CKAudioMessageRecordingView_waveformView);
  v4 = &v3[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_intensities];
  swift_beginAccess();
  *(_QWORD *)v4 = a1;
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  return objc_msgSend(v3, sel_setNeedsLayout);
}

id sub_18E74FB38(double a1)
{
  uint64_t v1;
  char *v3;
  char *v4;
  _QWORD *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  v3 = *(char **)(v1 + OBJC_IVAR___CKAudioMessageRecordingView_waveformView);
  v4 = &v3[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_intensities];
  swift_beginAccess();
  v5 = *(_QWORD **)v4;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v4 = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v5 = sub_18E5183F8(0, v5[2] + 1, 1, v5);
    *(_QWORD *)v4 = v5;
  }
  v8 = v5[2];
  v7 = v5[3];
  if (v8 >= v7 >> 1)
  {
    v5 = sub_18E5183F8((_QWORD *)(v7 > 1), v8 + 1, 1, v5);
    *(_QWORD *)v4 = v5;
  }
  v5[2] = v8 + 1;
  *(double *)&v5[v8 + 4] = a1;
  swift_endAccess();
  return objc_msgSend(v3, sel_setNeedsLayout);
}

id AudioMessageRecordingView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioMessageRecordingView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18E74FE28()
{
  uint64_t v0;
  _QWORD *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t result;
  uint64_t aBlock;
  uint64_t v8;
  id (*v9)(uint64_t, void *);
  void *v10;
  id (*v11)(void *);
  uint64_t v12;

  v1 = (_QWORD *)(v0 + OBJC_IVAR___CKAudioMessageRecordingView_state);
  swift_beginAccess();
  if ((unint64_t)(*v1 - 2) < 2)
  {
    v2 = objc_allocWithZone(MEMORY[0x1E0CEA478]);
    v11 = sub_18E74FFE8;
    v12 = 0;
    aBlock = MEMORY[0x1E0C809B0];
    v8 = 1107296256;
    v3 = &block_descriptor_18_3;
LABEL_5:
    v9 = sub_18E750120;
    v10 = v3;
    v4 = _Block_copy(&aBlock);
    v5 = objc_msgSend(v2, sel_initWithDynamicProvider_, v4);
    _Block_release(v4);
    swift_release();
    return (uint64_t)v5;
  }
  if (*v1 <= 1uLL)
  {
    v2 = objc_allocWithZone(MEMORY[0x1E0CEA478]);
    v11 = sub_18E74FF6C;
    v12 = 0;
    aBlock = MEMORY[0x1E0C809B0];
    v8 = 1107296256;
    v3 = &block_descriptor_21_5;
    goto LABEL_5;
  }
  result = sub_18E76941C();
  __break(1u);
  return result;
}

id sub_18E74FF6C(void *a1)
{
  _BOOL4 v1;
  id v2;
  id v3;

  v1 = objc_msgSend(a1, sel_userInterfaceStyle) == (id)2;
  v2 = objc_msgSend((id)objc_opt_self(), sel_systemRedColor);
  v3 = objc_msgSend(v2, sel_colorWithAlphaComponent_, dbl_18E7DFB70[v1]);

  return v3;
}

id sub_18E74FFE8(void *a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  double v6[2];

  v6[1] = *(double *)MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, sel_userInterfaceStyle) == (id)2)
    return objc_msgSend((id)objc_opt_self(), sel_quaternarySystemFillColor);
  v6[0] = 0.0;
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_quaternarySystemFillColor);
  objc_msgSend(v3, sel_getWhite_alpha_, 0, v6);

  v4 = objc_msgSend(v2, sel_quaternarySystemFillColor);
  v5 = objc_msgSend(v4, sel_colorWithAlphaComponent_, v6[0] * 0.5);

  return v5;
}

id sub_18E750120(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  void *v5;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t type metadata accessor for AudioMessageRecordingView()
{
  return objc_opt_self();
}

uint64_t sub_18E750190()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_18E7501B4(void *a1)
{
  uint64_t v1;

  sub_18E74DB6C(a1, v1);
}

void _s7ChatKit25AudioMessageRecordingViewC5coderACSgSo7NSCoderC_tcfc_0()
{
  _BYTE *v0;
  char *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  *(_QWORD *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_minimumWaveformWidth] = 0x403E000000000000;
  *(_QWORD *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_stateChangeAnimationDuration] = 0x3FE3333333333333;
  *(_QWORD *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_stateChangeSpringDamping] = 0x3FEB851EB851EB85;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_state] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_cornerRadius] = 0;
  v0[OBJC_IVAR___CKAudioMessageRecordingView_isStopButtonHighlighted] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_playbackDuration] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_playbackCurrentTime] = 0x7FF8000000000000;
  *(_QWORD *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_lastIntensityTime] = 0;
  v1 = &v0[OBJC_IVAR___CKAudioMessageRecordingView_recordingStartTime];
  *(_QWORD *)v1 = 0;
  v1[8] = 1;
  v0[OBJC_IVAR___CKAudioMessageRecordingView_isScrubbing] = 0;
  v2 = &v0[OBJC_IVAR___CKAudioMessageRecordingView_scrubStartLocation];
  *v2 = 0;
  v2[1] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_scrubStartTime] = 0;
  v3 = &v0[OBJC_IVAR___CKAudioMessageRecordingView_scrubOffset];
  *v3 = 0;
  v3[1] = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_scrubScale] = _Q0;
  v9 = OBJC_IVAR___CKAudioMessageRecordingView_backgroundView;
  *(_QWORD *)&v0[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEABB0]), sel_init);
  v10 = (void *)objc_opt_self();
  v11 = objc_msgSend(v10, sel_iMessageService);
  if (!v11)
    __break(1u);
  *(_QWORD *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_service] = v11;
  v12 = OBJC_IVAR___CKAudioMessageRecordingView_durationAppendButton;
  type metadata accessor for AudioMessageRecordingAppendButton();
  *(_QWORD *)&v0[v12] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v13 = objc_msgSend(v10, sel_iMessageService);
  if (!v13)
    __break(1u);
  v14 = v13;
  v15 = OBJC_IVAR___CKAudioMessageRecordingView_closeButton;
  sub_18E62CEF0();
  v17 = v16;

  *(_QWORD *)&v0[v15] = v17;
  v18 = objc_msgSend(v10, sel_iMessageService);
  if (!v18)
    __break(1u);
  v19 = v18;
  v20 = OBJC_IVAR___CKAudioMessageRecordingView_stopButton;
  sub_18E62D444();
  v22 = v21;

  *(_QWORD *)&v0[v20] = v22;
  v23 = objc_msgSend(v10, sel_iMessageService);
  if (!v23)
    __break(1u);
  v24 = v23;
  v25 = OBJC_IVAR___CKAudioMessageRecordingView_playButton;
  v26 = sub_18E62D7CC();

  *(_QWORD *)&v0[v25] = v26;
  v27 = objc_msgSend(v10, sel_iMessageService);
  if (!v27)
    __break(1u);
  v28 = v27;
  v29 = OBJC_IVAR___CKAudioMessageRecordingView_sendButton;
  sub_18E62D1C0();
  v31 = v30;

  *(_QWORD *)&v0[v29] = v31;
  v32 = OBJC_IVAR___CKAudioMessageRecordingView_waveformView;
  type metadata accessor for AudioMessageRecordingWaveformView();
  *(_QWORD *)&v0[v32] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  *(_QWORD *)&v0[OBJC_IVAR___CKAudioMessageRecordingView_displayLink] = 0;

  sub_18E769320();
  __break(1u);
}

unint64_t sub_18E7504C4()
{
  unint64_t result;

  result = qword_1EE112E18;
  if (!qword_1EE112E18)
  {
    result = MEMORY[0x193FF4E54](&protocol conformance descriptor for AudioMessageRecordingView.State, &type metadata for AudioMessageRecordingView.State);
    atomic_store(result, (unint64_t *)&qword_1EE112E18);
  }
  return result;
}

uint64_t sub_18E750508@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR___CKAudioMessageRecordingView_delegate;
  swift_beginAccess();
  result = MEMORY[0x193FF501C](v3);
  *a2 = result;
  return result;
}

uint64_t sub_18E75055C()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_18E7505B0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___CKAudioMessageRecordingView_state);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_18E750600(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v2 = *a1;
  v3 = (uint64_t *)(*a2 + OBJC_IVAR___CKAudioMessageRecordingView_state);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  sub_18E74C16C(v4);
}

double sub_18E75065C@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  double *v3;
  double result;

  v3 = (double *)(*a1 + OBJC_IVAR___CKAudioMessageRecordingView_cornerRadius);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_QWORD *)v3;
  return result;
}

uint64_t sub_18E7506B0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR___CKAudioMessageRecordingView_isStopButtonHighlighted);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

double sub_18E750704@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_11Tm(a1, &OBJC_IVAR___CKAudioMessageRecordingView_playbackDuration, a2);
}

id sub_18E750710(double *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_18E74CC98(a1, a2, a3, a4, &OBJC_IVAR___CKAudioMessageRecordingView_playbackDuration);
}

double sub_18E75072C@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_11Tm(a1, &OBJC_IVAR___CKAudioMessageRecordingView_playbackCurrentTime, a2);
}

id sub_18E750738(double *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_18E74CC98(a1, a2, a3, a4, &OBJC_IVAR___CKAudioMessageRecordingView_playbackCurrentTime);
}

id sub_18E750754@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR___CKAudioMessageRecordingView_service, a2);
}

id sub_18E750764@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR___CKAudioMessageRecordingView_sendButton, a2);
}

ValueMetadata *type metadata accessor for AudioMessageRecordingView.State()
{
  return &type metadata for AudioMessageRecordingView.State;
}

uint64_t method lookup function for AudioMessageRecordingView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudioMessageRecordingView.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.state.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.state.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.state.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.cornerRadius.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.cornerRadius.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.cornerRadius.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.isStopButtonHighlighted.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.isStopButtonHighlighted.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.isStopButtonHighlighted.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.playbackDuration.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.playbackDuration.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.playbackDuration.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.playbackCurrentTime.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.playbackCurrentTime.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.playbackCurrentTime.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.intensities.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.service.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x258))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.service.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.service.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x268))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.sendButton.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.sendButton.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x278))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.sendButton.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x280))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.setupDisplayLink()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.invalidateDisplayLink()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.set(intensities:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of AudioMessageRecordingView.addToWaveform(intensity:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2E0))();
}

uint64_t sub_18E750ABC()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_18E750AE0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_layoutIfNeeded);
}

ValueMetadata *type metadata accessor for BarShape()
{
  return &type metadata for BarShape;
}

_QWORD *assignWithCopy for BarActionButtonButtonStyle(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for BarActionButtonButtonStyle()
{
  return &type metadata for BarActionButtonButtonStyle;
}

uint64_t sub_18E750B84()
{
  return sub_18E514BB4(&qword_1EE112E20, &qword_1EE112E28, MEMORY[0x1E0CD8668]);
}

double sub_18E750BB0@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  id v6;
  id v7;
  double result;
  __int128 v9;
  __int128 v10;
  char v11;

  v6 = objc_msgSend((id)objc_opt_self(), sel_bezierPathWithRoundedRect_byRoundingCorners_cornerRadii_, 3, a2, a3, a4, a5, 40.0, 40.0);
  v7 = objc_msgSend(v6, sel_CGPath);

  sub_18E767C40();
  result = *(double *)&v9;
  *(_OWORD *)a1 = v9;
  *(_OWORD *)(a1 + 16) = v10;
  *(_BYTE *)(a1 + 32) = v11;
  return result;
}

uint64_t sub_18E750C7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x1E0CE0590];
  v3 = sub_18E76857C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_18E750CC4()
{
  sub_18E750FEC();
  return sub_18E768204();
}

uint64_t sub_18E750D14()
{
  sub_18E750FEC();
  return sub_18E7681D4();
}

uint64_t sub_18E750D64()
{
  sub_18E750FEC();
  return sub_18E7681EC();
}

unint64_t sub_18E750DA0()
{
  unint64_t result;

  result = qword_1EE112E30;
  if (!qword_1EE112E30)
  {
    result = MEMORY[0x193FF4E54](&unk_18E7DFCEC, &type metadata for BarShape);
    atomic_store(result, (unint64_t *)&qword_1EE112E30);
  }
  return result;
}

unint64_t sub_18E750DE8()
{
  unint64_t result;

  result = qword_1EE112E38;
  if (!qword_1EE112E38)
  {
    result = MEMORY[0x193FF4E54](&unk_18E7DFC9C, &type metadata for BarShape);
    atomic_store(result, (unint64_t *)&qword_1EE112E38);
  }
  return result;
}

uint64_t sub_18E750E2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E750E3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  __n128 v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v23 = a4;
  v7 = sub_18E767484();
  v21 = *(_QWORD *)(v7 - 8);
  v22 = v7;
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_18E76785C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112838);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v11 + 16))(v13, a1, v10, v16);
  if (a2)
    v19 = a2;
  else
    v19 = sub_18E768054();
  v24 = v19;
  swift_retain();
  if (!a3)
    sub_18E7680C0();
  (*(void (**)(char *, _QWORD, uint64_t))(v21 + 104))(v9, *MEMORY[0x1E0CDABD8], v22);
  swift_retain();
  sub_18E7677C0();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v23, v18, v14);
}

uint64_t sub_18E750FE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_18E750E3C(a1, *v2, v2[1], a2);
}

unint64_t sub_18E750FEC()
{
  unint64_t result;

  result = qword_1EE112E40;
  if (!qword_1EE112E40)
  {
    result = MEMORY[0x193FF4E54](&unk_18E7DFD3C, &type metadata for BarShape);
    atomic_store(result, (unint64_t *)&qword_1EE112E40);
  }
  return result;
}

uint64_t sub_18E751030()
{
  return sub_18E514BB4(&qword_1EE112830, &qword_1EE112838, MEMORY[0x1E0CDC060]);
}

uint64_t destroy for MessageInspectorView(id *a1)
{

  return swift_release();
}

_QWORD *_s7ChatKit20MessageInspectorViewVwCP_0(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  a1[2] = *(_QWORD *)(a2 + 16);
  v5 = v3;
  v6 = v4;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MessageInspectorView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for MessageInspectorView(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for MessageInspectorView()
{
  return &type metadata for MessageInspectorView;
}

uint64_t sub_18E7511A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E7511B0@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  uint64_t (*v12)();
  uint64_t (**v13)();
  id v14;
  id v15;
  _BYTE v17[16];
  void *v18;
  void *v19;
  uint64_t v20;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112E48);
  MEMORY[0x1E0C80A78](v8);
  v10 = (uint64_t *)&v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *v10 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10CA20);
  swift_storeEnumTagMultiPayload();
  v11 = (uint64_t *)((char *)v10 + *(int *)(v8 + 36));
  *v11 = 0x6567617373654DLL;
  v11[1] = 0xE700000000000000;
  v18 = a1;
  v19 = a2;
  v20 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112E50);
  sub_18E514BB4(&qword_1EE112E58, &qword_1EE112E50, MEMORY[0x1E0CE0680]);
  sub_18E767BB0();
  v12 = (uint64_t (*)())swift_allocObject();
  *((_QWORD *)v12 + 2) = a1;
  *((_QWORD *)v12 + 3) = a2;
  *((_QWORD *)v12 + 4) = a3;
  sub_18E7517F4((uint64_t)v10, a4);
  v13 = (uint64_t (**)())(a4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE112E60) + 36));
  *v13 = sub_18E7517E8;
  v13[1] = v12;
  v13[2] = 0;
  v13[3] = 0;
  swift_retain();
  v14 = a1;
  v15 = a2;
  return sub_18E75183C((uint64_t)v10);
}

void sub_18E751340(void *a1@<X0>, unint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  void *v3;
  uint64_t v4;
  void *v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
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
  void *v40;

  v6 = a1;
  v8 = objc_msgSend(a1, sel_guid);
  if (!v8)
    goto LABEL_18;
  v3 = v8;
  v4 = sub_18E768984();
  v10 = v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112E68);
  sub_18E76821C();
  a2 = (unint64_t)v40;
  v38 = v4;
  if (!v40)
  {
    v4 = 0;
    v3 = 0;
    v22 = 0;
    v13 = 0;
    v35 = 0;
    v18 = 0;
    v20 = 0;
    goto LABEL_14;
  }
  v11 = objc_msgSend(v40, sel_guid);

  v39 = sub_18E768984();
  v13 = v12;

  a2 = (unint64_t)sub_18E751BF8(v6);
  if (!(a2 >> 62))
  {
    if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_5;
LABEL_12:
    swift_bridgeObjectRelease();
    v21 = 0;
    a2 = 0;
    v18 = 0;
    v20 = 0;
    goto LABEL_13;
  }
  if (!sub_18E769338())
    goto LABEL_12;
LABEL_5:
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v14 = v6;
      v15 = *(id *)(a2 + 32);
      goto LABEL_8;
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    sub_18E751D84(v4, (uint64_t)v3, v39, v37, v35, a2);
    __break(1u);
    goto LABEL_20;
  }
  v14 = v6;
  v15 = (id)MEMORY[0x193FF25B0](0, a2);
LABEL_8:
  v16 = v15;
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v16, sel_guid);

  if (v17)
  {
    v18 = sub_18E768984();
    v20 = v19;

    a2 = 0x800000018E81D7F0;
    v6 = v14;
    v21 = 0xD000000000000012;
LABEL_13:
    sub_18E7669BC();
    sub_18E7669BC();
    sub_18E63CDA0(v21, a2);
    v35 = v21;
    sub_18E63CDD0(v21, a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v4 = 0x4955472074616843;
    v3 = (void *)0xE900000000000044;
    v22 = v39;
LABEL_14:
    v36 = v18;
    v37 = v13;
    v39 = v22;
    v23 = objc_msgSend(v6, sel_sender);
    if (v23)
    {
      v24 = v23;
      v25 = objc_msgSend(v23, sel_ID);

      v26 = sub_18E768984();
      v33 = v27;
      v34 = v26;

      v28 = objc_msgSend(v6, sel_description);
      v29 = sub_18E768984();
      v31 = v30;
      v32 = v29;

      *a3 = 1145656647;
      a3[1] = 0xE400000000000000;
      a3[2] = v38;
      a3[3] = v10;
      a3[4] = v4;
      a3[5] = v3;
      a3[6] = v39;
      a3[7] = v13;
      a3[8] = v35;
      a3[9] = a2;
      a3[10] = v36;
      a3[11] = v20;
      a3[12] = 0x49207265646E6553;
      a3[13] = 0xE900000000000044;
      a3[14] = v34;
      a3[15] = v33;
      a3[16] = 0x7470697263736544;
      a3[17] = 0xEB000000006E6F69;
      a3[18] = v32;
      a3[19] = v31;
      sub_18E7669BC();
      sub_18E7669BC();
      sub_18E751DE8(v4, (uint64_t)v3, v39, v13, v35, a2);
      sub_18E7669BC();
      swift_bridgeObjectRelease();
      sub_18E751D84(v4, (uint64_t)v3, v39, v13, v35, a2);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    goto LABEL_19;
  }
LABEL_20:
  __break(1u);
}

uint64_t sub_18E751748(void *a1)
{
  sub_18E75187C(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112E68);
  return sub_18E768228();
}

uint64_t sub_18E751798@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_18E7511B0(*(void **)v1, *(void **)(v1 + 8), *(_QWORD *)(v1 + 16), a1);
}

void sub_18E7517A8(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_18E751340(*(void **)(v1 + 16), *(_QWORD *)(v1 + 32), a1);
}

uint64_t sub_18E7517B4()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18E7517E8()
{
  uint64_t v0;

  return sub_18E751748(*(void **)(v0 + 16));
}

uint64_t sub_18E7517F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112E48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18E75183C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112E48);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_18E75187C(void *a1)
{
  id v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char **v7;
  id v8;
  BOOL v9;
  unint64_t v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char **v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  unint64_t v37;
  unint64_t v38;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedRegistry);
  v2 = objc_msgSend(v1, sel_cachedChats);

  sub_18E00F31C(0, &qword_1EE111760);
  v3 = sub_18E768AE0();

  if (v3 >> 62)
    goto LABEL_40;
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_3:
  v5 = 0;
  v6 = v3 & 0xC000000000000001;
  v29 = v3 + 32;
  v30 = v3 & 0xFFFFFFFFFFFFFF8;
  v7 = &selRef_fullScreenBalloonViewControllerRequestShowKeyboardSnapshot_;
  v32 = v4;
  v33 = v3;
  v31 = v3 & 0xC000000000000001;
  while (v6)
  {
    v8 = (id)MEMORY[0x193FF25B0](v5, v3);
    v9 = __OFADD__(v5, 1);
    v10 = v5 + 1;
    if (v9)
    {
LABEL_39:
      __break(1u);
LABEL_40:
      sub_18E7669BC();
      v4 = sub_18E769338();
      swift_bridgeObjectRelease();
      if (!v4)
        goto LABEL_41;
      goto LABEL_3;
    }
LABEL_11:
    v34 = v10;
    v35 = v8;
    v11 = objc_msgSend(v8, sel__items, v29);
    sub_18E00F31C(0, &qword_1EE112E70);
    v12 = sub_18E768AE0();

    if (v12 >> 62)
    {
      sub_18E7669BC();
      v13 = sub_18E769338();
      swift_bridgeObjectRelease();
      if (!v13)
        goto LABEL_4;
LABEL_13:
      v37 = v12;
      v38 = v12 & 0xC000000000000001;
      v3 = 4;
      while (2)
      {
        if (v38)
          v14 = (id)MEMORY[0x193FF25B0](v3 - 4, v12);
        else
          v14 = *(id *)(v12 + 8 * v3);
        v15 = v14;
        v16 = v3 - 3;
        if (__OFADD__(v3 - 4, 1))
        {
          __break(1u);
          goto LABEL_39;
        }
        v17 = objc_msgSend(v14, v7[230]);
        if (v17)
        {
          v18 = v17;
          v19 = sub_18E768984();
          v21 = v20;

        }
        else
        {
          v19 = 0;
          v21 = 0;
        }
        v22 = v7;
        v23 = objc_msgSend(a1, v7[230]);
        if (v23)
        {
          v24 = v23;
          v25 = sub_18E768984();
          v27 = v26;

          if (v21)
          {
            v12 = v37;
            if (v27)
            {
              if (v19 == v25 && v21 == v27)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
LABEL_36:

LABEL_37:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                return;
              }
              v28 = sub_18E7693F8();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();

              if ((v28 & 1) != 0)
                goto LABEL_37;
              goto LABEL_16;
            }
LABEL_32:

          }
          else
          {

            v12 = v37;
            if (!v27)
              goto LABEL_37;
          }
          swift_bridgeObjectRelease();
LABEL_16:
          ++v3;
          v7 = v22;
          if (v16 == v13)
            goto LABEL_4;
          continue;
        }
        break;
      }
      v12 = v37;
      if (!v21)
        goto LABEL_36;
      goto LABEL_32;
    }
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v13)
      goto LABEL_13;
LABEL_4:

    swift_bridgeObjectRelease();
    v3 = v33;
    v5 = v34;
    v6 = v31;
    if (v34 == v32)
      goto LABEL_41;
  }
  if (v5 < *(_QWORD *)(v30 + 16))
  {
    v8 = *(id *)(v29 + 8 * v5);
    v9 = __OFADD__(v5, 1);
    v10 = v5 + 1;
    if (v9)
      goto LABEL_39;
    goto LABEL_11;
  }
  __break(1u);
}

id sub_18E751BF8(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id result;
  void *v9;
  void *v10;
  id v11;

  v1 = objc_msgSend(a1, sel_fileTransferGUIDs);
  v2 = MEMORY[0x1E0DEE9D8];
  if (!v1)
    return (id)v2;
  v3 = v1;
  v4 = sub_18E768AE0();

  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return (id)v2;
  }
  v6 = (void *)objc_opt_self();
  sub_18E7669BC();
  v7 = v4 + 40;
  while (1)
  {
    sub_18E7669BC();
    result = objc_msgSend(v6, sel_sharedInstance);
    if (!result)
      break;
    v9 = result;
    v10 = (void *)sub_18E768954();
    v11 = objc_msgSend(v9, sel_transferForGUID_, v10);
    swift_bridgeObjectRelease();

    if (v11)
    {
      MEMORY[0x193FF1E18]();
      if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_18E768B04();
      sub_18E768B28();
      sub_18E768AF8();
    }
    v7 += 16;
    if (!--v5)
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_18E751D84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_18E63CDD0(a5, a6);
  }
  return result;
}

uint64_t sub_18E751DE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  if (a2)
  {
    sub_18E7669BC();
    sub_18E7669BC();
    return sub_18E63CDA0(a5, a6);
  }
  return result;
}

unint64_t sub_18E751E50()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE112E78;
  if (!qword_1EE112E78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112E60);
    v2[0] = sub_18E514BB4(&qword_1EE112E80, &qword_1EE112E48, (uint64_t)&unk_18E7D6BE8);
    v2[1] = MEMORY[0x1E0CDC8B0];
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE112E78);
  }
  return result;
}

void sub_18E751ED4(id a1, char a2)
{
  char *v2;
  void *v3;
  id *v5;
  void *v6;
  id v7;
  id v8;
  char v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  id v15;

  v3 = v2;
  v5 = (id *)&v2[OBJC_IVAR___CKBalloonShapeView_drawingMode];
  v6 = *(void **)&v2[OBJC_IVAR___CKBalloonShapeView_drawingMode];
  if ((a2 & 1) != 0)
  {
    if ((v2[OBJC_IVAR___CKBalloonShapeView_drawingMode + 8] & 1) == 0
      || (sub_18E00F31C(0, (unint64_t *)&qword_1EE0FB950),
          v11 = v6,
          v12 = a1,
          v13 = sub_18E768F54(),
          v11,
          v12,
          (v13 & 1) == 0))
    {
      objc_msgSend(a1, sel_removeFromSuperlayer);
LABEL_8:
      if (*((_BYTE *)v5 + 8) == 1)
      {
        v14 = *v5;
        v15 = objc_msgSend(v3, sel_layer);
        objc_msgSend(v15, sel_addSublayer_, v14);

      }
    }
  }
  else if ((v2[OBJC_IVAR___CKBalloonShapeView_drawingMode + 8] & 1) != 0
         || (sub_18E00F31C(0, (unint64_t *)&qword_1EE0FB950),
             v7 = v6,
             v8 = a1,
             v9 = sub_18E768F54(),
             v7,
             v8,
             (v9 & 1) == 0))
  {
    v10 = objc_msgSend(v3, sel_layer);
    objc_msgSend(v10, sel_setContents_, 0);

    goto LABEL_8;
  }
}

void sub_18E75214C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  char v6;
  char *v7;
  unsigned int v8;
  uint64_t (*v9)(__int16 *);
  char v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  __int128 v17;
  void *v18;
  char *v19;
  void *v20;
  char v21;
  id v22;
  char *v23;
  void *v24;
  char v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int16 v36;
  char v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  objc_class *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  char *v50;
  id v51;
  id v52;
  void *v53;
  char v54;
  id v55;
  uint64_t v56;
  int v57;
  int v58;
  int v59;
  int v60;
  uint64_t v61;
  __int128 v62;
  objc_super v63;
  __int16 v64;
  char v65;
  char v66;
  uint64_t v67;
  char v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  char v72;
  char v73;
  char v74;
  char v75;

  v1 = v0;
  v2 = sub_18E7686F0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (uint64_t *)((char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FB910);
  *v5 = sub_18E768E1C();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DEF740], v2);
  v6 = sub_18E768714();
  (*(void (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
  {
    __break(1u);
LABEL_9:
    sub_18E769320();
    __break(1u);
    return;
  }
  objc_msgSend(v1, sel_setNeedsLayout);
  v7 = &v1[OBJC_IVAR___CKBalloonShapeView_descriptor];
  v8 = v1[OBJC_IVAR___CKBalloonShapeView_descriptor + 2];
  if (v8 < 3)
  {
    v9 = *(uint64_t (**)(__int16 *))&v1[OBJC_IVAR___CKBalloonShapeView_imageGenerator];
    v10 = v7[3];
    v11 = *((_QWORD *)v7 + 1);
    v12 = v7[16];
    v13 = v7[72];
    v14 = v7[73];
    v15 = v7[74];
    v16 = v7[75];
    v64 = *(_WORD *)v7;
    v65 = v8;
    v66 = v10;
    v67 = v11;
    v68 = v12;
    v17 = *(_OWORD *)(v7 + 40);
    v69 = *(_OWORD *)(v7 + 24);
    v70 = v17;
    v71 = *(_OWORD *)(v7 + 56);
    v72 = v13;
    v73 = v14;
    v74 = v15;
    v75 = v16;
    v18 = (void *)v9(&v64);
    v19 = &v1[OBJC_IVAR___CKBalloonShapeView_drawingMode];
    v20 = *(void **)&v1[OBJC_IVAR___CKBalloonShapeView_drawingMode];
    v21 = v1[OBJC_IVAR___CKBalloonShapeView_drawingMode + 8];
    *(_QWORD *)v19 = v18;
    v19[8] = 0;
    v22 = v18;
    sub_18E751ED4(v20, v21);

    return;
  }
  if (v8 - 3 >= 2)
    goto LABEL_9;
  v23 = &v1[OBJC_IVAR___CKBalloonShapeView_drawingMode];
  if ((v1[OBJC_IVAR___CKBalloonShapeView_drawingMode + 8] & 1) != 0)
  {
    v24 = *(void **)v23;
    v25 = v7[3];
    v26 = *((_QWORD *)v7 + 1);
    v27 = v7[16];
    v28 = v7[72];
    v29 = v7[73];
    v30 = v7[74];
    v31 = v7[75];
    v32 = *(_QWORD *)v23 + OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor;
    v33 = *(_OWORD *)(v7 + 24);
    v34 = *(_OWORD *)(v7 + 40);
    v35 = *(_OWORD *)(v7 + 56);
    *(_WORD *)v32 = *(_WORD *)v7;
    *(_BYTE *)(v32 + 2) = v8;
    *(_BYTE *)(v32 + 3) = v25;
    *(_QWORD *)(v32 + 8) = v26;
    *(_BYTE *)(v32 + 16) = v27;
    *(_OWORD *)(v32 + 24) = v33;
    *(_OWORD *)(v32 + 40) = v34;
    *(_OWORD *)(v32 + 56) = v35;
    *(_BYTE *)(v32 + 72) = v28;
    *(_BYTE *)(v32 + 73) = v29;
    *(_BYTE *)(v32 + 74) = v30;
    *(_BYTE *)(v32 + 75) = v31;
    objc_msgSend(v24, sel_setNeedsDisplay);
  }
  else
  {
    v36 = *(_WORD *)v7;
    v37 = v7[3];
    v38 = *((_QWORD *)v7 + 1);
    v39 = v7[16];
    v62 = *(_OWORD *)(v7 + 24);
    v40 = *((_QWORD *)v7 + 5);
    v41 = *((_QWORD *)v7 + 6);
    v42 = *((_QWORD *)v7 + 7);
    v61 = *((_QWORD *)v7 + 8);
    v43 = v7[72];
    v59 = v7[73];
    v60 = v43;
    v58 = v7[74];
    v57 = v7[75];
    v44 = *(_QWORD *)&v1[OBJC_IVAR___CKBalloonShapeView_configuration];
    v45 = *(_QWORD *)&v1[OBJC_IVAR___CKBalloonShapeView_configuration + 8];
    v46 = (objc_class *)type metadata accessor for BalloonShapeLayer();
    v47 = (char *)objc_allocWithZone(v46);
    v48 = &v47[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor];
    *(_WORD *)v48 = v36;
    v48[2] = v8;
    v48[3] = v37;
    *((_QWORD *)v48 + 1) = v38;
    v48[16] = v39;
    *(_OWORD *)(v48 + 24) = v62;
    *((_QWORD *)v48 + 5) = v40;
    *((_QWORD *)v48 + 6) = v41;
    v49 = v61;
    *((_QWORD *)v48 + 7) = v42;
    *((_QWORD *)v48 + 8) = v49;
    v48[72] = v60;
    v48[73] = v59;
    v48[74] = v58;
    v48[75] = v57;
    v50 = &v47[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_config];
    *(_QWORD *)v50 = v44;
    *((_QWORD *)v50 + 1) = v45;
    v63.receiver = v47;
    v63.super_class = v46;
    sub_18E7669BC();
    v51 = objc_msgSendSuper2(&v63, sel_init);
    objc_msgSend(v51, sel_setNeedsDisplayOnBoundsChange_, 1);
    v52 = v51;
    objc_msgSend(v1, sel_frame);
    objc_msgSend(v52, sel_setFrame_);

    v53 = *(void **)v23;
    v54 = v23[8];
    *(_QWORD *)v23 = v52;
    v23[8] = 1;
    v55 = v52;
    sub_18E751ED4(v53, v54);

  }
}

id sub_18E7526F4(int *a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  uint64_t (*v4)(uint64_t, int *);
  uint8x8_t v5;
  int16x8_t v6;
  int v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  unsigned __int32 v14;

  v2 = *((_QWORD *)a1 + 1);
  v3 = *((_BYTE *)a1 + 16);
  v4 = *(uint64_t (**)(uint64_t, int *))(a2 + 16);
  v8 = *a1;
  v9 = v2;
  v10 = v3;
  v11 = *(_OWORD *)(a1 + 6);
  v12 = *(_OWORD *)(a1 + 10);
  v13 = *(_OWORD *)(a1 + 14);
  v5.i32[1] = DWORD1(v13);
  v5.i32[0] = a1[18];
  v6 = (int16x8_t)vmovl_u8(v5);
  v6.i64[0] &= 0xFF01FF01FF01FF01;
  v14 = vmovn_s16(v6).u32[0];
  return (id)v4(a2, &v8);
}

uint64_t sub_18E752764(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4, double a5)
{
  char *v5;
  char *v6;
  uint64_t ObjectType;
  char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char *v17;
  char *v18;
  BOOL v19;
  unsigned int v20;
  char *v21;
  uint64_t v22;
  char *v23;
  id v24;
  objc_class *v25;
  char *v26;
  char *v27;
  __int128 v28;
  __int128 v29;
  char *v30;
  char *v31;
  char *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t result;
  objc_super v47;
  objc_super v48;

  v6 = v5;
  ObjectType = swift_getObjectType();
  v13 = &v6[OBJC_IVAR___CKBalloonShapeView_descriptor];
  v14 = *(_OWORD *)(a1 + 16);
  v15 = *(_OWORD *)(a1 + 48);
  v16 = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v13 + 2) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v13 + 3) = v15;
  *((_OWORD *)v13 + 4) = v16;
  *(_OWORD *)v13 = *(_OWORD *)a1;
  *((_OWORD *)v13 + 1) = v14;
  v17 = &v6[OBJC_IVAR___CKBalloonShapeView_configuration];
  *(double *)v17 = a5;
  *((_QWORD *)v17 + 1) = a2;
  v18 = &v6[OBJC_IVAR___CKBalloonShapeView_imageGenerator];
  *(_QWORD *)v18 = a3;
  *((_QWORD *)v18 + 1) = a4;
  LODWORD(v18) = *(unsigned __int8 *)(a1 + 2);
  v19 = v18 >= 3;
  v20 = (_DWORD)v18 - 3;
  if (v19)
  {
    if (v20 >= 2)
    {
      result = sub_18E769320();
      __break(1u);
      return result;
    }
    v25 = (objc_class *)type metadata accessor for BalloonShapeLayer();
    v26 = (char *)objc_allocWithZone(v25);
    v27 = &v26[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor];
    v28 = *(_OWORD *)(a1 + 48);
    *((_OWORD *)v27 + 2) = *(_OWORD *)(a1 + 32);
    *((_OWORD *)v27 + 3) = v28;
    *((_OWORD *)v27 + 4) = *(_OWORD *)(a1 + 64);
    v29 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)v27 = *(_OWORD *)a1;
    *((_OWORD *)v27 + 1) = v29;
    v30 = &v26[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_config];
    *(double *)v30 = a5;
    *((_QWORD *)v30 + 1) = a2;
    v48.receiver = v26;
    v48.super_class = v25;
    v31 = v6;
    swift_retain();
    sub_18E7669BC();
    v24 = objc_msgSendSuper2(&v48, sel_init);
    objc_msgSend(v24, sel_setNeedsDisplayOnBoundsChange_, 1);
    v32 = &v31[OBJC_IVAR___CKBalloonShapeView_drawingMode];
    *(_QWORD *)v32 = v24;
    v32[8] = 1;
    v33 = v24;

  }
  else
  {
    v21 = v6;
    swift_retain();
    v22 = a3(a1);
    v23 = &v21[OBJC_IVAR___CKBalloonShapeView_drawingMode];
    *(_QWORD *)v23 = v22;
    v23[8] = 0;

    v24 = 0;
  }
  v47.receiver = v6;
  v47.super_class = (Class)CKBalloonShapeView;
  v34 = objc_msgSendSuper2(&v47, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v35 = v34;
  if (v24)
  {
    v36 = v34;
    v37 = v24;
    v38 = objc_msgSend(v36, sel_layer);
    objc_msgSend(v38, sel_addSublayer_, v37);

  }
  else
  {
    v39 = v34;
    v37 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECF63C80);
  v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_18E7CE760;
  v41 = sub_18E766818();
  v42 = MEMORY[0x1E0CE9C40];
  *(_QWORD *)(v40 + 32) = v41;
  *(_QWORD *)(v40 + 40) = v42;
  v43 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v44 = swift_allocObject();
  *(_QWORD *)(v44 + 16) = v43;
  *(_QWORD *)(v44 + 24) = ObjectType;
  v45 = v35;
  sub_18E768F00();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return (uint64_t)v45;
}

void sub_18E752AA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  int v7;

  v3 = a3 + 16;
  swift_beginAccess();
  v4 = (char *)MEMORY[0x193FF501C](v3);
  if (v4)
  {
    v5 = v4;
    if ((v4[OBJC_IVAR___CKBalloonShapeView_drawingMode + 8] & 1) != 0)
    {
      v6 = *(id *)&v4[OBJC_IVAR___CKBalloonShapeView_drawingMode];
      objc_msgSend(v6, sel_setNeedsDisplay);

    }
    else
    {
      objc_msgSend(v4, sel_descriptor);
      objc_msgSend(v5, sel_setDescriptor_, &v7);
    }

  }
}

void CKBalloonShapeView.alignmentRectInsets.getter()
{
  _BYTE *v0;
  id v1;
  id v2;
  double v3;
  char v4;

  if ((v0[OBJC_IVAR___CKBalloonShapeView_drawingMode + 8] & 1) == 0)
  {
    v2 = *(id *)&v0[OBJC_IVAR___CKBalloonShapeView_drawingMode];
    objc_msgSend(v2, sel_alignmentRectInsets);
    CKEdgeInsetsWithImageOrientation((uint64_t)objc_msgSend(v2, sel_imageOrientation), v3);
    goto LABEL_5;
  }
  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v0, sel_descriptor);
    objc_msgSend(v2, sel_balloonMaskAlignmentRectInsetsWithTailShape_, v4);
LABEL_5:

    return;
  }
  __break(1u);
}

double CKEdgeInsetsWithImageOrientation(uint64_t a1, double a2)
{
  void *v4;
  void *v5;

  if (a1 && a1 != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIEdgeInsets CKEdgeInsetsWithImageOrientation(UIEdgeInsets, UIImageOrientation)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CKGeometry.h"), 429, CFSTR("CKEdgeInsetsWithImageOrientation %ld hasn't been implemented"), a1);

  }
  return a2;
}

void __swiftcall CKBalloonShapeView.init(coder:)(CKBalloonShapeView_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

void CKBalloonShapeView.init(coder:)()
{
  sub_18E769320();
  __break(1u);
}

id CKBalloonShapeView.frame.getter()
{
  objc_super v1;

  v1.super_class = (Class)CKBalloonShapeView;
  return objc_msgSendSuper2(&v1, sel_frame);
}

id CKBalloonShapeView.frame.setter(double a1, double a2, double a3, double a4)
{
  void *v4;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  id result;
  objc_super v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  v23.super_class = (Class)CKBalloonShapeView;
  objc_msgSendSuper2(&v23, sel_frame);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v22.receiver = v4;
  v22.super_class = (Class)CKBalloonShapeView;
  objc_msgSendSuper2(&v22, sel_setFrame_, a1, a2, a3, a4);
  objc_msgSend(v4, sel_frame);
  v25.origin.x = v17;
  v25.origin.y = v18;
  v25.size.width = v19;
  v25.size.height = v20;
  v24.origin.x = v10;
  v24.origin.y = v12;
  v24.size.width = v14;
  v24.size.height = v16;
  result = (id)CGRectEqualToRect(v24, v25);
  if ((result & 1) == 0)
    return objc_msgSend(v4, sel_setNeedsLayout);
  return result;
}

Swift::Void __swiftcall CKBalloonShapeView.layoutSublayers(of:)(CALayer of)
{
  void *v1;
  Class isa;
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  objc_super v10;

  isa = of.super.isa;
  v10.super_class = (Class)CKBalloonShapeView;
  objc_msgSendSuper2(&v10, sel_layoutSublayersOfLayer_, of.super.isa, of._attr._objc_observation_info);
  v3 = -[objc_class sublayers](isa, sel_sublayers);
  if (v3)
  {
    v4 = v3;
    sub_18E00F31C(0, &qword_1EE0FB200);
    v5 = sub_18E768AE0();

    if (v5 >> 62)
    {
      sub_18E7669BC();
      v6 = sub_18E769338();
      if (v6)
        goto LABEL_4;
    }
    else
    {
      v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
      sub_18E7669BC();
      if (v6)
      {
LABEL_4:
        if (v6 < 1)
        {
          __break(1u);
          return;
        }
        v7 = 0;
        do
        {
          if ((v5 & 0xC000000000000001) != 0)
            v8 = (id)MEMORY[0x193FF25B0](v7, v5);
          else
            v8 = *(id *)(v5 + 8 * v7 + 32);
          v9 = v8;
          ++v7;
          objc_msgSend(v1, sel_frame);
          objc_msgSend(v9, sel_setFrame_);
          objc_msgSend(v9, sel_layoutIfNeeded);

        }
        while (v6 != v7);
      }
    }
    swift_bridgeObjectRelease_n();
  }
}

Swift::Bool __swiftcall CKBalloonShapeView._shouldAnimateProperty(withKey:)(Swift::String withKey)
{
  void *v1;
  unsigned __int8 v2;
  void *v3;
  objc_super v5;

  if (withKey._countAndFlagsBits == 0xD000000000000011 && withKey._object == (void *)0x800000018E81D840
    || (sub_18E7693F8() & 1) != 0)
  {
    return 1;
  }
  v3 = (void *)sub_18E768954();
  v5.receiver = v1;
  v5.super_class = (Class)CKBalloonShapeView;
  v2 = objc_msgSendSuper2(&v5, sel__shouldAnimatePropertyWithKey_, v3);

  return v2;
}

Swift::Void __swiftcall CKBalloonShapeView.layoutSubviews()()
{
  uint64_t v0;
  id v1;
  objc_super v2;

  v2.super_class = (Class)CKBalloonShapeView;
  objc_msgSendSuper2(&v2, sel_layoutSubviews);
  if ((*(_BYTE *)(v0 + OBJC_IVAR___CKBalloonShapeView_drawingMode + 8) & 1) == 0)
  {
    v1 = *(id *)(v0 + OBJC_IVAR___CKBalloonShapeView_drawingMode);
    sub_18E7534E8(v1);

  }
}

void sub_18E7534E8(void *a1)
{
  void *v1;
  id v3;
  id v4;
  id v5;
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
  double v16;
  double v17;
  id v18;
  id v19;
  id v20;
  CGFloat v21;
  CGAffineTransform v22;

  v3 = objc_msgSend(v1, sel_layer);
  v4 = objc_msgSend(a1, sel_CGImage);
  objc_msgSend(v3, sel_setContents_, v4);

  v5 = objc_msgSend(v1, sel_layer);
  objc_msgSend(a1, sel_scale);
  objc_msgSend(v5, sel_setContentsScale_);

  objc_msgSend(a1, sel_size);
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, sel_capInsets);
  v11 = v10 / v7;
  v13 = v12 / v9;
  v15 = (v7 - v10 - v14) / v7;
  v17 = (v9 - v12 - v16) / v9;
  v18 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v18, sel_setContentsCenter_, v11, v13, v15, v17);

  v19 = objc_msgSend(a1, sel_imageOrientation);
  v20 = objc_msgSend(v1, sel_layer);
  if (v19 == (id)4)
  {
    objc_msgSend(v1, sel_bounds);
    CGAffineTransformMake(&v22, -1.0, 0.0, 0.0, 1.0, v21, 0.0);
  }
  else
  {
    *(_OWORD *)&v22.a = 0x3FF0000000000000uLL;
    v22.c = 0.0;
    v22.d = 1.0;
    *(_OWORD *)&v22.tx = 0uLL;
  }
  objc_msgSend(v20, sel_setContentsTransform_, &v22);

}

void __swiftcall CKBalloonShapeView.init(frame:)(CKBalloonShapeView *__return_ptr retstr, __C::CGRect frame)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

void CKBalloonShapeView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_18E753858(uint64_t a1)
{
  void *v1;
  objc_class *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  char *v17;
  id v18;
  objc_super v20;
  char *v21;
  char v22[32];

  sub_18E00F118(a1, (uint64_t)v22);
  v3 = (objc_class *)type metadata accessor for BalloonShapeLayer();
  v4 = v1;
  swift_dynamicCast();
  v5 = v21;
  v6 = *(_QWORD *)&v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 8];
  v7 = v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 16];
  v8 = v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 72];
  v9 = v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 73];
  v10 = v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 74];
  v11 = v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 75];
  v12 = &v4[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor];
  v13 = *(_OWORD *)&v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 24];
  v14 = *(_OWORD *)&v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 40];
  v15 = *(_OWORD *)&v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 56];
  *(_DWORD *)v12 = *(_DWORD *)&v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor];
  *((_QWORD *)v12 + 1) = v6;
  v12[16] = v7;
  *(_OWORD *)(v12 + 24) = v13;
  *(_OWORD *)(v12 + 40) = v14;
  *(_OWORD *)(v12 + 56) = v15;
  v12[72] = v8;
  v12[73] = v9;
  v12[74] = v10;
  v12[75] = v11;
  v16 = *(_QWORD *)&v5[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_config + 8];
  v17 = &v4[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_config];
  *(_QWORD *)v17 = *(_QWORD *)&v5[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_config];
  *((_QWORD *)v17 + 1) = v16;
  sub_18E7669BC();

  v20.receiver = v4;
  v20.super_class = v3;
  v18 = objc_msgSendSuper2(&v20, sel_initWithLayer_, v5);
  objc_msgSend(v5, sel_frame);
  objc_msgSend(v18, sel_setFrame_);
  objc_msgSend(v18, sel_setNeedsDisplayOnBoundsChange_, 1);

  __swift_destroy_boxed_opaque_existential_0(a1);
  return v18;
}

void sub_18E7539FC()
{
  char *v0;
  char *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  CGFloat *v6;
  unsigned int v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  unint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  CGColorRef GenericRGB;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v31;
  char v32;
  CGFloat v33;
  CGFloat v34;
  uint64_t v35;
  CGFloat v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  char v42;
  id v43;
  void *v44;
  double v45;
  double v46;
  __n128 v47;
  uint64_t v48;
  void *v49;
  CGFloat v50;
  CGFloat ty;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CGFloat tx;
  CGFloat x;
  __int128 v58;
  id v59;
  CGAffineTransform v60;
  CGAffineTransform t2;
  CGAffineTransform t1;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char v67;
  char v68;
  char v69;
  objc_super v70;
  _BYTE v71[48];
  CGRect v72;
  CGRect v73;

  v1 = v0;
  v70.receiver = v0;
  v70.super_class = (Class)type metadata accessor for BalloonShapeLayer();
  objc_msgSendSuper2(&v70, sel_display);
  objc_msgSend(v0, sel_frame);
  v6 = (CGFloat *)&v0[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor];
  v7 = v0[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 2];
  if (v7 > 4)
    goto LABEL_27;
  v8 = v2;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  if (((1 << v7) & 0x15) == 0)
    goto LABEL_15;
  v12 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
  if (!v12)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v13 = v12;
  v14 = objc_msgSend(v12, sel_theme);

  if (!v14)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v15 = objc_msgSend(v14, sel_balloonColorsForColorType_, *((char *)v6 + 16));

  if (!v15)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FA7E0);
  v16 = sub_18E768AE0();

  if (!(v16 >> 62))
  {
    if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_8;
    goto LABEL_14;
  }
  sub_18E7669BC();
  v20 = sub_18E769338();
  swift_bridgeObjectRelease();
  if (!v20)
  {
LABEL_14:
    swift_bridgeObjectRelease();
LABEL_15:
    v21 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    v19 = objc_msgSend(v21, sel_CGColor);

    goto LABEL_16;
  }
LABEL_8:
  if ((v16 & 0xC000000000000001) != 0)
  {
    v17 = (id)MEMORY[0x193FF25B0](0, v16);
  }
  else
  {
    if (!*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_23;
    }
    v17 = *(id *)(v16 + 32);
  }
  v18 = v17;
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v18, sel_CGColor);

  if (!v19)
    goto LABEL_15;
LABEL_16:
  objc_msgSend(v1, sel_setFillColor_, v19);

  objc_msgSend(v1, sel_setLineWidth_, *(double *)&v1[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_config]);
  GenericRGB = CGColorCreateGenericRGB(v6[3], v6[4], v6[5], v6[6]);
  objc_msgSend(v1, sel_setStrokeColor_, GenericRGB);

  objc_msgSend(v1, sel_setLineJoin_, *MEMORY[0x1E0CD3030]);
  objc_msgSend(v1, sel_setLineCap_, *MEMORY[0x1E0CD3010]);
  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FB940);
  sub_18E7669BC();
  v23 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setLineDashPattern_, v23);

  objc_msgSend(v1, sel_setLineDashPhase_, 1.0);
  objc_msgSend(v1, sel_lineWidth);
  v25 = v24;
  objc_msgSend(v1, sel_lineWidth);
  v27 = v26;
  v72.origin.x = v8;
  v72.origin.y = v9;
  tx = v10;
  v72.size.width = v10;
  v72.size.height = v11;
  v73 = CGRectInset(v72, v25, v27);
  x = v73.origin.x;
  y = v73.origin.y;
  width = v73.size.width;
  height = v73.size.height;
  LODWORD(v8) = *(_DWORD *)v6;
  v31 = v6[1];
  v32 = *((_BYTE *)v6 + 16);
  v33 = v6[3];
  v34 = v6[4];
  v36 = v6[5];
  v35 = *((_QWORD *)v6 + 6);
  v37 = *((_QWORD *)v6 + 7);
  v38 = *((_QWORD *)v6 + 8);
  v59 = v1;
  v39 = *((_BYTE *)v6 + 72);
  v40 = *((_BYTE *)v6 + 73);
  v41 = *((_BYTE *)v6 + 74);
  v42 = *((_BYTE *)v6 + 75);
  v43 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
  if (!v43)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v44 = v43;
  LODWORD(t1.a) = vmovn_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)&v8)).u32[0];
  t1.b = v31;
  LOBYTE(t1.c) = v32;
  t1.d = v33;
  t1.tx = v34;
  t1.ty = v36;
  v63 = v35;
  v64 = v37;
  v65 = v38;
  v66 = v39;
  v67 = v40;
  v68 = v41;
  v69 = v42;
  objc_msgSend(v43, sel_balloonMaskSizeWithBalloonDescriptor_, &t1);
  v46 = v45;

  v47.n128_f64[0] = y;
  v48 = sub_18E5B5004(v40, 0, x, v47, width, height, v46 * 0.5);
  sub_18E5B4A1C(v48, (uint64_t)v71);
  v49 = (void *)sub_18E767BE0();
  sub_18E754108((uint64_t)v71);
  objc_msgSend(v59, sel_setPath_, v49);

  if (*((_BYTE *)v6 + 3) == 1)
    return;
  if (*((_BYTE *)v6 + 3))
  {
LABEL_27:
    sub_18E769320();
    __break(1u);
    return;
  }
  CGAffineTransformMakeScale(&t1, -1.0, 1.0);
  v58 = *(_OWORD *)&t1.a;
  v55 = *(_OWORD *)&t1.c;
  v50 = t1.tx;
  ty = t1.ty;
  CGAffineTransformMakeTranslation(&t1, tx, 0.0);
  v52 = *(_OWORD *)&t1.a;
  v53 = *(_OWORD *)&t1.c;
  v54 = *(_OWORD *)&t1.tx;
  *(_OWORD *)&t1.a = v58;
  *(_OWORD *)&t1.c = v55;
  t1.tx = v50;
  t1.ty = ty;
  *(_OWORD *)&t2.a = v52;
  *(_OWORD *)&t2.c = v53;
  *(_OWORD *)&t2.tx = v54;
  CGAffineTransformConcat(&v60, &t1, &t2);
  t1 = v60;
  objc_msgSend(v59, sel_setAffineTransform_, &t1);
}

id sub_18E754080()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BalloonShapeLayer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CKBalloonShapeView(uint64_t a1)
{
  return sub_18E00F31C(a1, &qword_1EE112EA8);
}

uint64_t type metadata accessor for BalloonShapeLayer()
{
  return objc_opt_self();
}

ValueMetadata *_s13ConfigurationVMa()
{
  return &_s13ConfigurationVN;
}

uint64_t sub_18E754108(uint64_t a1)
{
  sub_18E5B5894(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  return a1;
}

uint64_t sub_18E75413C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

id sub_18E754160(int *a1)
{
  uint64_t v1;

  return sub_18E7526F4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_18E754168()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_18E75418C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_18E7541B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_18E752AA0(a1, a2, *(_QWORD *)(v2 + 16));
}

id CKDebugTicker.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CKDebugTicker.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC7ChatKit13CKDebugTicker_window] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC7ChatKit13CKDebugTicker_parentWindow] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC7ChatKit13CKDebugTicker__tickCounter] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC7ChatKit13CKDebugTicker_displayLink] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CKDebugTicker();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for CKDebugTicker()
{
  return objc_opt_self();
}

id sub_18E7542C4()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CKDebugTicker()), sel_init);
  qword_1EE0FBD58 = (uint64_t)result;
  return result;
}

id static CKDebugTicker.shared.getter()
{
  if (qword_1EE0FBD68 != -1)
    swift_once();
  return (id)qword_1EE0FBD58;
}

uint64_t sub_18E754384()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker__tickCounter) >> 1;
}

void sub_18E754398()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MidY;
  double v20;
  double v21;
  id v22;
  id v23;
  CGRect v24;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker__tickCounter);
  v2 = __CFADD__(v1, 1);
  v3 = v1 + 1;
  if (v2)
  {
    __break(1u);
  }
  else
  {
    v4 = v0;
    *(_QWORD *)(v0 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker__tickCounter) = v3;
    v5 = OBJC_IVAR____TtC7ChatKit13CKDebugTicker_window;
    v6 = *(char **)(v0 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_window);
    if (v6)
    {
      v7 = OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow_tickCounter;
      *(_QWORD *)&v6[OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow_tickCounter] = v3 >> 1;
      v8 = v6;
      v9 = (char *)objc_msgSend(v8, sel_rootViewController);
      if (v9)
      {
        v10 = v9;
        type metadata accessor for TickerViewController();
        if (swift_dynamicCastClass())
          sub_18E754FA8(*(_QWORD *)&v6[v7]);

      }
      else
      {
        v10 = v8;
      }

      v11 = *(void **)(v0 + v5);
      if (v11)
      {
        v12 = *(void **)(v0 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_parentWindow);
        v23 = *(id *)(v4 + v5);
        if (v12)
        {
          v13 = v11;
          v14 = v12;
          objc_msgSend(v13, sel_sizeThatFits_, 0.0, 0.0);
          v16 = v15;
          v18 = v17;
          objc_msgSend(v14, sel_bounds);
          MidY = CGRectGetMidY(v24);

          v20 = MidY + v18 * -0.5;
          v21 = 10.0;
        }
        else
        {
          v22 = v11;
          v21 = 0.0;
          v20 = 0.0;
          v16 = 0.0;
          v18 = 0.0;
        }
        objc_msgSend(v23, sel_setFrame_, v21, v20, v16, v18);

      }
    }
  }
}

void sub_18E75457C(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MidY;
  double v32;
  double v33;
  id v34;
  id v35;
  CGRect v36;

  v5 = objc_msgSend((id)objc_opt_self(), sel_displayLinkWithTarget_selector_, v2, sel_tick);
  v6 = OBJC_IVAR____TtC7ChatKit13CKDebugTicker_displayLink;
  v7 = *(void **)(v2 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_displayLink);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_displayLink) = v5;

  v8 = *(void **)(v2 + v6);
  if (v8)
  {
    v9 = (void *)objc_opt_self();
    v10 = v8;
    v11 = objc_msgSend(v9, sel_mainRunLoop);
    objc_msgSend(v10, sel_addToRunLoop_forMode_, v11, *MEMORY[0x1E0C99860]);

    v12 = OBJC_IVAR____TtC7ChatKit13CKDebugTicker_parentWindow;
    v13 = *(void **)(v2 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_parentWindow);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_parentWindow) = a2;
    v14 = a2;

    v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TickerWindow()), sel_initWithWindowScene_, a1);
    objc_msgSend(v15, sel_setWindowLevel_, *MEMORY[0x1E0CEB660]);
    v16 = OBJC_IVAR____TtC7ChatKit13CKDebugTicker_window;
    v17 = *(void **)(v2 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_window);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_window) = v15;
    v18 = v15;

    objc_msgSend(v18, sel_makeKeyAndVisible);
    v19 = objc_allocWithZone((Class)type metadata accessor for TickerViewController());
    v35 = v18;
    v20 = objc_msgSend(v19, sel_init);
    objc_msgSend(v35, sel_setRootViewController_, v20);

    v21 = *(void **)(v2 + v16);
    if (v21)
    {
      v22 = v35;
      v23 = *(void **)(v2 + v12);
      if (v23)
      {
        v24 = v35;
        v25 = v21;
        v26 = v23;
        objc_msgSend(v25, sel_sizeThatFits_, 0.0, 0.0);
        v28 = v27;
        v30 = v29;
        objc_msgSend(v26, sel_bounds);
        MidY = CGRectGetMidY(v36);

        v32 = MidY + v30 * -0.5;
        v33 = 10.0;
LABEL_7:
        objc_msgSend(v35, sel_setFrame_, v33, v32, v28, v30);

        return;
      }
    }
    else
    {
      v22 = v35;
    }
    v34 = v22;
    v33 = 0.0;
    v32 = 0.0;
    v28 = 0.0;
    v30 = 0.0;
    goto LABEL_7;
  }
  __break(1u);
}

uint64_t type metadata accessor for TickerWindow()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for TickerViewController()
{
  return objc_opt_self();
}

id CKDebugTicker.__deallocating_deinit(uint64_t a1)
{
  return sub_18E517D00(a1, type metadata accessor for CKDebugTicker);
}

uint64_t method lookup function for CKDebugTicker()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CKDebugTicker.tickCounter.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of CKDebugTicker.installUI(windowScene:parentWindow:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

char *sub_18E754964()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char *v18;
  id v19;
  id v20;
  objc_super v22;

  v1 = OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCountLabel;
  v2 = objc_allocWithZone(MEMORY[0x1E0CEA700]);
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, sel_init);
  *(_QWORD *)&v3[OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCounter] = 0;

  v22.receiver = v3;
  v22.super_class = (Class)type metadata accessor for CKDebugTickHUDView();
  v4 = (char *)objc_msgSendSuper2(&v22, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v5 = OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCountLabel;
  v6 = *(void **)&v4[OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCountLabel];
  v7 = (void *)objc_opt_self();
  v8 = *MEMORY[0x1E0CEB538];
  v9 = v4;
  v10 = v6;
  v11 = objc_msgSend(v7, sel_preferredFontForTextStyle_, v8);
  objc_msgSend(v10, sel_setFont_, v11);

  v12 = *(void **)&v4[v5];
  v13 = (void *)objc_opt_self();
  v14 = v12;
  v15 = objc_msgSend(v13, sel_whiteColor);
  objc_msgSend(v14, sel_setTextColor_, v15);

  v16 = *(id *)&v4[v5];
  v17 = (void *)sub_18E768954();
  objc_msgSend(v16, sel_setText_, v17);

  v18 = v9;
  v19 = objc_msgSend(v13, sel_blackColor);
  v20 = objc_msgSend(v19, sel_colorWithAlphaComponent_, 0.5);

  objc_msgSend(v18, sel_setBackgroundColor_, v20);
  objc_msgSend(v18, sel__setContinuousCornerRadius_, 4.0);
  objc_msgSend(v18, sel_addSubview_, *(_QWORD *)&v4[v5]);

  return v18;
}

id sub_18E754D78()
{
  return sub_18E517D00(0, type metadata accessor for CKDebugTickHUDView);
}

uint64_t type metadata accessor for CKDebugTickHUDView()
{
  return objc_opt_self();
}

void sub_18E754FA8(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController_tickCounter;
  *(_QWORD *)&v1[OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController_tickCounter] = a1;
  v7 = objc_msgSend(v1, sel_view);
  if (v7)
  {
    type metadata accessor for CKDebugTickHUDView();
    v3 = swift_dynamicCastClass();
    if (v3)
    {
      v4 = (void *)v3;
      *(_QWORD *)(v3 + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCounter) = *(_QWORD *)&v1[v2];
      v5 = *(void **)(v3
                    + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCountLabel);
      sub_18E7693D4();
      v6 = (void *)sub_18E768954();
      swift_bridgeObjectRelease();
      objc_msgSend(v5, sel_setText_, v6);

      objc_msgSend(v4, sel_setNeedsLayout);
    }
    else
    {

    }
  }
}

id sub_18E7550AC()
{
  return sub_18E517D00(0, type metadata accessor for TickerViewController);
}

double sub_18E7550BC(double a1, double a2)
{
  void *v2;
  id v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v5 = objc_msgSend(v2, sel_rootViewController);
  v6 = 0.0;
  if (v5)
  {
    v7 = v5;
    type metadata accessor for TickerViewController();
    v8 = (void *)swift_dynamicCastClass();
    if (v8 && (v9 = objc_msgSend(v8, sel_view)) != 0)
    {
      v10 = v9;
      type metadata accessor for CKDebugTickHUDView();
      v11 = (void *)swift_dynamicCastClass();
      if (v11)
      {
        objc_msgSend(v11, sel_sizeThatFits_, a1, a2);
        v13 = v12;

        return v13 + 6.0;
      }
      else
      {

      }
    }
    else
    {

    }
  }
  return v6;
}

id sub_18E755398()
{
  return sub_18E517D00(0, type metadata accessor for TickerWindow);
}

double UIEdgeInsetsInsetRect_0(double a1)
{
  return a1 + 3.0;
}

id LinkIntentsManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static LinkIntentsManager.shared.getter()
{
  if (qword_1EE0F4680 != -1)
    swift_once();
  return (id)qword_1EE0F4950;
}

uint64_t sub_18E755424()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_18E755438()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_18E75544C(void *a1)
{
  id v2;
  _BYTE v4[40];

  sub_18E765D08();
  sub_18E765CFC();
  sub_18E7691F4();
  *(_QWORD *)(swift_allocObject() + 16) = a1;
  sub_18E755550();
  v2 = a1;
  sub_18E765CF0();
  swift_release();
  swift_release();
  return sub_18E75558C((uint64_t)v4);
}

uint64_t sub_18E755520()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_18E755544@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

unint64_t sub_18E755550()
{
  unint64_t result;

  result = qword_1EE112FB0;
  if (!qword_1EE112FB0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE112FB0);
  }
  return result;
}

uint64_t sub_18E75558C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE0F50C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_18E7556CC()
{
  _BYTE v1[40];

  sub_18E765D08();
  sub_18E765CFC();
  sub_18E7691F4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0F4738);
  sub_18E765CF0();
  swift_release();
  return sub_18E75558C((uint64_t)v1);
}

id LinkIntentsManager.init()()
{
  void *v0;
  objc_super v2;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LinkIntentsManager();
  return objc_msgSendSuper2(&v2, sel_init);
}

id LinkIntentsManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LinkIntentsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for LinkIntentsManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LinkIntentsManager.registerMessagesNavigator(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of LinkIntentsManager.registerChatController(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of LinkIntentsManager.registerDependency(detailsController:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of LinkIntentsManager.purgeDependencies()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

char *sub_18E755960()
{
  void *v0;
  char v1;
  char *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (objc_msgSend(v0, sel_isMuted))
  {
    v1 = 1;
    v2 = sub_18E519814(0, 1, 1, MEMORY[0x1E0DEE9D8]);
    v4 = *((_QWORD *)v2 + 2);
    v3 = *((_QWORD *)v2 + 3);
    v5 = v4 + 1;
    if (v4 >= v3 >> 1)
    {
      v1 = 1;
      v2 = sub_18E519814((char *)(v3 > 1), v4 + 1, 1, v2);
    }
LABEL_8:
    *((_QWORD *)v2 + 2) = v5;
    v2[v4 + 32] = v1;
    goto LABEL_10;
  }
  if (objc_msgSend(v0, sel__shouldShowSlashSatelliteIcon))
  {
    v2 = sub_18E519814(0, 1, 1, MEMORY[0x1E0DEE9D8]);
    v4 = *((_QWORD *)v2 + 2);
    v6 = *((_QWORD *)v2 + 3);
    v5 = v4 + 1;
    if (v4 >= v6 >> 1)
      v2 = sub_18E519814((char *)(v6 > 1), v4 + 1, 1, v2);
    v1 = 2;
    goto LABEL_8;
  }
  v2 = (char *)MEMORY[0x1E0DEE9D8];
LABEL_10:
  if (objc_msgSend(v0, sel__shouldShowSendLaterIcon))
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_18E519814(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    v8 = *((_QWORD *)v2 + 2);
    v7 = *((_QWORD *)v2 + 3);
    if (v8 >= v7 >> 1)
      v2 = sub_18E519814((char *)(v7 > 1), v8 + 1, 1, v2);
    *((_QWORD *)v2 + 2) = v8 + 1;
    v2[v8 + 32] = 0;
  }
  return v2;
}

void CKConversationListCell.makeTextAttachmentsForCurrentIndicatorState()()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  char *v4;
  id v5;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedBehaviors);
  if (!v0)
  {
    __break(1u);
    goto LABEL_7;
  }
  v1 = v0;
  v2 = objc_msgSend(v0, sel_theme);

  if (!v2)
  {
LABEL_7:
    __break(1u);
    return;
  }
  v3 = objc_msgSend(v2, sel_accessoryIndicatorTintColor);

  if (!v3)
    v3 = objc_msgSend((id)objc_opt_self(), sel_tertiaryLabelColor);
  v4 = sub_18E755960();
  v5 = v3;
  sub_18E755CEC((uint64_t)v4, (uint64_t)v5);
  swift_bridgeObjectRelease();

}

Swift::Void __swiftcall CKConversationListStandardCell.updateAccessoryIndicatorsForCurrentState()()
{
  void *v0;
  char *v1;
  char *v2;
  void *v3;
  uint64_t v4;

  v1 = sub_18E755960();
  v2 = (char *)objc_msgSend(v0, sel_indicatorContainerView);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_indicators];
    *(_QWORD *)&v2[OBJC_IVAR____TtC7ChatKit32CKConversationListIndicatorsView_indicators] = v1;
    sub_18E7669BC();
    sub_18E6C4A94(v4, (uint64_t)v1);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_18E755CEC(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t i;
  void *v7;
  char **v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  result = MEMORY[0x1E0DEE9D8];
  v15 = MEMORY[0x1E0DEE9D8];
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    sub_18E7669BC();
    for (i = 0; i != v4; ++i)
    {
      if (*(_BYTE *)(a1 + i + 32) && *(_BYTE *)(a1 + i + 32) != 1)
      {
        v7 = (void *)sub_18E768954();
        v8 = &selRef__systemImageNamed_;
      }
      else
      {
        v7 = (void *)sub_18E768954();
        v8 = &selRef_systemImageNamed_;
      }
      v9 = objc_msgSend((id)objc_opt_self(), *v8, v7);

      if (v9)
      {
        v10 = qword_1EE107560;
        v11 = v9;
        if (v10 != -1)
          swift_once();
        v12 = objc_msgSend(v11, sel_imageWithConfiguration_, qword_1EE110298);

        if (v12)
        {
          v13 = objc_msgSend(v12, sel_imageWithTintColor_, a2);

          if (v13)
          {
            v14 = objc_msgSend((id)objc_opt_self(), sel_textAttachmentWithImage_, v13);

            MEMORY[0x193FF1E18]();
            if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_18E768B04();
            sub_18E768B28();
            sub_18E768AF8();
          }
        }
      }
    }
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

unint64_t sub_18E755F38()
{
  unint64_t result;

  result = qword_1EE112FB8;
  if (!qword_1EE112FB8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE112FB8);
  }
  return result;
}

_QWORD *initializeWithCopy for PersonPancakeView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  v5 = (void *)a2[3];
  a1[2] = v4;
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  a1[6] = a2[6];
  sub_18E7669BC();
  v7 = v4;
  v8 = v5;
  sub_18E7669BC();
  return a1;
}

_QWORD *assignWithCopy for PersonPancakeView(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *a1 = *a2;
  a1[1] = a2[1];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[2];
  v5 = (void *)a2[2];
  a1[2] = v5;
  v6 = v5;

  v7 = (void *)a1[3];
  v8 = (void *)a2[3];
  a1[3] = v8;
  v9 = v8;

  a1[4] = a2[4];
  a1[5] = a2[5];
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  return a1;
}

uint64_t assignWithTake for PersonPancakeView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

ValueMetadata *type metadata accessor for PersonPancakeView()
{
  return &type metadata for PersonPancakeView;
}

uint64_t sub_18E7560E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18E7560F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  char *v15;
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
  uint64_t v26;
  uint64_t v27;
  void *v28;
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
  uint64_t *v44;
  _QWORD *v45;
  uint64_t v46;
  _OWORD *v47;
  __int128 v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  char *v54;
  uint64_t v55;
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
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  _WORD *v73;
  uint64_t v74;
  _OWORD *v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v80;
  id v81;
  char *v82;
  uint64_t v83;
  char *v84;
  char *v85;
  _QWORD *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;

  v97 = a1;
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112FC0);
  MEMORY[0x1E0C80A78](v83);
  v84 = (char *)&v80 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112FC8);
  MEMORY[0x1E0C80A78](v94);
  v4 = (char *)&v80 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v80 - v6;
  v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112FD0);
  MEMORY[0x1E0C80A78](v98);
  v9 = (char *)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112FD8);
  MEMORY[0x1E0C80A78](v92);
  v93 = (uint64_t)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112FE0);
  MEMORY[0x1E0C80A78](v96);
  v95 = (char *)&v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112FE8);
  MEMORY[0x1E0C80A78](v91);
  v90 = (uint64_t)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_18E7671E4();
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_18E768564();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v80 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE112FF0);
  MEMORY[0x1E0C80A78](v89);
  v21 = (char *)&v80 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE112FF8);
  MEMORY[0x1E0C80A78](v85);
  v86 = (uint64_t *)((char *)&v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE113000);
  MEMORY[0x1E0C80A78](v23);
  MEMORY[0x1E0C80A78](v24);
  v99 = v1;
  v28 = *(void **)(v1 + 16);
  if (v28)
  {
    v88 = v25;
    v83 = (uint64_t)&v80 - v26;
    v82 = (char *)v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0FB970);
    v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_18E7CC390;
    *(_QWORD *)(v29 + 32) = v28;
    *(_QWORD *)&v105 = v29;
    sub_18E768AF8();
    v30 = v105;
    v84 = v28;
    v31 = sub_18E7680C0();
    sub_18E766CC8();
    v32 = v100;
    v33 = v102;
    v87 = v9;
    v34 = v103;
    v35 = v104;
    v36 = sub_18E7684D4();
    v38 = v37;
    v39 = v101;
    (*(void (**)(char *, _QWORD, uint64_t))(v17 + 104))(v19, *MEMORY[0x1E0CE0378], v16);
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v15, v19, v16);
    sub_18E756DAC((uint64_t)v15, (uint64_t)&v21[*(int *)(v89 + 36)]);
    *(_QWORD *)v21 = v32;
    *((_QWORD *)v21 + 1) = v39;
    *((_QWORD *)v21 + 2) = v33;
    *((_QWORD *)v21 + 3) = v34;
    *((_QWORD *)v21 + 4) = v35;
    *((_QWORD *)v21 + 5) = v31;
    *((_WORD *)v21 + 24) = 256;
    *((_QWORD *)v21 + 7) = v36;
    *((_QWORD *)v21 + 8) = v38;
    sub_18E7669BC();
    swift_retain();
    sub_18E756DF0((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    swift_release();
    swift_bridgeObjectRelease();
    v40 = sub_18E7684D4();
    v42 = v41;
    v43 = v90;
    sub_18E5106A0((uint64_t)v21, v90, &qword_1EE112FF0);
    v44 = (uint64_t *)(v43 + *(int *)(v91 + 36));
    *v44 = v40;
    v44[1] = v42;
    v45 = v86;
    sub_18E5106A0(v43, (uint64_t)v86 + *((int *)v85 + 9), &qword_1EE112FE8);
    *v45 = v30;
    sub_18E7669BC();
    sub_18E00FA98(v43, &qword_1EE112FE8);
    sub_18E00FA98((uint64_t)v21, &qword_1EE112FF0);
    swift_bridgeObjectRelease();
    sub_18E7684D4();
    sub_18E766D7C();
    v46 = (uint64_t)v82;
    sub_18E5106A0((uint64_t)v45, (uint64_t)v82, &qword_1EE112FF8);
    v47 = (_OWORD *)(v46 + *(int *)(v88 + 36));
    v48 = v106;
    *v47 = v105;
    v47[1] = v48;
    v47[2] = v107;
    sub_18E00FA98((uint64_t)v45, &qword_1EE112FF8);
    v49 = &qword_1EE113000;
    v50 = v83;
    sub_18E520BEC(v46, v83, &qword_1EE113000);
    sub_18E5106A0(v50, v93, &qword_1EE113000);
    swift_storeEnumTagMultiPayload();
    sub_18E756CA4(&qword_1EE113010, &qword_1EE113000, (uint64_t (*)(void))sub_18E756C20);
    sub_18E756CA4(&qword_1EE113028, &qword_1EE112FC8, (uint64_t (*)(void))sub_18E756D10);
    v51 = (uint64_t)v95;
    sub_18E767688();
    sub_18E5106A0(v51, (uint64_t)v87, &qword_1EE112FE0);
    swift_storeEnumTagMultiPayload();
    sub_18E756B84();
    sub_18E767688();

    sub_18E00FA98(v51, &qword_1EE112FE0);
    v52 = v50;
    return sub_18E00FA98(v52, v49);
  }
  v82 = v15;
  v85 = v4;
  v86 = v7;
  v53 = *(void **)(v99 + 24);
  if (v53)
  {
    v54 = v19;
    v88 = v25;
    v81 = v53;
    v55 = MEMORY[0x193FF1398]();
    v87 = v9;
    v56 = v55;
    v57 = sub_18E7680C0();
    sub_18E766CC8();
    v58 = v100;
    v59 = v102;
    v60 = v103;
    v61 = v104;
    v62 = sub_18E7684D4();
    v64 = v63;
    v65 = v101;
    v66 = v54;
    (*(void (**)(char *, _QWORD, uint64_t))(v17 + 104))(v54, *MEMORY[0x1E0CE0378], v16);
    v67 = (uint64_t)v82;
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v82, v66, v16);
    sub_18E756DAC(v67, (uint64_t)&v21[*(int *)(v89 + 36)]);
    *(_QWORD *)v21 = v58;
    *((_QWORD *)v21 + 1) = v65;
    *((_QWORD *)v21 + 2) = v59;
    *((_QWORD *)v21 + 3) = v60;
    *((_QWORD *)v21 + 4) = v61;
    *((_QWORD *)v21 + 5) = v57;
    *((_WORD *)v21 + 24) = 256;
    *((_QWORD *)v21 + 7) = v62;
    *((_QWORD *)v21 + 8) = v64;
    sub_18E7669BC();
    swift_retain();
    sub_18E756DF0(v67);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v66, v16);
    swift_release();
    swift_bridgeObjectRelease();
    v68 = sub_18E7684D4();
    v70 = v69;
    v71 = v90;
    sub_18E5106A0((uint64_t)v21, v90, &qword_1EE112FF0);
    v72 = (uint64_t *)(v71 + *(int *)(v91 + 36));
    *v72 = v68;
    v72[1] = v70;
    v73 = v84;
    sub_18E5106A0(v71, (uint64_t)&v84[*(int *)(v83 + 36)], &qword_1EE112FE8);
    *(_QWORD *)v73 = v56;
    v73[4] = 256;
    swift_retain();
    sub_18E00FA98(v71, &qword_1EE112FE8);
    sub_18E00FA98((uint64_t)v21, &qword_1EE112FF0);
    swift_release();
    sub_18E7684D4();
    sub_18E766D7C();
    v74 = (uint64_t)v85;
    sub_18E5106A0((uint64_t)v73, (uint64_t)v85, &qword_1EE112FC0);
    v75 = (_OWORD *)(v74 + *(int *)(v94 + 36));
    v76 = v106;
    *v75 = v105;
    v75[1] = v76;
    v75[2] = v107;
    sub_18E00FA98((uint64_t)v73, &qword_1EE112FC0);
    v49 = &qword_1EE112FC8;
    v77 = (uint64_t)v86;
    sub_18E520BEC(v74, (uint64_t)v86, &qword_1EE112FC8);
    sub_18E5106A0(v77, v93, &qword_1EE112FC8);
    swift_storeEnumTagMultiPayload();
    sub_18E756CA4(&qword_1EE113010, &qword_1EE113000, (uint64_t (*)(void))sub_18E756C20);
    sub_18E756CA4(&qword_1EE113028, &qword_1EE112FC8, (uint64_t (*)(void))sub_18E756D10);
    v78 = (uint64_t)v95;
    sub_18E767688();
    sub_18E5106A0(v78, (uint64_t)v87, &qword_1EE112FE0);
    swift_storeEnumTagMultiPayload();
    sub_18E756B84();
    sub_18E767688();

    sub_18E00FA98(v78, &qword_1EE112FE0);
    v52 = v77;
    return sub_18E00FA98(v52, v49);
  }
  swift_storeEnumTagMultiPayload();
  sub_18E756B84();
  return sub_18E767688();
}

unint64_t sub_18E756B84()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE113008;
  if (!qword_1EE113008)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112FE0);
    v2[0] = sub_18E756CA4(&qword_1EE113010, &qword_1EE113000, (uint64_t (*)(void))sub_18E756C20);
    v2[1] = sub_18E756CA4(&qword_1EE113028, &qword_1EE112FC8, (uint64_t (*)(void))sub_18E756D10);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE113008);
  }
  return result;
}

unint64_t sub_18E756C20()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE113018;
  if (!qword_1EE113018)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112FF8);
    v2[0] = sub_18E61AB84();
    v2[1] = sub_18E514BB4(&qword_1EE113020, &qword_1EE112FE8, MEMORY[0x1E0CDA280]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE113018);
  }
  return result;
}

uint64_t sub_18E756CA4(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x1E0CD8D70];
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_18E756D10()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE113030;
  if (!qword_1EE113030)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE112FC0);
    v2[0] = sub_18E514BB4(&qword_1EE113038, &qword_1EE113040, MEMORY[0x1E0CD8668]);
    v2[1] = sub_18E514BB4(&qword_1EE113020, &qword_1EE112FE8, MEMORY[0x1E0CDA280]);
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE113030);
  }
  return result;
}

uint64_t sub_18E756DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_18E7671E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18E756DF0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_18E7671E4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_18E756E30()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE113048;
  if (!qword_1EE113048)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE113050);
    v2[0] = sub_18E756B84();
    v2[1] = MEMORY[0x1E0CE0400];
    result = MEMORY[0x193FF4E54](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE113048);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void getTLToneIdentifierNone_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getTLToneIdentifierNone(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SMSApplicationSoundHelper.m"), 33, CFSTR("%s"), dlerror());

  __break(1u);
}

void getTLVibrationIdentifierNone_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getTLVibrationIdentifierNone(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SMSApplicationSoundHelper.m"), 34, CFSTR("%s"), dlerror());

  __break(1u);
}

void ToneLibraryLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ToneLibraryLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SMSApplicationSoundHelper.m"), 31, CFSTR("%s"), *a1);

  __break(1u);
}

void __getTLAlertClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getTLAlertClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SMSApplicationSoundHelper.m"), 32, CFSTR("Unable to find class %s"), "TLAlert");

  __break(1u);
}

void __getMSMessageClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FindMyUICoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKDetailsController+Location.m"), 25, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMSMessageClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMSMessageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKDetailsController+Location.m"), 26, CFSTR("Unable to find class %s"), "MSMessage");

  __break(1u);
}

void __getDCIMImageWellUtilitiesClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PhotoLibraryServicesCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKPhotoLibraryUtilities.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
}

void __getDCIMImageWellUtilitiesClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getDCIMImageWellUtilitiesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKPhotoLibraryUtilities.m"), 17, CFSTR("Unable to find class %s"), "DCIMImageWellUtilities");

  __break(1u);
}

void __getMSMessageClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FindMyUICoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKChatController.m"), 353, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMSMessageClass_block_invoke_cold_2_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMSMessageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKChatController.m"), 354, CFSTR("Unable to find class %s"), "MSMessage");

  __break(1u);
}

void __getUSUIInterventionViewControllerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *UserSafetyUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKChatController.m"), 464, CFSTR("%s"), *a1);

  __break(1u);
}

void __getUSUIInterventionViewControllerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getUSUIInterventionViewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKChatController.m"), 465, CFSTR("Unable to find class %s"), "USUIInterventionViewController");

  __break(1u);
}

void __getVTPreferencesClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *VoiceTriggerLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKSentWithSiriViewController.m"), 22, CFSTR("%s"), *a1);

  __break(1u);
}

void __getVTPreferencesClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getVTPreferencesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKSentWithSiriViewController.m"), 23, CFSTR("Unable to find class %s"), "VTPreferences");

  __break(1u);
}

void __getWorkoutKitXPCServiceHelperClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *WorkoutKitServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKWorkoutUtilities.m"), 23, CFSTR("%s"), *a1);

  __break(1u);
}

void __getWorkoutKitXPCServiceHelperClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getWorkoutKitXPCServiceHelperClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKWorkoutUtilities.m"), 24, CFSTR("Unable to find class %s"), "WorkoutKitXPCServiceHelper");

  __break(1u);
}

void __getWKUIRemoteViewServiceAdaptorClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *WorkoutKitUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKWorkoutUtilities.m"), 34, CFSTR("%s"), *a1);

  __break(1u);
}

void __getWKUIRemoteViewServiceAdaptorClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getWKUIRemoteViewServiceAdaptorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKWorkoutUtilities.m"), 35, CFSTR("Unable to find class %s"), "WKUIRemoteViewServiceAdaptor");

  __break(1u);
}

void CoreDuetLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreDuetLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKSMSComposeViewServiceController.m"), 90, CFSTR("%s"), *a1);

  __break(1u);
}

void CKLinkAndCreateAppendedVideoTransfer_cold_1()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  __int16 v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D37EB8];
  v1 = 138412546;
  v2 = v0;
  v3 = 2080;
  v4 = "transcoderOptions";
  _os_log_error_impl(&dword_18DFCD000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void _CKRegistrationFailureHandleDependentValueChanged_cold_1(char a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a2;
  v4 = 1024;
  v5 = a1 & 1;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Sending notification: WaitingForCloud %d, UpdateAppleID: %d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_2();
}

void CKEncryptedIdentifier_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "empty input", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void CKEncryptedIdentifier_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "digest value is empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __getFMUILocationDetailViewControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFMUILocationDetailViewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKDetailsController.m"), 184, CFSTR("Unable to find class %s"), "FMUILocationDetailViewController");

  __break(1u);
}

void FindMyUICoreLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FindMyUICoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKDetailsController.m"), 182, CFSTR("%s"), *a1);

  __break(1u);
}

void __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFMUILocationDetailViewControllerViewOptionsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKDetailsController.m"), 185, CFSTR("Unable to find class %s"), "FMUILocationDetailViewControllerViewOptions");

  __break(1u);
}

void CKSaveMomentShareFromURL_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, a2, a3, "Error fetching moment share: %@", (uint8_t *)&v3);
}

void CKSaveMomentShareFromURL_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, a2, a3, "_saveMomentShareWithContext: Didn't find indexes for assets %{public}@", (uint8_t *)&v3);
}

void CKSaveMomentShareFromURL_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = (id)objc_opt_class();
  v4 = v7;
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, a2, v5, "_saveMomentShareWithContext: Data source snapshot is not of PXAssetsDataSource type: %{public}@", (uint8_t *)&v6);

}

void DataDetectorsUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *DataDetectorsUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKTextMessagePartChatItem.m"), 63, CFSTR("%s"), *a1);

  __break(1u);
}

void __getLSApplicationWorkspaceClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKTapToRadar.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void __getLSApplicationWorkspaceClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getLSApplicationWorkspaceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKTapToRadar.m"), 20, CFSTR("Unable to find class %s"), "LSApplicationWorkspace");

  __break(1u);
}

void __getFKOrderImportPreviewControllerProviderClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FinanceKitUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKChatController_QuickLook.m"), 67, CFSTR("%s"), *a1);

  __break(1u);
}

void __getFKOrderImportPreviewControllerProviderClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFKOrderImportPreviewControllerProviderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKChatController_QuickLook.m"), 68, CFSTR("Unable to find class %s"), "FKOrderImportPreviewControllerProvider");

  __break(1u);
}

void __getFKOrderMessagesPreviewMetadataClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FinanceKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKChatController_QuickLook.m"), 71, CFSTR("%s"), *a1);

  __break(1u);
}

void __getFKOrderMessagesPreviewMetadataClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFKOrderMessagesPreviewMetadataClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKChatController_QuickLook.m"), 72, CFSTR("Unable to find class %s"), "FKOrderMessagesPreviewMetadata");

  __break(1u);
}

void CKSpotlightPreviewCachesFileURL_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Unable to create preview caches directories with error: %@", (uint8_t *)&v4, 0xCu);

}

void __getPLLocalizedCountDescriptionSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PhotoLibraryServicesCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKPhotosGridFooterViewModel.m"), 27, CFSTR("%s"), *a1);

  __break(1u);
}

void __getFKOrderMessagesPreviewMetadataClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FinanceKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKOrderMediaObject.m"), 38, CFSTR("%s"), *a1);

  __break(1u);
}

void __getFKOrderMessagesPreviewMetadataClass_block_invoke_cold_2_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFKOrderMessagesPreviewMetadataClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKOrderMediaObject.m"), 39, CFSTR("Unable to find class %s"), "FKOrderMessagesPreviewMetadata");

  __break(1u);
}

void __getAFPreferencesClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAFPreferencesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKMessageEntryView.m"), 140, CFSTR("Unable to find class %s"), "AFPreferences");

  __break(1u);
}

void AssistantServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AssistantServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKMessageEntryView.m"), 138, CFSTR("%s"), *a1);

  __break(1u);
}

void __getUSUIInterventionViewControllerClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *UserSafetyUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKTranscriptCollectionViewController+UserSafety.m"), 26, CFSTR("%s"), *a1);

  __break(1u);
}

void __getUSUIInterventionViewControllerClass_block_invoke_cold_2_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getUSUIInterventionViewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKTranscriptCollectionViewController+UserSafety.m"), 27, CFSTR("Unable to find class %s"), "USUIInterventionViewController");

  __break(1u);
}

void __getSCUIMoreHelpMenuClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSCUIMoreHelpMenuClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKTranscriptCollectionViewController+UserSafety.m"), 32, CFSTR("Unable to find class %s"), "SCUIMoreHelpMenu");

  __break(1u);
}

void SensitiveContentAnalysisUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SensitiveContentAnalysisUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKTranscriptCollectionViewController+UserSafety.m"), 30, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSCUIReportEvidenceClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSCUIReportEvidenceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKTranscriptCollectionViewController+UserSafety.m"), 31, CFSTR("Unable to find class %s"), "SCUIReportEvidence");

  __break(1u);
}

void __getMSMessageClass_block_invoke_cold_1_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FindMyUICoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKDetailsControllerAdapter.m"), 25, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMSMessageClass_block_invoke_cold_2_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMSMessageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKDetailsControllerAdapter.m"), 26, CFSTR("Unable to find class %s"), "MSMessage");

  __break(1u);
}

void __getBKSHIDEventDeferringTokenClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BackBoardServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKCamPhysicalCaptureNotifier.m"), 25, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBKSHIDEventDeferringTokenClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBKSHIDEventDeferringTokenClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKCamPhysicalCaptureNotifier.m"), 26, CFSTR("Unable to find class %s"), "BKSHIDEventDeferringToken");

  __break(1u);
}

void __getFKOrderImportPreviewControllerProviderClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FinanceKitUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKWalletItemSearchController.m"), 38, CFSTR("%s"), *a1);

  __break(1u);
}

void __getFKOrderImportPreviewControllerProviderClass_block_invoke_cold_2_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFKOrderImportPreviewControllerProviderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKWalletItemSearchController.m"), 39, CFSTR("Unable to find class %s"), "FKOrderImportPreviewControllerProvider");

  __break(1u);
}

void __getKTStatusClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *TransparencyLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKKeyTransparencyErrorUtilities.m"), 39, CFSTR("%s"), *a1);

  __break(1u);
}

void __getKTStatusClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getKTStatusClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKKeyTransparencyErrorUtilities.m"), 41, CFSTR("Unable to find class %s"), "KTStatus");

  __break(1u);
}

void __getTUIKTReportToAppleContextClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getTUIKTReportToAppleContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKKeyTransparencyErrorUtilities.m"), 42, CFSTR("Unable to find class %s"), "TUIKTReportToAppleContext");

  __break(1u);
}

void TransparencyUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *TransparencyUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKKeyTransparencyErrorUtilities.m"), 40, CFSTR("%s"), *a1);

  __break(1u);
}

void __getTUIKTReportToAppleViewControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getTUIKTReportToAppleViewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKKeyTransparencyErrorUtilities.m"), 44, CFSTR("Unable to find class %s"), "TUIKTReportToAppleViewController");

  __break(1u);
}

void __getTUIKTConversationViewControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getTUIKTConversationViewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKKeyTransparencyErrorUtilities.m"), 43, CFSTR("Unable to find class %s"), "TUIKTConversationViewController");

  __break(1u);
}

void __getDDActionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getDDActionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKChatInputController_TextInputPayloads.m"), 33, CFSTR("Unable to find class %s"), "DDAction");

  __break(1u);
}

void DataDetectorsUILibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *DataDetectorsUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKChatInputController_TextInputPayloads.m"), 32, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSTManagementStateClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSTManagementStateClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKCommSafetyAuthenticationController.m"), 19, CFSTR("Unable to find class %s"), "STManagementState");

  __break(1u);
}

void ScreenTimeCoreLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ScreenTimeCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKCommSafetyAuthenticationController.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSTCommunicationClientClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSTCommunicationClientClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKCommSafetyAuthenticationController.m"), 18, CFSTR("Unable to find class %s"), "STCommunicationClient");

  __break(1u);
}

uint64_t sub_18E765CE4()
{
  return MEMORY[0x1E0C90300]();
}

uint64_t sub_18E765CF0()
{
  return MEMORY[0x1E0C90410]();
}

uint64_t sub_18E765CFC()
{
  return MEMORY[0x1E0C90428]();
}

uint64_t sub_18E765D08()
{
  return MEMORY[0x1E0C90438]();
}

uint64_t sub_18E765D14()
{
  return MEMORY[0x1E0C90518]();
}

uint64_t sub_18E765D20()
{
  return MEMORY[0x1E0C905D0]();
}

uint64_t sub_18E765D2C()
{
  return MEMORY[0x1E0C905E0]();
}

uint64_t sub_18E765D38()
{
  return MEMORY[0x1E0C90640]();
}

uint64_t sub_18E765D44()
{
  return MEMORY[0x1E0C90650]();
}

uint64_t sub_18E765D50()
{
  return MEMORY[0x1E0C90760]();
}

uint64_t sub_18E765D5C()
{
  return MEMORY[0x1E0C907D0]();
}

uint64_t sub_18E765D68()
{
  return MEMORY[0x1E0C90810]();
}

uint64_t sub_18E765D74()
{
  return MEMORY[0x1E0C90828]();
}

uint64_t sub_18E765D80()
{
  return MEMORY[0x1E0C90860]();
}

uint64_t sub_18E765D8C()
{
  return MEMORY[0x1E0C908E8]();
}

uint64_t sub_18E765D98()
{
  return MEMORY[0x1E0C90918]();
}

uint64_t sub_18E765DA4()
{
  return MEMORY[0x1E0C90950]();
}

uint64_t sub_18E765DB0()
{
  return MEMORY[0x1E0C90970]();
}

uint64_t sub_18E765DBC()
{
  return MEMORY[0x1E0C90998]();
}

uint64_t sub_18E765DC8()
{
  return MEMORY[0x1E0C90A08]();
}

uint64_t sub_18E765DD4()
{
  return MEMORY[0x1E0C90CF0]();
}

uint64_t sub_18E765DE0()
{
  return MEMORY[0x1E0C90D00]();
}

uint64_t sub_18E765DEC()
{
  return MEMORY[0x1E0C90D10]();
}

uint64_t sub_18E765DF8()
{
  return MEMORY[0x1E0C90D20]();
}

uint64_t sub_18E765E04()
{
  return MEMORY[0x1E0C90E60]();
}

uint64_t sub_18E765E10()
{
  return MEMORY[0x1E0C91128]();
}

uint64_t sub_18E765E1C()
{
  return MEMORY[0x1E0C91148]();
}

uint64_t sub_18E765E28()
{
  return MEMORY[0x1E0C913A0]();
}

uint64_t sub_18E765E34()
{
  return MEMORY[0x1E0C913C0]();
}

uint64_t sub_18E765E40()
{
  return MEMORY[0x1E0C91480]();
}

uint64_t sub_18E765E4C()
{
  return MEMORY[0x1E0C914B0]();
}

uint64_t sub_18E765E58()
{
  return MEMORY[0x1E0C91620]();
}

uint64_t sub_18E765E64()
{
  return MEMORY[0x1E0C91640]();
}

uint64_t sub_18E765E70()
{
  return MEMORY[0x1E0C91750]();
}

uint64_t sub_18E765E7C()
{
  return MEMORY[0x1E0C91820]();
}

uint64_t sub_18E765E88()
{
  return MEMORY[0x1E0C918E0]();
}

uint64_t sub_18E765E94()
{
  return MEMORY[0x1E0C91920]();
}

uint64_t sub_18E765EA0()
{
  return MEMORY[0x1E0C91A38]();
}

uint64_t sub_18E765EAC()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_18E765EB8()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_18E765EC4()
{
  return MEMORY[0x1E0CAE488]();
}

uint64_t sub_18E765ED0()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_18E765EDC()
{
  return MEMORY[0x1E0CAE568]();
}

uint64_t sub_18E765EE8()
{
  return MEMORY[0x1E0CAE570]();
}

uint64_t sub_18E765EF4()
{
  return MEMORY[0x1E0CAE578]();
}

uint64_t sub_18E765F00()
{
  return MEMORY[0x1E0CAE590]();
}

uint64_t sub_18E765F0C()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_18E765F18()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_18E765F24()
{
  return MEMORY[0x1E0CAE630]();
}

uint64_t sub_18E765F30()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_18E765F3C()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_18E765F48()
{
  return MEMORY[0x1E0CAE668]();
}

uint64_t sub_18E765F54()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_18E765F60()
{
  return MEMORY[0x1E0CAE778]();
}

uint64_t sub_18E765F6C()
{
  return MEMORY[0x1E0CAE7D0]();
}

uint64_t sub_18E765F78()
{
  return MEMORY[0x1E0CAE858]();
}

uint64_t sub_18E765F84()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_18E765F90()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_18E765F9C()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_18E765FA8()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_18E765FB4()
{
  return MEMORY[0x1E0CAE9A0]();
}

uint64_t sub_18E765FC0()
{
  return MEMORY[0x1E0CAE9B8]();
}

uint64_t sub_18E765FCC()
{
  return MEMORY[0x1E0CAE9D8]();
}

uint64_t sub_18E765FD8()
{
  return MEMORY[0x1E0CAE9F0]();
}

uint64_t sub_18E765FE4()
{
  return MEMORY[0x1E0CAEA10]();
}

uint64_t sub_18E765FF0()
{
  return MEMORY[0x1E0CAEA20]();
}

uint64_t sub_18E765FFC()
{
  return MEMORY[0x1E0CAEA38]();
}

uint64_t sub_18E766008()
{
  return MEMORY[0x1E0CAEA48]();
}

uint64_t sub_18E766014()
{
  return MEMORY[0x1E0CAEA80]();
}

uint64_t sub_18E766020()
{
  return MEMORY[0x1E0CAEA88]();
}

uint64_t sub_18E76602C()
{
  return MEMORY[0x1E0CAEAA0]();
}

uint64_t sub_18E766038()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_18E766044()
{
  return MEMORY[0x1E0CE99E0]();
}

uint64_t sub_18E766050()
{
  return MEMORY[0x1E0CE99E8]();
}

uint64_t sub_18E76605C()
{
  return MEMORY[0x1E0CAEF48]();
}

uint64_t sub_18E766068()
{
  return MEMORY[0x1E0CAF240]();
}

uint64_t sub_18E766074()
{
  return MEMORY[0x1E0CAF2C8]();
}

uint64_t sub_18E766080()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_18E76608C()
{
  return MEMORY[0x1E0CAF400]();
}

uint64_t sub_18E766098()
{
  return MEMORY[0x1E0CAF460]();
}

uint64_t sub_18E7660A4()
{
  return MEMORY[0x1E0CAF6F8]();
}

uint64_t sub_18E7660B0()
{
  return MEMORY[0x1E0CAF708]();
}

uint64_t sub_18E7660BC()
{
  return MEMORY[0x1E0CAF750]();
}

uint64_t sub_18E7660C8()
{
  return MEMORY[0x1E0CAF788]();
}

uint64_t sub_18E7660D4()
{
  return MEMORY[0x1E0CAF790]();
}

uint64_t sub_18E7660E0()
{
  return MEMORY[0x1E0CAF8A8]();
}

uint64_t sub_18E7660EC()
{
  return MEMORY[0x1E0CE99F8]();
}

uint64_t sub_18E7660F8()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_18E766104()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_18E766110()
{
  return MEMORY[0x1E0CAF9D0]();
}

uint64_t sub_18E76611C()
{
  return MEMORY[0x1E0CAF9D8]();
}

uint64_t sub_18E766128()
{
  return MEMORY[0x1E0CAF9F8]();
}

uint64_t sub_18E766134()
{
  return MEMORY[0x1E0CAFA28]();
}

uint64_t sub_18E766140()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_18E76614C()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_18E766158()
{
  return MEMORY[0x1E0CAFE08]();
}

uint64_t sub_18E766164()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_18E766170()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_18E76617C()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_18E766188()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_18E766194()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_18E7661A0()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_18E7661AC()
{
  return MEMORY[0x1E0CB0110]();
}

uint64_t sub_18E7661B8()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_18E7661C4()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_18E7661D0()
{
  return MEMORY[0x1E0CB0270]();
}

uint64_t sub_18E7661DC()
{
  return MEMORY[0x1E0CB0580]();
}

uint64_t sub_18E7661E8()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t sub_18E7661F4()
{
  return MEMORY[0x1E0CB05A8]();
}

uint64_t sub_18E766200()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_18E76620C()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_18E766218()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_18E766224()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_18E766230()
{
  return MEMORY[0x1E0CB0708]();
}

uint64_t sub_18E76623C()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_18E766248()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_18E766254()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_18E766260()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_18E76626C()
{
  return MEMORY[0x1E0CB0828]();
}

uint64_t sub_18E766278()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_18E766284()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_18E766290()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_18E76629C()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_18E7662A8()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_18E7662B4()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_18E7662C0()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_18E7662CC()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_18E7662D8()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_18E7662E4()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_18E7662F0()
{
  return MEMORY[0x1E0CB0F38]();
}

uint64_t sub_18E7662FC()
{
  return MEMORY[0x1E0CB0F58]();
}

uint64_t sub_18E766308()
{
  return MEMORY[0x1E0CB0F98]();
}

uint64_t sub_18E766314()
{
  return MEMORY[0x1E0CB0FB8]();
}

uint64_t sub_18E766320()
{
  return MEMORY[0x1E0CB0FE8]();
}

uint64_t sub_18E76632C()
{
  return MEMORY[0x1E0CB1018]();
}

uint64_t sub_18E766338()
{
  return MEMORY[0x1E0CB1050]();
}

uint64_t sub_18E766344()
{
  return MEMORY[0x1E0CB1058]();
}

uint64_t sub_18E766350()
{
  return MEMORY[0x1E0CB1060]();
}

uint64_t sub_18E76635C()
{
  return MEMORY[0x1E0CB1070]();
}

uint64_t sub_18E766368()
{
  return MEMORY[0x1E0CB1090]();
}

uint64_t sub_18E766374()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_18E766380()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_18E76638C()
{
  return MEMORY[0x1E0CB11E0]();
}

uint64_t sub_18E766398()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_18E7663A4()
{
  return MEMORY[0x1E0CB1248]();
}

uint64_t sub_18E7663B0()
{
  return MEMORY[0x1E0CB1288]();
}

uint64_t sub_18E7663BC()
{
  return MEMORY[0x1E0CB12A8]();
}

uint64_t sub_18E7663C8()
{
  return MEMORY[0x1E0CB12C0]();
}

uint64_t sub_18E7663D4()
{
  return MEMORY[0x1E0CB1308]();
}

uint64_t sub_18E7663E0()
{
  return MEMORY[0x1E0CB1330]();
}

uint64_t sub_18E7663EC()
{
  return MEMORY[0x1E0CB1348]();
}

uint64_t sub_18E7663F8()
{
  return MEMORY[0x1E0CB1398]();
}

uint64_t sub_18E766404()
{
  return MEMORY[0x1E0CB13A0]();
}

uint64_t sub_18E766410()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_18E76641C()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_18E766428()
{
  return MEMORY[0x1E0CE9A10]();
}

uint64_t sub_18E766434()
{
  return MEMORY[0x1E0CE9A18]();
}

uint64_t sub_18E766440()
{
  return MEMORY[0x1E0CE9A20]();
}

uint64_t sub_18E76644C()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_18E766458()
{
  return MEMORY[0x1E0DEFD58]();
}

uint64_t sub_18E766464()
{
  return MEMORY[0x1E0DEFD60]();
}

uint64_t sub_18E766470()
{
  return MEMORY[0x1E0DEFD68]();
}

uint64_t sub_18E76647C()
{
  return MEMORY[0x1E0DEFD70]();
}

uint64_t sub_18E766488()
{
  return MEMORY[0x1E0DEFD78]();
}

uint64_t sub_18E766494()
{
  return MEMORY[0x1E0DEFD80]();
}

uint64_t sub_18E7664A0()
{
  return MEMORY[0x1E0CB1718]();
}

uint64_t sub_18E7664AC()
{
  return MEMORY[0x1E0CB1720]();
}

uint64_t sub_18E7664B8()
{
  return MEMORY[0x1E0CB1728]();
}

uint64_t sub_18E7664C4()
{
  return MEMORY[0x1E0CB1738]();
}

uint64_t sub_18E7664D0()
{
  return MEMORY[0x1E0DEF0A0]();
}

uint64_t sub_18E7664DC()
{
  return MEMORY[0x1E0DEF0A8]();
}

uint64_t sub_18E7664E8()
{
  return MEMORY[0x1E0DEF0B0]();
}

uint64_t sub_18E7664F4()
{
  return MEMORY[0x1E0D1F200]();
}

uint64_t sub_18E766500()
{
  return MEMORY[0x1E0D1F208]();
}

uint64_t sub_18E76650C()
{
  return MEMORY[0x1E0D132C0]();
}

uint64_t sub_18E766518()
{
  return MEMORY[0x1E0D132C8]();
}

uint64_t sub_18E766524()
{
  return MEMORY[0x1E0D13350]();
}

uint64_t sub_18E766530()
{
  return MEMORY[0x1E0D13358]();
}

uint64_t sub_18E76653C()
{
  return MEMORY[0x1E0D13368]();
}

uint64_t sub_18E766548()
{
  return MEMORY[0x1E0D13370]();
}

uint64_t sub_18E766554()
{
  return MEMORY[0x1E0D13378]();
}

uint64_t sub_18E766560()
{
  return MEMORY[0x1E0D37120]();
}

uint64_t sub_18E76656C()
{
  return MEMORY[0x1E0D37148]();
}

uint64_t sub_18E766578()
{
  return MEMORY[0x1E0D37270]();
}

uint64_t sub_18E766584()
{
  return MEMORY[0x1E0D37278]();
}

uint64_t sub_18E766590()
{
  return MEMORY[0x1E0D37280]();
}

uint64_t sub_18E76659C()
{
  return MEMORY[0x1E0D03708]();
}

uint64_t sub_18E7665A8()
{
  return MEMORY[0x1E0D03710]();
}

uint64_t sub_18E7665B4()
{
  return MEMORY[0x1E0D03720]();
}

uint64_t sub_18E7665C0()
{
  return MEMORY[0x1E0D03728]();
}

uint64_t sub_18E7665CC()
{
  return MEMORY[0x1E0DF0190]();
}

uint64_t sub_18E7665D8()
{
  return MEMORY[0x1E0DF0340]();
}

uint64_t sub_18E7665E4()
{
  return MEMORY[0x1E0D812F8]();
}

uint64_t sub_18E7665F0()
{
  return MEMORY[0x1E0D81308]();
}

uint64_t sub_18E7665FC()
{
  return MEMORY[0x1E0D81310]();
}

uint64_t sub_18E766608()
{
  return MEMORY[0x1E0D81328]();
}

uint64_t sub_18E766614()
{
  return MEMORY[0x1E0D81330]();
}

uint64_t sub_18E766620()
{
  return MEMORY[0x1E0D81370]();
}

uint64_t sub_18E76662C()
{
  return MEMORY[0x1E0D81378]();
}

uint64_t sub_18E766638()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_18E766644()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_18E766650()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_18E76665C()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_18E766668()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_18E766674()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_18E766680()
{
  return MEMORY[0x1E0DF2158]();
}

uint64_t sub_18E76668C()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_18E766698()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_18E7666A4()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_18E7666B0()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_18E7666BC()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_18E7666C8()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_18E7666D4()
{
  return MEMORY[0x1E0D372B8]();
}

uint64_t sub_18E7666E0()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_18E7666EC()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_18E7666F8()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_18E766704()
{
  return MEMORY[0x1E0D8BDE8]();
}

uint64_t sub_18E766710()
{
  return MEMORY[0x1E0D8BE10]();
}

uint64_t sub_18E76671C()
{
  return MEMORY[0x1E0D8BE48]();
}

uint64_t sub_18E766728()
{
  return MEMORY[0x1E0CE9A28]();
}

uint64_t sub_18E766734()
{
  return MEMORY[0x1E0CE9A30]();
}

uint64_t sub_18E766740()
{
  return MEMORY[0x1E0CE9A48]();
}

uint64_t sub_18E76674C()
{
  return MEMORY[0x1E0CE9AE0]();
}

uint64_t sub_18E766758()
{
  return MEMORY[0x1E0CE9B00]();
}

uint64_t sub_18E766764()
{
  return MEMORY[0x1E0CE9B10]();
}

uint64_t sub_18E766770()
{
  return MEMORY[0x1E0CE9B18]();
}

uint64_t sub_18E76677C()
{
  return MEMORY[0x1E0CE9B20]();
}

uint64_t sub_18E766788()
{
  return MEMORY[0x1E0CE9B30]();
}

uint64_t sub_18E766794()
{
  return MEMORY[0x1E0CE9B48]();
}

uint64_t sub_18E7667A0()
{
  return MEMORY[0x1E0CE9B78]();
}

uint64_t sub_18E7667AC()
{
  return MEMORY[0x1E0CE9B80]();
}

uint64_t sub_18E7667B8()
{
  return MEMORY[0x1E0CE9B88]();
}

uint64_t sub_18E7667C4()
{
  return MEMORY[0x1E0CE9B98]();
}

uint64_t sub_18E7667D0()
{
  return MEMORY[0x1E0CE9BA0]();
}

uint64_t sub_18E7667DC()
{
  return MEMORY[0x1E0CE9BB0]();
}

uint64_t sub_18E7667E8()
{
  return MEMORY[0x1E0CE9BC0]();
}

uint64_t sub_18E7667F4()
{
  return MEMORY[0x1E0CE9BD0]();
}

uint64_t sub_18E766800()
{
  return MEMORY[0x1E0CE9C08]();
}

uint64_t sub_18E76680C()
{
  return MEMORY[0x1E0CE9C18]();
}

uint64_t sub_18E766818()
{
  return MEMORY[0x1E0CE9C48]();
}

uint64_t sub_18E766824()
{
  return MEMORY[0x1E0CE9CE8]();
}

uint64_t sub_18E766830()
{
  return MEMORY[0x1E0CE9CF0]();
}

uint64_t sub_18E76683C()
{
  return MEMORY[0x1E0CE9CF8]();
}

uint64_t sub_18E766848()
{
  return MEMORY[0x1E0CE9D00]();
}

uint64_t sub_18E766854()
{
  return MEMORY[0x1E0CE9D08]();
}

uint64_t sub_18E766860()
{
  return MEMORY[0x1E0CE9D10]();
}

uint64_t sub_18E76686C()
{
  return MEMORY[0x1E0CE9D20]();
}

uint64_t sub_18E766878()
{
  return MEMORY[0x1E0CE9D30]();
}

uint64_t sub_18E766884()
{
  return MEMORY[0x1E0CE9D40]();
}

uint64_t sub_18E766890()
{
  return MEMORY[0x1E0CE9D48]();
}

uint64_t sub_18E76689C()
{
  return MEMORY[0x1E0CE9D50]();
}

uint64_t sub_18E7668A8()
{
  return MEMORY[0x1E0CE9D58]();
}

uint64_t sub_18E7668B4()
{
  return MEMORY[0x1E0CE9D60]();
}

uint64_t sub_18E7668C0()
{
  return MEMORY[0x1E0CE9D70]();
}

uint64_t sub_18E7668CC()
{
  return MEMORY[0x1E0CE9D78]();
}

uint64_t sub_18E7668D8()
{
  return MEMORY[0x1E0CE9D80]();
}

uint64_t sub_18E7668E4()
{
  return MEMORY[0x1E0CE9DB0]();
}

uint64_t sub_18E7668F0()
{
  return MEMORY[0x1E0CE9DC0]();
}

uint64_t sub_18E7668FC()
{
  return MEMORY[0x1E0CE9DD0]();
}

uint64_t sub_18E766908()
{
  return MEMORY[0x1E0CE9288]();
}

uint64_t sub_18E766914()
{
  return MEMORY[0x1E0CE92B0]();
}

uint64_t sub_18E766920()
{
  return MEMORY[0x1E0CE92C8]();
}

uint64_t sub_18E76692C()
{
  return MEMORY[0x1E0CE92E0]();
}

uint64_t sub_18E766938()
{
  return MEMORY[0x1E0CE92E8]();
}

uint64_t sub_18E766944()
{
  return MEMORY[0x1E0CE92F8]();
}

uint64_t sub_18E766950()
{
  return MEMORY[0x1E0CE9300]();
}

uint64_t sub_18E76695C()
{
  return MEMORY[0x1E0CE9318]();
}

uint64_t sub_18E766968()
{
  return MEMORY[0x1E0CE9390]();
}

uint64_t sub_18E766974()
{
  return MEMORY[0x1E0CE93A0]();
}

uint64_t sub_18E766980()
{
  return MEMORY[0x1E0CE93C8]();
}

uint64_t sub_18E76698C()
{
  return MEMORY[0x1E0CE93D8]();
}

uint64_t sub_18E766998()
{
  return MEMORY[0x1E0CE93E0]();
}

uint64_t sub_18E7669A4()
{
  return MEMORY[0x1E0CE93F8]();
}

uint64_t sub_18E7669B0()
{
  return MEMORY[0x1E0CE9420]();
}

uint64_t sub_18E7669BC()
{
  return MEMORY[0x1E0CE9430]();
}

uint64_t sub_18E7669C8()
{
  return MEMORY[0x1E0CE94D8]();
}

uint64_t sub_18E7669D4()
{
  return MEMORY[0x1E0CE94F8]();
}

uint64_t sub_18E7669E0()
{
  return MEMORY[0x1E0CE9500]();
}

uint64_t sub_18E7669EC()
{
  return MEMORY[0x1E0CE9510]();
}

uint64_t sub_18E7669F8()
{
  return MEMORY[0x1E0CE9558]();
}

uint64_t sub_18E766A04()
{
  return MEMORY[0x1E0CE9570]();
}

uint64_t sub_18E766A10()
{
  return MEMORY[0x1E0CE95C8]();
}

uint64_t sub_18E766A1C()
{
  return MEMORY[0x1E0CE95F0]();
}

uint64_t sub_18E766A28()
{
  return MEMORY[0x1E0CE9630]();
}

uint64_t sub_18E766A34()
{
  return MEMORY[0x1E0CE9650]();
}

uint64_t sub_18E766A40()
{
  return MEMORY[0x1E0CE9658]();
}

uint64_t sub_18E766A4C()
{
  return MEMORY[0x1E0CE9670]();
}

uint64_t sub_18E766A58()
{
  return MEMORY[0x1E0CE9680]();
}

uint64_t sub_18E766A64()
{
  return MEMORY[0x1E0CE9698]();
}

uint64_t sub_18E766A70()
{
  return MEMORY[0x1E0CE96A0]();
}

uint64_t sub_18E766A7C()
{
  return MEMORY[0x1E0CE96C0]();
}

uint64_t sub_18E766A88()
{
  return MEMORY[0x1E0CE96C8]();
}

uint64_t sub_18E766A94()
{
  return MEMORY[0x1E0CE96E0]();
}

uint64_t sub_18E766AA0()
{
  return MEMORY[0x1E0CE96E8]();
}

uint64_t sub_18E766AAC()
{
  return MEMORY[0x1E0CE9718]();
}

uint64_t sub_18E766AB8()
{
  return MEMORY[0x1E0CE9738]();
}

uint64_t sub_18E766AC4()
{
  return MEMORY[0x1E0CE9740]();
}

uint64_t sub_18E766AD0()
{
  return MEMORY[0x1E0CE9778]();
}

uint64_t sub_18E766ADC()
{
  return MEMORY[0x1E0CE97F0]();
}

uint64_t sub_18E766AE8()
{
  return MEMORY[0x1E0CE9800]();
}

uint64_t sub_18E766AF4()
{
  return MEMORY[0x1E0CE9810]();
}

uint64_t sub_18E766B00()
{
  return MEMORY[0x1E0CE9818]();
}

uint64_t sub_18E766B0C()
{
  return MEMORY[0x1E0CE9858]();
}

uint64_t sub_18E766B18()
{
  return MEMORY[0x1E0CE98C0]();
}

uint64_t sub_18E766B24()
{
  return MEMORY[0x1E0CE98E8]();
}

uint64_t sub_18E766B30()
{
  return MEMORY[0x1E0CE98F0]();
}

uint64_t sub_18E766B3C()
{
  return MEMORY[0x1E0C95DD8]();
}

uint64_t sub_18E766B48()
{
  return MEMORY[0x1E0C95E00]();
}

uint64_t sub_18E766B54()
{
  return MEMORY[0x1E0CD8238]();
}

uint64_t sub_18E766B60()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_18E766B6C()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_18E766B78()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_18E766B84()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t sub_18E766B90()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_18E766B9C()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_18E766BA8()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_18E766BB4()
{
  return MEMORY[0x1E0C96378]();
}

uint64_t sub_18E766BC0()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_18E766BCC()
{
  return MEMORY[0x1E0CD8268]();
}

uint64_t sub_18E766BD8()
{
  return MEMORY[0x1E0CD8280]();
}

uint64_t sub_18E766BE4()
{
  return MEMORY[0x1E0CD8318]();
}

uint64_t sub_18E766BF0()
{
  return MEMORY[0x1E0CD8328]();
}

uint64_t sub_18E766BFC()
{
  return MEMORY[0x1E0CD8338]();
}

uint64_t sub_18E766C08()
{
  return MEMORY[0x1E0CD8368]();
}

uint64_t sub_18E766C14()
{
  return MEMORY[0x1E0CD83B8]();
}

uint64_t sub_18E766C20()
{
  return MEMORY[0x1E0CD8418]();
}

uint64_t sub_18E766C2C()
{
  return MEMORY[0x1E0CD8420]();
}

uint64_t sub_18E766C38()
{
  return MEMORY[0x1E0CD8440]();
}

uint64_t sub_18E766C44()
{
  return MEMORY[0x1E0CD84D0]();
}

uint64_t sub_18E766C50()
{
  return MEMORY[0x1E0CD8550]();
}

uint64_t sub_18E766C5C()
{
  return MEMORY[0x1E0CD85D0]();
}

uint64_t sub_18E766C68()
{
  return MEMORY[0x1E0CD85E0]();
}

uint64_t sub_18E766C74()
{
  return MEMORY[0x1E0CD86C0]();
}

uint64_t sub_18E766C80()
{
  return MEMORY[0x1E0CD86F8]();
}

uint64_t sub_18E766C8C()
{
  return MEMORY[0x1E0CD8760]();
}

uint64_t sub_18E766C98()
{
  return MEMORY[0x1E0CD87D0]();
}

uint64_t sub_18E766CA4()
{
  return MEMORY[0x1E0CD8880]();
}

uint64_t sub_18E766CB0()
{
  return MEMORY[0x1E0CD88A0]();
}

uint64_t sub_18E766CBC()
{
  return MEMORY[0x1E0CD88A8]();
}

uint64_t sub_18E766CC8()
{
  return MEMORY[0x1E0CD88C0]();
}

uint64_t sub_18E766CD4()
{
  return MEMORY[0x1E0CD88F0]();
}

uint64_t sub_18E766CE0()
{
  return MEMORY[0x1E0CD89D8]();
}

uint64_t sub_18E766CEC()
{
  return MEMORY[0x1E0CD8A40]();
}

uint64_t sub_18E766CF8()
{
  return MEMORY[0x1E0CD8B48]();
}

uint64_t sub_18E766D04()
{
  return MEMORY[0x1E0CD8B98]();
}

uint64_t sub_18E766D10()
{
  return MEMORY[0x1E0CD8BA8]();
}

uint64_t sub_18E766D1C()
{
  return MEMORY[0x1E0CD8BB0]();
}

uint64_t sub_18E766D28()
{
  return MEMORY[0x1E0CD8C70]();
}

uint64_t sub_18E766D34()
{
  return MEMORY[0x1E0CD8C80]();
}

uint64_t sub_18E766D40()
{
  return MEMORY[0x1E0CD8C90]();
}

uint64_t sub_18E766D4C()
{
  return MEMORY[0x1E0CD8CE8]();
}

uint64_t sub_18E766D58()
{
  return MEMORY[0x1E0CD8CF8]();
}

uint64_t sub_18E766D64()
{
  return MEMORY[0x1E0CD8D08]();
}

uint64_t sub_18E766D70()
{
  return MEMORY[0x1E0CD8D18]();
}

uint64_t sub_18E766D7C()
{
  return MEMORY[0x1E0CD8D60]();
}

uint64_t sub_18E766D88()
{
  return MEMORY[0x1E0CD8DE8]();
}

uint64_t sub_18E766D94()
{
  return MEMORY[0x1E0CD8DF8]();
}

uint64_t sub_18E766DA0()
{
  return MEMORY[0x1E0CD8E00]();
}

uint64_t sub_18E766DAC()
{
  return MEMORY[0x1E0CD8E18]();
}

uint64_t sub_18E766DB8()
{
  return MEMORY[0x1E0CD8E20]();
}

uint64_t sub_18E766DC4()
{
  return MEMORY[0x1E0CD8E28]();
}

uint64_t sub_18E766DD0()
{
  return MEMORY[0x1E0CD8E30]();
}

uint64_t sub_18E766DDC()
{
  return MEMORY[0x1E0CD8E40]();
}

uint64_t sub_18E766DE8()
{
  return MEMORY[0x1E0CD8E58]();
}

uint64_t sub_18E766DF4()
{
  return MEMORY[0x1E0CD8E78]();
}

uint64_t sub_18E766E00()
{
  return MEMORY[0x1E0CD8E80]();
}

uint64_t sub_18E766E0C()
{
  return MEMORY[0x1E0CD8ED8]();
}

uint64_t sub_18E766E18()
{
  return MEMORY[0x1E0CD8EF0]();
}

uint64_t sub_18E766E24()
{
  return MEMORY[0x1E0CD8F00]();
}

uint64_t sub_18E766E30()
{
  return MEMORY[0x1E0CD8F10]();
}

uint64_t sub_18E766E3C()
{
  return MEMORY[0x1E0CD8F18]();
}

uint64_t sub_18E766E48()
{
  return MEMORY[0x1E0CD8F38]();
}

uint64_t sub_18E766E54()
{
  return MEMORY[0x1E0CD8F88]();
}

uint64_t sub_18E766E60()
{
  return MEMORY[0x1E0CD8FA0]();
}

uint64_t sub_18E766E6C()
{
  return MEMORY[0x1E0CD8FB0]();
}

uint64_t sub_18E766E78()
{
  return MEMORY[0x1E0CD8FC8]();
}

uint64_t sub_18E766E84()
{
  return MEMORY[0x1E0CD8FD0]();
}

uint64_t sub_18E766E90()
{
  return MEMORY[0x1E0CD8FE0]();
}

uint64_t sub_18E766E9C()
{
  return MEMORY[0x1E0CD9048]();
}

uint64_t sub_18E766EA8()
{
  return MEMORY[0x1E0CD9050]();
}

uint64_t sub_18E766EB4()
{
  return MEMORY[0x1E0CD9208]();
}

uint64_t sub_18E766EC0()
{
  return MEMORY[0x1E0CD9210]();
}

uint64_t sub_18E766ECC()
{
  return MEMORY[0x1E0CD9230]();
}

uint64_t sub_18E766ED8()
{
  return MEMORY[0x1E0CD9250]();
}

uint64_t sub_18E766EE4()
{
  return MEMORY[0x1E0CD92F0]();
}

uint64_t sub_18E766EF0()
{
  return MEMORY[0x1E0CD92F8]();
}

uint64_t sub_18E766EFC()
{
  return MEMORY[0x1E0CD9320]();
}

uint64_t sub_18E766F08()
{
  return MEMORY[0x1E0CD9370]();
}

uint64_t sub_18E766F14()
{
  return MEMORY[0x1E0CD93A0]();
}

uint64_t sub_18E766F20()
{
  return MEMORY[0x1E0CD93D0]();
}

uint64_t sub_18E766F2C()
{
  return MEMORY[0x1E0CD93E0]();
}

uint64_t sub_18E766F38()
{
  return MEMORY[0x1E0CD93F0]();
}

uint64_t sub_18E766F44()
{
  return MEMORY[0x1E0CD9408]();
}

uint64_t sub_18E766F50()
{
  return MEMORY[0x1E0CD9418]();
}

uint64_t sub_18E766F5C()
{
  return MEMORY[0x1E0CD9420]();
}

uint64_t sub_18E766F68()
{
  return MEMORY[0x1E0CD9428]();
}

uint64_t sub_18E766F74()
{
  return MEMORY[0x1E0CD9430]();
}

uint64_t sub_18E766F80()
{
  return MEMORY[0x1E0CD9490]();
}

uint64_t sub_18E766F8C()
{
  return MEMORY[0x1E0CD94E8]();
}

uint64_t sub_18E766F98()
{
  return MEMORY[0x1E0CD94F8]();
}

uint64_t sub_18E766FA4()
{
  return MEMORY[0x1E0CD9500]();
}

uint64_t sub_18E766FB0()
{
  return MEMORY[0x1E0CD95D0]();
}

uint64_t sub_18E766FBC()
{
  return MEMORY[0x1E0CD9630]();
}

uint64_t sub_18E766FC8()
{
  return MEMORY[0x1E0CD96D8]();
}

uint64_t sub_18E766FD4()
{
  return MEMORY[0x1E0CD9798]();
}

uint64_t sub_18E766FE0()
{
  return MEMORY[0x1E0CD9890]();
}

uint64_t sub_18E766FEC()
{
  return MEMORY[0x1E0CD98C8]();
}

uint64_t sub_18E766FF8()
{
  return MEMORY[0x1E0CD9958]();
}

uint64_t sub_18E767004()
{
  return MEMORY[0x1E0CD99C8]();
}

uint64_t sub_18E767010()
{
  return MEMORY[0x1E0CD99D8]();
}

uint64_t sub_18E76701C()
{
  return MEMORY[0x1E0CD99F0]();
}

uint64_t sub_18E767028()
{
  return MEMORY[0x1E0CD9A10]();
}

uint64_t sub_18E767034()
{
  return MEMORY[0x1E0CD9A20]();
}

uint64_t sub_18E767040()
{
  return MEMORY[0x1E0CD9A28]();
}

uint64_t sub_18E76704C()
{
  return MEMORY[0x1E0CD9A30]();
}

uint64_t sub_18E767058()
{
  return MEMORY[0x1E0CD9A58]();
}

uint64_t sub_18E767064()
{
  return MEMORY[0x1E0CD9A68]();
}

uint64_t sub_18E767070()
{
  return MEMORY[0x1E0CD9AA0]();
}

uint64_t sub_18E76707C()
{
  return MEMORY[0x1E0CD9AA8]();
}

uint64_t sub_18E767088()
{
  return MEMORY[0x1E0CD9B50]();
}

uint64_t sub_18E767094()
{
  return MEMORY[0x1E0CD9B68]();
}

uint64_t sub_18E7670A0()
{
  return MEMORY[0x1E0CD9B80]();
}

uint64_t sub_18E7670AC()
{
  return MEMORY[0x1E0CD9B88]();
}

uint64_t sub_18E7670B8()
{
  return MEMORY[0x1E0CD9BF0]();
}

uint64_t sub_18E7670C4()
{
  return MEMORY[0x1E0CD9C40]();
}

uint64_t sub_18E7670D0()
{
  return MEMORY[0x1E0CD9C50]();
}

uint64_t sub_18E7670DC()
{
  return MEMORY[0x1E0CD9C90]();
}

uint64_t sub_18E7670E8()
{
  return MEMORY[0x1E0CD9CB0]();
}

uint64_t sub_18E7670F4()
{
  return MEMORY[0x1E0CD9DE0]();
}

uint64_t sub_18E767100()
{
  return MEMORY[0x1E0CD9DE8]();
}

uint64_t sub_18E76710C()
{
  return MEMORY[0x1E0CD9DF8]();
}

uint64_t sub_18E767118()
{
  return MEMORY[0x1E0CD9E00]();
}

uint64_t sub_18E767124()
{
  return MEMORY[0x1E0CD9E08]();
}

uint64_t sub_18E767130()
{
  return MEMORY[0x1E0CD9E10]();
}

uint64_t sub_18E76713C()
{
  return MEMORY[0x1E0CD9E18]();
}

uint64_t sub_18E767148()
{
  return MEMORY[0x1E0CD9E38]();
}

uint64_t sub_18E767154()
{
  return MEMORY[0x1E0CD9E40]();
}

uint64_t sub_18E767160()
{
  return MEMORY[0x1E0CD9EA0]();
}

uint64_t sub_18E76716C()
{
  return MEMORY[0x1E0CD9EA8]();
}

uint64_t sub_18E767178()
{
  return MEMORY[0x1E0CD9ED0]();
}

uint64_t sub_18E767184()
{
  return MEMORY[0x1E0CD9ED8]();
}

uint64_t sub_18E767190()
{
  return MEMORY[0x1E0CD9EE0]();
}

uint64_t sub_18E76719C()
{
  return MEMORY[0x1E0CD9F70]();
}

uint64_t sub_18E7671A8()
{
  return MEMORY[0x1E0CD9F78]();
}

uint64_t sub_18E7671B4()
{
  return MEMORY[0x1E0CD9FB8]();
}

uint64_t sub_18E7671C0()
{
  return MEMORY[0x1E0CDA088]();
}

uint64_t sub_18E7671CC()
{
  return MEMORY[0x1E0CDA160]();
}

uint64_t sub_18E7671D8()
{
  return MEMORY[0x1E0CDA168]();
}

uint64_t sub_18E7671E4()
{
  return MEMORY[0x1E0CDA1C8]();
}

uint64_t sub_18E7671F0()
{
  return MEMORY[0x1E0CDA218]();
}

uint64_t sub_18E7671FC()
{
  return MEMORY[0x1E0CDA268]();
}

uint64_t sub_18E767208()
{
  return MEMORY[0x1E0CDA2C8]();
}

uint64_t sub_18E767214()
{
  return MEMORY[0x1E0CDA2D0]();
}

uint64_t sub_18E767220()
{
  return MEMORY[0x1E0CDA2D8]();
}

uint64_t sub_18E76722C()
{
  return MEMORY[0x1E0CDA2E0]();
}

uint64_t sub_18E767238()
{
  return MEMORY[0x1E0CDA2F0]();
}

uint64_t sub_18E767244()
{
  return MEMORY[0x1E0CDA360]();
}

uint64_t sub_18E767250()
{
  return MEMORY[0x1E0CDA400]();
}

uint64_t sub_18E76725C()
{
  return MEMORY[0x1E0CDA440]();
}

uint64_t sub_18E767268()
{
  return MEMORY[0x1E0CDA458]();
}

uint64_t sub_18E767274()
{
  return MEMORY[0x1E0CDA478]();
}

uint64_t sub_18E767280()
{
  return MEMORY[0x1E0CDA4A8]();
}

uint64_t sub_18E76728C()
{
  return MEMORY[0x1E0CDA4B0]();
}

uint64_t sub_18E767298()
{
  return MEMORY[0x1E0CDA4E0]();
}

uint64_t sub_18E7672A4()
{
  return MEMORY[0x1E0CDA4F8]();
}

uint64_t sub_18E7672B0()
{
  return MEMORY[0x1E0CDA508]();
}

uint64_t sub_18E7672BC()
{
  return MEMORY[0x1E0CDA5A8]();
}

uint64_t sub_18E7672C8()
{
  return MEMORY[0x1E0CDA5C0]();
}

uint64_t sub_18E7672D4()
{
  return MEMORY[0x1E0CDA5F8]();
}

uint64_t sub_18E7672E0()
{
  return MEMORY[0x1E0CDA618]();
}

uint64_t sub_18E7672EC()
{
  return MEMORY[0x1E0CDA630]();
}

uint64_t sub_18E7672F8()
{
  return MEMORY[0x1E0CDA640]();
}

uint64_t sub_18E767304()
{
  return MEMORY[0x1E0CDA648]();
}

uint64_t sub_18E767310()
{
  return MEMORY[0x1E0CDA650]();
}

uint64_t sub_18E76731C()
{
  return MEMORY[0x1E0CDA6D0]();
}

uint64_t sub_18E767328()
{
  return MEMORY[0x1E0CDA6E8]();
}

uint64_t sub_18E767334()
{
  return MEMORY[0x1E0CDA710]();
}

uint64_t sub_18E767340()
{
  return MEMORY[0x1E0CDA720]();
}

uint64_t sub_18E76734C()
{
  return MEMORY[0x1E0CDA728]();
}

uint64_t sub_18E767358()
{
  return MEMORY[0x1E0CDA740]();
}

uint64_t sub_18E767364()
{
  return MEMORY[0x1E0CDA748]();
}

uint64_t sub_18E767370()
{
  return MEMORY[0x1E0CDA7D8]();
}

uint64_t sub_18E76737C()
{
  return MEMORY[0x1E0CDA7F8]();
}

uint64_t sub_18E767388()
{
  return MEMORY[0x1E0CDA810]();
}

uint64_t sub_18E767394()
{
  return MEMORY[0x1E0CDA818]();
}

uint64_t sub_18E7673A0()
{
  return MEMORY[0x1E0CDA820]();
}

uint64_t sub_18E7673AC()
{
  return MEMORY[0x1E0CDA8D8]();
}

uint64_t sub_18E7673B8()
{
  return MEMORY[0x1E0CDA8E0]();
}

uint64_t sub_18E7673C4()
{
  return MEMORY[0x1E0CDA8F8]();
}

uint64_t sub_18E7673D0()
{
  return MEMORY[0x1E0CDA908]();
}

uint64_t sub_18E7673DC()
{
  return MEMORY[0x1E0CDA938]();
}

uint64_t sub_18E7673E8()
{
  return MEMORY[0x1E0CDA9C0]();
}

uint64_t sub_18E7673F4()
{
  return MEMORY[0x1E0CDA9C8]();
}

uint64_t sub_18E767400()
{
  return MEMORY[0x1E0CDA9D0]();
}

uint64_t sub_18E76740C()
{
  return MEMORY[0x1E0CDA9E0]();
}

uint64_t sub_18E767418()
{
  return MEMORY[0x1E0CDA9F0]();
}

uint64_t sub_18E767424()
{
  return MEMORY[0x1E0CDA9F8]();
}

uint64_t sub_18E767430()
{
  return MEMORY[0x1E0CDAA20]();
}

uint64_t sub_18E76743C()
{
  return MEMORY[0x1E0CDAA30]();
}

uint64_t sub_18E767448()
{
  return MEMORY[0x1E0CDAA68]();
}

uint64_t sub_18E767454()
{
  return MEMORY[0x1E0CDAA78]();
}

uint64_t sub_18E767460()
{
  return MEMORY[0x1E0CDAAA0]();
}

uint64_t sub_18E76746C()
{
  return MEMORY[0x1E0CDAAA8]();
}

uint64_t sub_18E767478()
{
  return MEMORY[0x1E0CDABA0]();
}

uint64_t sub_18E767484()
{
  return MEMORY[0x1E0CDABE0]();
}

uint64_t sub_18E767490()
{
  return MEMORY[0x1E0CDAC40]();
}

uint64_t sub_18E76749C()
{
  return MEMORY[0x1E0CDAC48]();
}

uint64_t sub_18E7674A8()
{
  return MEMORY[0x1E0CDACB8]();
}

uint64_t sub_18E7674B4()
{
  return MEMORY[0x1E0CDACC8]();
}

uint64_t sub_18E7674C0()
{
  return MEMORY[0x1E0CDAEA0]();
}

uint64_t sub_18E7674CC()
{
  return MEMORY[0x1E0CDAEB0]();
}

uint64_t sub_18E7674D8()
{
  return MEMORY[0x1E0CDAEB8]();
}

uint64_t sub_18E7674E4()
{
  return MEMORY[0x1E0CDAF58]();
}

uint64_t sub_18E7674F0()
{
  return MEMORY[0x1E0CDAF60]();
}

uint64_t sub_18E7674FC()
{
  return MEMORY[0x1E0CDAF70]();
}

uint64_t sub_18E767508()
{
  return MEMORY[0x1E0CDAF90]();
}

uint64_t sub_18E767514()
{
  return MEMORY[0x1E0CDAFB8]();
}

uint64_t sub_18E767520()
{
  return MEMORY[0x1E0CDAFC8]();
}

uint64_t sub_18E76752C()
{
  return MEMORY[0x1E0CDAFD0]();
}

uint64_t sub_18E767538()
{
  return MEMORY[0x1E0CDAFE0]();
}

uint64_t sub_18E767544()
{
  return MEMORY[0x1E0CDAFF8]();
}

uint64_t sub_18E767550()
{
  return MEMORY[0x1E0CDB000]();
}

uint64_t sub_18E76755C()
{
  return MEMORY[0x1E0CDB088]();
}

uint64_t sub_18E767568()
{
  return MEMORY[0x1E0CDB090]();
}

uint64_t sub_18E767574()
{
  return MEMORY[0x1E0CDB0E8]();
}

uint64_t sub_18E767580()
{
  return MEMORY[0x1E0CDB2B0]();
}

uint64_t sub_18E76758C()
{
  return MEMORY[0x1E0CDB2B8]();
}

uint64_t sub_18E767598()
{
  return MEMORY[0x1E0CDB388]();
}

uint64_t sub_18E7675A4()
{
  return MEMORY[0x1E0CDB400]();
}

uint64_t sub_18E7675B0()
{
  return MEMORY[0x1E0CDB420]();
}

uint64_t sub_18E7675BC()
{
  return MEMORY[0x1E0CDB430]();
}

uint64_t sub_18E7675C8()
{
  return MEMORY[0x1E0CDB478]();
}

uint64_t sub_18E7675D4()
{
  return MEMORY[0x1E0CDB5D0]();
}

uint64_t sub_18E7675E0()
{
  return MEMORY[0x1E0CDB5D8]();
}

uint64_t sub_18E7675EC()
{
  return MEMORY[0x1E0CDB608]();
}

uint64_t sub_18E7675F8()
{
  return MEMORY[0x1E0CDB658]();
}

uint64_t sub_18E767604()
{
  return MEMORY[0x1E0CDB668]();
}

uint64_t sub_18E767610()
{
  return MEMORY[0x1E0CDB678]();
}

uint64_t sub_18E76761C()
{
  return MEMORY[0x1E0CDB688]();
}

uint64_t sub_18E767628()
{
  return MEMORY[0x1E0CDB698]();
}

uint64_t sub_18E767634()
{
  return MEMORY[0x1E0CDB6A8]();
}

uint64_t sub_18E767640()
{
  return MEMORY[0x1E0CDB6B8]();
}

uint64_t sub_18E76764C()
{
  return MEMORY[0x1E0CDB6D0]();
}

uint64_t sub_18E767658()
{
  return MEMORY[0x1E0CDB6E0]();
}

uint64_t sub_18E767664()
{
  return MEMORY[0x1E0CDB6F0]();
}

uint64_t sub_18E767670()
{
  return MEMORY[0x1E0CDB6F8]();
}

uint64_t sub_18E76767C()
{
  return MEMORY[0x1E0CDB708]();
}

uint64_t sub_18E767688()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_18E767694()
{
  return MEMORY[0x1E0CDB938]();
}

uint64_t sub_18E7676A0()
{
  return MEMORY[0x1E0CDB948]();
}

uint64_t sub_18E7676AC()
{
  return MEMORY[0x1E0CDB958]();
}

uint64_t sub_18E7676B8()
{
  return MEMORY[0x1E0CDB9F0]();
}

uint64_t sub_18E7676C4()
{
  return MEMORY[0x1E0CDBA28]();
}

uint64_t sub_18E7676D0()
{
  return MEMORY[0x1E0CDBA38]();
}

uint64_t sub_18E7676DC()
{
  return MEMORY[0x1E0CDBA40]();
}

uint64_t sub_18E7676E8()
{
  return MEMORY[0x1E0CDBA50]();
}

uint64_t sub_18E7676F4()
{
  return MEMORY[0x1E0CDBA90]();
}

uint64_t sub_18E767700()
{
  return MEMORY[0x1E0CDBAB0]();
}

uint64_t sub_18E76770C()
{
  return MEMORY[0x1E0CDBAC0]();
}

uint64_t sub_18E767718()
{
  return MEMORY[0x1E0CDBB10]();
}

uint64_t sub_18E767724()
{
  return MEMORY[0x1E0CDBB30]();
}

uint64_t sub_18E767730()
{
  return MEMORY[0x1E0CDBB38]();
}

uint64_t sub_18E76773C()
{
  return MEMORY[0x1E0CDBC10]();
}

uint64_t sub_18E767748()
{
  return MEMORY[0x1E0CDBC88]();
}

uint64_t sub_18E767754()
{
  return MEMORY[0x1E0CDBC90]();
}

uint64_t sub_18E767760()
{
  return MEMORY[0x1E0CDBD58]();
}

uint64_t sub_18E76776C()
{
  return MEMORY[0x1E0CDBD70]();
}

uint64_t sub_18E767778()
{
  return MEMORY[0x1E0CDBDB8]();
}

uint64_t sub_18E767784()
{
  return MEMORY[0x1E0CDBE08]();
}

uint64_t sub_18E767790()
{
  return MEMORY[0x1E0CDBEF8]();
}

uint64_t sub_18E76779C()
{
  return MEMORY[0x1E0CDBF98]();
}

uint64_t sub_18E7677A8()
{
  return MEMORY[0x1E0CDBFA0]();
}

uint64_t sub_18E7677B4()
{
  return MEMORY[0x1E0CDBFA8]();
}

uint64_t sub_18E7677C0()
{
  return MEMORY[0x1E0CDC050]();
}

uint64_t sub_18E7677CC()
{
  return MEMORY[0x1E0CDC2B0]();
}

uint64_t sub_18E7677D8()
{
  return MEMORY[0x1E0CDC2B8]();
}

uint64_t sub_18E7677E4()
{
  return MEMORY[0x1E0CDC2C8]();
}

uint64_t sub_18E7677F0()
{
  return MEMORY[0x1E0CDC310]();
}

uint64_t sub_18E7677FC()
{
  return MEMORY[0x1E0CDC350]();
}

uint64_t sub_18E767808()
{
  return MEMORY[0x1E0CDC368]();
}

uint64_t sub_18E767814()
{
  return MEMORY[0x1E0CDC388]();
}

uint64_t sub_18E767820()
{
  return MEMORY[0x1E0CDC3A8]();
}

uint64_t sub_18E76782C()
{
  return MEMORY[0x1E0CDC3E0]();
}

uint64_t sub_18E767838()
{
  return MEMORY[0x1E0CDC528]();
}

uint64_t sub_18E767844()
{
  return MEMORY[0x1E0CDC550]();
}

uint64_t sub_18E767850()
{
  return MEMORY[0x1E0CDC560]();
}

uint64_t sub_18E76785C()
{
  return MEMORY[0x1E0CDC568]();
}

uint64_t sub_18E767868()
{
  return MEMORY[0x1E0CDC598]();
}

uint64_t sub_18E767874()
{
  return MEMORY[0x1E0CDC5A0]();
}

uint64_t sub_18E767880()
{
  return MEMORY[0x1E0CDC7A0]();
}

uint64_t sub_18E76788C()
{
  return MEMORY[0x1E0CDC7A8]();
}

uint64_t sub_18E767898()
{
  return MEMORY[0x1E0CDC860]();
}

uint64_t sub_18E7678A4()
{
  return MEMORY[0x1E0CDC868]();
}

uint64_t sub_18E7678B0()
{
  return MEMORY[0x1E0CDC968]();
}

uint64_t sub_18E7678BC()
{
  return MEMORY[0x1E0CDC978]();
}

uint64_t sub_18E7678C8()
{
  return MEMORY[0x1E0CDC990]();
}

uint64_t sub_18E7678D4()
{
  return MEMORY[0x1E0CDCAF8]();
}

uint64_t sub_18E7678E0()
{
  return MEMORY[0x1E0CDCB00]();
}

uint64_t sub_18E7678EC()
{
  return MEMORY[0x1E0CDCB08]();
}

uint64_t sub_18E7678F8()
{
  return MEMORY[0x1E0CDCB28]();
}

uint64_t sub_18E767904()
{
  return MEMORY[0x1E0CDCB30]();
}

uint64_t sub_18E767910()
{
  return MEMORY[0x1E0CDCB40]();
}

uint64_t sub_18E76791C()
{
  return MEMORY[0x1E0CDCE48]();
}

uint64_t sub_18E767928()
{
  return MEMORY[0x1E0CDCE60]();
}

uint64_t sub_18E767934()
{
  return MEMORY[0x1E0CDCE68]();
}

uint64_t sub_18E767940()
{
  return MEMORY[0x1E0CDCE78]();
}

uint64_t sub_18E76794C()
{
  return MEMORY[0x1E0CDCE90]();
}

uint64_t sub_18E767958()
{
  return MEMORY[0x1E0CDCEA0]();
}

uint64_t sub_18E767964()
{
  return MEMORY[0x1E0CDCEB0]();
}

uint64_t sub_18E767970()
{
  return MEMORY[0x1E0CDCEB8]();
}

uint64_t sub_18E76797C()
{
  return MEMORY[0x1E0CDCEC8]();
}

uint64_t sub_18E767988()
{
  return MEMORY[0x1E0CDD0A0]();
}

uint64_t sub_18E767994()
{
  return MEMORY[0x1E0CDD0A8]();
}

uint64_t sub_18E7679A0()
{
  return MEMORY[0x1E0CDD0B0]();
}

uint64_t sub_18E7679AC()
{
  return MEMORY[0x1E0CDD0E0]();
}

uint64_t sub_18E7679B8()
{
  return MEMORY[0x1E0CDD0E8]();
}

uint64_t sub_18E7679C4()
{
  return MEMORY[0x1E0CDD0F8]();
}

uint64_t sub_18E7679D0()
{
  return MEMORY[0x1E0CDD100]();
}

uint64_t sub_18E7679DC()
{
  return MEMORY[0x1E0CDD110]();
}

uint64_t sub_18E7679E8()
{
  return MEMORY[0x1E0CDD200]();
}

uint64_t sub_18E7679F4()
{
  return MEMORY[0x1E0CDD208]();
}

uint64_t sub_18E767A00()
{
  return MEMORY[0x1E0CDD218]();
}

uint64_t sub_18E767A0C()
{
  return MEMORY[0x1E0CDD248]();
}

uint64_t sub_18E767A18()
{
  return MEMORY[0x1E0CDD250]();
}

uint64_t sub_18E767A24()
{
  return MEMORY[0x1E0CDD270]();
}

uint64_t sub_18E767A30()
{
  return MEMORY[0x1E0CDD278]();
}

uint64_t sub_18E767A3C()
{
  return MEMORY[0x1E0CDD2D8]();
}

uint64_t sub_18E767A48()
{
  return MEMORY[0x1E0CDD300]();
}

uint64_t sub_18E767A54()
{
  return MEMORY[0x1E0CDD310]();
}

uint64_t sub_18E767A60()
{
  return MEMORY[0x1E0CDD320]();
}

uint64_t sub_18E767A6C()
{
  return MEMORY[0x1E0CDD348]();
}

uint64_t sub_18E767A78()
{
  return MEMORY[0x1E0CDD358]();
}

uint64_t sub_18E767A84()
{
  return MEMORY[0x1E0CDD368]();
}

uint64_t sub_18E767A90()
{
  return MEMORY[0x1E0CDD380]();
}

uint64_t sub_18E767A9C()
{
  return MEMORY[0x1E0CDD390]();
}

uint64_t sub_18E767AA8()
{
  return MEMORY[0x1E0CDD3A0]();
}

uint64_t sub_18E767AB4()
{
  return MEMORY[0x1E0CDD3B0]();
}

uint64_t sub_18E767AC0()
{
  return MEMORY[0x1E0CDD3C0]();
}

uint64_t sub_18E767ACC()
{
  return MEMORY[0x1E0CDD438]();
}

uint64_t sub_18E767AD8()
{
  return MEMORY[0x1E0CDD4D8]();
}

uint64_t sub_18E767AE4()
{
  return MEMORY[0x1E0CDD4E0]();
}

uint64_t sub_18E767AF0()
{
  return MEMORY[0x1E0CDD520]();
}

uint64_t sub_18E767AFC()
{
  return MEMORY[0x1E0CDD560]();
}

uint64_t sub_18E767B08()
{
  return MEMORY[0x1E0CDD590]();
}

uint64_t sub_18E767B14()
{
  return MEMORY[0x1E0CDD5E0]();
}

uint64_t sub_18E767B20()
{
  return MEMORY[0x1E0CDD5F8]();
}

uint64_t sub_18E767B2C()
{
  return MEMORY[0x1E0CDD628]();
}

uint64_t sub_18E767B38()
{
  return MEMORY[0x1E0CDD638]();
}

uint64_t sub_18E767B44()
{
  return MEMORY[0x1E0CDD688]();
}

uint64_t sub_18E767B50()
{
  return MEMORY[0x1E0CDD6F8]();
}

uint64_t sub_18E767B5C()
{
  return MEMORY[0x1E0CDD718]();
}

uint64_t sub_18E767B68()
{
  return MEMORY[0x1E0CDD740]();
}

uint64_t sub_18E767B74()
{
  return MEMORY[0x1E0CDD750]();
}

uint64_t sub_18E767B80()
{
  return MEMORY[0x1E0CDD770]();
}

uint64_t sub_18E767B8C()
{
  return MEMORY[0x1E0CDD780]();
}

uint64_t sub_18E767B98()
{
  return MEMORY[0x1E0CDD860]();
}

uint64_t sub_18E767BA4()
{
  return MEMORY[0x1E0CDD878]();
}

uint64_t sub_18E767BB0()
{
  return MEMORY[0x1E0CDD928]();
}

uint64_t sub_18E767BBC()
{
  return MEMORY[0x1E0CDD938]();
}

uint64_t sub_18E767BC8()
{
  return MEMORY[0x1E0CDD960]();
}

uint64_t sub_18E767BD4()
{
  return MEMORY[0x1E0CDD988]();
}

uint64_t sub_18E767BE0()
{
  return MEMORY[0x1E0CDD998]();
}

uint64_t sub_18E767BEC()
{
  return MEMORY[0x1E0CDD9B0]();
}

uint64_t sub_18E767BF8()
{
  return MEMORY[0x1E0CDD9D8]();
}

uint64_t sub_18E767C04()
{
  return MEMORY[0x1E0CDD9E8]();
}

uint64_t sub_18E767C10()
{
  return MEMORY[0x1E0CDDA10]();
}

uint64_t sub_18E767C1C()
{
  return MEMORY[0x1E0CDDA28]();
}

uint64_t sub_18E767C28()
{
  return MEMORY[0x1E0CDDA30]();
}

uint64_t sub_18E767C34()
{
  return MEMORY[0x1E0CDDA40]();
}

uint64_t sub_18E767C40()
{
  return MEMORY[0x1E0CDDA70]();
}

uint64_t sub_18E767C4C()
{
  return MEMORY[0x1E0CDDAA8]();
}

uint64_t sub_18E767C58()
{
  return MEMORY[0x1E0CDDB68]();
}

uint64_t sub_18E767C64()
{
  return MEMORY[0x1E0CDDB88]();
}

uint64_t sub_18E767C70()
{
  return MEMORY[0x1E0CDDB98]();
}

uint64_t sub_18E767C7C()
{
  return MEMORY[0x1E0CDDC48]();
}

uint64_t sub_18E767C88()
{
  return MEMORY[0x1E0CDDDA0]();
}

uint64_t sub_18E767C94()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_18E767CA0()
{
  return MEMORY[0x1E0CDDDE8]();
}

uint64_t sub_18E767CAC()
{
  return MEMORY[0x1E0D133B8]();
}

uint64_t sub_18E767CB8()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_18E767CC4()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_18E767CD0()
{
  return MEMORY[0x1E0CDDE78]();
}

uint64_t sub_18E767CDC()
{
  return MEMORY[0x1E0CDDE98]();
}

uint64_t sub_18E767CE8()
{
  return MEMORY[0x1E0CDDEA0]();
}

uint64_t sub_18E767CF4()
{
  return MEMORY[0x1E0CDDED0]();
}

uint64_t sub_18E767D00()
{
  return MEMORY[0x1E0CDDEE0]();
}

uint64_t sub_18E767D0C()
{
  return MEMORY[0x1E0CDDF08]();
}

uint64_t sub_18E767D18()
{
  return MEMORY[0x1E0CDDF60]();
}

uint64_t sub_18E767D24()
{
  return MEMORY[0x1E0CDDFD0]();
}

uint64_t sub_18E767D30()
{
  return MEMORY[0x1E0CDDFF0]();
}

uint64_t sub_18E767D3C()
{
  return MEMORY[0x1E0CDE018]();
}

uint64_t sub_18E767D48()
{
  return MEMORY[0x1E0CDE0F8]();
}

uint64_t sub_18E767D54()
{
  return MEMORY[0x1E0CDE120]();
}

uint64_t sub_18E767D60()
{
  return MEMORY[0x1E0CDE140]();
}

uint64_t sub_18E767D6C()
{
  return MEMORY[0x1E0CDE1A8]();
}

uint64_t sub_18E767D78()
{
  return MEMORY[0x1E0CDE210]();
}

uint64_t sub_18E767D84()
{
  return MEMORY[0x1E0CDE230]();
}

uint64_t sub_18E767D90()
{
  return MEMORY[0x1E0CDE278]();
}

uint64_t sub_18E767D9C()
{
  return MEMORY[0x1E0CDE298]();
}

uint64_t sub_18E767DA8()
{
  return MEMORY[0x1E0CDE368]();
}

uint64_t sub_18E767DB4()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_18E767DC0()
{
  return MEMORY[0x1E0CDE480]();
}

uint64_t sub_18E767DCC()
{
  return MEMORY[0x1E0CDE490]();
}

uint64_t sub_18E767DD8()
{
  return MEMORY[0x1E0CDE4B8]();
}

uint64_t sub_18E767DE4()
{
  return MEMORY[0x1E0CDE4D0]();
}

uint64_t sub_18E767DF0()
{
  return MEMORY[0x1E0CDE550]();
}

uint64_t sub_18E767DFC()
{
  return MEMORY[0x1E0CDE570]();
}

uint64_t sub_18E767E08()
{
  return MEMORY[0x1E0CDE590]();
}

uint64_t sub_18E767E14()
{
  return MEMORY[0x1E0CDE5B0]();
}

uint64_t sub_18E767E20()
{
  return MEMORY[0x1E0CDE5D0]();
}

uint64_t sub_18E767E2C()
{
  return MEMORY[0x1E0CDE5F0]();
}

uint64_t sub_18E767E38()
{
  return MEMORY[0x1E0CDE658]();
}

uint64_t sub_18E767E44()
{
  return MEMORY[0x1E0CDE698]();
}

uint64_t sub_18E767E50()
{
  return MEMORY[0x1E0CDE700]();
}

uint64_t sub_18E767E5C()
{
  return MEMORY[0x1E0CDE718]();
}

uint64_t sub_18E767E68()
{
  return MEMORY[0x1E0CDE738]();
}

uint64_t sub_18E767E74()
{
  return MEMORY[0x1E0CDE788]();
}

uint64_t sub_18E767E80()
{
  return MEMORY[0x1E0CDE7C8]();
}

uint64_t sub_18E767E8C()
{
  return MEMORY[0x1E0CDE7F8]();
}

uint64_t sub_18E767E98()
{
  return MEMORY[0x1E0CDE808]();
}

uint64_t sub_18E767EA4()
{
  return MEMORY[0x1E0CDE8F0]();
}

uint64_t sub_18E767EB0()
{
  return MEMORY[0x1E0CDE928]();
}

uint64_t sub_18E767EBC()
{
  return MEMORY[0x1E0CDE938]();
}

uint64_t sub_18E767EC8()
{
  return MEMORY[0x1E0CDE960]();
}

uint64_t sub_18E767ED4()
{
  return MEMORY[0x1E0CDEA28]();
}

uint64_t sub_18E767EE0()
{
  return MEMORY[0x1E0CDEA38]();
}

uint64_t sub_18E767EEC()
{
  return MEMORY[0x1E0CDEA88]();
}

uint64_t sub_18E767EF8()
{
  return MEMORY[0x1E0CDEAB8]();
}

uint64_t sub_18E767F04()
{
  return MEMORY[0x1E0CDEB50]();
}

uint64_t sub_18E767F10()
{
  return MEMORY[0x1E0CDEC10]();
}

uint64_t sub_18E767F1C()
{
  return MEMORY[0x1E0CDEC48]();
}

uint64_t sub_18E767F28()
{
  return MEMORY[0x1E0CDED40]();
}

uint64_t sub_18E767F34()
{
  return MEMORY[0x1E0CDED90]();
}

uint64_t sub_18E767F40()
{
  return MEMORY[0x1E0CDEE08]();
}

uint64_t sub_18E767F4C()
{
  return MEMORY[0x1E0CDEE78]();
}

uint64_t sub_18E767F58()
{
  return MEMORY[0x1E0CDEEF0]();
}

uint64_t sub_18E767F64()
{
  return MEMORY[0x1E0CDEF30]();
}

uint64_t sub_18E767F70()
{
  return MEMORY[0x1E0CDEF40]();
}

uint64_t sub_18E767F7C()
{
  return MEMORY[0x1E0CDEF58]();
}

uint64_t sub_18E767F88()
{
  return MEMORY[0x1E0CDEFB8]();
}

uint64_t sub_18E767F94()
{
  return MEMORY[0x1E0CDF010]();
}

uint64_t sub_18E767FA0()
{
  return MEMORY[0x1E0CDF058]();
}

uint64_t sub_18E767FAC()
{
  return MEMORY[0x1E0CDF090]();
}

uint64_t sub_18E767FB8()
{
  return MEMORY[0x1E0CDF0C0]();
}

uint64_t sub_18E767FC4()
{
  return MEMORY[0x1E0CDF0D8]();
}

uint64_t sub_18E767FD0()
{
  return MEMORY[0x1E0CDF118]();
}

uint64_t sub_18E767FDC()
{
  return MEMORY[0x1E0CDF128]();
}

uint64_t sub_18E767FE8()
{
  return MEMORY[0x1E0CDF138]();
}

uint64_t sub_18E767FF4()
{
  return MEMORY[0x1E0CDF158]();
}

uint64_t sub_18E768000()
{
  return MEMORY[0x1E0CDF1E8]();
}

uint64_t sub_18E76800C()
{
  return MEMORY[0x1E0CDF1F8]();
}

uint64_t sub_18E768018()
{
  return MEMORY[0x1E0CDF208]();
}

uint64_t sub_18E768024()
{
  return MEMORY[0x1E0CDF278]();
}

uint64_t sub_18E768030()
{
  return MEMORY[0x1E0CDF2B0]();
}

uint64_t sub_18E76803C()
{
  return MEMORY[0x1E0CDF3B0]();
}

uint64_t sub_18E768048()
{
  return MEMORY[0x1E0CDF3F0]();
}

uint64_t sub_18E768054()
{
  return MEMORY[0x1E0CDF400]();
}

uint64_t sub_18E768060()
{
  return MEMORY[0x1E0CDF408]();
}

uint64_t sub_18E76806C()
{
  return MEMORY[0x1E0CDF438]();
}

uint64_t sub_18E768078()
{
  return MEMORY[0x1E0CDF440]();
}

uint64_t sub_18E768084()
{
  return MEMORY[0x1E0CDF458]();
}

uint64_t sub_18E768090()
{
  return MEMORY[0x1E0CDF488]();
}

uint64_t sub_18E76809C()
{
  return MEMORY[0x1E0CDF490]();
}

uint64_t sub_18E7680A8()
{
  return MEMORY[0x1E0CDF4A8]();
}

uint64_t sub_18E7680B4()
{
  return MEMORY[0x1E0CDF4B8]();
}

uint64_t sub_18E7680C0()
{
  return MEMORY[0x1E0CDF4D0]();
}

uint64_t sub_18E7680CC()
{
  return MEMORY[0x1E0CDF508]();
}

uint64_t sub_18E7680D8()
{
  return MEMORY[0x1E0CDF520]();
}

uint64_t sub_18E7680E4()
{
  return MEMORY[0x1E0CDF530]();
}

uint64_t sub_18E7680F0()
{
  return MEMORY[0x1E0CDF588]();
}

uint64_t sub_18E7680FC()
{
  return MEMORY[0x1E0CDF5F8]();
}

uint64_t sub_18E768108()
{
  return MEMORY[0x1E0CDF608]();
}

uint64_t sub_18E768114()
{
  return MEMORY[0x1E0CDF628]();
}

uint64_t sub_18E768120()
{
  return MEMORY[0x1E0CDF638]();
}

uint64_t sub_18E76812C()
{
  return MEMORY[0x1E0CDF6A8]();
}

uint64_t sub_18E768138()
{
  return MEMORY[0x1E0CDF6D8]();
}

uint64_t sub_18E768144()
{
  return MEMORY[0x1E0CDF700]();
}

uint64_t sub_18E768150()
{
  return MEMORY[0x1E0CDF730]();
}

uint64_t sub_18E76815C()
{
  return MEMORY[0x1E0CDF748]();
}

uint64_t sub_18E768168()
{
  return MEMORY[0x1E0CDF788]();
}

uint64_t sub_18E768174()
{
  return MEMORY[0x1E0CDF7E8]();
}

uint64_t sub_18E768180()
{
  return MEMORY[0x1E0CDF810]();
}

uint64_t sub_18E76818C()
{
  return MEMORY[0x1E0D133C8]();
}

uint64_t sub_18E768198()
{
  return MEMORY[0x1E0CDF878]();
}

uint64_t sub_18E7681A4()
{
  return MEMORY[0x1E0CDF880]();
}

uint64_t sub_18E7681B0()
{
  return MEMORY[0x1E0CDF888]();
}

uint64_t sub_18E7681BC()
{
  return MEMORY[0x1E0CDF8F0]();
}

uint64_t sub_18E7681C8()
{
  return MEMORY[0x1E0CDF900]();
}

uint64_t sub_18E7681D4()
{
  return MEMORY[0x1E0CDF908]();
}

uint64_t sub_18E7681E0()
{
  return MEMORY[0x1E0CDF918]();
}

uint64_t sub_18E7681EC()
{
  return MEMORY[0x1E0CDF928]();
}

uint64_t sub_18E7681F8()
{
  return MEMORY[0x1E0CDF938]();
}

uint64_t sub_18E768204()
{
  return MEMORY[0x1E0CDF950]();
}

uint64_t sub_18E768210()
{
  return MEMORY[0x1E0CDF968]();
}

uint64_t sub_18E76821C()
{
  return MEMORY[0x1E0CDF970]();
}

uint64_t sub_18E768228()
{
  return MEMORY[0x1E0CDF988]();
}

uint64_t sub_18E768234()
{
  return MEMORY[0x1E0CDF990]();
}

uint64_t sub_18E768240()
{
  return MEMORY[0x1E0CDF9C8]();
}

uint64_t sub_18E76824C()
{
  return MEMORY[0x1E0CDF9E8]();
}

uint64_t sub_18E768258()
{
  return MEMORY[0x1E0CDF9F0]();
}

uint64_t sub_18E768264()
{
  return MEMORY[0x1E0CDFA08]();
}

uint64_t sub_18E768270()
{
  return MEMORY[0x1E0CDFA10]();
}

uint64_t sub_18E76827C()
{
  return MEMORY[0x1E0CDFA20]();
}

uint64_t sub_18E768288()
{
  return MEMORY[0x1E0CDFA28]();
}

uint64_t sub_18E768294()
{
  return MEMORY[0x1E0CDFA38]();
}

uint64_t sub_18E7682A0()
{
  return MEMORY[0x1E0CDFA68]();
}

uint64_t sub_18E7682AC()
{
  return MEMORY[0x1E0CDFB40]();
}

uint64_t sub_18E7682B8()
{
  return MEMORY[0x1E0CDFB48]();
}

uint64_t sub_18E7682C4()
{
  return MEMORY[0x1E0CDFB50]();
}

uint64_t sub_18E7682D0()
{
  return MEMORY[0x1E0CDFB68]();
}

uint64_t sub_18E7682DC()
{
  return MEMORY[0x1E0CDFB70]();
}

uint64_t sub_18E7682E8()
{
  return MEMORY[0x1E0CDFB80]();
}

uint64_t sub_18E7682F4()
{
  return MEMORY[0x1E0CDFC18]();
}

uint64_t sub_18E768300()
{
  return MEMORY[0x1E0CDFC28]();
}

uint64_t sub_18E76830C()
{
  return MEMORY[0x1E0CDFC40]();
}

uint64_t sub_18E768318()
{
  return MEMORY[0x1E0CDFC58]();
}

uint64_t sub_18E768324()
{
  return MEMORY[0x1E0CDFCD8]();
}

uint64_t sub_18E768330()
{
  return MEMORY[0x1E0CDFCE0]();
}

uint64_t sub_18E76833C()
{
  return MEMORY[0x1E0CDFD20]();
}

uint64_t sub_18E768348()
{
  return MEMORY[0x1E0CDFD38]();
}

uint64_t sub_18E768354()
{
  return MEMORY[0x1E0CDFD48]();
}

uint64_t sub_18E768360()
{
  return MEMORY[0x1E0CDFD58]();
}

uint64_t sub_18E76836C()
{
  return MEMORY[0x1E0CDFD70]();
}

uint64_t sub_18E768378()
{
  return MEMORY[0x1E0CDFDB8]();
}

uint64_t sub_18E768384()
{
  return MEMORY[0x1E0CDFE48]();
}

uint64_t sub_18E768390()
{
  return MEMORY[0x1E0CDFE58]();
}

uint64_t sub_18E76839C()
{
  return MEMORY[0x1E0CDFE98]();
}

uint64_t sub_18E7683A8()
{
  return MEMORY[0x1E0CDFEA8]();
}

uint64_t sub_18E7683B4()
{
  return MEMORY[0x1E0CDFF28]();
}

uint64_t sub_18E7683C0()
{
  return MEMORY[0x1E0CDFF48]();
}

uint64_t sub_18E7683CC()
{
  return MEMORY[0x1E0CDFF58]();
}

uint64_t sub_18E7683D8()
{
  return MEMORY[0x1E0CDFF60]();
}

uint64_t sub_18E7683E4()
{
  return MEMORY[0x1E0CDFF78]();
}

uint64_t sub_18E7683F0()
{
  return MEMORY[0x1E0CDFFB8]();
}

uint64_t sub_18E7683FC()
{
  return MEMORY[0x1E0CE0008]();
}

uint64_t sub_18E768408()
{
  return MEMORY[0x1E0CE0020]();
}

uint64_t sub_18E768414()
{
  return MEMORY[0x1E0CE0038]();
}

uint64_t sub_18E768420()
{
  return MEMORY[0x1E0CE0048]();
}

uint64_t sub_18E76842C()
{
  return MEMORY[0x1E0CE0058]();
}

uint64_t sub_18E768438()
{
  return MEMORY[0x1E0CE00C0]();
}

uint64_t sub_18E768444()
{
  return MEMORY[0x1E0CE00D8]();
}

uint64_t sub_18E768450()
{
  return MEMORY[0x1E0CE00E0]();
}

uint64_t sub_18E76845C()
{
  return MEMORY[0x1E0CE0118]();
}

uint64_t sub_18E768468()
{
  return MEMORY[0x1E0CE0128]();
}

uint64_t sub_18E768474()
{
  return MEMORY[0x1E0CE0148]();
}

uint64_t sub_18E768480()
{
  return MEMORY[0x1E0CE0168]();
}

uint64_t sub_18E76848C()
{
  return MEMORY[0x1E0CE0178]();
}

uint64_t sub_18E768498()
{
  return MEMORY[0x1E0CE0198]();
}

uint64_t sub_18E7684A4()
{
  return MEMORY[0x1E0CE01B0]();
}

uint64_t sub_18E7684B0()
{
  return MEMORY[0x1E0CE01D8]();
}

uint64_t sub_18E7684BC()
{
  return MEMORY[0x1E0CE0200]();
}

uint64_t sub_18E7684C8()
{
  return MEMORY[0x1E0CE0208]();
}

uint64_t sub_18E7684D4()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_18E7684E0()
{
  return MEMORY[0x1E0CE0228]();
}

uint64_t sub_18E7684EC()
{
  return MEMORY[0x1E0CE0238]();
}

uint64_t sub_18E7684F8()
{
  return MEMORY[0x1E0CE0280]();
}

uint64_t sub_18E768504()
{
  return MEMORY[0x1E0CE0290]();
}

uint64_t sub_18E768510()
{
  return MEMORY[0x1E0CE0298]();
}

uint64_t sub_18E76851C()
{
  return MEMORY[0x1E0CE02C8]();
}

uint64_t sub_18E768528()
{
  return MEMORY[0x1E0CE02D0]();
}

uint64_t sub_18E768534()
{
  return MEMORY[0x1E0CE02D8]();
}

uint64_t sub_18E768540()
{
  return MEMORY[0x1E0CE02F0]();
}

uint64_t sub_18E76854C()
{
  return MEMORY[0x1E0CE02F8]();
}

uint64_t sub_18E768558()
{
  return MEMORY[0x1E0CE0330]();
}

uint64_t sub_18E768564()
{
  return MEMORY[0x1E0CE03F0]();
}

uint64_t sub_18E768570()
{
  return MEMORY[0x1E0CE04B8]();
}

uint64_t sub_18E76857C()
{
  return MEMORY[0x1E0CE05A0]();
}

uint64_t sub_18E768588()
{
  return MEMORY[0x1E0CE05E0]();
}

uint64_t sub_18E768594()
{
  return MEMORY[0x1E0CE0648]();
}

uint64_t sub_18E7685A0()
{
  return MEMORY[0x1E0CE0670]();
}

uint64_t sub_18E7685AC()
{
  return MEMORY[0x1E0CE0688]();
}

uint64_t sub_18E7685B8()
{
  return MEMORY[0x1E0CE0690]();
}

uint64_t sub_18E7685C4()
{
  return MEMORY[0x1E0CE0698]();
}

uint64_t sub_18E7685D0()
{
  return MEMORY[0x1E0CE06B8]();
}

uint64_t sub_18E7685DC()
{
  return MEMORY[0x1E0CE06C8]();
}

uint64_t sub_18E7685E8()
{
  return MEMORY[0x1E0CE06D0]();
}

uint64_t sub_18E7685F4()
{
  return MEMORY[0x1E0CE06E0]();
}

uint64_t sub_18E768600()
{
  return MEMORY[0x1E0CE06E8]();
}

uint64_t sub_18E76860C()
{
  return MEMORY[0x1E0CE8460]();
}

uint64_t sub_18E768618()
{
  return MEMORY[0x1E0CE8468]();
}

uint64_t sub_18E768624()
{
  return MEMORY[0x1E0CE8560]();
}

uint64_t sub_18E768630()
{
  return MEMORY[0x1E0CE8568]();
}

uint64_t sub_18E76863C()
{
  return MEMORY[0x1E0CE85B0]();
}

uint64_t sub_18E768648()
{
  return MEMORY[0x1E0CE85B8]();
}

uint64_t sub_18E768654()
{
  return MEMORY[0x1E0CE85F8]();
}

uint64_t sub_18E768660()
{
  return MEMORY[0x1E0CE8600]();
}

uint64_t sub_18E76866C()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_18E768678()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_18E768684()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_18E768690()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_18E76869C()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_18E7686A8()
{
  return MEMORY[0x1E0DEF6A0]();
}

uint64_t sub_18E7686B4()
{
  return MEMORY[0x1E0DEF6A8]();
}

uint64_t sub_18E7686C0()
{
  return MEMORY[0x1E0DEF6B0]();
}

uint64_t sub_18E7686CC()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_18E7686D8()
{
  return MEMORY[0x1E0DEF708]();
}

uint64_t sub_18E7686E4()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t sub_18E7686F0()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_18E7686FC()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_18E768708()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_18E768714()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_18E768720()
{
  return MEMORY[0x1E0DACA90]();
}

uint64_t sub_18E76872C()
{
  return MEMORY[0x1E0DACAA0]();
}

uint64_t sub_18E768738()
{
  return MEMORY[0x1E0DACAC0]();
}

uint64_t sub_18E768744()
{
  return MEMORY[0x1E0DACAC8]();
}

uint64_t sub_18E768750()
{
  return MEMORY[0x1E0DACAE0]();
}

uint64_t sub_18E76875C()
{
  return MEMORY[0x1E0DACB30]();
}

uint64_t sub_18E768768()
{
  return MEMORY[0x1E0DACB38]();
}

uint64_t sub_18E768774()
{
  return MEMORY[0x1E0DACB40]();
}

uint64_t sub_18E768780()
{
  return MEMORY[0x1E0DACB70]();
}

uint64_t sub_18E76878C()
{
  return MEMORY[0x1E0DACB98]();
}

uint64_t sub_18E768798()
{
  return MEMORY[0x1E0DACBA0]();
}

uint64_t sub_18E7687A4()
{
  return MEMORY[0x1E0DACBB0]();
}

uint64_t sub_18E7687B0()
{
  return MEMORY[0x1E0DACBC0]();
}

uint64_t sub_18E7687BC()
{
  return MEMORY[0x1E0DACBC8]();
}

uint64_t sub_18E7687C8()
{
  return MEMORY[0x1E0DACBD0]();
}

uint64_t sub_18E7687D4()
{
  return MEMORY[0x1E0DACBE8]();
}

uint64_t sub_18E7687E0()
{
  return MEMORY[0x1E0DACBF0]();
}

uint64_t sub_18E7687EC()
{
  return MEMORY[0x1E0DACBF8]();
}

uint64_t sub_18E7687F8()
{
  return MEMORY[0x1E0DACC00]();
}

uint64_t sub_18E768804()
{
  return MEMORY[0x1E0DACC10]();
}

uint64_t sub_18E768810()
{
  return MEMORY[0x1E0DACC20]();
}

uint64_t sub_18E76881C()
{
  return MEMORY[0x1E0DACC30]();
}

uint64_t sub_18E768828()
{
  return MEMORY[0x1E0DACC38]();
}

uint64_t sub_18E768834()
{
  return MEMORY[0x1E0DACC40]();
}

uint64_t sub_18E768840()
{
  return MEMORY[0x1E0DACC48]();
}

uint64_t sub_18E76884C()
{
  return MEMORY[0x1E0DACC50]();
}

uint64_t sub_18E768858()
{
  return MEMORY[0x1E0DACC58]();
}

uint64_t sub_18E768864()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_18E768870()
{
  return MEMORY[0x1E0CB17E8]();
}

uint64_t sub_18E76887C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_18E768888()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_18E768894()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_18E7688A0()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_18E7688AC()
{
  return MEMORY[0x1E0DEA1C8]();
}

uint64_t sub_18E7688B8()
{
  return MEMORY[0x1E0DEA350]();
}

uint64_t sub_18E7688C4()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_18E7688D0()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_18E7688DC()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_18E7688E8()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t sub_18E7688F4()
{
  return MEMORY[0x1E0DEA4B0]();
}

uint64_t sub_18E768900()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_18E76890C()
{
  return MEMORY[0x1E0CB18A0]();
}

uint64_t sub_18E768918()
{
  return MEMORY[0x1E0CB18C0]();
}

uint64_t sub_18E768924()
{
  return MEMORY[0x1E0CB18D8]();
}

uint64_t sub_18E768930()
{
  return MEMORY[0x1E0CB18E0]();
}

uint64_t sub_18E76893C()
{
  return MEMORY[0x1E0CB18E8]();
}

uint64_t sub_18E768948()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t sub_18E768954()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_18E768960()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t sub_18E76896C()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_18E768978()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_18E768984()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_18E768990()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_18E76899C()
{
  return MEMORY[0x1E0CB1A58]();
}

uint64_t sub_18E7689A8()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_18E7689B4()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_18E7689C0()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_18E7689CC()
{
  return MEMORY[0x1E0DEA688]();
}

uint64_t sub_18E7689D8()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_18E7689E4()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_18E7689F0()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_18E7689FC()
{
  return MEMORY[0x1E0DEA7C8]();
}

uint64_t sub_18E768A08()
{
  return MEMORY[0x1E0DEA7F0]();
}

uint64_t sub_18E768A14()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_18E768A20()
{
  return MEMORY[0x1E0DEA820]();
}

uint64_t sub_18E768A2C()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_18E768A38()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_18E768A44()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_18E768A50()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_18E768A5C()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_18E768A68()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_18E768A74()
{
  return MEMORY[0x1E0DEA8F8]();
}

uint64_t sub_18E768A80()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_18E768A8C()
{
  return MEMORY[0x1E0DEA950]();
}

uint64_t sub_18E768A98()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_18E768AA4()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_18E768AB0()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_18E768ABC()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_18E768AC8()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_18E768AD4()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_18E768AE0()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_18E768AEC()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_18E768AF8()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_18E768B04()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_18E768B10()
{
  return MEMORY[0x1E0DEADF0]();
}

uint64_t sub_18E768B1C()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_18E768B28()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_18E768B34()
{
  return MEMORY[0x1E0C91CF8]();
}

uint64_t sub_18E768B40()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_18E768B4C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_18E768B58()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_18E768B64()
{
  return MEMORY[0x1E0DF0698]();
}

uint64_t sub_18E768B70()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_18E768B7C()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_18E768B88()
{
  return MEMORY[0x1E0DF06F8]();
}

uint64_t sub_18E768B94()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_18E768BA0()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_18E768BAC()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_18E768BB8()
{
  return MEMORY[0x1E0DF08C8]();
}

uint64_t sub_18E768BC4()
{
  return MEMORY[0x1E0DF08D0]();
}

uint64_t sub_18E768BD0()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_18E768BDC()
{
  return MEMORY[0x1E0CB1B48]();
}

uint64_t sub_18E768BE8()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_18E768BF4()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_18E768C00()
{
  return MEMORY[0x1E0DEB060]();
}

uint64_t sub_18E768C0C()
{
  return MEMORY[0x1E0CB1B88]();
}

uint64_t sub_18E768C18()
{
  return MEMORY[0x1E0CB1B90]();
}

uint64_t sub_18E768C24()
{
  return MEMORY[0x1E0CB1B98]();
}

uint64_t sub_18E768C30()
{
  return MEMORY[0x1E0CB1BA0]();
}

uint64_t sub_18E768C3C()
{
  return MEMORY[0x1E0DEB178]();
}

uint64_t sub_18E768C48()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_18E768C54()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_18E768C60()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_18E768C6C()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_18E768C78()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_18E768C84()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_18E768C90()
{
  return MEMORY[0x1E0DEB5A0]();
}

uint64_t sub_18E768C9C()
{
  return MEMORY[0x1E0DEB5A8]();
}

uint64_t sub_18E768CA8()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_18E768CB4()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_18E768CC0()
{
  return MEMORY[0x1E0CE0728]();
}

uint64_t sub_18E768CCC()
{
  return MEMORY[0x1E0CB1C58]();
}

uint64_t sub_18E768CD8()
{
  return MEMORY[0x1E0D372C0]();
}

uint64_t sub_18E768CE4()
{
  return MEMORY[0x1E0CE9DE0]();
}

uint64_t sub_18E768CF0()
{
  return MEMORY[0x1E0CE9DE8]();
}

uint64_t sub_18E768CFC()
{
  return MEMORY[0x1E0D372C8]();
}

uint64_t sub_18E768D08()
{
  return MEMORY[0x1E0CE9DF0]();
}

uint64_t sub_18E768D14()
{
  return MEMORY[0x1E0CE9DF8]();
}

uint64_t sub_18E768D20()
{
  return MEMORY[0x1E0D372D0]();
}

uint64_t sub_18E768D2C()
{
  return MEMORY[0x1E0CB1CB0]();
}

uint64_t sub_18E768D38()
{
  return MEMORY[0x1E0CE9E00]();
}

uint64_t sub_18E768D44()
{
  return MEMORY[0x1E0CB1DD0]();
}

uint64_t sub_18E768D50()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_18E768D5C()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_18E768D68()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_18E768D74()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_18E768D80()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_18E768D8C()
{
  return MEMORY[0x1E0CE9E08]();
}

uint64_t sub_18E768D98()
{
  return MEMORY[0x1E0CE9E10]();
}

uint64_t sub_18E768DA4()
{
  return MEMORY[0x1E0CE9E20]();
}

uint64_t sub_18E768DB0()
{
  return MEMORY[0x1E0CE9E38]();
}

uint64_t sub_18E768DBC()
{
  return MEMORY[0x1E0DEFDA8]();
}

uint64_t sub_18E768DC8()
{
  return MEMORY[0x1E0D35258]();
}

uint64_t sub_18E768DD4()
{
  return MEMORY[0x1E0CE9E48]();
}

uint64_t sub_18E768DE0()
{
  return MEMORY[0x1E0CE9E50]();
}

uint64_t sub_18E768DEC()
{
  return MEMORY[0x1E0CE9E60]();
}

uint64_t sub_18E768DF8()
{
  return MEMORY[0x1E0DEF7E8]();
}

uint64_t sub_18E768E04()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_18E768E10()
{
  return MEMORY[0x1E0DEF848]();
}

uint64_t sub_18E768E1C()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_18E768E28()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_18E768E34()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_18E768E40()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_18E768E4C()
{
  return MEMORY[0x1E0D37330]();
}

uint64_t sub_18E768E58()
{
  return MEMORY[0x1E0CB1EE0]();
}

uint64_t sub_18E768E64()
{
  return MEMORY[0x1E0CB1EF0]();
}

uint64_t sub_18E768E70()
{
  return MEMORY[0x1E0CB1F08]();
}

uint64_t sub_18E768E7C()
{
  return MEMORY[0x1E0CB1F30]();
}

uint64_t sub_18E768E88()
{
  return MEMORY[0x1E0CB1F50]();
}

uint64_t sub_18E768E94()
{
  return MEMORY[0x1E0CE9E90]();
}

uint64_t sub_18E768EA0()
{
  return MEMORY[0x1E0CE0738]();
}

uint64_t sub_18E768EAC()
{
  return MEMORY[0x1E0CE9E98]();
}

uint64_t sub_18E768EB8()
{
  return MEMORY[0x1E0CE9EB0]();
}

uint64_t sub_18E768EC4()
{
  return MEMORY[0x1E0CE9EB8]();
}

uint64_t sub_18E768ED0()
{
  return MEMORY[0x1E0CE9EC0]();
}

uint64_t sub_18E768EDC()
{
  return MEMORY[0x1E0CE9EC8]();
}

uint64_t sub_18E768EE8()
{
  return MEMORY[0x1E0CE9ED0]();
}

uint64_t sub_18E768EF4()
{
  return MEMORY[0x1E0CE9ED8]();
}

uint64_t sub_18E768F00()
{
  return MEMORY[0x1E0CE9EE0]();
}

uint64_t sub_18E768F0C()
{
  return MEMORY[0x1E0CB1FE8]();
}

uint64_t sub_18E768F18()
{
  return MEMORY[0x1E0CB2020]();
}

uint64_t sub_18E768F24()
{
  return MEMORY[0x1E0CE9EF0]();
}

uint64_t sub_18E768F30()
{
  return MEMORY[0x1E0CB20C8]();
}

uint64_t sub_18E768F3C()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_18E768F48()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_18E768F54()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_18E768F60()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_18E768F6C()
{
  return MEMORY[0x1E0CE9EF8]();
}

uint64_t sub_18E768F78()
{
  return MEMORY[0x1E0CE9F00]();
}

uint64_t sub_18E768F84()
{
  return MEMORY[0x1E0CE9F08]();
}

uint64_t sub_18E768F90()
{
  return MEMORY[0x1E0CE9F10]();
}

uint64_t sub_18E768F9C()
{
  return MEMORY[0x1E0CE9F28]();
}

uint64_t sub_18E768FA8()
{
  return MEMORY[0x1E0CE9F30]();
}

uint64_t sub_18E768FB4()
{
  return MEMORY[0x1E0CE9F38]();
}

uint64_t sub_18E768FC0()
{
  return MEMORY[0x1E0CE9F40]();
}

uint64_t sub_18E768FCC()
{
  return MEMORY[0x1E0CE9F48]();
}

uint64_t sub_18E768FD8()
{
  return MEMORY[0x1E0CE9F58]();
}

uint64_t sub_18E768FE4()
{
  return MEMORY[0x1E0CE9F60]();
}

uint64_t sub_18E768FF0()
{
  return MEMORY[0x1E0CE9F68]();
}

uint64_t sub_18E768FFC()
{
  return MEMORY[0x1E0CE9F70]();
}

uint64_t sub_18E769008()
{
  return MEMORY[0x1E0CE9F78]();
}

uint64_t sub_18E769014()
{
  return MEMORY[0x1E0CE9F80]();
}

uint64_t sub_18E769020()
{
  return MEMORY[0x1E0CE9F88]();
}

uint64_t sub_18E76902C()
{
  return MEMORY[0x1E0CE9F90]();
}

uint64_t sub_18E769038()
{
  return MEMORY[0x1E0CE9F98]();
}

uint64_t sub_18E769044()
{
  return MEMORY[0x1E0CE9FA0]();
}

uint64_t sub_18E769050()
{
  return MEMORY[0x1E0CE9FC8]();
}

uint64_t sub_18E76905C()
{
  return MEMORY[0x1E0CE9FD0]();
}

uint64_t sub_18E769068()
{
  return MEMORY[0x1E0CE9FD8]();
}

uint64_t sub_18E769074()
{
  return MEMORY[0x1E0CE9FE0]();
}

uint64_t sub_18E769080()
{
  return MEMORY[0x1E0CE9FE8]();
}

uint64_t sub_18E76908C()
{
  return MEMORY[0x1E0CE9FF0]();
}

uint64_t sub_18E769098()
{
  return MEMORY[0x1E0CE9FF8]();
}

uint64_t sub_18E7690A4()
{
  return MEMORY[0x1E0CEA000]();
}

uint64_t sub_18E7690B0()
{
  return MEMORY[0x1E0CEA010]();
}

uint64_t sub_18E7690BC()
{
  return MEMORY[0x1E0CEA018]();
}

uint64_t sub_18E7690C8()
{
  return MEMORY[0x1E0CEA020]();
}

uint64_t sub_18E7690D4()
{
  return MEMORY[0x1E0CB2168]();
}

uint64_t sub_18E7690E0()
{
  return MEMORY[0x1E0CB22E8]();
}

uint64_t sub_18E7690EC()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_18E7690F8()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_18E769104()
{
  return MEMORY[0x1E0CEA028]();
}

uint64_t sub_18E769110()
{
  return MEMORY[0x1E0DEB938]();
}

uint64_t sub_18E76911C()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_18E769128()
{
  return MEMORY[0x1E0DEBB60]();
}

uint64_t sub_18E769134()
{
  return MEMORY[0x1E0CB23E0]();
}

uint64_t sub_18E769140()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_18E76914C()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_18E769158()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_18E769164()
{
  return MEMORY[0x1E0CB24D8]();
}

uint64_t sub_18E769170()
{
  return MEMORY[0x1E0CB24F0]();
}

uint64_t sub_18E76917C()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_18E769188()
{
  return MEMORY[0x1E0DEBE30]();
}

uint64_t sub_18E769194()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_18E7691A0()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_18E7691AC()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_18E7691B8()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_18E7691C4()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_18E7691D0()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_18E7691DC()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_18E7691E8()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_18E7691F4()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_18E769200()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_18E76920C()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_18E769218()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_18E769224()
{
  return MEMORY[0x1E0DEC2A0]();
}

uint64_t sub_18E769230()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_18E76923C()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_18E769248()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_18E769254()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_18E769260()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_18E76926C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_18E769278()
{
  return MEMORY[0x1E0DF0B08]();
}

uint64_t sub_18E769284()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_18E769290()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_18E76929C()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_18E7692A8()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_18E7692B4()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_18E7692C0()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_18E7692CC()
{
  return MEMORY[0x1E0DF0C08]();
}

uint64_t sub_18E7692D8()
{
  return MEMORY[0x1E0DF0C10]();
}

uint64_t sub_18E7692E4()
{
  return MEMORY[0x1E0DF0C28]();
}

uint64_t sub_18E7692F0()
{
  return MEMORY[0x1E0DF0C40]();
}

uint64_t sub_18E7692FC()
{
  return MEMORY[0x1E0DF0C50]();
}

uint64_t sub_18E769308()
{
  return MEMORY[0x1E0DF0C68]();
}

uint64_t sub_18E769314()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_18E769320()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_18E76932C()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_18E769338()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_18E769344()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_18E769350()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_18E76935C()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_18E769368()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_18E769374()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_18E769380()
{
  return MEMORY[0x1E0DECDB8]();
}

uint64_t sub_18E76938C()
{
  return MEMORY[0x1E0DECDD8]();
}

uint64_t sub_18E769398()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_18E7693A4()
{
  return MEMORY[0x1E0DECEF8]();
}

uint64_t sub_18E7693B0()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_18E7693BC()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_18E7693C8()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_18E7693D4()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_18E7693E0()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_18E7693EC()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_18E7693F8()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_18E769404()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_18E769410()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_18E76941C()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_18E769428()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_18E769434()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_18E769440()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_18E76944C()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_18E769458()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_18E769464()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_18E769470()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_18E76947C()
{
  return MEMORY[0x1E0DEDB30]();
}

uint64_t sub_18E769488()
{
  return MEMORY[0x1E0DEDEE0]();
}

uint64_t sub_18E769494()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_18E7694A0()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_18E7694AC()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_18E7694B8()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_18E7694C4()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_18E7694D0()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_18E7694DC()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_18E7694E8()
{
  return MEMORY[0x1E0CB2710]();
}

uint64_t sub_18E7694F4()
{
  return MEMORY[0x1E0DEE8F8]();
}

uint64_t sub_18E769500()
{
  return MEMORY[0x1E0DEE978]();
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return MEMORY[0x1E0CFF4A8](inAudioFile);
}

OSStatus AudioFileCreateWithURL(CFURLRef inFileRef, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inFormat, AudioFileFlags inFlags, AudioFileID *outAudioFile)
{
  return MEMORY[0x1E0CFF4B0](inFileRef, *(_QWORD *)&inFileType, inFormat, *(_QWORD *)&inFlags, outAudioFile);
}

OSStatus AudioFileOpenURL(CFURLRef inFileRef, AudioFilePermissions inPermissions, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return MEMORY[0x1E0CFF4D8](inFileRef, inPermissions, *(_QWORD *)&inFileTypeHint, outAudioFile);
}

OSStatus AudioFileWritePackets(AudioFileID inAudioFile, Boolean inUseCache, UInt32 inNumBytes, const AudioStreamPacketDescription *inPacketDescriptions, SInt64 inStartingPacket, UInt32 *ioNumPackets, const void *inBuffer)
{
  return MEMORY[0x1E0CFF508](inAudioFile, inUseCache, *(_QWORD *)&inNumBytes, inPacketDescriptions, inStartingPacket, ioNumPackets, inBuffer);
}

OSStatus AudioFormatGetProperty(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1E0CFF510](*(_QWORD *)&inPropertyID, *(_QWORD *)&inSpecifierSize, inSpecifier, ioPropertyDataSize, outPropertyData);
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

uint64_t CAMShutterButtonSpecMake()
{
  return MEMORY[0x1E0D0D0F0]();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1E0CD25F0](retstr, a, b);
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x1E0CD25F8](a, b);
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0CD2600](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x1E0CD2630](retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2638](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2648](retstr, tx, ty, tz);
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

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

uint64_t CEMCreateEmojiCharacterSet()
{
  return MEMORY[0x1E0D15CE0]();
}

uint64_t CEMCreateEmojiLocaleData()
{
  return MEMORY[0x1E0D15CE8]();
}

uint64_t CEMEmojiTokenCopyName()
{
  return MEMORY[0x1E0D15D28]();
}

uint64_t CEMEmojiTokenCreateWithString()
{
  return MEMORY[0x1E0D15D58]();
}

uint64_t CEMEmojiTokenGetString()
{
  return MEMORY[0x1E0D15D90]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithBlock()
{
  return MEMORY[0x1E0D15DA8]();
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x1E0D15DC0]();
}

uint64_t CEMStringIsSingleEmoji()
{
  return MEMORY[0x1E0D15DC8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x1E0C98368]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

uint64_t CFGetUserName()
{
  return MEMORY[0x1E0C98740]();
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C98770]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988C8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

uint64_t CFPhoneNumberCopyUnformattedInternationalRepresentation()
{
  return MEMORY[0x1E0D17830]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1E0D17838]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1E0D17848]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1E0C99338](url, key, propertyValueTypeRefPtr, error);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return (CGAffineTransformComponents *)MEMORY[0x1E0C9BA98](retstr, transform);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMake(CGAffineTransform *__return_ptr retstr, CGFloat a, CGFloat b, CGFloat c, CGFloat d, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAC8](retstr, a, b, c, d, tx, ty);
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

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1E0C9BB98]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCB0](red, green, blue, alpha);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x1E0C9BD10](colorName);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C210](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x1E0C9C218](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C250](retstr, c);
}

CGAffineTransform *__cdecl CGContextGetTextMatrix(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C308](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
  MEMORY[0x1E0C9C380](c, angle);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1E0C9C3C0]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
  MEMORY[0x1E0C9C400](c, space);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetFontSize(CGContextRef c, CGFloat size)
{
  MEMORY[0x1E0C9C438](c, size);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x1E0C9C4C0](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextSetStrokeColorSpace(CGContextRef c, CGColorSpaceRef space)
{
  MEMORY[0x1E0C9C500](c, space);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
  MEMORY[0x1E0C9C530](c, t);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C538](c, x, y);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1E0C9C5D8](provider);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1E0C9CB68]();
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1E0C9CB98](image, space);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1E0C9CC00](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1E0C9CC08](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9CC38](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1E0CBC550]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC588](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1E0CBC618](isrc);
}

uint64_t CGImageSourceGetTypeWithURL()
{
  return MEMORY[0x1E0CBC638]();
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2C8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathAddRoundedRect(CGMutablePathRef path, const CGAffineTransform *transform, CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight)
{
  MEMORY[0x1E0C9D2D8](path, transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
  MEMORY[0x1E0C9D300](path, block);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
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

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x1E0C9D568](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
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

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
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

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return MEMORY[0x1E0C9D810]((__n128)size1, *(__n128 *)&size1.height, (__n128)size2, *(__n128 *)&size2.height);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDD8](desc);
}

uint64_t CMPhotoJPEGCreateCGImageFromJPEG()
{
  return MEMORY[0x1E0D090C8]();
}

uint64_t CMPhotoJPEGDecodeSessionCreate()
{
  return MEMORY[0x1E0D09130]();
}

uint64_t CMPhotoJPEGDecodeSessionCreateCGImageFromData()
{
  return MEMORY[0x1E0D09138]();
}

uint64_t CMPhotoJPEGDecodeSessionDiscardCachedBuffers()
{
  return MEMORY[0x1E0D09158]();
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

uint64_t CNUIIsMessages()
{
  return MEMORY[0x1E0C97438]();
}

uint64_t CPBitmapCreateImagesFromPath()
{
  return MEMORY[0x1E0CFA1D0]();
}

uint64_t CPBitmapWriterAddImage()
{
  return MEMORY[0x1E0CFA1E8]();
}

uint64_t CPBitmapWriterCreate()
{
  return MEMORY[0x1E0CFA1F0]();
}

uint64_t CPBitmapWriterFinalize()
{
  return MEMORY[0x1E0CFA208]();
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x1E0CFA250]();
}

uint64_t CPFreeSpaceRequestBytesAtPathWithCompletionBlock()
{
  return MEMORY[0x1E0CFA290]();
}

uint64_t CPPhoneNumberCopyCountryCodeForIncomingTextMessage()
{
  return MEMORY[0x1E0CFA340]();
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x1E0CA79F8]();
}

CTFontRef CTFontCreateCopyWithAttributes(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x1E0CA7A30](font, matrix, attributes, size);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x1E0CA7A90](name, matrix, options, size);
}

void CTFontDrawGlyphs(CTFontRef font, const CGGlyph *glyphs, const CGPoint *positions, size_t count, CGContextRef context)
{
  MEMORY[0x1E0CA7B70](font, glyphs, positions, count, context);
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  MEMORY[0x1E0CA7BB8](font, *(_QWORD *)&orientation, glyphs, boundingRects, count);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1E0CA7C10]();
}

CGFloat CTFontGetSize(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7C50](font);
  return result;
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x1E0CA7ED8](line);
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA7FB0](run);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x1E0CA7FD0](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
  MEMORY[0x1E0CA7FE0](run, range.location, range.length, buffer);
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
  MEMORY[0x1E0CA8008](run, range.location, range.length, buffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

uint64_t ExtractURLQueries()
{
  return MEMORY[0x1E0D36170]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x1E0D33DF0]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x1E0D33DF8]();
}

uint64_t IMAVURLAssetOptionsDefault()
{
  return MEMORY[0x1E0D37358]();
}

uint64_t IMAVURLAssetOptionsWithExtraOptions()
{
  return MEMORY[0x1E0D37360]();
}

uint64_t IMAVURLAssetOptionsWithExtraOptionsForWrite()
{
  return MEMORY[0x1E0D37368]();
}

uint64_t IMAssociatedMessageDecodeGUID()
{
  return MEMORY[0x1E0D37430]();
}

uint64_t IMAttachmentEmojiImagePreviewFileURL()
{
  return MEMORY[0x1E0D37440]();
}

uint64_t IMAttachmentFileNameAndExtension()
{
  return MEMORY[0x1E0D37448]();
}

uint64_t IMAttachmentPreviewFileURL()
{
  return MEMORY[0x1E0D37450]();
}

uint64_t IMAttachmentPreviewFileURLFromURLWithSuffix()
{
  return MEMORY[0x1E0D37458]();
}

uint64_t IMAttachmentPreviewMetadataFileURL()
{
  return MEMORY[0x1E0D37460]();
}

uint64_t IMAttributedStringByRemovingTrackingInformation()
{
  return MEMORY[0x1E0D352A8]();
}

uint64_t IMBagBoolValueWithDefault()
{
  return MEMORY[0x1E0D374A0]();
}

uint64_t IMBagIntValueWithDefault()
{
  return MEMORY[0x1E0D374B0]();
}

uint64_t IMBalloonBundleIDFromExtensionID()
{
  return MEMORY[0x1E0D374B8]();
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return MEMORY[0x1E0D37510]();
}

uint64_t IMBalloonExtensionIDWithTeamAndSuffix()
{
  return MEMORY[0x1E0D37518]();
}

uint64_t IMBiomeQueue()
{
  return MEMORY[0x1E0D37650]();
}

uint64_t IMCachesDirectoryURL()
{
  return MEMORY[0x1E0D376F0]();
}

uint64_t IMCanonicalizeFormattedString()
{
  return MEMORY[0x1E0D36348]();
}

uint64_t IMChatCalculateServiceForSendingNewComposeMaybeForce()
{
  return MEMORY[0x1E0D352E0]();
}

uint64_t IMChatCanonicalIDSIDsForAddress()
{
  return MEMORY[0x1E0D37710]();
}

uint64_t IMClearDisplayKeepMessagesSetting()
{
  return MEMORY[0x1E0D378A0]();
}

uint64_t IMClientPreviewConstraints()
{
  return MEMORY[0x1E0D378A8]();
}

uint64_t IMClientPreviewStickerConstraints()
{
  return MEMORY[0x1E0D378B0]();
}

uint64_t IMClientTelemetryLogHandle()
{
  return MEMORY[0x1E0D378B8]();
}

uint64_t IMComponentsFromChatGUID()
{
  return MEMORY[0x1E0D36360]();
}

uint64_t IMCoreMomentShareURLForMessage()
{
  return MEMORY[0x1E0D35528]();
}

uint64_t IMCountryCodeForNumber()
{
  return MEMORY[0x1E0D363A0]();
}

uint64_t IMCreateHEICSImageDataFromCGImageRef()
{
  return MEMORY[0x1E0D37C78]();
}

uint64_t IMCreatePNGImageDataFromCGImageRef()
{
  return MEMORY[0x1E0D37C88]();
}

uint64_t IMCreateThumbnailWithImageSourceAtIndexForMaxDimension()
{
  return MEMORY[0x1E0D37CA0]();
}

uint64_t IMDAttachmentFindLargestAttachmentGUIDsForAttachmentClassWithLimitAndOffset()
{
  return MEMORY[0x1E0D35B00]();
}

uint64_t IMDAttachmentFindLargestConversations()
{
  return MEMORY[0x1E0D35B10]();
}

uint64_t IMDAttachmentFindLargestNonSyncedAttachmentGUIDs()
{
  return MEMORY[0x1E0D35B18]();
}

uint64_t IMDAttachmentRecordDeleteAttachmentForGUID()
{
  return MEMORY[0x1E0D35BA8]();
}

uint64_t IMDAttachmentRecordEstimateSpaceTakenByAttachmentsOlderThanDays()
{
  return MEMORY[0x1E0D35BB8]();
}

uint64_t IMDAttachmentRecordGetNonSyncedAttachmentDiskSpace()
{
  return MEMORY[0x1E0D35BC8]();
}

uint64_t IMDAttachmentRecordGetPurgeableDiskSpace()
{
  return MEMORY[0x1E0D35BD0]();
}

uint64_t IMDAttachmentSpaceTakenByAttachmentClass()
{
  return MEMORY[0x1E0D35C08]();
}

uint64_t IMDChatRecordCopyChatIdentifier()
{
  return MEMORY[0x1E0D35CB8]();
}

uint64_t IMDCopyAttachmentPersistentPath()
{
  return MEMORY[0x1E0D35D70]();
}

uint64_t IMDCoreSpotlightIndexNextMessageBatchIfNeededBlocking()
{
  return MEMORY[0x1E0D35DA0]();
}

uint64_t IMDCoreSpotlightSetNeedsMessageReindexBlocking()
{
  return MEMORY[0x1E0D35DC0]();
}

uint64_t IMDDScanAttributedStringWithContext()
{
  return MEMORY[0x1E0D363E0]();
}

uint64_t IMDMessageRecordBulkCopy()
{
  return MEMORY[0x1E0D35E80]();
}

uint64_t IMDMessageRecordChatForMessageGUID()
{
  return MEMORY[0x1E0D35E90]();
}

uint64_t IMDMessageRecordCopyMostRecentUseageOfAddresses()
{
  return MEMORY[0x1E0D35F78]();
}

uint64_t IMDPersistencePerformBlock()
{
  return MEMORY[0x1E0D36050]();
}

uint64_t IMDeviceIsGreenTea()
{
  return MEMORY[0x1E0D37DA8]();
}

uint64_t IMEmotePrefixes()
{
  return MEMORY[0x1E0D35550]();
}

uint64_t IMEnableInlineReplyGlyph()
{
  return MEMORY[0x1E0D37DC8]();
}

uint64_t IMEnableMAIDGroups()
{
  return MEMORY[0x1E0D37DD0]();
}

uint64_t IMEnableModernTranscript()
{
  return MEMORY[0x1E0D37DD8]();
}

uint64_t IMEnableTranscriptChromelessNavBar()
{
  return MEMORY[0x1E0D37DE8]();
}

uint64_t IMEnableTranscriptClickyOrb()
{
  return MEMORY[0x1E0D37DF0]();
}

uint64_t IMEstimateDurationForSize()
{
  return MEMORY[0x1E0D37DF8]();
}

uint64_t IMExtensionPayloadUnarchivingClasses()
{
  return MEMORY[0x1E0D37E70]();
}

uint64_t IMFauxMessageGUIDForTapbackOfCMMAssetAtIndexInParentMessageGUID()
{
  return MEMORY[0x1E0D37E98]();
}

uint64_t IMFileLocationTrimFileName()
{
  return MEMORY[0x1E0D36428]();
}

uint64_t IMFileSizeForItemAtPath()
{
  return MEMORY[0x1E0D37EA8]();
}

uint64_t IMFileTransferGUIDForAttachmentMessagePartAtMessageGUIDAndMessagePartIndex()
{
  return MEMORY[0x1E0D37F90]();
}

uint64_t IMFileTransferGUIDIsTemporary()
{
  return MEMORY[0x1E0D37FB0]();
}

uint64_t IMFileURLIsActuallyAnimated()
{
  return MEMORY[0x1E0D37FE8]();
}

uint64_t IMFindExistingChatForAddresses()
{
  return MEMORY[0x1E0D35580]();
}

uint64_t IMFormattedDisplayStringForIDInAddressBook()
{
  return MEMORY[0x1E0D35588]();
}

uint64_t IMFormattedDisplayStringForNumber()
{
  return MEMORY[0x1E0D36470]();
}

uint64_t IMGetAppBoolForKey()
{
  return MEMORY[0x1E0D36498]();
}

uint64_t IMGetAssertionFailureHandler()
{
  return MEMORY[0x1E0D364B0]();
}

uint64_t IMGetCachedDomainBoolForKey()
{
  return MEMORY[0x1E0D364B8]();
}

uint64_t IMGetCachedDomainBoolForKeyWithDefaultValue()
{
  return MEMORY[0x1E0D364C0]();
}

uint64_t IMGetCachedDomainIntForKeyWithDefaultValue()
{
  return MEMORY[0x1E0D364D0]();
}

uint64_t IMGetDomainBoolForKey()
{
  return MEMORY[0x1E0D364E8]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x1E0D36500]();
}

uint64_t IMGetUserIgnoreFailureUpdateAppleIDIntent()
{
  return MEMORY[0x1E0D38000]();
}

uint64_t IMGetUserIgnoreFailureWaitingForCloudIntent()
{
  return MEMORY[0x1E0D38008]();
}

uint64_t IMGetUserIgnoreLogoutIntent()
{
  return MEMORY[0x1E0D38010]();
}

uint64_t IMGetUserLoginIntent()
{
  return MEMORY[0x1E0D38018]();
}

uint64_t IMGetUserRegistrationFailureIntent()
{
  return MEMORY[0x1E0D38020]();
}

uint64_t IMIndexesFromOrderedCollectionDifference()
{
  return MEMORY[0x1E0D355B8]();
}

uint64_t IMInternationalForPhoneNumberWithOptions()
{
  return MEMORY[0x1E0D365E0]();
}

uint64_t IMIsAAVideoURL()
{
  return MEMORY[0x1E0D380A8]();
}

uint64_t IMIsEnrolledInContactKeyVerification()
{
  return MEMORY[0x1E0D355C8]();
}

uint64_t IMIsHEVCWithAlphaVideo()
{
  return MEMORY[0x1E0D380B0]();
}

uint64_t IMIsHEVCWithAlphaVideoFromData()
{
  return MEMORY[0x1E0D380B8]();
}

uint64_t IMIsImageURLAScreenshot()
{
  return MEMORY[0x1E0D380C0]();
}

uint64_t IMIsOscarEnabled()
{
  return MEMORY[0x1E0D355D0]();
}

uint64_t IMIsPlugInProxyAMessagesExtensionPoint()
{
  return MEMORY[0x1E0D380D0]();
}

uint64_t IMIsRunningInMessagesComposeViewService()
{
  return MEMORY[0x1E0D38110]();
}

uint64_t IMIsRunningInMessagesExtension()
{
  return MEMORY[0x1E0D38118]();
}

uint64_t IMIsRunningInMessagesTranscriptExtension()
{
  return MEMORY[0x1E0D38120]();
}

uint64_t IMIsRunningInMessagesUIProcess()
{
  return MEMORY[0x1E0D38128]();
}

uint64_t IMIsRunningInMessagesViewService()
{
  return MEMORY[0x1E0D38130]();
}

uint64_t IMIsRunningInScreenshotTesting_IsolatedTranscriptUI()
{
  return MEMORY[0x1E0D38148]();
}

uint64_t IMIsRunningInUnitTesting()
{
  return MEMORY[0x1E0D38150]();
}

uint64_t IMIsRunningIniMessageAppExtension()
{
  return MEMORY[0x1E0D38158]();
}

uint64_t IMIsRunningIniMessageAppsViewService()
{
  return MEMORY[0x1E0D38160]();
}

uint64_t IMIsStringStewieEmergency()
{
  return MEMORY[0x1E0D38178]();
}

uint64_t IMIsStringStewieRoadside()
{
  return MEMORY[0x1E0D38180]();
}

uint64_t IMIsSupportedUTIType()
{
  return MEMORY[0x1E0D38188]();
}

uint64_t IMLegacyCalculateFileSizeForPath()
{
  return MEMORY[0x1E0D38198]();
}

uint64_t IMLogBacktrace()
{
  return MEMORY[0x1E0D36610]();
}

uint64_t IMLogExceptionBacktrace()
{
  return MEMORY[0x1E0D36618]();
}

uint64_t IMLogHandleForCategory()
{
  return MEMORY[0x1E0D381A8]();
}

uint64_t IMLogSimulateCrashForException()
{
  return MEMORY[0x1E0D36628]();
}

uint64_t IMLogSimulateCrashForProcess()
{
  return MEMORY[0x1E0D36630]();
}

uint64_t IMLookUpExtensionInCache()
{
  return MEMORY[0x1E0D381B0]();
}

uint64_t IMMMSPartCanBeSent()
{
  return MEMORY[0x1E0D36688]();
}

uint64_t IMMessageCreateThreadIdentifierWithOriginatorGUID()
{
  return MEMORY[0x1E0D38230]();
}

uint64_t IMMessageGuidFromIMFileTransferGuid()
{
  return MEMORY[0x1E0D38250]();
}

uint64_t IMMessageItemExpireStateExpiringDuration()
{
  return MEMORY[0x1E0D38258]();
}

uint64_t IMMessageSoundPlayReceivedAckSound()
{
  return MEMORY[0x1E0D38320]();
}

uint64_t IMMessageThreadIdentifierOriginatorGUIDAndPartMatch()
{
  return MEMORY[0x1E0D38400]();
}

uint64_t IMMetricsValueForAssociatedMessageContentType()
{
  return MEMORY[0x1E0D38AF0]();
}

uint64_t IMMomentShareCacheErrorIsPermanent()
{
  return MEMORY[0x1E0D355E0]();
}

uint64_t IMNormalizeFormattedString()
{
  return MEMORY[0x1E0D366D8]();
}

uint64_t IMNormalizePhoneNumber()
{
  return MEMORY[0x1E0D38BC8]();
}

uint64_t IMNormalizedPhoneNumberForCFPhoneNumberRef()
{
  return MEMORY[0x1E0D366E0]();
}

uint64_t IMNormalizedPhoneNumberForPhoneNumber()
{
  return MEMORY[0x1E0D366E8]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x1E0D366F0]();
}

uint64_t IMPhoneNumberRefCopyForPhoneNumber()
{
  return MEMORY[0x1E0D36718]();
}

uint64_t IMPluginSnapshotCachesFileURL()
{
  return MEMORY[0x1E0D38C68]();
}

uint64_t IMPluginSnapshotExistsInCache()
{
  return MEMORY[0x1E0D38C70]();
}

uint64_t IMPreferredAccountForService()
{
  return MEMORY[0x1E0D35650]();
}

uint64_t IMPreferredSendingAccountForAddressesWantsGroupWithFallbackService()
{
  return MEMORY[0x1E0D35658]();
}

uint64_t IMPreviewCachesDirectoryWithAttachmentURL()
{
  return MEMORY[0x1E0D38C78]();
}

uint64_t IMPreviewConstraintsEqualToConstraints()
{
  return MEMORY[0x1E0D38C80]();
}

uint64_t IMPreviewConstraintsFromDictionary()
{
  return MEMORY[0x1E0D38C88]();
}

uint64_t IMPreviewConstraintsZero()
{
  return MEMORY[0x1E0D38C90]();
}

uint64_t IMPreviewExtension()
{
  return MEMORY[0x1E0D38C98]();
}

uint64_t IMResetCachedCarrierSettings()
{
  return MEMORY[0x1E0D367C8]();
}

uint64_t IMResetCachedUserSettings()
{
  return MEMORY[0x1E0D367D0]();
}

uint64_t IMResetInternationalFilterEligibilityState()
{
  return MEMORY[0x1E0D35660]();
}

uint64_t IMResetJunkiMessageFilteringState()
{
  return MEMORY[0x1E0D35668]();
}

uint64_t IMRichLinkUtilitiesEnumerateRichLinksInAttributedString()
{
  return MEMORY[0x1E0D35670]();
}

uint64_t IMRichLinkUtilitiesIsSupportedRichLinkURL()
{
  return MEMORY[0x1E0D35678]();
}

uint64_t IMSMSDirectoryURL()
{
  return MEMORY[0x1E0D38CF8]();
}

uint64_t IMSMSReportSpamExtensionAvailable()
{
  return MEMORY[0x1E0D38D08]();
}

uint64_t IMSPISendMessageWithAttachmentsFromSubscriptionIdentifier()
{
  return MEMORY[0x1E0D356D8]();
}

uint64_t IMSPISetChatContextForSubscriptionIdentifier()
{
  return MEMORY[0x1E0D356F8]();
}

uint64_t IMSSMSReportSpamShouldShowReportMessagesForItems()
{
  return MEMORY[0x1E0D38D18]();
}

uint64_t IMSafeTemporaryDirectory()
{
  return MEMORY[0x1E0D38D20]();
}

uint64_t IMSanitizedAppIconDataForIMExtensionPayloadAppIconKey()
{
  return MEMORY[0x1E0D38D30]();
}

uint64_t IMSetDomainBoolForKey()
{
  return MEMORY[0x1E0D367F8]();
}

uint64_t IMSetDomainValueForKey()
{
  return MEMORY[0x1E0D36808]();
}

uint64_t IMSetUserIgnoreFailureUpdateAppleIDIntent()
{
  return MEMORY[0x1E0D39028]();
}

uint64_t IMSetUserIgnoreFailureWaitingForCloudIntent()
{
  return MEMORY[0x1E0D39030]();
}

uint64_t IMSetUserIgnoreLogoutIntent()
{
  return MEMORY[0x1E0D39038]();
}

uint64_t IMSetUserLoginIntent()
{
  return MEMORY[0x1E0D39040]();
}

uint64_t IMSharedDowntimeController()
{
  return MEMORY[0x1E0D35718]();
}

uint64_t IMSharedHelperAlwaysShowNicknameBanners()
{
  return MEMORY[0x1E0D39110]();
}

uint64_t IMSharedHelperBusinessAllowlist()
{
  return MEMORY[0x1E0D39128]();
}

uint64_t IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs()
{
  return MEMORY[0x1E0D39148]();
}

uint64_t IMSharedHelperDeviceHasMultipleActiveSubscriptions()
{
  return MEMORY[0x1E0D39158]();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptions()
{
  return MEMORY[0x1E0D39160]();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptionsWithAtLeastOneActive()
{
  return MEMORY[0x1E0D39168]();
}

uint64_t IMSharedHelperDeviceIsiPad()
{
  return MEMORY[0x1E0D39178]();
}

uint64_t IMSharedHelperDeviceIsiPod()
{
  return MEMORY[0x1E0D39180]();
}

uint64_t IMSharedHelperEnsureDirectoryExistsAtPath()
{
  return MEMORY[0x1E0D39188]();
}

uint64_t IMSharedHelperIsOlderDevice()
{
  return MEMORY[0x1E0D391B0]();
}

uint64_t IMSharedHelperMD5HashOfFileAtPath()
{
  return MEMORY[0x1E0D391B8]();
}

uint64_t IMSharedHelperMD5OfData()
{
  return MEMORY[0x1E0D391C0]();
}

uint64_t IMSharedHelperMessagesRootFolderPath()
{
  return MEMORY[0x1E0D391D0]();
}

uint64_t IMSharedHelperMissingKeysInStickerUserInfo()
{
  return MEMORY[0x1E0D391D8]();
}

uint64_t IMSharedHelperNickNameEnabled()
{
  return MEMORY[0x1E0D391E8]();
}

uint64_t IMSharedHelperPayloadFromCombinedPluginPayloadData()
{
  return MEMORY[0x1E0D391F8]();
}

uint64_t IMSharedHelperRetrieveSimDetailsFromTelephony()
{
  return MEMORY[0x1E0D39220]();
}

uint64_t IMSharedHelperTurnOnUNUserNotificationsInIMDPersistence()
{
  return MEMORY[0x1E0D39248]();
}

uint64_t IMSharedUtilitiesFrameworkBundle()
{
  return MEMORY[0x1E0D39260]();
}

uint64_t IMShouldDisplayKeepMessagesSetting()
{
  return MEMORY[0x1E0D39268]();
}

uint64_t IMShouldHandleInternalPhishingAttempts()
{
  return MEMORY[0x1E0D39270]();
}

uint64_t IMStickerEffectTypeShouldAvoidEffectView()
{
  return MEMORY[0x1E0D392A8]();
}

uint64_t IMStickersExtensionIdentifier()
{
  return MEMORY[0x1E0D39338]();
}

uint64_t IMStringFromIMCloudKitSyncJobState()
{
  return MEMORY[0x1E0D39388]();
}

uint64_t IMStringFromIMFileTransferUpdateReason()
{
  return MEMORY[0x1E0D393A0]();
}

uint64_t IMStringIsBusinessID()
{
  return MEMORY[0x1E0D36860]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x1E0D36868]();
}

uint64_t IMStringIsEmergencyPhoneNumber()
{
  return MEMORY[0x1E0D36870]();
}

uint64_t IMStringIsEmpty()
{
  return MEMORY[0x1E0D36878]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x1E0D36890]();
}

uint64_t IMStringIsStewie()
{
  return MEMORY[0x1E0D368A0]();
}

uint64_t IMStripFormattingFromAddress()
{
  return MEMORY[0x1E0D368B0]();
}

uint64_t IMStripLoginID()
{
  return MEMORY[0x1E0D368B8]();
}

uint64_t IMSupportedAnimatedImageUTTypesSortedByPreference()
{
  return MEMORY[0x1E0D393C8]();
}

uint64_t IMSupportsASTC()
{
  return MEMORY[0x1E0D393D0]();
}

uint64_t IMTextEffectDiscoverabilityTitleLocalizationKeyFromType()
{
  return MEMORY[0x1E0D393F8]();
}

uint64_t IMTextEffectLocalizationKeyFromType()
{
  return MEMORY[0x1E0D39400]();
}

uint64_t IMTextEffectNameFromType()
{
  return MEMORY[0x1E0D39408]();
}

uint64_t IMTextEffectOrderedSupportedNames()
{
  return MEMORY[0x1E0D39410]();
}

uint64_t IMTextEffectTypeFromName()
{
  return MEMORY[0x1E0D39418]();
}

uint64_t IMTextStyleAttributeNameFromStyle()
{
  return MEMORY[0x1E0D39438]();
}

uint64_t IMTranscriptChatItemEqual()
{
  return MEMORY[0x1E0D35720]();
}

uint64_t IMUTITypeForFilename()
{
  return MEMORY[0x1E0D394D8]();
}

uint64_t IMUTITypeIsAnimatedImage()
{
  return MEMORY[0x1E0D394E0]();
}

uint64_t IMUTITypeIsPhoto()
{
  return MEMORY[0x1E0D394F0]();
}

uint64_t IMUTITypeIsSupportedForTranscodeOnSend()
{
  return MEMORY[0x1E0D39500]();
}

uint64_t IMUTITypeIsVideo()
{
  return MEMORY[0x1E0D39508]();
}

uint64_t IMUTTypeIsSupportedAnimatedImage()
{
  return MEMORY[0x1E0D39540]();
}

uint64_t IMUTTypeIsWatchface()
{
  return MEMORY[0x1E0D39560]();
}

uint64_t IMUTTypeWantsQuicklook()
{
  return MEMORY[0x1E0D39568]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x1E0D36970]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x1E0D36978]();
}

uint64_t IMWorkoutUTITypes()
{
  return MEMORY[0x1E0D39610]();
}

uint64_t IM_APFS_PURGEABLE_IGNORE_ME()
{
  return MEMORY[0x1E0D39618]();
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1E0CBBB10](aSurface);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD48](xobj);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t LICreateDefaultIcon()
{
  return MEMORY[0x1E0D4E3D0]();
}

uint64_t LICreateIconForImage()
{
  return MEMORY[0x1E0D4E3E0]();
}

uint64_t LICreateIconFromCachedBitmap()
{
  return MEMORY[0x1E0D4E3E8]();
}

uint64_t LIIconOutputSizeForVariant()
{
  return MEMORY[0x1E0D4E400]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  double v3;
  double v4;
  double v5;
  double v6;
  MKCoordinateRegion result;

  MEMORY[0x1E0CC1570]((__n128)centerCoordinate, *(__n128 *)&centerCoordinate.longitude, latitudinalMeters, longitudinalMeters);
  result.span.longitudeDelta = v6;
  result.span.latitudeDelta = v5;
  result.center.longitude = v4;
  result.center.latitude = v3;
  return result;
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

uint64_t MarcoLogMadridLevelCF_V()
{
  return MEMORY[0x1E0D47418]();
}

uint64_t MarcoShouldLogMadridLevelCF()
{
  return MEMORY[0x1E0D47440]();
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2858](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1E0CB2D70]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0CEA108]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0CEA110]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0CEA118]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1E0CB3210]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1E0CEA128](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t OSLogHandleForIMEventCategory()
{
  return MEMORY[0x1E0D36B30]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x1E0D36B38]();
}

uint64_t PKPeerPaymentShouldDisplayResultForDetectedAmount()
{
  return MEMORY[0x1E0D6B2A8]();
}

uint64_t PNCopyCompressedFormattedStringWithCountry()
{
  return MEMORY[0x1E0D17870]();
}

uint64_t PUPhotosFileProviderTypeIdentifierLivePhotoBundle()
{
  return MEMORY[0x1E0D7D260]();
}

uint64_t PXDisplayAssetFetchResultFromArray()
{
  return MEMORY[0x1E0D7C350]();
}

uint64_t PXEdgeInsetsInsetSize()
{
  return MEMORY[0x1E0D7C388]();
}

uint64_t PXFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x1E0D7C3C0]();
}

uint64_t PXFloatFloorToPixel()
{
  return MEMORY[0x1E0D7C3C8]();
}

uint64_t PXLargestSalientAspectFilledCropRect()
{
  return MEMORY[0x1E0D7C458]();
}

uint64_t PXLocalizationKeyForMediaType()
{
  return MEMORY[0x1E0D7C4A0]();
}

uint64_t PXRectFlippedVertically()
{
  return MEMORY[0x1E0D7C720]();
}

uint64_t PXRectNormalize()
{
  return MEMORY[0x1E0D7C728]();
}

uint64_t PXRectWithAspectRatioFittingRect()
{
  return MEMORY[0x1E0D7C738]();
}

uint64_t PXSimpleIndexPathDescription()
{
  return MEMORY[0x1E0D7C818]();
}

uint64_t QLPreviewControllerSupportsContentType()
{
  return MEMORY[0x1E0CD3268]();
}

uint64_t SBSRequestPasscodeUnlockUI()
{
  return MEMORY[0x1E0DAB950]();
}

uint64_t SBSSetAlertSuppressionContexts()
{
  return MEMORY[0x1E0DAB970]();
}

uint64_t SWCollaborationMetadataForDocumentURL()
{
  return MEMORY[0x1E0CD7460]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

uint64_t StringGUID()
{
  return MEMORY[0x1E0D36B50]();
}

uint64_t TUOpenURL()
{
  return MEMORY[0x1E0DBD6A0]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1E0CEAFE8]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1E0CEB020]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1E0CEB028]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0CEB030]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1E0CEB048]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1E0CEB250]();
}

uint64_t UIAuditTokenTaskHasEntitlement()
{
  return MEMORY[0x1E0CEB368]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1E0CEB3A8]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0CEB3E8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0CEB418](category);
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1E0CEB480]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x1E0CEB4C0]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x1E0CEB628]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0CEB630](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0CEB638]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0CEB640]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0CEB648]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x1E0CEB650]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x1E0CEB658](context);
}

uint64_t UIImageDataWriteToSavedPhotosAlbum()
{
  return MEMORY[0x1E0CEB668]();
}

uint64_t UIImageGetUnreadIndicator()
{
  return MEMORY[0x1E0CEB678]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0CEB680](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0CEB688](image);
}

void UIImageWriteToSavedPhotosAlbum(UIImage *image, id completionTarget, SEL completionSelector, void *contextInfo)
{
  MEMORY[0x1E0CEB708](image, completionTarget, completionSelector, contextInfo);
}

uint64_t UIKeyboardAutomaticIsOnScreen()
{
  return MEMORY[0x1E0CEB800]();
}

uint64_t UIKeyboardOrderInAutomaticSkippingAnimation()
{
  return MEMORY[0x1E0CEB8D8]();
}

uint64_t UIKeyboardPredictionEnabledForCurrentInputMode()
{
  return MEMORY[0x1E0CEB908]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1E0CEBA88]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1E0CEBA90]();
}

uint64_t UIRectCornersAtEdges()
{
  return MEMORY[0x1E0CEBAC8]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0CEBAD0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
  MEMORY[0x1E0CEBAD8](*(_QWORD *)&blendMode, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0CEBAE0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0CEBAF8]();
}

uint64_t UIRectRoundToViewScale()
{
  return MEMORY[0x1E0CEBB10]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0CEBB20]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0CEBB30]();
}

void UISaveVideoAtPathToSavedPhotosAlbum(NSString *videoPath, id completionTarget, SEL completionSelector, void *contextInfo)
{
  MEMORY[0x1E0CEBB38](videoPath, completionTarget, completionSelector, contextInfo);
}

uint64_t UIUnformattedPhoneNumberFromString()
{
  return MEMORY[0x1E0CEBDC8]();
}

BOOL UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(NSString *videoPath)
{
  return MEMORY[0x1E0CEBDD8](videoPath);
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

Boolean UTTypeEqual(CFStringRef inUTI1, CFStringRef inUTI2)
{
  return MEMORY[0x1E0CA5988](inUTI1, inUTI2);
}

uint64_t _AXSForceTouchTimeDuration()
{
  return MEMORY[0x1E0DDD758]();
}

uint64_t _AXSReduceMotionAutoplayAnimatedImagesEnabled()
{
  return MEMORY[0x1E0DDDB08]();
}

uint64_t _AXSReduceMotionAutoplayMessagesEffectsEnabled()
{
  return MEMORY[0x1E0DDDB10]();
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

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CreateIMMessageFromIMItem()
{
  return MEMORY[0x1E0D35990]();
}

uint64_t _FTAreIDsEquivalent()
{
  return MEMORY[0x1E0D20C38]();
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x1E0D36B60]();
}

uint64_t _IMBestAccountForIMItem()
{
  return MEMORY[0x1E0D35998]();
}

uint64_t _IMChatServiceForSendingAvailabilityErrorFromReachabilityResults()
{
  return MEMORY[0x1E0D359A0]();
}

uint64_t _IMLog()
{
  return MEMORY[0x1E0D36B80]();
}

uint64_t _IMWarn()
{
  return MEMORY[0x1E0D36BA8]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x1E0D36BB0]();
}

uint64_t _NSStringFromIMMessageError()
{
  return MEMORY[0x1E0D359B0]();
}

uint64_t _UIApplicationUsesLegacyUI()
{
  return MEMORY[0x1E0CEBEF0]();
}

uint64_t _UIImageJPEGRepresentation()
{
  return MEMORY[0x1E0CEC000]();
}

uint64_t _UISheetMinimumTopInset()
{
  return MEMORY[0x1E0CEC1B0]();
}

uint64_t _UIStickerCreateEmojiTextAttachmentFromSticker()
{
  return MEMORY[0x1E0CEC228]();
}

uint64_t _UIUpdateCycleEnabled()
{
  return MEMORY[0x1E0CEC2D0]();
}

uint64_t _UIUpdateRequestActivate()
{
  return MEMORY[0x1E0CEC2D8]();
}

uint64_t _UIUpdateRequestDeactivate()
{
  return MEMORY[0x1E0CEC2E0]();
}

uint64_t _UIUpdateSequenceInsertItem()
{
  return MEMORY[0x1E0CEC2F0]();
}

uint64_t _UIUpdateSequenceRemoveItem()
{
  return MEMORY[0x1E0CEC2F8]();
}

uint64_t _UIUserInterfaceSizeClassForHeight()
{
  return MEMORY[0x1E0CEC300]();
}

uint64_t _UIUserInterfaceSizeClassForWidth()
{
  return MEMORY[0x1E0CEC308]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t PKPassSecurePreviewContextCreateMessagesPreview(NSURL *a1, NSURL *a2)
{
  return MEMORY[0x1E0D6BFA8](a1, a2);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

float acosf(float a1)
{
  float result;

  MEMORY[0x1E0C81508](a1);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C816B8](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1E0C816C8](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C82640](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

uint64_t ckDefaultTextSizeForFontPointSize()
{
  return MEMORY[0x1E0D39BE0]();
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
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

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C83308](*(_QWORD *)&from_fd, *(_QWORD *)&to_fd, a3, *(_QWORD *)&flags);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C83790](a1);
}

float hypotf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C838F0](a1, a2);
  return result;
}

uint64_t im_dispatch_after()
{
  return MEMORY[0x1E0D36BB8]();
}

uint64_t im_main_thread()
{
  return MEMORY[0x1E0D36BD8]();
}

uint64_t im_perform_with_task_assertion()
{
  return MEMORY[0x1E0D36BE8]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x1E0DE7B50](m1, m2);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

float nanf(const char *a1)
{
  float result;

  MEMORY[0x1E0C84230](a1);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  return MEMORY[0x1E0C84768]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C84F90](__base, __nel, __width, __compar);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
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

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x1E0DEEBC0]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1E0DEECF0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1E0DEED18]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
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

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x1E0DF1018]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x1E0DF1028]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1E0DEEF28]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1E0DEEF30]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1E0DEEF50]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1E0DEEF58]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
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

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_SafariServices(double a1)
{
  dlopen("/System/Library/Frameworks/SafariServices.framework/SafariServices", 0);
  atomic_store(1u, &dlopenHelperFlag_SafariServices);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_EventKitUI(double a1)
{
  dlopen("/System/Library/Frameworks/EventKitUI.framework/EventKitUI", 0);
  atomic_store(1u, &dlopenHelperFlag_EventKitUI);
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___SFSafariViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_SafariServices))
    return dlopenHelper_SafariServices(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___EKEventEditViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_EventKitUI))
    return dlopenHelper_EventKitUI(result);
  return result;
}


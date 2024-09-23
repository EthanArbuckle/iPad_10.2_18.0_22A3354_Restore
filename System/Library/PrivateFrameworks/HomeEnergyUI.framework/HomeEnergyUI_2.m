uint64_t GridForecastWidgetView.init(energyWindows:forecastUIProvider:referenceTime:numHoursToDisplay:debugText:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[3];
  uint64_t v53;
  uint64_t v54;
  _BYTE v55[40];

  v49 = a6;
  v50 = a7;
  v48 = a5;
  v47 = a4;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v46 = (uint64_t)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v45 - v15;
  *(_QWORD *)a8 = swift_getKeyPath();
  *(_BYTE *)(a8 + 8) = 0;
  *(_QWORD *)(a8 + 16) = swift_getKeyPath();
  v17 = (int *)type metadata accessor for GridForecastWidgetView(0);
  *(_QWORD *)(a8 + 32) = 0;
  *(_QWORD *)(a8 + 40) = 0;
  *(_QWORD *)(a8 + 24) = 0;
  *(_BYTE *)(a8 + 48) = 0;
  v18 = a8 + v17[7];
  *(_QWORD *)(v18 + 32) = 0;
  *(_OWORD *)v18 = 0u;
  *(_OWORD *)(v18 + 16) = 0u;
  v19 = a8 + v17[8];
  v20 = sub_23E8A1D6C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 1, 1, v20);
  v21 = a8 + v17[9];
  *(_QWORD *)v21 = 0;
  *(_BYTE *)(v21 + 8) = 1;
  v22 = a1;
  *(_QWORD *)(a8 + v17[11]) = 0x4018000000000000;
  sub_23E753FC4(a1, a8 + v17[6], &qword_25433AC00);
  sub_23E889788(a2, v18, &qword_256D98510);
  v51 = a3;
  sub_23E889788(a3, v19, &qword_25433A8D8);
  *(_QWORD *)v21 = v47;
  *(_BYTE *)(v21 + 8) = v48 & 1;
  v23 = (_QWORD *)(a8 + v17[10]);
  v24 = v50;
  *v23 = v49;
  v23[1] = v24;
  if (qword_256D934B8 != -1)
    swift_once();
  v25 = sub_23E8A22C4();
  __swift_project_value_buffer(v25, (uint64_t)qword_256D96850);
  sub_23E753FC4(a1, (uint64_t)v16, &qword_25433AC00);
  sub_23E753FC4(a2, (uint64_t)v55, &qword_256D98510);
  v26 = sub_23E8A22AC();
  v27 = sub_23E8A3B24();
  v28 = (uint64_t)v16;
  if (os_log_type_enabled(v26, v27))
  {
    v50 = a2;
    v29 = swift_slowAlloc();
    v30 = swift_slowAlloc();
    v54 = v30;
    *(_DWORD *)v29 = 136315650;
    v52[0] = sub_23E755DA4(0xD000000000000051, 0x800000023E8B4990, &v54);
    sub_23E8A3BF0();
    *(_WORD *)(v29 + 12) = 2080;
    v31 = v28;
    v32 = v46;
    sub_23E753FC4(v28, v46, &qword_25433AC00);
    v33 = sub_23E8A1FAC();
    v34 = *(_QWORD *)(v33 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33) == 1)
    {
      v35 = 0x3E6C696E3CLL;
      sub_23E75496C(v32, &qword_25433AC00);
      v36 = 0xE500000000000000;
    }
    else
    {
      v35 = EnergyWindows.description.getter();
      v38 = v32;
      v36 = v39;
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v38, v33);
    }
    v52[0] = sub_23E755DA4(v35, v36, &v54);
    sub_23E8A3BF0();
    swift_bridgeObjectRelease();
    sub_23E75496C(v31, &qword_25433AC00);
    *(_WORD *)(v29 + 22) = 2080;
    sub_23E753FC4((uint64_t)v55, (uint64_t)v52, &qword_256D98510);
    if (v53)
    {
      __swift_project_boxed_opaque_existential_0(v52, v53);
      v40 = sub_23E8A3D64();
      v42 = v41;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
    }
    else
    {
      v40 = 0x3E6C696E3CLL;
      sub_23E75496C((uint64_t)v52, &qword_256D98510);
      v42 = 0xE500000000000000;
    }
    v43 = v50;
    v52[0] = sub_23E755DA4(v40, v42, &v54);
    sub_23E8A3BF0();
    swift_bridgeObjectRelease();
    sub_23E75496C((uint64_t)v55, &qword_256D98510);
    _os_log_impl(&dword_23E74F000, v26, v27, "GridForecastWidgetView:%s: w/ windows %s & provider: %s", (uint8_t *)v29, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2426553D0](v30, -1, -1);
    MEMORY[0x2426553D0](v29, -1, -1);

    sub_23E75496C(v51, &qword_25433A8D8);
    sub_23E75496C(v43, &qword_256D98510);
    v37 = v22;
  }
  else
  {

    sub_23E75496C((uint64_t)v55, &qword_256D98510);
    sub_23E75496C((uint64_t)v16, &qword_25433AC00);
    sub_23E75496C(v51, &qword_25433A8D8);
    sub_23E75496C(a2, &qword_256D98510);
    v37 = a1;
  }
  return sub_23E75496C(v37, &qword_25433AC00);
}

uint64_t sub_23E887F90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char v7;
  void (*v8)(char *, uint64_t);
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v0 = sub_23E8A29A8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v15 - v5;
  type metadata accessor for GridForecastWidgetView.UsageAdviceView(0);
  sub_23E753F90((uint64_t)v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BDECF18], v0);
  v7 = sub_23E8A299C();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  if (qword_256D934B8 != -1)
    swift_once();
  v9 = sub_23E8A22C4();
  __swift_project_value_buffer(v9, (uint64_t)qword_256D96850);
  v10 = sub_23E8A22AC();
  v11 = sub_23E8A3B24();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v16 = v13;
    *(_DWORD *)v12 = 136315394;
    v15 = sub_23E755DA4(0x61746544776F6873, 0xEB00000000736C69, &v16);
    sub_23E8A3BF0();
    *(_WORD *)(v12 + 12) = 1024;
    LODWORD(v15) = v7 & 1;
    sub_23E8A3BF0();
    _os_log_impl(&dword_23E74F000, v10, v11, "%s %{BOOL}d", (uint8_t *)v12, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x2426553D0](v13, -1, -1);
    MEMORY[0x2426553D0](v12, -1, -1);
  }

  return v7 & 1;
}

uint64_t sub_23E8881D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  _QWORD v26[3];
  uint64_t v27;
  uint64_t v28;

  v1 = sub_23E8A2C60();
  MEMORY[0x24BDAC7A8](v1);
  v2 = v0 + *(int *)(type metadata accessor for GridForecastWidgetView.UsageAdviceView(0) + 28);
  sub_23E753FC4(v2, (uint64_t)v26, &qword_256D98510);
  v3 = v27;
  if (v27)
  {
    v4 = v28;
    __swift_project_boxed_opaque_existential_0(v26, v27);
    v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(1, v3, v4);
    v7 = v6;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    if (v7)
      goto LABEL_6;
  }
  else
  {
    sub_23E75496C((uint64_t)v26, &qword_256D98510);
  }
  swift_bridgeObjectRelease();
  v7 = 0xE200000000000000;
  v5 = 11565;
LABEL_6:
  v26[0] = v5;
  v26[1] = v7;
  sub_23E7573F0();
  v8 = sub_23E8A3014();
  v10 = v9;
  v12 = v11;
  v13 = v11 & 1;
  sub_23E753FC4(v2, (uint64_t)v26, &qword_256D98510);
  v14 = v27;
  if (v27)
  {
    v15 = v28;
    __swift_project_boxed_opaque_existential_0(v26, v27);
    v16 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 32);
    sub_23E769FBC(v8, v10, v13);
    swift_bridgeObjectRetain();
    v17 = v16(v14, v15);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    if ((v17 & 1) != 0)
    {
      sub_23E8A2C54();
      sub_23E8A2C48();
      sub_23E8A32CC();
      sub_23E8A2C30();
      swift_release();
      sub_23E8A2C48();
      sub_23E8A2C78();
      v18 = sub_23E8A2FFC();
      v20 = v19;
      v22 = v21 & 1;
      v23 = v12 & 1;
      v24 = sub_23E8A2F9C();
      sub_23E754444(v8, v10, v23);
      swift_bridgeObjectRelease();
      sub_23E754444(v8, v10, v23);
      swift_bridgeObjectRelease();
      sub_23E754444(v18, v20, v22);
      swift_bridgeObjectRelease();
      return v24;
    }
    else
    {
      sub_23E754444(v8, v10, v12 & 1);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_23E75496C((uint64_t)v26, &qword_256D98510);
  }
  return v8;
}

uint64_t sub_23E8884D8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v20;
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
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  uint64_t v57;
  char v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t KeyPath;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  char v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  char v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  void (*v114)(char *, uint64_t);
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  char v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char v137;
  char v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char v144;
  char v145;
  uint64_t v146;
  char *v147;
  char v148;
  char v149;
  unint64_t v150;
  char *v151;
  void (*v152)(char *, char *, uint64_t);
  uint64_t v153;
  char *v154;
  void (*v155)(char *, char *, uint64_t);
  uint64_t v156;
  uint64_t v157;
  char *v158;
  int *v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  unint64_t *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void (*v174)(char *, uint64_t);
  uint64_t v175;
  uint64_t v177;
  uint64_t v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  char *v182;
  char *v183;
  char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  char *v188;
  unint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  id v194;
  uint64_t v195;
  unint64_t v196;
  uint64_t v197;
  char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t *v201;
  char *v202;
  char *v203;
  unint64_t v204;
  char *v205;
  uint64_t v206;
  char *v207;
  unint64_t v208;
  uint64_t v209;
  char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  char *v215;
  uint64_t v216;
  char *v217;
  uint64_t v218;
  char *v219;
  uint64_t v220;
  char *v221;
  uint64_t v222;
  __int128 v223;
  __int128 v224;
  _QWORD v225[4];
  uint64_t v226;
  uint64_t v227;
  char *v228;
  char *v229;
  uint64_t v230;
  char *v231;
  uint64_t v232;
  unsigned __int8 v233;
  uint64_t v234;
  unsigned __int8 v235;
  uint64_t v236;
  unsigned __int8 v237;
  __int128 v238;

  v207 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D93F80);
  MEMORY[0x24BDAC7A8](v3);
  v188 = (char *)&v177 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E8A380C();
  v180 = *(_QWORD *)(v5 - 8);
  v181 = v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v179 = (char *)&v177 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v178 = (uint64_t)&v177 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D944B8);
  v186 = *(_QWORD *)(v9 - 8);
  v187 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v183 = (char *)&v177 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v185 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D977F0);
  MEMORY[0x24BDAC7A8](v185);
  v184 = (char *)&v177 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98690);
  v190 = *(_QWORD *)(v12 - 8);
  v191 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v182 = (char *)&v177 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98698);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v209 = (uint64_t)&v177 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v214 = (uint64_t)&v177 - v17;
  v18 = sub_23E8A2F00();
  v204 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v177 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v206 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AF20);
  MEMORY[0x24BDAC7A8](v206);
  v205 = (char *)&v177 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v222 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D986A0);
  v220 = *(_QWORD *)(v222 - 8);
  v22 = MEMORY[0x24BDAC7A8](v222);
  v221 = (char *)&v177 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v219 = (char *)&v177 - v24;
  v197 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433B218);
  MEMORY[0x24BDAC7A8](v197);
  v201 = (uint64_t *)((char *)&v177 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  v26 = sub_23E8A32F0();
  v199 = *(_QWORD *)(v26 - 8);
  v200 = v26;
  MEMORY[0x24BDAC7A8](v26);
  v198 = (char *)&v177 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v213 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AF18);
  MEMORY[0x24BDAC7A8](v213);
  v202 = (char *)&v177 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v208 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AFD8);
  MEMORY[0x24BDAC7A8](v208);
  v203 = (char *)&v177 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v218 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D986A8);
  v216 = *(_QWORD *)(v218 - 8);
  v30 = MEMORY[0x24BDAC7A8](v218);
  v217 = (char *)&v177 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v215 = (char *)&v177 - v32;
  v33 = type metadata accessor for GridForecastWidgetView.UsageAdviceView(0);
  v34 = a1 + *(int *)(v33 + 28);
  sub_23E753FC4(v34, (uint64_t)&v226, &qword_256D98510);
  v35 = (uint64_t)v229;
  if (v229)
  {
    v36 = v230;
    __swift_project_boxed_opaque_existential_0(&v226, (uint64_t)v229);
    v195 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v36 + 40))(a1 + *(int *)(v33 + 32), v35, v36);
    v196 = v37;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v226);
  }
  else
  {
    sub_23E75496C((uint64_t)&v226, &qword_256D98510);
    v195 = 11565;
    v196 = 0xE200000000000000;
  }
  sub_23E753FC4(v34, (uint64_t)&v226, &qword_256D98510);
  v38 = (uint64_t)v229;
  v192 = v33;
  v210 = v20;
  v211 = v18;
  if (v229)
  {
    v39 = v230;
    __swift_project_boxed_opaque_existential_0(&v226, (uint64_t)v229);
    v177 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(a1 + *(int *)(v33 + 32), v38, v39);
    v189 = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v226);
  }
  else
  {
    sub_23E75496C((uint64_t)&v226, &qword_256D98510);
    v189 = 0xE200000000000000;
    v177 = 11565;
  }
  v41 = sub_23E8881D8();
  v43 = v42;
  v45 = v44 & 1;
  sub_23E8A2F30();
  v46 = sub_23E8A2FC0();
  v212 = a1;
  v48 = v47;
  v50 = v49;
  swift_release();
  v51 = v50 & 1;
  sub_23E754444(v41, v43, v45);
  swift_bridgeObjectRelease();
  v194 = (id)objc_opt_self();
  MEMORY[0x2426541DC](objc_msgSend(v194, sel_labelColor));
  v52 = sub_23E8A2F84();
  v54 = v53;
  v56 = v55;
  v193 = v57;
  swift_release();
  v58 = v56 & 1;
  sub_23E754444(v46, v48, v51);
  swift_bridgeObjectRelease();
  v59 = v198;
  v60 = v199;
  v61 = v200;
  (*(void (**)(char *, _QWORD, uint64_t))(v199 + 104))(v198, *MEMORY[0x24BDF40B0], v200);
  KeyPath = swift_getKeyPath();
  v63 = v201;
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))((char *)v201 + *(int *)(v197 + 28), v59, v61);
  *v63 = KeyPath;
  v64 = (uint64_t)v202;
  sub_23E753FC4((uint64_t)v63, (uint64_t)&v202[*(int *)(v213 + 36)], &qword_25433B218);
  *(_QWORD *)v64 = v52;
  *(_QWORD *)(v64 + 8) = v54;
  *(_BYTE *)(v64 + 16) = v58;
  *(_QWORD *)(v64 + 24) = v193;
  sub_23E769FBC(v52, v54, v58);
  swift_bridgeObjectRetain();
  sub_23E75496C((uint64_t)v63, &qword_25433B218);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v59, v61);
  sub_23E754444(v52, v54, v58);
  swift_bridgeObjectRelease();
  sub_23E88B55C();
  v65 = (uint64_t)v203;
  sub_23E8A3164();
  sub_23E75496C(v64, &qword_25433AF18);
  sub_23E88B5E0();
  v66 = v217;
  sub_23E8A308C();
  sub_23E75496C(v65, &qword_25433AFD8);
  (*(void (**)(char *, char *, uint64_t))(v216 + 32))(v215, v66, v218);
  v226 = v195;
  v227 = v196;
  v208 = sub_23E7573F0();
  v67 = sub_23E8A3014();
  v69 = v68;
  LOBYTE(v65) = v70 & 1;
  sub_23E8A2EE8();
  v71 = *MEMORY[0x24BDF17C8];
  v72 = v204;
  v73 = v210;
  v74 = v211;
  v213 = *(_QWORD *)(v204 + 104);
  ((void (*)(char *, uint64_t, uint64_t))v213)(v210, v71, v211);
  sub_23E8A2F18();
  swift_release();
  v204 = *(_QWORD *)(v72 + 8);
  ((void (*)(char *, uint64_t))v204)(v73, v74);
  v75 = sub_23E8A2FC0();
  v77 = v76;
  LOBYTE(v73) = v78;
  swift_release();
  sub_23E754444(v67, v69, v65);
  swift_bridgeObjectRelease();
  sub_23E8A2EAC();
  v79 = sub_23E8A2F78();
  v81 = v80;
  LOBYTE(v65) = v82 & 1;
  sub_23E754444(v75, v77, v73 & 1);
  swift_bridgeObjectRelease();
  MEMORY[0x2426541DC](objc_msgSend(v194, sel_labelColor));
  v83 = sub_23E8A2F84();
  v85 = v84;
  LOBYTE(v73) = v86;
  v88 = v87;
  swift_release();
  sub_23E754444(v79, v81, v65);
  swift_bridgeObjectRelease();
  v226 = v83;
  v227 = v85;
  LOBYTE(v228) = v73 & 1;
  v229 = (char *)v88;
  v89 = (uint64_t)v205;
  sub_23E8A3164();
  v90 = v212;
  sub_23E754444(v83, v85, v73 & 1);
  swift_bridgeObjectRelease();
  sub_23E7C54DC();
  v91 = v221;
  sub_23E8A308C();
  sub_23E75496C(v89, &qword_25433AF20);
  (*(void (**)(char *, char *, uint64_t))(v220 + 32))(v219, v91, v222);
  if ((sub_23E887F90() & 1) != 0)
  {
    v226 = v177;
    v227 = v189;
    v92 = sub_23E8A3014();
    v94 = v93;
    v96 = v95 & 1;
    sub_23E8A2F24();
    v97 = v210;
    v98 = v211;
    ((void (*)(char *, _QWORD, uint64_t))v213)(v210, *MEMORY[0x24BDF17D0], v211);
    sub_23E8A2F18();
    swift_release();
    ((void (*)(char *, uint64_t))v204)(v97, v98);
    v99 = sub_23E8A2FC0();
    v101 = v100;
    LOBYTE(v97) = v102;
    swift_release();
    sub_23E754444(v92, v94, v96);
    swift_bridgeObjectRelease();
    sub_23E8A3290();
    v103 = sub_23E8A2F84();
    v105 = v104;
    v107 = v106;
    v109 = v108;
    swift_release();
    sub_23E754444(v99, v101, v97 & 1);
    swift_bridgeObjectRelease();
    v226 = v103;
    v227 = v105;
    v90 = v212;
    LOBYTE(v228) = v107 & 1;
    v229 = (char *)v109;
    v110 = v178;
    sub_23E7BB83C(v178);
    v112 = v179;
    v111 = v180;
    v113 = v181;
    (*(void (**)(char *, _QWORD, uint64_t))(v180 + 104))(v179, *MEMORY[0x24BDFAED8], v181);
    sub_23E7518F4(&qword_256D986D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDFAF28]);
    sub_23E8A39EC();
    sub_23E8A39EC();
    v114 = *(void (**)(char *, uint64_t))(v111 + 8);
    v114(v112, v113);
    v114((char *)v110, v113);
    v115 = v183;
    v116 = MEMORY[0x24BDF1FA8];
    v117 = MEMORY[0x24BDF1F80];
    sub_23E8A31D0();
    sub_23E754444(v226, v227, (char)v228);
    swift_bridgeObjectRelease();
    v226 = v116;
    v227 = v117;
    swift_getOpaqueTypeConformance2();
    v118 = (uint64_t)v184;
    v119 = v187;
    sub_23E8A3164();
    (*(void (**)(char *, uint64_t))(v186 + 8))(v115, v119);
    sub_23E88B784();
    v120 = v182;
    sub_23E8A308C();
    sub_23E75496C(v118, &qword_256D977F0);
    v121 = v190;
    v122 = v214;
    v123 = v120;
    v124 = v191;
    (*(void (**)(uint64_t, char *, uint64_t))(v190 + 32))(v214, v123, v191);
    v125 = 0;
    v126 = v192;
  }
  else
  {
    swift_bridgeObjectRelease();
    v125 = 1;
    v122 = v214;
    v124 = v191;
    v126 = v192;
    v121 = v190;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v121 + 56))(v122, v125, 1, v124);
  v127 = v90 + *(int *)(v126 + 24);
  v128 = *(_QWORD *)v127;
  v129 = *(_BYTE *)(v127 + 8);
  sub_23E7571D4(*(_QWORD *)v127, v129);
  v130 = sub_23E7BB450(v128, v129);
  sub_23E754C98(v128, v129);
  if ((v130 & 1) != 0)
  {
    v223 = xmmword_23E8AAFD0;
    v224 = 0u;
    memset(v225, 0, 25);
  }
  else
  {
    v226 = sub_23E8A323C();
    sub_23E88B664();
    v131 = sub_23E8A32B4();
    sub_23E8A3470();
    sub_23E8A28A0();
    *(_QWORD *)&v223 = v131;
    *((_QWORD *)&v223 + 1) = v234;
    *(_QWORD *)&v224 = v235;
    *((_QWORD *)&v224 + 1) = v236;
    v225[0] = v237;
    *(_OWORD *)&v225[1] = v238;
    LOBYTE(v225[3]) = 1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D986C0);
  sub_23E88B6A8();
  sub_23E8A2CF0();
  v212 = v227;
  v213 = v226;
  v202 = v229;
  v203 = v228;
  v211 = v230;
  v200 = v232;
  v201 = (uint64_t *)v231;
  LODWORD(v210) = v233;
  v132 = (uint64_t *)(v90 + *(int *)(v126 + 36));
  v133 = v132[1];
  if (v133)
  {
    v226 = *v132;
    v227 = v133;
    swift_bridgeObjectRetain();
    v134 = sub_23E8A3014();
    v136 = v135;
    v138 = v137 & 1;
    v139 = sub_23E8A2E94();
    v140 = (uint64_t)v188;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v139 - 8) + 56))(v188, 1, 1, v139);
    sub_23E8A2ED0();
    sub_23E75496C(v140, &qword_256D93F80);
    v141 = sub_23E8A2FC0();
    v143 = v142;
    v145 = v144;
    swift_release();
    sub_23E754444(v134, v136, v138);
    swift_bridgeObjectRelease();
    sub_23E8A320C();
    v208 = sub_23E8A2F84();
    v205 = v147;
    v206 = v146;
    v149 = v148;
    swift_release();
    v150 = v149 & 1;
    sub_23E754444(v141, v143, v145 & 1);
    swift_bridgeObjectRelease();
  }
  else
  {
    v208 = 0;
    v205 = 0;
    v206 = 0;
    v150 = 0;
  }
  v151 = v217;
  v152 = *(void (**)(char *, char *, uint64_t))(v216 + 16);
  v153 = v218;
  v152(v217, v215, v218);
  v154 = v221;
  v155 = *(void (**)(char *, char *, uint64_t))(v220 + 16);
  v156 = v222;
  v155(v221, v219, v222);
  v157 = v209;
  sub_23E753FC4(v214, v209, &qword_256D98698);
  v158 = v207;
  v152(v207, v151, v153);
  v159 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256D986D0);
  v155(&v158[v159[12]], v154, v156);
  sub_23E753FC4(v157, (uint64_t)&v158[v159[16]], &qword_256D98698);
  v160 = &v158[v159[20]];
  v161 = v213;
  *(_QWORD *)v160 = v213;
  v162 = v161;
  v213 = v161;
  v163 = v212;
  v164 = (uint64_t)v202;
  v165 = (uint64_t)v203;
  *((_QWORD *)v160 + 1) = v212;
  *((_QWORD *)v160 + 2) = v165;
  v166 = v211;
  *((_QWORD *)v160 + 3) = v164;
  *((_QWORD *)v160 + 4) = v166;
  v167 = v166;
  v211 = v166;
  v168 = v200;
  v169 = (uint64_t)v201;
  *((_QWORD *)v160 + 5) = v201;
  *((_QWORD *)v160 + 6) = v168;
  LODWORD(v166) = (_DWORD)v210;
  v160[56] = (char)v210;
  LODWORD(v210) = v166;
  v170 = (unint64_t *)&v158[v159[24]];
  v171 = v208;
  v172 = (uint64_t)v205;
  v173 = v206;
  *v170 = v208;
  v170[1] = v173;
  v170[2] = v150;
  v170[3] = v172;
  v204 = v150;
  sub_23E88B70C(v162, v163, v165, v164, v167, v169, v168, v166);
  sub_23E88B718(v171, v173, v150, v172);
  sub_23E75496C(v214, &qword_256D98698);
  v220 = *(_QWORD *)(v220 + 8);
  ((void (*)(char *, uint64_t))v220)(v219, v222);
  v174 = *(void (**)(char *, uint64_t))(v216 + 8);
  v175 = v218;
  v174(v215, v218);
  sub_23E88B748(v171, v173, v204, v172);
  sub_23E88B778(v213, v212, v165, v164, v211, v169, v168, (char)v210);
  sub_23E75496C(v209, &qword_256D98698);
  ((void (*)(char *, uint64_t))v220)(v221, v222);
  return ((uint64_t (*)(char *, uint64_t))v174)(v217, v175);
}

uint64_t sub_23E8895F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = sub_23E8A2CC0();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98688);
  return sub_23E8884D8(v1, (char *)(a1 + *(int *)(v3 + 44)));
}

uint64_t sub_23E889640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;

  if ((a5 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_23E88964C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
  return a1;
}

uint64_t sub_23E889684()
{
  unsigned __int8 v1;

  sub_23E8A2B70();
  sub_23E7518F4(&qword_256D986E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAAC0], MEMORY[0x24BDFAAB8]);
  sub_23E8A2BF4();
  return v1;
}

uint64_t sub_23E8896E4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_23E8A2B70();
  sub_23E7518F4(&qword_256D986E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAAC0], MEMORY[0x24BDFAAB8]);
  result = sub_23E8A2BF4();
  *a1 = v3;
  return result;
}

void sub_23E88975C(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(double *)a1 = MEMORY[0x242653BAC]();
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
}

uint64_t sub_23E889788(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 24))(a2, a1, v5);
  return a2;
}

uint64_t sub_23E8897CC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t initializeBufferWithCopyOfBuffer for GridForecastWidgetView(unint64_t a1, uint64_t a2, int *a3)
{
  int v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  void *v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v20 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = *(_QWORD *)a2;
    v8 = *(_BYTE *)(a2 + 8);
    sub_23E7571D4(*(_QWORD *)a2, v8);
    *(_QWORD *)a1 = v7;
    *(_BYTE *)(a1 + 8) = v8;
    v9 = *(_QWORD *)(a2 + 16);
    v10 = *(_QWORD *)(a2 + 24);
    v11 = *(_QWORD *)(a2 + 32);
    v12 = *(_QWORD *)(a2 + 40);
    v13 = *(_BYTE *)(a2 + 48);
    sub_23E889640(v9, v10, v11, v12, v13);
    *(_QWORD *)(a1 + 16) = v9;
    *(_QWORD *)(a1 + 24) = v10;
    *(_QWORD *)(a1 + 32) = v11;
    *(_QWORD *)(a1 + 40) = v12;
    *(_BYTE *)(a1 + 48) = v13;
    v14 = a3[6];
    v15 = (void *)(a1 + v14);
    v16 = (const void *)(a2 + v14);
    v17 = sub_23E8A1FAC();
    v18 = *(_QWORD *)(v17 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
    v21 = a3[7];
    v22 = a1 + v21;
    v23 = a2 + v21;
    v24 = *(_QWORD *)(a2 + v21 + 24);
    if (v24)
    {
      v25 = *(_QWORD *)(v23 + 32);
      *(_QWORD *)(v22 + 24) = v24;
      *(_QWORD *)(v22 + 32) = v25;
      (**(void (***)(void))(v24 - 8))();
    }
    else
    {
      v26 = *(_OWORD *)(v23 + 16);
      *(_OWORD *)v22 = *(_OWORD *)v23;
      *(_OWORD *)(v22 + 16) = v26;
      *(_QWORD *)(v22 + 32) = *(_QWORD *)(v23 + 32);
    }
    v27 = a3[8];
    v28 = (void *)(a1 + v27);
    v29 = (const void *)(a2 + v27);
    v30 = sub_23E8A1D6C();
    v31 = *(_QWORD *)(v30 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
    {
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433A8D8);
      memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v31 + 16))(v28, v29, v30);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
    }
    v33 = a3[9];
    v34 = a3[10];
    v35 = a1 + v33;
    v36 = a2 + v33;
    *(_QWORD *)v35 = *(_QWORD *)v36;
    *(_BYTE *)(v35 + 8) = *(_BYTE *)(v36 + 8);
    v37 = (_QWORD *)(a1 + v34);
    v38 = (_QWORD *)(a2 + v34);
    v39 = v38[1];
    *v37 = *v38;
    v37[1] = v39;
    *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for GridForecastWidgetView(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_23E754C98(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  sub_23E7BD034(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
  v4 = a1 + a2[6];
  v5 = sub_23E8A1FAC();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v7 = a1 + a2[7];
  if (*(_QWORD *)(v7 + 24))
    __swift_destroy_boxed_opaque_existential_1(v7);
  v8 = a1 + a2[8];
  v9 = sub_23E8A1D6C();
  v10 = *(_QWORD *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GridForecastWidgetView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  void *v26;
  const void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_23E7571D4(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(_QWORD *)(a2 + 40);
  v12 = *(_BYTE *)(a2 + 48);
  sub_23E889640(v8, v9, v10, v11, v12);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 40) = v11;
  *(_BYTE *)(a1 + 48) = v12;
  v13 = a3[6];
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = sub_23E8A1FAC();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  v19 = a3[7];
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = *(_QWORD *)(a2 + v19 + 24);
  if (v22)
  {
    v23 = *(_QWORD *)(v21 + 32);
    *(_QWORD *)(v20 + 24) = v22;
    *(_QWORD *)(v20 + 32) = v23;
    (**(void (***)(void))(v22 - 8))();
  }
  else
  {
    v24 = *(_OWORD *)(v21 + 16);
    *(_OWORD *)v20 = *(_OWORD *)v21;
    *(_OWORD *)(v20 + 16) = v24;
    *(_QWORD *)(v20 + 32) = *(_QWORD *)(v21 + 32);
  }
  v25 = a3[8];
  v26 = (void *)(a1 + v25);
  v27 = (const void *)(a2 + v25);
  v28 = sub_23E8A1D6C();
  v29 = *(_QWORD *)(v28 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
  {
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433A8D8);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v29 + 16))(v26, v27, v28);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  v31 = a3[9];
  v32 = a3[10];
  v33 = a1 + v31;
  v34 = a2 + v31;
  *(_QWORD *)v33 = *(_QWORD *)v34;
  *(_BYTE *)(v33 + 8) = *(_BYTE *)(v34 + 8);
  v35 = (_QWORD *)(a1 + v32);
  v36 = (_QWORD *)(a2 + v32);
  v37 = v36[1];
  *v35 = *v36;
  v35[1] = v37;
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for GridForecastWidgetView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(void *, uint64_t, uint64_t);
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(void *, uint64_t, uint64_t);
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_23E7571D4(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_23E754C98(v8, v9);
  v10 = *(_QWORD *)(a2 + 16);
  v11 = *(_QWORD *)(a2 + 24);
  v12 = *(_QWORD *)(a2 + 32);
  v13 = *(_QWORD *)(a2 + 40);
  v14 = *(_BYTE *)(a2 + 48);
  sub_23E889640(v10, v11, v12, v13, v14);
  v15 = *(_QWORD *)(a1 + 16);
  v16 = *(_QWORD *)(a1 + 24);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  v19 = *(_BYTE *)(a1 + 48);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 24) = v11;
  *(_QWORD *)(a1 + 32) = v12;
  *(_QWORD *)(a1 + 40) = v13;
  *(_BYTE *)(a1 + 48) = v14;
  sub_23E7BD034(v15, v16, v17, v18, v19);
  v20 = a3[6];
  v21 = (void *)(a1 + v20);
  v22 = (void *)(a2 + v20);
  v23 = sub_23E8A1FAC();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v24 + 48);
  LODWORD(v13) = v25(v21, 1, v23);
  v26 = v25(v22, 1, v23);
  if ((_DWORD)v13)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v26)
  {
    (*(void (**)(void *, uint64_t))(v24 + 8))(v21, v23);
LABEL_6:
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v24 + 24))(v21, v22, v23);
LABEL_7:
  v28 = a3[7];
  v29 = a1 + v28;
  v30 = (uint64_t *)(a2 + v28);
  v31 = *(_QWORD *)(a2 + v28 + 24);
  if (*(_QWORD *)(a1 + v28 + 24))
  {
    if (v31)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)v29, v30);
      goto LABEL_14;
    }
    __swift_destroy_boxed_opaque_existential_1(v29);
  }
  else if (v31)
  {
    *(_QWORD *)(v29 + 24) = v31;
    *(_QWORD *)(v29 + 32) = v30[4];
    (**(void (***)(uint64_t, __int128 *))(v31 - 8))(v29, (__int128 *)v30);
    goto LABEL_14;
  }
  v32 = *(_OWORD *)v30;
  v33 = *((_OWORD *)v30 + 1);
  *(_QWORD *)(v29 + 32) = v30[4];
  *(_OWORD *)v29 = v32;
  *(_OWORD *)(v29 + 16) = v33;
LABEL_14:
  v34 = a3[8];
  v35 = (void *)(a1 + v34);
  v36 = (void *)(a2 + v34);
  v37 = sub_23E8A1D6C();
  v38 = *(_QWORD *)(v37 - 8);
  v39 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v38 + 48);
  v40 = v39(v35, 1, v37);
  v41 = v39(v36, 1, v37);
  if (!v40)
  {
    if (!v41)
    {
      (*(void (**)(void *, void *, uint64_t))(v38 + 24))(v35, v36, v37);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v38 + 8))(v35, v37);
    goto LABEL_19;
  }
  if (v41)
  {
LABEL_19:
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433A8D8);
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, void *, uint64_t))(v38 + 16))(v35, v36, v37);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
LABEL_20:
  v43 = a3[9];
  v44 = a1 + v43;
  v45 = (uint64_t *)(a2 + v43);
  v46 = *v45;
  *(_BYTE *)(v44 + 8) = *((_BYTE *)v45 + 8);
  *(_QWORD *)v44 = v46;
  v47 = a3[10];
  v48 = (_QWORD *)(a1 + v47);
  v49 = (_QWORD *)(a2 + v47);
  *v48 = *v49;
  v48[1] = v49[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  return a1;
}

uint64_t initializeWithTake for GridForecastWidgetView(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v7 = a3[6];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_23E8A1FAC();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[7];
  v14 = a3[8];
  v15 = a1 + v13;
  v16 = a2 + v13;
  v17 = *(_OWORD *)(v16 + 16);
  *(_OWORD *)v15 = *(_OWORD *)v16;
  *(_OWORD *)(v15 + 16) = v17;
  *(_QWORD *)(v15 + 32) = *(_QWORD *)(v16 + 32);
  v18 = (void *)(a1 + v14);
  v19 = (const void *)(a2 + v14);
  v20 = sub_23E8A1D6C();
  v21 = *(_QWORD *)(v20 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433A8D8);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 32))(v18, v19, v20);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  v23 = a3[9];
  v24 = a3[10];
  v25 = a1 + v23;
  v26 = a2 + v23;
  *(_QWORD *)v25 = *(_QWORD *)v26;
  *(_BYTE *)(v25 + 8) = *(_BYTE *)(v26 + 8);
  *(_OWORD *)(a1 + v24) = *(_OWORD *)(a2 + v24);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  return a1;
}

uint64_t assignWithTake for GridForecastWidgetView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(void *, uint64_t, uint64_t);
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  void *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(void *, uint64_t, uint64_t);
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_23E754C98(v8, v9);
  v10 = *((_BYTE *)a2 + 48);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(_BYTE *)(a1 + 48);
  v16 = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  *(_OWORD *)(a1 + 32) = v16;
  *(_BYTE *)(a1 + 48) = v10;
  sub_23E7BD034(v11, v12, v13, v14, v15);
  v17 = a3[6];
  v18 = (void *)(a1 + v17);
  v19 = (char *)a2 + v17;
  v20 = sub_23E8A1FAC();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  v23 = v22(v18, 1, v20);
  v24 = v22(v19, 1, v20);
  if (v23)
  {
    if (!v24)
    {
      (*(void (**)(void *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v24)
  {
    (*(void (**)(void *, uint64_t))(v21 + 8))(v18, v20);
LABEL_6:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, char *, uint64_t))(v21 + 40))(v18, v19, v20);
LABEL_7:
  v26 = a3[7];
  v27 = a1 + v26;
  v28 = (uint64_t)a2 + v26;
  if (*(_QWORD *)(a1 + v26 + 24))
    __swift_destroy_boxed_opaque_existential_1(v27);
  v29 = *(_OWORD *)(v28 + 16);
  *(_OWORD *)v27 = *(_OWORD *)v28;
  *(_OWORD *)(v27 + 16) = v29;
  *(_QWORD *)(v27 + 32) = *(_QWORD *)(v28 + 32);
  v30 = a3[8];
  v31 = (void *)(a1 + v30);
  v32 = (char *)a2 + v30;
  v33 = sub_23E8A1D6C();
  v34 = *(_QWORD *)(v33 - 8);
  v35 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v34 + 48);
  v36 = v35(v31, 1, v33);
  v37 = v35(v32, 1, v33);
  if (!v36)
  {
    if (!v37)
    {
      (*(void (**)(void *, char *, uint64_t))(v34 + 40))(v31, v32, v33);
      goto LABEL_15;
    }
    (*(void (**)(void *, uint64_t))(v34 + 8))(v31, v33);
    goto LABEL_14;
  }
  if (v37)
  {
LABEL_14:
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433A8D8);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    goto LABEL_15;
  }
  (*(void (**)(void *, char *, uint64_t))(v34 + 32))(v31, v32, v33);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
LABEL_15:
  v39 = a3[9];
  v40 = a3[10];
  v41 = a1 + v39;
  v42 = (uint64_t)a2 + v39;
  *(_QWORD *)v41 = *(_QWORD *)v42;
  *(_BYTE *)(v41 + 8) = *(_BYTE *)(v42 + 8);
  v43 = (_QWORD *)(a1 + v40);
  v44 = (uint64_t *)((char *)a2 + v40);
  v46 = *v44;
  v45 = v44[1];
  *v43 = v46;
  v43[1] = v45;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
  return a1;
}

uint64_t getEnumTagSinglePayload for GridForecastWidgetView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E88A448(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433A8D8);
    v7 = *(_QWORD *)(v8 - 8);
    v9 = a3[8];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = *(_QWORD *)(a1 + a3[7] + 24);
  if (v10 >= 0xFFFFFFFF)
    LODWORD(v10) = -1;
  v11 = v10 - 1;
  if (v11 < 0)
    v11 = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for GridForecastWidgetView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E88A510(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[6];
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(a1 + a4[7] + 24) = a2;
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433A8D8);
    v9 = *(_QWORD *)(v10 - 8);
    v11 = a4[8];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
}

void sub_23E88A5BC()
{
  unint64_t v0;
  unint64_t v1;

  sub_23E76641C(319, (unint64_t *)&unk_25433AC08, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F2B0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
  {
    sub_23E76641C(319, qword_256D98580, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

unint64_t sub_23E88A6B0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D985C8;
  if (!qword_256D985C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D984F8);
    v2[0] = sub_23E753F50(&qword_256D985D0, &qword_256D984F0, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x242655328](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D985C8);
  }
  return result;
}

uint64_t *sub_23E88A734(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D95080);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23E8A380C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[5];
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADF0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_23E8A29A8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v13 = a3[6];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = *(_QWORD *)v15;
    v17 = v15[8];
    sub_23E7571D4(*(_QWORD *)v15, v17);
    *(_QWORD *)v14 = v16;
    v14[8] = v17;
    v18 = a3[7];
    v19 = (char *)a1 + v18;
    v20 = (char *)a2 + v18;
    v21 = *(uint64_t *)((char *)a2 + v18 + 24);
    if (v21)
    {
      v22 = *((_QWORD *)v20 + 4);
      *((_QWORD *)v19 + 3) = v21;
      *((_QWORD *)v19 + 4) = v22;
      (**(void (***)(void))(v21 - 8))();
    }
    else
    {
      v23 = *((_OWORD *)v20 + 1);
      *(_OWORD *)v19 = *(_OWORD *)v20;
      *((_OWORD *)v19 + 1) = v23;
      *((_QWORD *)v19 + 4) = *((_QWORD *)v20 + 4);
    }
    v24 = a3[8];
    v25 = (char *)a1 + v24;
    v26 = (char *)a2 + v24;
    v27 = sub_23E8A1D6C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
    v28 = a3[9];
    v29 = (uint64_t *)((char *)a1 + v28);
    v30 = (uint64_t *)((char *)a2 + v28);
    v31 = v30[1];
    *v29 = *v30;
    v29[1] = v31;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_23E88A92C(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D95080);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23E8A380C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADF0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23E8A29A8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  sub_23E754C98(*(_QWORD *)(a1 + a2[6]), *(_BYTE *)(a1 + a2[6] + 8));
  v7 = a1 + a2[7];
  if (*(_QWORD *)(v7 + 24))
    __swift_destroy_boxed_opaque_existential_1(v7);
  v8 = a1 + a2[8];
  v9 = sub_23E8A1D6C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  return swift_bridgeObjectRelease();
}

_QWORD *sub_23E88AA44(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D95080);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23E8A380C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[5];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADF0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_23E8A29A8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = a3[6];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = *(_QWORD *)v13;
  v15 = v13[8];
  sub_23E7571D4(*(_QWORD *)v13, v15);
  *(_QWORD *)v12 = v14;
  v12[8] = v15;
  v16 = a3[7];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = *(_QWORD *)((char *)a2 + v16 + 24);
  if (v19)
  {
    v20 = *((_QWORD *)v18 + 4);
    *((_QWORD *)v17 + 3) = v19;
    *((_QWORD *)v17 + 4) = v20;
    (**(void (***)(void))(v19 - 8))();
  }
  else
  {
    v21 = *((_OWORD *)v18 + 1);
    *(_OWORD *)v17 = *(_OWORD *)v18;
    *((_OWORD *)v17 + 1) = v21;
    *((_QWORD *)v17 + 4) = *((_QWORD *)v18 + 4);
  }
  v22 = a3[8];
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = sub_23E8A1D6C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
  v26 = a3[9];
  v27 = (_QWORD *)((char *)a1 + v26);
  v28 = (_QWORD *)((char *)a2 + v26);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_23E88AC10(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;

  if (a1 != a2)
  {
    sub_23E75496C((uint64_t)a1, &qword_256D95080);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D95080);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23E8A380C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v7 = a3[5];
    v8 = (_QWORD *)((char *)a1 + v7);
    v9 = (_QWORD *)((char *)a2 + v7);
    sub_23E75496C((uint64_t)a1 + v7, &qword_25433ADF0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADF0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_23E8A29A8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v11 = a3[6];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = *(_QWORD *)v13;
  v15 = v13[8];
  sub_23E7571D4(*(_QWORD *)v13, v15);
  v16 = *(_QWORD *)v12;
  v17 = v12[8];
  *(_QWORD *)v12 = v14;
  v12[8] = v15;
  sub_23E754C98(v16, v17);
  v18 = a3[7];
  v19 = (uint64_t)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = *(_QWORD *)((char *)a2 + v18 + 24);
  if (!*(_QWORD *)((char *)a1 + v18 + 24))
  {
    if (v21)
    {
      *(_QWORD *)(v19 + 24) = v21;
      *(_QWORD *)(v19 + 32) = *((_QWORD *)v20 + 4);
      (**(void (***)(uint64_t, char *))(v21 - 8))(v19, v20);
      goto LABEL_16;
    }
LABEL_15:
    v22 = *(_OWORD *)v20;
    v23 = *((_OWORD *)v20 + 1);
    *(_QWORD *)(v19 + 32) = *((_QWORD *)v20 + 4);
    *(_OWORD *)v19 = v22;
    *(_OWORD *)(v19 + 16) = v23;
    goto LABEL_16;
  }
  if (!v21)
  {
    __swift_destroy_boxed_opaque_existential_1(v19);
    goto LABEL_15;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v19, (uint64_t *)v20);
LABEL_16:
  v24 = a3[8];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = sub_23E8A1D6C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 24))(v25, v26, v27);
  v28 = a3[9];
  v29 = (_QWORD *)((char *)a1 + v28);
  v30 = (_QWORD *)((char *)a2 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_23E88AE54(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D95080);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_23E8A380C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADF0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_23E8A29A8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = a3[6];
  v14 = a3[7];
  v15 = &a1[v13];
  v16 = &a2[v13];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  v17 = &a1[v14];
  v18 = &a2[v14];
  v19 = *((_OWORD *)v18 + 1);
  *(_OWORD *)v17 = *(_OWORD *)v18;
  *((_OWORD *)v17 + 1) = v19;
  *((_QWORD *)v17 + 4) = *((_QWORD *)v18 + 4);
  v20 = a3[8];
  v21 = &a1[v20];
  v22 = &a2[v20];
  v23 = sub_23E8A1D6C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v21, v22, v23);
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  return a1;
}

char *sub_23E88AFDC(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char *v20;
  __int128 v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;

  if (a1 != a2)
  {
    sub_23E75496C((uint64_t)a1, &qword_256D95080);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D95080);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_23E8A380C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_23E75496C((uint64_t)&a1[v8], &qword_25433ADF0);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADF0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_23E8A29A8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *(_QWORD *)v15;
  LOBYTE(v15) = v15[8];
  v17 = *(_QWORD *)v14;
  v18 = v14[8];
  *(_QWORD *)v14 = v16;
  v14[8] = (char)v15;
  sub_23E754C98(v17, v18);
  v19 = a3[7];
  v20 = &a1[v19];
  if (*(_QWORD *)&a1[v19 + 24])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&a1[v19]);
  v21 = *(_OWORD *)&a2[v19 + 16];
  *(_OWORD *)v20 = *(_OWORD *)&a2[v19];
  *((_OWORD *)v20 + 1) = v21;
  *((_QWORD *)v20 + 4) = *(_QWORD *)&a2[v19 + 32];
  v22 = a3[8];
  v23 = &a1[v22];
  v24 = &a2[v22];
  v25 = sub_23E8A1D6C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 40))(v23, v24, v25);
  v26 = a3[9];
  v27 = &a1[v26];
  v28 = &a2[v26];
  v30 = *(_QWORD *)v28;
  v29 = *((_QWORD *)v28 + 1);
  *(_QWORD *)v27 = v30;
  *((_QWORD *)v27 + 1) = v29;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23E88B1BC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E88B1C8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_256D985D8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D93748);
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v11 = sub_23E8A1D6C();
    v10 = *(_QWORD *)(v11 - 8);
    v12 = a3[8];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  v13 = *(_QWORD *)(a1 + a3[7] + 24);
  if (v13 >= 0xFFFFFFFF)
    LODWORD(v13) = -1;
  v14 = v13 - 1;
  if (v14 < 0)
    v14 = -1;
  return (v14 + 1);
}

uint64_t sub_23E88B2AC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E88B2B8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v8 = __swift_instantiateConcreteTypeFromMangledName(qword_256D985D8);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_256D93748);
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 2147483646)
      {
        *(_QWORD *)(a1 + a4[7] + 24) = a2;
        return result;
      }
      v10 = sub_23E8A1D6C();
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[8];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for GridForecastWidgetView.UsageAdviceView(uint64_t a1)
{
  return sub_23E754D2C(a1, (uint64_t *)&unk_256D98638);
}

void sub_23E88B3A0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23E76641C(319, qword_256D98648, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    sub_23E76641C(319, (unint64_t *)&qword_25433ADF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
    if (v1 <= 0x3F)
    {
      sub_23E8A1D6C();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t sub_23E88B48C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23E88B49C()
{
  return sub_23E8A2A2C();
}

uint64_t sub_23E88B4BC()
{
  return sub_23E8A2A2C();
}

uint64_t sub_23E88B4DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_23E8A32F0();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_23E8A2A38();
}

unint64_t sub_23E88B55C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25433AF10;
  if (!qword_25433AF10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25433AF18);
    v2 = sub_23E753F50(&qword_25433B210, &qword_25433B218, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x242655328](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25433AF10);
  }
  return result;
}

unint64_t sub_23E88B5E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D986B0;
  if (!qword_256D986B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25433AFD8);
    v2[0] = sub_23E88B55C();
    v2[1] = sub_23E7518F4((unint64_t *)&qword_25433B220, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x242655328](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D986B0);
  }
  return result;
}

unint64_t sub_23E88B664()
{
  unint64_t result;

  result = qword_256D986B8;
  if (!qword_256D986B8)
  {
    result = MEMORY[0x242655328](MEMORY[0x24BDF3E58], MEMORY[0x24BDF3E48]);
    atomic_store(result, (unint64_t *)&qword_256D986B8);
  }
  return result;
}

unint64_t sub_23E88B6A8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D986C8;
  if (!qword_256D986C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D986C0);
    v2[0] = MEMORY[0x24BDF3E20];
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x242655328](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D986C8);
  }
  return result;
}

uint64_t sub_23E88B70C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t result;

  if ((a8 & 1) != 0)
    return swift_retain();
  return result;
}

uint64_t sub_23E88B718(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_23E769FBC(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_23E88B748(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_23E754444(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23E88B778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t result;

  if ((a8 & 1) != 0)
    return swift_release();
  return result;
}

unint64_t sub_23E88B784()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_256D986E0;
  if (!qword_256D986E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D977F0);
    v2[2] = MEMORY[0x24BDF1FA8];
    v2[3] = MEMORY[0x24BDF1F80];
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_23E7518F4((unint64_t *)&qword_25433B220, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x242655328](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D986E0);
  }
  return result;
}

uint64_t sub_23E88B834()
{
  return sub_23E8A2B94();
}

uint64_t sub_23E88B864()
{
  return sub_23E753F50(&qword_256D98708, &qword_256D98710, MEMORY[0x24BDF4700]);
}

uint64_t UtilityRateInfoSummaryView.init(snapshotManager:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v4 = sub_23E8A2F48();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for UtilityRateInfoSummaryView();
  v13 = 0x3FF0000000000000;
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF1878], v4);
  sub_23E77BB20();
  sub_23E8A281C();
  *a2 = a1;
  v9 = (uint64_t)a2 + *(int *)(v8 + 20);
  swift_getKeyPath();
  v13 = a1;
  sub_23E780AB8();
  swift_retain();
  sub_23E8A1EF8();
  swift_release();
  v10 = a1 + OBJC_IVAR____TtC12HomeEnergyUI30UtilityRateInfoSnapshotManager__infoSnapshot;
  swift_beginAccess();
  sub_23E754CE8(v10, v9, (uint64_t (*)(_QWORD))type metadata accessor for UtilityRateInfoSnapshot);
  return swift_release();
}

uint64_t type metadata accessor for UtilityRateInfoSummaryView()
{
  uint64_t result;

  result = qword_256D987A8;
  if (!qword_256D987A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t UtilityRateInfoSummaryView.body.getter@<X0>(uint64_t a1@<X8>)
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
  int v24;
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
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
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
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  double *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t (**v90)();
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  double *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  double v114[6];

  v2 = v1;
  v112 = a1;
  v3 = type metadata accessor for UtilityRateInfoSummaryView();
  v4 = *(_QWORD *)(v3 - 8);
  v98 = v3;
  v5 = *(_QWORD *)(v4 + 64);
  v110 = v4;
  v111 = v5;
  MEMORY[0x24BDAC7A8](v3);
  v109 = (uint64_t)&v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23E8A3458();
  v107 = *(_QWORD *)(v7 - 8);
  v108 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v106 = (char *)&v92 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = sub_23E8A2A14();
  MEMORY[0x24BDAC7A8](v104);
  v102 = (double *)((char *)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADA8);
  MEMORY[0x24BDAC7A8](v105);
  v103 = (uint64_t)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D957E0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v92 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D957E8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98718);
  MEMORY[0x24BDAC7A8](v94);
  v18 = (char *)&v92 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98720);
  MEMORY[0x24BDAC7A8](v95);
  v20 = (char *)&v92 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98728);
  MEMORY[0x24BDAC7A8](v97);
  v96 = (uint64_t)&v92 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98730);
  MEMORY[0x24BDAC7A8](v100);
  v113 = (uint64_t)&v92 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98738);
  MEMORY[0x24BDAC7A8](v101);
  v99 = (char *)&v92 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  UtilityRateInfoSnapshot.statusAndAdviceTextPlusSymbol.getter((uint64_t)v114);
  v24 = LOBYTE(v114[0]);
  v26 = *(_QWORD *)&v114[1];
  v25 = *(_QWORD *)&v114[2];
  v28 = *(_QWORD *)&v114[3];
  v27 = *(_QWORD *)&v114[4];
  *(_QWORD *)v13 = sub_23E8A2CC0();
  *((_QWORD *)v13 + 1) = 0;
  v13[16] = 0;
  v29 = (uint64_t)&v13[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D98740) + 44)];
  v93 = v2;
  sub_23E88C1A0(v26, v25, v28, v27, v2, v24, v29);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v30 = sub_23E8A3464();
  sub_23E7CBC38(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v16, 0.0, 1, INFINITY, 0, v30, v31);
  sub_23E75496C((uint64_t)v13, &qword_256D957E0);
  LOBYTE(v13) = sub_23E8A2E1C();
  sub_23E8A2750();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  sub_23E753FC4((uint64_t)v16, (uint64_t)v18, &qword_256D957E8);
  v40 = &v18[*(int *)(v94 + 36)];
  *v40 = (char)v13;
  *((_QWORD *)v40 + 1) = v33;
  *((_QWORD *)v40 + 2) = v35;
  *((_QWORD *)v40 + 3) = v37;
  *((_QWORD *)v40 + 4) = v39;
  v40[40] = 0;
  sub_23E75496C((uint64_t)v16, &qword_256D957E8);
  LOBYTE(v13) = sub_23E8A2E28();
  sub_23E8A2750();
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  sub_23E753FC4((uint64_t)v18, (uint64_t)v20, &qword_256D98718);
  v49 = &v20[*(int *)(v95 + 36)];
  *v49 = (char)v13;
  *((_QWORD *)v49 + 1) = v42;
  *((_QWORD *)v49 + 2) = v44;
  *((_QWORD *)v49 + 3) = v46;
  *((_QWORD *)v49 + 4) = v48;
  v49[40] = 0;
  sub_23E75496C((uint64_t)v18, &qword_256D98718);
  LOBYTE(v13) = sub_23E8A2E34();
  sub_23E8A2750();
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;
  v58 = v96;
  sub_23E753FC4((uint64_t)v20, v96, &qword_256D98720);
  v59 = v58 + *(int *)(v97 + 36);
  *(_BYTE *)v59 = (_BYTE)v13;
  *(_QWORD *)(v59 + 8) = v51;
  *(_QWORD *)(v59 + 16) = v53;
  *(_QWORD *)(v59 + 24) = v55;
  *(_QWORD *)(v59 + 32) = v57;
  *(_BYTE *)(v59 + 40) = 0;
  sub_23E75496C((uint64_t)v20, &qword_256D98720);
  LOBYTE(v13) = sub_23E8A2E4C();
  sub_23E8A2750();
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v67 = v66;
  v68 = v113;
  sub_23E753FC4(v58, v113, &qword_256D98728);
  v69 = v68 + *(int *)(v100 + 36);
  *(_BYTE *)v69 = (_BYTE)v13;
  *(_QWORD *)(v69 + 8) = v61;
  *(_QWORD *)(v69 + 16) = v63;
  *(_QWORD *)(v69 + 24) = v65;
  *(_QWORD *)(v69 + 32) = v67;
  *(_BYTE *)(v69 + 40) = 0;
  sub_23E75496C(v58, &qword_256D98728);
  v70 = sub_23E8A3470();
  v72 = v71;
  v73 = (uint64_t)v99;
  v74 = (uint64_t)&v99[*(int *)(v101 + 36)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433AE20);
  sub_23E8A2828();
  v75 = v114[0] * 16.0;
  v76 = v102;
  v77 = (char *)v102 + *(int *)(v104 + 20);
  v78 = *MEMORY[0x24BDEEB68];
  v79 = sub_23E8A2C84();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v79 - 8) + 104))(v77, v78, v79);
  *v76 = v75;
  v76[1] = v75;
  v80 = v106;
  sub_23E8A344C();
  v81 = v103;
  sub_23E754CE8((uint64_t)v76, v103, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  v82 = v105;
  v84 = v107;
  v83 = v108;
  (*(void (**)(uint64_t, char *, uint64_t))(v107 + 16))(v81 + *(int *)(v105 + 52), v80, v108);
  *(_WORD *)(v81 + *(int *)(v82 + 56)) = 256;
  (*(void (**)(char *, uint64_t))(v84 + 8))(v80, v83);
  sub_23E802F84((uint64_t)v76);
  sub_23E757570(v81, v74, &qword_25433ADA8);
  v85 = (uint64_t *)(v74 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25433B118) + 36));
  *v85 = v70;
  v85[1] = v72;
  sub_23E757570(v113, v73, &qword_256D98730);
  v86 = v109;
  sub_23E754CE8(v93, v109, (uint64_t (*)(_QWORD))type metadata accessor for UtilityRateInfoSummaryView);
  v87 = (*(unsigned __int8 *)(v110 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v110 + 80);
  v88 = swift_allocObject();
  sub_23E88CC24(v86, v88 + v87);
  v89 = v112;
  sub_23E753FC4(v73, v112, &qword_256D98738);
  v90 = (uint64_t (**)())(v89 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D98748) + 36));
  *v90 = sub_23E88CC68;
  v90[1] = (uint64_t (*)())v88;
  v90[2] = 0;
  v90[3] = 0;
  return sub_23E75496C(v73, &qword_256D98738);
}

uint64_t sub_23E88C1A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v47[4];
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v50 = a6;
  v49 = a5;
  v51 = a1;
  v52 = a3;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AF20);
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v47[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98840);
  MEMORY[0x24BDAC7A8](v13);
  v15 = &v47[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98848);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = &v47[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = &v47[-v21];
  MEMORY[0x24BDAC7A8](v20);
  v24 = &v47[-v23];
  v53 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v48 = sub_23E8A2E28();
  if (qword_256D93478 != -1)
    swift_once();
  sub_23E8A2750();
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  sub_23E88C4B0((uint64_t)v12);
  if ((v50 & 1) != 0)
    v33 = 1.0;
  else
    v33 = 0.0;
  sub_23E753FC4((uint64_t)v12, (uint64_t)v15, &qword_25433AF20);
  *(double *)&v15[*(int *)(v13 + 36)] = v33;
  sub_23E75496C((uint64_t)v12, &qword_25433AF20);
  v34 = sub_23E8A2E34();
  sub_23E8A2750();
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  sub_23E753FC4((uint64_t)v15, (uint64_t)v22, &qword_256D98840);
  v43 = &v22[*(int *)(v16 + 36)];
  *v43 = v34;
  *((_QWORD *)v43 + 1) = v36;
  *((_QWORD *)v43 + 2) = v38;
  *((_QWORD *)v43 + 3) = v40;
  *((_QWORD *)v43 + 4) = v42;
  v43[40] = 0;
  sub_23E75496C((uint64_t)v15, &qword_256D98840);
  sub_23E757570((uint64_t)v22, (uint64_t)v24, &qword_256D98848);
  sub_23E753FC4((uint64_t)v24, (uint64_t)v19, &qword_256D98848);
  v44 = v53;
  *(_QWORD *)a7 = v51;
  *(_QWORD *)(a7 + 8) = v44;
  *(_QWORD *)(a7 + 16) = v52;
  *(_QWORD *)(a7 + 24) = a4;
  *(_BYTE *)(a7 + 32) = v48;
  *(_QWORD *)(a7 + 40) = v26;
  *(_QWORD *)(a7 + 48) = v28;
  *(_QWORD *)(a7 + 56) = v30;
  *(_QWORD *)(a7 + 64) = v32;
  *(_BYTE *)(a7 + 72) = 0;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98850);
  sub_23E753FC4((uint64_t)v19, a7 + *(int *)(v45 + 48), &qword_256D98848);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23E75496C((uint64_t)v24, &qword_256D98848);
  sub_23E75496C((uint64_t)v19, &qword_256D98848);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23E88C4B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v38 = a1;
  v1 = sub_23E8A2F48();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E8A2C60();
  MEMORY[0x24BDAC7A8](v5);
  type metadata accessor for UtilityRateInfoSummaryView();
  UtilityRateInfoSnapshot.attributedPeak.getter(&v44);
  if (v47 != 1)
    sub_23E76ECCC(v44, v45, v46, v47);
  UtilityRateInfoSnapshot.attributedPeak.getter(&v44);
  v6 = v47;
  if (v47 != 1)
  {
    v36 = v2;
    v37 = v1;
    v7 = v45;
    v8 = v46;
    v9 = v44;
    v39 = v44;
    v40 = v45 & 1;
    v41 = v46;
    v42 = v47;
    v43 = v48;
    PeakPeriodAttributes.variableValue.getter();
    v10 = v8;
    v2 = v36;
    v1 = v37;
    sub_23E76ECCC(v9, v7, v10, v6);
  }
  v37 = sub_23E8A32C0();
  sub_23E8A2C54();
  sub_23E8A2C48();
  sub_23E8A2C30();
  sub_23E8A2C48();
  sub_23E8A2C78();
  v11 = sub_23E8A2FFC();
  v13 = v12;
  v15 = v14 & 1;
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDF1848], v1);
  sub_23E8A2EC4();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v16 = sub_23E8A2FC0();
  v18 = v17;
  v20 = v19;
  swift_release();
  v21 = v20 & 1;
  sub_23E754444(v11, v13, v15);
  swift_bridgeObjectRelease();
  sub_23E8A2EA0();
  v22 = sub_23E8A2F78();
  v24 = v23;
  v26 = v25 & 1;
  sub_23E754444(v16, v18, v21);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D93F88);
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_23E8A4C10;
  *(_QWORD *)(v27 + 32) = sub_23E8A326C();
  *(_QWORD *)(v27 + 40) = sub_23E8A3260();
  v44 = v27;
  sub_23E8A3A10();
  v44 = MEMORY[0x242654410](v44);
  v28 = sub_23E8A2F90();
  v30 = v29;
  v32 = v31;
  v34 = v33 & 1;
  sub_23E754444(v22, v24, v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v44 = v28;
  v45 = v30;
  LOBYTE(v46) = v34;
  v47 = v32;
  sub_23E8A3164();
  swift_release();
  sub_23E754444(v28, v30, v34);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23E88C8E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  BOOL v43;
  _BYTE v44[288];
  uint64_t v45[36];

  v1 = a1 + *(int *)(type metadata accessor for UtilityRateInfoSummaryView() + 20);
  LODWORD(v2) = *(unsigned __int8 *)(v1 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 40));
  v3 = (_DWORD)v2 == 7;
  if ((_DWORD)v2 == 7)
    v2 = 0;
  else
    v2 = v2;
  v6 = 0;
  v7 = 513;
  v8 = 0;
  v9 = 1;
  v10 = 0;
  v11 = 1;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 1;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 1;
  v20 = 0;
  v21 = 1;
  v22 = 2;
  v23 = 0;
  v24 = 1;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 1;
  v29 = 0;
  v30 = 1;
  v31 = 0;
  v32 = 1;
  v33 = 0;
  v34 = 1;
  v35 = 2;
  v36 = 0;
  v37 = 1;
  v38 = 0;
  v39 = 1;
  v40 = 0;
  v41 = 1;
  v42 = v2;
  v43 = v3;
  nullsub_1(&v6);
  type metadata accessor for HEUIFAnalyticsEvent();
  v4 = swift_allocObject();
  sub_23E76A314((uint64_t)v44);
  sub_23E757570((uint64_t)v44, v4 + 24, &qword_256D93CE0);
  *(_BYTE *)(v4 + 16) = 33;
  sub_23E757570(v4 + 24, (uint64_t)v45, &qword_256D93CE0);
  sub_23E757570((uint64_t)&v6, v4 + 24, &qword_256D93CE0);
  sub_23E76A34C(v45);
  _s12HomeEnergyUI14HEUIFAnalyticsC9sendEvent5eventyAA0dF0C_tFZ_0(v4);
  return swift_release();
}

uint64_t sub_23E88CAC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = type metadata accessor for UtilityRateInfoSummaryView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  v4 = v3 + *(int *)(v1 + 20);
  swift_bridgeObjectRelease();
  v5 = (int *)type metadata accessor for UtilityRateInfoSnapshot();
  v6 = v4 + v5[5];
  v7 = sub_23E8A1D6C();
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(v4 + v5[6], v7);
  v8(v4 + v5[7], v7);
  swift_bridgeObjectRelease();
  v9 = v4 + v5[9];
  v10 = sub_23E8A1EE0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = v3 + *(int *)(v1 + 24);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AE20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  return swift_deallocObject();
}

uint64_t sub_23E88CC24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UtilityRateInfoSummaryView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E88CC68()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for UtilityRateInfoSummaryView() - 8) + 80);
  return sub_23E88C8E0(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_23E88CC94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23E88CCA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
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
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  char v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
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
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  void (*v107)(char *, uint64_t);
  unsigned int v108;
  void (*v109)(char *);
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char v115;
  uint64_t v116;
  __int16 v117;

  v99 = a4;
  v98 = a3;
  v96 = a2;
  v95 = a1;
  v103 = a5;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98830);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v104 = (uint64_t)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v102 = (char *)&v95 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D93F80);
  MEMORY[0x24BDAC7A8](v9);
  v97 = (char *)&v95 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23E8A2F00();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v95 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AF20);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v101 = (uint64_t)&v95 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v100 = (uint64_t)&v95 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v112 = (uint64_t)&v95 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v111 = (uint64_t)&v95 - v22;
  if (qword_25433BA28 != -1)
    swift_once();
  v113 = sub_23E8A1874();
  v114 = v23;
  v110 = sub_23E7573F0();
  v24 = sub_23E8A3014();
  v26 = v25;
  v28 = v27 & 1;
  sub_23E8A2E64();
  v108 = *MEMORY[0x24BDF17C8];
  v109 = *(void (**)(char *))(v12 + 104);
  v109(v14);
  sub_23E8A2F18();
  v105 = v11;
  swift_release();
  v107 = *(void (**)(char *, uint64_t))(v12 + 8);
  v107(v14, v11);
  v29 = sub_23E8A2FC0();
  v31 = v30;
  v33 = v32;
  swift_release();
  v34 = v33 & 1;
  sub_23E754444(v24, v26, v28);
  swift_bridgeObjectRelease();
  v106 = (id)objc_opt_self();
  MEMORY[0x2426541DC](objc_msgSend(v106, sel_labelColor));
  v35 = sub_23E8A2F84();
  v37 = v36;
  v39 = v38;
  v41 = v40;
  swift_release();
  sub_23E754444(v29, v31, v34);
  swift_bridgeObjectRelease();
  v113 = v35;
  v114 = v37;
  v115 = v39 & 1;
  v116 = v41;
  sub_23E8A3164();
  sub_23E754444(v35, v37, v39 & 1);
  swift_bridgeObjectRelease();
  v113 = v95;
  v114 = v96;
  swift_bridgeObjectRetain();
  v42 = sub_23E8A3014();
  v44 = v43;
  LOBYTE(v41) = v45 & 1;
  sub_23E8A2EE8();
  v46 = v105;
  ((void (*)(char *, _QWORD, uint64_t))v109)(v14, v108, v105);
  sub_23E8A2F18();
  swift_release();
  v107(v14, v46);
  v47 = sub_23E8A2FC0();
  v49 = v48;
  v51 = v50;
  swift_release();
  LOBYTE(v37) = v51 & 1;
  sub_23E754444(v42, v44, v41);
  swift_bridgeObjectRelease();
  v52 = *MEMORY[0x24BDF1668];
  v53 = sub_23E8A2E94();
  v54 = *(_QWORD *)(v53 - 8);
  v55 = (uint64_t)v97;
  (*(void (**)(char *, uint64_t, uint64_t))(v54 + 104))(v97, v52, v53);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v54 + 56))(v55, 0, 1, v53);
  v56 = sub_23E8A2F6C();
  v58 = v57;
  LOBYTE(v41) = v59 & 1;
  sub_23E754444(v47, v49, v37);
  swift_bridgeObjectRelease();
  sub_23E75496C(v55, &qword_256D93F80);
  sub_23E8A2EB8();
  v60 = sub_23E8A2F78();
  v62 = v61;
  LOBYTE(v49) = v63 & 1;
  sub_23E754444(v56, v58, v41);
  swift_bridgeObjectRelease();
  MEMORY[0x2426541DC](objc_msgSend(v106, sel_labelColor));
  v64 = sub_23E8A2F84();
  v66 = v65;
  LOBYTE(v41) = v67;
  v69 = v68;
  swift_release();
  sub_23E754444(v60, v62, v49);
  swift_bridgeObjectRelease();
  v113 = v64;
  v114 = v66;
  v115 = v41 & 1;
  v116 = v69;
  sub_23E8A3164();
  sub_23E754444(v64, v66, v41 & 1);
  swift_bridgeObjectRelease();
  v113 = v98;
  v114 = v99;
  swift_bridgeObjectRetain();
  v70 = sub_23E8A3014();
  v72 = v71;
  LOBYTE(v41) = v73 & 1;
  sub_23E8A2E64();
  v74 = v105;
  ((void (*)(char *, _QWORD, uint64_t))v109)(v14, v108, v105);
  sub_23E8A2F18();
  swift_release();
  v107(v14, v74);
  v75 = sub_23E8A2FC0();
  v77 = v76;
  v79 = v78;
  swift_release();
  LOBYTE(v62) = v79 & 1;
  sub_23E754444(v70, v72, v41);
  swift_bridgeObjectRelease();
  MEMORY[0x2426541DC](objc_msgSend(v106, sel_secondaryLabelColor));
  v80 = sub_23E8A2F84();
  v82 = v81;
  LOBYTE(v41) = v83;
  v85 = v84;
  swift_release();
  LOBYTE(v41) = v41 & 1;
  sub_23E754444(v75, v77, v62);
  swift_bridgeObjectRelease();
  v113 = v80;
  v114 = v82;
  v115 = v41;
  v116 = v85;
  v117 = 256;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D95470);
  sub_23E7C613C();
  v86 = (uint64_t)v102;
  sub_23E8A3164();
  sub_23E754444(v80, v82, v41);
  swift_bridgeObjectRelease();
  v87 = v111;
  v88 = v100;
  sub_23E753FC4(v111, v100, &qword_25433AF20);
  v89 = v112;
  v90 = v101;
  sub_23E753FC4(v112, v101, &qword_25433AF20);
  v91 = v104;
  sub_23E753FC4(v86, v104, &qword_256D98830);
  v92 = v103;
  sub_23E753FC4(v88, v103, &qword_25433AF20);
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98838);
  sub_23E753FC4(v90, v92 + *(int *)(v93 + 48), &qword_25433AF20);
  sub_23E753FC4(v91, v92 + *(int *)(v93 + 64), &qword_256D98830);
  sub_23E75496C(v86, &qword_256D98830);
  sub_23E75496C(v89, &qword_25433AF20);
  sub_23E75496C(v87, &qword_25433AF20);
  sub_23E75496C(v91, &qword_256D98830);
  sub_23E75496C(v90, &qword_25433AF20);
  return sub_23E75496C(v88, &qword_25433AF20);
}

uint64_t sub_23E88D5D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  *(_QWORD *)a1 = sub_23E8A2CC0();
  *(_QWORD *)(a1 + 8) = 0x3FF0000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98828);
  return sub_23E88CCA4(v3, v4, v6, v5, a1 + *(int *)(v7 + 44));
}

uint64_t *initializeBufferWithCopyOfBuffer for UtilityRateInfoSummaryView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = *(uint64_t *)((char *)a2 + v6 + 8);
    *(_QWORD *)v7 = *(uint64_t *)((char *)a2 + v6);
    *((_QWORD *)v7 + 1) = v9;
    v10 = (int *)type metadata accessor for UtilityRateInfoSnapshot();
    v11 = v10[5];
    v12 = &v7[v11];
    v13 = &v8[v11];
    v14 = sub_23E8A1D6C();
    v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_retain();
    swift_bridgeObjectRetain();
    v15(v12, v13, v14);
    v15(&v7[v10[6]], &v8[v10[6]], v14);
    v15(&v7[v10[7]], &v8[v10[7]], v14);
    v16 = v10[8];
    v17 = &v7[v16];
    v18 = &v8[v16];
    v19 = *((_QWORD *)v18 + 1);
    *v17 = *(_QWORD *)v18;
    v17[1] = v19;
    v20 = v10[9];
    v21 = &v7[v20];
    v22 = &v8[v20];
    v23 = sub_23E8A1EE0();
    v24 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16);
    swift_bridgeObjectRetain();
    v24(v21, v22, v23);
    v7[v10[10]] = v8[v10[10]];
    v7[v10[11]] = v8[v10[11]];
    *(_QWORD *)&v7[v10[12]] = *(_QWORD *)&v8[v10[12]];
    *(_QWORD *)&v7[v10[13]] = *(_QWORD *)&v8[v10[13]];
    *(_QWORD *)&v7[v10[14]] = *(_QWORD *)&v8[v10[14]];
    v25 = *(int *)(a3 + 24);
    v26 = (char *)v5 + v25;
    v27 = (char *)a2 + v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AE20);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
  }
  return v5;
}

uint64_t destroy for UtilityRateInfoSummaryView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  v5 = (int *)type metadata accessor for UtilityRateInfoSnapshot();
  v6 = v4 + v5[5];
  v7 = sub_23E8A1D6C();
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(v4 + v5[6], v7);
  v8(v4 + v5[7], v7);
  swift_bridgeObjectRelease();
  v9 = v4 + v5[9];
  v10 = sub_23E8A1EE0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = a1 + *(int *)(a2 + 24);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AE20);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
}

_QWORD *initializeWithCopy for UtilityRateInfoSummaryView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = *(_QWORD *)((char *)a2 + v4 + 8);
  *(_QWORD *)v5 = *(_QWORD *)((char *)a2 + v4);
  *((_QWORD *)v5 + 1) = v7;
  v8 = (int *)type metadata accessor for UtilityRateInfoSnapshot();
  v9 = v8[5];
  v10 = &v5[v9];
  v11 = &v6[v9];
  v12 = sub_23E8A1D6C();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  v13(&v5[v8[6]], &v6[v8[6]], v12);
  v13(&v5[v8[7]], &v6[v8[7]], v12);
  v14 = v8[8];
  v15 = &v5[v14];
  v16 = &v6[v14];
  v17 = *((_QWORD *)v16 + 1);
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *((_QWORD *)v15 + 1) = v17;
  v18 = v8[9];
  v19 = &v5[v18];
  v20 = &v6[v18];
  v21 = sub_23E8A1EE0();
  v22 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16);
  swift_bridgeObjectRetain();
  v22(v19, v20, v21);
  v5[v8[10]] = v6[v8[10]];
  v5[v8[11]] = v6[v8[11]];
  *(_QWORD *)&v5[v8[12]] = *(_QWORD *)&v6[v8[12]];
  *(_QWORD *)&v5[v8[13]] = *(_QWORD *)&v6[v8[13]];
  *(_QWORD *)&v5[v8[14]] = *(_QWORD *)&v6[v8[14]];
  v23 = *(int *)(a3 + 24);
  v24 = (char *)a1 + v23;
  v25 = (char *)a2 + v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AE20);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
  return a1;
}

_QWORD *assignWithCopy for UtilityRateInfoSummaryView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_QWORD *)v7 = *(_QWORD *)((char *)a2 + v6);
  *((_QWORD *)v7 + 1) = *(_QWORD *)((char *)a2 + v6 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = (int *)type metadata accessor for UtilityRateInfoSnapshot();
  v10 = v9[5];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_23E8A1D6C();
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24);
  v14(v11, v12, v13);
  v14(&v7[v9[6]], &v8[v9[6]], v13);
  v14(&v7[v9[7]], &v8[v9[7]], v13);
  v15 = v9[8];
  v16 = &v7[v15];
  v17 = &v8[v15];
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = v9[9];
  v19 = &v7[v18];
  v20 = &v8[v18];
  v21 = sub_23E8A1EE0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 24))(v19, v20, v21);
  v7[v9[10]] = v8[v9[10]];
  v7[v9[11]] = v8[v9[11]];
  *(_QWORD *)&v7[v9[12]] = *(_QWORD *)&v8[v9[12]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v9[13]] = *(_QWORD *)&v8[v9[13]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v9[14]] = *(_QWORD *)&v8[v9[14]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v22 = *(int *)(a3 + 24);
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AE20);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 24))(v23, v24, v25);
  return a1;
}

_QWORD *initializeWithTake for UtilityRateInfoSummaryView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_OWORD *)((char *)a1 + v6) = *(_OWORD *)((char *)a2 + v6);
  v9 = (int *)type metadata accessor for UtilityRateInfoSnapshot();
  v10 = v9[5];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_23E8A1D6C();
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32);
  v14(v11, v12, v13);
  v14(&v7[v9[6]], &v8[v9[6]], v13);
  v14(&v7[v9[7]], &v8[v9[7]], v13);
  *(_OWORD *)&v7[v9[8]] = *(_OWORD *)&v8[v9[8]];
  v15 = v9[9];
  v16 = &v7[v15];
  v17 = &v8[v15];
  v18 = sub_23E8A1EE0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
  v7[v9[10]] = v8[v9[10]];
  v7[v9[11]] = v8[v9[11]];
  *(_QWORD *)&v7[v9[12]] = *(_QWORD *)&v8[v9[12]];
  *(_QWORD *)&v7[v9[13]] = *(_QWORD *)&v8[v9[13]];
  *(_QWORD *)&v7[v9[14]] = *(_QWORD *)&v8[v9[14]];
  v19 = *(int *)(a3 + 24);
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AE20);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
  return a1;
}

_QWORD *assignWithTake for UtilityRateInfoSummaryView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;

  *a1 = *a2;
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = *(_QWORD *)((char *)a2 + v6 + 8);
  *(_QWORD *)v7 = *(_QWORD *)((char *)a2 + v6);
  *((_QWORD *)v7 + 1) = v9;
  swift_bridgeObjectRelease();
  v10 = (int *)type metadata accessor for UtilityRateInfoSnapshot();
  v11 = v10[5];
  v12 = &v7[v11];
  v13 = &v8[v11];
  v14 = sub_23E8A1D6C();
  v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 40);
  v15(v12, v13, v14);
  v15(&v7[v10[6]], &v8[v10[6]], v14);
  v15(&v7[v10[7]], &v8[v10[7]], v14);
  v16 = v10[8];
  v17 = &v7[v16];
  v18 = &v8[v16];
  v20 = *(_QWORD *)v18;
  v19 = *((_QWORD *)v18 + 1);
  *(_QWORD *)v17 = v20;
  *((_QWORD *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  v21 = v10[9];
  v22 = &v7[v21];
  v23 = &v8[v21];
  v24 = sub_23E8A1EE0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  v7[v10[10]] = v8[v10[10]];
  v7[v10[11]] = v8[v10[11]];
  *(_QWORD *)&v7[v10[12]] = *(_QWORD *)&v8[v10[12]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v10[13]] = *(_QWORD *)&v8[v10[13]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v10[14]] = *(_QWORD *)&v8[v10[14]];
  swift_bridgeObjectRelease();
  v25 = *(int *)(a3 + 24);
  v26 = (char *)a1 + v25;
  v27 = (char *)a2 + v25;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AE20);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 40))(v26, v27, v28);
  return a1;
}

uint64_t getEnumTagSinglePayload for UtilityRateInfoSummaryView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E88DFE8(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for UtilityRateInfoSnapshot();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AE20);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for UtilityRateInfoSummaryView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_23E88E098(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v8 = type metadata accessor for UtilityRateInfoSnapshot();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AE20);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

void sub_23E88E138()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for UtilityRateInfoSnapshot();
  if (v0 <= 0x3F)
  {
    sub_23E77BAC8();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_23E88E1CC()
{
  return sub_23E76A440(&qword_256D987E8, &qword_256D98748, (uint64_t (*)(void))sub_23E88E200, MEMORY[0x24BDF0910]);
}

unint64_t sub_23E88E200()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D987F0;
  if (!qword_256D987F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D98738);
    v2[0] = sub_23E76A440(&qword_256D987F8, &qword_256D98730, sub_23E88E2A4, MEMORY[0x24BDECC60]);
    v2[1] = sub_23E753F50(&qword_25433B110, &qword_25433B118, MEMORY[0x24BDEF370]);
    result = MEMORY[0x242655328](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D987F0);
  }
  return result;
}

uint64_t sub_23E88E2A4()
{
  return sub_23E76A440(&qword_256D98800, &qword_256D98728, sub_23E88E2C8, MEMORY[0x24BDECC60]);
}

uint64_t sub_23E88E2C8()
{
  return sub_23E76A440(&qword_256D98808, &qword_256D98720, sub_23E88E2EC, MEMORY[0x24BDECC60]);
}

uint64_t sub_23E88E2EC()
{
  return sub_23E76A440(&qword_256D98810, &qword_256D98718, (uint64_t (*)(void))sub_23E88E310, MEMORY[0x24BDECC60]);
}

unint64_t sub_23E88E310()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D98818;
  if (!qword_256D98818)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D957E8);
    v2[0] = sub_23E753F50(&qword_256D98820, &qword_256D957E0, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x242655328](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D98818);
  }
  return result;
}

ValueMetadata *type metadata accessor for UtilityRateInfoSummaryView.RateSummaryView()
{
  return &type metadata for UtilityRateInfoSummaryView.RateSummaryView;
}

uint64_t sub_23E88E3A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23E88E3B4()
{
  return sub_23E753F50(&qword_256D98858, &qword_256D98860, MEMORY[0x24BDF4700]);
}

uint64_t sub_23E88E3E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;

  v38 = a1;
  v39 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433B1D8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (uint64_t *)((char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433B108);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433B010);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char **)((char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433B090);
  MEMORY[0x24BDAC7A8](v34);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433B238);
  v36 = *(_QWORD *)(v15 - 8);
  v37 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v32 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AF28);
  MEMORY[0x24BDAC7A8](v35);
  v33 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23E8A2E88();
  KeyPath = swift_getKeyPath();
  swift_retain();
  sub_23E8A2CD8();
  v20 = sub_23E8A2CE4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v9, 0, 1, v20);
  v21 = swift_getKeyPath();
  sub_23E753FC4((uint64_t)v9, (uint64_t)v6 + *(int *)(v4 + 28), &qword_25433B108);
  *v6 = v21;
  sub_23E753FC4((uint64_t)v6, (uint64_t)v12 + *(int *)(v10 + 36), &qword_25433B1D8);
  *v12 = a2;
  v12[1] = KeyPath;
  v12[2] = v18;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23E75496C((uint64_t)v6, &qword_25433B1D8);
  sub_23E75496C((uint64_t)v9, &qword_25433B108);
  swift_release();
  swift_release();
  swift_release();
  if (qword_25433B248 != -1)
    swift_once();
  v22 = qword_25433D788;
  v23 = qword_25433B268;
  swift_retain();
  if (v23 != -1)
    swift_once();
  v24 = qword_25433D7A8;
  sub_23E753FC4((uint64_t)v12, (uint64_t)v14, &qword_25433B010);
  v25 = v34;
  v26 = (uint64_t *)&v14[*(int *)(v34 + 36)];
  *v26 = v22;
  v26[1] = v24;
  swift_retain();
  sub_23E75496C((uint64_t)v12, &qword_25433B010);
  v27 = sub_23E77D8B8();
  v28 = v32;
  sub_23E8A3110();
  sub_23E75496C((uint64_t)v14, &qword_25433B090);
  v40 = v25;
  v41 = v27;
  swift_getOpaqueTypeConformance2();
  v29 = (uint64_t)v33;
  v30 = v37;
  sub_23E8A314C();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v28, v30);
  sub_23E8A29D8();
  return sub_23E75496C(v29, &qword_25433AF28);
}

uint64_t sub_23E88E7D8()
{
  uint64_t result;

  result = sub_23E8A32E4();
  qword_256D9D978 = result;
  return result;
}

uint64_t sub_23E88E80C()
{
  uint64_t result;

  result = sub_23E8A32E4();
  qword_256D9D980 = result;
  return result;
}

uint64_t sub_23E88E840()
{
  uint64_t result;

  result = sub_23E8A32E4();
  qword_25433D7B0 = result;
  return result;
}

uint64_t sub_23E88E874()
{
  uint64_t result;

  result = sub_23E8A32E4();
  qword_256D9D988 = result;
  return result;
}

uint64_t RatePlanType.coreAnalyticsEnumKey.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t UtilityRateInfoSnapshot.currentDayPeaks.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
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
  unint64_t v36;
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
  char *v51;
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
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  _BOOL4 v73;
  uint8_t *v74;
  uint64_t v75;
  uint8_t *v76;
  int64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(char *, char *, uint64_t *);
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  void (*v95)(uint64_t);
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  void (*v102)(char *, char *, uint64_t);
  char *v103;
  uint64_t *v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t v108;
  char *v109;
  unint64_t v110;
  int64_t v111;
  uint64_t v112;
  uint64_t v113;
  char isUniquelyReferenced_nonNull_native;
  BOOL v115;
  uint64_t v116;
  char *v117;
  char *v118;
  uint64_t v119;
  void (*v120)(char *, uint64_t);
  unint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t *v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char v130;
  char *v131;
  char *v132;
  uint64_t v133;
  char v134;
  char *v135;
  uint64_t v136;
  char *v137;
  _QWORD *v138;
  uint64_t v139;
  unint64_t v140;
  unint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  unint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  unint64_t v155;
  unint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t *v162;
  uint64_t v163;
  unint64_t v164;
  unint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t *v170;
  char v171;
  unint64_t v172;
  unint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  unsigned int (*v177)(char *, uint64_t, uint64_t *);
  uint64_t *v178;
  uint64_t *v179;
  void (*v180)(char *, uint64_t, uint64_t *);
  char v181;
  uint64_t v182;
  unint64_t v183;
  unint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  int64_t v188;
  unint64_t v189;
  uint64_t v190;
  unint64_t v191;
  int64_t v192;
  unint64_t v193;
  int64_t v194;
  uint64_t v195;
  uint64_t v196;
  unsigned int (*v197)(char *, uint64_t, uint64_t *);
  uint64_t v198;
  int64_t v199;
  char *v200;
  uint64_t v201;
  uint64_t v202;
  unint64_t v203;
  unint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  unint64_t v213;
  uint64_t v214;
  uint64_t v215;
  char v216;
  _QWORD *v217;
  char v218;
  unint64_t v219;
  _QWORD *v220;
  uint64_t v221;
  NSObject *v222;
  os_log_type_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  unint64_t v227;
  unint64_t v228;
  uint64_t v229;
  uint64_t v230;
  unint64_t v231;
  unint64_t v232;
  uint64_t v233;
  uint64_t v235;
  unint64_t v236;
  uint64_t v237;
  int64_t v238;
  char *v239;
  char *v240;
  char *v241;
  uint64_t v242;
  char *v243;
  unint64_t v244;
  uint64_t v245;
  char *v246;
  char *v247;
  char *v248;
  char *v249;
  uint64_t v250;
  char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  char *v258;
  uint64_t v259;
  char *v260;
  char *v261;
  char *v262;
  __int128 v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  char *v267;
  uint64_t v268;
  uint64_t v269;
  char *v270;
  uint64_t v271;
  uint64_t v272;
  char *v273;
  uint64_t v274;
  unint64_t v275;
  uint64_t v276;
  int64_t v277;
  uint64_t *v278;
  uint64_t v279;
  char *v280;
  unint64_t v281;
  void (*v282)(char *, char *, uint64_t);
  char *v283;
  char *v284;
  uint64_t *v285;
  unsigned int (*v286)(char *, uint64_t, uint64_t *);
  __int128 v287;
  char *v288;
  void (*v289)(char *, char *, uint64_t);
  void (*v290)(_QWORD);
  uint64_t v291;
  uint64_t v292;
  _QWORD *v293;
  uint64_t v294;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D988E0);
  MEMORY[0x24BDAC7A8](v0);
  v240 = (char *)&v235 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v256 = sub_23E8A16B8();
  v259 = *(_QWORD *)(v256 - 8);
  v2 = MEMORY[0x24BDAC7A8](v256);
  v241 = (char *)&v235 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v260 = (char *)&v235 - v4;
  v5 = type metadata accessor for UtilityRateInfoSnapshot();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v289 = (void (*)(char *, char *, uint64_t))((char *)&v235 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = MEMORY[0x24BDAC7A8](v6);
  v242 = (uint64_t)&v235 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v245 = (uint64_t)&v235 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v253 = (uint64_t)&v235 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v255 = (uint64_t)&v235 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v269 = (uint64_t)&v235 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v272 = (uint64_t)&v235 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v262 = (char *)&v235 - v20;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433A8D8);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v244 = (unint64_t)&v235 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v252 = (uint64_t)&v235 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v254 = (uint64_t)&v235 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v268 = (uint64_t)&v235 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v271 = (uint64_t)&v235 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v247 = (char *)&v235 - v32;
  v33 = sub_23E8A1D6C();
  v274 = *(_QWORD *)(v33 - 8);
  v34 = MEMORY[0x24BDAC7A8](v33);
  v36 = (unint64_t)&v235 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = MEMORY[0x24BDAC7A8](v34);
  v251 = (char *)&v235 - v38;
  v39 = MEMORY[0x24BDAC7A8](v37);
  v261 = (char *)&v235 - v40;
  v41 = MEMORY[0x24BDAC7A8](v39);
  v267 = (char *)&v235 - v42;
  v43 = MEMORY[0x24BDAC7A8](v41);
  v285 = (uint64_t *)((char *)&v235 - v44);
  v45 = MEMORY[0x24BDAC7A8](v43);
  v246 = (char *)&v235 - v46;
  v47 = MEMORY[0x24BDAC7A8](v45);
  v273 = (char *)&v235 - v48;
  v49 = MEMORY[0x24BDAC7A8](v47);
  v51 = (char *)&v235 - v50;
  MEMORY[0x24BDAC7A8](v49);
  v248 = (char *)&v235 - v52;
  v53 = sub_23E8A21BC();
  v257 = *(_QWORD *)(v53 - 8);
  v54 = MEMORY[0x24BDAC7A8](v53);
  v243 = (char *)&v235 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = MEMORY[0x24BDAC7A8](v54);
  v270 = (char *)&v235 - v57;
  v58 = MEMORY[0x24BDAC7A8](v56);
  v258 = (char *)&v235 - v59;
  v60 = MEMORY[0x24BDAC7A8](v58);
  v284 = (char *)&v235 - v61;
  v62 = MEMORY[0x24BDAC7A8](v60);
  v64 = (char *)&v235 - v63;
  v65 = MEMORY[0x24BDAC7A8](v62);
  v67 = (uint64_t)&v235 - v66;
  MEMORY[0x24BDAC7A8](v65);
  v288 = (char *)&v235 - v68;
  if (qword_256D934B0 == -1)
    goto LABEL_2;
  while (1)
  {
    swift_once();
LABEL_2:
    v69 = sub_23E8A22C4();
    v70 = __swift_project_value_buffer(v69, (uint64_t)qword_256D96838);
    v71 = sub_23E8A22AC();
    v72 = sub_23E8A3B18();
    v73 = os_log_type_enabled(v71, v72);
    v281 = v5;
    v278 = (uint64_t *)v33;
    v280 = (char *)v36;
    v249 = v51;
    if (v73)
    {
      v74 = (uint8_t *)swift_slowAlloc();
      v75 = swift_slowAlloc();
      v290 = (void (*)(_QWORD))v75;
      *(_DWORD *)v74 = 136315138;
      v292 = sub_23E755DA4(0x44746E6572727563, 0xEF736B6165507961, (uint64_t *)&v290);
      sub_23E8A3BF0();
      _os_log_impl(&dword_23E74F000, v71, v72, "%s: converting UtilityPeakPeriods", v74, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2426553D0](v75, -1, -1);
      v76 = v74;
      v5 = v281;
      MEMORY[0x2426553D0](v76, -1, -1);
    }

    v294 = MEMORY[0x24BEE4B00];
    v51 = *(char **)((char *)v282 + *(int *)(v5 + 52));
    v77 = *((_QWORD *)v51 + 2);
    if (!v77)
      break;
    if (v77 == 1)
    {
      v78 = v288;
      (*(void (**)(char *, char *, uint64_t))(v257 + 16))(v288, &v51[(*(unsigned __int8 *)(v257 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v257 + 80)], v53);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D962A0);
      v79 = swift_allocObject();
      v287 = xmmword_23E8A4BE0;
      *(_OWORD *)(v79 + 16) = xmmword_23E8A4BE0;
      v289 = (void (*)(char *, char *, uint64_t))sub_23E8A2198();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D96298);
      v80 = swift_allocObject();
      *(_OWORD *)(v80 + 16) = v287;
      v81 = (uint64_t)v282;
      v82 = *(void (**)(char *, char *, uint64_t *))(v274 + 16);
      v83 = v278;
      v82(v248, (char *)v282 + *(int *)(v5 + 20), v278);
      v82(v249, (char *)(v81 + *(int *)(v5 + 28)), v83);
      sub_23E8A1688();
      v84 = UtilityRateInfoSnapshot.uniquePeakRanks.getter();
      *(_QWORD *)(v79 + 32) = v289;
      *(_QWORD *)(v79 + 40) = v80;
      *(_QWORD *)(v79 + 48) = v84;
      (*(void (**)(char *, uint64_t))(v257 + 8))(v78, v53);
      goto LABEL_114;
    }
    v238 = v77 - 1;
    v277 = v77;
    v235 = v70;
    v293 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v94 = v257;
    v275 = (*(unsigned __int8 *)(v94 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80);
    v95 = *(void (**)(uint64_t))(v257 + 16);
    v239 = &v51[v275];
    v95(v67);
    swift_bridgeObjectRetain();
    v96 = (uint64_t *)v94;
    v237 = sub_23E8A2198();
    v33 = *(_QWORD *)(v94 + 8);
    ((void (*)(uint64_t, uint64_t))v33)(v67, v53);
    v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D96298);
    v98 = *(unsigned __int8 *)(v259 + 80);
    v99 = (v98 + 32) & ~v98;
    v250 = *(_QWORD *)(v259 + 72);
    v266 = v97;
    v265 = v99 + v250;
    v264 = v98 | 7;
    v100 = swift_allocObject();
    v101 = v5;
    v5 = v100;
    v263 = xmmword_23E8A4BE0;
    *(_OWORD *)(v100 + 16) = xmmword_23E8A4BE0;
    v102 = v282;
    v103 = (char *)v282 + *(int *)(v101 + 24);
    v104 = v278;
    v279 = *(_QWORD *)(v274 + 16);
    ((void (*)(char *, char *, uint64_t *))v279)(v273, v103, v278);
    v283 = v51;
    if (*((_QWORD *)v51 + 2) < 2uLL)
      goto LABEL_122;
    v276 = v99;
    v236 = v5;
    *(_QWORD *)&v287 = v96[9];
    v289 = (void (*)(char *, char *, uint64_t))v95;
    ((void (*)(char *, char *, uint64_t))v95)(v64, &v239[v287], v53);
    v105 = sub_23E8A21B0();
    v107 = v106;
    v288 = (char *)v33;
    ((void (*)(char *, uint64_t))v33)(v64, v53);
    v51 = v247;
    UtilityRateInfoSnapshot.stringToDate(stringDate:)(v105, v107, (uint64_t)v247);
    v108 = v274;
    swift_bridgeObjectRelease();
    v109 = v262;
    sub_23E780B60((uint64_t)v102, (uint64_t)v262);
    v286 = *(unsigned int (**)(char *, uint64_t, uint64_t *))(v108 + 48);
    if (v286(v51, 1, v104) == 1)
    {
      ((void (*)(char *, char *, uint64_t *))v279)(v246, &v109[*(int *)(v281 + 20)], v104);
      sub_23E780BA4((uint64_t)v109);
      sub_23E75496C((uint64_t)v51, &qword_25433A8D8);
    }
    else
    {
      sub_23E780BA4((uint64_t)v109);
      (*(void (**)(char *, char *, uint64_t *))(v108 + 32))(v246, v51, v104);
    }
    v110 = v277;
    v111 = v238;
    v112 = v237;
    sub_23E8A1688();
    v113 = v294;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v290 = (void (*)(_QWORD))v113;
    v96 = (uint64_t *)&v290;
    sub_23E8966BC(v236, v112, isUniquelyReferenced_nonNull_native);
    v294 = (uint64_t)v290;
    swift_bridgeObjectRelease();
    v115 = v111 == 1;
    v33 = (uint64_t)v288;
    v102 = v289;
    v116 = v287;
    if (!v115)
    {
      v127 = *((_QWORD *)v283 + 2);
      if (v127 < 2 || v110 - 2 >= v127)
        goto LABEL_124;
      v273 = (char *)(2 * v287);
      v5 = 2;
      v51 = v239;
      do
      {
        v131 = &v51[v116];
        v132 = v284;
        v102(v284, &v51[v116], v53);
        v133 = sub_23E8A2198();
        ((void (*)(char *, uint64_t))v33)(v132, v53);
        if (*(_QWORD *)(v294 + 16) && (sub_23E89665C(v133), (v134 & 1) != 0))
        {
          v135 = v258;
          v102(v258, v131, v53);
          v136 = sub_23E8A2198();
          ((void (*)(char *, uint64_t))v33)(v135, v53);
          v96 = &v294;
          v137 = (char *)sub_23E895328(&v290, v136);
          if (*v138)
          {
            v67 = (uint64_t)v138;
            v262 = v137;
            v102(v64, v131, v53);
            v139 = sub_23E8A21B0();
            v141 = v140;
            ((void (*)(char *, uint64_t))v33)(v64, v53);
            v142 = v254;
            v143 = v139;
            v144 = (uint64_t)v282;
            UtilityRateInfoSnapshot.stringToDate(stringDate:)(v143, v141, v254);
            v36 = v142;
            swift_bridgeObjectRelease();
            v33 = v255;
            sub_23E780B60(v144, v255);
            v96 = v278;
            if (v286((char *)v36, 1, v278) == 1)
            {
              ((void (*)(char *, uint64_t, uint64_t *))v279)(v261, v33 + *(int *)(v281 + 20), v96);
              sub_23E780BA4(v33);
              sub_23E75496C(v36, &qword_25433A8D8);
            }
            else
            {
              sub_23E780BA4(v33);
              (*(void (**)(char *, unint64_t, uint64_t *))(v274 + 32))(v261, v36, v96);
            }
            if ((v5 & 0x8000000000000000) != 0)
              goto LABEL_119;
            if (v5 >= *((_QWORD *)v283 + 2))
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
              v33 = sub_23E8961FC(0, *(_QWORD *)(v33 + 16) + 1, 1, v33, &qword_256D96298, (uint64_t (*)(_QWORD))MEMORY[0x24BDCB878]);
              *v96 = v33;
LABEL_59:
              v182 = v276;
              v184 = *(_QWORD *)(v33 + 16);
              v183 = *(_QWORD *)(v33 + 24);
              v36 = v184 + 1;
              if (v184 >= v183 >> 1)
              {
                v33 = sub_23E8961FC(v183 > 1, v184 + 1, 1, v33, &qword_256D96298, (uint64_t (*)(_QWORD))MEMORY[0x24BDCB878]);
                *v96 = v33;
              }
              v96 = (uint64_t *)v282;
              *(_QWORD *)(v33 + 16) = v36;
              (*(void (**)(unint64_t, char *, uint64_t))(v259 + 32))(v33 + v182 + v184 * v250, v241, v256);
              ((void (*)(void (**)(_QWORD), _QWORD))v286)(&v290, 0);
              goto LABEL_63;
            }
            v102(v64, &v273[(_QWORD)v51], v53);
            v163 = sub_23E8A21B0();
            v165 = v164;
            ((void (*)(char *, uint64_t))v288)(v64, v53);
            v166 = v252;
            v167 = v163;
            v168 = (uint64_t)v282;
            UtilityRateInfoSnapshot.stringToDate(stringDate:)(v167, v165, v252);
            swift_bridgeObjectRelease();
            v169 = v253;
            sub_23E780B60(v168, v253);
            v170 = v278;
            if (v286((char *)v166, 1, v278) == 1)
            {
              ((void (*)(char *, uint64_t, uint64_t *))v279)(v251, v169 + *(int *)(v281 + 28), v170);
              sub_23E780BA4(v169);
              sub_23E75496C(v166, &qword_25433A8D8);
            }
            else
            {
              sub_23E780BA4(v169);
              (*(void (**)(char *, uint64_t, uint64_t *))(v274 + 32))(v251, v166, v170);
            }
            sub_23E8A1688();
            v96 = *(uint64_t **)v67;
            v171 = swift_isUniquelyReferenced_nonNull_native();
            *(_QWORD *)v67 = v96;
            v110 = v277;
            if ((v171 & 1) == 0)
            {
              v96 = (uint64_t *)sub_23E8961FC(0, v96[2] + 1, 1, (unint64_t)v96, &qword_256D96298, (uint64_t (*)(_QWORD))MEMORY[0x24BDCB878]);
              *(_QWORD *)v67 = v96;
            }
            v173 = v96[2];
            v172 = v96[3];
            if (v173 >= v172 >> 1)
            {
              v96 = (uint64_t *)sub_23E8961FC(v172 > 1, v173 + 1, 1, (unint64_t)v96, &qword_256D96298, (uint64_t (*)(_QWORD))MEMORY[0x24BDCB878]);
              *(_QWORD *)v67 = v96;
            }
            v116 = v287;
            v96[2] = v173 + 1;
            (*(void (**)(char *, char *, uint64_t))(v259 + 32))((char *)v96 + v276 + v173 * v250, v260, v256);
            ((void (*)(void (**)(_QWORD), _QWORD))v262)(&v290, 0);
            v102 = v289;
          }
          else
          {
            ((void (*)(void (**)(_QWORD), _QWORD))v137)(&v290, 0);
            v116 = v287;
          }
        }
        else
        {
          v145 = v270;
          v102(v270, v131, v53);
          v67 = sub_23E8A2198();
          ((void (*)(char *, uint64_t))v33)(v145, v53);
          v146 = swift_allocObject();
          *(_OWORD *)(v146 + 16) = v263;
          v102(v64, v131, v53);
          v147 = sub_23E8A21B0();
          v149 = v148;
          ((void (*)(char *, uint64_t))v33)(v64, v53);
          v150 = v271;
          v151 = v147;
          v152 = (uint64_t)v282;
          UtilityRateInfoSnapshot.stringToDate(stringDate:)(v151, v149, v271);
          v36 = v150;
          swift_bridgeObjectRelease();
          v33 = v272;
          sub_23E780B60(v152, v272);
          v153 = v278;
          if (v286((char *)v36, 1, v278) == 1)
          {
            ((void (*)(uint64_t *, uint64_t, uint64_t *))v279)(v285, v33 + *(int *)(v281 + 20), v153);
            sub_23E780BA4(v33);
            sub_23E75496C(v36, &qword_25433A8D8);
          }
          else
          {
            sub_23E780BA4(v33);
            (*(void (**)(uint64_t *, unint64_t, uint64_t *))(v274 + 32))(v285, v36, v153);
          }
          if ((v5 & 0x8000000000000000) != 0)
            goto LABEL_116;
          if (v5 >= *((_QWORD *)v283 + 2))
            goto LABEL_117;
          v102(v64, &v273[(_QWORD)v51], v53);
          v154 = sub_23E8A21B0();
          v156 = v155;
          ((void (*)(char *, uint64_t))v288)(v64, v53);
          v157 = v268;
          v158 = v154;
          v159 = (uint64_t)v282;
          UtilityRateInfoSnapshot.stringToDate(stringDate:)(v158, v156, v268);
          v160 = v157;
          swift_bridgeObjectRelease();
          v161 = v269;
          sub_23E780B60(v159, v269);
          v162 = v278;
          if (v286((char *)v160, 1, v278) == 1)
          {
            v128 = v161 + *(int *)(v281 + 28);
            v262 = (char *)v5;
            ((void (*)(char *, uint64_t, uint64_t *))v279)(v267, v128, v162);
            v5 = (unint64_t)v262;
            sub_23E780BA4(v161);
            sub_23E75496C(v160, &qword_25433A8D8);
          }
          else
          {
            sub_23E780BA4(v161);
            (*(void (**)(char *, uint64_t, uint64_t *))(v274 + 32))(v267, v160, v162);
          }
          sub_23E8A1688();
          v129 = v294;
          v130 = swift_isUniquelyReferenced_nonNull_native();
          v290 = (void (*)(_QWORD))v129;
          v96 = (uint64_t *)&v290;
          sub_23E8966BC(v146, v67, v130);
          v294 = (uint64_t)v290;
          swift_bridgeObjectRelease();
          v116 = v287;
          v110 = v277;
        }
        ++v5;
        v51 += v116;
        v33 = (uint64_t)v288;
      }
      while (v110 != v5);
    }
    if (v110 > *((_QWORD *)v283 + 2))
      goto LABEL_123;
    v117 = &v239[v116 * v238];
    v118 = v243;
    v102(v243, v117, v53);
    v119 = sub_23E8A21B0();
    v120 = (void (*)(char *, uint64_t))v33;
    v122 = v121;
    v120(v118, v53);
    v36 = v244;
    v123 = v119;
    v124 = (uint64_t)v282;
    UtilityRateInfoSnapshot.stringToDate(stringDate:)(v123, v122, v244);
    swift_bridgeObjectRelease();
    v125 = v245;
    sub_23E780B60(v124, v245);
    v126 = v278;
    if (v286((char *)v36, 1, v278) == 1)
    {
      v5 = v281;
      v51 = v280;
      ((void (*)(char *, uint64_t, uint64_t *))v279)(v280, v125 + *(int *)(v281 + 28), v126);
      sub_23E780BA4(v125);
      sub_23E75496C(v36, &qword_25433A8D8);
    }
    else
    {
      sub_23E780BA4(v125);
      v51 = v280;
      (*(void (**)(char *, unint64_t, uint64_t *))(v274 + 32))(v280, v36, v126);
      v5 = v281;
    }
    v96 = (uint64_t *)v282;
    v33 = (uint64_t)v282 + *(int *)(v5 + 28);
    if ((sub_23E8A1CC4() & 1) != 0)
    {
      v36 = (unint64_t)v283;
      if (v110 > *((_QWORD *)v283 + 2))
        goto LABEL_125;
      v174 = (uint64_t)v240;
      v102(v240, v117, v53);
      v175 = v257;
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v257 + 56))(v174, 0, 1, v53);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v175 + 48))(v174, 1, v53) == 1)
      {
        sub_23E75496C(v174, &qword_256D988E0);
        v176 = -1;
      }
      else
      {
        v176 = sub_23E8A2198();
        ((void (*)(uint64_t, uint64_t))v288)(v174, v53);
      }
      v177 = (unsigned int (*)(char *, uint64_t, uint64_t *))sub_23E895328(&v290, v176);
      if (*v178)
      {
        v286 = v177;
        v179 = v278;
        v285 = v178;
        v180 = (void (*)(char *, uint64_t, uint64_t *))v279;
        ((void (*)(char *, char *, uint64_t *))v279)(v248, v51, v278);
        v180(v249, v33, v179);
        v96 = v285;
        sub_23E8A1688();
        v33 = *v96;
        v181 = swift_isUniquelyReferenced_nonNull_native();
        *v96 = v33;
        if ((v181 & 1) == 0)
          goto LABEL_126;
        goto LABEL_59;
      }
      ((void (*)(void (**)(_QWORD), _QWORD))v177)(&v290, 0);
      v96 = (uint64_t *)v282;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
LABEL_63:
    v185 = *(_QWORD *)(v294 + 64);
    v276 = v294 + 64;
    v186 = 1 << *(_BYTE *)(v294 + 32);
    if (v186 < 64)
      v187 = ~(-1 << v186);
    else
      v187 = -1;
    v67 = v187 & v185;
    v277 = (unint64_t)(v186 + 63) >> 6;
    v279 = v294;
    swift_bridgeObjectRetain();
    v188 = 0;
    if (v67)
    {
LABEL_67:
      v189 = __clz(__rbit64(v67));
      v190 = (v67 - 1) & v67;
      v191 = v189 | (v188 << 6);
      goto LABEL_82;
    }
    while (1)
    {
      v192 = v188 + 1;
      if (__OFADD__(v188, 1))
        break;
      if (v192 >= v277)
        goto LABEL_110;
      v193 = *(_QWORD *)(v276 + 8 * v192);
      ++v188;
      if (!v193)
      {
        v188 = v192 + 1;
        if (v192 + 1 >= v277)
          goto LABEL_110;
        v193 = *(_QWORD *)(v276 + 8 * v188);
        if (!v193)
        {
          v188 = v192 + 2;
          if (v192 + 2 >= v277)
            goto LABEL_110;
          v193 = *(_QWORD *)(v276 + 8 * v188);
          if (!v193)
          {
            v194 = v192 + 3;
            if (v194 >= v277)
            {
LABEL_110:
              swift_release();
              v221 = v242;
              sub_23E780B60((uint64_t)v96, v242);
              v222 = sub_23E8A22AC();
              v223 = sub_23E8A3B18();
              if (os_log_type_enabled(v222, v223))
              {
                v224 = swift_slowAlloc();
                v289 = (void (*)(char *, char *, uint64_t))swift_slowAlloc();
                v290 = (void (*)(_QWORD))v289;
                *(_DWORD *)v224 = 136315650;
                v292 = sub_23E755DA4(0x44746E6572727563, 0xEF736B6165507961, (uint64_t *)&v290);
                sub_23E8A3BF0();
                *(_WORD *)(v224 + 12) = 2080;
                swift_beginAccess();
                v225 = swift_bridgeObjectRetain();
                v226 = MEMORY[0x2426549F8](v225, &type metadata for PeakPeriodListing);
                v228 = v227;
                swift_bridgeObjectRelease();
                v291 = sub_23E755DA4(v226, v228, (uint64_t *)&v290);
                sub_23E8A3BF0();
                swift_bridgeObjectRelease();
                *(_WORD *)(v224 + 22) = 2080;
                v229 = swift_bridgeObjectRetain();
                v230 = MEMORY[0x2426549F8](v229, v53);
                v232 = v231;
                swift_bridgeObjectRelease();
                v291 = sub_23E755DA4(v230, v232, (uint64_t *)&v290);
                sub_23E8A3BF0();
                swift_bridgeObjectRelease();
                sub_23E780BA4(v221);
                _os_log_impl(&dword_23E74F000, v222, v223, "%s: made %s from %s", (uint8_t *)v224, 0x20u);
                v233 = (uint64_t)v289;
                swift_arrayDestroy();
                MEMORY[0x2426553D0](v233, -1, -1);
                MEMORY[0x2426553D0](v224, -1, -1);

                (*(void (**)(char *, uint64_t *))(v274 + 8))(v280, v278);
              }
              else
              {

                sub_23E780BA4(v221);
                (*(void (**)(char *, uint64_t *))(v274 + 8))(v51, v278);
              }
              swift_beginAccess();
              v79 = (uint64_t)v293;
              goto LABEL_114;
            }
            v193 = *(_QWORD *)(v276 + 8 * v194);
            if (!v193)
            {
              while (1)
              {
                v188 = v194 + 1;
                if (__OFADD__(v194, 1))
                  goto LABEL_118;
                if (v188 >= v277)
                  goto LABEL_110;
                v193 = *(_QWORD *)(v276 + 8 * v188);
                ++v194;
                if (v193)
                  goto LABEL_81;
              }
            }
            v188 = v194;
          }
        }
      }
LABEL_81:
      v190 = (v193 - 1) & v193;
      v191 = __clz(__rbit64(v193)) + (v188 << 6);
LABEL_82:
      v284 = (char *)v190;
      v285 = (uint64_t *)v188;
      v195 = 8 * v191;
      v196 = *(_QWORD *)(v279 + 56);
      v283 = *(char **)(*(_QWORD *)(v279 + 48) + v195);
      v197 = *(unsigned int (**)(char *, uint64_t, uint64_t *))(v196 + v195);
      v198 = *(uint64_t *)((char *)v96 + *(int *)(v5 + 48));
      v199 = *(_QWORD *)(v198 + 16);
      v286 = v197;
      if (v199)
      {
        v290 = (void (*)(_QWORD))MEMORY[0x24BEE4AF8];
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        sub_23E898940(0, v199, 0);
        v200 = (char *)(v198 + v275);
        do
        {
          v102(v64, v200, v53);
          v201 = sub_23E8A2198();
          ((void (*)(char *, uint64_t))v288)(v64, v53);
          v202 = (uint64_t)v290;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_23E898940(0, *(_QWORD *)(v202 + 16) + 1, 1);
            v202 = (uint64_t)v290;
          }
          v204 = *(_QWORD *)(v202 + 16);
          v203 = *(_QWORD *)(v202 + 24);
          if (v204 >= v203 >> 1)
          {
            sub_23E898940(v203 > 1, v204 + 1, 1);
            v202 = (uint64_t)v290;
          }
          *(_QWORD *)(v202 + 16) = v204 + 1;
          *(_QWORD *)(v202 + 8 * v204 + 32) = v201;
          v200 += v287;
          --v199;
          v102 = v289;
        }
        while (v199);
        swift_bridgeObjectRelease();
        v51 = v280;
        v197 = v286;
      }
      else
      {
        swift_bridgeObjectRetain_n();
        v202 = MEMORY[0x24BEE4AF8];
      }
      v205 = sub_23E8A3AAC();
      v206 = v205;
      v207 = *(_QWORD *)(v202 + 16);
      if (v207)
      {
        v208 = 0;
        v209 = v205 + 56;
        while (1)
        {
          v210 = *(_QWORD *)(v202 + 32 + 8 * v208++);
          v211 = sub_23E8A3E18();
          v212 = -1 << *(_BYTE *)(v206 + 32);
          v213 = v211 & ~v212;
          if (((*(_QWORD *)(v209 + ((v213 >> 3) & 0xFFFFFFFFFFFFF8)) >> v213) & 1) == 0)
            goto LABEL_100;
          v214 = *(_QWORD *)(v206 + 48);
          if (*(_QWORD *)(v214 + 8 * v213) == v210)
          {
LABEL_93:
            if (v208 == v207)
              goto LABEL_102;
          }
          else
          {
            v215 = ~v212;
            while (1)
            {
              v213 = (v213 + 1) & v215;
              if (((*(_QWORD *)(v209 + ((v213 >> 3) & 0xFFFFFFFFFFFFF8)) >> v213) & 1) == 0)
                break;
              if (*(_QWORD *)(v214 + 8 * v213) == v210)
                goto LABEL_93;
            }
LABEL_100:
            v216 = swift_isUniquelyReferenced_nonNull_native();
            v290 = (void (*)(_QWORD))v206;
            sub_23E899364(v210, v213, v216);
            v206 = (uint64_t)v290;
            swift_bridgeObjectRelease();
            if (v208 == v207)
            {
LABEL_102:
              swift_bridgeObjectRelease();
              v51 = v280;
              v102 = v289;
              v197 = v286;
              goto LABEL_104;
            }
            v209 = v206 + 56;
          }
        }
      }
      swift_bridgeObjectRelease();
LABEL_104:
      v33 = *(_QWORD *)(v206 + 16);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v217 = v293;
      v218 = swift_isUniquelyReferenced_nonNull_native();
      v5 = v281;
      if ((v218 & 1) == 0)
        v217 = sub_23E8960C4(0, v217[2] + 1, 1, v217);
      v36 = v217[2];
      v219 = v217[3];
      if (v36 >= v219 >> 1)
        v217 = sub_23E8960C4((_QWORD *)(v219 > 1), v36 + 1, 1, v217);
      v217[2] = v36 + 1;
      v220 = &v217[3 * v36];
      v96 = (uint64_t *)v282;
      v220[4] = v283;
      v220[5] = v197;
      v220[6] = v33;
      v293 = v217;
      v67 = (uint64_t)v284;
      v188 = (int64_t)v285;
      if (v284)
        goto LABEL_67;
    }
    __break(1u);
LABEL_116:
    __break(1u);
LABEL_117:
    __break(1u);
LABEL_118:
    __break(1u);
LABEL_119:
    __break(1u);
  }
  v85 = (uint64_t)v289;
  sub_23E780B60((uint64_t)v282, (uint64_t)v289);
  v86 = sub_23E8A22AC();
  v87 = sub_23E8A3B18();
  if (os_log_type_enabled(v86, v87))
  {
    v88 = swift_slowAlloc();
    v89 = swift_slowAlloc();
    v290 = (void (*)(_QWORD))v89;
    *(_DWORD *)v88 = 136315394;
    v292 = sub_23E755DA4(0x44746E6572727563, 0xEF736B6165507961, (uint64_t *)&v290);
    sub_23E8A3BF0();
    *(_WORD *)(v88 + 12) = 2080;
    v90 = swift_bridgeObjectRetain();
    v91 = MEMORY[0x2426549F8](v90, v53);
    v93 = v92;
    swift_bridgeObjectRelease();
    v292 = sub_23E755DA4(v91, v93, (uint64_t *)&v290);
    sub_23E8A3BF0();
    swift_bridgeObjectRelease();
    sub_23E780BA4(v85);
    _os_log_impl(&dword_23E74F000, v86, v87, "%s: made no objects from %s", (uint8_t *)v88, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2426553D0](v89, -1, -1);
    MEMORY[0x2426553D0](v88, -1, -1);
  }
  else
  {
    sub_23E780BA4(v85);
  }

  v79 = MEMORY[0x24BEE4AF8];
LABEL_114:
  swift_bridgeObjectRelease();
  return v79;
}

void UtilityRateInfoSnapshot.ratePlanTitle.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;

  v1 = sub_23E8A1DE4();
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_23E8A38FC();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_23E8A38E4();
  MEMORY[0x24BDAC7A8](v3);
  v4 = (char *)sub_23E8907A4
     + 4
     * byte_23E8AB3D0[*(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 40))];
  __asm { BR              X9 }
}

uint64_t sub_23E8907A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = sub_23E8A3D88();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
    return 0;
  v4 = (uint64_t *)(v0 + *(int *)(v1 + 32));
  v5 = *v4;
  v6 = v4[1];
  v7 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0)
    v7 = v5 & 0xFFFFFFFFFFFFLL;
  if (!v7)
  {
    *(_BYTE *)(v2 - 80) = 5;
    sub_23E891644();
    return v8;
  }
  *(_QWORD *)(v2 - 80) = v5;
  *(_QWORD *)(v2 - 72) = v6;
  *(_QWORD *)(v2 - 96) = 10272;
  *(_QWORD *)(v2 - 88) = 0xE200000000000000;
  sub_23E7573F0();
  if ((sub_23E8A3C14() & 1) == 0)
  {
    sub_23E8A38D8();
    sub_23E8A38CC();
    sub_23E8A38C0();
    sub_23E8A38CC();
    *(_BYTE *)(v2 - 80) = 5;
    sub_23E891644();
    sub_23E8A38C0();
    swift_bridgeObjectRelease();
    sub_23E8A38CC();
    sub_23E8A38F0();
    if (qword_25433BA28 != -1)
      swift_once();
    v9 = (id)qword_25433D7C0;
    sub_23E8A1DC0();
    return sub_23E8A395C();
  }
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_23E8909D4()
{
  _BYTE *v0;
  uint64_t result;

  switch(*v0)
  {
    case 1:
      if (qword_25433BA28 != -1)
        goto LABEL_14;
      goto LABEL_12;
    case 2:
      if (qword_25433BA28 == -1)
        goto LABEL_12;
      goto LABEL_14;
    case 3:
      if (qword_25433BA28 == -1)
        goto LABEL_12;
      goto LABEL_14;
    case 4:
      if (qword_25433BA28 == -1)
        goto LABEL_12;
      goto LABEL_14;
    case 5:
      if (qword_25433BA28 == -1)
        goto LABEL_12;
LABEL_14:
      swift_once();
LABEL_12:
      result = sub_23E8A1874();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t sub_23E890C78()
{
  _BYTE *v0;
  uint64_t result;

  switch(*v0)
  {
    case 1:
      if (qword_25433BA28 != -1)
        goto LABEL_14;
      goto LABEL_12;
    case 2:
      if (qword_25433BA28 == -1)
        goto LABEL_12;
      goto LABEL_14;
    case 3:
      if (qword_25433BA28 == -1)
        goto LABEL_12;
      goto LABEL_14;
    case 4:
      if (qword_25433BA28 == -1)
        goto LABEL_12;
      goto LABEL_14;
    case 5:
      if (qword_25433BA28 == -1)
        goto LABEL_12;
LABEL_14:
      swift_once();
LABEL_12:
      result = sub_23E8A1874();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t PeakPeriodListing.peakName.getter()
{
  return sub_23E891604(PeakPeriodAttributes.peakName.getter);
}

uint64_t UtilityRateInfoSnapshot.dateToFormattedString(date:)(uint64_t a1)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
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
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  int v38;
  void (*v39)(char *, char *, uint64_t);
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  void (*v44)(char *, uint64_t);
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v71 = a1;
  v1 = sub_23E8A1B74();
  v54 = *(_QWORD *)(v1 - 8);
  v55 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v53 = (char *)&v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_23E8A1AE4();
  v67 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v65 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = sub_23E8A1AFC();
  v68 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v66 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_23E8A1DCC();
  v72 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v60 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23E8A19AC();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_23E8A1EE0();
  v58 = *(_QWORD *)(v7 - 8);
  v59 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23E8A1EA4();
  MEMORY[0x24BDAC7A8](v10);
  v11 = sub_23E8A1DE4();
  v56 = *(_QWORD *)(v11 - 8);
  v57 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433B648);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433B650);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_23E8A1BEC();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v52 = (char *)&v52 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v62 = (char *)&v52 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v63 = (char *)&v52 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v52 - v29;
  v31 = sub_23E8A1A30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v20, 1, 1, v31);
  v32 = sub_23E8A1A00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v17, 1, 1, v32);
  sub_23E8A1DB4();
  sub_23E8A1E20();
  sub_23E8A1EC8();
  sub_23E8A19A0();
  v33 = v60;
  sub_23E8A1A48();
  v34 = type metadata accessor for UtilityRateInfoSnapshot();
  (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v9, v64 + *(int *)(v34 + 36), v59);
  v35 = v61;
  sub_23E8A1BD4();
  sub_23E8A1DC0();
  sub_23E8A1DD8();
  v36 = v14;
  v37 = v22;
  (*(void (**)(char *, uint64_t))(v56 + 8))(v36, v57);
  v38 = (*(uint64_t (**)(char *, uint64_t))(v72 + 88))(v33, v35);
  v39 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  if (v38 == *MEMORY[0x24BDCEE78] || v38 == *MEMORY[0x24BDCEE70])
  {
    v47 = v62;
    v39(v62, v30, v21);
    v48 = v65;
    sub_23E8A1AC0();
    v49 = v66;
    sub_23E8A1AA8();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v48, v69);
    v50 = v63;
    sub_23E8A1A54();
    (*(void (**)(char *, uint64_t))(v68 + 8))(v49, v70);
    v44 = *(void (**)(char *, uint64_t))(v22 + 8);
    v44(v47, v21);
    v44(v30, v21);
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v30, v50, v21);
  }
  else
  {
    v40 = v52;
    v39(v52, v30, v21);
    v41 = v65;
    sub_23E8A1AD8();
    v42 = v66;
    sub_23E8A1AA8();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v41, v69);
    v43 = v62;
    sub_23E8A1A54();
    (*(void (**)(char *, uint64_t))(v68 + 8))(v42, v70);
    v44 = *(void (**)(char *, uint64_t))(v22 + 8);
    v44(v40, v21);
    v45 = v53;
    sub_23E8A1B08();
    v46 = v63;
    sub_23E8A1BBC();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v45, v55);
    v44(v43, v21);
    v44(v30, v21);
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v30, v46, v21);
    (*(void (**)(char *, uint64_t))(v72 + 8))(v33, v35);
  }
  sub_23E7518F4(&qword_25433A8C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE2A0], MEMORY[0x24BDCE290]);
  sub_23E8A1D54();
  v44(v30, v21);
  return v73;
}

unint64_t PeakPeriodListing.peakPeriodSymbol.getter()
{
  uint64_t v0;

  if (*(uint64_t *)(v0 + 16) >= 3)
    return 0xD000000000000034;
  else
    return 0xD000000000000029;
}

double PeakPeriodListing.peakVariableValue.getter()
{
  return PeakPeriodAttributes.variableValue.getter();
}

uint64_t PeakPeriodListing.peakDescription.getter()
{
  return sub_23E891604(PeakPeriodAttributes.description.getter);
}

uint64_t sub_23E891604(uint64_t (*a1)(void))
{
  return a1();
}

void sub_23E891644()
{
  __asm { BR              X10 }
}

uint64_t sub_23E89166C()
{
  if (qword_25433BA28 != -1)
    swift_once();
  return sub_23E8A1874();
}

unint64_t UtilityRateInfoSnapshot.peakSymbol.getter()
{
  uint64_t v1;
  uint64_t v2[3];
  uint64_t v3;
  uint64_t v4;

  UtilityRateInfoSnapshot.attributedPeak.getter(v2);
  if (v3 == 1)
    return 0;
  v1 = v4;
  sub_23E76ECCC(v2[0], v2[1], v2[2], v3);
  if (v1 >= 3)
    return 0xD000000000000034;
  else
    return 0xD000000000000029;
}

double UtilityRateInfoSnapshot.peakVariableValue.getter()
{
  uint64_t v0;
  double v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6[3];
  uint64_t v7;

  UtilityRateInfoSnapshot.attributedPeak.getter(v6);
  v0 = v7;
  v1 = 0.0;
  if (v7 != 1)
  {
    v3 = v6[1];
    v2 = v6[2];
    v4 = v6[0];
    v1 = PeakPeriodAttributes.variableValue.getter();
    sub_23E76ECCC(v4, v3, v2, v0);
  }
  return v1;
}

uint64_t sub_23E891B04(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xE900000000000064;
  v3 = 0x6572616853707061;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0xD000000000000010;
    else
      v5 = 1801678701;
    if (v4 == 1)
      v6 = 0x800000023E8AC250;
    else
      v6 = 0xE400000000000000;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0x6572616853707061;
  v6 = 0xE900000000000064;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v3 = 0xD000000000000010;
    else
      v3 = 1801678701;
    if (v7 == 1)
      v2 = 0x800000023E8AC250;
    else
      v2 = 0xE400000000000000;
  }
LABEL_15:
  if (v5 == v3 && v6 == v2)
    v8 = 1;
  else
    v8 = sub_23E8A3D88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23E891C0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = HEUIFAnalyticsEventType.rawValue.getter();
  v2 = v1;
  if (v0 == HEUIFAnalyticsEventType.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23E8A3D88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void sub_23E891CA0(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23E891CE8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23E891D84 + 4 * byte_23E8AB3EF[a2]))(0x656D6974656D6F53);
}

uint64_t sub_23E891D84(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x656D6974656D6F53 && v1 == 0xE900000000000073)
    v2 = 1;
  else
    v2 = sub_23E8A3D88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_23E891E70(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_23E891EB8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23E891F38 + 4 * byte_23E8AB3FC[a2]))(48);
}

uint64_t sub_23E891F38(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 48 && v1 == 0xE100000000000000)
    v2 = 1;
  else
    v2 = sub_23E8A3D88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_23E892000(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23E892048(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23E8920C8 + 4 * byte_23E8AB409[a2]))(1684099177);
}

uint64_t sub_23E8920C8(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 1684099177 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_23E8A3D88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_23E892198(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23E8921E8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23E892280 + 4 * byte_23E8AB416[a2]))(7696244);
}

uint64_t sub_23E892280(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 7696244 && v1 == 0xE300000000000000)
    v2 = 1;
  else
    v2 = sub_23E8A3D88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_23E892370(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23E8923A8()
{
  sub_23E8A398C();
  return swift_bridgeObjectRelease();
}

void sub_23E892428(uint64_t a1, char a2)
{
  sub_23E8A3E24();
  __asm { BR              X10 }
}

uint64_t sub_23E892474()
{
  sub_23E8A398C();
  swift_bridgeObjectRelease();
  return sub_23E8A3E3C();
}

void sub_23E892518(uint64_t a1, char a2)
{
  sub_23E8A3E24();
  __asm { BR              X10 }
}

uint64_t sub_23E892560()
{
  sub_23E8A398C();
  swift_bridgeObjectRelease();
  return sub_23E8A3E3C();
}

void sub_23E8925EC(uint64_t a1, char a2)
{
  sub_23E8A3E24();
  __asm { BR              X10 }
}

uint64_t sub_23E892630()
{
  sub_23E8A398C();
  swift_bridgeObjectRelease();
  return sub_23E8A3E3C();
}

void sub_23E8926C4(uint64_t a1, char a2)
{
  sub_23E8A3E24();
  __asm { BR              X10 }
}

uint64_t sub_23E89270C()
{
  sub_23E8A398C();
  swift_bridgeObjectRelease();
  return sub_23E8A3E3C();
}

uint64_t sub_23E8927B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X6>, char *a8@<X7>, _QWORD *a9@<X8>)
{
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
  char v23;
  char v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;

  v32 = a5;
  v33 = a6;
  v34 = a4;
  v30 = a2;
  v31 = a3;
  v29 = a9;
  v12 = sub_23E8A1D6C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D94958);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_23E8A1EE0();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v28 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = *a7;
  v24 = *a8;
  sub_23E8A1EBC();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v22, v18, v19);
    if (a1)
      v26 = a1;
    else
      v26 = MEMORY[0x24BEE4AF8];
    v27 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v34, v12);
    v36 = v24;
    v35 = v23;
    sub_23E8941D8(v30, v31, (uint64_t)v22, v26, (uint64_t)v15, v32, v33, &v36, v29, &v35);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v27, v12);
  }
  return result;
}

uint64_t UtilityRateInfoSnapshot.peakName.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D988E0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 56));
  v5 = *(_QWORD *)(v4 + 16);
  v6 = sub_23E8A21BC();
  v7 = *(_QWORD *)(v6 - 8);
  if (v5)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v3, v4 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), v6);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v3, v8, 1, v6);
  v9 = sub_23E8953A4((uint64_t)v3);
  sub_23E75496C((uint64_t)v3, &qword_256D988E0);
  return v9;
}

uint64_t UtilityRateInfoSnapshot.peakUntil.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v2 = v1;
  v4 = type metadata accessor for UtilityRateInfoSnapshot();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v68 = (uint64_t)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v60 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433A8D8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v67 = (uint64_t)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v60 - v12;
  v14 = sub_23E8A1D6C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v66 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v60 - v18;
  v75 = sub_23E8A21BC();
  v20 = MEMORY[0x24BDAC7A8](v75);
  v62 = (char *)&v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v60 - v25;
  v65 = *(int *)(v4 + 56);
  v27 = *(_QWORD *)(v2 + v65);
  v28 = *(_QWORD *)(v27 + 16);
  v69 = v4;
  v73 = v23;
  if (v28)
  {
    v63 = a1;
    v64 = v27;
    v29 = *(int *)(v4 + 20);
    v74 = v2;
    v71 = v2 + v29;
    v60 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    v61 = v24;
    v30 = v27 + v60;
    v70 = *(_QWORD *)(v23 + 72);
    v72 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
    swift_bridgeObjectRetain();
    v31 = v75;
    do
    {
      v72(v26, v30, v31);
      v32 = sub_23E8A21B0();
      v33 = v74;
      UtilityRateInfoSnapshot.stringToDate(stringDate:)(v32, v34, (uint64_t)v13);
      swift_bridgeObjectRelease();
      sub_23E780B60(v33, (uint64_t)v8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, &v8[*(int *)(v69 + 20)], v14);
        sub_23E780BA4((uint64_t)v8);
        sub_23E75496C((uint64_t)v13, &qword_25433A8D8);
      }
      else
      {
        sub_23E780BA4((uint64_t)v8);
        (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v19, v13, v14);
      }
      v35 = sub_23E8A1CB8();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v14);
      if ((v35 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v44 = sub_23E8A21B0();
        UtilityRateInfoSnapshot.stringToDate(stringDate:)(v44, v45, v63);
        swift_bridgeObjectRelease();
        return (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v26, v75);
      }
      v36 = *(void (**)(char *, uint64_t))(v73 + 8);
      v31 = v75;
      v36(v26, v75);
      v30 += v70;
      --v28;
    }
    while (v28);
    swift_bridgeObjectRelease();
    v2 = v74;
    v37 = *(_QWORD *)(v74 + v65);
    v38 = *(_QWORD *)(v37 + 16);
    if (v38)
    {
      v39 = v61;
      v72(v61, v37 + v60 + v70 * (v38 - 1), v31);
      v40 = v31;
      v41 = sub_23E8A21B0();
      v43 = v42;
      v36(v39, v40);
    }
    else
    {
      v41 = 0;
      v43 = 0xE000000000000000;
    }
    a1 = v63;
  }
  else
  {
    v41 = 0;
    v43 = 0xE000000000000000;
  }
  v48 = v66;
  v47 = v67;
  UtilityRateInfoSnapshot.stringToDate(stringDate:)(v41, v43, v67);
  swift_bridgeObjectRelease();
  v49 = v68;
  sub_23E780B60(v2, v68);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v47, 1, v14) == 1)
  {
    v50 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v48, v49 + *(int *)(v69 + 20), v14);
    sub_23E780BA4(v49);
    sub_23E75496C(v47, &qword_25433A8D8);
  }
  else
  {
    sub_23E780BA4(v49);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v48, v47, v14);
    v50 = v69;
  }
  v51 = sub_23E8A1CC4();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v48, v14);
  if ((v51 & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(a1, v2 + *(int *)(v50 + 28), v14);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v15 + 56))(a1, 0, 1, v14);
  }
  else
  {
    v52 = *(_QWORD *)(v2 + v65);
    v53 = *(_QWORD *)(v52 + 16);
    if (v53)
    {
      v54 = v73;
      v55 = v62;
      v56 = v75;
      (*(void (**)(char *, unint64_t, uint64_t))(v73 + 16))(v62, v52+ ((*(unsigned __int8 *)(v73 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80))+ *(_QWORD *)(v73 + 72) * (v53 - 1), v75);
      v57 = sub_23E8A21B0();
      v59 = v58;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v56);
    }
    else
    {
      v57 = 0;
      v59 = 0xE000000000000000;
    }
    UtilityRateInfoSnapshot.stringToDate(stringDate:)(v57, v59, a1);
    return swift_bridgeObjectRelease();
  }
}

uint64_t UtilityRateInfoSnapshot.statusAndAdviceTextPlusSymbol.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = type metadata accessor for UtilityRateInfoSnapshot();
  if (*(_BYTE *)(v1 + *(int *)(v3 + 44)) == 6)
    __asm { BR              X11 }
  if (qword_25433BA28 != -1)
    swift_once();
  result = sub_23E8A1874();
  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0xE000000000000000;
  return result;
}

uint64_t PeakPeriodListing.rank.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t PeakPeriodListing.id.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t PeakPeriodListing.intervals.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PeakPeriodListing.totalLevels.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t PeakPeriodListing.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 8);
  sub_23E8A3E30();
  swift_bridgeObjectRetain();
  sub_23E899FC8(a1, v3);
  swift_bridgeObjectRelease();
  return sub_23E8A3E30();
}

uint64_t static PeakPeriodListing.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  if (*a1 != *a2)
    return 0;
  v2 = a2[2];
  v3 = a1[2];
  return sub_23E893488(a1[1], a2[1]) & (v3 == v2);
}

uint64_t sub_23E893488(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  BOOL v20;
  uint64_t v22;
  uint64_t v23;

  v4 = sub_23E8A16B8();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v22 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v17 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v22 = *(_QWORD *)(v8 + 72);
      v23 = v8;
      v13 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
      v14 = v11 - 1;
      do
      {
        v15 = a1;
        v13(v10, a1 + v12, v4);
        v16 = a2;
        v13(v7, a2 + v12, v4);
        sub_23E7518F4(&qword_256D98920, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB8A0]);
        v17 = sub_23E8A389C();
        v18 = *(void (**)(char *, uint64_t))(v23 + 8);
        v18(v7, v4);
        v18(v10, v4);
        v20 = v14-- != 0;
        if ((v17 & 1) == 0)
          break;
        v12 += v22;
        a2 = v16;
        a1 = v15;
      }
      while (v20);
    }
  }
  else
  {
    v17 = 0;
  }
  return v17 & 1;
}

uint64_t PeakPeriodListing.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 8);
  sub_23E8A3E24();
  sub_23E8A3E30();
  swift_bridgeObjectRetain();
  sub_23E899FC8((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  sub_23E8A3E30();
  return sub_23E8A3E3C();
}

uint64_t sub_23E893684()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 8);
  sub_23E8A3E24();
  sub_23E8A3E30();
  swift_bridgeObjectRetain();
  sub_23E899FC8((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  sub_23E8A3E30();
  return sub_23E8A3E3C();
}

uint64_t sub_23E8936FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 8);
  sub_23E8A3E30();
  swift_bridgeObjectRetain();
  sub_23E899FC8(a1, v3);
  swift_bridgeObjectRelease();
  return sub_23E8A3E30();
}

uint64_t sub_23E893754()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 8);
  sub_23E8A3E24();
  sub_23E8A3E30();
  swift_bridgeObjectRetain();
  sub_23E899FC8((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  sub_23E8A3E30();
  return sub_23E8A3E3C();
}

uint64_t sub_23E8937C8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  if (*a1 != *a2)
    return 0;
  v2 = a2[2];
  v3 = a1[2];
  return sub_23E893488(a1[1], a2[1]) & (v3 == v2);
}

HomeEnergyUI::RatePlanType_optional __swiftcall RatePlanType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  HomeEnergyUI::RatePlanType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23E8A3D4C();
  result.value = swift_bridgeObjectRelease();
  v5 = 7;
  if (v3 < 7)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t RatePlanType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23E893898 + 4 * byte_23E8AB44D[*v0]))(0x6E776F6E6B6E75, 0xE700000000000000);
}

uint64_t sub_23E893898()
{
  return 7696244;
}

uint64_t sub_23E8938A8()
{
  return 0x646572656974;
}

uint64_t sub_23E8938BC()
{
  return 1952541798;
}

uint64_t sub_23E8938CC()
{
  return 0x6465786966;
}

uint64_t sub_23E8938E0()
{
  return 0x726F707075736E75;
}

uint64_t sub_23E893900()
{
  return 0x676E6964616F6CLL;
}

void sub_23E893914(char *a1)
{
  sub_23E892198(*a1);
}

void sub_23E893920()
{
  char *v0;

  sub_23E892428(0, *v0);
}

void sub_23E89392C()
{
  __asm { BR              X10 }
}

uint64_t sub_23E893968()
{
  sub_23E8A398C();
  return swift_bridgeObjectRelease();
}

void sub_23E8939F8(uint64_t a1)
{
  char *v1;

  sub_23E892428(a1, *v1);
}

HomeEnergyUI::RatePlanType_optional sub_23E893A00(Swift::String *a1)
{
  return RatePlanType.init(rawValue:)(*a1);
}

uint64_t sub_23E893A0C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_23E893A3C + 4 * byte_23E8AB45B[*v0]))();
}

void sub_23E893A3C(_QWORD *a1@<X8>)
{
  *a1 = 7696244;
  a1[1] = 0xE300000000000000;
}

void sub_23E893A50(_QWORD *a1@<X8>)
{
  *a1 = 0x646572656974;
  a1[1] = 0xE600000000000000;
}

void sub_23E893A68(_QWORD *a1@<X8>)
{
  *a1 = 1952541798;
  a1[1] = 0xE400000000000000;
}

void sub_23E893A7C(_QWORD *a1@<X8>)
{
  *a1 = 0x6465786966;
  a1[1] = 0xE500000000000000;
}

void sub_23E893A94(_QWORD *a1@<X8>)
{
  *a1 = 0x726F707075736E75;
  a1[1] = 0xEB00000000646574;
}

void sub_23E893AB8(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x676E6964616F6CLL;
  a1[1] = v1;
}

uint64_t UtilityRateInfoSnapshot.ekSiteID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UtilityRateInfoSnapshot.ekSiteID.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*UtilityRateInfoSnapshot.ekSiteID.modify())()
{
  return nullsub_1;
}

uint64_t UtilityRateInfoSnapshot.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 20);
  v4 = sub_23E8A1D6C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t UtilityRateInfoSnapshot.startDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 20);
  v4 = sub_23E8A1D6C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*UtilityRateInfoSnapshot.startDate.modify())(_QWORD)
{
  type metadata accessor for UtilityRateInfoSnapshot();
  return nullsub_1;
}

uint64_t UtilityRateInfoSnapshot.startOfDay.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 24);
  v4 = sub_23E8A1D6C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t UtilityRateInfoSnapshot.endOfDay.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 28);
  v4 = sub_23E8A1D6C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t UtilityRateInfoSnapshot.ratePlanName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UtilityRateInfoSnapshot.ratePlanName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 32));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*UtilityRateInfoSnapshot.ratePlanName.modify())(_QWORD)
{
  type metadata accessor for UtilityRateInfoSnapshot();
  return nullsub_1;
}

uint64_t UtilityRateInfoSnapshot.timeZone.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 36);
  v4 = sub_23E8A1EE0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t UtilityRateInfoSnapshot.timeZone.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 36);
  v4 = sub_23E8A1EE0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*UtilityRateInfoSnapshot.timeZone.modify())(_QWORD)
{
  type metadata accessor for UtilityRateInfoSnapshot();
  return nullsub_1;
}

uint64_t UtilityRateInfoSnapshot.ratePlanType.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for UtilityRateInfoSnapshot();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 40));
  return result;
}

uint64_t UtilityRateInfoSnapshot.ratePlanType.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for UtilityRateInfoSnapshot();
  *(_BYTE *)(v1 + *(int *)(result + 40)) = v2;
  return result;
}

uint64_t (*UtilityRateInfoSnapshot.ratePlanType.modify())(_QWORD)
{
  type metadata accessor for UtilityRateInfoSnapshot();
  return nullsub_1;
}

uint64_t UtilityRateInfoSnapshot.error.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for UtilityRateInfoSnapshot();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 44));
  return result;
}

uint64_t UtilityRateInfoSnapshot.error.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for UtilityRateInfoSnapshot();
  *(_BYTE *)(v1 + *(int *)(result + 44)) = v2;
  return result;
}

uint64_t (*UtilityRateInfoSnapshot.error.modify())(_QWORD)
{
  type metadata accessor for UtilityRateInfoSnapshot();
  return nullsub_1;
}

void UtilityRateInfoSnapshot.description.getter()
{
  uint64_t v0;
  char *v1;

  v1 = (char *)sub_23E893F58
     + 4
     * byte_23E8AB462[*(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 44))];
  __asm { BR              X10 }
}

uint64_t sub_23E893F58()
{
  sub_23E7573F0();
  sub_23E8A3C08();
  swift_bridgeObjectRelease();
  sub_23E8A3CBC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433B3B0);
  sub_23E8A3968();
  sub_23E8A39A4();
  swift_bridgeObjectRelease();
  sub_23E8A39A4();
  swift_bridgeObjectRetain();
  sub_23E8A39A4();
  swift_bridgeObjectRelease();
  sub_23E8A39A4();
  sub_23E8A39A4();
  swift_bridgeObjectRelease();
  sub_23E8A39A4();
  return 0x4449657469536B65;
}

uint64_t UtilityRateInfoError.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23E894150 + 4 * byte_23E8AB469[*v0]))(0xD000000000000013, 0x800000023E8AF550);
}

uint64_t sub_23E894150(uint64_t a1)
{
  return a1 + 10;
}

uint64_t sub_23E894198()
{
  return 0x724520726568744FLL;
}

uint64_t UtilityRateInfoSnapshot.sortedPeaks.getter()
{
  type metadata accessor for UtilityRateInfoSnapshot();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23E8941D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X7>, _QWORD *a9@<X8>, char *a10)
{
  int *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t result;
  char v31;
  char v32;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;

  v31 = *a10;
  v32 = *a8;
  v16 = (int *)type metadata accessor for UtilityRateInfoSnapshot();
  v17 = v16[10];
  v18 = v16[11];
  *a9 = a1;
  a9[1] = a2;
  v19 = (char *)a9 + v16[9];
  v20 = sub_23E8A1EE0();
  v36 = *(_QWORD *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v19, a3, v20);
  v21 = (char *)a9 + v16[5];
  v22 = sub_23E8A1D6C();
  v35 = *(_QWORD *)(v22 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v21, a5, v22);
  v23 = (_QWORD *)((char *)a9 + v16[8]);
  *v23 = a6;
  v23[1] = a7;
  *((_BYTE *)a9 + v17) = v32;
  *((_BYTE *)a9 + v18) = v31;
  sub_23E89A420(a4);
  swift_bridgeObjectRelease();
  v24 = swift_bridgeObjectRetain();
  v25 = (_QWORD *)sub_23E7F678C(v24);
  swift_bridgeObjectRelease();
  v37 = v25;
  sub_23E897170(&v37);
  swift_bridgeObjectRelease();
  v26 = v37;
  *(_QWORD *)((char *)a9 + v16[12]) = v37;
  v27 = (uint64_t)a9 + v16[6];
  swift_retain();
  sub_23E8A2084();
  v28 = (uint64_t)a9 + v16[7];
  sub_23E8A2174();
  *(_QWORD *)((char *)a9 + v16[13]) = _s12HomeEnergyUI10PeakFinderC06filterD7Entries5start3end5peaks8timeZoneSay0A15UtilityServices0mD6PeriodVG10Foundation4DateV_AolM04TimeL0VtFZ_0(v27, v28, (unint64_t)v26, a3);
  v29 = _s12HomeEnergyUI10PeakFinderC06filterD7Entries5start3end5peaks8timeZoneSay0A15UtilityServices0mD6PeriodVG10Foundation4DateV_AolM04TimeL0VtFZ_0(a5, v28, (unint64_t)v26, a3);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(a5, v22);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v36 + 8))(a3, v20);
  *(_QWORD *)((char *)a9 + v16[14]) = v29;
  return result;
}

uint64_t sub_23E8943E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t result;
  _BYTE v17[14];
  char v18;
  char v19;

  v0 = sub_23E8A1EE0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = &v17[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D94958);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_23E8A1D6C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v17[-v12];
  v14 = type metadata accessor for UtilityRateInfoSnapshot();
  __swift_allocate_value_buffer(v14, qword_256D98868);
  v15 = (_QWORD *)__swift_project_value_buffer(v14, (uint64_t)qword_256D98868);
  sub_23E8A1D60();
  sub_23E8A1EB0();
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v1 + 16))(v3, v6, v0);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v11, v13, v7);
    v19 = 7;
    v18 = 6;
    sub_23E8941D8(11565, 0xE200000000000000, (uint64_t)v3, MEMORY[0x24BEE4AF8], (uint64_t)v11, 11565, 0xE200000000000000, &v19, v15, &v18);
    (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v6, v0);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v13, v7);
  }
  return result;
}

uint64_t static UtilityRateInfoSnapshot.loadingSnapshot.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23E81DE2C(&qword_256D936E8, (uint64_t)qword_256D98868, a1);
}

uint64_t sub_23E8945FC()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t result;
  _BYTE v17[14];
  char v18;
  char v19;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D94958);
  MEMORY[0x24BDAC7A8](v0);
  v2 = &v17[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = sub_23E8A1EE0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_23E8A1D6C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v17[-v12];
  v14 = type metadata accessor for UtilityRateInfoSnapshot();
  __swift_allocate_value_buffer(v14, qword_256D98880);
  v15 = (_QWORD *)__swift_project_value_buffer(v14, (uint64_t)qword_256D98880);
  sub_23E8A1D24();
  sub_23E8A1EBC();
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 32))(v6, v2, v3);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v11, v13, v7);
    v19 = 7;
    v18 = 0;
    sub_23E8941D8(0, 0, (uint64_t)v6, MEMORY[0x24BEE4AF8], (uint64_t)v11, 0, 0xE000000000000000, &v19, v15, &v18);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v13, v7);
  }
  return result;
}

uint64_t static UtilityRateInfoSnapshot.invalidEnergySiteSnapshot.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23E81DE2C(&qword_256D936F0, (uint64_t)qword_256D98880, a1);
}

uint64_t sub_23E8947F8()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t result;
  _BYTE v17[14];
  char v18;
  char v19;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D94958);
  MEMORY[0x24BDAC7A8](v0);
  v2 = &v17[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = sub_23E8A1EE0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_23E8A1D6C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v17[-v12];
  v14 = type metadata accessor for UtilityRateInfoSnapshot();
  __swift_allocate_value_buffer(v14, qword_256D98898);
  v15 = (_QWORD *)__swift_project_value_buffer(v14, (uint64_t)qword_256D98898);
  sub_23E8A1D24();
  sub_23E8A1EBC();
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 32))(v6, v2, v3);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v11, v13, v7);
    v19 = 7;
    v18 = 4;
    sub_23E8941D8(0, 0, (uint64_t)v6, MEMORY[0x24BEE4AF8], (uint64_t)v11, 0, 0xE000000000000000, &v19, v15, &v18);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v13, v7);
  }
  return result;
}

uint64_t static UtilityRateInfoSnapshot.noTimeZoneSnapshot.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23E81DE2C(&qword_256D936F8, (uint64_t)qword_256D98898, a1);
}

uint64_t sub_23E8949F8()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t result;
  _BYTE v17[14];
  char v18;
  char v19;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D94958);
  MEMORY[0x24BDAC7A8](v0);
  v2 = &v17[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = sub_23E8A1EE0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_23E8A1D6C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v17[-v12];
  v14 = type metadata accessor for UtilityRateInfoSnapshot();
  __swift_allocate_value_buffer(v14, qword_256D988B0);
  v15 = (_QWORD *)__swift_project_value_buffer(v14, (uint64_t)qword_256D988B0);
  sub_23E8A1D24();
  sub_23E8A1EBC();
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 32))(v6, v2, v3);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v11, v13, v7);
    v19 = 7;
    v18 = 2;
    sub_23E8941D8(0, 0, (uint64_t)v6, MEMORY[0x24BEE4AF8], (uint64_t)v11, 0, 0xE000000000000000, &v19, v15, &v18);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v13, v7);
  }
  return result;
}

uint64_t static UtilityRateInfoSnapshot.disconnectedSubscriptionSnapshot.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23E81DE2C(&qword_256D93700, (uint64_t)qword_256D988B0, a1);
}

uint64_t sub_23E894BF8()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t result;
  _BYTE v17[14];
  char v18;
  char v19;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D94958);
  MEMORY[0x24BDAC7A8](v0);
  v2 = &v17[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = sub_23E8A1EE0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_23E8A1D6C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v17[-v12];
  v14 = type metadata accessor for UtilityRateInfoSnapshot();
  __swift_allocate_value_buffer(v14, qword_256D988C8);
  v15 = (_QWORD *)__swift_project_value_buffer(v14, (uint64_t)qword_256D988C8);
  sub_23E8A1D24();
  sub_23E8A1EBC();
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 32))(v6, v2, v3);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v11, v13, v7);
    v19 = 7;
    v18 = 1;
    sub_23E8941D8(0, 0, (uint64_t)v6, MEMORY[0x24BEE4AF8], (uint64_t)v11, 0, 0xE000000000000000, &v19, v15, &v18);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v13, v7);
  }
  return result;
}

uint64_t static UtilityRateInfoSnapshot.noUtilitySnapshot.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23E81DE2C(&qword_256D93708, (uint64_t)qword_256D988C8, a1);
}

uint64_t UtilityRateInfoSnapshot.uniquePeakRanks.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;

  v1 = sub_23E8A21BC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 48));
  v6 = *(_QWORD *)(v5 + 16);
  v7 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v20 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23E898940(0, v6, 0);
    v8 = v5 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v9 = *(_QWORD *)(v2 + 72);
    v18[1] = v5;
    v19 = v9;
    v10 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    v11 = v2;
    do
    {
      v10(v4, v8, v1);
      v12 = sub_23E8A2198();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      v7 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23E898940(0, *(_QWORD *)(v7 + 16) + 1, 1);
        v7 = v20;
      }
      v14 = *(_QWORD *)(v7 + 16);
      v13 = *(_QWORD *)(v7 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_23E898940(v13 > 1, v14 + 1, 1);
        v7 = v20;
      }
      *(_QWORD *)(v7 + 16) = v14 + 1;
      *(_QWORD *)(v7 + 8 * v14 + 32) = v12;
      v8 += v19;
      --v6;
      v2 = v11;
    }
    while (v6);
    swift_bridgeObjectRelease();
  }
  v15 = sub_23E89A274(v7);
  swift_bridgeObjectRelease();
  v16 = *(_QWORD *)(v15 + 16);
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t UtilityRateInfoSnapshot.stringToDate(stringDate:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25[2];

  v6 = sub_23E8A1C34();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433A8D8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for UtilityRateInfoSnapshot();
  sub_23E8A20A8();
  sub_23E8A1C1C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v13 = sub_23E8A1D6C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56);
  v15(v12, 0, 1, v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_23E75496C((uint64_t)v12, &qword_25433A8D8);
    if (qword_256D934B0 != -1)
      swift_once();
    v16 = sub_23E8A22C4();
    __swift_project_value_buffer(v16, (uint64_t)qword_256D96838);
    swift_bridgeObjectRetain_n();
    v17 = sub_23E8A22AC();
    v18 = sub_23E8A3B30();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = swift_slowAlloc();
      v20 = swift_slowAlloc();
      v25[0] = v20;
      *(_DWORD *)v19 = 136315394;
      v24 = sub_23E755DA4(0xD000000000000019, 0x800000023E8B4BC0, v25);
      sub_23E8A3BF0();
      *(_WORD *)(v19 + 12) = 2080;
      swift_bridgeObjectRetain();
      v24 = sub_23E755DA4(a1, a2, v25);
      sub_23E8A3BF0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23E74F000, v17, v18, "%s: Invalid date format: %s", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2426553D0](v20, -1, -1);
      MEMORY[0x2426553D0](v19, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v21 = sub_23E8A1D6C();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(a3, 1, 1, v21);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(a3, v12, v13);
    return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v15)(a3, 0, 1, v13);
  }
}

void (*sub_23E895328(_QWORD *a1, uint64_t a2))(_QWORD *a1)
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_23E89862C(v4, a2);
  return sub_23E895374;
}

void sub_23E895374(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t sub_23E8953A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D988E0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v18 - v7;
  v9 = *(unsigned __int8 *)(v1 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 40));
  v10 = 11565;
  if (v9 <= 5)
  {
    if (((1 << v9) & 0x35) != 0)
    {
      LOBYTE(v19) = v9;
      sub_23E891644();
      return v11;
    }
    else if (v9 == 1)
    {
      sub_23E89A2E4(a1, (uint64_t)v8);
      v13 = UtilityRateInfoSnapshot.uniquePeakRanks.getter();
      sub_23E89A2E4((uint64_t)v8, (uint64_t)v6);
      v14 = sub_23E8A21BC();
      v15 = *(_QWORD *)(v14 - 8);
      v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v6, 1, v14);
      if (v16 == 1)
      {
        sub_23E75496C((uint64_t)v8, &qword_256D988E0);
        sub_23E75496C((uint64_t)v6, &qword_256D988E0);
        v17 = 0;
      }
      else
      {
        v17 = sub_23E8A2198();
        sub_23E75496C((uint64_t)v8, &qword_256D988E0);
        (*(void (**)(char *, uint64_t))(v15 + 8))(v6, v14);
      }
      v19 = v17;
      v20 = v16 == 1;
      v21 = 0;
      v22 = 0;
      v23 = v13;
      v10 = PeakPeriodAttributes.peakName.getter();
      swift_bridgeObjectRelease();
    }
  }
  return v10;
}

uint64_t UtilityRateInfoSnapshot.currentPeak.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 56));
  v4 = *(_QWORD *)(v3 + 16);
  v5 = sub_23E8A21BC();
  v6 = *(_QWORD *)(v5 - 8);
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v6 + 16))(a1, v3 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)), v5);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v7, 1, v5);
}

uint64_t UtilityRateInfoSnapshot.selectedPeaks.getter()
{
  type metadata accessor for UtilityRateInfoSnapshot();
  return swift_bridgeObjectRetain();
}

uint64_t UtilityRateInfoSnapshot.attributedPeak.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
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
  int v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D988E0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v18 - v7;
  v9 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for UtilityRateInfoSnapshot() + 56));
  v10 = *(_QWORD *)(v9 + 16);
  v11 = sub_23E8A21BC();
  v12 = *(_QWORD *)(v11 - 8);
  if (v10)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v8, v9 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)), v11);
    v13 = 0;
  }
  else
  {
    v13 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v8, v13, 1, v11);
  v14 = UtilityRateInfoSnapshot.uniquePeakRanks.getter();
  sub_23E89A2E4((uint64_t)v8, (uint64_t)v6);
  sub_23E8A21BC();
  v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11);
  if (v15 == 1)
  {
    sub_23E75496C((uint64_t)v8, &qword_256D988E0);
    result = sub_23E75496C((uint64_t)v6, &qword_256D988E0);
    v17 = 0;
  }
  else
  {
    v17 = sub_23E8A2198();
    sub_23E75496C((uint64_t)v8, &qword_256D988E0);
    result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }
  *a1 = v17;
  a1[1] = v15 == 1;
  a1[2] = 0;
  a1[3] = 0;
  a1[4] = v14;
  return result;
}

uint64_t UtilityRateInfoSnapshot.peakLevel.getter()
{
  uint64_t v0;
  uint64_t v2[3];
  uint64_t v3;

  UtilityRateInfoSnapshot.attributedPeak.getter(v2);
  if (v3 == 1)
    return 0;
  v0 = v2[0];
  sub_23E76ECCC(v2[0], v2[1], v2[2], v3);
  return v0;
}

uint64_t UtilityRateInfoSnapshot.energyPricing.getter()
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
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  const char *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;

  v46 = sub_23E8A1784();
  v52 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v51 = (char *)&v42 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_23E8A1EE0();
  v47 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E8A1DF0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23E8A1EA4();
  v49 = *(_QWORD *)(v9 - 8);
  v50 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v48 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433A8D8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23E8A1D6C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v53 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v42 - v18;
  UtilityRateInfoSnapshot.peakUntil.getter((uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_23E75496C((uint64_t)v13, &qword_25433A8D8);
    if (qword_256D934B0 != -1)
      swift_once();
    v20 = sub_23E8A22C4();
    __swift_project_value_buffer(v20, (uint64_t)qword_256D96838);
    v21 = sub_23E8A22AC();
    v22 = sub_23E8A3B30();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v55 = v24;
      *(_DWORD *)v23 = 136315138;
      v54 = sub_23E755DA4(0x7250796772656E65, 0xED0000676E696369, &v55);
      sub_23E8A3BF0();
      _os_log_impl(&dword_23E74F000, v21, v22, "%s: nil peakUntil", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2426553D0](v24, -1, -1);
      MEMORY[0x2426553D0](v23, -1, -1);
    }

    return 0;
  }
  else
  {
    v44 = v2;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v19, v13, v14);
    v26 = type metadata accessor for UtilityRateInfoSnapshot();
    v27 = sub_23E8A1CB8();
    v45 = v0;
    if ((v27 & 1) != 0)
    {
      v43 = v26;
      v28 = v0 + *(int *)(v26 + 36);
      sub_23E8A2174();
      if ((sub_23E8A1CC4() & 1) != 0)
      {
        v29 = 0xD000000000000014;
        v30 = 0x800000023E8B4CC0;
      }
      else
      {
        (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDCEF70], v5);
        v31 = v48;
        sub_23E8A1DFC();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v4, v28, v44);
        sub_23E8A1E74();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256D96170);
        v32 = sub_23E8A1E8C();
        v33 = *(_QWORD *)(v32 - 8);
        v34 = (*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
        v35 = swift_allocObject();
        *(_OWORD *)(v35 + 16) = xmmword_23E8A4BE0;
        (*(void (**)(unint64_t, _QWORD, uint64_t))(v33 + 104))(v35 + v34, *MEMORY[0x24BDCF278], v32);
        sub_23E7B4240(v35);
        swift_setDeallocating();
        swift_arrayDestroy();
        swift_deallocClassInstance();
        v36 = v51;
        sub_23E8A1E14();
        swift_bridgeObjectRelease();
        v37 = sub_23E8A176C();
        if ((v38 & 1) != 0)
        {
          v30 = 0xE800000000000000;
          v39 = v46;
          v29 = 0x4025206C69746E55;
        }
        else
        {
          v30 = 0x800000023E8B4CA0;
          v29 = 0xD000000000000012;
          v39 = v46;
          switch(v37)
          {
            case 1:
              break;
            case 2:
              v40 = "Until Monday at %@";
              goto LABEL_23;
            case 3:
              v29 = 0xD000000000000013;
              v40 = "Until Tuesday at %@";
              goto LABEL_23;
            case 4:
              v29 = 0xD000000000000015;
              v40 = "Until Wednesday at %@";
              goto LABEL_23;
            case 5:
              v29 = 0xD000000000000014;
              v40 = "Until Thursday at %@";
              goto LABEL_23;
            case 6:
              v40 = "Until Friday at %@";
LABEL_23:
              v30 = (unint64_t)(v40 - 32) | 0x8000000000000000;
              break;
            default:
              if (v37 == 7)
              {
                v29 = 0xD000000000000014;
                v30 = 0x800000023E8B4BE0;
              }
              else
              {
                v30 = 0xE800000000000000;
              }
              v39 = v46;
              break;
          }
        }
        (*(void (**)(char *, uint64_t))(v52 + 8))(v36, v39);
        (*(void (**)(char *, uint64_t))(v49 + 8))(v31, v50);
      }
      (*(void (**)(char *, uint64_t))(v15 + 8))(v53, v14);
      v26 = v43;
    }
    else
    {
      v30 = 0xE800000000000000;
      v29 = 0x4025206C69746E55;
    }
    v25 = sub_23E8204C4(v29, v30, (uint64_t)v19, v45 + *(int *)(v26 + 36), 0xD000000000000015, 0x800000023E8AC570, MEMORY[0x24BEE4AF8]);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v14);
  }
  return v25;
}

uint64_t UtilityRateInfoError.tileText.getter()
{
  if (qword_25433BA28 != -1)
    swift_once();
  return sub_23E8A1874();
}

HomeEnergyUI::UtilityRateInfoError_optional __swiftcall UtilityRateInfoError.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 6;
  if ((unint64_t)rawValue < 6)
    v2 = rawValue;
  *v1 = v2;
  return (HomeEnergyUI::UtilityRateInfoError_optional)rawValue;
}

HomeEnergyUI::UtilityRateInfoError_optional sub_23E895F68(Swift::Int *a1)
{
  return UtilityRateInfoError.init(rawValue:)(*a1);
}

uint64_t sub_23E895F74()
{
  sub_23E89B4E4();
  sub_23E758214();
  return sub_23E8A3E0C();
}

_QWORD *sub_23E895FB8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D98930);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23E89A16C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23E8960C4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D962A0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_23E89A32C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23E8961E8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23E8961FC(a1, a2, a3, a4, &qword_256D962B8, (uint64_t (*)(_QWORD))MEMORY[0x24BE4F4C0]);
}

uint64_t sub_23E8961FC(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
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
    result = sub_23E8A3CF8();
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
    sub_23E89B3CC(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

_QWORD *sub_23E896408(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D94960);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23E89B1F4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23E896514(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23E8961FC(a1, a2, a3, a4, &qword_256D96200, (uint64_t (*)(_QWORD))MEMORY[0x24BE2EA60]);
}

_QWORD *sub_23E896528(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D96178);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23E89B2E4(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23E896634(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23E8961FC(a1, a2, a3, a4, qword_256D97E50, (uint64_t (*)(_QWORD))MEMORY[0x24BDCB988]);
}

uint64_t sub_23E896648(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23E8961FC(a1, a2, a3, a4, &qword_25433B448, type metadata accessor for FeaturedInterval);
}

unint64_t sub_23E89665C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23E8A3E18();
  return sub_23E896950(a1, v2);
}

unint64_t sub_23E89668C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23E8A3C74();
  return sub_23E8969EC(a1, v2);
}

uint64_t sub_23E8966BC(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v8 = *v3;
  v10 = sub_23E89665C(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_23E896C94();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v19 = 8 * v10;
    *(_QWORD *)(v16[6] + v19) = a2;
    *(_QWORD *)(v16[7] + v19) = a1;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_23E7F5CEC(result, a3 & 1);
  result = sub_23E89665C(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23E8A3DB8();
  __break(1u);
  return result;
}

void sub_23E8967F4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_23E75589C(a2, a3);
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
    sub_23E896E34();
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
  sub_23E7F5CF8(v15, a4 & 1);
  v20 = sub_23E75589C(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_23E8A3DB8();
  __break(1u);
}

unint64_t sub_23E896950(uint64_t a1, uint64_t a2)
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

unint64_t sub_23E8969EC(uint64_t a1, uint64_t a2)
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
      sub_23E89B528(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x242654C74](v9, a1);
      sub_23E7B60FC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void *sub_23E896AB0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433B428);
  v2 = *v0;
  v3 = sub_23E8A3D1C();
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
    sub_23E755E74(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_23E75575C(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

void *sub_23E896C94()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D962C8);
  v2 = *v0;
  v3 = sub_23E8A3D1C();
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
    result = (void *)swift_bridgeObjectRetain();
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

id sub_23E896E34()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D962A8);
  v2 = *v0;
  v3 = sub_23E8A3D1C();
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

void *sub_23E896FE4()
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
  unint64_t v21;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D95860);
  v2 = *v0;
  v3 = sub_23E8A3D1C();
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
    v21 = __clz(__rbit64(v19));
    v12 = (v19 - 1) & v19;
    v15 = v21 + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
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

uint64_t sub_23E897170(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(sub_23E8A21BC() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)sub_23E7F9100(v3);
  v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_23E8971F0(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_23E8971F0(uint64_t *a1)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
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
  void (*v65)(char *, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  void (*v75)(char *, uint64_t);
  uint64_t v76;
  char *v77;
  void (*v78)(char *, uint64_t, uint64_t);
  unint64_t v79;
  unint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  BOOL v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  uint64_t v106;
  char v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  BOOL v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  char *v124;
  char *v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  unint64_t v129;
  char *v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  char *v136;
  unint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  uint64_t v141;
  char *v142;
  char *v143;
  char *v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  unint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  char *v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t *v158;
  uint64_t v159;

  v2 = v1;
  v4 = sub_23E8A21BC();
  v159 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v146 = (char *)&v138 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v153 = (char *)&v138 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v155 = (char *)&v138 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v154 = (char *)&v138 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v142 = (char *)&v138 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v149 = (char *)&v138 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v144 = (char *)&v138 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v143 = (char *)&v138 - v19;
  v158 = a1;
  v20 = a1[1];
  result = sub_23E8A3D58();
  if (result >= v20)
  {
    if (v20 < 0)
      goto LABEL_150;
    if (v20)
      return sub_23E897D88(0, v20, 1, v158);
    return result;
  }
  if (v20 >= 0)
    v22 = v20;
  else
    v22 = v20 + 1;
  if (v20 < -1)
    goto LABEL_158;
  v139 = result;
  if (v20 < 2)
  {
    v27 = (char *)MEMORY[0x24BEE4AF8];
    v26 = MEMORY[0x24BEE4AF8]
        + ((*(unsigned __int8 *)(v159 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80));
    v138 = MEMORY[0x24BEE4AF8];
    if (v20 != 1)
    {
      v29 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_116:
      if (v29 >= 2)
      {
        v131 = *v158;
        do
        {
          v132 = v29 - 2;
          if (v29 < 2)
            goto LABEL_145;
          if (!v131)
            goto LABEL_157;
          v133 = *(_QWORD *)&v27[16 * v132 + 32];
          v134 = *(_QWORD *)&v27[16 * v29 + 24];
          v135 = v26;
          sub_23E898050(v131 + *(_QWORD *)(v159 + 72) * v133, v131 + *(_QWORD *)(v159 + 72) * *(_QWORD *)&v27[16 * v29 + 16], v131 + *(_QWORD *)(v159 + 72) * v134, v26);
          if (v2)
            break;
          if (v134 < v133)
            goto LABEL_146;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v27 = sub_23E7F75FC((uint64_t)v27);
          if (v132 >= *((_QWORD *)v27 + 2))
            goto LABEL_147;
          v136 = &v27[16 * v132 + 32];
          *(_QWORD *)v136 = v133;
          *((_QWORD *)v136 + 1) = v134;
          v137 = *((_QWORD *)v27 + 2);
          if (v29 > v137)
            goto LABEL_148;
          memmove(&v27[16 * v29 + 16], &v27[16 * v29 + 32], 16 * (v137 - v29));
          *((_QWORD *)v27 + 2) = v137 - 1;
          v29 = v137 - 1;
          v26 = v135;
        }
        while (v137 > 2);
      }
LABEL_127:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v138 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v23 = v22 >> 1;
    v24 = sub_23E8A3A1C();
    *(_QWORD *)(v24 + 16) = v23;
    v25 = *(unsigned __int8 *)(v159 + 80);
    v138 = v24;
    v26 = v24 + ((v25 + 32) & ~v25);
  }
  v28 = 0;
  v27 = (char *)MEMORY[0x24BEE4AF8];
  v148 = v26;
  v152 = v4;
  while (1)
  {
    v30 = v28;
    v31 = v28 + 1;
    if (v28 + 1 >= v20)
    {
      v39 = v28 + 1;
      goto LABEL_67;
    }
    v156 = v20;
    v32 = *v158;
    v33 = *(_QWORD *)(v159 + 72);
    v34 = *(void (**)(char *, uint64_t, uint64_t))(v159 + 16);
    v34(v143, *v158 + v33 * v31, v4);
    v147 = v30;
    v145 = v32;
    v157 = v33;
    v34(v144, v32 + v33 * v30, v4);
    v35 = sub_23E8A21B0();
    v37 = v36;
    if (v35 == sub_23E8A21B0() && v37 == v38)
      LODWORD(v151) = 0;
    else
      LODWORD(v151) = sub_23E8A3D88();
    v40 = v142;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v41 = *(void (**)(char *, uint64_t))(v159 + 8);
    v42 = v152;
    v41(v144, v152);
    v41(v143, v42);
    v39 = v147 + 2;
    if (v147 + 2 < v156)
    {
      v140 = v27;
      v141 = v2;
      v150 = v157 * v31;
      v43 = v145;
      v44 = v157 * v39;
      while (1)
      {
        v45 = v152;
        v34(v149, v43 + v44, v152);
        v34(v40, v43 + v150, v45);
        v46 = sub_23E8A21B0();
        v48 = v47;
        if (v46 == sub_23E8A21B0() && v48 == v49)
          v50 = 0;
        else
          v50 = sub_23E8A3D88();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v51 = v152;
        v41(v40, v152);
        v41(v149, v51);
        if (((v151 ^ v50) & 1) != 0)
          break;
        ++v39;
        v43 += v157;
        if (v156 == v39)
        {
          v52 = v156;
          v39 = v156;
          v27 = v140;
          v2 = v141;
          goto LABEL_32;
        }
      }
      v27 = v140;
      v2 = v141;
    }
    v52 = v156;
LABEL_32:
    v30 = v147;
    v53 = v145;
    if ((v151 & 1) == 0)
      break;
    if (v39 < v147)
      goto LABEL_151;
    if (v147 >= v39)
      break;
    v140 = v27;
    v141 = v2;
    v54 = 0;
    v55 = v157 * (v39 - 1);
    v56 = v39 * v157;
    v57 = v147;
    v58 = v147 * v157;
    do
    {
      if (v57 != v39 + v54 - 1)
      {
        if (!v53)
          goto LABEL_156;
        v60 = v39;
        v61 = v53 + v55;
        v151 = *(_QWORD *)(v159 + 32);
        ((void (*)(char *, uint64_t, uint64_t))v151)(v146, v53 + v58, v152);
        if (v58 < v55 || v53 + v58 >= (unint64_t)(v53 + v56))
        {
          v59 = v152;
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v59 = v152;
          if (v58 != v55)
            swift_arrayInitWithTakeBackToFront();
        }
        ((void (*)(uint64_t, char *, uint64_t))v151)(v61, v146, v59);
        v39 = v60;
        v53 = v145;
      }
      ++v57;
      --v54;
      v55 -= v157;
      v56 -= v157;
      v58 += v157;
    }
    while (v57 < v39 + v54);
    v27 = v140;
    v2 = v141;
    v62 = v152;
    v30 = v147;
    v52 = v156;
    if (v39 < v156)
      goto LABEL_48;
LABEL_67:
    if (v39 < v30)
      goto LABEL_144;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v27 = sub_23E7F727C(0, *((_QWORD *)v27 + 2) + 1, 1, v27);
    v80 = *((_QWORD *)v27 + 2);
    v79 = *((_QWORD *)v27 + 3);
    v29 = v80 + 1;
    v26 = v148;
    v157 = v39;
    if (v80 >= v79 >> 1)
    {
      v130 = sub_23E7F727C((char *)(v79 > 1), v80 + 1, 1, v27);
      v26 = v148;
      v27 = v130;
    }
    *((_QWORD *)v27 + 2) = v29;
    v81 = v27 + 32;
    v82 = &v27[16 * v80 + 32];
    v83 = v157;
    *(_QWORD *)v82 = v30;
    *((_QWORD *)v82 + 1) = v83;
    if (v80)
    {
      while (1)
      {
        v84 = v29 - 1;
        if (v29 >= 4)
        {
          v89 = &v81[16 * v29];
          v90 = *((_QWORD *)v89 - 8);
          v91 = *((_QWORD *)v89 - 7);
          v95 = __OFSUB__(v91, v90);
          v92 = v91 - v90;
          if (v95)
            goto LABEL_133;
          v94 = *((_QWORD *)v89 - 6);
          v93 = *((_QWORD *)v89 - 5);
          v95 = __OFSUB__(v93, v94);
          v87 = v93 - v94;
          v88 = v95;
          if (v95)
            goto LABEL_134;
          v96 = v29 - 2;
          v97 = &v81[16 * v29 - 32];
          v99 = *(_QWORD *)v97;
          v98 = *((_QWORD *)v97 + 1);
          v95 = __OFSUB__(v98, v99);
          v100 = v98 - v99;
          if (v95)
            goto LABEL_136;
          v95 = __OFADD__(v87, v100);
          v101 = v87 + v100;
          if (v95)
            goto LABEL_139;
          if (v101 >= v92)
          {
            v119 = &v81[16 * v84];
            v121 = *(_QWORD *)v119;
            v120 = *((_QWORD *)v119 + 1);
            v95 = __OFSUB__(v120, v121);
            v122 = v120 - v121;
            if (v95)
              goto LABEL_143;
            v112 = v87 < v122;
            goto LABEL_104;
          }
        }
        else
        {
          if (v29 != 3)
          {
            v113 = *((_QWORD *)v27 + 4);
            v114 = *((_QWORD *)v27 + 5);
            v95 = __OFSUB__(v114, v113);
            v106 = v114 - v113;
            v107 = v95;
            goto LABEL_98;
          }
          v86 = *((_QWORD *)v27 + 4);
          v85 = *((_QWORD *)v27 + 5);
          v95 = __OFSUB__(v85, v86);
          v87 = v85 - v86;
          v88 = v95;
        }
        if ((v88 & 1) != 0)
          goto LABEL_135;
        v96 = v29 - 2;
        v102 = &v81[16 * v29 - 32];
        v104 = *(_QWORD *)v102;
        v103 = *((_QWORD *)v102 + 1);
        v105 = __OFSUB__(v103, v104);
        v106 = v103 - v104;
        v107 = v105;
        if (v105)
          goto LABEL_138;
        v108 = &v81[16 * v84];
        v110 = *(_QWORD *)v108;
        v109 = *((_QWORD *)v108 + 1);
        v95 = __OFSUB__(v109, v110);
        v111 = v109 - v110;
        if (v95)
          goto LABEL_141;
        if (__OFADD__(v106, v111))
          goto LABEL_142;
        if (v106 + v111 >= v87)
        {
          v112 = v87 < v111;
LABEL_104:
          if (v112)
            v84 = v96;
          goto LABEL_106;
        }
LABEL_98:
        if ((v107 & 1) != 0)
          goto LABEL_137;
        v115 = &v81[16 * v84];
        v117 = *(_QWORD *)v115;
        v116 = *((_QWORD *)v115 + 1);
        v95 = __OFSUB__(v116, v117);
        v118 = v116 - v117;
        if (v95)
          goto LABEL_140;
        if (v118 < v106)
          goto LABEL_14;
LABEL_106:
        v123 = v84 - 1;
        if (v84 - 1 >= v29)
        {
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
          goto LABEL_153;
        }
        if (!*v158)
          goto LABEL_155;
        v124 = v27;
        v125 = &v81[16 * v123];
        v126 = *(_QWORD *)v125;
        v127 = &v81[16 * v84];
        v128 = *((_QWORD *)v127 + 1);
        sub_23E898050(*v158 + *(_QWORD *)(v159 + 72) * *(_QWORD *)v125, *v158 + *(_QWORD *)(v159 + 72) * *(_QWORD *)v127, *v158 + *(_QWORD *)(v159 + 72) * v128, v26);
        if (v2)
          goto LABEL_127;
        if (v128 < v126)
          goto LABEL_130;
        if (v84 > *((_QWORD *)v124 + 2))
          goto LABEL_131;
        *(_QWORD *)v125 = v126;
        *(_QWORD *)&v81[16 * v123 + 8] = v128;
        v129 = *((_QWORD *)v124 + 2);
        if (v84 >= v129)
          goto LABEL_132;
        v27 = v124;
        v29 = v129 - 1;
        memmove(&v81[16 * v84], v127 + 16, 16 * (v129 - 1 - v84));
        *((_QWORD *)v124 + 2) = v129 - 1;
        v26 = v148;
        if (v129 <= 2)
          goto LABEL_14;
      }
    }
    v29 = 1;
LABEL_14:
    v20 = v158[1];
    v28 = v157;
    v4 = v152;
    if (v157 >= v20)
      goto LABEL_116;
  }
  v62 = v152;
  if (v39 >= v52)
    goto LABEL_67;
LABEL_48:
  if (__OFSUB__(v39, v30))
    goto LABEL_149;
  if (v39 - v30 >= v139)
    goto LABEL_67;
  if (__OFADD__(v30, v139))
    goto LABEL_152;
  if (v30 + v139 >= v52)
    v63 = v52;
  else
    v63 = v30 + v139;
  if (v63 >= v30)
  {
    if (v39 != v63)
    {
      v147 = v30;
      v140 = v27;
      v141 = v2;
      v64 = *(_QWORD *)(v159 + 72);
      v150 = *(_QWORD *)(v159 + 16);
      v151 = v64;
      v156 = v39 * v64;
      v157 = v64 * (v39 - 1);
      v145 = v63;
      do
      {
        v66 = 0;
        v67 = v147;
        while (1)
        {
          v68 = *v158;
          v69 = (void (*)(char *, uint64_t, uint64_t))v150;
          ((void (*)(char *, uint64_t, uint64_t))v150)(v154, v156 + v66 + *v158, v62);
          v69(v155, v157 + v66 + v68, v62);
          v70 = sub_23E8A21B0();
          v72 = v71;
          if (v70 == sub_23E8A21B0() && v72 == v73)
            break;
          v74 = sub_23E8A3D88();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v75 = *(void (**)(char *, uint64_t))(v159 + 8);
          v62 = v152;
          v75(v155, v152);
          v75(v154, v62);
          if ((v74 & 1) == 0)
            goto LABEL_58;
          v76 = *v158;
          if (!*v158)
            goto LABEL_154;
          v77 = (char *)(v76 + v157 + v66);
          v78 = *(void (**)(char *, uint64_t, uint64_t))(v159 + 32);
          v78(v153, v76 + v156 + v66, v62);
          swift_arrayInitWithTakeFrontToBack();
          v78(v77, (uint64_t)v153, v62);
          v66 -= v151;
          if (v39 == ++v67)
            goto LABEL_58;
        }
        swift_bridgeObjectRelease_n();
        v65 = *(void (**)(char *, uint64_t))(v159 + 8);
        v62 = v152;
        v65(v155, v152);
        v65(v154, v62);
LABEL_58:
        ++v39;
        v157 += v151;
        v156 += v151;
      }
      while (v39 != v145);
      v39 = v145;
      v27 = v140;
      v2 = v141;
      v30 = v147;
    }
    goto LABEL_67;
  }
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  result = sub_23E8A3CF8();
  __break(1u);
  return result;
}

uint64_t sub_23E897D88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t *v37;
  _QWORD *v38;
  char *v39;
  char *v40;
  uint64_t v41;

  v37 = a4;
  v31 = a1;
  v6 = sub_23E8A21BC();
  v38 = *(_QWORD **)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v36 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v40 = (char *)&v29 - v10;
  result = MEMORY[0x24BDAC7A8](v9);
  v39 = (char *)&v29 - v12;
  v35 = a3;
  v30 = a2;
  if (a3 != a2)
  {
    v13 = v38[9];
    v32 = (void (*)(char *, uint64_t, uint64_t))v38[2];
    v33 = v13;
    v14 = v13 * (v35 - 1);
    v41 = v13 * v35;
LABEL_6:
    v16 = 0;
    v17 = v31;
    v34 = v14;
    while (1)
    {
      v18 = *v37;
      v19 = v32;
      v32(v39, v41 + v16 + *v37, v6);
      v19(v40, v14 + v16 + v18, v6);
      v20 = sub_23E8A21B0();
      v22 = v21;
      if (v20 == sub_23E8A21B0() && v22 == v23)
      {
        swift_bridgeObjectRelease_n();
        v15 = (void (*)(char *, uint64_t))v38[1];
        v15(v40, v6);
        result = ((uint64_t (*)(char *, uint64_t))v15)(v39, v6);
        v14 = v34;
LABEL_5:
        v14 += v33;
        v41 += v33;
        if (++v35 == v30)
          return result;
        goto LABEL_6;
      }
      v24 = sub_23E8A3D88();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v25 = (void (*)(char *, uint64_t))v38[1];
      v25(v40, v6);
      result = ((uint64_t (*)(char *, uint64_t))v25)(v39, v6);
      v14 = v34;
      if ((v24 & 1) == 0)
        goto LABEL_5;
      v26 = *v37;
      if (!*v37)
        break;
      v27 = v26 + v34 + v16;
      v28 = (void (*)(char *, uint64_t, uint64_t))v38[4];
      v28(v36, v26 + v41 + v16, v6);
      swift_arrayInitWithTakeFrontToBack();
      result = ((uint64_t (*)(uint64_t, char *, uint64_t))v28)(v27, v36, v6);
      v16 -= v33;
      if (v35 == ++v17)
        goto LABEL_5;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23E898050(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  char v32;
  void (*v33)(char *, uint64_t);
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v39;
  unint64_t v40;
  void (*v41)(char *, unint64_t, uint64_t);
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  void (*v48)(char *, uint64_t);
  BOOL v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t result;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;

  v8 = sub_23E8A21BC();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v58 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v57 = (char *)&v54 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v54 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v54 - v16;
  v19 = *(_QWORD *)(v18 + 72);
  v59 = v18;
  v60 = v19;
  if (!v19)
  {
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  if (a2 - a1 == 0x8000000000000000 && v60 == -1)
    goto LABEL_69;
  v20 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v60 == -1)
    goto LABEL_70;
  v21 = (uint64_t)(a2 - a1) / v60;
  v63 = a1;
  v62 = a4;
  v22 = v20 / v60;
  if (v21 >= v20 / v60)
  {
    if ((v22 & 0x8000000000000000) == 0)
    {
      v24 = v22 * v60;
      if (a4 < a2 || a2 + v24 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v37 = a4 + v24;
      v61 = a4 + v24;
      v63 = a2;
      if (v24 >= 1 && a1 < a2)
      {
        v39 = -v60;
        v60 = *(_QWORD *)(v59 + 16);
        v55 = a4;
        v56 = a1;
        do
        {
          v40 = a3;
          v41 = (void (*)(char *, unint64_t, uint64_t))v60;
          ((void (*)(char *, unint64_t, uint64_t))v60)(v57, v37 + v39, v8);
          v42 = a2 + v39;
          v41(v58, a2 + v39, v8);
          v43 = sub_23E8A21B0();
          v45 = v44;
          if (v43 == sub_23E8A21B0() && v45 == v46)
            v47 = 0;
          else
            v47 = sub_23E8A3D88();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          a3 += v39;
          v48 = *(void (**)(char *, uint64_t))(v59 + 8);
          v48(v58, v8);
          v48(v57, v8);
          if ((v47 & 1) != 0)
          {
            if (v40 < a2 || a3 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              v50 = v55;
              v51 = v56;
            }
            else
            {
              v49 = v40 == a2;
              v50 = v55;
              v51 = v56;
              if (!v49)
                swift_arrayInitWithTakeBackToFront();
            }
            v63 += v39;
          }
          else
          {
            v52 = v61;
            v61 += v39;
            if (v40 < v52 || a3 >= v52)
            {
              swift_arrayInitWithTakeFrontToBack();
              v42 = a2;
              v50 = v55;
              v51 = v56;
            }
            else
            {
              v51 = v56;
              if (v40 != v52)
                swift_arrayInitWithTakeBackToFront();
              v42 = a2;
              v50 = v55;
            }
          }
          v37 = v61;
          if (v61 <= v50)
            break;
          a2 = v42;
        }
        while (v42 > v51);
      }
LABEL_67:
      sub_23E7F743C(&v63, &v62, (uint64_t *)&v61);
      return 1;
    }
  }
  else if ((v21 & 0x8000000000000000) == 0)
  {
    v23 = v21 * v60;
    if (a4 < a1 || a1 + v23 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v58 = (char *)(a4 + v23);
    v61 = a4 + v23;
    if (v23 >= 1 && a2 < a3)
    {
      v26 = *(void (**)(char *, unint64_t, uint64_t))(v59 + 16);
      while (1)
      {
        v26(v17, a2, v8);
        v26(v15, a4, v8);
        v27 = sub_23E8A21B0();
        v29 = v28;
        if (v27 == sub_23E8A21B0() && v29 == v30)
          break;
        v32 = sub_23E8A3D88();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v33 = *(void (**)(char *, uint64_t))(v59 + 8);
        v33(v15, v8);
        v33(v17, v8);
        if ((v32 & 1) == 0)
          goto LABEL_31;
        v34 = v63;
        v35 = a2 + v60;
        if (v63 < a2 || v63 >= v35)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v63 == a2)
        {
          v34 = a2;
        }
        else
        {
          swift_arrayInitWithTakeBackToFront();
        }
LABEL_37:
        v63 = v34 + v60;
        a4 = v62;
        if (v62 < (unint64_t)v58)
        {
          a2 = v35;
          if (v35 < a3)
            continue;
        }
        goto LABEL_67;
      }
      swift_bridgeObjectRelease_n();
      v31 = *(void (**)(char *, uint64_t))(v59 + 8);
      v31(v15, v8);
      v31(v17, v8);
LABEL_31:
      v34 = v63;
      v36 = v62 + v60;
      if (v63 < v62 || v63 >= v36)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v63 != v62)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v62 = v36;
      v35 = a2;
      goto LABEL_37;
    }
    goto LABEL_67;
  }
LABEL_71:
  result = sub_23E8A3D40();
  __break(1u);
  return result;
}

void (*sub_23E89862C(_QWORD *a1, uint64_t a2))(uint64_t a1)
{
  _QWORD *v4;
  char isUniquelyReferenced_nonNull_native;

  v4 = malloc(0x50uLL);
  *a1 = v4;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v4[8] = sub_23E898914(v4);
  v4[9] = sub_23E8986E4(v4 + 4, a2, isUniquelyReferenced_nonNull_native);
  return sub_23E8986A8;
}

void sub_23E8986A8(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 64);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 72))(*(_QWORD *)a1 + 32, 0);
  v2(v1, 0);
  free(v1);
}

void (*sub_23E8986E4(_QWORD *a1, uint64_t a2, char a3))(uint64_t **a1, char a2)
{
  uint64_t *v3;
  uint64_t *v4;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  void (*result)(uint64_t **, char);

  v4 = v3;
  v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[1] = a2;
  v8[2] = v4;
  v9 = *v4;
  v11 = sub_23E89665C(a2);
  *((_BYTE *)v8 + 32) = v10 & 1;
  v12 = *(_QWORD *)(v9 + 16);
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
  }
  else
  {
    v15 = v10;
    v16 = *(_QWORD *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[3] = v11;
      if ((v15 & 1) != 0)
      {
LABEL_8:
        v17 = *(_QWORD *)(*(_QWORD *)(*v4 + 56) + 8 * v11);
LABEL_12:
        *v8 = v17;
        return sub_23E898800;
      }
LABEL_11:
      v17 = 0;
      goto LABEL_12;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      sub_23E896C94();
      goto LABEL_7;
    }
    sub_23E7F5CEC(v14, a3 & 1);
    v18 = sub_23E89665C(a2);
    if ((v15 & 1) == (v19 & 1))
    {
      v11 = v18;
      v8[3] = v18;
      if ((v15 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t **, char))sub_23E8A3DB8();
  __break(1u);
  return result;
}

void sub_23E898800(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *a1;
  v3 = **a1;
  LOBYTE(v4) = *((_BYTE *)*a1 + 32);
  if ((a2 & 1) != 0)
  {
    if (!v3)
      goto LABEL_10;
    v5 = v2[3];
    v6 = *(_QWORD **)v2[2];
    if (((*a1)[4] & 1) != 0)
    {
LABEL_9:
      *(_QWORD *)(v6[7] + 8 * v5) = v3;
LABEL_14:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      free(v2);
      return;
    }
    v7 = v2[1];
    v6[(v5 >> 6) + 8] |= 1 << v5;
    v8 = 8 * v5;
    *(_QWORD *)(v6[6] + v8) = v7;
    *(_QWORD *)(v6[7] + v8) = v3;
    v9 = v6[2];
    v10 = __OFADD__(v9, 1);
    v4 = v9 + 1;
    if (!v10)
      goto LABEL_13;
    __break(1u);
  }
  if (!v3)
  {
LABEL_10:
    if ((v4 & 1) != 0)
      sub_23E81A604(v2[3], *(_QWORD *)v2[2]);
    goto LABEL_14;
  }
  v5 = v2[3];
  v6 = *(_QWORD **)v2[2];
  if ((v4 & 1) != 0)
    goto LABEL_9;
  v11 = v2[1];
  v6[(v5 >> 6) + 8] |= 1 << v5;
  v12 = 8 * v5;
  *(_QWORD *)(v6[6] + v12) = v11;
  *(_QWORD *)(v6[7] + v12) = v3;
  v13 = v6[2];
  v10 = __OFADD__(v13, 1);
  v4 = v13 + 1;
  if (!v10)
  {
LABEL_13:
    v6[2] = v4;
    goto LABEL_14;
  }
  __break(1u);
}

uint64_t (*sub_23E898914(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_23E898934;
}

uint64_t sub_23E898934(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

uint64_t sub_23E898940(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23E7F7610(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23E89895C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23E7F78F0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_23E898978(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23E7F7A90(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23E898994(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23E7F7BF8(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_23E8989B0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23E7F7C0C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_23E8989CC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23E7F7E00(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23E8989E8(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;

  v3 = v2;
  v6 = *v2;
  v7 = sub_23E8A3E18();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    sub_23E899364(a2, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v14;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(v6 + 48);
  if (*(_QWORD *)(v10 + 8 * v9) != a2)
  {
    v11 = ~v8;
    do
    {
      v9 = (v9 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v10 + 8 * v9) != a2);
  }
  result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t type metadata accessor for UtilityRateInfoSnapshot()
{
  uint64_t result;

  result = qword_25433BCD8;
  if (!qword_25433BCD8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23E898B1C(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_23E8A21BC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_23E7518F4(&qword_256D98908, v11, MEMORY[0x24BE4F4D8]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_23E8A3854();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_23E7518F4(&qword_256D98910, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F4C0], MEMORY[0x24BE4F4E0]);
      v21 = sub_23E8A389C();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_23E899484((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_23E898D78()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D98940);
  result = sub_23E8A3CA4();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (uint64_t *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    v26 = -1 << v7;
    v27 = v1;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v28 = 1 << *(_BYTE *)(v2 + 32);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64)
                  bzero((void *)(v2 + 56), 8 * v10);
                else
                  *v6 = v26;
                v1 = v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      result = sub_23E8A3E18();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23E898FF8()
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
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_23E8A21BC();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D98918);
  v6 = sub_23E8A3CA4();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
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
        if (v18 >= v34)
          goto LABEL_33;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_33;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_33;
            v19 = v35[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v34)
              {
LABEL_33:
                swift_release();
                v1 = v33;
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 > 63)
                  bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v35[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v34)
                    goto LABEL_33;
                  v19 = v35[v14];
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
      v23 = *(_QWORD *)(v36 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v22 + v23 * v17, v2);
      sub_23E7518F4(&qword_256D98908, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F4C0], MEMORY[0x24BE4F4D8]);
      result = sub_23E8A3854();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v23, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_23E899364(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_23E898D78();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_23E899688();
      goto LABEL_14;
    }
    sub_23E899A40();
  }
  v8 = *v3;
  result = sub_23E8A3E18();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = sub_23E8A3DAC();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

uint64_t sub_23E899484(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_23E8A21BC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_23E898FF8();
  }
  else
  {
    if (v11 > v10)
    {
      sub_23E89981C();
      goto LABEL_12;
    }
    sub_23E899CA0();
  }
  v12 = *v3;
  sub_23E7518F4(&qword_256D98908, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F4C0], MEMORY[0x24BE4F4D8]);
  v13 = sub_23E8A3854();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_23E7518F4(&qword_256D98910, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F4C0], MEMORY[0x24BE4F4E0]);
      v18 = sub_23E8A389C();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_23E8A3DAC();
  __break(1u);
  return result;
}

void *sub_23E899688()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D98940);
  v2 = *v0;
  v3 = sub_23E8A3C98();
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23E89981C()
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
  uint64_t *v25;

  v1 = v0;
  v2 = sub_23E8A21BC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D98918);
  v6 = *v0;
  v7 = sub_23E8A3C98();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
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
      goto LABEL_32;
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
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_30;
  }
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
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_23E899A40()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D98940);
  result = sub_23E8A3CA4();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v26 = v1;
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    result = sub_23E8A3E18();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v26;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23E899CA0()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_23E8A21BC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D98918);
  v7 = sub_23E8A3CA4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_24;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_33;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_33;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_24:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_23E7518F4(&qword_256D98908, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F4C0], MEMORY[0x24BE4F4D8]);
    result = sub_23E8A3854();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v33)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v32 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23E899FC8(uint64_t a1, uint64_t a2)
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
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t (*v15)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  _QWORD v17[2];

  v4 = sub_23E8A16B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98928);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a2 + 16);
  v17[1] = a1;
  sub_23E8A3E30();
  if (v11)
  {
    v12 = a2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v13 = *(_QWORD *)(v5 + 72);
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    while (1)
    {
      v14(v10, v12, v4);
      v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
      v15(v10, 0, 1, v4);
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4);
      if ((_DWORD)result == 1)
        break;
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
      sub_23E7518F4(&qword_256D94068, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB890]);
      sub_23E8A3860();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v12 += v13;
      if (!--v11)
        return v15(v10, 1, 1, v4);
    }
  }
  else
  {
    v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    return v15(v10, 1, 1, v4);
  }
  return result;
}

uint64_t sub_23E89A16C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D98938);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23E8A3D40();
  __break(1u);
  return result;
}

uint64_t sub_23E89A274(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_23E8A3AAC();
  v7 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v4++;
      sub_23E8989E8(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_23E89A2E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D988E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E89A32C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23E8A3D40();
  __break(1u);
  return result;
}

uint64_t sub_23E89A420(uint64_t a1)
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
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;

  v2 = sub_23E8A21BC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v15 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  sub_23E7518F4(&qword_256D98908, v10, MEMORY[0x24BE4F4D8]);
  result = sub_23E8A3AAC();
  v16 = result;
  if (v9)
  {
    v12 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v13 = *(_QWORD *)(v3 + 72);
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v14(v6, v12, v2);
      sub_23E898B1C((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v12 += v13;
      --v9;
    }
    while (v9);
    return v16;
  }
  return result;
}

uint64_t sub_23E89A548()
{
  return MEMORY[0x24BEE1778];
}

unint64_t sub_23E89A558()
{
  unint64_t result;

  result = qword_256D988E8;
  if (!qword_256D988E8)
  {
    result = MEMORY[0x242655328](&protocol conformance descriptor for PeakPeriodListing, &type metadata for PeakPeriodListing);
    atomic_store(result, (unint64_t *)&qword_256D988E8);
  }
  return result;
}

unint64_t sub_23E89A5A0()
{
  unint64_t result;

  result = qword_256D988F0;
  if (!qword_256D988F0)
  {
    result = MEMORY[0x242655328](&protocol conformance descriptor for RatePlanType, &type metadata for RatePlanType);
    atomic_store(result, (unint64_t *)&qword_256D988F0);
  }
  return result;
}

unint64_t sub_23E89A5E8()
{
  unint64_t result;

  result = qword_256D988F8;
  if (!qword_256D988F8)
  {
    result = MEMORY[0x242655328](&protocol conformance descriptor for UtilityRateInfoError, &type metadata for UtilityRateInfoError);
    atomic_store(result, (unint64_t *)&qword_256D988F8);
  }
  return result;
}

_QWORD *sub_23E89A630(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for PeakPeriodListing(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

_QWORD *assignWithTake for PeakPeriodListing(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for PeakPeriodListing()
{
  return &type metadata for PeakPeriodListing;
}

uint64_t storeEnumTagSinglePayload for RatePlanType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_23E89A750 + 4 * byte_23E8AB47A[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23E89A784 + 4 * byte_23E8AB475[v4]))();
}

uint64_t sub_23E89A784(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E89A78C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E89A794);
  return result;
}

uint64_t sub_23E89A7A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E89A7A8);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23E89A7AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E89A7B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RatePlanType()
{
  return &type metadata for RatePlanType;
}

char *initializeBufferWithCopyOfBuffer for UtilityRateInfoSnapshot(char *a1, char *a2, int *a3)
{
  char *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v24 = *(_QWORD *)a2;
    *(_QWORD *)v4 = *(_QWORD *)a2;
    v4 = (char *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *((_QWORD *)a2 + 1);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *((_QWORD *)a1 + 1) = v7;
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    v11 = sub_23E8A1D6C();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v12(&v4[a3[6]], &a2[a3[6]], v11);
    v12(&v4[a3[7]], &a2[a3[7]], v11);
    v13 = a3[8];
    v14 = a3[9];
    v15 = &v4[v13];
    v16 = &a2[v13];
    v17 = *((_QWORD *)v16 + 1);
    *(_QWORD *)v15 = *(_QWORD *)v16;
    *((_QWORD *)v15 + 1) = v17;
    v18 = &v4[v14];
    v19 = &a2[v14];
    v20 = sub_23E8A1EE0();
    v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
    swift_bridgeObjectRetain();
    v21(v18, v19, v20);
    v22 = a3[11];
    v4[a3[10]] = a2[a3[10]];
    v4[v22] = a2[v22];
    v23 = a3[13];
    *(_QWORD *)&v4[a3[12]] = *(_QWORD *)&a2[a3[12]];
    *(_QWORD *)&v4[v23] = *(_QWORD *)&a2[v23];
    *(_QWORD *)&v4[a3[14]] = *(_QWORD *)&a2[a3[14]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for UtilityRateInfoSnapshot(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[5];
  v5 = sub_23E8A1D6C();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + a2[6], v5);
  v6(a1 + a2[7], v5);
  swift_bridgeObjectRelease();
  v7 = a1 + a2[9];
  v8 = sub_23E8A1EE0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for UtilityRateInfoSnapshot(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  uint64_t v22;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  v7 = a3[5];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_23E8A1D6C();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v11(&a1[a3[6]], &a2[a3[6]], v10);
  v11(&a1[a3[7]], &a2[a3[7]], v10);
  v12 = a3[8];
  v13 = a3[9];
  v14 = &a1[v12];
  v15 = &a2[v12];
  v16 = *((_QWORD *)v15 + 1);
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *((_QWORD *)v14 + 1) = v16;
  v17 = &a1[v13];
  v18 = &a2[v13];
  v19 = sub_23E8A1EE0();
  v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
  swift_bridgeObjectRetain();
  v20(v17, v18, v19);
  v21 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  a1[v21] = a2[v21];
  v22 = a3[13];
  *(_QWORD *)&a1[a3[12]] = *(_QWORD *)&a2[a3[12]];
  *(_QWORD *)&a1[v22] = *(_QWORD *)&a2[v22];
  *(_QWORD *)&a1[a3[14]] = *(_QWORD *)&a2[a3[14]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for UtilityRateInfoSnapshot(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23E8A1D6C();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  v10(&a1[a3[7]], &a2[a3[7]], v9);
  v11 = a3[8];
  v12 = &a1[v11];
  v13 = &a2[v11];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[9];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_23E8A1EE0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  a1[a3[10]] = a2[a3[10]];
  a1[a3[11]] = a2[a3[11]];
  *(_QWORD *)&a1[a3[12]] = *(_QWORD *)&a2[a3[12]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[13]] = *(_QWORD *)&a2[a3[13]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[14]] = *(_QWORD *)&a2[a3[14]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for UtilityRateInfoSnapshot(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23E8A1D6C();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  v10(&a1[a3[7]], &a2[a3[7]], v9);
  v11 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = sub_23E8A1EE0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  v15 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  a1[v15] = a2[v15];
  v16 = a3[13];
  *(_QWORD *)&a1[a3[12]] = *(_QWORD *)&a2[a3[12]];
  *(_QWORD *)&a1[v16] = *(_QWORD *)&a2[v16];
  *(_QWORD *)&a1[a3[14]] = *(_QWORD *)&a2[a3[14]];
  return a1;
}

char *assignWithTake for UtilityRateInfoSnapshot(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_23E8A1D6C();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(&a1[a3[6]], &a2[a3[6]], v10);
  v11(&a1[a3[7]], &a2[a3[7]], v10);
  v12 = a3[8];
  v13 = &a1[v12];
  v14 = (uint64_t *)&a2[v12];
  v16 = *v14;
  v15 = v14[1];
  *(_QWORD *)v13 = v16;
  *((_QWORD *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  v17 = a3[9];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = sub_23E8A1EE0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  v21 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  a1[v21] = a2[v21];
  *(_QWORD *)&a1[a3[12]] = *(_QWORD *)&a2[a3[12]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[13]] = *(_QWORD *)&a2[a3[13]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[14]] = *(_QWORD *)&a2[a3[14]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UtilityRateInfoSnapshot()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E89AF10(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v6 = sub_23E8A1D6C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = sub_23E8A1EE0();
    v7 = *(_QWORD *)(v8 - 8);
    v9 = a3[9];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = *(_QWORD *)(a1 + a3[8] + 8);
  if (v10 >= 0xFFFFFFFF)
    LODWORD(v10) = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for UtilityRateInfoSnapshot()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E89AFC4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = sub_23E8A1D6C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[5];
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + a4[8] + 8) = (a2 - 1);
      return result;
    }
    v10 = sub_23E8A1EE0();
    v9 = *(_QWORD *)(v10 - 8);
    v11 = a4[9];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
}

uint64_t sub_23E89B068()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23E8A1D6C();
  if (v1 <= 0x3F)
  {
    result = sub_23E8A1EE0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for UtilityRateInfoError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E89B174 + 4 * byte_23E8AB484[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23E89B1A8 + 4 * byte_23E8AB47F[v4]))();
}

uint64_t sub_23E89B1A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E89B1B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E89B1B8);
  return result;
}

uint64_t sub_23E89B1C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E89B1CCLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23E89B1D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E89B1D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UtilityRateInfoError()
{
  return &type metadata for UtilityRateInfoError;
}

uint64_t sub_23E89B1F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23E8A3D40();
  __break(1u);
  return result;
}

char *sub_23E89B2E4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23E8A3D40();
  __break(1u);
  return result;
}

uint64_t sub_23E89B3CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
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
  result = sub_23E8A3D40();
  __break(1u);
  return result;
}

unint64_t sub_23E89B4E4()
{
  unint64_t result;

  result = qword_256D98900;
  if (!qword_256D98900)
  {
    result = MEMORY[0x242655328](&protocol conformance descriptor for UtilityRateInfoError, &type metadata for UtilityRateInfoError);
    atomic_store(result, (unint64_t *)&qword_256D98900);
  }
  return result;
}

uint64_t sub_23E89B528(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t static EnergyWindowsContext.mockContext(_:)()
{
  return swift_allocObject();
}

uint64_t static EnergyWindowsContext.mockDoubleContext(_:secondType:)()
{
  return swift_allocObject();
}

uint64_t EnergyWindowsContext.reload()()
{
  return swift_task_switch();
}

uint64_t sub_23E89B59C()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_25433A9C0 != -1)
    swift_once();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23E75BEC4;
  return EnergyWindowsModelsManager.reload()();
}

uint64_t EnergyWindowsContext.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t EnergyWindowsContext.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t static EnergyWindowsContext.getContextForCurrentLocation()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23E89B644()
{
  uint64_t v0;

  if (qword_25433A9C0 != -1)
    swift_once();
  *(_QWORD *)(v0 + 24) = qword_25433A9B8;
  return swift_task_switch();
}

uint64_t sub_23E89B6A8()
{
  uint64_t v0;
  uint64_t v1;

  EnergyWindowsModelsManager.updateLocationModel()();
  v1 = swift_allocObject();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t static EnergyWindowsContext.getContextFor(home:secondModelLocation:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23E89B704()
{
  uint64_t v0;

  if (qword_25433A9C0 != -1)
    swift_once();
  *(_QWORD *)(v0 + 40) = qword_25433A9B8;
  return swift_task_switch();
}

uint64_t sub_23E89B768@<X0>(uint64_t a1@<X0>, CLLocation_optional a2@<0:X1, 8:X2, 16:W3.1>)
{
  uint64_t v2;
  uint64_t v3;

  a2.value.super.isa = *(Class *)(v2 + 24);
  EnergyWindowsModelsManager.updateModels(home:secondModelLocation:)(*(HMHome *)(v2 + 16), a2);
  v3 = swift_allocObject();
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v3);
}

uint64_t static EnergyWindowsContext.errorContext(_:)()
{
  return swift_allocObject();
}

uint64_t method lookup function for EnergyWindowsContext()
{
  return swift_lookUpClassMethod();
}

ValueMetadata *type metadata accessor for EnergyForecastViewMetrics()
{
  return &type metadata for EnergyForecastViewMetrics;
}

uint64_t *sub_23E89B7D8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23E8A1FAC();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = a3[5];
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_23E8A1D6C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    v15 = a3[7];
    *(uint64_t *)((char *)a1 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *((_BYTE *)a1 + v15) = *((_BYTE *)a2 + v15);
    v16 = a3[9];
    *(uint64_t *)((char *)a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    v17 = (uint64_t *)((char *)a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADD8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_23E8A2780();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v20 = a3[10];
    v21 = (uint64_t *)((char *)a1 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v23 = sub_23E8A3800();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
    }
    else
    {
      *v21 = *v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23E89B9EC(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = sub_23E8A1FAC();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v6 = a1 + a2[5];
  v7 = sub_23E8A1D6C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = a1 + a2[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADD8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_23E8A2780();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  v10 = a1 + a2[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADB8);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v11 = sub_23E8A3800();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
}

char *sub_23E89BB14(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v6 = sub_23E8A1FAC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_23E8A1D6C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  v13 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  a1[v13] = a2[v13];
  v14 = a3[9];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  v15 = &a1[v14];
  v16 = &a2[v14];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADD8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v17 = sub_23E8A2780();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  }
  else
  {
    *(_QWORD *)v15 = *(_QWORD *)v16;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v18 = a3[10];
  v19 = &a1[v18];
  v20 = &a2[v18];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v21 = sub_23E8A3800();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
  }
  else
  {
    *(_QWORD *)v19 = *(_QWORD *)v20;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *sub_23E89BCFC(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;

  v6 = sub_23E8A1FAC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_23E8A1D6C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  a1[a3[7]] = a2[a3[7]];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  if (a1 != a2)
  {
    v16 = a3[9];
    v17 = &a1[v16];
    v18 = &a2[v16];
    sub_23E75496C((uint64_t)&a1[v16], &qword_25433ADD8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADD8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_23E8A2780();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *(_QWORD *)v17 = *(_QWORD *)v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v20 = a3[10];
    v21 = &a1[v20];
    v22 = &a2[v20];
    sub_23E75496C((uint64_t)&a1[v20], &qword_25433ADB8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v23 = sub_23E8A3800();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
    }
    else
    {
      *(_QWORD *)v21 = *(_QWORD *)v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_23E89BF60(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = sub_23E8A1FAC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_23E8A1D6C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  a1[v13] = a2[v13];
  v14 = a3[9];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADD8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = sub_23E8A2780();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v15, v16, v18);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  v19 = a3[10];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v23 = sub_23E8A3800();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v20, v21, v23);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  return a1;
}

char *sub_23E89C148(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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

  v6 = sub_23E8A1FAC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_23E8A1D6C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  a1[v16] = a2[v16];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  if (a1 != a2)
  {
    v17 = a3[9];
    v18 = &a1[v17];
    v19 = &a2[v17];
    sub_23E75496C((uint64_t)&a1[v17], &qword_25433ADD8);
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADD8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v21 = sub_23E8A2780();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v18, v19, v21);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    v22 = a3[10];
    v23 = &a1[v22];
    v24 = &a2[v22];
    sub_23E75496C((uint64_t)&a1[v22], &qword_25433ADB8);
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v26 = sub_23E8A3800();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v23, v24, v26);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_23E89C3A8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E89C3B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = sub_23E8A1D6C();
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  if ((_DWORD)a2 != 254)
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AE00);
    v10 = *(_QWORD *)(v14 - 8);
    if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
    {
      v11 = v14;
      v12 = a3[9];
    }
    else
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D94110);
      v10 = *(_QWORD *)(v11 - 8);
      v12 = a3[10];
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  v13 = *(unsigned __int8 *)(a1 + a3[7]);
  if (v13 >= 2)
    return ((v13 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_23E89C4BC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E89C4C8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = sub_23E8A1D6C();
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 254)
      {
        *(_BYTE *)(a1 + a4[7]) = a2 + 1;
        return result;
      }
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AE00);
      v14 = *(_QWORD *)(v16 - 8);
      if (*(_DWORD *)(v14 + 84) == a3)
      {
        v10 = v16;
        v15 = a4[9];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D94110);
        v14 = *(_QWORD *)(v10 - 8);
        v15 = a4[10];
      }
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for EnergyForecastChart()
{
  uint64_t result;

  result = qword_25433A988;
  if (!qword_25433A988)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23E89C5F8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_23E76641C(319, (unint64_t *)&unk_25433AC08, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F2B0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
  {
    sub_23E8A1D6C();
    if (v1 <= 0x3F)
    {
      sub_23E76641C(319, &qword_25433ADE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
      if (v2 <= 0x3F)
      {
        sub_23E76641C(319, (unint64_t *)&qword_25433ADC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDFADE0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_23E89C714()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_23E89C724(void (*a1)(_QWORD), uint64_t a2, uint64_t a3)
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
  unint64_t v18;
  unint64_t v19;
  _QWORD v21[2];
  void (*v22)(_QWORD);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AA80);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for FeaturedInterval(0);
  v9 = *(_QWORD *)(v26 - 8);
  v10 = MEMORY[0x24BDAC7A8](v26);
  v25 = (uint64_t)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v23 = (uint64_t)v21 - v12;
  v13 = *(_QWORD *)(a3 + 16);
  if (!v13)
    return MEMORY[0x24BEE4AF8];
  v14 = *(_QWORD *)(sub_23E8A1F7C() - 8);
  v15 = a3 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
  v24 = *(_QWORD *)(v14 + 72);
  v21[1] = a3;
  swift_bridgeObjectRetain();
  v16 = MEMORY[0x24BEE4AF8];
  v22 = a1;
  do
  {
    a1(v15);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v16;
    }
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v26) == 1)
    {
      sub_23E75496C((uint64_t)v8, &qword_25433AA80);
    }
    else
    {
      v17 = v23;
      sub_23E7643FC((uint64_t)v8, v23, type metadata accessor for FeaturedInterval);
      sub_23E7643FC(v17, v25, type metadata accessor for FeaturedInterval);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v16 = sub_23E896648(0, *(_QWORD *)(v16 + 16) + 1, 1, v16);
      v19 = *(_QWORD *)(v16 + 16);
      v18 = *(_QWORD *)(v16 + 24);
      if (v19 >= v18 >> 1)
        v16 = sub_23E896648(v18 > 1, v19 + 1, 1, v16);
      *(_QWORD *)(v16 + 16) = v19 + 1;
      sub_23E7643FC(v25, v16+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v19, type metadata accessor for FeaturedInterval);
      a1 = v22;
    }
    v15 += v24;
    --v13;
  }
  while (v13);
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_23E89C990@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X1>, _BYTE *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
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
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  int v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t, uint64_t);
  int v48;
  _BYTE *v49;
  uint64_t v50;
  void (*v51)(_BYTE *, uint64_t, uint64_t);
  uint64_t v52;
  void (*v53)(_BYTE *, uint64_t);
  char v54;
  uint64_t v55;
  void (*v56)(_BYTE *, uint64_t);
  _BYTE *v57;
  _BYTE *v58;
  char v59;
  _BYTE *v60;
  void (*v61)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v62;
  void (*v63)(_BYTE *, uint64_t);
  uint64_t v64;
  char v66;
  _BYTE *v67;
  _BYTE *v68;
  _BYTE *v69;
  _BYTE *v70;
  _BYTE *v71;
  void *v72;
  char **v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _BYTE *v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  void (*v90)(_BYTE *, uint64_t);
  _BYTE *v91;
  uint64_t v92;
  _BYTE v93[12];
  int v94;
  uint64_t v95;
  uint64_t v96;
  int *v97;
  uint64_t v98;
  int v99;
  _BYTE *v100;
  _BYTE *v101;
  _BYTE *v102;
  _BYTE *v103;
  _BYTE *v104;
  _BYTE *v105;
  _BYTE *v106;
  _BYTE *v107;
  uint64_t v108;
  uint64_t v109;
  _BYTE *v110;
  _BYTE *v111;
  uint64_t v112;
  _BYTE *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119[3];

  v99 = a4;
  v101 = a3;
  v103 = a2;
  v116 = a5;
  v6 = (int *)type metadata accessor for FeaturedInterval(0);
  v112 = *((_QWORD *)v6 - 1);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = &v93[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7);
  v105 = &v93[-v10];
  v11 = sub_23E8A1FC4();
  v108 = *(_QWORD *)(v11 - 8);
  v109 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v106 = &v93[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v12);
  v107 = &v93[-v14];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433A8D8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = &v93[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v16);
  v111 = &v93[-v19];
  v20 = sub_23E8A1D6C();
  v21 = *(_QWORD *)(v20 - 8);
  v114 = v20;
  v115 = v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v102 = &v93[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v24 = MEMORY[0x24BDAC7A8](v22);
  v104 = &v93[-v25];
  v26 = MEMORY[0x24BDAC7A8](v24);
  v110 = &v93[-v27];
  MEMORY[0x24BDAC7A8](v26);
  v113 = &v93[-v28];
  v29 = sub_23E8A1F7C();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v32 = &v93[-((v31 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_25433AC48 != -1)
    swift_once();
  v33 = sub_23E8A22C4();
  v34 = __swift_project_value_buffer(v33, (uint64_t)qword_25433AC30);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v30 + 16))(v32, a1, v29);
  v98 = v34;
  v35 = sub_23E8A22AC();
  v36 = sub_23E8A3B24();
  v37 = v36;
  v38 = os_log_type_enabled(v35, v36);
  v100 = v9;
  if (v38)
  {
    v39 = swift_slowAlloc();
    v96 = a1;
    v40 = v39;
    v95 = swift_slowAlloc();
    v119[0] = v95;
    *(_DWORD *)v40 = 136315394;
    v94 = v37;
    v117 = sub_23E755DA4(0xD000000000000041, 0x800000023E8B50F0, v119);
    v97 = v6;
    sub_23E8A3BF0();
    *(_WORD *)(v40 + 12) = 2080;
    v41 = EnergyWindow.description.getter();
    v117 = sub_23E755DA4(v41, v42, v119);
    v6 = v97;
    sub_23E8A3BF0();
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v30 + 8))(v32, v29);
    _os_log_impl(&dword_23E74F000, v35, (os_log_type_t)v94, "\t%s Checking energyInterval: %s", (uint8_t *)v40, 0x16u);
    v43 = v95;
    swift_arrayDestroy();
    MEMORY[0x2426553D0](v43, -1, -1);
    MEMORY[0x2426553D0](v40, -1, -1);
  }
  else
  {
    (*(void (**)(_BYTE *, uint64_t))(v30 + 8))(v32, v29);
  }

  v44 = (uint64_t)v111;
  sub_23E8A1F70();
  v46 = v114;
  v45 = v115;
  v47 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v115 + 48);
  v48 = v47(v44, 1, v114);
  v49 = v113;
  if (v48 == 1)
  {
    sub_23E75496C(v44, &qword_25433A8D8);
LABEL_18:
    v64 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v112 + 56))(v116, v64, 1, v6);
  }
  v50 = v44;
  v51 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v45 + 32);
  v51(v113, v50, v46);
  sub_23E8A1F64();
  if (v47((uint64_t)v18, 1, v46) == 1)
  {
    (*(void (**)(_BYTE *, uint64_t))(v45 + 8))(v49, v46);
    sub_23E75496C((uint64_t)v18, &qword_25433A8D8);
    goto LABEL_18;
  }
  v51(v110, (uint64_t)v18, v46);
  sub_23E8A1F58();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v108 + 104))(v106, *MEMORY[0x24BE4F2D8], v109);
  sub_23E7518F4(&qword_25433AC20, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F2E8], MEMORY[0x24BE4F2F0]);
  sub_23E8A39EC();
  sub_23E8A39EC();
  if (v119[0] == v117 && v119[1] == v118)
  {
    swift_bridgeObjectRelease_n();
    v52 = v109;
    v53 = *(void (**)(_BYTE *, uint64_t))(v108 + 8);
    v53(v106, v109);
    v53(v107, v52);
  }
  else
  {
    v54 = sub_23E8A3D88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v55 = v109;
    v56 = *(void (**)(_BYTE *, uint64_t))(v108 + 8);
    v56(v106, v109);
    v56(v107, v55);
    if ((v54 & 1) == 0)
    {
LABEL_17:
      v63 = *(void (**)(_BYTE *, uint64_t))(v45 + 8);
      v63(v110, v46);
      v63(v49, v46);
      goto LABEL_18;
    }
  }
  v57 = v103;
  if ((sub_23E8A1CC4() & 1) == 0)
    goto LABEL_17;
  v58 = v101;
  v59 = sub_23E8A1CC4();
  v60 = v110;
  if ((v59 & 1) != 0)
  {
    v61 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v45 + 16);
    v61(v104, v58, v46);
    v62 = v102;
  }
  else
  {
    v66 = sub_23E8A1CB8();
    v67 = v57;
    v61 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v45 + 16);
    v62 = v102;
    if ((v66 & 1) != 0)
    {
      v68 = v104;
    }
    else
    {
      v68 = v104;
      v67 = v49;
    }
    v61(v68, v67, v46);
    v58 = v101;
  }
  if ((sub_23E8A1CC4() & 1) != 0)
  {
    v69 = v62;
    v70 = v58;
  }
  else
  {
    v71 = v103;
    if ((sub_23E8A1CB8() & 1) != 0)
    {
      v69 = v62;
      v70 = v71;
    }
    else
    {
      v69 = v62;
      v70 = v60;
    }
  }
  v61(v69, v70, v46);
  v72 = (void *)objc_opt_self();
  v73 = &selRef_systemBlackColor;
  if ((v99 & 1) == 0)
    v73 = &selRef_systemWhiteColor;
  v74 = MEMORY[0x2426541DC](objc_msgSend(v72, *v73));
  v61(v105, v104, v46);
  sub_23E8A1C10();
  v76 = v75;
  if (qword_25433B270 != -1)
    swift_once();
  v77 = qword_25433D7B0;
  v78 = qword_25433B248;
  swift_retain();
  swift_retain();
  if (v78 != -1)
    swift_once();
  v119[0] = qword_25433D788;
  swift_retain();
  v79 = sub_23E8A28AC();
  v80 = v105;
  *(_QWORD *)&v105[v6[6]] = 0x4020000000000000;
  sub_23E8A1D9C();
  *(_QWORD *)&v80[v6[5]] = v76;
  *(_QWORD *)&v80[v6[7]] = v77;
  *(_QWORD *)&v80[v6[8]] = v74;
  v80[v6[9]] = 1;
  *(_QWORD *)&v80[v6[10]] = v79;
  v80[v6[11]] = 0;
  v80[v6[12]] = 0;
  v81 = (uint64_t)v100;
  sub_23E754CE8((uint64_t)v80, (uint64_t)v100, type metadata accessor for FeaturedInterval);
  v82 = sub_23E8A22AC();
  v83 = sub_23E8A3B24();
  if (os_log_type_enabled(v82, v83))
  {
    v84 = swift_slowAlloc();
    v111 = (_BYTE *)v74;
    v85 = v84;
    v86 = swift_slowAlloc();
    v119[0] = v86;
    *(_DWORD *)v85 = 136315394;
    v117 = sub_23E755DA4(0xD000000000000041, 0x800000023E8B50F0, v119);
    sub_23E8A3BF0();
    *(_WORD *)(v85 + 12) = 2080;
    v87 = sub_23E84C910();
    v117 = sub_23E755DA4(v87, v88, v119);
    sub_23E8A3BF0();
    swift_bridgeObjectRelease();
    sub_23E75BF0C(v81, type metadata accessor for FeaturedInterval);
    _os_log_impl(&dword_23E74F000, v82, v83, "\t\t%s made %s", (uint8_t *)v85, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2426553D0](v86, -1, -1);
    MEMORY[0x2426553D0](v85, -1, -1);
    swift_release();

    v89 = v114;
    v90 = *(void (**)(_BYTE *, uint64_t))(v115 + 8);
    v90(v102, v114);
    v90(v104, v89);
    v90(v110, v89);
    v91 = v113;
    v92 = v89;
  }
  else
  {

    sub_23E75BF0C(v81, type metadata accessor for FeaturedInterval);
    swift_release();
    v90 = *(void (**)(_BYTE *, uint64_t))(v115 + 8);
    v90(v102, v46);
    v90(v104, v46);
    v90(v110, v46);
    v91 = v49;
    v92 = v46;
  }
  v90(v91, v92);
  sub_23E7643FC((uint64_t)v105, v116, type metadata accessor for FeaturedInterval);
  v64 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v112 + 56))(v116, v64, 1, v6);
}

double sub_23E89D410@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
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
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  _BOOL4 v36;
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t, _BYTE *, uint64_t);
  uint64_t v45;
  NSObject *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  unint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t);
  unint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  _BYTE *v70;
  uint64_t v71;
  unint64_t v72;
  os_log_t v73;
  _BYTE *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE *v79;
  _BYTE *v80;
  NSObject *v81;
  os_log_type_t v82;
  _BOOL4 v83;
  uint64_t v84;
  uint64_t v85;
  _BYTE *v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
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
  void (*v108)(uint64_t, uint64_t);
  uint64_t v109;
  int *v110;
  uint64_t *v111;
  uint64_t *v112;
  uint64_t *v113;
  uint64_t v114;
  double result;
  __int128 v116;
  _BYTE v117[4];
  int v118;
  os_log_t v119;
  _BYTE *v120;
  uint64_t v121;
  _BYTE *v122;
  void (*v123)(uint64_t, uint64_t);
  _BYTE *v124;
  void (*v125)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  int v131;
  int v132;
  int v133;
  uint64_t v134;
  _BYTE *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  _BYTE *v139;
  _BYTE *v140;
  uint64_t v141;
  _OWORD v142[2];
  uint64_t v143;

  v131 = a5;
  v132 = a6;
  v133 = a4;
  v129 = a7;
  v128 = sub_23E8A1FC4();
  v127 = *(_QWORD *)(v128 - 8);
  MEMORY[0x24BDAC7A8](v128);
  v126 = &v117[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v124 = &v117[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = MEMORY[0x24BDAC7A8](v12);
  v122 = &v117[-v15];
  MEMORY[0x24BDAC7A8](v14);
  v123 = (void (*)(uint64_t, uint64_t))&v117[-v16];
  v17 = sub_23E8A1D6C();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v135 = &v117[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = &v117[-v22];
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = &v117[-v25];
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = &v117[-v28];
  MEMORY[0x24BDAC7A8](v27);
  v31 = &v117[-v30];
  v130 = a3;
  sub_23E89E120(a3, a1, (uint64_t)&v117[-v30]);
  sub_23E8A20E4();
  v139 = v29;
  v140 = v31;
  sub_23E8A1C40();
  if (qword_25433AC48 != -1)
    swift_once();
  v134 = (uint64_t)v26;
  v32 = sub_23E8A22C4();
  v33 = __swift_project_value_buffer(v32, (uint64_t)qword_25433AC30);
  v34 = sub_23E8A22AC();
  v35 = sub_23E8A3B24();
  v36 = os_log_type_enabled(v34, v35);
  v137 = a1;
  v138 = v17;
  v136 = v18;
  if (v36)
  {
    v37 = swift_slowAlloc();
    v38 = v23;
    v39 = v33;
    v40 = swift_slowAlloc();
    *(_QWORD *)&v142[0] = v40;
    *(_DWORD *)v37 = 136315394;
    v141 = sub_23E755DA4(0xD000000000000064, 0x800000023E8B5080, (uint64_t *)v142);
    a1 = v137;
    sub_23E8A3BF0();
    *(_WORD *)(v37 + 12) = 2048;
    v141 = a2;
    v17 = v138;
    sub_23E8A3BF0();
    _os_log_impl(&dword_23E74F000, v34, v35, "%s Showing a %ld-hour chart", (uint8_t *)v37, 0x16u);
    swift_arrayDestroy();
    v41 = v40;
    v33 = v39;
    v23 = v38;
    MEMORY[0x2426553D0](v41, -1, -1);
    v42 = v37;
    v18 = v136;
    MEMORY[0x2426553D0](v42, -1, -1);
  }

  v43 = v123;
  sub_23E753FC4(a1, (uint64_t)v123, &qword_25433AC00);
  v44 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v18 + 16);
  v45 = v134;
  v44(v134, v140, v17);
  v125 = (void (*)(_BYTE *, _BYTE *, uint64_t))v44;
  v44((uint64_t)v23, v139, v17);
  v46 = sub_23E8A22AC();
  v47 = sub_23E8A3B48();
  if (os_log_type_enabled(v46, (os_log_type_t)v47))
  {
    v118 = v47;
    v119 = v46;
    v121 = v33;
    v48 = swift_slowAlloc();
    v49 = swift_slowAlloc();
    *(_QWORD *)&v142[0] = v49;
    *(_DWORD *)v48 = 136316162;
    v141 = sub_23E755DA4(0xD000000000000064, 0x800000023E8B5080, (uint64_t *)v142);
    sub_23E8A3BF0();
    *(_WORD *)(v48 + 12) = 2080;
    v50 = v122;
    sub_23E753FC4((uint64_t)v43, (uint64_t)v122, &qword_25433AC00);
    v51 = sub_23E8A1FAC();
    v52 = *(_QWORD *)(v51 - 8);
    v53 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v52 + 48))(v50, 1, v51);
    v120 = v23;
    if (v53 == 1)
    {
      sub_23E75496C((uint64_t)v50, &qword_25433AC00);
      v54 = 0xE700000000000000;
      v55 = 0x3E5954504D453CLL;
    }
    else
    {
      v55 = EnergyWindows.description.getter();
      v54 = v57;
      (*(void (**)(_BYTE *, uint64_t))(v52 + 8))(v50, v51);
    }
    v141 = sub_23E755DA4(v55, v54, (uint64_t *)v142);
    sub_23E8A3BF0();
    swift_bridgeObjectRelease();
    sub_23E75496C((uint64_t)v43, &qword_25433AC00);
    *(_WORD *)(v48 + 22) = 2080;
    v58 = v127;
    v59 = v126;
    v60 = v128;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v127 + 104))(v126, *MEMORY[0x24BE4F2D8], v128);
    v61 = sub_23E8A1FB8();
    v63 = v62;
    (*(void (**)(_BYTE *, uint64_t))(v58 + 8))(v59, v60);
    v141 = sub_23E755DA4(v61, v63, (uint64_t *)v142);
    sub_23E8A3BF0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v48 + 32) = 2080;
    v64 = v134;
    v65 = sub_23E8A1D48();
    v141 = sub_23E755DA4(v65, v66, (uint64_t *)v142);
    sub_23E8A3BF0();
    swift_bridgeObjectRelease();
    v67 = *(void (**)(uint64_t, uint64_t))(v136 + 8);
    v68 = v64;
    v69 = v138;
    v67(v68, v138);
    *(_WORD *)(v48 + 42) = 2080;
    v70 = v120;
    v71 = sub_23E8A1D48();
    v141 = sub_23E755DA4(v71, v72, (uint64_t *)v142);
    sub_23E8A3BF0();
    swift_bridgeObjectRelease();
    v123 = v67;
    v67((uint64_t)v70, v69);
    v73 = v119;
    _os_log_impl(&dword_23E74F000, v119, (os_log_type_t)v118, "--Start: %s energyWindows: %s, making chart featuring %s hours from %s to %s", (uint8_t *)v48, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x2426553D0](v49, -1, -1);
    MEMORY[0x2426553D0](v48, -1, -1);

    a1 = v137;
  }
  else
  {
    sub_23E75496C((uint64_t)v43, &qword_25433AC00);
    v56 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v56(v45, v17);
    v123 = v56;
    v56((uint64_t)v23, v17);

  }
  v74 = v124;
  sub_23E753FC4(a1, (uint64_t)v124, &qword_25433AC00);
  v75 = sub_23E8A1FAC();
  v76 = *(_QWORD *)(v75 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v76 + 48))(v74, 1, v75) == 1)
  {
    sub_23E75496C((uint64_t)v74, &qword_25433AC00);
  }
  else
  {
    v77 = sub_23E8A1FA0();
    v78 = (*(uint64_t (**)(_BYTE *, uint64_t))(v76 + 8))(v74, v75);
    if (v77)
    {
      MEMORY[0x24BDAC7A8](v78);
      v79 = v140;
      *(_QWORD *)&v117[-32] = v139;
      *(_QWORD *)&v117[-24] = v79;
      v117[-16] = v133 & 1;
      v80 = (_BYTE *)sub_23E89C724((void (*)(_QWORD))sub_23E89EBE0, (uint64_t)&v117[-48], v77);
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
  }
  v80 = (_BYTE *)MEMORY[0x24BEE4AF8];
LABEL_16:
  swift_bridgeObjectRetain();
  v81 = sub_23E8A22AC();
  v82 = sub_23E8A3B24();
  v83 = os_log_type_enabled(v81, v82);
  v124 = v80;
  if (v83)
  {
    v84 = swift_slowAlloc();
    v134 = swift_slowAlloc();
    *(_QWORD *)&v142[0] = v134;
    *(_DWORD *)v84 = 136315650;
    v141 = sub_23E755DA4(0xD000000000000064, 0x800000023E8B5080, (uint64_t *)v142);
    sub_23E8A3BF0();
    *(_WORD *)(v84 + 12) = 2048;
    v141 = *((_QWORD *)v80 + 2);
    sub_23E8A3BF0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v84 + 22) = 2080;
    v85 = v127;
    v86 = v126;
    v87 = v128;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v127 + 104))(v126, *MEMORY[0x24BE4F2D8], v128);
    v88 = sub_23E8A1FB8();
    v90 = v89;
    (*(void (**)(_BYTE *, uint64_t))(v85 + 8))(v86, v87);
    v141 = sub_23E755DA4(v88, v90, (uint64_t *)v142);
    sub_23E8A3BF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23E74F000, v81, v82, "--End: %s Found %ld %s energyIntervals", (uint8_t *)v84, 0x20u);
    v91 = v134;
    swift_arrayDestroy();
    MEMORY[0x2426553D0](v91, -1, -1);
    MEMORY[0x2426553D0](v84, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  v92 = v138;
  if ((v133 & 1) != 0)
  {
    if (qword_256D933E8 != -1)
      swift_once();
    v93 = &qword_256D9D8B8;
  }
  else
  {
    if (qword_25433B258 != -1)
      swift_once();
    v93 = &qword_25433D798;
  }
  v94 = *v93;
  swift_retain();
  v125(v135, v140, v92);
  sub_23E8A1C10();
  v96 = v95;
  if (qword_25433B250 != -1)
    swift_once();
  *(_QWORD *)&v142[0] = qword_25433D790;
  swift_retain();
  v134 = sub_23E8A28AC();
  if (qword_25433AA88 != -1)
    swift_once();
  v98 = qword_25433D750;
  v97 = *(_QWORD *)algn_25433D758;
  v99 = qword_25433AA68;
  swift_bridgeObjectRetain();
  if (v99 != -1)
    swift_once();
  v101 = qword_25433D740;
  v100 = *(_QWORD *)algn_25433D748;
  v102 = qword_25433ABD8;
  swift_bridgeObjectRetain();
  if (v102 != -1)
    swift_once();
  v103 = qword_25433D778;
  v104 = unk_25433D780;
  v105 = qword_25433B260;
  swift_bridgeObjectRetain();
  if (v105 != -1)
    swift_once();
  v106 = qword_25433D7A0;
  swift_retain();
  sub_23E8A27EC();
  sub_23E75496C(v130, &qword_25433A8D8);
  sub_23E75496C(v137, &qword_25433AC00);
  v107 = v138;
  v108 = v123;
  v123((uint64_t)v139, v138);
  v108((uint64_t)v140, v107);
  v109 = v129;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v136 + 32))(v129, v135, v107);
  v110 = (int *)type metadata accessor for FeaturedHoursInfo(0);
  *(_QWORD *)(v109 + v110[5]) = v96;
  *(_QWORD *)(v109 + v110[6]) = v124;
  *(_QWORD *)(v109 + v110[7]) = v134;
  v111 = (uint64_t *)(v109 + v110[8]);
  *v111 = v98;
  v111[1] = v97;
  v112 = (uint64_t *)(v109 + v110[9]);
  *v112 = v101;
  v112[1] = v100;
  v113 = (uint64_t *)(v109 + v110[10]);
  *v113 = v103;
  v113[1] = v104;
  *(_QWORD *)(v109 + v110[11]) = v106;
  *(_QWORD *)(v109 + v110[12]) = v94;
  v114 = v109 + v110[13];
  result = *(double *)v142;
  v116 = v142[1];
  *(_OWORD *)v114 = v142[0];
  *(_OWORD *)(v114 + 16) = v116;
  *(_QWORD *)(v114 + 32) = v143;
  *(_BYTE *)(v109 + v110[14]) = v131 & 1;
  *(_BYTE *)(v109 + v110[15]) = v132 & 1;
  return result;
}

uint64_t sub_23E89E120@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  unsigned int (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v44 = (void (*)(char *, char *, uint64_t))a2;
  v45 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25433ABE0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433A8D8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v42 - v14;
  v16 = sub_23E8A1D6C();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v42 - v21;
  sub_23E753FC4(a1, (uint64_t)v15, &qword_25433A8D8);
  v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
  if (v23(v15, 1, v16) == 1)
  {
    sub_23E75496C((uint64_t)v15, &qword_25433A8D8);
    sub_23E753FC4((uint64_t)v44, (uint64_t)v6, &qword_25433AC00);
    v24 = sub_23E8A1FAC();
    v25 = *(_QWORD *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v6, 1, v24) == 1)
    {
      v26 = &qword_25433AC00;
      v27 = (uint64_t)v6;
LABEL_16:
      sub_23E75496C(v27, v26);
      goto LABEL_17;
    }
    v36 = sub_23E8A1FA0();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v24);
    if (!v36)
    {
LABEL_17:
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v13, 1, 1, v16);
LABEL_18:
      sub_23E8A1D24();
      return sub_23E75496C((uint64_t)v13, &qword_25433A8D8);
    }
    v37 = *(_QWORD *)(v36 + 16);
    v38 = sub_23E8A1F7C();
    v39 = *(_QWORD *)(v38 - 8);
    if (v37)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v39 + 16))(v9, v36 + ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80)), v38);
      v40 = 0;
    }
    else
    {
      v40 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v9, v40, 1, v38);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v9, 1, v38) == 1)
    {
      v26 = (uint64_t *)&unk_25433ABE0;
      v27 = (uint64_t)v9;
      goto LABEL_16;
    }
    sub_23E8A1F70();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v9, v38);
    if (v23(v13, 1, v16) == 1)
      goto LABEL_18;
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v45, v13, v16);
  }
  else
  {
    v28 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v28(v22, v15, v16);
    if (qword_25433AC48 != -1)
      swift_once();
    v29 = sub_23E8A22C4();
    __swift_project_value_buffer(v29, (uint64_t)qword_25433AC30);
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v22, v16);
    v30 = sub_23E8A22AC();
    v31 = sub_23E8A3B48();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = swift_slowAlloc();
      v43 = swift_slowAlloc();
      v47 = v43;
      *(_DWORD *)v32 = 136315394;
      v44 = v28;
      v46 = sub_23E755DA4(0xD000000000000064, 0x800000023E8B5080, &v47);
      sub_23E8A3BF0();
      *(_WORD *)(v32 + 12) = 2080;
      v33 = sub_23E8A1D48();
      v46 = sub_23E755DA4(v33, v34, &v47);
      v28 = v44;
      sub_23E8A3BF0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
      _os_log_impl(&dword_23E74F000, v30, v31, "FeaturedHoursInfo:%s starting at given time: %s", (uint8_t *)v32, 0x16u);
      v35 = v43;
      swift_arrayDestroy();
      MEMORY[0x2426553D0](v35, -1, -1);
      MEMORY[0x2426553D0](v32, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    }

    return ((uint64_t (*)(uint64_t, char *, uint64_t))v28)(v45, v22, v16);
  }
}

uint64_t sub_23E89E614@<X0>(uint64_t a1@<X8>)
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
  char *v14;
  uint64_t v15;
  char *v16;
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
  char *v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  char *v36;
  void (*v37)(char *, uint64_t);
  char *v38;
  uint64_t v39;
  int v40;
  int *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v2 = v1;
  v65 = a1;
  v3 = sub_23E8A2F48();
  v61 = *(_QWORD *)(v3 - 8);
  v62 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v60 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = type metadata accessor for FeaturedHoursChart(0);
  MEMORY[0x24BDAC7A8](v58);
  v59 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AEB8);
  MEMORY[0x24BDAC7A8](v64);
  v63 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23E8A3800();
  v56 = *(_QWORD *)(v7 - 8);
  v57 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v55 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v54 = (uint64_t)&v50 - v10;
  v11 = sub_23E8A2780();
  v52 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v50 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433A8D8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AC00);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = v22;
  v23 = type metadata accessor for FeaturedHoursInfo(0);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v53 = (uint64_t)&v50 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v50 - v26;
  sub_23E753FC4(v1, (uint64_t)v22, &qword_25433AC00);
  v28 = (int *)type metadata accessor for EnergyForecastChart();
  v29 = v28[5];
  v50 = *(_QWORD *)(v1 + v28[6]);
  v30 = v1 + v29;
  v31 = sub_23E8A1D6C();
  v32 = *(_QWORD *)(v31 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v19, v30, v31);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v19, 0, 1, v31);
  sub_23E7BB86C((uint64_t)v16);
  v33 = v52;
  (*(void (**)(char *, _QWORD, uint64_t))(v52 + 104))(v14, *MEMORY[0x24BDEB3F0], v11);
  LOBYTE(v31) = sub_23E8A2774();
  v34 = *(void (**)(char *, uint64_t))(v33 + 8);
  v34(v14, v11);
  v34(v16, v11);
  LODWORD(v14) = *(unsigned __int8 *)(v2 + v28[7]);
  v35 = v54;
  sub_23E7BB89C(v54);
  v36 = v55;
  sub_23E8A37F4();
  LOBYTE(v34) = sub_23E8A37E8();
  v37 = *(void (**)(char *, uint64_t))(v56 + 8);
  v38 = v36;
  v39 = v57;
  v37(v38, v57);
  v37((char *)v35, v39);
  v40 = (int)v14;
  v41 = (int *)v58;
  v42 = (uint64_t)v59;
  sub_23E89D410((uint64_t)v51, v50, (uint64_t)v19, v31 & 1, v40, v34 & 1, (uint64_t)v27);
  v43 = v53;
  sub_23E754CE8((uint64_t)v27, v53, type metadata accessor for FeaturedHoursInfo);
  *(_QWORD *)(v42 + v41[5]) = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25433ADF0);
  swift_storeEnumTagMultiPayload();
  sub_23E7643FC(v43, v42, type metadata accessor for FeaturedHoursInfo);
  *(_BYTE *)(v42 + v41[6]) = 0;
  v67 = 0x3FF0000000000000;
  (*(void (**)(char *, _QWORD, uint64_t))(v61 + 104))(v60, *MEMORY[0x24BDF1878], v62);
  sub_23E77BB20();
  sub_23E8A281C();
  v44 = (uint64_t *)(v42 + v41[8]);
  v66 = 0;
  sub_23E8A3314();
  v45 = v68;
  *v44 = v67;
  v44[1] = v45;
  v46 = (uint64_t *)(v42 + v41[9]);
  v66 = 0;
  sub_23E8A3314();
  v47 = v68;
  *v46 = v67;
  v46[1] = v47;
  if (qword_25433AB20 != -1)
    swift_once();
  v67 = qword_25433D768;
  v68 = unk_25433D770;
  sub_23E7518F4(&qword_25433AAB8, type metadata accessor for FeaturedHoursChart, (uint64_t)&protocol conformance descriptor for FeaturedHoursChart);
  sub_23E7573F0();
  v48 = (uint64_t)v63;
  sub_23E8A3140();
  sub_23E75BF0C(v42, type metadata accessor for FeaturedHoursChart);
  sub_23E8A29D8();
  sub_23E75496C(v48, &qword_25433AEB8);
  return sub_23E75BF0C((uint64_t)v27, type metadata accessor for FeaturedHoursInfo);
}

uint64_t sub_23E89EBE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23E89C990(a1, *(_BYTE **)(v2 + 16), *(_BYTE **)(v2 + 24), *(unsigned __int8 *)(v2 + 32), a2);
}

unint64_t sub_23E89EC00()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25433AEB0;
  if (!qword_25433AEB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25433AEB8);
    v2[0] = sub_23E7518F4(&qword_25433AAB8, type metadata accessor for FeaturedHoursChart, (uint64_t)&protocol conformance descriptor for FeaturedHoursChart);
    v2[1] = sub_23E7518F4((unint64_t *)&qword_25433B220, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x242655328](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25433AEB0);
  }
  return result;
}

uint64_t RectangularLockHistoricalUsageView.init(widgetStartDate:usageSnapshot:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = type metadata accessor for HistoricalUsageSnapshot();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23E8A1D6C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v23 = a1;
  v13(v12, a1, v9);
  sub_23E79712C(a2, (uint64_t)v8);
  v14 = (int *)type metadata accessor for RectangularLockHistoricalUsageView();
  v15 = (uint64_t)&a3[v14[7]];
  sub_23E836730(v12, (uint64_t)v8, v15);
  v16 = type metadata accessor for UsageSnapshotDerivedInfo(0);
  v13(a3, v15 + *(int *)(v16 + 40), v9);
  sub_23E79712C(a2, (uint64_t)&a3[v14[5]]);
  if (*(_BYTE *)(a2 + *(int *)(v6 + 36)) != 6)
  {
    if (qword_25433BA28 == -1)
      goto LABEL_8;
    goto LABEL_9;
  }
  if (*(_BYTE *)(a2 + *(int *)(v6 + 28)) == 1)
  {
    if (qword_25433BA28 == -1)
      goto LABEL_8;
    goto LABEL_9;
  }
  if (qword_25433BA28 != -1)
LABEL_9:
    swift_once();
LABEL_8:
  v17 = sub_23E8A1874();
  v19 = v18;
  sub_23E796F88(a2);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v23, v9);
  v21 = (uint64_t *)&a3[v14[6]];
  *v21 = v17;
  v21[1] = v19;
  return result;
}

uint64_t type metadata accessor for RectangularLockHistoricalUsageView()
{
  uint64_t result;

  result = qword_256D989F0;
  if (!qword_256D989F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t RectangularLockHistoricalUsageView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v18;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98960);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98968);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98970);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v5 = sub_23E8A2CC0();
  *((_QWORD *)v5 + 1) = 0x3FE0000000000000;
  v5[16] = 0;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98978);
  sub_23E89F170(v1, (uint64_t)&v5[*(int *)(v13 + 44)]);
  sub_23E753FC4((uint64_t)v5, (uint64_t)v8, &qword_256D98960);
  *(_WORD *)&v8[*(int *)(v6 + 36)] = 0;
  sub_23E75496C((uint64_t)v5, &qword_256D98960);
  sub_23E89F824();
  sub_23E8A30C8();
  sub_23E75496C((uint64_t)v8, &qword_256D98968);
  v14 = sub_23E8A29FC();
  v15 = sub_23E8A2E10();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(a1, v12, v9);
  v16 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D98990) + 36);
  *(_QWORD *)v16 = v14;
  *(_BYTE *)(v16 + 8) = v15;
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_23E89F170@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
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
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
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
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v65 = a2;
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98A38);
  MEMORY[0x24BDAC7A8](v63);
  v57 = (uint64_t)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98A40);
  MEMORY[0x24BDAC7A8](v59);
  v60 = (uint64_t)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98A48);
  MEMORY[0x24BDAC7A8](v61);
  v56 = (uint64_t)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98A50);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v55 = (uint64_t)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v54 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98A58);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v64 = (uint64_t)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v58 = (char *)&v54 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D94458);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v54 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v54 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v54 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)&v54 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v54 - v31;
  *(_QWORD *)v30 = sub_23E8A2C18();
  *((_QWORD *)v30 + 1) = 0;
  v30[16] = 1;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D94460);
  sub_23E89F8D0(a1, (uint64_t)&v30[*(int *)(v33 + 44)]);
  v62 = v32;
  sub_23E757570((uint64_t)v30, (uint64_t)v32, &qword_256D94458);
  v34 = a1 + *(int *)(type metadata accessor for RectangularLockHistoricalUsageView() + 20);
  if (*(_BYTE *)(v34 + *(int *)(type metadata accessor for HistoricalUsageSnapshot() + 36)) == 6)
  {
    *(_QWORD *)v27 = sub_23E8A2C18();
    *((_QWORD *)v27 + 1) = 0x4008000000000000;
    v27[16] = 0;
    sub_23E89FF2C((uint64_t)&v27[*(int *)(v33 + 44)]);
    *(_QWORD *)v24 = sub_23E8A2C18();
    *((_QWORD *)v24 + 1) = 0;
    v24[16] = 1;
    sub_23E8A01C8(a1, (uint64_t)&v24[*(int *)(v33 + 44)]);
    sub_23E753FC4((uint64_t)v27, (uint64_t)v21, &qword_256D94458);
    sub_23E753FC4((uint64_t)v24, (uint64_t)v18, &qword_256D94458);
    v35 = v57;
    sub_23E753FC4((uint64_t)v21, v57, &qword_256D94458);
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98A60);
    sub_23E753FC4((uint64_t)v18, v35 + *(int *)(v36 + 48), &qword_256D94458);
    sub_23E75496C((uint64_t)v18, &qword_256D94458);
    sub_23E75496C((uint64_t)v21, &qword_256D94458);
    sub_23E753FC4(v35, v60, &qword_256D98A38);
    swift_storeEnumTagMultiPayload();
    v37 = MEMORY[0x24BDF5428];
    sub_23E753F50(&qword_256D98A68, &qword_256D98A48, MEMORY[0x24BDF5428]);
    sub_23E753F50(&qword_256D98A70, &qword_256D98A38, v37);
    v38 = v58;
    sub_23E8A2CF0();
    sub_23E75496C(v35, &qword_256D98A38);
    sub_23E75496C((uint64_t)v24, &qword_256D94458);
    sub_23E75496C((uint64_t)v27, &qword_256D94458);
    v39 = (uint64_t)v38;
  }
  else
  {
    v40 = v60;
    v39 = (uint64_t)v58;
    if (qword_25433BA28 != -1)
      swift_once();
    v41 = sub_23E8A1874();
    v43 = v42;
    *(_QWORD *)v10 = sub_23E8A2C18();
    *((_QWORD *)v10 + 1) = 0;
    v10[16] = 1;
    v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98A80);
    sub_23E89FACC(v41, v43, (uint64_t)&v10[*(int *)(v44 + 44)]);
    swift_bridgeObjectRelease();
    v45 = v55;
    sub_23E753FC4((uint64_t)v10, v55, &qword_256D98A50);
    v46 = v56;
    sub_23E753FC4(v45, v56, &qword_256D98A50);
    v47 = v46 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D98A88) + 48);
    *(_QWORD *)v47 = 0;
    *(_BYTE *)(v47 + 8) = 1;
    sub_23E75496C(v45, &qword_256D98A50);
    sub_23E753FC4(v46, v40, &qword_256D98A48);
    swift_storeEnumTagMultiPayload();
    v48 = MEMORY[0x24BDF5428];
    sub_23E753F50(&qword_256D98A68, &qword_256D98A48, MEMORY[0x24BDF5428]);
    sub_23E753F50(&qword_256D98A70, &qword_256D98A38, v48);
    sub_23E8A2CF0();
    sub_23E75496C(v46, &qword_256D98A48);
    sub_23E75496C((uint64_t)v10, &qword_256D98A50);
  }
  v49 = (uint64_t)v62;
  sub_23E753FC4((uint64_t)v62, (uint64_t)v27, &qword_256D94458);
  v50 = v64;
  sub_23E753FC4(v39, v64, &qword_256D98A58);
  v51 = v65;
  sub_23E753FC4((uint64_t)v27, v65, &qword_256D94458);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98A78);
  sub_23E753FC4(v50, v51 + *(int *)(v52 + 48), &qword_256D98A58);
  sub_23E75496C(v39, &qword_256D98A58);
  sub_23E75496C(v49, &qword_256D94458);
  sub_23E75496C(v50, &qword_256D98A58);
  return sub_23E75496C((uint64_t)v27, &qword_256D94458);
}

unint64_t sub_23E89F824()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D98980;
  if (!qword_256D98980)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D98968);
    v2[0] = sub_23E753F50(&qword_256D98988, &qword_256D98960, MEMORY[0x24BDF4700]);
    v2[1] = sub_23E753F50(&qword_256D94320, &qword_256D94328, MEMORY[0x24BDEB950]);
    result = MEMORY[0x242655328](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D98980);
  }
  return result;
}

uint64_t sub_23E89F8C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23E89F8D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;

  v26 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AF20);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v26 - v7;
  v9 = (uint64_t *)(a1 + *(int *)(type metadata accessor for RectangularLockHistoricalUsageView() + 24));
  v10 = v9[1];
  v27 = *v9;
  v28 = v10;
  sub_23E7573F0();
  swift_bridgeObjectRetain();
  v11 = sub_23E8A3014();
  v13 = v12;
  v15 = v14 & 1;
  LODWORD(v27) = sub_23E8A2D5C();
  v16 = sub_23E8A2F90();
  v18 = v17;
  v20 = v19;
  v22 = v21 & 1;
  sub_23E754444(v11, v13, v15);
  swift_bridgeObjectRelease();
  v27 = v16;
  v28 = v18;
  v29 = v22;
  v30 = v20;
  sub_23E8A3164();
  sub_23E754444(v16, v18, v22);
  swift_bridgeObjectRelease();
  sub_23E753FC4((uint64_t)v8, (uint64_t)v6, &qword_25433AF20);
  v23 = v26;
  sub_23E753FC4((uint64_t)v6, v26, &qword_25433AF20);
  v24 = v23 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D944D8) + 48);
  *(_QWORD *)v24 = 0;
  *(_BYTE *)(v24 + 8) = 1;
  sub_23E75496C((uint64_t)v8, &qword_25433AF20);
  return sub_23E75496C((uint64_t)v6, &qword_25433AF20);
}

uint64_t sub_23E89FACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t KeyPath;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
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
  char v62;
  uint64_t v63;

  v59 = a3;
  v54 = sub_23E8A2F00();
  v52 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v50 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D944B8);
  v56 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v48 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D944C0);
  MEMORY[0x24BDAC7A8](v53);
  v49 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98A90);
  MEMORY[0x24BDAC7A8](v8);
  v51 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D98A98);
  v10 = MEMORY[0x24BDAC7A8](v57);
  v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v55 = (uint64_t)&v48 - v13;
  v60 = a1;
  v61 = a2;
  sub_23E7573F0();
  swift_bridgeObjectRetain();
  v14 = sub_23E8A3014();
  v16 = v15;
  v18 = v17 & 1;
  v19 = sub_23E8A2FB4();
  v21 = v20;
  v23 = v22 & 1;
  sub_23E754444(v14, v16, v18);
  swift_bridgeObjectRelease();
  LODWORD(v60) = sub_23E8A2D5C();
  v24 = sub_23E8A2F90();
  v26 = v25;
  v28 = v27;
  v30 = v29 & 1;
  sub_23E754444(v19, v21, v23);
  swift_bridgeObjectRelease();
  v60 = v24;
  v61 = v26;
  v62 = v30;
  v63 = v28;
  v31 = v48;
  sub_23E8A31D0();
  sub_23E754444(v24, v26, v30);
  swift_bridgeObjectRelease();
  sub_23E8A2F24();
  v32 = v52;
  v33 = v50;
  v34 = v54;
  (*(void (**)(char *, _QWORD, uint64_t))(v52 + 104))(v50, *MEMORY[0x24BDF17C8], v54);
  v35 = sub_23E8A2F18();
  swift_release();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
  KeyPath = swift_getKeyPath();
  v37 = v56;
  v38 = (uint64_t)v49;
  v39 = v58;
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v49, v31, v58);
  v40 = (uint64_t *)(v38 + *(int *)(v53 + 36));
  *v40 = KeyPath;
  v40[1] = v35;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v31, v39);
  sub_23E78B964();
  v41 = (uint64_t)v51;
  sub_23E8A3164();
  sub_23E75496C(v38, &qword_256D944C0);
  v42 = swift_getKeyPath();
  sub_23E753FC4(v41, (uint64_t)v12, &qword_256D98A90);
  v43 = &v12[*(int *)(v57 + 36)];
  *(_QWORD *)v43 = v42;
  v43[8] = 0;
  sub_23E75496C(v41, &qword_256D98A90);
  v44 = v55;
  sub_23E757570((uint64_t)v12, v55, &qword_256D98A98);
  sub_23E753FC4(v44, (uint64_t)v12, &qword_256D98A98);
  v45 = v59;
  sub_23E753FC4((uint64_t)v12, v59, &qword_256D98A98);
  v46 = v45 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D98AA0) + 48);
  *(_QWORD *)v46 = 0;
  *(_BYTE *)(v46 + 8) = 1;
  sub_23E75496C(v44, &qword_256D98A98);
  return sub_23E75496C((uint64_t)v12, &qword_256D98A98);
}

uint64_t sub_23E89FF2C@<X0>(uint64_t a1@<X8>)
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;

  v30 = a1;
  v1 = sub_23E8A2F00();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E8A1850();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AF20);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v29 = (uint64_t)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v28 - v11;
  type metadata accessor for RectangularLockHistoricalUsageView();
  HistoricalUsageSnapshot.summaryUsageOrSurplusForInterval(starting:useShortText:)(1, (uint64_t)v7);
  v13 = sub_23E8A3008();
  v15 = v14;
  v17 = v16 & 1;
  sub_23E8A2E70();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDF17C8], v1);
  sub_23E8A2F18();
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v18 = sub_23E8A2FC0();
  v20 = v19;
  LOBYTE(v4) = v21;
  v23 = v22;
  swift_release();
  sub_23E754444(v13, v15, v17);
  swift_bridgeObjectRelease();
  v31 = v18;
  v32 = v20;
  v33 = v4 & 1;
  v34 = v23;
  sub_23E8A3164();
  sub_23E754444(v18, v20, v4 & 1);
  swift_bridgeObjectRelease();
  v24 = v29;
  sub_23E753FC4((uint64_t)v12, v29, &qword_25433AF20);
  v25 = v30;
  sub_23E753FC4(v24, v30, &qword_25433AF20);
  v26 = v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D944D8) + 48);
  *(_QWORD *)v26 = 0;
  *(_BYTE *)(v26 + 8) = 1;
  sub_23E75496C((uint64_t)v12, &qword_25433AF20);
  return sub_23E75496C(v24, &qword_25433AF20);
}

uint64_t sub_23E8A01C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;

  v32 = a2;
  v3 = sub_23E8A2F00();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23E8A1850();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433AF20);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v31 = (uint64_t)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v30 - v13;
  type metadata accessor for RectangularLockHistoricalUsageView();
  HistoricalUsageSnapshot.summaryDailyUsageOrSurplusTrendShort(_:)(a1, (uint64_t)v9);
  v15 = sub_23E8A3008();
  v17 = v16;
  v19 = v18 & 1;
  sub_23E8A2E70();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDF17C8], v3);
  sub_23E8A2F18();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v20 = sub_23E8A2FC0();
  v22 = v21;
  LOBYTE(v6) = v23;
  v25 = v24;
  swift_release();
  sub_23E754444(v15, v17, v19);
  swift_bridgeObjectRelease();
  v33 = v20;
  v34 = v22;
  v35 = v6 & 1;
  v36 = v25;
  sub_23E8A3164();
  sub_23E754444(v20, v22, v6 & 1);
  swift_bridgeObjectRelease();
  v26 = v31;
  sub_23E753FC4((uint64_t)v14, v31, &qword_25433AF20);
  v27 = v32;
  sub_23E753FC4(v26, v32, &qword_25433AF20);
  v28 = v27 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D944D8) + 48);
  *(_QWORD *)v28 = 0;
  *(_BYTE *)(v28 + 8) = 1;
  sub_23E75496C((uint64_t)v14, &qword_25433AF20);
  return sub_23E75496C(v26, &qword_25433AF20);
}

uint64_t getEnumTagSinglePayload for RectangularLockHistoricalUsageView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E8A0470(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v6 = sub_23E8A1D6C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = type metadata accessor for HistoricalUsageSnapshot();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_10:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = type metadata accessor for UsageSnapshotDerivedInfo(0);
    v12 = *(_QWORD *)(v8 - 8);
    v13 = a3[7];
    goto LABEL_10;
  }
  v14 = *(_QWORD *)(a1 + a3[6] + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for RectangularLockHistoricalUsageView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E8A054C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_23E8A1D6C();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = type metadata accessor for HistoricalUsageSnapshot();
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 0x7FFFFFFF)
      {
        *(_QWORD *)(a1 + a4[6] + 8) = (a2 - 1);
        return result;
      }
      v10 = type metadata accessor for UsageSnapshotDerivedInfo(0);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[7];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_23E8A0618()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_23E8A1D6C();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for HistoricalUsageSnapshot();
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for UsageSnapshotDerivedInfo(319);
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

unint64_t sub_23E8A06C4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_256D98A30;
  if (!qword_256D98A30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D98990);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D98968);
    v2[3] = sub_23E89F824();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDF1050];
    result = MEMORY[0x242655328](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D98A30);
  }
  return result;
}

void sub_23E8A0768(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_homeIdentifier);
  if (v3)
  {
    v4 = v3;
    v5 = sub_23E8A3914();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_23E8A07CC(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_23E8A3908();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setHomeIdentifier_);

}

id ConfigurationIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ConfigurationIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfigurationIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ConfigurationIntent()
{
  return objc_opt_self();
}

id ConfigurationIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ConfigurationIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ConfigurationIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_23E8A3908();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id ConfigurationIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v5;
  id v6;
  objc_super v8;

  if (a2)
  {
    v5 = (void *)sub_23E8A3908();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ConfigurationIntent();
  v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id ConfigurationIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v7 = (void *)sub_23E8A3908();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_23E8A3908();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_23E8A3830();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(objc_allocWithZone(v5), sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id ConfigurationIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;

  v7 = (void *)sub_23E8A3908();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_23E8A3908();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_23E8A3830();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for ConfigurationIntent();
  v10 = objc_msgSendSuper2(&v12, sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

id ConfigurationIntent.__deallocating_deinit()
{
  return sub_23E8A1454(type metadata accessor for ConfigurationIntent);
}

unint64_t ConfigurationIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_23E8A1484(a1);
}

unint64_t sub_23E8A0E30@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_23E8A1484(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_23E8A0EA4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___ConfigurationIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

char *ConfigurationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___ConfigurationIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *ConfigurationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___ConfigurationIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id ConfigurationIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ConfigurationIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ConfigurationIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id ConfigurationIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithBackingStore_, a1);

  return v3;
}

id sub_23E8A1274(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  objc_super v7;

  *(_QWORD *)&a1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id ConfigurationIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  objc_class *v1;
  void *v2;
  id v3;

  if (a1)
  {
    v2 = (void *)sub_23E8A3830();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id ConfigurationIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  void *v2;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___ConfigurationIntentResponse_code] = 0;
  if (a1)
  {
    v2 = (void *)sub_23E8A3830();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ConfigurationIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithPropertiesByName_, v2);

  if (v3)
  return v3;
}

id ConfigurationIntentResponse.__deallocating_deinit()
{
  return sub_23E8A1454(type metadata accessor for ConfigurationIntentResponse);
}

id sub_23E8A1454(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_23E8A1484(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

uint64_t type metadata accessor for ConfigurationIntentResponse()
{
  return objc_opt_self();
}

unint64_t sub_23E8A14B8()
{
  unint64_t result;

  result = qword_256D98AB0;
  if (!qword_256D98AB0)
  {
    result = MEMORY[0x242655328](&protocol conformance descriptor for ConfigurationIntentResponseCode, &type metadata for ConfigurationIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_256D98AB0);
  }
  return result;
}

char *keypath_get_selector_homeIdentifier()
{
  return sel_homeIdentifier;
}

uint64_t sub_23E8A1510@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___ConfigurationIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23E8A1560(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___ConfigurationIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for ConfigurationIntentResponseCode()
{
  return &type metadata for ConfigurationIntentResponseCode;
}

uint64_t method lookup function for ConfigurationIntentResponse()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ConfigurationIntentResponse.code.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t sub_23E8A15EC()
{
  return MEMORY[0x24BDCB128]();
}

uint64_t sub_23E8A15F8()
{
  return MEMORY[0x24BDCB148]();
}

uint64_t sub_23E8A1604()
{
  return MEMORY[0x24BDCB150]();
}

uint64_t sub_23E8A1610()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_23E8A161C()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_23E8A1628()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_23E8A1634()
{
  return MEMORY[0x24BDCB488]();
}

uint64_t sub_23E8A1640()
{
  return MEMORY[0x24BDCB4A8]();
}

uint64_t sub_23E8A164C()
{
  return MEMORY[0x24BDCB4D0]();
}

uint64_t sub_23E8A1658()
{
  return MEMORY[0x24BDCB4D8]();
}

uint64_t sub_23E8A1664()
{
  return MEMORY[0x24BDCB580]();
}

uint64_t sub_23E8A1670()
{
  return MEMORY[0x24BDCB818]();
}

uint64_t sub_23E8A167C()
{
  return MEMORY[0x24BDCB830]();
}

uint64_t sub_23E8A1688()
{
  return MEMORY[0x24BDCB838]();
}

uint64_t sub_23E8A1694()
{
  return MEMORY[0x24BDCB840]();
}

uint64_t sub_23E8A16A0()
{
  return MEMORY[0x24BDCB848]();
}

uint64_t sub_23E8A16AC()
{
  return MEMORY[0x24BDCB858]();
}

uint64_t sub_23E8A16B8()
{
  return MEMORY[0x24BDCB878]();
}

uint64_t sub_23E8A16C4()
{
  return MEMORY[0x24BDCB8D8]();
}

uint64_t sub_23E8A16D0()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_23E8A16DC()
{
  return MEMORY[0x24BDCB8F0]();
}

uint64_t sub_23E8A16E8()
{
  return MEMORY[0x24BDCB918]();
}

uint64_t sub_23E8A16F4()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_23E8A1700()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_23E8A170C()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_23E8A1718()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_23E8A1724()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_23E8A1730()
{
  return MEMORY[0x24BDCBAD0]();
}

uint64_t sub_23E8A173C()
{
  return MEMORY[0x24BDCBB28]();
}

uint64_t sub_23E8A1748()
{
  return MEMORY[0x24BDCBB68]();
}

uint64_t sub_23E8A1754()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_23E8A1760()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_23E8A176C()
{
  return MEMORY[0x24BDCBD90]();
}

uint64_t sub_23E8A1778()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_23E8A1784()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_23E8A1790()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_23E8A179C()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_23E8A17A8()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_23E8A17B4()
{
  return MEMORY[0x24BDCBF70]();
}

uint64_t sub_23E8A17C0()
{
  return MEMORY[0x24BDCC180]();
}

uint64_t sub_23E8A17CC()
{
  return MEMORY[0x24BDEAD78]();
}

uint64_t sub_23E8A17D8()
{
  return MEMORY[0x24BDCC2F8]();
}

uint64_t sub_23E8A17E4()
{
  return MEMORY[0x24BDCC320]();
}

uint64_t sub_23E8A17F0()
{
  return MEMORY[0x24BDCC398]();
}

uint64_t sub_23E8A17FC()
{
  return MEMORY[0x24BDCC460]();
}

uint64_t sub_23E8A1808()
{
  return MEMORY[0x24BDCC478]();
}

uint64_t sub_23E8A1814()
{
  return MEMORY[0x24BDCC480]();
}

uint64_t sub_23E8A1820()
{
  return MEMORY[0x24BDCC498]();
}

uint64_t sub_23E8A182C()
{
  return MEMORY[0x24BDCC4A8]();
}

uint64_t sub_23E8A1838()
{
  return MEMORY[0x24BDCC4E0]();
}

uint64_t sub_23E8A1844()
{
  return MEMORY[0x24BDCC560]();
}

uint64_t sub_23E8A1850()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_23E8A185C()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_23E8A1868()
{
  return MEMORY[0x24BDCC608]();
}

uint64_t sub_23E8A1874()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_23E8A1880()
{
  return MEMORY[0x24BDCC840]();
}

uint64_t sub_23E8A188C()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_23E8A1898()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_23E8A18A4()
{
  return MEMORY[0x24BDCC8D0]();
}

uint64_t sub_23E8A18B0()
{
  return MEMORY[0x24BDCC8D8]();
}

uint64_t sub_23E8A18BC()
{
  return MEMORY[0x24BDCC8E0]();
}

uint64_t sub_23E8A18C8()
{
  return MEMORY[0x24BDCC978]();
}

uint64_t sub_23E8A18D4()
{
  return MEMORY[0x24BDCCB18]();
}

uint64_t sub_23E8A18E0()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_23E8A18EC()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_23E8A18F8()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_23E8A1904()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_23E8A1910()
{
  return MEMORY[0x24BDCD2A0]();
}

uint64_t sub_23E8A191C()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_23E8A1928()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_23E8A1934()
{
  return MEMORY[0x24BDCD2D0]();
}

uint64_t sub_23E8A1940()
{
  return MEMORY[0x24BDEAD90]();
}

uint64_t sub_23E8A194C()
{
  return MEMORY[0x24BDCD408]();
}

uint64_t sub_23E8A1958()
{
  return MEMORY[0x24BDCD420]();
}

uint64_t sub_23E8A1964()
{
  return MEMORY[0x24BDCD490]();
}

uint64_t sub_23E8A1970()
{
  return MEMORY[0x24BDCD548]();
}

uint64_t sub_23E8A197C()
{
  return MEMORY[0x24BDCD560]();
}

uint64_t sub_23E8A1988()
{
  return MEMORY[0x24BDCD5E8]();
}

uint64_t sub_23E8A1994()
{
  return MEMORY[0x24BDCD5F8]();
}

uint64_t sub_23E8A19A0()
{
  return MEMORY[0x24BDCD6C8]();
}

uint64_t sub_23E8A19AC()
{
  return MEMORY[0x24BDCD6D8]();
}

uint64_t sub_23E8A19B8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23E8A19C4()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_23E8A19D0()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_23E8A19DC()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23E8A19E8()
{
  return MEMORY[0x24BDCDEB0]();
}

uint64_t sub_23E8A19F4()
{
  return MEMORY[0x24BDCDED0]();
}

uint64_t sub_23E8A1A00()
{
  return MEMORY[0x24BDCDEE8]();
}

uint64_t sub_23E8A1A0C()
{
  return MEMORY[0x24BDCDEF8]();
}

uint64_t sub_23E8A1A18()
{
  return MEMORY[0x24BDCDF10]();
}

uint64_t sub_23E8A1A24()
{
  return MEMORY[0x24BDCDF18]();
}

uint64_t sub_23E8A1A30()
{
  return MEMORY[0x24BDCDF30]();
}

uint64_t sub_23E8A1A3C()
{
  return MEMORY[0x24BDCE010]();
}

uint64_t sub_23E8A1A48()
{
  return MEMORY[0x24BDCE020]();
}

uint64_t sub_23E8A1A54()
{
  return MEMORY[0x24BDCE028]();
}

uint64_t sub_23E8A1A60()
{
  return MEMORY[0x24BDCE030]();
}

uint64_t sub_23E8A1A6C()
{
  return MEMORY[0x24BDCE038]();
}

uint64_t sub_23E8A1A78()
{
  return MEMORY[0x24BDCE040]();
}

uint64_t sub_23E8A1A84()
{
  return MEMORY[0x24BDCE060]();
}

uint64_t sub_23E8A1A90()
{
  return MEMORY[0x24BDCE070]();
}

uint64_t sub_23E8A1A9C()
{
  return MEMORY[0x24BDCE078]();
}

uint64_t sub_23E8A1AA8()
{
  return MEMORY[0x24BDCE098]();
}

uint64_t sub_23E8A1AB4()
{
  return MEMORY[0x24BDCE0A8]();
}

uint64_t sub_23E8A1AC0()
{
  return MEMORY[0x24BDCE0B0]();
}

uint64_t sub_23E8A1ACC()
{
  return MEMORY[0x24BDCE0C0]();
}

uint64_t sub_23E8A1AD8()
{
  return MEMORY[0x24BDCE0C8]();
}

uint64_t sub_23E8A1AE4()
{
  return MEMORY[0x24BDCE0D0]();
}

uint64_t sub_23E8A1AF0()
{
  return MEMORY[0x24BDCE0D8]();
}

uint64_t sub_23E8A1AFC()
{
  return MEMORY[0x24BDCE0E0]();
}

uint64_t sub_23E8A1B08()
{
  return MEMORY[0x24BDCE0F0]();
}

uint64_t sub_23E8A1B14()
{
  return MEMORY[0x24BDCE108]();
}

uint64_t sub_23E8A1B20()
{
  return MEMORY[0x24BDCE110]();
}

uint64_t sub_23E8A1B2C()
{
  return MEMORY[0x24BDCE130]();
}

uint64_t sub_23E8A1B38()
{
  return MEMORY[0x24BDCE138]();
}

uint64_t sub_23E8A1B44()
{
  return MEMORY[0x24BDCE140]();
}

uint64_t sub_23E8A1B50()
{
  return MEMORY[0x24BDCE150]();
}

uint64_t sub_23E8A1B5C()
{
  return MEMORY[0x24BDCE160]();
}

uint64_t sub_23E8A1B68()
{
  return MEMORY[0x24BDCE168]();
}

uint64_t sub_23E8A1B74()
{
  return MEMORY[0x24BDCE178]();
}

uint64_t sub_23E8A1B80()
{
  return MEMORY[0x24BDCE1A8]();
}

uint64_t sub_23E8A1B8C()
{
  return MEMORY[0x24BDCE1E0]();
}

uint64_t sub_23E8A1B98()
{
  return MEMORY[0x24BDCE1F8]();
}

uint64_t sub_23E8A1BA4()
{
  return MEMORY[0x24BDCE208]();
}

uint64_t sub_23E8A1BB0()
{
  return MEMORY[0x24BDCE210]();
}

uint64_t sub_23E8A1BBC()
{
  return MEMORY[0x24BDCE230]();
}

uint64_t sub_23E8A1BC8()
{
  return MEMORY[0x24BDCE250]();
}

uint64_t sub_23E8A1BD4()
{
  return MEMORY[0x24BDCE270]();
}

uint64_t sub_23E8A1BE0()
{
  return MEMORY[0x24BDCE280]();
}

uint64_t sub_23E8A1BEC()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_23E8A1BF8()
{
  return MEMORY[0x24BDCE2D0]();
}

uint64_t sub_23E8A1C04()
{
  return MEMORY[0x24BDCE2E8]();
}

uint64_t sub_23E8A1C10()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_23E8A1C1C()
{
  return MEMORY[0x24BDCE418]();
}

uint64_t sub_23E8A1C28()
{
  return MEMORY[0x24BDCE420]();
}

uint64_t sub_23E8A1C34()
{
  return MEMORY[0x24BDCE448]();
}

uint64_t sub_23E8A1C40()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_23E8A1C4C()
{
  return MEMORY[0x24BDCE478]();
}

uint64_t sub_23E8A1C58()
{
  return MEMORY[0x24BDCE480]();
}

uint64_t sub_23E8A1C64()
{
  return MEMORY[0x24BDCE488]();
}

uint64_t sub_23E8A1C70()
{
  return MEMORY[0x24BDCE490]();
}

uint64_t sub_23E8A1C7C()
{
  return MEMORY[0x24BDCE498]();
}

uint64_t sub_23E8A1C88()
{
  return MEMORY[0x24BDCE4A0]();
}

uint64_t sub_23E8A1C94()
{
  return MEMORY[0x24BDCE4A8]();
}

uint64_t sub_23E8A1CA0()
{
  return MEMORY[0x24BDCE4B8]();
}

uint64_t sub_23E8A1CAC()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23E8A1CB8()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_23E8A1CC4()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_23E8A1CD0()
{
  return MEMORY[0x24BDCE600]();
}

uint64_t sub_23E8A1CDC()
{
  return MEMORY[0x24BDCE608]();
}

uint64_t sub_23E8A1CE8()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_23E8A1CF4()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_23E8A1D00()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_23E8A1D0C()
{
  return MEMORY[0x24BDCE868]();
}

uint64_t sub_23E8A1D18()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_23E8A1D24()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23E8A1D30()
{
  return MEMORY[0x24BDCE8A8]();
}

uint64_t sub_23E8A1D3C()
{
  return MEMORY[0x24BDCE8C0]();
}

uint64_t sub_23E8A1D48()
{
  return MEMORY[0x24BDCE8C8]();
}

uint64_t sub_23E8A1D54()
{
  return MEMORY[0x24BDCE8D8]();
}

uint64_t sub_23E8A1D60()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23E8A1D6C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23E8A1D78()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23E8A1D84()
{
  return MEMORY[0x24BDCE9B8]();
}

uint64_t sub_23E8A1D90()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23E8A1D9C()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23E8A1DA8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23E8A1DB4()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_23E8A1DC0()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_23E8A1DCC()
{
  return MEMORY[0x24BDCEE90]();
}

uint64_t sub_23E8A1DD8()
{
  return MEMORY[0x24BDCEEA0]();
}

uint64_t sub_23E8A1DE4()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23E8A1DF0()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_23E8A1DFC()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_23E8A1E08()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_23E8A1E14()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_23E8A1E20()
{
  return MEMORY[0x24BDCF0D0]();
}

uint64_t sub_23E8A1E2C()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_23E8A1E38()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_23E8A1E44()
{
  return MEMORY[0x24BDCF170]();
}

uint64_t sub_23E8A1E50()
{
  return MEMORY[0x24BDCF1A8]();
}

uint64_t sub_23E8A1E5C()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_23E8A1E68()
{
  return MEMORY[0x24BDCF1C8]();
}

uint64_t sub_23E8A1E74()
{
  return MEMORY[0x24BDCF1D0]();
}

uint64_t sub_23E8A1E80()
{
  return MEMORY[0x24BDCF210]();
}

uint64_t sub_23E8A1E8C()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_23E8A1E98()
{
  return MEMORY[0x24BDCF2D0]();
}

uint64_t sub_23E8A1EA4()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_23E8A1EB0()
{
  return MEMORY[0x24BDCF490]();
}

uint64_t sub_23E8A1EBC()
{
  return MEMORY[0x24BDCF4C8]();
}

uint64_t sub_23E8A1EC8()
{
  return MEMORY[0x24BDCF4E0]();
}

uint64_t sub_23E8A1ED4()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_23E8A1EE0()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_23E8A1EEC()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_23E8A1EF8()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_23E8A1F04()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_23E8A1F10()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_23E8A1F1C()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_23E8A1F28()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_23E8A1F34()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_23E8A1F40()
{
  return MEMORY[0x24BE4F1E0]();
}

uint64_t sub_23E8A1F4C()
{
  return MEMORY[0x24BE4F220]();
}

uint64_t sub_23E8A1F58()
{
  return MEMORY[0x24BE4F228]();
}

uint64_t sub_23E8A1F64()
{
  return MEMORY[0x24BE4F230]();
}

uint64_t sub_23E8A1F70()
{
  return MEMORY[0x24BE4F238]();
}

uint64_t sub_23E8A1F7C()
{
  return MEMORY[0x24BE4F240]();
}

uint64_t sub_23E8A1F88()
{
  return MEMORY[0x24BE4F268]();
}

uint64_t sub_23E8A1F94()
{
  return MEMORY[0x24BE4F270]();
}

uint64_t sub_23E8A1FA0()
{
  return MEMORY[0x24BE4F298]();
}

uint64_t sub_23E8A1FAC()
{
  return MEMORY[0x24BE4F2B0]();
}

uint64_t sub_23E8A1FB8()
{
  return MEMORY[0x24BE4F2E0]();
}

uint64_t sub_23E8A1FC4()
{
  return MEMORY[0x24BE4F2E8]();
}

uint64_t sub_23E8A1FD0()
{
  return MEMORY[0x24BE2EE78]();
}

uint64_t sub_23E8A1FDC()
{
  return MEMORY[0x24BE2EE80]();
}

uint64_t sub_23E8A1FE8()
{
  return MEMORY[0x24BE2EEA8]();
}

uint64_t sub_23E8A1FF4()
{
  return MEMORY[0x24BE2EEC0]();
}

uint64_t sub_23E8A2000()
{
  return MEMORY[0x24BE2EEE0]();
}

uint64_t sub_23E8A200C()
{
  return MEMORY[0x24BE2EEE8]();
}

uint64_t sub_23E8A2018()
{
  return MEMORY[0x24BE2EEF8]();
}

uint64_t sub_23E8A2024()
{
  return MEMORY[0x24BE2EF00]();
}

uint64_t sub_23E8A2030()
{
  return MEMORY[0x24BE2EF08]();
}

uint64_t sub_23E8A203C()
{
  return MEMORY[0x24BE2EF18]();
}

uint64_t sub_23E8A2048()
{
  return MEMORY[0x24BE2EF20]();
}

uint64_t sub_23E8A2054()
{
  return MEMORY[0x24BE2EF28]();
}

uint64_t sub_23E8A2060()
{
  return MEMORY[0x24BE2EF30]();
}

uint64_t sub_23E8A206C()
{
  return MEMORY[0x24BE2F1D8]();
}

uint64_t sub_23E8A2078()
{
  return MEMORY[0x24BE2F1E0]();
}

uint64_t sub_23E8A2084()
{
  return MEMORY[0x24BE2F1E8]();
}

uint64_t sub_23E8A2090()
{
  return MEMORY[0x24BE2F200]();
}

uint64_t sub_23E8A209C()
{
  return MEMORY[0x24BE2F208]();
}

uint64_t sub_23E8A20A8()
{
  return MEMORY[0x24BE2F218]();
}

uint64_t sub_23E8A20B4()
{
  return MEMORY[0x24BE2F220]();
}

uint64_t sub_23E8A20C0()
{
  return MEMORY[0x24BE2F228]();
}

uint64_t sub_23E8A20CC()
{
  return MEMORY[0x24BE2F230]();
}

uint64_t sub_23E8A20D8()
{
  return MEMORY[0x24BE2F250]();
}

uint64_t sub_23E8A20E4()
{
  return MEMORY[0x24BE2F258]();
}

uint64_t sub_23E8A20F0()
{
  return MEMORY[0x24BE2F268]();
}

uint64_t sub_23E8A20FC()
{
  return MEMORY[0x24BE2F270]();
}

uint64_t sub_23E8A2108()
{
  return MEMORY[0x24BE2F278]();
}

uint64_t sub_23E8A2114()
{
  return MEMORY[0x24BE2F288]();
}

uint64_t sub_23E8A2120()
{
  return MEMORY[0x24BE2F290]();
}

uint64_t sub_23E8A212C()
{
  return MEMORY[0x24BE2F298]();
}

uint64_t sub_23E8A2138()
{
  return MEMORY[0x24BE2F2A0]();
}

uint64_t sub_23E8A2144()
{
  return MEMORY[0x24BE2F2B0]();
}

uint64_t sub_23E8A2150()
{
  return MEMORY[0x24BE2F2B8]();
}

uint64_t sub_23E8A215C()
{
  return MEMORY[0x24BE2F2C0]();
}

uint64_t sub_23E8A2168()
{
  return MEMORY[0x24BE2F2C8]();
}

uint64_t sub_23E8A2174()
{
  return MEMORY[0x24BE2F2D0]();
}

uint64_t sub_23E8A2180()
{
  return MEMORY[0x24BE2F2D8]();
}

uint64_t sub_23E8A218C()
{
  return MEMORY[0x24BE2F2E0]();
}

uint64_t sub_23E8A2198()
{
  return MEMORY[0x24BE4F4A8]();
}

uint64_t sub_23E8A21A4()
{
  return MEMORY[0x24BE4F4B0]();
}

uint64_t sub_23E8A21B0()
{
  return MEMORY[0x24BE4F4B8]();
}

uint64_t sub_23E8A21BC()
{
  return MEMORY[0x24BE4F4C0]();
}

uint64_t sub_23E8A21C8()
{
  return MEMORY[0x24BE4F548]();
}

uint64_t sub_23E8A21D4()
{
  return MEMORY[0x24BE4F550]();
}

uint64_t sub_23E8A21E0()
{
  return MEMORY[0x24BE4F568]();
}

uint64_t sub_23E8A21EC()
{
  return MEMORY[0x24BE4F570]();
}

uint64_t sub_23E8A21F8()
{
  return MEMORY[0x24BE4F740]();
}

uint64_t sub_23E8A2204()
{
  return MEMORY[0x24BE4F7A0]();
}

uint64_t sub_23E8A2210()
{
  return MEMORY[0x24BE4F7B0]();
}

uint64_t sub_23E8A221C()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_23E8A2228()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_23E8A2234()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_23E8A2240()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_23E8A224C()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_23E8A2258()
{
  return MEMORY[0x24BEE77C8]();
}

uint64_t sub_23E8A2264()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_23E8A2270()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_23E8A227C()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_23E8A2288()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_23E8A2294()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_23E8A22A0()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_23E8A22AC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23E8A22B8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23E8A22C4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23E8A22D0()
{
  return MEMORY[0x24BDB7AB0]();
}

uint64_t sub_23E8A22DC()
{
  return MEMORY[0x24BDB7AB8]();
}

uint64_t sub_23E8A22E8()
{
  return MEMORY[0x24BDB7AC8]();
}

uint64_t sub_23E8A22F4()
{
  return MEMORY[0x24BDB7AD0]();
}

uint64_t sub_23E8A2300()
{
  return MEMORY[0x24BDB7AD8]();
}

uint64_t sub_23E8A230C()
{
  return MEMORY[0x24BDB7AE0]();
}

uint64_t sub_23E8A2318()
{
  return MEMORY[0x24BDB7B10]();
}

uint64_t sub_23E8A2324()
{
  return MEMORY[0x24BDB7B28]();
}

uint64_t sub_23E8A2330()
{
  return MEMORY[0x24BDB7B38]();
}

uint64_t sub_23E8A233C()
{
  return MEMORY[0x24BDB7BB0]();
}

uint64_t sub_23E8A2348()
{
  return MEMORY[0x24BDB7BD0]();
}

uint64_t sub_23E8A2354()
{
  return MEMORY[0x24BDB7C00]();
}

uint64_t sub_23E8A2360()
{
  return MEMORY[0x24BDB7C20]();
}

uint64_t sub_23E8A236C()
{
  return MEMORY[0x24BDB7CA0]();
}

uint64_t sub_23E8A2378()
{
  return MEMORY[0x24BDB7CB0]();
}

uint64_t sub_23E8A2384()
{
  return MEMORY[0x24BDB7CE0]();
}

uint64_t sub_23E8A2390()
{
  return MEMORY[0x24BDB7CF0]();
}

uint64_t sub_23E8A239C()
{
  return MEMORY[0x24BDB7D40]();
}

uint64_t sub_23E8A23A8()
{
  return MEMORY[0x24BDB7D50]();
}

uint64_t sub_23E8A23B4()
{
  return MEMORY[0x24BDB7D60]();
}

uint64_t sub_23E8A23C0()
{
  return MEMORY[0x24BDB7D70]();
}

uint64_t sub_23E8A23CC()
{
  return MEMORY[0x24BDB7D88]();
}

uint64_t sub_23E8A23D8()
{
  return MEMORY[0x24BDB7DA0]();
}

uint64_t sub_23E8A23E4()
{
  return MEMORY[0x24BDB7DA8]();
}

uint64_t sub_23E8A23F0()
{
  return MEMORY[0x24BDB7DD8]();
}

uint64_t sub_23E8A23FC()
{
  return MEMORY[0x24BDB7DE0]();
}

uint64_t sub_23E8A2408()
{
  return MEMORY[0x24BDB7DF0]();
}

uint64_t sub_23E8A2414()
{
  return MEMORY[0x24BDB7E08]();
}

uint64_t sub_23E8A2420()
{
  return MEMORY[0x24BDB7E18]();
}

uint64_t sub_23E8A242C()
{
  return MEMORY[0x24BDB7E38]();
}

uint64_t sub_23E8A2438()
{
  return MEMORY[0x24BDB7E48]();
}

uint64_t sub_23E8A2444()
{
  return MEMORY[0x24BDB7E50]();
}

uint64_t sub_23E8A2450()
{
  return MEMORY[0x24BDB7E68]();
}

uint64_t sub_23E8A245C()
{
  return MEMORY[0x24BDB7E78]();
}

uint64_t sub_23E8A2468()
{
  return MEMORY[0x24BDB7E80]();
}

uint64_t sub_23E8A2474()
{
  return MEMORY[0x24BDB7EF0]();
}

uint64_t sub_23E8A2480()
{
  return MEMORY[0x24BDB7F00]();
}

uint64_t sub_23E8A248C()
{
  return MEMORY[0x24BDB7F08]();
}

uint64_t sub_23E8A2498()
{
  return MEMORY[0x24BDB7F18]();
}

uint64_t sub_23E8A24A4()
{
  return MEMORY[0x24BDB7F40]();
}

uint64_t sub_23E8A24B0()
{
  return MEMORY[0x24BDB7F58]();
}

uint64_t sub_23E8A24BC()
{
  return MEMORY[0x24BDB7F70]();
}

uint64_t sub_23E8A24C8()
{
  return MEMORY[0x24BDB7FD0]();
}

uint64_t sub_23E8A24D4()
{
  return MEMORY[0x24BDB7FD8]();
}

uint64_t sub_23E8A24E0()
{
  return MEMORY[0x24BDB7FE0]();
}

uint64_t sub_23E8A24EC()
{
  return MEMORY[0x24BDB8058]();
}

uint64_t sub_23E8A24F8()
{
  return MEMORY[0x24BDB8060]();
}

uint64_t sub_23E8A2504()
{
  return MEMORY[0x24BDB8078]();
}

uint64_t sub_23E8A2510()
{
  return MEMORY[0x24BDB8088]();
}

uint64_t sub_23E8A251C()
{
  return MEMORY[0x24BDB8090]();
}

uint64_t sub_23E8A2528()
{
  return MEMORY[0x24BDB8098]();
}

uint64_t sub_23E8A2534()
{
  return MEMORY[0x24BDB80A0]();
}

uint64_t sub_23E8A2540()
{
  return MEMORY[0x24BDB80A8]();
}

uint64_t sub_23E8A254C()
{
  return MEMORY[0x24BDB80B8]();
}

uint64_t sub_23E8A2558()
{
  return MEMORY[0x24BDB80D0]();
}

uint64_t sub_23E8A2564()
{
  return MEMORY[0x24BDB80D8]();
}

uint64_t sub_23E8A2570()
{
  return MEMORY[0x24BDB80F0]();
}

uint64_t sub_23E8A257C()
{
  return MEMORY[0x24BDB80F8]();
}

uint64_t sub_23E8A2588()
{
  return MEMORY[0x24BDB8120]();
}

uint64_t sub_23E8A2594()
{
  return MEMORY[0x24BDB8138]();
}

uint64_t sub_23E8A25A0()
{
  return MEMORY[0x24BDB8150]();
}

uint64_t sub_23E8A25AC()
{
  return MEMORY[0x24BDB8170]();
}

uint64_t sub_23E8A25B8()
{
  return MEMORY[0x24BDB81B0]();
}

uint64_t sub_23E8A25C4()
{
  return MEMORY[0x24BDB81C0]();
}

uint64_t sub_23E8A25D0()
{
  return MEMORY[0x24BDB81D0]();
}

uint64_t sub_23E8A25DC()
{
  return MEMORY[0x24BDB81E0]();
}

uint64_t sub_23E8A25E8()
{
  return MEMORY[0x24BDB81E8]();
}

uint64_t sub_23E8A25F4()
{
  return MEMORY[0x24BDB81F0]();
}

uint64_t sub_23E8A2600()
{
  return MEMORY[0x24BDB8200]();
}

uint64_t sub_23E8A260C()
{
  return MEMORY[0x24BDB8210]();
}

uint64_t sub_23E8A2618()
{
  return MEMORY[0x24BDB8260]();
}

uint64_t sub_23E8A2624()
{
  return MEMORY[0x24BDB8268]();
}

uint64_t sub_23E8A2630()
{
  return MEMORY[0x24BDB8270]();
}

uint64_t sub_23E8A263C()
{
  return MEMORY[0x24BDB8288]();
}

uint64_t sub_23E8A2648()
{
  return MEMORY[0x24BDB82C0]();
}

uint64_t sub_23E8A2654()
{
  return MEMORY[0x24BDB82D8]();
}

uint64_t sub_23E8A2660()
{
  return MEMORY[0x24BDB82F8]();
}

uint64_t sub_23E8A266C()
{
  return MEMORY[0x24BDB8308]();
}

uint64_t sub_23E8A2678()
{
  return MEMORY[0x24BDB8338]();
}

uint64_t sub_23E8A2684()
{
  return MEMORY[0x24BDB9790]();
}

uint64_t sub_23E8A2690()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_23E8A269C()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_23E8A26A8()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_23E8A26B4()
{
  return MEMORY[0x24BDB9D80]();
}

uint64_t sub_23E8A26C0()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_23E8A26CC()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_23E8A26D8()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_23E8A26E4()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_23E8A26F0()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_23E8A26FC()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_23E8A2708()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_23E8A2714()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_23E8A2720()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_23E8A272C()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_23E8A2738()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_23E8A2744()
{
  return MEMORY[0x24BDEAF58]();
}

uint64_t sub_23E8A2750()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_23E8A275C()
{
  return MEMORY[0x24BDEB1D8]();
}

uint64_t sub_23E8A2768()
{
  return MEMORY[0x24BDEB1F0]();
}

uint64_t sub_23E8A2774()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_23E8A2780()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_23E8A278C()
{
  return MEMORY[0x24BDEB4C0]();
}

uint64_t sub_23E8A2798()
{
  return MEMORY[0x24BDEB4D0]();
}

uint64_t sub_23E8A27A4()
{
  return MEMORY[0x24BDEB4E8]();
}

uint64_t sub_23E8A27B0()
{
  return MEMORY[0x24BDEB4F0]();
}

uint64_t sub_23E8A27BC()
{
  return MEMORY[0x24BDEB4F8]();
}

uint64_t sub_23E8A27C8()
{
  return MEMORY[0x24BDEB540]();
}

uint64_t sub_23E8A27D4()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_23E8A27E0()
{
  return MEMORY[0x24BDEB5B8]();
}

uint64_t sub_23E8A27EC()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_23E8A27F8()
{
  return MEMORY[0x24BDEB828]();
}

uint64_t sub_23E8A2804()
{
  return MEMORY[0x24BDEB8A8]();
}

uint64_t sub_23E8A2810()
{
  return MEMORY[0x24BDEBBC8]();
}

uint64_t sub_23E8A281C()
{
  return MEMORY[0x24BDEBC10]();
}

uint64_t sub_23E8A2828()
{
  return MEMORY[0x24BDEBC38]();
}

uint64_t sub_23E8A2834()
{
  return MEMORY[0x24BDEBC40]();
}

uint64_t sub_23E8A2840()
{
  return MEMORY[0x24BDEBD10]();
}

uint64_t sub_23E8A284C()
{
  return MEMORY[0x24BDEBD28]();
}

uint64_t sub_23E8A2858()
{
  return MEMORY[0x24BDEBD78]();
}

uint64_t sub_23E8A2864()
{
  return MEMORY[0x24BDEBD80]();
}

uint64_t sub_23E8A2870()
{
  return MEMORY[0x24BDEBD88]();
}

uint64_t sub_23E8A287C()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_23E8A2888()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_23E8A2894()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_23E8A28A0()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_23E8A28AC()
{
  return MEMORY[0x24BDEBF88]();
}

uint64_t sub_23E8A28B8()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_23E8A28C4()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_23E8A28D0()
{
  return MEMORY[0x24BDEC158]();
}

uint64_t sub_23E8A28DC()
{
  return MEMORY[0x24BDEC260]();
}

uint64_t sub_23E8A28E8()
{
  return MEMORY[0x24BDEC268]();
}

uint64_t sub_23E8A28F4()
{
  return MEMORY[0x24BDEC280]();
}

uint64_t sub_23E8A2900()
{
  return MEMORY[0x24BDEC298]();
}

uint64_t sub_23E8A290C()
{
  return MEMORY[0x24BDEC2E0]();
}

uint64_t sub_23E8A2918()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_23E8A2924()
{
  return MEMORY[0x24BDEC590]();
}

uint64_t sub_23E8A2930()
{
  return MEMORY[0x24BDEC728]();
}

uint64_t sub_23E8A293C()
{
  return MEMORY[0x24BDEC730]();
}

uint64_t sub_23E8A2948()
{
  return MEMORY[0x24BDEC778]();
}

uint64_t sub_23E8A2954()
{
  return MEMORY[0x24BDEC7A8]();
}

uint64_t sub_23E8A2960()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_23E8A296C()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_23E8A2978()
{
  return MEMORY[0x24BDECC00]();
}

uint64_t sub_23E8A2984()
{
  return MEMORY[0x24BDECD20]();
}

uint64_t sub_23E8A2990()
{
  return MEMORY[0x24BDECE88]();
}

uint64_t sub_23E8A299C()
{
  return MEMORY[0x24BDECEE8]();
}

uint64_t sub_23E8A29A8()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_23E8A29B4()
{
  return MEMORY[0x24BDED128]();
}

uint64_t sub_23E8A29C0()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_23E8A29CC()
{
  return MEMORY[0x24BDED1E0]();
}

uint64_t sub_23E8A29D8()
{
  return MEMORY[0x24BDED250]();
}

uint64_t sub_23E8A29E4()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_23E8A29F0()
{
  return MEMORY[0x24BDED330]();
}

uint64_t sub_23E8A29FC()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_23E8A2A08()
{
  return MEMORY[0x24BDED8F0]();
}

uint64_t sub_23E8A2A14()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_23E8A2A20()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_23E8A2A2C()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_23E8A2A38()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_23E8A2A44()
{
  return MEMORY[0x24BDEDEC0]();
}

uint64_t sub_23E8A2A50()
{
  return MEMORY[0x24BDEDEC8]();
}

uint64_t sub_23E8A2A5C()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_23E8A2A68()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_23E8A2A74()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t sub_23E8A2A80()
{
  return MEMORY[0x24BDEE028]();
}

uint64_t sub_23E8A2A8C()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_23E8A2A98()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_23E8A2AA4()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_23E8A2AB0()
{
  return MEMORY[0x24BDEE080]();
}

uint64_t sub_23E8A2ABC()
{
  return MEMORY[0x24BDEE148]();
}

uint64_t sub_23E8A2AC8()
{
  return MEMORY[0x24BDEE150]();
}

uint64_t sub_23E8A2AD4()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_23E8A2AE0()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_23E8A2AEC()
{
  return MEMORY[0x24BDEE1C0]();
}

uint64_t sub_23E8A2AF8()
{
  return MEMORY[0x24BDEE1F0]();
}

uint64_t sub_23E8A2B04()
{
  return MEMORY[0x24BDEE1F8]();
}

uint64_t sub_23E8A2B10()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_23E8A2B1C()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_23E8A2B28()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_23E8A2B34()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_23E8A2B40()
{
  return MEMORY[0x24BDEE400]();
}

uint64_t sub_23E8A2B4C()
{
  return MEMORY[0x24BDEE410]();
}

uint64_t sub_23E8A2B58()
{
  return MEMORY[0x24BDEE448]();
}

uint64_t sub_23E8A2B64()
{
  return MEMORY[0x24BDEE450]();
}

uint64_t sub_23E8A2B70()
{
  return MEMORY[0x24BDFAAC0]();
}

uint64_t sub_23E8A2B7C()
{
  return MEMORY[0x24BDFAAC8]();
}

uint64_t sub_23E8A2B88()
{
  return MEMORY[0x24BDFAAD0]();
}

uint64_t sub_23E8A2B94()
{
  return MEMORY[0x24BDFAAE8]();
}

uint64_t sub_23E8A2BA0()
{
  return MEMORY[0x24BDFAB60]();
}

uint64_t sub_23E8A2BAC()
{
  return MEMORY[0x24BDFAB68]();
}

uint64_t sub_23E8A2BB8()
{
  return MEMORY[0x24BDFAB78]();
}

uint64_t sub_23E8A2BC4()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_23E8A2BD0()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_23E8A2BDC()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_23E8A2BE8()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_23E8A2BF4()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_23E8A2C00()
{
  return MEMORY[0x24BDEE608]();
}

uint64_t sub_23E8A2C0C()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_23E8A2C18()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_23E8A2C24()
{
  return MEMORY[0x24BDEE9E8]();
}

uint64_t sub_23E8A2C30()
{
  return MEMORY[0x24BDEEA08]();
}

uint64_t sub_23E8A2C3C()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_23E8A2C48()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_23E8A2C54()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_23E8A2C60()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_23E8A2C6C()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_23E8A2C78()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_23E8A2C84()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_23E8A2C90()
{
  return MEMORY[0x24BDEEDD8]();
}

uint64_t sub_23E8A2C9C()
{
  return MEMORY[0x24BDEEE00]();
}

uint64_t sub_23E8A2CA8()
{
  return MEMORY[0x24BDEEF48]();
}

uint64_t sub_23E8A2CB4()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_23E8A2CC0()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_23E8A2CCC()
{
  return MEMORY[0x24BDEEF80]();
}

uint64_t sub_23E8A2CD8()
{
  return MEMORY[0x24BDEF0D8]();
}

uint64_t sub_23E8A2CE4()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_23E8A2CF0()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23E8A2CFC()
{
  return MEMORY[0x24BDEF540]();
}

uint64_t sub_23E8A2D08()
{
  return MEMORY[0x24BDEF5B8]();
}

uint64_t sub_23E8A2D14()
{
  return MEMORY[0x24BDEF6A8]();
}

uint64_t sub_23E8A2D20()
{
  return MEMORY[0x24BDEF6B0]();
}

uint64_t sub_23E8A2D2C()
{
  return MEMORY[0x24BDEF6E0]();
}

uint64_t sub_23E8A2D38()
{
  return MEMORY[0x24BDEF740]();
}

uint64_t sub_23E8A2D44()
{
  return MEMORY[0x24BDEF998]();
}

uint64_t sub_23E8A2D50()
{
  return MEMORY[0x24BDEFA78]();
}

uint64_t sub_23E8A2D5C()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_23E8A2D68()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_23E8A2D74()
{
  return MEMORY[0x24BDF0138]();
}

uint64_t sub_23E8A2D80()
{
  return MEMORY[0x24BDF0BD8]();
}

uint64_t sub_23E8A2D8C()
{
  return MEMORY[0x24BDF0BF8]();
}

uint64_t sub_23E8A2D98()
{
  return MEMORY[0x24BDF0C28]();
}

uint64_t sub_23E8A2DA4()
{
  return MEMORY[0x24BDF0C30]();
}

uint64_t sub_23E8A2DB0()
{
  return MEMORY[0x24BDFABF0]();
}

uint64_t sub_23E8A2DBC()
{
  return MEMORY[0x24BDF0DC8]();
}

uint64_t sub_23E8A2DC8()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_23E8A2DD4()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_23E8A2DE0()
{
  return MEMORY[0x24BDF1450]();
}

uint64_t sub_23E8A2DEC()
{
  return MEMORY[0x24BDF1458]();
}

uint64_t sub_23E8A2DF8()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_23E8A2E04()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_23E8A2E10()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_23E8A2E1C()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_23E8A2E28()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_23E8A2E34()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_23E8A2E40()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_23E8A2E4C()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_23E8A2E58()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_23E8A2E64()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_23E8A2E70()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_23E8A2E7C()
{
  return MEMORY[0x24BDF1600]();
}

uint64_t sub_23E8A2E88()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_23E8A2E94()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_23E8A2EA0()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_23E8A2EAC()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_23E8A2EB8()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_23E8A2EC4()
{
  return MEMORY[0x24BDF1728]();
}

uint64_t sub_23E8A2ED0()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_23E8A2EDC()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_23E8A2EE8()
{
  return MEMORY[0x24BDF1790]();
}

uint64_t sub_23E8A2EF4()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_23E8A2F00()
{
  return MEMORY[0x24BDF17D8]();
}

uint64_t sub_23E8A2F0C()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_23E8A2F18()
{
  return MEMORY[0x24BDF1818]();
}

uint64_t sub_23E8A2F24()
{
  return MEMORY[0x24BDF1820]();
}

uint64_t sub_23E8A2F30()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_23E8A2F3C()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_23E8A2F48()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_23E8A2F54()
{
  return MEMORY[0x24BDF1930]();
}

uint64_t sub_23E8A2F60()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_23E8A2F6C()
{
  return MEMORY[0x24BDF1BE0]();
}

uint64_t sub_23E8A2F78()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_23E8A2F84()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_23E8A2F90()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_23E8A2F9C()
{
  return MEMORY[0x24BDF1D68]();
}

uint64_t sub_23E8A2FA8()
{
  return MEMORY[0x24BDF1D98]();
}

uint64_t sub_23E8A2FB4()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_23E8A2FC0()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_23E8A2FCC()
{
  return MEMORY[0x24BDF1DE0]();
}

uint64_t sub_23E8A2FD8()
{
  return MEMORY[0x24BDF1DE8]();
}

uint64_t sub_23E8A2FE4()
{
  return MEMORY[0x24BDF1EA0]();
}

uint64_t sub_23E8A2FF0()
{
  return MEMORY[0x24BDF1FB8]();
}

uint64_t sub_23E8A2FFC()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_23E8A3008()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_23E8A3014()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23E8A3020()
{
  return MEMORY[0x24BDF1FF8]();
}

uint64_t sub_23E8A302C()
{
  return MEMORY[0x24BDB8358]();
}

uint64_t sub_23E8A3038()
{
  return MEMORY[0x24BDB8378]();
}

uint64_t sub_23E8A3044()
{
  return MEMORY[0x24BDB8388]();
}

uint64_t sub_23E8A3050()
{
  return MEMORY[0x24BDB83A8]();
}

uint64_t sub_23E8A305C()
{
  return MEMORY[0x24BDB83D8]();
}

uint64_t sub_23E8A3068()
{
  return MEMORY[0x24BDB8408]();
}

uint64_t sub_23E8A3074()
{
  return MEMORY[0x24BDB8418]();
}

uint64_t sub_23E8A3080()
{
  return MEMORY[0x24BDB8428]();
}

uint64_t sub_23E8A308C()
{
  return MEMORY[0x24BDFAC08]();
}

uint64_t sub_23E8A3098()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23E8A30A4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23E8A30B0()
{
  return MEMORY[0x24BDF2128]();
}

uint64_t sub_23E8A30BC()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_23E8A30C8()
{
  return MEMORY[0x24BDF2260]();
}

uint64_t sub_23E8A30D4()
{
  return MEMORY[0x24BDF2330]();
}

uint64_t sub_23E8A30E0()
{
  return MEMORY[0x24BDF23E0]();
}

uint64_t sub_23E8A30EC()
{
  return MEMORY[0x24BDF2530]();
}

uint64_t sub_23E8A30F8()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_23E8A3104()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23E8A3110()
{
  return MEMORY[0x24BDF27E0]();
}

uint64_t sub_23E8A311C()
{
  return MEMORY[0x24BDF27F0]();
}

uint64_t sub_23E8A3128()
{
  return MEMORY[0x24BDF2890]();
}

uint64_t sub_23E8A3134()
{
  return MEMORY[0x24BDF29A0]();
}

uint64_t sub_23E8A3140()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_23E8A314C()
{
  return MEMORY[0x24BDF2DB8]();
}

uint64_t sub_23E8A3158()
{
  return MEMORY[0x24BDF2DD0]();
}

uint64_t sub_23E8A3164()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_23E8A3170()
{
  return MEMORY[0x24BDF3390]();
}

uint64_t sub_23E8A317C()
{
  return MEMORY[0x24BDF3470]();
}

uint64_t sub_23E8A3188()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_23E8A3194()
{
  return MEMORY[0x24BDF3768]();
}

uint64_t sub_23E8A31A0()
{
  return MEMORY[0x24BDF3840]();
}

uint64_t sub_23E8A31AC()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_23E8A31B8()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_23E8A31C4()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_23E8A31D0()
{
  return MEMORY[0x24BDF3A30]();
}

uint64_t sub_23E8A31DC()
{
  return MEMORY[0x24BDF3A68]();
}

uint64_t sub_23E8A31E8()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_23E8A31F4()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_23E8A3200()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_23E8A320C()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_23E8A3218()
{
  return MEMORY[0x24BDF3C98]();
}

uint64_t sub_23E8A3224()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_23E8A3230()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_23E8A323C()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_23E8A3248()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t sub_23E8A3254()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_23E8A3260()
{
  return MEMORY[0x24BDF3D50]();
}

uint64_t sub_23E8A326C()
{
  return MEMORY[0x24BDF3D60]();
}

uint64_t sub_23E8A3278()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_23E8A3284()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_23E8A3290()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_23E8A329C()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_23E8A32A8()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_23E8A32B4()
{
  return MEMORY[0x24BDF3EC0]();
}

uint64_t sub_23E8A32C0()
{
  return MEMORY[0x24BDF3F78]();
}

uint64_t sub_23E8A32CC()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_23E8A32D8()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_23E8A32E4()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t sub_23E8A32F0()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_23E8A32FC()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_23E8A3308()
{
  return MEMORY[0x24BDF4170]();
}

uint64_t sub_23E8A3314()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_23E8A3320()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_23E8A332C()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_23E8A3338()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_23E8A3344()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_23E8A3350()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_23E8A335C()
{
  return MEMORY[0x24BDF44E0]();
}

uint64_t sub_23E8A3368()
{
  return MEMORY[0x24BDF44E8]();
}

uint64_t sub_23E8A3374()
{
  return MEMORY[0x24BDF44F0]();
}

uint64_t sub_23E8A3380()
{
  return MEMORY[0x24BDF4508]();
}

uint64_t sub_23E8A338C()
{
  return MEMORY[0x24BDF4510]();
}

uint64_t sub_23E8A3398()
{
  return MEMORY[0x24BDF4550]();
}

uint64_t sub_23E8A33A4()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_23E8A33B0()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_23E8A33BC()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_23E8A33C8()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_23E8A33D4()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_23E8A33E0()
{
  return MEMORY[0x24BDB8488]();
}

uint64_t sub_23E8A33EC()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_23E8A33F8()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_23E8A3404()
{
  return MEMORY[0x24BDF4A28]();
}

uint64_t sub_23E8A3410()
{
  return MEMORY[0x24BDF4A40]();
}

uint64_t sub_23E8A341C()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_23E8A3428()
{
  return MEMORY[0x24BDF4D48]();
}

uint64_t sub_23E8A3434()
{
  return MEMORY[0x24BDF4D58]();
}

uint64_t sub_23E8A3440()
{
  return MEMORY[0x24BDF4D80]();
}

uint64_t sub_23E8A344C()
{
  return MEMORY[0x24BDF4E20]();
}

uint64_t sub_23E8A3458()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_23E8A3464()
{
  return MEMORY[0x24BDF4EC0]();
}

uint64_t sub_23E8A3470()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23E8A347C()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_23E8A3488()
{
  return MEMORY[0x24BDF4FC8]();
}

uint64_t sub_23E8A3494()
{
  return MEMORY[0x24BDF5118]();
}

uint64_t sub_23E8A34A0()
{
  return MEMORY[0x24BDF51E8]();
}

uint64_t sub_23E8A34AC()
{
  return MEMORY[0x24BDF5448]();
}

uint64_t sub_23E8A34B8()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_23E8A34C4()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_23E8A34D0()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_23E8A34DC()
{
  return MEMORY[0x24BE2E8E0]();
}

uint64_t sub_23E8A34E8()
{
  return MEMORY[0x24BE2E8E8]();
}

uint64_t sub_23E8A34F4()
{
  return MEMORY[0x24BE2E8F0]();
}

uint64_t sub_23E8A3500()
{
  return MEMORY[0x24BE2E8F8]();
}

uint64_t sub_23E8A350C()
{
  return MEMORY[0x24BE2E900]();
}

uint64_t sub_23E8A3518()
{
  return MEMORY[0x24BE2E908]();
}

uint64_t sub_23E8A3524()
{
  return MEMORY[0x24BE2E950]();
}

uint64_t sub_23E8A3530()
{
  return MEMORY[0x24BE2E958]();
}

uint64_t sub_23E8A353C()
{
  return MEMORY[0x24BE2E960]();
}

uint64_t sub_23E8A3548()
{
  return MEMORY[0x24BE2E968]();
}

uint64_t sub_23E8A3554()
{
  return MEMORY[0x24BE2E970]();
}

uint64_t sub_23E8A3560()
{
  return MEMORY[0x24BE2E978]();
}

uint64_t sub_23E8A356C()
{
  return MEMORY[0x24BE2E980]();
}

uint64_t sub_23E8A3578()
{
  return MEMORY[0x24BE2E990]();
}

uint64_t sub_23E8A3584()
{
  return MEMORY[0x24BE2E998]();
}

uint64_t sub_23E8A3590()
{
  return MEMORY[0x24BE2E9C0]();
}

uint64_t sub_23E8A359C()
{
  return MEMORY[0x24BE2E9D0]();
}

uint64_t sub_23E8A35A8()
{
  return MEMORY[0x24BE2E9F8]();
}

uint64_t sub_23E8A35B4()
{
  return MEMORY[0x24BE2EA00]();
}

uint64_t sub_23E8A35C0()
{
  return MEMORY[0x24BE2EA08]();
}

uint64_t sub_23E8A35CC()
{
  return MEMORY[0x24BE2EA10]();
}

uint64_t sub_23E8A35D8()
{
  return MEMORY[0x24BE2EA18]();
}

uint64_t sub_23E8A35E4()
{
  return MEMORY[0x24BE2EA20]();
}

uint64_t sub_23E8A35F0()
{
  return MEMORY[0x24BE2EA28]();
}

uint64_t sub_23E8A35FC()
{
  return MEMORY[0x24BE2EA30]();
}

uint64_t sub_23E8A3608()
{
  return MEMORY[0x24BE2EA38]();
}

uint64_t sub_23E8A3614()
{
  return MEMORY[0x24BE2EA40]();
}

uint64_t sub_23E8A3620()
{
  return MEMORY[0x24BE2EA48]();
}

uint64_t sub_23E8A362C()
{
  return MEMORY[0x24BE2EA50]();
}

uint64_t sub_23E8A3638()
{
  return MEMORY[0x24BE2EA58]();
}

uint64_t sub_23E8A3644()
{
  return MEMORY[0x24BE2EA60]();
}

uint64_t sub_23E8A3650()
{
  return MEMORY[0x24BE2EA70]();
}

uint64_t sub_23E8A365C()
{
  return MEMORY[0x24BE2EA80]();
}

uint64_t sub_23E8A3668()
{
  return MEMORY[0x24BE2EA90]();
}

uint64_t sub_23E8A3674()
{
  return MEMORY[0x24BE2EA98]();
}

uint64_t sub_23E8A3680()
{
  return MEMORY[0x24BE2EAC0]();
}

uint64_t sub_23E8A368C()
{
  return MEMORY[0x24BE2EAE0]();
}

uint64_t sub_23E8A3698()
{
  return MEMORY[0x24BE2EAE8]();
}

uint64_t sub_23E8A36A4()
{
  return MEMORY[0x24BE2EAF0]();
}

uint64_t sub_23E8A36B0()
{
  return MEMORY[0x24BE2EAF8]();
}

uint64_t sub_23E8A36BC()
{
  return MEMORY[0x24BE2EB00]();
}

uint64_t sub_23E8A36C8()
{
  return MEMORY[0x24BE2EB08]();
}

uint64_t sub_23E8A36D4()
{
  return MEMORY[0x24BE2EB10]();
}

uint64_t sub_23E8A36E0()
{
  return MEMORY[0x24BE2EB18]();
}

uint64_t sub_23E8A36EC()
{
  return MEMORY[0x24BE2EB20]();
}

uint64_t sub_23E8A36F8()
{
  return MEMORY[0x24BE2EB28]();
}

uint64_t sub_23E8A3704()
{
  return MEMORY[0x24BE2EB30]();
}

uint64_t sub_23E8A3710()
{
  return MEMORY[0x24BE2EB38]();
}

uint64_t sub_23E8A371C()
{
  return MEMORY[0x24BE2EB40]();
}

uint64_t sub_23E8A3728()
{
  return MEMORY[0x24BE2EB48]();
}

uint64_t sub_23E8A3734()
{
  return MEMORY[0x24BE2EB50]();
}

uint64_t sub_23E8A3740()
{
  return MEMORY[0x24BE2EB58]();
}

uint64_t sub_23E8A374C()
{
  return MEMORY[0x24BE2EB60]();
}

uint64_t sub_23E8A3758()
{
  return MEMORY[0x24BE2EB68]();
}

uint64_t sub_23E8A3764()
{
  return MEMORY[0x24BE2EB70]();
}

uint64_t sub_23E8A3770()
{
  return MEMORY[0x24BE2EB78]();
}

uint64_t sub_23E8A377C()
{
  return MEMORY[0x24BE2EB80]();
}

uint64_t sub_23E8A3788()
{
  return MEMORY[0x24BE2EB88]();
}

uint64_t sub_23E8A3794()
{
  return MEMORY[0x24BE2EB90]();
}

uint64_t sub_23E8A37A0()
{
  return MEMORY[0x24BE2EB98]();
}

uint64_t sub_23E8A37AC()
{
  return MEMORY[0x24BE2EBA0]();
}

uint64_t sub_23E8A37B8()
{
  return MEMORY[0x24BE2EBA8]();
}

uint64_t sub_23E8A37C4()
{
  return MEMORY[0x24BE2EBB0]();
}

uint64_t sub_23E8A37D0()
{
  return MEMORY[0x24BDFACA8]();
}

uint64_t sub_23E8A37DC()
{
  return MEMORY[0x24BDFACB0]();
}

uint64_t sub_23E8A37E8()
{
  return MEMORY[0x24BDFADC0]();
}

uint64_t sub_23E8A37F4()
{
  return MEMORY[0x24BDFADC8]();
}

uint64_t sub_23E8A3800()
{
  return MEMORY[0x24BDFADE0]();
}

uint64_t sub_23E8A380C()
{
  return MEMORY[0x24BDFAF10]();
}

uint64_t sub_23E8A3818()
{
  return MEMORY[0x24BDCF7E8]();
}

uint64_t sub_23E8A3824()
{
  return MEMORY[0x24BDCF7F0]();
}

uint64_t sub_23E8A3830()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23E8A383C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23E8A3848()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23E8A3854()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23E8A3860()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23E8A386C()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_23E8A3878()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23E8A3884()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23E8A3890()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_23E8A389C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23E8A38A8()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_23E8A38B4()
{
  return MEMORY[0x24BDCF8F8]();
}

uint64_t sub_23E8A38C0()
{
  return MEMORY[0x24BDCF910]();
}

uint64_t sub_23E8A38CC()
{
  return MEMORY[0x24BDCF930]();
}

uint64_t sub_23E8A38D8()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t sub_23E8A38E4()
{
  return MEMORY[0x24BDCF948]();
}

uint64_t sub_23E8A38F0()
{
  return MEMORY[0x24BDCF968]();
}

uint64_t sub_23E8A38FC()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_23E8A3908()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23E8A3914()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23E8A3920()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_23E8A392C()
{
  return MEMORY[0x24BDCFA68]();
}

uint64_t sub_23E8A3938()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23E8A3944()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23E8A3950()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23E8A395C()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_23E8A3968()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23E8A3974()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_23E8A3980()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_23E8A398C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23E8A3998()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_23E8A39A4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23E8A39B0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23E8A39BC()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23E8A39C8()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23E8A39D4()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_23E8A39E0()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_23E8A39EC()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_23E8A39F8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23E8A3A04()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23E8A3A10()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23E8A3A1C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23E8A3A28()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23E8A3A34()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23E8A3A40()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23E8A3A4C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23E8A3A58()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23E8A3A64()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23E8A3A70()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23E8A3A7C()
{
  return MEMORY[0x24BEE6AD8]();
}

uint64_t sub_23E8A3A88()
{
  return MEMORY[0x24BEE6B00]();
}

uint64_t sub_23E8A3A94()
{
  return MEMORY[0x24BEE6B28]();
}

uint64_t sub_23E8A3AA0()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_23E8A3AAC()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23E8A3AB8()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_23E8A3AC4()
{
  return MEMORY[0x24BEE1758]();
}

uint64_t sub_23E8A3AD0()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_23E8A3ADC()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_23E8A3AE8()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_23E8A3AF4()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_23E8A3B00()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_23E8A3B0C()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_23E8A3B18()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23E8A3B24()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23E8A3B30()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23E8A3B3C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23E8A3B48()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23E8A3B54()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_23E8A3B60()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_23E8A3B6C()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_23E8A3B78()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_23E8A3B84()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_23E8A3B90()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_23E8A3B9C()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_23E8A3BA8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23E8A3BB4()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_23E8A3BC0()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_23E8A3BCC()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_23E8A3BD8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23E8A3BE4()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_23E8A3BF0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23E8A3BFC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23E8A3C08()
{
  return MEMORY[0x24BDD04F0]();
}

uint64_t sub_23E8A3C14()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_23E8A3C20()
{
  return MEMORY[0x24BDD0660]();
}

uint64_t sub_23E8A3C2C()
{
  return MEMORY[0x24BDD0668]();
}

uint64_t sub_23E8A3C38()
{
  return MEMORY[0x24BDD0678]();
}

uint64_t sub_23E8A3C44()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23E8A3C50()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_23E8A3C5C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23E8A3C68()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23E8A3C74()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23E8A3C80()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_23E8A3C8C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23E8A3C98()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23E8A3CA4()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23E8A3CB0()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23E8A3CBC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23E8A3CC8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23E8A3CD4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23E8A3CE0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23E8A3CEC()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23E8A3CF8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23E8A3D04()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23E8A3D10()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23E8A3D1C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23E8A3D28()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23E8A3D34()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23E8A3D40()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23E8A3D4C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23E8A3D58()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23E8A3D64()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23E8A3D70()
{
  return MEMORY[0x24BEE38F0]();
}

uint64_t sub_23E8A3D7C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_23E8A3D88()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23E8A3D94()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_23E8A3DA0()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_23E8A3DAC()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23E8A3DB8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23E8A3DC4()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_23E8A3DD0()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_23E8A3DDC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23E8A3DE8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23E8A3DF4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23E8A3E00()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23E8A3E0C()
{
  return MEMORY[0x24BEE3F18]();
}

uint64_t sub_23E8A3E18()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_23E8A3E24()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23E8A3E30()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23E8A3E3C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23E8A3E48()
{
  return MEMORY[0x24BEE4A18]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x24BDBFA08]((__n128)coord, *(__n128 *)&coord.longitude);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x24BEE7198]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x24BEE71A0]();
}

uint64_t swift_asyncLet_get()
{
  return MEMORY[0x24BEE71A8]();
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
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


uint64_t DeviceActivityReport.Context.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DeviceActivityReport.Context.rawValue.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*DeviceActivityReport.Context.rawValue.modify())()
{
  return nullsub_1;
}

_DeviceActivity_SwiftUI::DeviceActivityReport::Context __swiftcall DeviceActivityReport.Context.init(_:)(_DeviceActivity_SwiftUI::DeviceActivityReport::Context result)
{
  _DeviceActivity_SwiftUI::DeviceActivityReport::Context *v1;

  *v1 = result;
  return result;
}

_DeviceActivity_SwiftUI::DeviceActivityReport::Context __swiftcall DeviceActivityReport.Context.init(rawValue:)(_DeviceActivity_SwiftUI::DeviceActivityReport::Context rawValue)
{
  _DeviceActivity_SwiftUI::DeviceActivityReport::Context *v1;

  *v1 = rawValue;
  return rawValue;
}

_QWORD *sub_2290F32E4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_2290F32F0@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2290F32FC()
{
  sub_22910AB80();
  swift_bridgeObjectRetain();
  sub_22910A8C8();
  swift_bridgeObjectRelease();
  return sub_22910AB98();
}

uint64_t sub_2290F3354()
{
  swift_bridgeObjectRetain();
  sub_22910A8C8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2290F3398()
{
  sub_22910AB80();
  swift_bridgeObjectRetain();
  sub_22910A8C8();
  swift_bridgeObjectRelease();
  return sub_22910AB98();
}

uint64_t sub_2290F33EC(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_22910AB5C();
}

double DeviceActivityReport.init(_:filter:)@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  double result;
  __int128 v12;
  uint64_t v13[2];
  _OWORD v14[2];

  v6 = sub_22910A664();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1[1];
  v13[0] = *a1;
  v13[1] = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  DeviceActivityReport.init(_:filter:extensionIdentifier:)(v13, (uint64_t)v9, 0, 0, (unint64_t *)v14);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  result = *(double *)v14;
  v12 = v14[1];
  *a3 = v14[0];
  a3[1] = v12;
  return result;
}

uint64_t DeviceActivityReport.init(_:filter:extensionIdentifier:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
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
  char *v34;
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
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t result;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  __int128 v84;
  uint64_t v85;
  void (*v86)(char *, uint64_t);
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  char *v93;
  void (*v94)(char *, unint64_t, uint64_t);
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  os_log_type_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  char *v118;
  void (*v119)(char *, uint64_t);
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  void (*v125)(char *, unint64_t, uint64_t);
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  NSObject *v130;
  os_log_type_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  char *v146;
  void (*v147)(char *, uint64_t);
  unint64_t v148;
  unint64_t v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  void (*v153)(char *, unint64_t, uint64_t);
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  NSObject *v158;
  os_log_type_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  BOOL v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  int *v171;
  uint64_t v172;
  uint64_t *v173;
  uint64_t v174;
  uint64_t *v175;
  uint64_t v176;
  _QWORD *v177;
  uint64_t v178;
  unint64_t v179;
  uint64_t v180;
  unint64_t v181;
  unint64_t v182;
  uint64_t v183;
  unint64_t *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  int v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  _QWORD *v202;
  uint64_t v203;
  uint64_t v204;
  unint64_t *v205;
  uint64_t v206;
  char *v207;
  uint64_t v208;
  char *v209;
  char *v210;
  uint64_t v211;
  char *v212;
  char *v213;
  char *v214;
  char *v215;
  char *v216;
  void (*v217)(char *, uint64_t);
  char *v218;
  uint64_t v219;
  char *v220;
  char *v221;
  uint64_t v222;
  __int128 v223;
  char *v224;
  char *v225;
  char *v226;
  char *v227;
  uint64_t v228;
  char *v229;
  uint64_t v230;
  char *v231;

  v204 = a4;
  v203 = a3;
  v205 = a5;
  v228 = sub_22910A700();
  v219 = *(_QWORD *)(v228 - 8);
  v7 = MEMORY[0x24BDAC7A8](v228);
  v209 = (char *)&v185 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v216 = (char *)&v185 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v213 = (char *)&v185 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v218 = (char *)&v185 - v13;
  v206 = sub_22910A6DC();
  v222 = *(_QWORD *)(v206 - 8);
  v14 = MEMORY[0x24BDAC7A8](v206);
  v210 = (char *)&v185 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v221 = (char *)&v185 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v220 = (char *)&v185 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v227 = (char *)&v185 - v20;
  v21 = sub_22910A6B8();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v212 = (char *)&v185 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v226 = (char *)&v185 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v215 = (char *)&v185 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v214 = (char *)&v185 - v29;
  v30 = sub_22910A4C0();
  v31 = *(_QWORD *)(v30 - 8);
  v32 = MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v185 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v32);
  v229 = (char *)&v185 - v35;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A27870);
  MEMORY[0x24BDAC7A8](v36);
  v225 = (char *)&v185 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A27508);
  MEMORY[0x24BDAC7A8](v38);
  v224 = (char *)&v185 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v200 = sub_22910A3E8();
  v199 = *(_QWORD *)(v200 - 8);
  MEMORY[0x24BDAC7A8](v200);
  v207 = (char *)&v185 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_22910A598();
  v42 = *(_QWORD *)(v41 - 8);
  v43 = MEMORY[0x24BDAC7A8](v41);
  *(_QWORD *)&v223 = (char *)&v185 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v43);
  v46 = (char *)&v185 - v45;
  v201 = type metadata accessor for DeviceActivityReport.ClientConfiguration();
  MEMORY[0x24BDAC7A8](v201);
  v202 = (uint64_t *)((char *)&v185 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0));
  v198 = *a1;
  v197 = a1[1];
  sub_22910A5A4();
  v196 = DeviceActivityFilter.SegmentInterval.rawValue.getter();
  v217 = *(void (**)(char *, uint64_t))(v42 + 8);
  v217(v46, v41);
  v48 = (char *)v223;
  sub_22910A5A4();
  sub_22910A58C();
  v49 = v41;
  v50 = (uint64_t)v224;
  v217(v48, v49);
  v208 = a2;
  sub_22910A604();
  v51 = sub_22910A5F8();
  v52 = *(_QWORD *)(v51 - 8);
  v195 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v50, 1, v51);
  if (v195 == 1)
  {
    sub_2290F58B0(v50, &qword_255A27508);
    v194 = 0;
  }
  else
  {
    v194 = sub_22910A5EC();
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v50, v51);
  }
  v53 = (uint64_t)v225;
  sub_22910A634();
  v54 = sub_22910A61C();
  v55 = *(_QWORD *)(v54 - 8);
  v56 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v55 + 48))(v53, 1, v54);
  v57 = MEMORY[0x24BEE4B08];
  if (v56 == 1)
  {
    sub_2290F58B0(v53, &qword_255A27870);
    v186 = 0;
    goto LABEL_31;
  }
  v58 = sub_22910A610();
  v59 = v53;
  v60 = v58;
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v59, v54);
  v230 = v57;
  v61 = v60 + 56;
  v62 = 1 << *(_BYTE *)(v60 + 32);
  v63 = -1;
  if (v62 < 64)
    v63 = ~(-1 << v62);
  v64 = v63 & *(_QWORD *)(v60 + 56);
  v225 = (char *)((unint64_t)(v62 + 63) >> 6);
  result = swift_bridgeObjectRetain();
  v66 = 0;
  while (1)
  {
    if (v64)
    {
      v67 = __clz(__rbit64(v64));
      v64 &= v64 - 1;
      v68 = v67 | (v66 << 6);
      goto LABEL_10;
    }
    v71 = v66 + 1;
    if (__OFADD__(v66, 1))
      goto LABEL_131;
    if (v71 >= (uint64_t)v225)
      goto LABEL_30;
    v72 = *(_QWORD *)(v61 + 8 * v71);
    ++v66;
    if (!v72)
    {
      v66 = v71 + 1;
      if (v71 + 1 >= (uint64_t)v225)
        goto LABEL_30;
      v72 = *(_QWORD *)(v61 + 8 * v66);
      if (!v72)
      {
        v66 = v71 + 2;
        if (v71 + 2 >= (uint64_t)v225)
          goto LABEL_30;
        v72 = *(_QWORD *)(v61 + 8 * v66);
        if (!v72)
        {
          v66 = v71 + 3;
          if (v71 + 3 >= (uint64_t)v225)
            goto LABEL_30;
          v72 = *(_QWORD *)(v61 + 8 * v66);
          if (!v72)
          {
            v66 = v71 + 4;
            if (v71 + 4 >= (uint64_t)v225)
              goto LABEL_30;
            v72 = *(_QWORD *)(v61 + 8 * v66);
            if (!v72)
              break;
          }
        }
      }
    }
LABEL_29:
    v64 = (v72 - 1) & v72;
    v68 = __clz(__rbit64(v72)) + (v66 << 6);
LABEL_10:
    v69 = v229;
    (*(void (**)(char *, unint64_t, uint64_t))(v31 + 16))(v229, *(_QWORD *)(v60 + 48) + *(_QWORD *)(v31 + 72) * v68, v30);
    (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v34, v69, v30);
    v70 = sub_22910A4B4();
    sub_2290F51EC((uint64_t *)&v231, v70);
    result = (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v34, v30);
  }
  v73 = v71 + 5;
  if (v73 >= (uint64_t)v225)
    goto LABEL_30;
  v72 = *(_QWORD *)(v61 + 8 * v73);
  if (v72)
  {
    v66 = v73;
    goto LABEL_29;
  }
  while (1)
  {
    v66 = v73 + 1;
    if (__OFADD__(v73, 1))
      goto LABEL_135;
    if (v66 >= (uint64_t)v225)
      break;
    v72 = *(_QWORD *)(v61 + 8 * v66);
    ++v73;
    if (v72)
      goto LABEL_29;
  }
LABEL_30:
  swift_release();
  swift_bridgeObjectRelease();
  v186 = v230;
LABEL_31:
  v74 = v215;
  v75 = v214;
  v193 = sub_22910A580();
  v192 = sub_22910A55C();
  v191 = sub_22910A568();
  v190 = sub_22910A574();
  v189 = v76;
  v188 = sub_22910A5B0();
  v187 = v77;
  v78 = sub_22910A5D4();
  v231 = (char *)MEMORY[0x24BEE4B08];
  v79 = *(_QWORD *)(v78 + 56);
  v224 = (char *)(v78 + 56);
  v80 = 1 << *(_BYTE *)(v78 + 32);
  v81 = -1;
  if (v80 < 64)
    v81 = ~(-1 << v80);
  v82 = v81 & v79;
  v225 = (char *)((unint64_t)(v80 + 63) >> 6);
  result = swift_bridgeObjectRetain();
  v83 = 0;
  *(_QWORD *)&v84 = 136446210;
  v223 = v84;
  v211 = MEMORY[0x24BEE4AD8] + 8;
  v85 = v228;
  v217 = (void (*)(char *, uint64_t))result;
  while (2)
  {
    if (v82)
    {
      v87 = __clz(__rbit64(v82));
      v82 &= v82 - 1;
      v229 = v83;
      v88 = v87 | ((_QWORD)v83 << 6);
LABEL_56:
      v94 = *(void (**)(char *, unint64_t, uint64_t))(v22 + 16);
      v94(v75, *(_QWORD *)(v78 + 48) + *(_QWORD *)(v22 + 72) * v88, v21);
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v74, v75, v21);
      v95 = sub_22910A6AC();
      if (v96)
      {
        sub_2290F52E4(&v230, v95, v96);
        swift_bridgeObjectRelease();
        v86 = *(void (**)(char *, uint64_t))(v22 + 8);
      }
      else
      {
        if (qword_255A27500 != -1)
          swift_once();
        v97 = sub_22910A724();
        __swift_project_value_buffer(v97, (uint64_t)qword_255A28890);
        v94(v226, (unint64_t)v74, v21);
        v98 = sub_22910A70C();
        v99 = sub_22910A9B8();
        if (os_log_type_enabled(v98, v99))
        {
          v100 = swift_slowAlloc();
          v101 = swift_slowAlloc();
          v230 = v101;
          *(_DWORD *)v100 = v223;
          v102 = v22;
          v103 = v226;
          v94(v212, (unint64_t)v226, v21);
          v104 = v103;
          v22 = v102;
          v105 = sub_22910A8BC();
          *(_QWORD *)(v100 + 4) = sub_2290F4B9C(v105, v106, &v230);
          swift_bridgeObjectRelease();
          v86 = *(void (**)(char *, uint64_t))(v102 + 8);
          v86(v104, v21);
          _os_log_impl(&dword_2290F1000, v98, v99, "Untokenized application has no bundle identifier: %{public}s", (uint8_t *)v100, 0xCu);
          swift_arrayDestroy();
          v107 = v101;
          v85 = v228;
          MEMORY[0x22E2C2648](v107, -1, -1);
          v108 = v100;
          v75 = v214;
          v74 = v215;
          MEMORY[0x22E2C2648](v108, -1, -1);
        }
        else
        {
          v86 = *(void (**)(char *, uint64_t))(v22 + 8);
          v86(v226, v21);
        }

        v78 = (uint64_t)v217;
      }
      result = ((uint64_t (*)(char *, uint64_t))v86)(v74, v21);
      v83 = v229;
      continue;
    }
    break;
  }
  v89 = (uint64_t)(v83 + 1);
  if (__OFADD__(v83, 1))
  {
    __break(1u);
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
    goto LABEL_132;
  }
  v90 = MEMORY[0x24BEE4B08];
  if (v89 >= (uint64_t)v225)
    goto LABEL_63;
  v91 = *(_QWORD *)&v224[8 * v89];
  v92 = (uint64_t)(v83 + 1);
  if (v91)
    goto LABEL_55;
  v92 = (uint64_t)(v83 + 2);
  if ((uint64_t)(v83 + 2) >= (uint64_t)v225)
    goto LABEL_63;
  v91 = *(_QWORD *)&v224[8 * v92];
  if (v91)
    goto LABEL_55;
  v92 = (uint64_t)(v83 + 3);
  if ((uint64_t)(v83 + 3) >= (uint64_t)v225)
    goto LABEL_63;
  v91 = *(_QWORD *)&v224[8 * v92];
  if (v91)
    goto LABEL_55;
  v92 = (uint64_t)(v83 + 4);
  if ((uint64_t)(v83 + 4) >= (uint64_t)v225)
    goto LABEL_63;
  v91 = *(_QWORD *)&v224[8 * v92];
  if (v91)
    goto LABEL_55;
  v92 = (uint64_t)(v83 + 5);
  if ((uint64_t)(v83 + 5) >= (uint64_t)v225)
    goto LABEL_63;
  v91 = *(_QWORD *)&v224[8 * v92];
  if (v91)
  {
LABEL_55:
    v82 = (v91 - 1) & v91;
    v229 = (char *)v92;
    v88 = __clz(__rbit64(v91)) + (v92 << 6);
    goto LABEL_56;
  }
  v93 = v83 + 6;
  if ((uint64_t)(v83 + 6) < (uint64_t)v225)
  {
    v91 = *(_QWORD *)&v224[8 * (_QWORD)v93];
    if (!v91)
    {
      while (1)
      {
        v92 = (uint64_t)(v93 + 1);
        if (__OFADD__(v93, 1))
          break;
        if (v92 >= (uint64_t)v225)
          goto LABEL_63;
        v91 = *(_QWORD *)&v224[8 * v92];
        ++v93;
        if (v91)
          goto LABEL_55;
      }
LABEL_132:
      __break(1u);
      goto LABEL_133;
    }
    v92 = (uint64_t)(v83 + 6);
    goto LABEL_55;
  }
LABEL_63:
  swift_release();
  swift_bridgeObjectRelease();
  v224 = v231;
  v109 = sub_22910A5BC();
  v231 = (char *)v90;
  v110 = *(_QWORD *)(v109 + 56);
  v226 = (char *)(v109 + 56);
  v111 = 1 << *(_BYTE *)(v109 + 32);
  v112 = -1;
  if (v111 < 64)
    v112 = ~(-1 << v111);
  v113 = v112 & v110;
  v229 = (char *)((unint64_t)(v111 + 63) >> 6);
  result = swift_bridgeObjectRetain();
  v114 = 0;
  v225 = (char *)(MEMORY[0x24BEE4AD8] + 8);
  v115 = v206;
  v117 = v221;
  v116 = v222;
  v118 = v220;
  while (2)
  {
    if (v113)
    {
      v120 = __clz(__rbit64(v113));
      v113 &= v113 - 1;
      v121 = v120 | (v114 << 6);
LABEL_88:
      v125 = *(void (**)(char *, unint64_t, uint64_t))(v116 + 16);
      v126 = v227;
      v125(v227, *(_QWORD *)(v109 + 48) + *(_QWORD *)(v116 + 72) * v121, v115);
      (*(void (**)(char *, char *, uint64_t))(v116 + 32))(v118, v126, v115);
      v127 = sub_22910A6D0();
      if (v128)
      {
        sub_2290F52E4(&v230, v127, v128);
        swift_bridgeObjectRelease();
        v119 = *(void (**)(char *, uint64_t))(v116 + 8);
      }
      else
      {
        if (qword_255A27500 != -1)
          swift_once();
        v129 = sub_22910A724();
        __swift_project_value_buffer(v129, (uint64_t)qword_255A28890);
        v125(v117, (unint64_t)v118, v115);
        v130 = sub_22910A70C();
        v131 = sub_22910A9B8();
        if (os_log_type_enabled(v130, v131))
        {
          v132 = swift_slowAlloc();
          v133 = swift_slowAlloc();
          v230 = v133;
          *(_DWORD *)v132 = v223;
          v125(v210, (unint64_t)v221, v115);
          v117 = v221;
          v134 = sub_22910A8BC();
          *(_QWORD *)(v132 + 4) = sub_2290F4B9C(v134, v135, &v230);
          swift_bridgeObjectRelease();
          v119 = *(void (**)(char *, uint64_t))(v222 + 8);
          v119(v117, v115);
          _os_log_impl(&dword_2290F1000, v130, v131, "Untokenized category has no identifier: %{public}s", (uint8_t *)v132, 0xCu);
          swift_arrayDestroy();
          v136 = v133;
          v116 = v222;
          MEMORY[0x22E2C2648](v136, -1, -1);
          v137 = v132;
          v85 = v228;
          MEMORY[0x22E2C2648](v137, -1, -1);
        }
        else
        {
          v119 = *(void (**)(char *, uint64_t))(v116 + 8);
          v119(v117, v115);
        }

        v118 = v220;
      }
      result = ((uint64_t (*)(char *, uint64_t))v119)(v118, v115);
      continue;
    }
    break;
  }
  v122 = v114 + 1;
  if (__OFADD__(v114, 1))
    goto LABEL_129;
  if (v122 < (uint64_t)v229)
  {
    v123 = *(_QWORD *)&v226[8 * v122];
    ++v114;
    if (!v123)
    {
      v114 = v122 + 1;
      if (v122 + 1 >= (uint64_t)v229)
        goto LABEL_95;
      v123 = *(_QWORD *)&v226[8 * v114];
      if (!v123)
      {
        v114 = v122 + 2;
        if (v122 + 2 >= (uint64_t)v229)
          goto LABEL_95;
        v123 = *(_QWORD *)&v226[8 * v114];
        if (!v123)
        {
          v114 = v122 + 3;
          if (v122 + 3 >= (uint64_t)v229)
            goto LABEL_95;
          v123 = *(_QWORD *)&v226[8 * v114];
          if (!v123)
          {
            v114 = v122 + 4;
            if (v122 + 4 >= (uint64_t)v229)
              goto LABEL_95;
            v123 = *(_QWORD *)&v226[8 * v114];
            if (!v123)
            {
              v124 = v122 + 5;
              if (v124 >= (uint64_t)v229)
                goto LABEL_95;
              v123 = *(_QWORD *)&v226[8 * v124];
              if (!v123)
              {
                while (1)
                {
                  v114 = v124 + 1;
                  if (__OFADD__(v124, 1))
                    break;
                  if (v114 >= (uint64_t)v229)
                    goto LABEL_95;
                  v123 = *(_QWORD *)&v226[8 * v114];
                  ++v124;
                  if (v123)
                    goto LABEL_87;
                }
LABEL_133:
                __break(1u);
                goto LABEL_134;
              }
              v114 = v124;
            }
          }
        }
      }
    }
LABEL_87:
    v113 = (v123 - 1) & v123;
    v121 = __clz(__rbit64(v123)) + (v114 << 6);
    goto LABEL_88;
  }
LABEL_95:
  swift_release();
  swift_bridgeObjectRelease();
  v225 = v231;
  v138 = sub_22910A5C8();
  v231 = (char *)MEMORY[0x24BEE4B08];
  v139 = *(_QWORD *)(v138 + 56);
  v227 = (char *)(v138 + 56);
  v140 = 1 << *(_BYTE *)(v138 + 32);
  v141 = -1;
  if (v140 < 64)
    v141 = ~(-1 << v140);
  v142 = v141 & v139;
  v229 = (char *)((unint64_t)(v140 + 63) >> 6);
  result = swift_bridgeObjectRetain();
  v143 = 0;
  v226 = (char *)(MEMORY[0x24BEE4AD8] + 8);
  v145 = v218;
  v144 = v219;
  v146 = v213;
  while (2)
  {
    if (v142)
    {
      v148 = __clz(__rbit64(v142));
      v142 &= v142 - 1;
      v149 = v148 | (v143 << 6);
LABEL_120:
      v153 = *(void (**)(char *, unint64_t, uint64_t))(v144 + 16);
      v153(v145, *(_QWORD *)(v138 + 48) + *(_QWORD *)(v144 + 72) * v149, v85);
      (*(void (**)(char *, char *, uint64_t))(v144 + 32))(v146, v145, v85);
      v154 = sub_22910A6F4();
      if (v155)
      {
        sub_2290F52E4(&v230, v154, v155);
        swift_bridgeObjectRelease();
        v147 = *(void (**)(char *, uint64_t))(v144 + 8);
      }
      else
      {
        if (qword_255A27500 != -1)
          swift_once();
        v156 = sub_22910A724();
        __swift_project_value_buffer(v156, (uint64_t)qword_255A28890);
        v157 = v216;
        v153(v216, (unint64_t)v146, v85);
        v158 = sub_22910A70C();
        v159 = sub_22910A9B8();
        if (os_log_type_enabled(v158, v159))
        {
          v160 = swift_slowAlloc();
          v161 = swift_slowAlloc();
          v230 = v161;
          *(_DWORD *)v160 = v223;
          v153(v209, (unint64_t)v157, v228);
          v162 = sub_22910A8BC();
          *(_QWORD *)(v160 + 4) = sub_2290F4B9C(v162, v163, &v230);
          swift_bridgeObjectRelease();
          v164 = v219;
          v147 = *(void (**)(char *, uint64_t))(v219 + 8);
          v147(v157, v228);
          _os_log_impl(&dword_2290F1000, v158, v159, "Untokenized web domain has no domain: %{public}s", (uint8_t *)v160, 0xCu);
          swift_arrayDestroy();
          v165 = v161;
          v146 = v213;
          MEMORY[0x22E2C2648](v165, -1, -1);
          v166 = v160;
          v85 = v228;
          MEMORY[0x22E2C2648](v166, -1, -1);
        }
        else
        {
          v164 = v219;
          v147 = *(void (**)(char *, uint64_t))(v219 + 8);
          v147(v157, v85);
        }

        v144 = v164;
        v145 = v218;
      }
      result = ((uint64_t (*)(char *, uint64_t))v147)(v146, v85);
      continue;
    }
    break;
  }
  v150 = v143 + 1;
  if (__OFADD__(v143, 1))
    goto LABEL_130;
  if (v150 >= (uint64_t)v229)
  {
LABEL_127:
    v167 = v195 == 1;
    swift_release();
    swift_bridgeObjectRelease();
    v168 = (uint64_t)v231;
    v169 = (uint64_t)v202;
    v170 = v197;
    *v202 = v198;
    *(_QWORD *)(v169 + 8) = v170;
    *(_QWORD *)(v169 + 16) = v196;
    v171 = (int *)v201;
    (*(void (**)(uint64_t, char *, uint64_t))(v199 + 32))(v169 + *(int *)(v201 + 24), v207, v200);
    v172 = v169 + v171[7];
    *(_QWORD *)v172 = v194;
    *(_BYTE *)(v172 + 8) = v167;
    *(_QWORD *)(v169 + v171[8]) = v186;
    *(_QWORD *)(v169 + v171[9]) = v193;
    *(_QWORD *)(v169 + v171[10]) = v192;
    *(_QWORD *)(v169 + v171[11]) = v191;
    v173 = (uint64_t *)(v169 + v171[12]);
    v174 = v189;
    *v173 = v190;
    v173[1] = v174;
    v175 = (uint64_t *)(v169 + v171[13]);
    v176 = v187;
    *v175 = v188;
    v175[1] = v176;
    *(_QWORD *)(v169 + v171[14]) = v224;
    *(_QWORD *)(v169 + v171[15]) = v225;
    *(_QWORD *)(v169 + v171[16]) = v168;
    v177 = (_QWORD *)(v169 + v171[17]);
    v178 = v204;
    *v177 = v203;
    v177[1] = v178;
    v179 = sub_2290F5490();
    sub_22910A3D0();
    swift_allocObject();
    sub_22910A3C4();
    sub_2290F873C(&qword_255A27518, (uint64_t (*)(uint64_t))type metadata accessor for DeviceActivityReport.ClientConfiguration, (uint64_t)&protocol conformance descriptor for DeviceActivityReport.ClientConfiguration);
    v180 = sub_22910A3B8();
    v182 = v181;
    sub_2290F54CC(v169);
    swift_release();
    v183 = sub_22910A664();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v183 - 8) + 8))(v208, v183);
    v184 = v205;
    *v205 = v179;
    v184[1] = (unint64_t)&off_24F1D24F0;
    v184[2] = v180;
    v184[3] = v182;
    return result;
  }
  v151 = *(_QWORD *)&v227[8 * v150];
  ++v143;
  if (v151)
    goto LABEL_119;
  v143 = v150 + 1;
  if (v150 + 1 >= (uint64_t)v229)
    goto LABEL_127;
  v151 = *(_QWORD *)&v227[8 * v143];
  if (v151)
    goto LABEL_119;
  v143 = v150 + 2;
  if (v150 + 2 >= (uint64_t)v229)
    goto LABEL_127;
  v151 = *(_QWORD *)&v227[8 * v143];
  if (v151)
    goto LABEL_119;
  v143 = v150 + 3;
  if (v150 + 3 >= (uint64_t)v229)
    goto LABEL_127;
  v151 = *(_QWORD *)&v227[8 * v143];
  if (v151)
    goto LABEL_119;
  v143 = v150 + 4;
  if (v150 + 4 >= (uint64_t)v229)
    goto LABEL_127;
  v151 = *(_QWORD *)&v227[8 * v143];
  if (v151)
  {
LABEL_119:
    v142 = (v151 - 1) & v151;
    v149 = __clz(__rbit64(v151)) + (v143 << 6);
    goto LABEL_120;
  }
  v152 = v150 + 5;
  if (v152 >= (uint64_t)v229)
    goto LABEL_127;
  v151 = *(_QWORD *)&v227[8 * v152];
  if (v151)
  {
    v143 = v152;
    goto LABEL_119;
  }
  while (1)
  {
    v143 = v152 + 1;
    if (__OFADD__(v152, 1))
      break;
    if (v143 >= (uint64_t)v229)
      goto LABEL_127;
    v151 = *(_QWORD *)&v227[8 * v143];
    ++v152;
    if (v151)
      goto LABEL_119;
  }
LABEL_134:
  __break(1u);
LABEL_135:
  __break(1u);
  return result;
}

uint64_t DeviceActivityReport.body.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  if (*v1)
  {
    sub_2290F5508(v1[2], v1[3]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A27520);
    sub_2290F5560();
  }
  result = sub_22910A85C();
  *a1 = result;
  return result;
}

uint64_t sub_2290F49DC()
{
  return sub_22910A82C();
}

uint64_t sub_2290F49F4@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  if (*v1)
  {
    sub_2290F5508(v1[2], v1[3]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A27520);
    sub_2290F5560();
  }
  result = sub_22910A85C();
  *a1 = result;
  return result;
}

uint64_t sub_2290F4A70(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2290F4A80(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2290F4AB4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2290F4AD4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_2290F4B9C(v6, v7, a3);
  v8 = *a1 + 8;
  sub_22910AA18();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2C25A0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

uint64_t sub_2290F4B9C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2290F4C6C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2290F879C((uint64_t)v12, *a3);
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
      sub_2290F879C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2290F4C6C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_22910AA24();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2290F4E24(a5, a6);
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
  v8 = sub_22910AA78();
  if (!v8)
  {
    sub_22910AA90();
    __break(1u);
LABEL_17:
    result = sub_22910AAA8();
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

uint64_t sub_2290F4E24(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2290F4EB8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2290F5090(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2290F5090(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2290F4EB8(uint64_t a1, unint64_t a2)
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
      v3 = sub_2290F502C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_22910AA6C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_22910AA90();
      __break(1u);
LABEL_10:
      v2 = sub_22910A8E0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_22910AAA8();
    __break(1u);
LABEL_14:
    result = sub_22910AA90();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2290F502C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275A8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2290F5090(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A275A8);
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
  result = sub_22910AAA8();
  __break(1u);
  return result;
}

_BYTE **sub_2290F51DC(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_2290F51EC(uint64_t *a1, uint64_t a2)
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
  v7 = sub_22910AB74();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    sub_2290F6DCC(a2, v9, isUniquelyReferenced_nonNull_native);
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

uint64_t sub_2290F52E4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_22910AB80();
  swift_bridgeObjectRetain();
  sub_22910A8C8();
  v8 = sub_22910AB98();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_22910AB5C() & 1) != 0)
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
      if (v19 || (sub_22910AB5C() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2290F6EEC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t sub_2290F5490()
{
  unint64_t result;

  result = qword_255A27510;
  if (!qword_255A27510)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255A27510);
  }
  return result;
}

uint64_t sub_2290F54CC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DeviceActivityReport.ClientConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2290F5508(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2290F551C(a1, a2);
  return a1;
}

uint64_t sub_2290F551C(uint64_t a1, unint64_t a2)
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

unint64_t sub_2290F5560()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A27528;
  if (!qword_255A27528)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A27520);
    result = MEMORY[0x22E2C25B8](&unk_22910B978, v1);
    atomic_store(result, (unint64_t *)&qword_255A27528);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2C25AC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2290F55F4()
{
  unint64_t result;

  result = qword_255A27530;
  if (!qword_255A27530)
  {
    result = MEMORY[0x22E2C25B8](&protocol conformance descriptor for DeviceActivityReport.Context, &type metadata for DeviceActivityReport.Context);
    atomic_store(result, (unint64_t *)&qword_255A27530);
  }
  return result;
}

uint64_t sub_2290F5638()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for DeviceActivityReport(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

_QWORD *destroy for DeviceActivityReport(_QWORD *result)
{
  unint64_t v1;

  if (*result)
  {
    v1 = result[3];
    if (v1 >> 60 != 15)
      return (_QWORD *)sub_2290F569C(result[2], v1);
  }
  return result;
}

uint64_t sub_2290F569C(uint64_t a1, unint64_t a2)
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

uint64_t initializeWithCopy for DeviceActivityReport(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  __int128 v6;
  uint64_t v7;

  if (*a2)
  {
    v3 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v3;
    v4 = a2 + 2;
    v5 = a2[3];
    if (v5 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 16) = *(_OWORD *)v4;
    }
    else
    {
      v7 = *v4;
      sub_2290F551C(*v4, a2[3]);
      *(_QWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 24) = v5;
    }
  }
  else
  {
    v6 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
  }
  return a1;
}

_QWORD *assignWithCopy for DeviceActivityReport(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      v6 = a1 + 2;
      v7 = a2 + 2;
      v8 = a2[3];
      if (a1[3] >> 60 == 15)
      {
        if (v8 >> 60 != 15)
        {
          v9 = *v7;
LABEL_15:
          sub_2290F551C(v9, v8);
          a1[2] = v9;
          a1[3] = v8;
          return a1;
        }
      }
      else
      {
        if (v8 >> 60 != 15)
        {
          v14 = *v7;
          sub_2290F551C(*v7, v8);
          v15 = a1[2];
          v16 = a1[3];
          a1[2] = v14;
          a1[3] = v8;
          sub_2290F569C(v15, v16);
          return a1;
        }
        sub_2290F587C((uint64_t)(a1 + 2));
      }
      *v6 = *(_OWORD *)v7;
    }
    else
    {
      sub_2290F58B0((uint64_t)a1, &qword_255A27520);
      v12 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v12;
    }
  }
  else if (v4)
  {
    v10 = a2[1];
    *a1 = v4;
    a1[1] = v10;
    v11 = a2 + 2;
    v8 = a2[3];
    if (v8 >> 60 != 15)
    {
      v9 = *v11;
      goto LABEL_15;
    }
    *((_OWORD *)a1 + 1) = *(_OWORD *)v11;
  }
  else
  {
    v13 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v13;
  }
  return a1;
}

uint64_t sub_2290F587C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

uint64_t sub_2290F58B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
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

uint64_t assignWithTake for DeviceActivityReport(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v11;

  if (!*(_QWORD *)a1)
    goto LABEL_8;
  if (!*(_QWORD *)a2)
  {
    sub_2290F58B0(a1, &qword_255A27520);
LABEL_8:
    v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v9;
    return a1;
  }
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = (_OWORD *)(a1 + 16);
  v6 = (_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  if (v7 >> 60 != 15)
  {
    v8 = *(_QWORD *)(a2 + 24);
    if (v8 >> 60 != 15)
    {
      v11 = *(_QWORD *)(a1 + 16);
      *(_QWORD *)(a1 + 16) = *v6;
      *(_QWORD *)(a1 + 24) = v8;
      sub_2290F569C(v11, v7);
      return a1;
    }
    sub_2290F587C(a1 + 16);
  }
  *v5 = *(_OWORD *)v6;
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceActivityReport(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceActivityReport(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceActivityReport()
{
  return &type metadata for DeviceActivityReport;
}

_QWORD *initializeBufferWithCopyOfBuffer for DeviceActivityReport.Context(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for DeviceActivityReport.Context()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for DeviceActivityReport.Context(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for DeviceActivityReport.Context(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceActivityReport.Context(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceActivityReport.Context(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceActivityReport.Context()
{
  return &type metadata for DeviceActivityReport.Context;
}

uint64_t sub_2290F5BA8()
{
  return MEMORY[0x24BDF4760];
}

uint64_t sub_2290F5BB4(uint64_t a1, char *a2)
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
  v6 = sub_22910A700();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_2290F873C(&qword_255A27550, v11, MEMORY[0x24BDDAF00]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_22910A88C();
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
      sub_2290F873C(&qword_255A27558, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAEF0], MEMORY[0x24BDDAF08]);
      v21 = sub_22910A898();
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
    sub_2290F7084((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_2290F5E10(uint64_t a1, char *a2)
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
  v6 = sub_22910A6DC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_2290F873C(&qword_255A27568, v11, MEMORY[0x24BDDAEA0]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_22910A88C();
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
      sub_2290F873C(&qword_255A27570, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAE90], MEMORY[0x24BDDAEA8]);
      v21 = sub_22910A898();
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
    sub_2290F72D8((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_2290F606C(uint64_t a1, char *a2)
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
  v6 = sub_22910A6B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_2290F873C(&qword_255A27580, v11, MEMORY[0x24BDDAE68]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_22910A88C();
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
      sub_2290F873C(&qword_255A27588, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAE58], MEMORY[0x24BDDAE70]);
      v21 = sub_22910A898();
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
    sub_2290F752C((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_2290F62C8(uint64_t a1, char *a2)
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
  v6 = sub_22910A4C0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_2290F873C(&qword_255A27538, v11, MEMORY[0x24BDC71F8]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_22910A88C();
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
      sub_2290F873C(&qword_255A27540, (uint64_t (*)(uint64_t))MEMORY[0x24BDC71E8], MEMORY[0x24BDC7200]);
      v21 = sub_22910A898();
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
    sub_2290F7780((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_2290F6524()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A27598);
  result = sub_22910AA54();
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
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_31;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_31;
          v16 = v6[v5];
          if (!v16)
          {
            v17 = v15 + 2;
            if (v17 >= v10)
            {
LABEL_31:
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
                  goto LABEL_37;
                if (v5 >= v10)
                  goto LABEL_31;
                v16 = v6[v5];
                ++v17;
                if (v16)
                  goto LABEL_21;
              }
            }
            v5 = v17;
          }
        }
LABEL_21:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      result = sub_22910AB74();
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
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_2290F6790()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275A0);
  v3 = sub_22910AA54();
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
      sub_22910AB80();
      sub_22910A8C8();
      result = sub_22910AB98();
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

uint64_t sub_2290F6A6C(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t *v7;
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
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, unint64_t, uint64_t);
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
  uint64_t (*v44)(uint64_t);
  unint64_t *v45;
  uint64_t v46;

  v45 = a4;
  v46 = a5;
  v7 = v5;
  v44 = a2;
  v8 = a2(0);
  v43 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v39 - v9;
  v11 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v12 = sub_22910AA54();
  v13 = v12;
  if (*(_QWORD *)(v11 + 16))
  {
    v14 = 1 << *(_BYTE *)(v11 + 32);
    v15 = *(_QWORD *)(v11 + 56);
    v42 = (_QWORD *)(v11 + 56);
    if (v14 < 64)
      v16 = ~(-1 << v14);
    else
      v16 = -1;
    v17 = v16 & v15;
    v40 = v5;
    v41 = (unint64_t)(v14 + 63) >> 6;
    v18 = v12 + 56;
    result = swift_retain();
    v20 = 0;
    while (1)
    {
      if (v17)
      {
        v22 = __clz(__rbit64(v17));
        v17 &= v17 - 1;
        v23 = v22 | (v20 << 6);
      }
      else
      {
        v24 = v20 + 1;
        if (__OFADD__(v20, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v24 >= v41)
          goto LABEL_33;
        v25 = v42[v24];
        ++v20;
        if (!v25)
        {
          v20 = v24 + 1;
          if (v24 + 1 >= v41)
            goto LABEL_33;
          v25 = v42[v20];
          if (!v25)
          {
            v20 = v24 + 2;
            if (v24 + 2 >= v41)
              goto LABEL_33;
            v25 = v42[v20];
            if (!v25)
            {
              v26 = v24 + 3;
              if (v26 >= v41)
              {
LABEL_33:
                swift_release();
                v7 = v40;
                v38 = 1 << *(_BYTE *)(v11 + 32);
                if (v38 > 63)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v11 + 16) = 0;
                break;
              }
              v25 = v42[v26];
              if (!v25)
              {
                while (1)
                {
                  v20 = v26 + 1;
                  if (__OFADD__(v26, 1))
                    goto LABEL_39;
                  if (v20 >= v41)
                    goto LABEL_33;
                  v25 = v42[v20];
                  ++v26;
                  if (v25)
                    goto LABEL_23;
                }
              }
              v20 = v26;
            }
          }
        }
LABEL_23:
        v17 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v20 << 6);
      }
      v27 = v11;
      v28 = *(_QWORD *)(v11 + 48);
      v29 = *(_QWORD *)(v43 + 72);
      v30 = *(void (**)(char *, unint64_t, uint64_t))(v43 + 32);
      v30(v10, v28 + v29 * v23, v8);
      sub_2290F873C(v45, v44, v46);
      result = sub_22910A88C();
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
            goto LABEL_38;
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
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v30)(*(_QWORD *)(v13 + 48) + v21 * v29, v10, v8);
      ++*(_QWORD *)(v13 + 16);
      v11 = v27;
    }
  }
  result = swift_release();
  *v7 = v13;
  return result;
}

uint64_t sub_2290F6DCC(uint64_t result, unint64_t a2, char a3)
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
    sub_2290F6524();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_2290F79D4();
      goto LABEL_14;
    }
    sub_2290F7F28();
  }
  v8 = *v3;
  result = sub_22910AB74();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = sub_22910AB68();
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

uint64_t sub_2290F6EEC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2290F6790();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2290F7B54();
      goto LABEL_22;
    }
    sub_2290F8174();
  }
  v11 = *v4;
  sub_22910AB80();
  sub_22910A8C8();
  result = sub_22910AB98();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_22910AB5C(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_22910AB68();
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
          result = sub_22910AB5C();
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

uint64_t sub_2290F7084(uint64_t a1, unint64_t a2, char a3)
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
  uint64_t v17;
  void (*v18)(char *, unint64_t, uint64_t);
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = a1;
  v6 = sub_22910A700();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v26 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_2290F6A6C(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAEF0], &qword_255A27560, &qword_255A27550, MEMORY[0x24BDDAF00]);
  }
  else
  {
    if (v11 > v10)
    {
      sub_2290F7D04((uint64_t (*)(_QWORD))MEMORY[0x24BDDAEF0], &qword_255A27560);
      goto LABEL_12;
    }
    sub_2290F8420(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAEF0], &qword_255A27560, &qword_255A27550, MEMORY[0x24BDDAF00]);
  }
  v13 = *v3;
  sub_2290F873C(&qword_255A27550, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAEF0], MEMORY[0x24BDDAF00]);
  v14 = sub_22910A88C();
  v15 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v14 & ~v15;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v16 = ~v15;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v18(v9, *(_QWORD *)(v13 + 48) + v17 * a2, v6);
      sub_2290F873C(&qword_255A27558, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAEF0], MEMORY[0x24BDDAF08]);
      v19 = sub_22910A898();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v19 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v16;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v20 = v27;
  v21 = *v26;
  *(_QWORD *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v21 + 48) + *(_QWORD *)(v7 + 72) * a2, v20, v6);
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (!v24)
  {
    *(_QWORD *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_22910AB68();
  __break(1u);
  return result;
}

uint64_t sub_2290F72D8(uint64_t a1, unint64_t a2, char a3)
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
  uint64_t v17;
  void (*v18)(char *, unint64_t, uint64_t);
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = a1;
  v6 = sub_22910A6DC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v26 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_2290F6A6C(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAE90], &qword_255A27578, &qword_255A27568, MEMORY[0x24BDDAEA0]);
  }
  else
  {
    if (v11 > v10)
    {
      sub_2290F7D04((uint64_t (*)(_QWORD))MEMORY[0x24BDDAE90], &qword_255A27578);
      goto LABEL_12;
    }
    sub_2290F8420(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAE90], &qword_255A27578, &qword_255A27568, MEMORY[0x24BDDAEA0]);
  }
  v13 = *v3;
  sub_2290F873C(&qword_255A27568, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAE90], MEMORY[0x24BDDAEA0]);
  v14 = sub_22910A88C();
  v15 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v14 & ~v15;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v16 = ~v15;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v18(v9, *(_QWORD *)(v13 + 48) + v17 * a2, v6);
      sub_2290F873C(&qword_255A27570, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAE90], MEMORY[0x24BDDAEA8]);
      v19 = sub_22910A898();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v19 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v16;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v20 = v27;
  v21 = *v26;
  *(_QWORD *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v21 + 48) + *(_QWORD *)(v7 + 72) * a2, v20, v6);
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (!v24)
  {
    *(_QWORD *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_22910AB68();
  __break(1u);
  return result;
}

uint64_t sub_2290F752C(uint64_t a1, unint64_t a2, char a3)
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
  uint64_t v17;
  void (*v18)(char *, unint64_t, uint64_t);
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = a1;
  v6 = sub_22910A6B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v26 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_2290F6A6C(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAE58], &qword_255A27590, &qword_255A27580, MEMORY[0x24BDDAE68]);
  }
  else
  {
    if (v11 > v10)
    {
      sub_2290F7D04((uint64_t (*)(_QWORD))MEMORY[0x24BDDAE58], &qword_255A27590);
      goto LABEL_12;
    }
    sub_2290F8420(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAE58], &qword_255A27590, &qword_255A27580, MEMORY[0x24BDDAE68]);
  }
  v13 = *v3;
  sub_2290F873C(&qword_255A27580, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAE58], MEMORY[0x24BDDAE68]);
  v14 = sub_22910A88C();
  v15 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v14 & ~v15;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v16 = ~v15;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v18(v9, *(_QWORD *)(v13 + 48) + v17 * a2, v6);
      sub_2290F873C(&qword_255A27588, (uint64_t (*)(uint64_t))MEMORY[0x24BDDAE58], MEMORY[0x24BDDAE70]);
      v19 = sub_22910A898();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v19 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v16;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v20 = v27;
  v21 = *v26;
  *(_QWORD *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v21 + 48) + *(_QWORD *)(v7 + 72) * a2, v20, v6);
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (!v24)
  {
    *(_QWORD *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_22910AB68();
  __break(1u);
  return result;
}

uint64_t sub_2290F7780(uint64_t a1, unint64_t a2, char a3)
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
  uint64_t v17;
  void (*v18)(char *, unint64_t, uint64_t);
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = a1;
  v6 = sub_22910A4C0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v26 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_2290F6A6C(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BDC71E8], &qword_255A27548, &qword_255A27538, MEMORY[0x24BDC71F8]);
  }
  else
  {
    if (v11 > v10)
    {
      sub_2290F7D04((uint64_t (*)(_QWORD))MEMORY[0x24BDC71E8], &qword_255A27548);
      goto LABEL_12;
    }
    sub_2290F8420(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BDC71E8], &qword_255A27548, &qword_255A27538, MEMORY[0x24BDC71F8]);
  }
  v13 = *v3;
  sub_2290F873C(&qword_255A27538, (uint64_t (*)(uint64_t))MEMORY[0x24BDC71E8], MEMORY[0x24BDC71F8]);
  v14 = sub_22910A88C();
  v15 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v14 & ~v15;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v16 = ~v15;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v18(v9, *(_QWORD *)(v13 + 48) + v17 * a2, v6);
      sub_2290F873C(&qword_255A27540, (uint64_t (*)(uint64_t))MEMORY[0x24BDC71E8], MEMORY[0x24BDC7200]);
      v19 = sub_22910A898();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v19 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v16;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v20 = v27;
  v21 = *v26;
  *(_QWORD *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v21 + 48) + *(_QWORD *)(v7 + 72) * a2, v20, v6);
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (!v24)
  {
    *(_QWORD *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_22910AB68();
  __break(1u);
  return result;
}

void *sub_2290F79D4()
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
  unint64_t v19;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A27598);
  v2 = *v0;
  v3 = sub_22910AA48();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
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
      goto LABEL_28;
    }
    if (v16 >= v13)
      goto LABEL_26;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_26;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
        break;
    }
LABEL_25:
    v19 = __clz(__rbit64(v17));
    v12 = (v17 - 1) & v17;
    v15 = v19 + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
  }
  v18 = v16 + 2;
  if (v18 >= v13)
    goto LABEL_26;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2290F7B54()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275A0);
  v2 = *v0;
  v3 = sub_22910AA48();
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

void *sub_2290F7D04(uint64_t (*a1)(_QWORD), uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *result;
  uint64_t v13;
  unint64_t v14;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v4 = v2;
  v5 = a1(0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v27 - v7;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v9 = *v2;
  v10 = sub_22910AA48();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v4 = v11;
    return result;
  }
  v28 = v4;
  result = (void *)(v10 + 56);
  v13 = v9 + 56;
  v14 = (unint64_t)((1 << *(_BYTE *)(v11 + 32)) + 63) >> 6;
  if (v11 != v9 || (unint64_t)result >= v9 + 56 + 8 * v14)
    result = memmove(result, (const void *)(v9 + 56), 8 * v14);
  v16 = 0;
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v9 + 16);
  v17 = 1 << *(_BYTE *)(v9 + 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & *(_QWORD *)(v9 + 56);
  v20 = (unint64_t)(v17 + 63) >> 6;
  while (1)
  {
    if (v19)
    {
      v21 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      v22 = v21 | (v16 << 6);
      goto LABEL_12;
    }
    v24 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v24 >= v20)
      goto LABEL_28;
    v25 = *(_QWORD *)(v13 + 8 * v24);
    ++v16;
    if (!v25)
    {
      v16 = v24 + 1;
      if (v24 + 1 >= v20)
        goto LABEL_28;
      v25 = *(_QWORD *)(v13 + 8 * v16);
      if (!v25)
      {
        v16 = v24 + 2;
        if (v24 + 2 >= v20)
          goto LABEL_28;
        v25 = *(_QWORD *)(v13 + 8 * v16);
        if (!v25)
          break;
      }
    }
LABEL_27:
    v19 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v16 << 6);
LABEL_12:
    v23 = *(_QWORD *)(v6 + 72) * v22;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, *(_QWORD *)(v9 + 48) + v23, v5);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v23, v8, v5);
  }
  v26 = v24 + 3;
  if (v26 >= v20)
  {
LABEL_28:
    result = (void *)swift_release();
    v4 = v28;
    goto LABEL_30;
  }
  v25 = *(_QWORD *)(v13 + 8 * v26);
  if (v25)
  {
    v16 = v26;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v16 >= v20)
      goto LABEL_28;
    v25 = *(_QWORD *)(v13 + 8 * v16);
    ++v26;
    if (v25)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_2290F7F28()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A27598);
  result = sub_22910AA54();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_33:
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
      goto LABEL_22;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    if (v15 >= v10)
      goto LABEL_31;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_31;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
        break;
    }
LABEL_21:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_22:
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    result = sub_22910AB74();
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
          goto LABEL_34;
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
  v17 = v15 + 2;
  if (v17 >= v10)
  {
LABEL_31:
    result = swift_release();
    v1 = v26;
    goto LABEL_33;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_21;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_31;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_21;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_2290F8174()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275A0);
  v3 = sub_22910AA54();
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
    sub_22910AB80();
    swift_bridgeObjectRetain();
    sub_22910A8C8();
    result = sub_22910AB98();
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

uint64_t sub_2290F8420(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t *v7;
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
  unint64_t v18;
  uint64_t v19;
  uint64_t result;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int64_t v38;
  uint64_t (*v39)(uint64_t);
  unint64_t *v40;
  uint64_t v41;

  v40 = a4;
  v41 = a5;
  v7 = v5;
  v39 = a2;
  v8 = a2(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v36 - v10;
  v12 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v13 = sub_22910AA54();
  v14 = v13;
  if (!*(_QWORD *)(v12 + 16))
  {
    result = swift_release();
LABEL_35:
    *v7 = v14;
    return result;
  }
  v15 = 1 << *(_BYTE *)(v12 + 32);
  v16 = *(_QWORD *)(v12 + 56);
  v36 = v5;
  v37 = v12 + 56;
  if (v15 < 64)
    v17 = ~(-1 << v15);
  else
    v17 = -1;
  v18 = v17 & v16;
  v38 = (unint64_t)(v15 + 63) >> 6;
  v19 = v13 + 56;
  result = swift_retain();
  v21 = 0;
  while (1)
  {
    if (v18)
    {
      v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v24 = v23 | (v21 << 6);
      goto LABEL_24;
    }
    v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v25 >= v38)
      goto LABEL_33;
    v26 = *(_QWORD *)(v37 + 8 * v25);
    ++v21;
    if (!v26)
    {
      v21 = v25 + 1;
      if (v25 + 1 >= v38)
        goto LABEL_33;
      v26 = *(_QWORD *)(v37 + 8 * v21);
      if (!v26)
      {
        v21 = v25 + 2;
        if (v25 + 2 >= v38)
          goto LABEL_33;
        v26 = *(_QWORD *)(v37 + 8 * v21);
        if (!v26)
          break;
      }
    }
LABEL_23:
    v18 = (v26 - 1) & v26;
    v24 = __clz(__rbit64(v26)) + (v21 << 6);
LABEL_24:
    v28 = *(_QWORD *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v11, *(_QWORD *)(v12 + 48) + v28 * v24, v8);
    sub_2290F873C(v40, v39, v41);
    result = sub_22910A88C();
    v29 = -1 << *(_BYTE *)(v14 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v19 + 8 * (v30 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v19 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v19 + 8 * v31);
      }
      while (v35 == -1);
      v22 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))(*(_QWORD *)(v14 + 48) + v22 * v28, v11, v8);
    ++*(_QWORD *)(v14 + 16);
  }
  v27 = v25 + 3;
  if (v27 >= v38)
  {
LABEL_33:
    result = swift_release_n();
    v7 = v36;
    goto LABEL_35;
  }
  v26 = *(_QWORD *)(v37 + 8 * v27);
  if (v26)
  {
    v21 = v27;
    goto LABEL_23;
  }
  while (1)
  {
    v21 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v21 >= v38)
      goto LABEL_33;
    v26 = *(_QWORD *)(v37 + 8 * v21);
    ++v27;
    if (v26)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2290F873C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E2C25B8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
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

uint64_t sub_2290F879C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (**a3)()@<X8>)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v7 + 8);
  (*(void (**)(char *))(v9 + 16))(v6);
  return sub_2290FD560((uint64_t)v6, a2, v8, v10, a3);
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void (**a7)()@<X8>)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = sub_2290F88AC(a1, a2, a3, a4, *(_QWORD *)(a5 + 8), *(_QWORD *)(a6 + 8), &v10);
  v9 = v10;
  *a7 = sub_2290FDD9C;
  a7[1] = 0;
  a7[2] = (void (*)())v9;
  return result;
}

uint64_t sub_2290F88AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;

  v22 = a7;
  v23 = a6;
  v20 = a5;
  v21 = a2;
  v10 = *(_QWORD *)(a4 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275D8);
  sub_22910A454();
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_22910B250;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, a3);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v21, a4);
  result = sub_22910A448();
  *v22 = v18;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C>(_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10)
{
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  result = sub_2290F8A58(a1, a2, a3, a4, a5, a6, *(_QWORD *)(a7 + 8), *(_QWORD *)(a8 + 8), &v13, *(_QWORD *)(a10 + 8));
  v12 = v13;
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v12;
  return result;
}

uint64_t sub_2290F8A58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
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
  uint64_t *v34;

  v30 = a6;
  v31 = a8;
  v27 = a7;
  v28 = a2;
  v26 = a1;
  v34 = a9;
  v32 = a3;
  v33 = a10;
  v29 = *(_QWORD *)(a6 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v12);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v22 = (char *)&v25 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275D8);
  sub_22910A454();
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_22910B260;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v22, v26, a4);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v18, v28, a5);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v14, v32, v30);
  result = sub_22910A448();
  *v34 = v23;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D>(_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;

  result = sub_2290F8C8C(a1, a2, a3, a4, a5, a6, a7, a8, &v16, *(_QWORD *)(a10 + 8), *(_QWORD *)(a11 + 8), *(_QWORD *)(a12 + 8), *(_QWORD *)(a13 + 8));
  v15 = v16;
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v15;
  return result;
}

uint64_t sub_2290F8C8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t result;
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;

  v41 = a8;
  v42 = a4;
  v34 = a7;
  v35 = a2;
  v44 = a9;
  v43 = a13;
  v38 = a3;
  v39 = a12;
  v36 = a11;
  v32[0] = a1;
  v32[1] = a10;
  v40 = *(_QWORD *)(a8 - 8);
  v15 = MEMORY[0x24BDAC7A8](a1);
  v37 = (char *)v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v18);
  v25 = (char *)v32 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v29 = (char *)v32 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275D8);
  sub_22910A454();
  v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_22910B270;
  (*(void (**)(char *, _QWORD, uint64_t))(v27 + 16))(v29, v32[0], a5);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v25, v35, a6);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v20, v38, v34);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v37, v42, v41);
  result = sub_22910A448();
  *v44 = v30;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E>(_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t result;
  uint64_t v18;
  uint64_t v19;

  result = sub_2290F8F48(a1, a2, a3, a4, a5, a6, a7, a8, &v19, a10, a11, *(_QWORD *)(a12 + 8), *(_QWORD *)(a13 + 8), *(_QWORD *)(a14 + 8), *(_QWORD *)(a15 + 8), *(_QWORD *)(a16 + 8));
  v18 = v19;
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v18;
  return result;
}

uint64_t sub_2290F8F48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
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
  uint64_t v56;
  uint64_t *v57;

  v40 = a8;
  v41 = a1;
  v38 = a7;
  v57 = a9;
  v55 = a5;
  v56 = a16;
  v52 = a4;
  v53 = a15;
  v48 = a3;
  v49 = a14;
  v44 = a2;
  v45 = a13;
  v42 = a12;
  v47 = a10;
  v54 = a11;
  v51 = *(_QWORD *)(a11 - 8);
  v17 = MEMORY[0x24BDAC7A8](a1);
  v50 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = *(_QWORD *)(v19 - 8);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v43 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = *(_QWORD *)(v22 - 8);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v37 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = *(_QWORD *)(v26 - 8);
  v28 = MEMORY[0x24BDAC7A8](v23);
  v30 = (char *)&v37 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v34 = (char *)&v37 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275D8);
  sub_22910A454();
  v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_22910B280;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v34, v41, a6);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v30, v44, v38);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v25, v48, v40);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v43, v52, v47);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v50, v55, v54);
  result = sub_22910A448();
  *v57 = v35;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F>(_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t result;
  uint64_t v21;
  uint64_t v22;

  result = sub_2290F943C(a1, a2, a3, a4, a5, a6, a7, a8, &v22, a10, a11, a12, a13, *(_QWORD *)(a14 + 8), *(_QWORD *)(a15 + 8), *(_QWORD *)(a16 + 8), *(_QWORD *)(a17 + 8), *(_QWORD *)(a18 + 8), *(_QWORD *)(a19 + 8));
  v21 = v22;
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v21;
  return result;
}

uint64_t sub_2290F9290()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275D8);
  sub_22910A454();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22910B290;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275B0);
  sub_2290FD3E0();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  return v0;
}

uint64_t sub_2290F943C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
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
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t result;
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
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;

  v45 = a8;
  v68 = a9;
  v66 = a6;
  v67 = a19;
  v64 = a5;
  v65 = a18;
  v59 = a4;
  v60 = a17;
  v55 = a3;
  v56 = a16;
  v52 = a2;
  v53 = a15;
  v48 = a1;
  v49 = a14;
  v47 = a10;
  v51 = a11;
  v58 = a12;
  v63 = a13;
  v62 = *(_QWORD *)(a13 - 8);
  v20 = MEMORY[0x24BDAC7A8](a1);
  v61 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = *(_QWORD *)(v22 - 8);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v54 = (char *)&v44 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = *(_QWORD *)(v25 - 8);
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v44 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = *(_QWORD *)(v29 - 8);
  v30 = MEMORY[0x24BDAC7A8](v26);
  v32 = (char *)&v44 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = *(_QWORD *)(v33 - 8);
  v35 = MEMORY[0x24BDAC7A8](v30);
  v37 = (char *)&v44 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v41 = (char *)&v44 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275D8);
  sub_22910A454();
  v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_22910B290;
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v41, v48, a7);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v37, v52, v45);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v32, v55, v47);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v28, v59, v51);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v54, v64, v58);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v66, v63);
  result = sub_22910A448();
  *v68 = v42;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t result;
  uint64_t v24;
  uint64_t v25;

  result = sub_2290F99FC(a1, a2, a3, a4, a5, a6, a7, a8, &v25, a10, a11, a12, a13, a14, a15, *(_QWORD *)(a16 + 8), *(_QWORD *)(a17 + 8), *(_QWORD *)(a18 + 8), *(_QWORD *)(a19 + 8),
             *(_QWORD *)(a20 + 8),
             *(_QWORD *)(a21 + 8),
             *(_QWORD *)(a22 + 8));
  v24 = v25;
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v24;
  return result;
}

uint64_t sub_2290F9828()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275D8);
  sub_22910A454();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22910B2A0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275B0);
  sub_2290FD3E0();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  return v0;
}

uint64_t sub_2290F99FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
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
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t result;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
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
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;

  v77 = a7;
  v75 = a6;
  v70 = a5;
  v67 = a4;
  v63 = a3;
  v59 = a2;
  v56 = a1;
  v78 = a9;
  v76 = a22;
  v74 = a21;
  v69 = a20;
  v66 = a19;
  v62 = a18;
  v58 = a17;
  v55 = a16;
  v49 = a10;
  v51 = a11;
  v54 = a12;
  v61 = a13;
  v68 = a14;
  v73 = a15;
  v72 = *(_QWORD *)(a15 - 8);
  v23 = MEMORY[0x24BDAC7A8](a10);
  v71 = (char *)&v48 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = *(_QWORD *)(v25 - 8);
  v26 = MEMORY[0x24BDAC7A8](v23);
  v64 = (char *)&v48 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = *(_QWORD *)(v28 - 8);
  v29 = MEMORY[0x24BDAC7A8](v26);
  v57 = (char *)&v48 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = *(_QWORD *)(v31 - 8);
  v32 = MEMORY[0x24BDAC7A8](v29);
  v52 = (char *)&v48 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = *(_QWORD *)(v34 - 8);
  v35 = MEMORY[0x24BDAC7A8](v32);
  v37 = (char *)&v48 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = *(_QWORD *)(v35 - 8);
  v39 = MEMORY[0x24BDAC7A8](v35);
  v41 = (char *)&v48 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v45 = (char *)&v48 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275D8);
  sub_22910A454();
  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_22910B2A0;
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v45, v56, a8);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v41, v59, v49);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v37, v63, v51);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v52, v67, v54);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v57, v70, v61);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v64, v75, v68);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v71, v77, v73);
  result = sub_22910A448();
  *v78 = v46;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t result;
  uint64_t v27;
  uint64_t v28;

  result = sub_2290FA0D4(a1, a2, a3, a4, a5, a6, a7, a8, &v28, a10, a11, a12, a13, a14, a15, a16, a17, *(_QWORD *)(a18 + 8), *(_QWORD *)(a19 + 8),
             *(_QWORD *)(a20 + 8),
             *(_QWORD *)(a21 + 8),
             *(_QWORD *)(a22 + 8),
             *(_QWORD *)(a23 + 8),
             *(_QWORD *)(a24 + 8),
             *(_QWORD *)(a25 + 8));
  v27 = v28;
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v27;
  return result;
}

uint64_t sub_2290F9ECC()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275D8);
  sub_22910A454();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22910B2B0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275B0);
  sub_2290FD3E0();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  return v0;
}

uint64_t sub_2290FA0D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
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
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t result;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v88;

  v87 = a8;
  v85 = a7;
  v81 = a6;
  v78 = a5;
  v73 = a4;
  v69 = a3;
  v66 = a2;
  v61 = a1;
  v88 = a9;
  v86 = a25;
  v84 = a24;
  v80 = a23;
  v76 = a22;
  v72 = a21;
  v68 = a20;
  v65 = a19;
  v60 = a18;
  v54 = a11;
  v56 = a12;
  v59 = a13;
  v64 = a14;
  v71 = a15;
  v77 = a16;
  v83 = a17;
  v82 = *(_QWORD *)(a17 - 8);
  v25 = MEMORY[0x24BDAC7A8](a12);
  v79 = (char *)&v54 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = *(_QWORD *)(v27 - 8);
  v28 = MEMORY[0x24BDAC7A8](v25);
  v74 = (char *)&v54 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = *(_QWORD *)(v30 - 8);
  v31 = MEMORY[0x24BDAC7A8](v28);
  v67 = (char *)&v54 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = *(_QWORD *)(v33 - 8);
  v34 = MEMORY[0x24BDAC7A8](v31);
  v62 = (char *)&v54 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = *(_QWORD *)(v36 - 8);
  v37 = MEMORY[0x24BDAC7A8](v34);
  v39 = (char *)&v54 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = *(_QWORD *)(v37 - 8);
  v40 = MEMORY[0x24BDAC7A8](v37);
  v42 = (char *)&v54 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = *(_QWORD *)(v43 - 8);
  v45 = MEMORY[0x24BDAC7A8](v40);
  v47 = (char *)&v54 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = *(_QWORD *)(a10 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v50 = (char *)&v54 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275D8);
  v58 = 8 * *(_QWORD *)(*(_QWORD *)(sub_22910A454() - 8) + 72);
  v51 = swift_allocObject();
  *(_OWORD *)(v51 + 16) = xmmword_22910B2B0;
  v52 = v51;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v50, v61, a10);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v47, v66, v54);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v42, v69, v56);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v39, v73, v59);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v62, v78, v64);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v67, v81, v71);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v74, v85, v77);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v79, v87, v83);
  result = sub_22910A448();
  *v88 = v52;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I>(_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t result;
  uint64_t v30;
  uint64_t v31;

  result = sub_2290FA88C(a1, a2, a3, a4, a5, a6, a7, a8, &v31, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             *(_QWORD *)(a20 + 8),
             *(_QWORD *)(a21 + 8),
             *(_QWORD *)(a22 + 8),
             *(_QWORD *)(a23 + 8),
             *(_QWORD *)(a24 + 8),
             *(_QWORD *)(a25 + 8),
             *(_QWORD *)(a26 + 8),
             *(_QWORD *)(a27 + 8),
             *(_QWORD *)(a28 + 8));
  v30 = v31;
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v30;
  return result;
}

uint64_t sub_2290FA660()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275D8);
  sub_22910A454();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22910B2C0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275B0);
  sub_2290FD3E0();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  return v0;
}

uint64_t sub_2290FA88C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
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
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t result;
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
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;

  v97 = a8;
  v93 = a7;
  v89 = a6;
  v84 = a5;
  v81 = a4;
  v77 = a3;
  v73 = a2;
  v70 = a1;
  v99 = a9;
  v98 = a28;
  v96 = a27;
  v91 = a26;
  v88 = a25;
  v83 = a24;
  v79 = a23;
  v76 = a22;
  v71 = a21;
  v68 = a20;
  v95 = a10;
  v60 = a12;
  v62 = a13;
  v65 = a14;
  v69 = a15;
  v75 = a16;
  v82 = a17;
  v87 = a18;
  v94 = a19;
  v92 = *(_QWORD *)(a19 - 8);
  v28 = MEMORY[0x24BDAC7A8](a14);
  v90 = (char *)&v59 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = *(_QWORD *)(v30 - 8);
  v31 = MEMORY[0x24BDAC7A8](v28);
  v85 = (char *)&v59 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = *(_QWORD *)(v33 - 8);
  v34 = MEMORY[0x24BDAC7A8](v31);
  v78 = (char *)&v59 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = *(_QWORD *)(v36 - 8);
  v37 = MEMORY[0x24BDAC7A8](v34);
  v72 = (char *)&v59 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = *(_QWORD *)(v39 - 8);
  v40 = MEMORY[0x24BDAC7A8](v37);
  v66 = (char *)&v59 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = *(_QWORD *)(v40 - 8);
  v42 = MEMORY[0x24BDAC7A8](v40);
  v44 = (char *)&v59 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = *(_QWORD *)(v45 - 8);
  v46 = MEMORY[0x24BDAC7A8](v42);
  v48 = (char *)&v59 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = *(_QWORD *)(v49 - 8);
  v51 = MEMORY[0x24BDAC7A8](v46);
  v53 = (char *)&v59 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = *(_QWORD *)(a11 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v56 = (char *)&v59 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275D8);
  v64 = 8 * *(_QWORD *)(*(_QWORD *)(sub_22910A454() - 8) + 72);
  v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = xmmword_22910B2C0;
  (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v56, v70, a11);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v53, v73, v60);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v48, v77, v62);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v44, v81, v65);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v66, v84, v69);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v72, v89, v75);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v78, v93, v82);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v86 + 16))(v85, v97, v87);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v92 + 16))(v90, v95, v94);
  result = sub_22910A448();
  *v99 = v57;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J>(_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  uint64_t result;
  uint64_t v33;
  uint64_t v34;

  result = sub_2290FB138(a1, a2, a3, a4, a5, a6, a7, a8, &v34, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             *(_QWORD *)(a22 + 8),
             *(_QWORD *)(a23 + 8),
             *(_QWORD *)(a24 + 8),
             *(_QWORD *)(a25 + 8),
             *(_QWORD *)(a26 + 8),
             *(_QWORD *)(a27 + 8),
             *(_QWORD *)(a28 + 8),
             *(_QWORD *)(a29 + 8),
             *(_QWORD *)(a30 + 8),
             *(_QWORD *)(a31 + 8));
  v33 = v34;
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v33;
  return result;
}

uint64_t sub_2290FAED8()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275D8);
  sub_22910A454();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22910B2D0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275B0);
  sub_2290FD3E0();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  swift_bridgeObjectRetain();
  sub_22910A448();
  return v0;
}

uint64_t sub_2290FB138@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
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
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t result;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
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
  uint64_t *v108;

  v103 = a8;
  v98 = a7;
  v94 = a6;
  v91 = a5;
  v86 = a4;
  v82 = a3;
  v79 = a2;
  v75 = a1;
  v108 = a9;
  v106 = a11;
  v107 = a31;
  v104 = a10;
  v105 = a30;
  v100 = a29;
  v97 = a28;
  v92 = a27;
  v88 = a26;
  v85 = a25;
  v81 = a24;
  v78 = a23;
  v73 = a22;
  v64 = a13;
  v66 = a14;
  v68 = a15;
  v71 = a16;
  v77 = a17;
  v84 = a18;
  v90 = a19;
  v96 = a20;
  v102 = a21;
  v101 = *(_QWORD *)(a21 - 8);
  v31 = MEMORY[0x24BDAC7A8](a16);
  v99 = (char *)&v64 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = *(_QWORD *)(v33 - 8);
  v34 = MEMORY[0x24BDAC7A8](v31);
  v93 = (char *)&v64 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = *(_QWORD *)(v36 - 8);
  v37 = MEMORY[0x24BDAC7A8](v34);
  v87 = (char *)&v64 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = *(_QWORD *)(v39 - 8);
  v40 = MEMORY[0x24BDAC7A8](v37);
  v80 = (char *)&v64 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = *(_QWORD *)(v42 - 8);
  v43 = MEMORY[0x24BDAC7A8](v40);
  v74 = (char *)&v64 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = *(_QWORD *)(v43 - 8);
  v45 = MEMORY[0x24BDAC7A8](v43);
  v69 = (char *)&v64 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = *(_QWORD *)(v47 - 8);
  v48 = MEMORY[0x24BDAC7A8](v45);
  v50 = (char *)&v64 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = *(_QWORD *)(v51 - 8);
  v52 = MEMORY[0x24BDAC7A8](v48);
  v54 = (char *)&v64 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = *(_QWORD *)(v55 - 8);
  v57 = MEMORY[0x24BDAC7A8](v52);
  v59 = (char *)&v64 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = *(_QWORD *)(a12 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v62 = (char *)&v64 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A275D8);
  sub_22910A454();
  v72 = swift_allocObject();
  *(_OWORD *)(v72 + 16) = xmmword_22910B2D0;
  (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v62, v75, a12);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v59, v79, v64);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v54, v82, v66);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v50, v86, v68);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v69, v91, v71);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v74, v94, v77);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v83 + 16))(v80, v98, v84);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v87, v103, v90);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v93, v104, v96);
  sub_22910A448();
  (*(void (**)(char *, uint64_t, uint64_t))(v101 + 16))(v99, v106, v102);
  result = sub_22910A448();
  *v108 = v72;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K>(_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  uint64_t v36;
  unint64_t v37;
  uint64_t result;
  uint64_t v39;
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

  sub_2290F88AC(a1, a2, a13, a14, *(_QWORD *)(a24 + 8), *(_QWORD *)(a25 + 8), &v54);
  v53 = v54;
  sub_2290F88AC(a3, a4, a15, a16, *(_QWORD *)(a26 + 8), *(_QWORD *)(a27 + 8), &v52);
  v51 = v52;
  sub_2290F88AC(a5, a6, a17, a18, *(_QWORD *)(a28 + 8), *(_QWORD *)(a29 + 8), &v50);
  v49 = v50;
  sub_2290F88AC(a7, a8, a19, a20, *(_QWORD *)(a30 + 8), *(_QWORD *)(a31 + 8), &v48);
  v47 = v48;
  sub_2290F88AC(a10, a11, a21, a22, *(_QWORD *)(a32 + 8), *(_QWORD *)(a33 + 8), &v46);
  v45 = v46;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A275B0);
  v37 = sub_2290FD3E0();
  sub_2290F943C((uint64_t)&v53, (uint64_t)&v51, (uint64_t)&v49, (uint64_t)&v47, (uint64_t)&v45, a12, v36, v36, &v55, v36, v36, v36, a23, v37, v37, v37, v37, v37, *(_QWORD *)(a34 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v39 = v55;
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v39;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L>(_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  uint64_t v38;
  uint64_t result;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  sub_2290F88AC(a1, a2, a14, a15, *(_QWORD *)(a26 + 8), *(_QWORD *)(a27 + 8), &v51);
  sub_2290F88AC(a3, a4, a16, a17, *(_QWORD *)(a28 + 8), *(_QWORD *)(a29 + 8), &v50);
  sub_2290F88AC(a5, a6, a18, a19, *(_QWORD *)(a30 + 8), *(_QWORD *)(a31 + 8), &v49);
  sub_2290F88AC(a7, a8, a20, a21, *(_QWORD *)(a32 + 8), *(_QWORD *)(a33 + 8), &v48);
  sub_2290F88AC(a10, a11, a22, a23, *(_QWORD *)(a34 + 8), *(_QWORD *)(a35 + 8), &v47);
  sub_2290F88AC(a12, a13, a24, a25, *(_QWORD *)(a36 + 8), *(_QWORD *)(a37 + 8), &v46);
  v38 = sub_2290F9290();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v38;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M>(_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  uint64_t v42;
  unint64_t v43;
  uint64_t result;
  uint64_t v45;
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

  sub_2290F88AC(a1, a2, a15, a16, *(_QWORD *)(a28 + 8), *(_QWORD *)(a29 + 8), &v62);
  v61 = v62;
  sub_2290F88AC(a3, a4, a17, a18, *(_QWORD *)(a30 + 8), *(_QWORD *)(a31 + 8), &v60);
  v59 = v60;
  sub_2290F88AC(a5, a6, a19, a20, *(_QWORD *)(a32 + 8), *(_QWORD *)(a33 + 8), &v58);
  v57 = v58;
  sub_2290F88AC(a7, a8, a21, a22, *(_QWORD *)(a34 + 8), *(_QWORD *)(a35 + 8), &v56);
  v55 = v56;
  sub_2290F88AC(a10, a11, a23, a24, *(_QWORD *)(a36 + 8), *(_QWORD *)(a37 + 8), &v54);
  v53 = v54;
  sub_2290F88AC(a12, a13, a25, a26, *(_QWORD *)(a38 + 8), *(_QWORD *)(a39 + 8), &v52);
  v51 = v52;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A275B0);
  v43 = sub_2290FD3E0();
  sub_2290F99FC((uint64_t)&v61, (uint64_t)&v59, (uint64_t)&v57, (uint64_t)&v55, (uint64_t)&v53, (uint64_t)&v51, a14, v42, &v63, v42, v42, v42, v42, v42, a27, v43, v43, v43, v43,
    v43,
    v43,
    *(_QWORD *)(a40 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v45 = v63;
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v45;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  uint64_t v43;
  uint64_t result;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  sub_2290F88AC(a1, a2, a16, a17, *(_QWORD *)(a30 + 8), *(_QWORD *)(a31 + 8), &v58);
  sub_2290F88AC(a3, a4, a18, a19, *(_QWORD *)(a32 + 8), *(_QWORD *)(a33 + 8), &v57);
  sub_2290F88AC(a5, a6, a20, a21, *(_QWORD *)(a34 + 8), *(_QWORD *)(a35 + 8), &v56);
  sub_2290F88AC(a7, a8, a22, a23, *(_QWORD *)(a36 + 8), *(_QWORD *)(a37 + 8), &v55);
  sub_2290F88AC(a10, a11, a24, a25, *(_QWORD *)(a38 + 8), *(_QWORD *)(a39 + 8), &v54);
  sub_2290F88AC(a12, a13, a26, a27, *(_QWORD *)(a40 + 8), *(_QWORD *)(a41 + 8), &v53);
  sub_2290F88AC(a14, a15, a28, a29, *(_QWORD *)(a42 + 8), *(_QWORD *)(a43 + 8), &v52);
  v43 = sub_2290F9828();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v43;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46)
{
  uint64_t v46;
  unint64_t v47;
  uint64_t result;
  uint64_t v49;
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

  sub_2290F88AC(a1, a2, a17, a18, *(_QWORD *)(a32 + 8), *(_QWORD *)(a33 + 8), &v70);
  v69 = v70;
  sub_2290F88AC(a3, a4, a19, a20, *(_QWORD *)(a34 + 8), *(_QWORD *)(a35 + 8), &v68);
  v67 = v68;
  sub_2290F88AC(a5, a6, a21, a22, *(_QWORD *)(a36 + 8), *(_QWORD *)(a37 + 8), &v66);
  v65 = v66;
  sub_2290F88AC(a7, a8, a23, a24, *(_QWORD *)(a38 + 8), *(_QWORD *)(a39 + 8), &v64);
  v63 = v64;
  sub_2290F88AC(a10, a11, a25, a26, *(_QWORD *)(a40 + 8), *(_QWORD *)(a41 + 8), &v62);
  v61 = v62;
  sub_2290F88AC(a12, a13, a27, a28, *(_QWORD *)(a42 + 8), *(_QWORD *)(a43 + 8), &v60);
  v59 = v60;
  sub_2290F88AC(a14, a15, a29, a30, *(_QWORD *)(a44 + 8), *(_QWORD *)(a45 + 8), &v58);
  v57 = v58;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A275B0);
  v47 = sub_2290FD3E0();
  sub_2290FA0D4((uint64_t)&v69, (uint64_t)&v67, (uint64_t)&v65, (uint64_t)&v63, (uint64_t)&v61, (uint64_t)&v59, (uint64_t)&v57, a16, &v71, v46, v46, v46, v46, v46, v46, v46, a31, v47, v47,
    v47,
    v47,
    v47,
    v47,
    v47,
    *(_QWORD *)(a46 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v49 = v71;
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v49;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  uint64_t v49;
  uint64_t result;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  sub_2290F88AC(a1, a2, a18, a19, *(_QWORD *)(a34 + 8), *(_QWORD *)(a35 + 8), &v65);
  sub_2290F88AC(a3, a4, a20, a21, *(_QWORD *)(a36 + 8), *(_QWORD *)(a37 + 8), &v64);
  sub_2290F88AC(a5, a6, a22, a23, *(_QWORD *)(a38 + 8), *(_QWORD *)(a39 + 8), &v63);
  sub_2290F88AC(a7, a8, a24, a25, *(_QWORD *)(a40 + 8), *(_QWORD *)(a41 + 8), &v62);
  sub_2290F88AC(a10, a11, a26, a27, *(_QWORD *)(a42 + 8), *(_QWORD *)(a43 + 8), &v61);
  sub_2290F88AC(a12, a13, a28, a29, *(_QWORD *)(a44 + 8), *(_QWORD *)(a45 + 8), &v60);
  sub_2290F88AC(a14, a15, a30, a31, *(_QWORD *)(a46 + 8), *(_QWORD *)(a47 + 8), &v59);
  sub_2290F88AC(a16, a17, a32, a33, *(_QWORD *)(a48 + 8), *(_QWORD *)(a49 + 8), &v58);
  v49 = sub_2290F9ECC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v49;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  uint64_t v52;
  unint64_t v53;
  uint64_t result;
  uint64_t v55;
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

  sub_2290F88AC(a1, a2, a19, a20, *(_QWORD *)(a36 + 8), *(_QWORD *)(a37 + 8), &v78);
  v77 = v78;
  sub_2290F88AC(a3, a4, a21, a22, *(_QWORD *)(a38 + 8), *(_QWORD *)(a39 + 8), &v76);
  v75 = v76;
  sub_2290F88AC(a5, a6, a23, a24, *(_QWORD *)(a40 + 8), *(_QWORD *)(a41 + 8), &v74);
  v73 = v74;
  sub_2290F88AC(a7, a8, a25, a26, *(_QWORD *)(a42 + 8), *(_QWORD *)(a43 + 8), &v72);
  v71 = v72;
  sub_2290F88AC(a10, a11, a27, a28, *(_QWORD *)(a44 + 8), *(_QWORD *)(a45 + 8), &v70);
  v69 = v70;
  sub_2290F88AC(a12, a13, a29, a30, *(_QWORD *)(a46 + 8), *(_QWORD *)(a47 + 8), &v68);
  v67 = v68;
  sub_2290F88AC(a14, a15, a31, a32, *(_QWORD *)(a48 + 8), *(_QWORD *)(a49 + 8), &v66);
  v65 = v66;
  sub_2290F88AC(a16, a17, a33, a34, *(_QWORD *)(a50 + 8), *(_QWORD *)(a51 + 8), &v64);
  v63 = v64;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A275B0);
  v53 = sub_2290FD3E0();
  sub_2290FA88C((uint64_t)&v77, (uint64_t)&v75, (uint64_t)&v73, (uint64_t)&v71, (uint64_t)&v69, (uint64_t)&v67, (uint64_t)&v65, (uint64_t)&v63, &v79, a18, v52, v52, v52, v52, v52, v52, v52, v52, a35,
    v53,
    v53,
    v53,
    v53,
    v53,
    v53,
    v53,
    v53,
    *(_QWORD *)(a52 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v55 = v79;
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v55;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  uint64_t v55;
  uint64_t result;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  sub_2290F88AC(a1, a2, a20, a21, *(_QWORD *)(a38 + 8), *(_QWORD *)(a39 + 8), &v72);
  sub_2290F88AC(a3, a4, a22, a23, *(_QWORD *)(a40 + 8), *(_QWORD *)(a41 + 8), &v71);
  sub_2290F88AC(a5, a6, a24, a25, *(_QWORD *)(a42 + 8), *(_QWORD *)(a43 + 8), &v70);
  sub_2290F88AC(a7, a8, a26, a27, *(_QWORD *)(a44 + 8), *(_QWORD *)(a45 + 8), &v69);
  sub_2290F88AC(a10, a11, a28, a29, *(_QWORD *)(a46 + 8), *(_QWORD *)(a47 + 8), &v68);
  sub_2290F88AC(a12, a13, a30, a31, *(_QWORD *)(a48 + 8), *(_QWORD *)(a49 + 8), &v67);
  sub_2290F88AC(a14, a15, a32, a33, *(_QWORD *)(a50 + 8), *(_QWORD *)(a51 + 8), &v66);
  sub_2290F88AC(a16, a17, a34, a35, *(_QWORD *)(a52 + 8), *(_QWORD *)(a53 + 8), &v65);
  sub_2290F88AC(a18, a19, a36, a37, *(_QWORD *)(a54 + 8), *(_QWORD *)(a55 + 8), &v64);
  v55 = sub_2290FA660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v55;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  uint64_t v58;
  unint64_t v59;
  uint64_t result;
  uint64_t v61;
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

  sub_2290F88AC(a1, a2, a21, a22, *(_QWORD *)(a40 + 8), *(_QWORD *)(a41 + 8), &v86);
  v85 = v86;
  sub_2290F88AC(a3, a4, a23, a24, *(_QWORD *)(a42 + 8), *(_QWORD *)(a43 + 8), &v84);
  v83 = v84;
  sub_2290F88AC(a5, a6, a25, a26, *(_QWORD *)(a44 + 8), *(_QWORD *)(a45 + 8), &v82);
  v81 = v82;
  sub_2290F88AC(a7, a8, a27, a28, *(_QWORD *)(a46 + 8), *(_QWORD *)(a47 + 8), &v80);
  v79 = v80;
  sub_2290F88AC(a10, a11, a29, a30, *(_QWORD *)(a48 + 8), *(_QWORD *)(a49 + 8), &v78);
  v77 = v78;
  sub_2290F88AC(a12, a13, a31, a32, *(_QWORD *)(a50 + 8), *(_QWORD *)(a51 + 8), &v76);
  v75 = v76;
  sub_2290F88AC(a14, a15, a33, a34, *(_QWORD *)(a52 + 8), *(_QWORD *)(a53 + 8), &v74);
  v73 = v74;
  sub_2290F88AC(a16, a17, a35, a36, *(_QWORD *)(a54 + 8), *(_QWORD *)(a55 + 8), &v72);
  v71 = v72;
  sub_2290F88AC(a18, a19, a37, a38, *(_QWORD *)(a56 + 8), *(_QWORD *)(a57 + 8), &v70);
  v69 = v70;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A275B0);
  v59 = sub_2290FD3E0();
  sub_2290FB138((uint64_t)&v85, (uint64_t)&v83, (uint64_t)&v81, (uint64_t)&v79, (uint64_t)&v77, (uint64_t)&v75, (uint64_t)&v73, (uint64_t)&v71, &v87, (uint64_t)&v69, a20, v58, v58, v58, v58, v58, v58, v58, v58,
    v58,
    a39,
    v59,
    v59,
    v59,
    v59,
    v59,
    v59,
    v59,
    v59,
    v59,
    *(_QWORD *)(a58 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v61 = v87;
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v61;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  uint64_t result;
  uint64_t v68;
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

  sub_2290F88AC(a1, a2, a22, a23, *(_QWORD *)(a42 + 8), *(_QWORD *)(a43 + 8), &v79);
  sub_2290F88AC(a3, a4, a24, a25, *(_QWORD *)(a44 + 8), *(_QWORD *)(a45 + 8), &v78);
  sub_2290F88AC(a5, a6, a26, a27, *(_QWORD *)(a46 + 8), *(_QWORD *)(a47 + 8), &v77);
  sub_2290F88AC(a7, a8, a28, a29, *(_QWORD *)(a48 + 8), *(_QWORD *)(a49 + 8), &v76);
  sub_2290F88AC(a10, a11, a30, a31, *(_QWORD *)(a50 + 8), *(_QWORD *)(a51 + 8), &v75);
  sub_2290F88AC(a12, a13, a32, a33, *(_QWORD *)(a52 + 8), *(_QWORD *)(a53 + 8), &v74);
  sub_2290F88AC(a14, a15, a34, a35, *(_QWORD *)(a54 + 8), *(_QWORD *)(a55 + 8), &v73);
  sub_2290F88AC(a16, a17, a36, a37, *(_QWORD *)(a56 + 8), *(_QWORD *)(a57 + 8), &v72);
  sub_2290F88AC(a18, a19, a38, a39, *(_QWORD *)(a58 + 8), *(_QWORD *)(a59 + 8), &v71);
  sub_2290F88AC(a20, a21, a40, a41, *(_QWORD *)(a60 + 8), *(_QWORD *)(a61 + 8), &v70);
  v68 = sub_2290FAED8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a9 = sub_2290FDD9C;
  a9[1] = 0;
  a9[2] = (void (*)())v68;
  return result;
}

unint64_t sub_2290FD3E0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_255A275B8;
  if (!qword_255A275B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A275B0);
    v2 = sub_2290FD444();
    result = MEMORY[0x22E2C25B8](MEMORY[0x24BDC7AE8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255A275B8);
  }
  return result;
}

unint64_t sub_2290FD444()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A275C0;
  if (!qword_255A275C0)
  {
    v1 = sub_22910A454();
    result = MEMORY[0x22E2C25B8](MEMORY[0x24BDC7AA0], v1);
    atomic_store(result, (unint64_t *)&qword_255A275C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceActivityReportBuilder()
{
  return &type metadata for DeviceActivityReportBuilder;
}

void sub_2290FD49C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _s5SceneVMa(255, *a1, *(_QWORD *)(a1[1] + 8), a4);
  JUMPOUT(0x22E2C25B8);
}

unint64_t sub_2290FD4CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A275C8;
  if (!qword_255A275C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A275D0);
    result = MEMORY[0x22E2C25B8](&unk_22910B510, v1);
    atomic_store(result, (unint64_t *)&qword_255A275C8);
  }
  return result;
}

uint64_t sub_2290FD560@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (**a5)()@<X8>)
{
  char *v7;

  *a5 = sub_2290FDD9C;
  a5[1] = 0;
  v7 = (char *)a5 + *(int *)(_s5SceneVMa(0, a2, a3, a4) + 36);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(v7, a1, a2);
}

uint64_t DeviceActivityReportExtension.configuration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v6, a1);
  v7 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8 + v7, (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return sub_22910A430();
}

uint64_t sub_2290FD6D0()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_2290FD728()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 32))();
}

uint64_t DeviceActivityReportScene.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v15[2];
  uint64_t v16;

  v15[1] = a3;
  v6 = *(_QWORD *)(a1 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v8 = objc_msgSend(objc_allocWithZone((Class)_s18SceneConfigurationCMa()), sel_init);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 40))(&v16, a1, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
  v9 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10 + v9, (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  *(_QWORD *)(v10 + ((v7 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = v8;
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  v12 = _s9SceneViewVMa(0, a1, a2, v11);
  v13 = v8;
  MEMORY[0x22E2C25B8](&unk_22910B52C, v12);
  return sub_22910A424();
}

uint64_t _s18SceneConfigurationCMa()
{
  uint64_t result;

  result = qword_255A27638;
  if (!qword_255A27638)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2290FD91C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
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
  char *v20;
  id v21;
  void (*v22)(char *, char *, uint64_t);
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  char *v26;

  v26 = a5;
  v9 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _s9SceneViewVMa(0, v12, v13, v13);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v25 - v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, a3);
  v21 = a2;
  sub_2290FDB14((uint64_t)v11, a3, a4, (uint64_t)v18);
  MEMORY[0x22E2C25B8](&unk_22910B52C, v14);
  v22 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v22(v20, v18, v14);
  v23 = *(void (**)(char *, uint64_t))(v15 + 8);
  v23(v18, v14);
  v22(v26, v20, v14);
  return ((uint64_t (*)(char *, uint64_t))v23)(v20, v14);
}

uint64_t sub_2290FDA78()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t))(v1 + 8))(v0 + v2);

  return swift_deallocObject();
}

uint64_t sub_2290FDAE4@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_2290FD91C(v1 + v4, *(void **)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)), v2, *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_2290FDB14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;

  v7 = _s9SceneViewVMa(0, a2, a3, a3);
  v8 = (_QWORD *)(a4 + *(int *)(v7 + 40));
  sub_22910A85C();
  sub_22910A838();
  *v8 = v15;
  v8[1] = v16;
  v9 = *(_QWORD *)(a2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(a4, a1, a2);
  v10 = (uint64_t *)(a4 + *(int *)(v7 + 36));
  _s18SceneConfigurationCMa();
  sub_2290F873C(&qword_255A27858, (uint64_t (*)(uint64_t))_s18SceneConfigurationCMa, (uint64_t)&unk_22910B4D8);
  v11 = sub_22910A778();
  v13 = v12;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, a2);
  *v10 = v11;
  v10[1] = v13;
  return result;
}

uint64_t sub_2290FDC18()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2290FDC3C(void *a1)
{
  sub_2290FEE24(a1);
  return 1;
}

uint64_t _s9SceneViewVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s9SceneViewVMn);
}

uint64_t dispatch thunk of DeviceActivityReportExtension.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of DeviceActivityReportScene.context.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of DeviceActivityReportScene.makeConfiguration(representing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 48) + *(_QWORD *)(a4 + 48));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_2290FDD04;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_2290FDD04()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of DeviceActivityReportScene.content.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

void sub_2290FDD54()
{
  sub_22910AA9C();
  __break(1u);
}

void sub_2290FDD9C()
{
  sub_22910AA9C();
  __break(1u);
}

uint64_t sub_2290FDDE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 36));
}

void sub_2290FDE00()
{
  sub_2290FDD54();
}

uint64_t sub_2290FDE0C()
{
  sub_22910A94C();
  sub_22910A940();
  sub_22910A91C();
  return swift_task_switch();
}

uint64_t sub_2290FDE70()
{
  return sub_22910AA9C();
}

void (*sub_2290FDECC())()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v0;
  v1 = v0[1];
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  swift_retain();
  return sub_229102164;
}

uint64_t sub_2290FDF2C()
{
  _s18SceneConfigurationCMa();
  sub_2290F873C(&qword_255A27858, (uint64_t (*)(uint64_t))_s18SceneConfigurationCMa, (uint64_t)&unk_22910B4D8);
  return sub_22910A778();
}

uint64_t sub_2290FDF7C()
{
  uint64_t v1;

  sub_22910A838();
  return v1;
}

uint64_t sub_2290FDFB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (**v18)(uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t KeyPath;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = *(_QWORD *)(a1 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A277A8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&KeyPath - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t *)(v2 + *(int *)(a1 + 40));
  v13 = *v11;
  v12 = v11[1];
  v22 = v13;
  v23 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A277B0);
  sub_22910A844();
  v21 = v24;
  KeyPath = swift_getKeyPath();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A277B8);
  sub_22910A748();
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&KeyPath - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  v14 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = *(_OWORD *)(a1 + 16);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v15 + v14, (char *)&KeyPath - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A277C0);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a2 + *(int *)(v16 + 52), v10, v7);
  v17 = KeyPath;
  *(_QWORD *)a2 = v21;
  *(_QWORD *)(a2 + 8) = v17;
  *(_BYTE *)(a2 + 16) = 0;
  v18 = (uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(a2 + *(int *)(v16 + 56));
  *v18 = sub_229101CD4;
  v18[1] = (uint64_t (*)(uint64_t *, uint64_t, uint64_t, uint64_t))v15;
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_2290FE19C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  char *v16;
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  char *v36;
  uint64_t v37;
  _QWORD aBlock[6];

  v8 = _s9SceneViewVMa(0, a3, a4, a4);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v36 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A277C8);
  result = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *a1;
  if (*a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A277D0);
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = 0;
    *(_QWORD *)(v18 + 24) = v17;
    *(_OWORD *)(v18 + 32) = 0u;
    *(_OWORD *)(v18 + 48) = 0u;
    v37 = a3;
    v19 = v18 + qword_255A27C80;
    v20 = sub_22910A694();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 1, 1, v20);
    *(_QWORD *)(v18 + qword_255A27C88) = 0;
    v21 = v18 + qword_255A27C90;
    *(_QWORD *)(v21 + 32) = 0;
    *(_OWORD *)v21 = 0u;
    *(_OWORD *)(v21 + 16) = 0u;
    v36 = *(char **)(a2 + *(int *)(v8 + 36) + 8);
    swift_bridgeObjectRetain();
    sub_22910A958();
    v22 = sub_22910A970();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v16, 0, 1, v22);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a2, v8);
    sub_22910A94C();
    swift_retain();
    v23 = sub_22910A940();
    v24 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v25 = a4;
    v26 = (v10 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
    v27 = (char *)swift_allocObject();
    v28 = MEMORY[0x24BEE6930];
    *((_QWORD *)v27 + 2) = v23;
    *((_QWORD *)v27 + 3) = v28;
    *((_QWORD *)v27 + 4) = v37;
    *((_QWORD *)v27 + 5) = v25;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v27[v24], v12, v8);
    *(_QWORD *)&v27[v26] = v18;
    v29 = sub_2290FE930((uint64_t)v16, (uint64_t)&unk_255A277E0, (uint64_t)v27);
    v30 = v36;
    v31 = *(NSObject **)&v36[OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_updateTaskQueue];
    v32 = swift_allocObject();
    *(_QWORD *)(v32 + 16) = v30;
    *(_QWORD *)(v32 + 24) = v29;
    v33 = swift_allocObject();
    *(_QWORD *)(v33 + 16) = sub_229101EE0;
    *(_QWORD *)(v33 + 24) = v32;
    aBlock[4] = sub_229101EF8;
    aBlock[5] = v33;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2290FF510;
    aBlock[3] = &block_descriptor;
    v34 = _Block_copy(aBlock);
    v35 = v30;
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v31, v34);
    _Block_release(v34);
    LOBYTE(v31) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    swift_release();
    result = swift_release();
    if ((v31 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_2290FE4F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, _QWORD *, uint64_t, uint64_t);

  v7[4] = a6;
  v7[5] = a7;
  v7[3] = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7[6] = AssociatedTypeWitness;
  v7[7] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = swift_task_alloc();
  v7[8] = v12;
  v7[9] = sub_22910A94C();
  v7[10] = sub_22910A940();
  v7[2] = a5;
  v15 = (uint64_t (*)(uint64_t, _QWORD *, uint64_t, uint64_t))(**(int **)(a7 + 48) + *(_QWORD *)(a7 + 48));
  v13 = (_QWORD *)swift_task_alloc();
  v7[11] = v13;
  *v13 = v7;
  v13[1] = sub_2290FE5EC;
  return v15(v12, v7 + 2, a6, a7);
}

uint64_t sub_2290FE5EC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  swift_task_dealloc();
  *(_QWORD *)(v1 + 96) = sub_22910A91C();
  *(_QWORD *)(v1 + 104) = v2;
  return swift_task_switch();
}

uint64_t sub_2290FE660()
{
  uint64_t v0;

  if ((sub_22910A988() & 1) == 0)
    return swift_task_switch();
  swift_release();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2290FE6D4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 112) = sub_22910A940();
  sub_22910A91C();
  return swift_task_switch();
}

uint64_t sub_2290FE734()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[8];
  v3 = v0[4];
  v2 = v0[5];
  v4 = v0[3];
  swift_release();
  sub_2290FE7EC(v4, v1, v3, v2);
  return swift_task_switch();
}

uint64_t sub_2290FE7A0()
{
  uint64_t v0;

  swift_release();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2290FE7EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness;
  void (*v8)(uint64_t);
  uint64_t v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v8 = (void (*)(uint64_t))(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 56))(a3, a4);
  v8(a2);
  swift_release();
  swift_getAssociatedConformanceWitness();
  sub_22910A85C();
  _s9SceneViewVMa(0, a3, a4, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A277B0);
  return sub_22910A850();
}

uint64_t sub_2290FE930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_22910A970();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_22910A964();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2290F58B0(a1, &qword_255A277C8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22910A91C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2290FEA7C()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_22910A754();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2290FEAF0@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[6];

  v3 = *(void **)(result
                + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection);
  if (!v3)
    goto LABEL_3;
  v7[4] = sub_2290FEBF8;
  v7[5] = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_2290FEDD4;
  v7[3] = &block_descriptor_41;
  v4 = _Block_copy(v7);
  v5 = v3;
  v6 = objc_msgSend(v5, sel_remoteObjectProxyWithErrorHandler_, v4);
  _Block_release(v4);

  sub_22910AA30();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A27C00);
  result = swift_dynamicCast();
  if ((result & 1) == 0)
LABEL_3:
    *a2 = 0;
  return result;
}

void sub_2290FEBF8(void *a1)
{
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *oslog;
  uint64_t v9;

  if (qword_255A27500 != -1)
    swift_once();
  v2 = sub_22910A724();
  __swift_project_value_buffer(v2, (uint64_t)qword_255A28890);
  MEMORY[0x22E2C251C](a1);
  MEMORY[0x22E2C251C](a1);
  oslog = sub_22910A70C();
  v3 = sub_22910A9A0();
  if (os_log_type_enabled(oslog, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136446210;
    MEMORY[0x22E2C251C](a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A27810);
    v6 = sub_22910A8BC();
    sub_2290F4B9C(v6, v7, &v9);
    sub_22910AA18();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2290F1000, oslog, v3, "Failed to create service proxy for scene configuration: %{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2C2648](v5, -1, -1);
    MEMORY[0x22E2C2648](v4, -1, -1);

  }
  else
  {

  }
}

void sub_2290FEDD4(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_2290FEE24(void *a1)
{
  char *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char *v15;
  id v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t (*v22)();
  uint64_t v23;

  v2 = a1;
  objc_msgSend(a1, sel_setExportedObject_, v1);
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_interfaceWithProtocol_, &unk_255A29698);
  objc_msgSend(v2, sel_setExportedInterface_, v4);

  v5 = objc_msgSend(v3, sel_interfaceWithProtocol_, &unk_255A299E0);
  objc_msgSend(v2, sel_setRemoteObjectInterface_, v5);

  v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v22 = sub_229102568;
  v23 = v6;
  v7 = MEMORY[0x24BDAC760];
  v18 = MEMORY[0x24BDAC760];
  v19 = 1107296256;
  v20 = sub_229102E04;
  v21 = &block_descriptor_47;
  v8 = _Block_copy(&v18);
  swift_release();
  objc_msgSend(v2, sel_setInterruptionHandler_, v8);
  _Block_release(v8);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v22 = sub_229102570;
  v23 = v9;
  v18 = v7;
  v19 = 1107296256;
  v20 = sub_229102E04;
  v21 = &block_descriptor_51;
  v10 = _Block_copy(&v18);
  swift_release();
  objc_msgSend(v2, sel_setInvalidationHandler_, v10);
  _Block_release(v10);
  objc_msgSend(v2, sel_activate);
  v11 = *(NSObject **)&v1[OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connectionQueue];
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v1;
  *(_QWORD *)(v12 + 24) = v2;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_2291025A4;
  *(_QWORD *)(v13 + 24) = v12;
  v22 = sub_229102BDC;
  v23 = v13;
  v18 = v7;
  v19 = 1107296256;
  v20 = sub_2290FF510;
  v21 = &block_descriptor_61;
  v14 = _Block_copy(&v18);
  v15 = v1;
  v16 = v2;
  swift_retain();
  swift_release();
  dispatch_sync(v11, v14);
  _Block_release(v14);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v2 & 1) == 0)
    return 1;
  __break(1u);
  return result;
}

uint64_t sub_2290FF0FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t result;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD aBlock[6];

  v1 = a1 + 16;
  if (qword_255A27500 != -1)
    swift_once();
  v2 = sub_22910A724();
  __swift_project_value_buffer(v2, (uint64_t)qword_255A28890);
  v3 = sub_22910A70C();
  v4 = sub_22910A9B8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2290F1000, v3, v4, "The extension's connection to our view service was interrupted.", v5, 2u);
    MEMORY[0x22E2C2648](v5, -1, -1);
  }

  swift_beginAccess();
  result = MEMORY[0x22E2C26C0](v1);
  if (result)
  {
    v7 = (void *)result;
    v8 = *(NSObject **)(result
                      + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connectionQueue);
    v9 = swift_allocObject();
    *(_BYTE *)(v9 + 16) = 1;
    *(_QWORD *)(v9 + 24) = v7;
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = sub_229102610;
    *(_QWORD *)(v10 + 24) = v9;
    aBlock[4] = sub_229102BDC;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2290FF510;
    aBlock[3] = &block_descriptor_82;
    v11 = _Block_copy(aBlock);
    v12 = v7;
    swift_retain();
    swift_release();
    dispatch_sync(v8, v11);
    _Block_release(v11);
    LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    result = swift_release();
    if ((v8 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_2290FF308(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t result;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD aBlock[6];

  v1 = a1 + 16;
  if (qword_255A27500 != -1)
    swift_once();
  v2 = sub_22910A724();
  __swift_project_value_buffer(v2, (uint64_t)qword_255A28890);
  v3 = sub_22910A70C();
  v4 = sub_22910A9B8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2290F1000, v3, v4, "The extension's connection to our view service was invalidated.", v5, 2u);
    MEMORY[0x22E2C2648](v5, -1, -1);
  }

  swift_beginAccess();
  result = MEMORY[0x22E2C26C0](v1);
  if (result)
  {
    v7 = (void *)result;
    v8 = *(NSObject **)(result
                      + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connectionQueue);
    v9 = swift_allocObject();
    *(_BYTE *)(v9 + 16) = 0;
    *(_QWORD *)(v9 + 24) = v7;
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = sub_229102610;
    *(_QWORD *)(v10 + 24) = v9;
    aBlock[4] = sub_229102BDC;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2290FF510;
    aBlock[3] = &block_descriptor_71;
    v11 = _Block_copy(aBlock);
    v12 = v7;
    swift_retain();
    swift_release();
    dispatch_sync(v8, v11);
    _Block_release(v11);
    LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    result = swift_release();
    if ((v8 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_2290FF510(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_2290FF530(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_updateTask;
  if (*(_QWORD *)(a1 + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_updateTask))
  {
    swift_retain();
    sub_22910A97C();
    swift_release();
  }
  *(_QWORD *)(a1 + v4) = a2;
  swift_retain();
  return swift_release();
}

uint64_t sub_2290FF5AC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X3>, uint64_t a4@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t (*v22)(uint64_t);
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v44 = a3;
  v45 = a4;
  v39 = a2;
  v46 = a1;
  v38 = sub_22910A3E8();
  v36 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v37 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_22910A598();
  v42 = *(_QWORD *)(v5 - 8);
  v43 = v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v41 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v40 = (uint64_t)&v32 - v8;
  v9 = sub_22910A694();
  v33 = *(_QWORD *)(v9 - 8);
  v34 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_22910A478();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_22910A490();
  v35 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v32 - v20;
  sub_2290F873C(&qword_255A27848, v22, MEMORY[0x24BDC70F0]);
  v23 = v50;
  result = sub_22910A394();
  if (!v23)
  {
    sub_22910A484();
    sub_22910A46C();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v25 = sub_22910A688();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v34);
    v26 = (uint64_t)v37;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v37, v39, v38);
    v27 = v40;
    DeviceActivityFilter.SegmentInterval.init(_:_:)(v25, v26, v40);
    v28 = v35;
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v19, v21, v16);
    v29 = v42;
    v30 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v41, v27, v43);
    v48 = _s18SceneConfigurationCMa();
    v49 = sub_2290F873C(&qword_255A27850, (uint64_t (*)(uint64_t))_s18SceneConfigurationCMa, (uint64_t)&unk_22910B4B0);
    v47 = v44;
    v31 = v44;
    sub_22910A550();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v27, v30);
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v21, v16);
  }
  return result;
}

unint64_t sub_2290FF8C0(void (*a1)(_QWORD), uint64_t a2, uint64_t a3)
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
  unint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  char *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v25[2];
  void (*v26)(_QWORD);
  char *v27;
  char *v28;
  uint64_t v29;
  _QWORD v30[2];
  unint64_t v31;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A27838);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_22910A544();
  v9 = *(_QWORD *)(v29 - 8);
  v10 = MEMORY[0x24BDAC7A8](v29);
  v28 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v27 = (char *)v25 - v12;
  v13 = *(_QWORD *)(a3 + 16);
  if (!v13)
    return MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  v25[1] = a3;
  v14 = (unint64_t *)(a3 + 40);
  v31 = MEMORY[0x24BEE4AF8];
  v26 = a1;
  do
  {
    v15 = v9;
    v16 = *(v14 - 1);
    v17 = *v14;
    v30[0] = v16;
    v30[1] = v17;
    sub_2290F551C(v16, v17);
    a1(v30);
    if (v3)
    {
      sub_2290F569C(v16, v17);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v31;
    }
    sub_2290F569C(v16, v17);
    v9 = v15;
    v18 = v29;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v29) == 1)
    {
      sub_2290F58B0((uint64_t)v8, &qword_255A27838);
    }
    else
    {
      v19 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
      v20 = v27;
      v19(v27, v8, v18);
      v19(v28, v20, v18);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v31 = sub_2291022F4(0, *(_QWORD *)(v31 + 16) + 1, 1, v31);
      v22 = *(_QWORD *)(v31 + 16);
      v21 = *(_QWORD *)(v31 + 24);
      if (v22 >= v21 >> 1)
        v31 = sub_2291022F4(v21 > 1, v22 + 1, 1, v31);
      v23 = v31;
      *(_QWORD *)(v31 + 16) = v22 + 1;
      v19((char *)(v23+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(_QWORD *)(v15 + 72) * v22), v28, v29);
      v9 = v15;
      a1 = v26;
    }
    v14 += 2;
    --v13;
  }
  while (v13);
  swift_bridgeObjectRelease();
  return v31;
}

uint64_t sub_2290FFB40(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  id v5;
  id v6;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v5 = a1;
  sub_22910A760();
  swift_getKeyPath();
  swift_getKeyPath();
  v6 = v5;
  sub_22910A760();
  return a3(0);
}

void sub_2290FFD0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_22910A3F4();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

void sub_2290FFD58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD aBlock[7];

  v29 = a6;
  v30 = a7;
  v28[0] = a3;
  v28[1] = a5;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A27800);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A277F8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A27808);
  sub_22910A9E8();
  v20 = (void *)aBlock[0];
  if (aBlock[0])
  {
    if (a4)
      v28[0] = sub_22910A8A4();
    else
      v28[0] = 0;
    v29 = sub_22910A8A4();
    v30 = sub_22910A688();
    v22 = (void *)sub_22910A8A4();
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v13);
    v23 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = a8;
    *(_QWORD *)(v24 + 24) = a9;
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v24 + v23, v16, v13);
    aBlock[4] = sub_22910223C;
    aBlock[5] = v24;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2291006F0;
    aBlock[3] = &block_descriptor_38;
    v25 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    v26 = (void *)v28[0];
    v27 = (void *)v29;
    objc_msgSend(v20, sel_fetchActivitySegmentWithUserAltDSID_deviceIdentifier_segmentInterval_recordName::, v28[0], v29, v30, v22, v25);
    _Block_release(v25);
    swift_unknownObjectRelease();

  }
  else
  {
    v21 = sub_22910A4D8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v19, 1, 1, v21);
    sub_22910A928();
  }
}

uint64_t sub_2290FFFD0(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v40 = (char *)a4;
  v41 = a6;
  v10 = sub_22910A460();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v39 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A277F8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v39 - v21;
  v23 = sub_22910A4D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
  if (a2 >> 60 == 15)
  {
    if (a3)
    {
      v40 = v20;
      MEMORY[0x22E2C251C](a3);
      if (qword_255A27500 != -1)
        swift_once();
      v24 = sub_22910A724();
      __swift_project_value_buffer(v24, (uint64_t)qword_255A28890);
      MEMORY[0x22E2C251C](a3);
      MEMORY[0x22E2C251C](a3);
      v25 = sub_22910A70C();
      v26 = sub_22910A9A0();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc();
        v28 = swift_slowAlloc();
        v42 = (uint64_t)a3;
        v43 = v28;
        *(_DWORD *)v27 = 136446210;
        MEMORY[0x22E2C251C](a3);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255A27810);
        v29 = sub_22910A8BC();
        v42 = sub_2290F4B9C(v29, v30, &v43);
        sub_22910AA18();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_2290F1000, v25, v26, "Failed to fetch activity segment: %{public}s", v27, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E2C2648](v28, -1, -1);
        MEMORY[0x22E2C2648](v27, -1, -1);

      }
      else
      {

      }
      v31 = (uint64_t)v40;
    }
    else
    {
      v32 = v20;
      if (qword_255A27500 != -1)
        swift_once();
      v33 = sub_22910A724();
      __swift_project_value_buffer(v33, (uint64_t)qword_255A28890);
      swift_bridgeObjectRetain_n();
      v34 = sub_22910A70C();
      v35 = sub_22910A9AC();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)swift_slowAlloc();
        v37 = swift_slowAlloc();
        v43 = v37;
        *(_DWORD *)v36 = 136446210;
        swift_bridgeObjectRetain();
        v42 = sub_2290F4B9C((uint64_t)v40, a5, &v43);
        sub_22910AA18();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2290F1000, v34, v35, "Failed to fetch activity segment: %{public}s", v36, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E2C2648](v37, -1, -1);
        MEMORY[0x22E2C2648](v36, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v31 = (uint64_t)v32;
    }
  }
  else
  {
    v40 = v20;
    sub_22910A3AC();
    swift_allocObject();
    sub_2290F551C(a1, a2);
    sub_22910A3A0();
    sub_2290F873C(&qword_255A27818, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7090], MEMORY[0x24BDC70A0]);
    sub_22910A394();
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
    v31 = (uint64_t)v40;
    sub_22910A4E4();
    swift_release();
    sub_229102298(a1, a2);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    sub_2290F58B0((uint64_t)v22, &qword_255A277F8);
    sub_2291024FC(v31, (uint64_t)v22);
  }
  sub_2291022AC((uint64_t)v22, v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A27800);
  sub_22910A928();
  return sub_2290F58B0((uint64_t)v22, &qword_255A277F8);
}

uint64_t sub_2291006F0(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void (*v5)(void *, unint64_t, void *);
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v4 = a2;
  v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v6 = v4;
    v4 = (void *)sub_22910A418();
    v8 = v7;

  }
  else
  {
    swift_retain();
    v8 = 0xF000000000000000;
  }
  v9 = a3;
  v5(v4, v8, a3);

  sub_229102298((uint64_t)v4, v8);
  return swift_release();
}

id sub_229100784()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  objc_class *v15;
  _QWORD v17[3];
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;
  uint64_t v23;

  v1 = sub_22910A9D0();
  v20 = *(_QWORD *)(v1 - 8);
  v21 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v19 = (char *)v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_22910A9C4();
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_22910A880();
  MEMORY[0x24BDAC7A8](v4);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A277B8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = &v0[OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration__deviceActivityData];
  v23 = MEMORY[0x24BEE4AF8];
  v10 = MEMORY[0x24BEE4AF8];
  v11 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_255A27650);
  sub_22910A73C();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  *(_QWORD *)&v11[OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection] = 0;
  v18 = OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connectionQueue;
  v17[2] = sub_229102688();
  sub_22910A874();
  v23 = v10;
  v17[1] = sub_2290F873C((unint64_t *)&unk_255A27BC0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  v17[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_255A27828);
  sub_229102B94((unint64_t *)&unk_255A27BD0, &qword_255A27828, MEMORY[0x24BEE12C8]);
  sub_22910AA3C();
  v12 = *MEMORY[0x24BEE5750];
  v13 = v19;
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 104);
  v14(v19, v12, v21);
  *(_QWORD *)&v11[v18] = sub_22910AA00();
  *(_QWORD *)&v11[OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_updateTask] = 0;
  v20 = OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_updateTaskQueue;
  sub_22910A874();
  v23 = MEMORY[0x24BEE4AF8];
  sub_22910AA3C();
  v14(v13, v12, v21);
  *(_QWORD *)&v11[v20] = sub_22910AA00();

  v15 = (objc_class *)_s18SceneConfigurationCMa();
  v22.receiver = v11;
  v22.super_class = v15;
  return objc_msgSendSuper2(&v22, sel_init);
}

id sub_229100ADC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)_s18SceneConfigurationCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_229100B94()
{
  return _s18SceneConfigurationCMa();
}

void sub_229100B9C()
{
  unint64_t v0;

  sub_229100C24();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_229100C24()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255A27648)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_255A27650);
    v0 = sub_22910A76C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255A27648);
  }
}

uint64_t sub_229100C7C()
{
  return MEMORY[0x24BDC7A50];
}

uint64_t sub_229100C88()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_229100C90()
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

_QWORD *sub_229100D0C(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *a2;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(_QWORD *)(v5 + 64) > 0x18)
  {
    *a1 = v7;
    a1 = (_QWORD *)(v7 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v10 = a2[1];
    *a1 = v7;
    a1[1] = v10;
    v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_229100DD0(uint64_t a1, uint64_t a2)
{
  swift_release();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_QWORD *sub_229100E14(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  swift_retain();
  v10(v8, v9, v5);
  return a1;
}

_QWORD *sub_229100E84(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

_OWORD *sub_229100EF4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_OWORD *sub_229100F44(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;

  *a1 = *a2;
  swift_release();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

uint64_t sub_229100FAC(_QWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v13;
  int v14;
  uint64_t v15;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_22;
  v9 = ((v7 + 16) & ~v7) + *(_QWORD *)(v4 + 64);
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(_WORD *)((char *)a1 + v9))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_22:
      if ((v5 & 0x80000000) != 0)
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v7 + 16) & ~v7);
      v15 = *a1;
      if (*a1 >= 0xFFFFFFFFuLL)
        LODWORD(v15) = -1;
      return (v15 + 1);
    }
  }
  v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((_BYTE *)a1 + v9))
    goto LABEL_22;
LABEL_15:
  v14 = (v11 - 1) << v10;
  if (v9 > 3)
    v14 = 0;
  if (!(_DWORD)v9)
    return v6 + v14 + 1;
  if (v9 > 3)
    LODWORD(v9) = 4;
  return ((uint64_t (*)(void))((char *)&loc_229101080 + 4 * byte_22910B330[(v9 - 1)]))();
}

void sub_2291010F0(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v10 = ((a3 - v6 + ~(-1 << (8 * v7))) >> (8 * v7)) + 1;
      if (HIWORD(v10))
      {
        v8 = 4u;
      }
      else if (v10 >= 0x100)
      {
        v8 = 2;
      }
      else
      {
        v8 = v10 > 1;
      }
    }
    else
    {
      v8 = 1u;
    }
  }
  else
  {
    v8 = 0;
  }
  if (v6 < a2)
  {
    v9 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v11 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v11;
          *((_BYTE *)a1 + 2) = BYTE2(v11);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v11;
        }
        else
        {
          *(_BYTE *)a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v9;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t _s5SceneVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s5SceneVMn);
}

uint64_t sub_2291012F4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2291012FC()
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

uint64_t *sub_229101374(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v9 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v10 = *v11;
    v12 = (void *)v11[1];
    v10[1] = v12;
    v13 = (_QWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
    v14 = (_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
    *v13 = *v14;
    v13[1] = v14[1];
    v15 = v12;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_229101464(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();

  swift_release();
  return swift_release();
}

uint64_t sub_2291014BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  id v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = (void *)v8[1];
  v7[1] = v9;
  v10 = (_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v10 = *v11;
  v10[1] = v11[1];
  v12 = v9;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_229101554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = (void *)v8[1];
  v10 = (void *)v7[1];
  v7[1] = v9;
  v11 = v9;

  v12 = (_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  v13 = (_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v12 = *v13;
  swift_retain();
  swift_release();
  v12[1] = v13[1];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_229101604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_OWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_229101670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = (void *)v7[1];
  v7[1] = v8[1];

  v10 = (_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_QWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v10 = *v11;
  swift_release();
  v10[1] = v11[1];
  swift_release();
  return a1;
}

uint64_t sub_22910170C(uint64_t a1, unsigned int a2, uint64_t a3)
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
      v12 = *(_QWORD *)(((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) + 8);
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
    if (((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
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
    return ((uint64_t (*)(void))((char *)&loc_229101790 + 4 * byte_22910B33E[v10]))();
  }
}

void sub_229101814(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
    v9 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
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
  if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_229101910()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x229101988);
}

void sub_229101918(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x229101920);
  JUMPOUT(0x229101988);
}

void sub_229101964()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x229101988);
}

void sub_22910196C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x229101988);
}

uint64_t sub_229101974(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0x7FFFFFFF)
  {
    if (a2 < 0)
      JUMPOUT(0x229101980);
    *(_QWORD *)(((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) = (a2 - 1);
LABEL_6:
    JUMPOUT(0x229101988);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t sub_2291019A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2291019D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  _s18SceneConfigurationCMa();
  result = sub_22910A730();
  *a1 = result;
  return result;
}

uint64_t sub_229101A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v9;

  v9[8] = a7;
  v9[9] = a8;
  v9[6] = a5;
  v9[7] = a6;
  v9[4] = a3;
  v9[5] = a4;
  v9[2] = a1;
  v9[3] = a2;
  v9[10] = *v8;
  return swift_task_switch();
}

uint64_t sub_229101A40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  _QWORD *v9;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v6 = *(_QWORD *)(v0 + 24);
  v7 = swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v7;
  v8 = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v7 + 16) = v1;
  *(_QWORD *)(v7 + 24) = v6;
  *(_QWORD *)(v7 + 32) = v5;
  *(_QWORD *)(v7 + 40) = v4;
  *(_OWORD *)(v7 + 48) = v8;
  *(_QWORD *)(v7 + 64) = v3;
  *(_QWORD *)(v7 + 72) = v2;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A277F8);
  *v9 = v0;
  v9[1] = sub_229101B18;
  return sub_22910AB50();
}

uint64_t sub_229101B18()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_229101B68()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_229101B74()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_229101B80(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E2C25B8](&unk_22910B470);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_229101BAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_229101BE0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22910A784();
  *a1 = result & 1;
  return result;
}

uint64_t sub_229101C0C()
{
  return sub_22910A790();
}

uint64_t sub_229101C30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = _s9SceneViewVMa(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = v4 + ((v7 + 32) & ~v7);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v8, v5);

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_229101CD4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)(v4 + 16);
  v7 = *(_QWORD *)(v4 + 24);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(_s9SceneViewVMa(0, v6, v7, a4) - 8) + 80);
  return sub_2290FE19C(a1, v4 + ((v8 + 32) & ~v8), v6, v7);
}

uint64_t sub_229101D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(v4 + 32);
  v6 = _s9SceneViewVMa(0, v5, *(_QWORD *)(v4 + 40), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = (v7 + 48) & ~v7;
  swift_unknownObjectRelease();
  v9 = v4 + v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v9, v5);

  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_229101DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v7 = v4[4];
  v8 = v4[5];
  v9 = *(_QWORD *)(_s9SceneViewVMa(0, v7, v8, a4) - 8);
  v10 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = v4[2];
  v12 = v4[3];
  v13 = (uint64_t)v4 + v10;
  v14 = *(_QWORD *)((char *)v4 + ((*(_QWORD *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFF8));
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v15;
  *v15 = v5;
  v15[1] = sub_229102BE0;
  return sub_2290FE4F0(a1, v11, v12, v13, v14, v7, v8);
}

uint64_t sub_229101EB4()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_229101EE0()
{
  uint64_t v0;

  return sub_2290FF530(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_229101EE8()
{
  return swift_deallocObject();
}

uint64_t sub_229101EF8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_229101F30@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_22910A754();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_229101FAC(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v3 = v2;
  return sub_22910A760();
}

uint64_t sub_229102020(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_229102084;
  return v6(a1);
}

uint64_t sub_229102084()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2291020D0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2291020F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2290FDD04;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255A277E8 + dword_255A277E8))(a1, v4);
}

void sub_229102164()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  __break(1u);
}

void sub_22910217C(uint64_t a1)
{
  uint64_t *v1;

  sub_2290FFD58(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9]);
}

uint64_t sub_2291021AC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_2290FEAF0(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_2291021C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A27800);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_22910223C(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255A27800) - 8) + 80);
  return sub_2290FFFD0(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), v3 + ((v7 + 32) & ~v7));
}

uint64_t sub_229102298(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2290F569C(a1, a2);
  return a1;
}

uint64_t sub_2291022AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A277F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2291022F4(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A27840);
  v10 = *(_QWORD *)(sub_22910A544() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_22910AA90();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_22910A544() - 8);
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
    sub_2291026C4(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_2291024FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A277F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_229102544()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_229102568()
{
  uint64_t v0;

  return sub_2290FF0FC(v0);
}

uint64_t sub_229102570()
{
  uint64_t v0;

  return sub_2290FF308(v0);
}

uint64_t sub_229102578()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2291025A4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v4 = *(id *)(v1 + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection);
  *(_QWORD *)(v1 + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection) = v2;
  v3 = v2;

}

uint64_t sub_2291025DC()
{
  return swift_deallocObject();
}

uint64_t sub_2291025EC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_229102614()
{
  return swift_deallocObject();
}

void sub_229102624()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 24);
  if (*(_BYTE *)(v0 + 16) == 1)
    objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection), sel_invalidate);
  v2 = *(void **)(v1 + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection);
  *(_QWORD *)(v1 + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection) = 0;

}

uint64_t sub_229102670()
{
  return swift_deallocObject();
}

unint64_t sub_229102688()
{
  unint64_t result;

  result = qword_255A27820;
  if (!qword_255A27820)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255A27820);
  }
  return result;
}

uint64_t sub_2291026C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_22910A544() - 8);
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
  result = sub_22910AAA8();
  __break(1u);
  return result;
}

uint64_t sub_2291027DC(uint64_t a1, uint64_t a2, void *a3, const void *a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[16];
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD aBlock[7];

  v8 = sub_22910A868();
  v22 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_22910A880();
  v11 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a4;
  sub_22910A3AC();
  swift_allocObject();
  _Block_copy(a4);
  v24 = sub_22910A3A0();
  v25 = a2;
  v26 = a3;
  v15 = sub_2290FF8C0((void (*)(_QWORD))sub_229102AE0, (uint64_t)v23, a1);
  swift_release();
  sub_229102688();
  v16 = (void *)sub_22910A9DC();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = v15;
  v17[4] = sub_229102AD8;
  v17[5] = v14;
  aBlock[4] = sub_229102B30;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_229102E04;
  aBlock[3] = &block_descriptor_97;
  v18 = _Block_copy(aBlock);
  v19 = a3;
  swift_retain();
  swift_release();
  sub_22910A874();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_2290F873C((unint64_t *)&unk_255A27BE0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A27830);
  sub_229102B94((unint64_t *)&unk_255A27BF0, &qword_255A27830, MEMORY[0x24BEE12C8]);
  sub_22910AA3C();
  MEMORY[0x22E2C2090](0, v13, v10, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v21);
  return swift_release();
}

uint64_t sub_229102AB4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_229102AD8(uint64_t a1)
{
  uint64_t v1;

  sub_2290FFD0C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_229102AE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2290FF5AC(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), a1);
}

uint64_t sub_229102AFC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_229102B30()
{
  uint64_t v0;

  return sub_2290FFB40(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t (**)(_QWORD))(v0 + 32));
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22E2C254C](a1, v6, a5);
}

uint64_t sub_229102B68()
{
  return sub_229102B94((unint64_t *)&unk_255A27860, &qword_255A277C0, MEMORY[0x24BDEDA68]);
}

uint64_t sub_229102B94(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E2C25B8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_229102BD4(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t DeviceActivityFilter.SegmentInterval.rawValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t, uint64_t);
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  _QWORD v14[2];

  v1 = v0;
  v2 = sub_22910A598();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v14 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)v14 - v7, v1, v2);
  v10 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v8, v2);
  v11 = 0;
  if (v10 == *MEMORY[0x24BDC72C0])
    goto LABEL_6;
  if (v10 == *MEMORY[0x24BDC72B8])
  {
    v11 = 1;
LABEL_6:
    (*(void (**)(char *, uint64_t))(v3 + 96))(v8, v2);
    v12 = sub_22910A3E8();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v8, v12);
    return v11;
  }
  if (v10 == *MEMORY[0x24BDC72C8])
  {
    v11 = 2;
    goto LABEL_6;
  }
  v9(v6, v1, v2);
  v14[0] = 0;
  v14[1] = 0xE000000000000000;
  sub_22910AA60();
  sub_22910A8D4();
  sub_22910AA84();
  result = sub_22910AA9C();
  __break(1u);
  return result;
}

uint64_t sub_229102E04(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t DeviceActivityFilter.SegmentInterval.init(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  switch(a1)
  {
    case 2:
      v7 = sub_22910A3E8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a3, a2, v7);
      v6 = (unsigned int *)MEMORY[0x24BDC72C8];
      goto LABEL_7;
    case 1:
      v5 = sub_22910A3E8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a3, a2, v5);
      v6 = (unsigned int *)MEMORY[0x24BDC72B8];
LABEL_7:
      v9 = *v6;
      v10 = sub_22910A598();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 104))(a3, v9, v10);
    case 0:
      v8 = sub_22910A3E8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a3, a2, v8);
      v6 = (unsigned int *)MEMORY[0x24BDC72C0];
      goto LABEL_7;
  }
  sub_22910AA60();
  swift_bridgeObjectRelease();
  sub_22910AB44();
  sub_22910A8D4();
  swift_bridgeObjectRelease();
  result = sub_22910AA9C();
  __break(1u);
  return result;
}

uint64_t DeviceActivityReport.ClientConfiguration.context.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DeviceActivityReport.ClientConfiguration.segment.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t DeviceActivityReport.ClientConfiguration.interval.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for DeviceActivityReport.ClientConfiguration() + 24);
  v4 = sub_22910A3E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for DeviceActivityReport.ClientConfiguration()
{
  uint64_t result;

  result = qword_255A279C0;
  if (!qword_255A279C0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t DeviceActivityReport.ClientConfiguration.users.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for DeviceActivityReport.ClientConfiguration() + 28));
}

uint64_t DeviceActivityReport.ClientConfiguration.models.getter()
{
  type metadata accessor for DeviceActivityReport.ClientConfiguration();
  return swift_bridgeObjectRetain();
}

uint64_t DeviceActivityReport.ClientConfiguration.applications.getter()
{
  type metadata accessor for DeviceActivityReport.ClientConfiguration();
  return swift_bridgeObjectRetain();
}

uint64_t DeviceActivityReport.ClientConfiguration.categories.getter()
{
  type metadata accessor for DeviceActivityReport.ClientConfiguration();
  return swift_bridgeObjectRetain();
}

uint64_t DeviceActivityReport.ClientConfiguration.webDomains.getter()
{
  type metadata accessor for DeviceActivityReport.ClientConfiguration();
  return swift_bridgeObjectRetain();
}

uint64_t DeviceActivityReport.ClientConfiguration.userAltDSID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for DeviceActivityReport.ClientConfiguration() + 48));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DeviceActivityReport.ClientConfiguration.deviceIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for DeviceActivityReport.ClientConfiguration() + 52));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DeviceActivityReport.ClientConfiguration.bundleIdentifiers.getter()
{
  type metadata accessor for DeviceActivityReport.ClientConfiguration();
  return swift_bridgeObjectRetain();
}

uint64_t DeviceActivityReport.ClientConfiguration.categoryIdentifiers.getter()
{
  type metadata accessor for DeviceActivityReport.ClientConfiguration();
  return swift_bridgeObjectRetain();
}

uint64_t DeviceActivityReport.ClientConfiguration.domains.getter()
{
  type metadata accessor for DeviceActivityReport.ClientConfiguration();
  return swift_bridgeObjectRetain();
}

uint64_t DeviceActivityReport.ClientConfiguration.extensionIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for DeviceActivityReport.ClientConfiguration() + 68));
  swift_bridgeObjectRetain();
  return v1;
}

void DeviceActivityReport.ClientConfiguration.filter.getter(uint64_t a1@<X8>)
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
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
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
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
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
  int64_t v74;
  int64_t v75;
  uint64_t v76;
  int64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int64_t v90;
  int64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  int64_t v95;
  unint64_t v96;
  int64_t v97;
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
  unint64_t v110;
  int64_t v111;
  __int128 v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  char *v116;
  uint64_t v117;
  void (*v118)(uint64_t, uint64_t);
  uint64_t v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  int64_t v123;
  char *v124;
  unint64_t v125;
  int64_t v126;
  uint64_t v127;
  int *v128;
  uint64_t v129;
  NSObject *v130;
  os_log_type_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  int64_t v141;
  __int128 v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  unint64_t v146;
  char *v147;
  int64_t v148;
  unint64_t v149;
  int64_t v150;
  int64_t v151;
  uint64_t v152;
  uint64_t v153;
  int *v154;
  uint64_t v155;
  NSObject *v156;
  os_log_type_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  char *v161;
  int64_t v162;
  char *v163;
  uint64_t v164;
  void (*v165)(uint64_t, uint64_t);
  uint64_t v166;
  char *v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;
  char *v175;
  uint64_t v176;
  char *v177;
  uint64_t v178;
  char *v179;
  char *v180;
  uint64_t v181;
  char *v182;
  char *v183;
  char *v184;
  uint64_t v185;
  char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  char **v190;
  uint64_t v191;
  uint64_t v192;
  char *v193;
  int *v194;
  char *v195;
  uint64_t v196;
  char *v197;
  char *v198;
  uint64_t v199;
  __int128 v200;
  __int128 v201;
  int64_t v202;
  int64_t v203;
  int64_t v204;

  v2 = v1;
  v187 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A27870);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v186 = (char *)&v170 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v175 = (char *)&v170 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A27878);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v180 = (char *)&v170 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v177 = (char *)&v170 - v10;
  v178 = sub_22910A4C0();
  v185 = *(_QWORD *)(v178 - 8);
  v11 = MEMORY[0x24BDAC7A8](v178);
  v179 = (char *)&v170 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v182 = (char *)&v170 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v181 = (uint64_t)&v170 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v184 = (char *)&v170 - v17;
  v173 = sub_22910A61C();
  v172 = *(_QWORD *)(v173 - 8);
  MEMORY[0x24BDAC7A8](v173);
  v174 = (char *)&v170 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_22910A5F8();
  MEMORY[0x24BDAC7A8](v19);
  v183 = (char *)&v170 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v188 = sub_22910A700();
  v199 = *(_QWORD *)(v188 - 8);
  v21 = MEMORY[0x24BDAC7A8](v188);
  v198 = (char *)&v170 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v197 = (char *)&v170 - v23;
  v189 = sub_22910A6DC();
  *(_QWORD *)&v201 = *(_QWORD *)(v189 - 8);
  v24 = MEMORY[0x24BDAC7A8](v189);
  *(_QWORD *)&v200 = (char *)&v170 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v170 - v26;
  v28 = sub_22910A6B8();
  v202 = *(_QWORD *)(v28 - 8);
  v203 = v28;
  v29 = MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)&v170 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)&v170 - v32;
  v34 = sub_22910A3E8();
  v191 = *(_QWORD *)(v34 - 8);
  v192 = v34;
  MEMORY[0x24BDAC7A8](v34);
  v193 = (char *)&v170 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = sub_22910A598();
  v37 = MEMORY[0x24BDAC7A8](v36);
  v39 = (char *)&v170 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = MEMORY[0x24BDAC7A8](v37);
  v176 = (uint64_t)&v170 - v41;
  v42 = MEMORY[0x24BDAC7A8](v40);
  v44 = (char *)&v170 - v43;
  MEMORY[0x24BDAC7A8](v42);
  v196 = (uint64_t)&v170 - v45;
  v46 = type metadata accessor for DeviceActivityReport.ClientConfiguration();
  v47 = MEMORY[0x24BDAC7A8](v46);
  v195 = (char *)&v170 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = MEMORY[0x24BDAC7A8](v47);
  v194 = (int *)((char *)&v170 - v50);
  v51 = MEMORY[0x24BDAC7A8](v49);
  v53 = (char *)&v170 - v52;
  v54 = MEMORY[0x24BDAC7A8](v51);
  v56 = (char *)&v170 - v55;
  v57 = *(int *)(v54 + 48);
  v58 = v2;
  v190 = (char **)(v2 + v57);
  v59 = *(_QWORD *)(v2 + v57 + 8);
  v60 = v58;
  sub_229104634(v58, (uint64_t)&v170 - v55);
  if (!v59)
  {
    v170 = v39;
    v61 = (uint64_t)v186;
    v171 = v44;
    v62 = *(_QWORD *)&v56[*(int *)(v46 + 52) + 8];
    swift_bridgeObjectRetain();
    sub_2290F54CC((uint64_t)v56);
    swift_bridgeObjectRelease();
    sub_229104634(v60, (uint64_t)v53);
    if (v62)
      goto LABEL_4;
    v98 = *(_QWORD *)(*(_QWORD *)&v53[*(int *)(v46 + 56)] + 16);
    sub_2290F54CC((uint64_t)v53);
    v63 = (uint64_t)v194;
    sub_229104634(v60, (uint64_t)v194);
    v64 = (uint64_t)v195;
    if (v98)
      goto LABEL_5;
    v99 = *(_QWORD *)(*(_QWORD *)(v63 + *(int *)(v46 + 60)) + 16);
    sub_2290F54CC(v63);
    sub_229104634(v60, v64);
    if (v99)
      goto LABEL_6;
    v100 = *(_QWORD *)(*(_QWORD *)(v64 + *(int *)(v46 + 64)) + 16);
    sub_2290F54CC(v64);
    if (v100)
      goto LABEL_7;
    v74 = *(_QWORD *)(v60 + *(int *)(v46 + 32));
    if ((*(_BYTE *)(v60 + *(int *)(v46 + 28) + 8) & 1) == 0)
      goto LABEL_119;
    v101 = v173;
    v102 = v172;
    v103 = v61;
    v104 = (uint64_t)v170;
    if (!v74)
    {
LABEL_151:
      v168 = *(_QWORD *)(v60 + 16);
      v169 = (uint64_t)v193;
      (*(void (**)(char *, uint64_t, uint64_t))(v191 + 16))(v193, v60 + *(int *)(v46 + 24), v192);
      DeviceActivityFilter.SegmentInterval.init(_:_:)(v168, v169, v104);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v102 + 56))(v103, 1, 1, v101);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_153:
      sub_22910A658();
      return;
    }
    v105 = *(_QWORD *)(v60 + 16);
    v106 = (uint64_t)v193;
    (*(void (**)(char *, uint64_t, uint64_t))(v191 + 16))(v193, v60 + *(int *)(v46 + 24), v192);
    DeviceActivityFilter.SegmentInterval.init(_:_:)(v105, v106, v176);
    v204 = MEMORY[0x24BEE4B08];
    v107 = *(_QWORD *)(v74 + 56);
    v202 = v74 + 56;
    v108 = 1 << *(_BYTE *)(v74 + 32);
    v109 = -1;
    if (v108 < 64)
      v109 = ~(-1 << v108);
    v110 = v109 & v107;
    v203 = (unint64_t)(v108 + 63) >> 6;
    swift_bridgeObjectRetain();
    v111 = 0;
    *(_QWORD *)&v112 = 134349056;
    v201 = v112;
    v113 = v178;
    v114 = v185;
    v115 = v179;
    if (v110)
      goto LABEL_90;
LABEL_91:
    v123 = v111 + 1;
    if (__OFADD__(v111, 1))
      goto LABEL_158;
    v124 = v175;
    if (v123 < v203)
    {
      v125 = *(_QWORD *)(v202 + 8 * v123);
      ++v111;
      if (v125)
        goto LABEL_108;
      v111 = v123 + 1;
      if (v123 + 1 >= v203)
        goto LABEL_152;
      v125 = *(_QWORD *)(v202 + 8 * v111);
      if (v125)
        goto LABEL_108;
      v111 = v123 + 2;
      if (v123 + 2 >= v203)
        goto LABEL_152;
      v125 = *(_QWORD *)(v202 + 8 * v111);
      if (v125)
        goto LABEL_108;
      v111 = v123 + 3;
      if (v123 + 3 >= v203)
        goto LABEL_152;
      v125 = *(_QWORD *)(v202 + 8 * v111);
      if (v125)
        goto LABEL_108;
      v111 = v123 + 4;
      if (v123 + 4 >= v203)
        goto LABEL_152;
      v125 = *(_QWORD *)(v202 + 8 * v111);
      if (v125)
      {
LABEL_108:
        v110 = (v125 - 1) & v125;
        v121 = __clz(__rbit64(v125)) + (v111 << 6);
        v122 = (uint64_t)v180;
        v115 = v179;
        while (1)
        {
          v127 = *(_QWORD *)(*(_QWORD *)(v74 + 48) + 8 * v121);
          sub_22910A4A8();
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v114 + 48))(v122, 1, v113) == 1)
          {
            v128 = (int *)v46;
            sub_2291070B4(v122);
            if (qword_255A27500 != -1)
              swift_once();
            v129 = sub_22910A724();
            __swift_project_value_buffer(v129, (uint64_t)qword_255A28890);
            v130 = sub_22910A70C();
            v131 = sub_22910A9A0();
            if (os_log_type_enabled(v130, v131))
            {
              v132 = v60;
              v133 = swift_slowAlloc();
              *(_DWORD *)v133 = v201;
              *(_QWORD *)(v133 + 4) = v127;
              _os_log_impl(&dword_2290F1000, v130, v131, "Invalid device model: %{public}ld", (uint8_t *)v133, 0xCu);
              v134 = v133;
              v60 = v132;
              v113 = v178;
              MEMORY[0x22E2C2648](v134, -1, -1);
            }

            v46 = (uint64_t)v128;
            v114 = v185;
            if (!v110)
              goto LABEL_91;
          }
          else
          {
            (*(void (**)(char *, uint64_t, uint64_t))(v114 + 32))(v115, v122, v113);
            v116 = v182;
            (*(void (**)(char *, char *, uint64_t))(v114 + 16))(v182, v115, v113);
            v117 = v181;
            sub_2290F62C8(v181, v116);
            v118 = *(void (**)(uint64_t, uint64_t))(v114 + 8);
            v119 = v117;
            v115 = v179;
            v118(v119, v113);
            v118((uint64_t)v115, v113);
            if (!v110)
              goto LABEL_91;
          }
LABEL_90:
          v120 = __clz(__rbit64(v110));
          v110 &= v110 - 1;
          v121 = v120 | (v111 << 6);
          v122 = (uint64_t)v180;
        }
      }
      v126 = v123 + 5;
      if (v126 < v203)
      {
        v125 = *(_QWORD *)(v202 + 8 * v126);
        if (v125)
        {
          v111 = v126;
          goto LABEL_108;
        }
        while (1)
        {
          v111 = v126 + 1;
          if (__OFADD__(v126, 1))
            goto LABEL_160;
          if (v111 >= v203)
            break;
          v125 = *(_QWORD *)(v202 + 8 * v111);
          ++v126;
          if (v125)
            goto LABEL_108;
        }
      }
    }
LABEL_152:
    swift_release();
    sub_22910A628();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v172 + 56))(v124, 0, 1, v173);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_153;
  }
  sub_2290F54CC((uint64_t)v56);
  sub_229104634(v60, (uint64_t)v53);
LABEL_4:
  sub_2290F54CC((uint64_t)v53);
  v63 = (uint64_t)v194;
  sub_229104634(v60, (uint64_t)v194);
  v64 = (uint64_t)v195;
LABEL_5:
  sub_2290F54CC(v63);
  sub_229104634(v60, v64);
LABEL_6:
  sub_2290F54CC(v64);
LABEL_7:
  v65 = *(_QWORD *)(v60 + 16);
  v66 = (uint64_t)v193;
  (*(void (**)(char *, uint64_t, uint64_t))(v191 + 16))(v193, v60 + *(int *)(v46 + 24), v192);
  DeviceActivityFilter.SegmentInterval.init(_:_:)(v65, v66, v196);
  v67 = (uint64_t)v190[1];
  v193 = *v190;
  v194 = (int *)v46;
  v68 = *(int *)(v46 + 56);
  v69 = v60 + *(int *)(v46 + 52);
  v70 = *(_QWORD *)(v69 + 8);
  v190 = *(char ***)v69;
  v195 = (char *)v60;
  v71 = *(_QWORD *)(v60 + v68);
  v204 = MEMORY[0x24BEE4B08];
  v46 = v71 + 56;
  v72 = 1 << *(_BYTE *)(v71 + 32);
  v73 = -1;
  if (v72 < 64)
    v73 = ~(-1 << v72);
  v61 = v73 & *(_QWORD *)(v71 + 56);
  v74 = (unint64_t)(v72 + 63) >> 6;
  swift_bridgeObjectRetain_n();
  v192 = v67;
  swift_bridgeObjectRetain();
  v191 = v70;
  swift_bridgeObjectRetain();
  v60 = 0;
  while (1)
  {
    if (v61)
    {
      v61 &= v61 - 1;
      goto LABEL_11;
    }
    v75 = v60 + 1;
    if (__OFADD__(v60, 1))
      break;
    if (v75 >= v74)
      goto LABEL_31;
    v76 = *(_QWORD *)(v46 + 8 * v75);
    ++v60;
    if (!v76)
    {
      v60 = v75 + 1;
      if (v75 + 1 >= v74)
        goto LABEL_31;
      v76 = *(_QWORD *)(v46 + 8 * v60);
      if (!v76)
      {
        v60 = v75 + 2;
        if (v75 + 2 >= v74)
          goto LABEL_31;
        v76 = *(_QWORD *)(v46 + 8 * v60);
        if (!v76)
        {
          v60 = v75 + 3;
          if (v75 + 3 >= v74)
            goto LABEL_31;
          v76 = *(_QWORD *)(v46 + 8 * v60);
          if (!v76)
          {
            v60 = v75 + 4;
            if (v75 + 4 >= v74)
              goto LABEL_31;
            v76 = *(_QWORD *)(v46 + 8 * v60);
            if (!v76)
            {
              v77 = v75 + 5;
              if (v77 >= v74)
                goto LABEL_31;
              v76 = *(_QWORD *)(v46 + 8 * v77);
              if (!v76)
              {
                while (1)
                {
                  v60 = v77 + 1;
                  if (__OFADD__(v77, 1))
                  {
                    __break(1u);
                    goto LABEL_156;
                  }
                  if (v60 >= v74)
                    break;
                  v76 = *(_QWORD *)(v46 + 8 * v60);
                  ++v77;
                  if (v76)
                    goto LABEL_30;
                }
LABEL_31:
                swift_release();
                swift_bridgeObjectRelease();
                v203 = v204;
                v78 = *(_QWORD *)&v195[v194[15]];
                v204 = MEMORY[0x24BEE4B08];
                v79 = v78 + 56;
                v80 = 1 << *(_BYTE *)(v78 + 32);
                v81 = -1;
                if (v80 < 64)
                  v81 = ~(-1 << v80);
                v61 = v81 & *(_QWORD *)(v78 + 56);
                v82 = (unint64_t)(v80 + 63) >> 6;
                swift_bridgeObjectRetain_n();
                v46 = 0;
                v74 = v189;
                v60 = v200;
                while (1)
                {
                  if (v61)
                  {
                    v61 &= v61 - 1;
                  }
                  else
                  {
                    v83 = v46 + 1;
                    if (__OFADD__(v46, 1))
                      goto LABEL_117;
                    if (v83 >= v82)
                    {
LABEL_55:
                      swift_release();
                      swift_bridgeObjectRelease();
                      v202 = v204;
                      v86 = *(_QWORD *)&v195[v194[16]];
                      v204 = MEMORY[0x24BEE4B08];
                      v87 = v86 + 56;
                      v88 = 1 << *(_BYTE *)(v86 + 32);
                      v89 = -1;
                      if (v88 < 64)
                        v89 = ~(-1 << v88);
                      v46 = v89 & *(_QWORD *)(v86 + 56);
                      v90 = (unint64_t)(v88 + 63) >> 6;
                      swift_bridgeObjectRetain_n();
                      v91 = 0;
                      v60 = v188;
                      v92 = (uint64_t)v197;
                      v74 = (int64_t)v198;
                      while (1)
                      {
                        if (v46)
                        {
                          v93 = __clz(__rbit64(v46));
                          v46 &= v46 - 1;
                          v94 = v93 | (v91 << 6);
                        }
                        else
                        {
                          v95 = v91 + 1;
                          if (__OFADD__(v91, 1))
                            goto LABEL_118;
                          if (v95 >= v90)
                          {
LABEL_79:
                            swift_release();
                            swift_bridgeObjectRelease();
                            sub_22910A640();
                            return;
                          }
                          v96 = *(_QWORD *)(v87 + 8 * v95);
                          ++v91;
                          if (!v96)
                          {
                            v91 = v95 + 1;
                            if (v95 + 1 >= v90)
                              goto LABEL_79;
                            v96 = *(_QWORD *)(v87 + 8 * v91);
                            if (!v96)
                            {
                              v91 = v95 + 2;
                              if (v95 + 2 >= v90)
                                goto LABEL_79;
                              v96 = *(_QWORD *)(v87 + 8 * v91);
                              if (!v96)
                              {
                                v91 = v95 + 3;
                                if (v95 + 3 >= v90)
                                  goto LABEL_79;
                                v96 = *(_QWORD *)(v87 + 8 * v91);
                                if (!v96)
                                {
                                  v91 = v95 + 4;
                                  if (v95 + 4 >= v90)
                                    goto LABEL_79;
                                  v96 = *(_QWORD *)(v87 + 8 * v91);
                                  if (!v96)
                                  {
                                    v97 = v95 + 5;
                                    if (v97 >= v90)
                                      goto LABEL_79;
                                    v96 = *(_QWORD *)(v87 + 8 * v97);
                                    if (!v96)
                                    {
                                      while (1)
                                      {
                                        v91 = v97 + 1;
                                        if (__OFADD__(v97, 1))
                                          break;
                                        if (v91 >= v90)
                                          goto LABEL_79;
                                        v96 = *(_QWORD *)(v87 + 8 * v91);
                                        ++v97;
                                        if (v96)
                                          goto LABEL_78;
                                      }
LABEL_157:
                                      __break(1u);
LABEL_158:
                                      __break(1u);
LABEL_159:
                                      __break(1u);
LABEL_160:
                                      __break(1u);
                                      goto LABEL_161;
                                    }
                                    v91 = v97;
                                  }
                                }
                              }
                            }
                          }
LABEL_78:
                          v46 = (v96 - 1) & v96;
                          v94 = __clz(__rbit64(v96)) + (v91 << 6);
                        }
                        v61 = *(_QWORD *)(*(_QWORD *)(v86 + 48) + 16 * v94 + 8);
                        swift_bridgeObjectRetain_n();
                        sub_22910A6E8();
                        sub_2290F5BB4(v92, (char *)v74);
                        (*(void (**)(uint64_t, uint64_t))(v199 + 8))(v92, v60);
                        swift_bridgeObjectRelease();
                      }
                    }
                    v84 = *(_QWORD *)(v79 + 8 * v83);
                    ++v46;
                    if (!v84)
                    {
                      v46 = v83 + 1;
                      if (v83 + 1 >= v82)
                        goto LABEL_55;
                      v84 = *(_QWORD *)(v79 + 8 * v46);
                      if (!v84)
                      {
                        v46 = v83 + 2;
                        if (v83 + 2 >= v82)
                          goto LABEL_55;
                        v84 = *(_QWORD *)(v79 + 8 * v46);
                        if (!v84)
                        {
                          v46 = v83 + 3;
                          if (v83 + 3 >= v82)
                            goto LABEL_55;
                          v84 = *(_QWORD *)(v79 + 8 * v46);
                          if (!v84)
                          {
                            v46 = v83 + 4;
                            if (v83 + 4 >= v82)
                              goto LABEL_55;
                            v84 = *(_QWORD *)(v79 + 8 * v46);
                            if (!v84)
                            {
                              v85 = v83 + 5;
                              if (v85 >= v82)
                                goto LABEL_55;
                              v84 = *(_QWORD *)(v79 + 8 * v85);
                              if (!v84)
                              {
                                while (1)
                                {
                                  v46 = v85 + 1;
                                  if (__OFADD__(v85, 1))
                                    break;
                                  if (v46 >= v82)
                                    goto LABEL_55;
                                  v84 = *(_QWORD *)(v79 + 8 * v46);
                                  ++v85;
                                  if (v84)
                                    goto LABEL_54;
                                }
LABEL_156:
                                __break(1u);
                                goto LABEL_157;
                              }
                              v46 = v85;
                            }
                          }
                        }
                      }
                    }
LABEL_54:
                    v61 = (v84 - 1) & v84;
                  }
                  swift_bridgeObjectRetain_n();
                  sub_22910A6C4();
                  sub_2290F5E10((uint64_t)v27, (char *)v60);
                  (*(void (**)(char *, int64_t))(v201 + 8))(v27, v74);
                  swift_bridgeObjectRelease();
                }
              }
              v60 = v77;
            }
          }
        }
      }
    }
LABEL_30:
    v61 = (v76 - 1) & v76;
LABEL_11:
    swift_bridgeObjectRetain_n();
    sub_22910A6A0();
    sub_2290F606C((uint64_t)v33, v31);
    (*(void (**)(char *, int64_t))(v202 + 8))(v33, v203);
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_117:
  __break(1u);
LABEL_118:
  __break(1u);
LABEL_119:
  v101 = v173;
  v102 = v172;
  v103 = v61;
  v104 = (uint64_t)v170;
  if (!v74)
    goto LABEL_151;
  v135 = *(_QWORD *)(v60 + 16);
  v136 = (uint64_t)v193;
  (*(void (**)(char *, uint64_t, uint64_t))(v191 + 16))(v193, v60 + *(int *)(v46 + 24), v192);
  DeviceActivityFilter.SegmentInterval.init(_:_:)(v135, v136, (uint64_t)v171);
  sub_22910A5E0();
  v204 = MEMORY[0x24BEE4B08];
  v137 = *(_QWORD *)(v74 + 56);
  *(_QWORD *)&v201 = v74 + 56;
  v138 = 1 << *(_BYTE *)(v74 + 32);
  v139 = -1;
  if (v138 < 64)
    v139 = ~(-1 << v138);
  v140 = v139 & v137;
  v202 = (unint64_t)(v138 + 63) >> 6;
  swift_bridgeObjectRetain();
  v141 = 0;
  *(_QWORD *)&v142 = 134349056;
  v200 = v142;
  v143 = v178;
  v144 = (uint64_t)v177;
  while (2)
  {
    if (v140)
    {
      v145 = __clz(__rbit64(v140));
      v140 &= v140 - 1;
      v203 = v141;
      v146 = v145 | (v141 << 6);
      v147 = v184;
LABEL_145:
      v152 = *(_QWORD *)(*(_QWORD *)(v74 + 48) + 8 * v146);
      sub_22910A4A8();
      v153 = v185;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v185 + 48))(v144, 1, v143) == 1)
      {
        v154 = (int *)v46;
        sub_2291070B4(v144);
        if (qword_255A27500 != -1)
          swift_once();
        v155 = sub_22910A724();
        __swift_project_value_buffer(v155, (uint64_t)qword_255A28890);
        v156 = sub_22910A70C();
        v157 = sub_22910A9A0();
        if (os_log_type_enabled(v156, v157))
        {
          v158 = v60;
          v159 = swift_slowAlloc();
          *(_DWORD *)v159 = v200;
          *(_QWORD *)(v159 + 4) = v152;
          _os_log_impl(&dword_2290F1000, v156, v157, "Invalid device model: %{public}ld", (uint8_t *)v159, 0xCu);
          v160 = v159;
          v60 = v158;
          v143 = v178;
          MEMORY[0x22E2C2648](v160, -1, -1);
        }

        v46 = (uint64_t)v154;
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v153 + 32))(v147, v144, v143);
        v161 = v182;
        (*(void (**)(char *, char *, uint64_t))(v153 + 16))(v182, v147, v143);
        v162 = v74;
        v163 = v147;
        v164 = v181;
        sub_2290F62C8(v181, v161);
        v165 = *(void (**)(uint64_t, uint64_t))(v153 + 8);
        v166 = v164;
        v144 = (uint64_t)v177;
        v165(v166, v143);
        v167 = v163;
        v74 = v162;
        v165((uint64_t)v167, v143);
      }
      v141 = v203;
      continue;
    }
    break;
  }
  v148 = v141 + 1;
  v147 = v184;
  if (__OFADD__(v141, 1))
    goto LABEL_159;
  if (v148 >= v202)
  {
LABEL_154:
    swift_release();
    sub_22910A628();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_22910A64C();
    return;
  }
  v149 = *(_QWORD *)(v201 + 8 * v148);
  v150 = v141 + 1;
  if (v149)
    goto LABEL_144;
  v150 = v141 + 2;
  if (v141 + 2 >= v202)
    goto LABEL_154;
  v149 = *(_QWORD *)(v201 + 8 * v150);
  if (v149)
    goto LABEL_144;
  v150 = v141 + 3;
  if (v141 + 3 >= v202)
    goto LABEL_154;
  v149 = *(_QWORD *)(v201 + 8 * v150);
  if (v149)
    goto LABEL_144;
  v150 = v141 + 4;
  if (v141 + 4 >= v202)
    goto LABEL_154;
  v149 = *(_QWORD *)(v201 + 8 * v150);
  if (v149)
    goto LABEL_144;
  v150 = v141 + 5;
  if (v141 + 5 >= v202)
    goto LABEL_154;
  v149 = *(_QWORD *)(v201 + 8 * v150);
  if (v149)
  {
LABEL_144:
    v140 = (v149 - 1) & v149;
    v203 = v150;
    v146 = __clz(__rbit64(v149)) + (v150 << 6);
    goto LABEL_145;
  }
  v151 = v141 + 6;
  if (v141 + 6 >= v202)
    goto LABEL_154;
  v149 = *(_QWORD *)(v201 + 8 * v151);
  if (v149)
  {
    v150 = v141 + 6;
    goto LABEL_144;
  }
  while (1)
  {
    v150 = v151 + 1;
    if (__OFADD__(v151, 1))
      break;
    if (v150 >= v202)
      goto LABEL_154;
    v149 = *(_QWORD *)(v201 + 8 * v150);
    ++v151;
    if (v149)
      goto LABEL_144;
  }
LABEL_161:
  __break(1u);
}

uint64_t sub_229104634(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DeviceActivityReport.ClientConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_229104678(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2291046B4 + 4 * byte_22910B610[a1]))(0xD000000000000010, 0x800000022910C420);
}

uint64_t sub_2291046B4()
{
  return 0x747865746E6F63;
}

uint64_t sub_2291046CC()
{
  return 0x746E656D676573;
}

uint64_t sub_2291046E4()
{
  return 0x6C61767265746E69;
}

uint64_t sub_2291046FC()
{
  return 0x7372657375;
}

uint64_t sub_229104710()
{
  return 0x736C65646F6DLL;
}

uint64_t sub_229104724()
{
  return 0x746163696C707061;
}

uint64_t sub_229104744()
{
  return 0x69726F6765746163;
}

uint64_t sub_229104760()
{
  return 0x69616D6F44626577;
}

uint64_t sub_229104780()
{
  return 0x44746C4172657375;
}

uint64_t sub_2291047A0()
{
  uint64_t v0;

  return v0 - 2;
}

unint64_t sub_2291047B8()
{
  return 0xD000000000000013;
}

BOOL sub_2291047F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22910480C()
{
  sub_22910AB80();
  sub_22910AB8C();
  return sub_22910AB98();
}

uint64_t sub_229104850()
{
  return sub_22910AB8C();
}

uint64_t sub_229104878()
{
  sub_22910AB80();
  sub_22910AB8C();
  return sub_22910AB98();
}

uint64_t sub_2291048B8()
{
  unsigned __int8 *v0;

  return sub_229104678(*v0);
}

uint64_t sub_2291048C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2291083D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2291048E4()
{
  return 0;
}

void sub_2291048F0(_BYTE *a1@<X8>)
{
  *a1 = 14;
}

uint64_t sub_2291048FC()
{
  sub_229107118();
  return sub_22910ABBC();
}

uint64_t sub_229104924()
{
  sub_229107118();
  return sub_22910ABC8();
}

uint64_t DeviceActivityReport.ClientConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A27880);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_229107118();
  sub_22910ABB0();
  LOBYTE(v14) = 0;
  sub_22910AB20();
  if (v2)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  LOBYTE(v14) = 1;
  sub_22910AB2C();
  v9 = (int *)type metadata accessor for DeviceActivityReport.ClientConfiguration();
  LOBYTE(v14) = 2;
  sub_22910A3E8();
  sub_2290F873C(&qword_255A27890, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB888]);
  sub_22910AB38();
  LOBYTE(v14) = 3;
  sub_22910AB08();
  v14 = *(_QWORD *)(v3 + v9[8]);
  v13 = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A27898);
  sub_229107444(&qword_255A278A0, &qword_255A27898, MEMORY[0x24BEE1770], MEMORY[0x24BEE1700]);
  sub_22910AB14();
  v14 = *(_QWORD *)(v3 + v9[9]);
  v13 = 5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A278A8);
  sub_22910715C();
  sub_22910AB38();
  v14 = *(_QWORD *)(v3 + v9[10]);
  v13 = 6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A278C8);
  sub_2291071D8();
  sub_22910AB38();
  v14 = *(_QWORD *)(v3 + v9[11]);
  v13 = 7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A278E8);
  sub_229107254();
  sub_22910AB38();
  LOBYTE(v14) = 8;
  sub_22910AAFC();
  LOBYTE(v14) = 9;
  sub_22910AAFC();
  v12 = v6;
  v14 = *(_QWORD *)(v3 + v9[14]);
  v13 = 10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A27908);
  sub_229107444(&qword_255A27910, &qword_255A27908, MEMORY[0x24BEE0D08], MEMORY[0x24BEE1700]);
  sub_22910AB38();
  v14 = *(_QWORD *)(v3 + v9[15]);
  v13 = 11;
  sub_22910AB38();
  v14 = *(_QWORD *)(v3 + v9[16]);
  v13 = 12;
  sub_22910AB38();
  LOBYTE(v14) = 13;
  sub_22910AAFC();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v8, v5);
}

uint64_t DeviceActivityReport.ClientConfiguration.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  int *v38;
  char v39;
  uint64_t v40;

  v5 = sub_22910A3E8();
  v35 = *(_QWORD *)(v5 - 8);
  v36 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A27918);
  v8 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = (int *)type metadata accessor for DeviceActivityReport.ClientConfiguration();
  MEMORY[0x24BDAC7A8](v38);
  v12 = (uint64_t *)((char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = a1[3];
  v37 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_229107118();
  sub_22910ABA4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
  v32 = a2;
  v33 = v8;
  LOBYTE(v40) = 0;
  *v12 = sub_22910AAD8();
  v12[1] = v14;
  LOBYTE(v40) = 1;
  v15 = sub_22910AAE4();
  v16 = v38;
  v12[2] = v15;
  LOBYTE(v40) = 2;
  sub_2290F873C(&qword_255A27920, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB8A8]);
  v17 = v36;
  sub_22910AAF0();
  (*(void (**)(char *, char *, uint64_t))(v35 + 32))((char *)v12 + v16[6], v7, v17);
  LOBYTE(v40) = 3;
  v18 = sub_22910AAC0();
  v19 = (char *)v12 + v16[7];
  *(_QWORD *)v19 = v18;
  v19[8] = v20 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A27898);
  v39 = 4;
  sub_229107444(&qword_255A27928, &qword_255A27898, MEMORY[0x24BEE1798], MEMORY[0x24BEE1720]);
  sub_22910AACC();
  *(uint64_t *)((char *)v12 + v16[8]) = v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A278A8);
  v39 = 5;
  sub_2291072D0();
  sub_22910AAF0();
  *(uint64_t *)((char *)v12 + v16[9]) = v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A278C8);
  v39 = 6;
  sub_22910734C();
  sub_22910AAF0();
  *(uint64_t *)((char *)v12 + v16[10]) = v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A278E8);
  v39 = 7;
  sub_2291073C8();
  sub_22910AAF0();
  *(uint64_t *)((char *)v12 + v16[11]) = v40;
  LOBYTE(v40) = 8;
  v21 = sub_22910AAB4();
  v22 = (uint64_t *)((char *)v12 + v16[12]);
  *v22 = v21;
  v22[1] = v23;
  LOBYTE(v40) = 9;
  v24 = sub_22910AAB4();
  v25 = (uint64_t *)((char *)v12 + v38[13]);
  *v25 = v24;
  v25[1] = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A27908);
  v39 = 10;
  sub_229107444(&qword_255A27960, &qword_255A27908, MEMORY[0x24BEE0D38], MEMORY[0x24BEE1720]);
  sub_22910AAF0();
  *(uint64_t *)((char *)v12 + v38[14]) = v40;
  v39 = 11;
  sub_22910AAF0();
  *(uint64_t *)((char *)v12 + v38[15]) = v40;
  v39 = 12;
  sub_22910AAF0();
  *(uint64_t *)((char *)v12 + v38[16]) = v40;
  LOBYTE(v40) = 13;
  v27 = sub_22910AAB4();
  v29 = v28;
  (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v34);
  v30 = (uint64_t *)((char *)v12 + v38[17]);
  *v30 = v27;
  v30[1] = v29;
  sub_229104634((uint64_t)v12, v32);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
  return sub_2290F54CC((uint64_t)v12);
}

uint64_t sub_229105638@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return DeviceActivityReport.ClientConfiguration.init(from:)(a1, a2);
}

uint64_t sub_22910564C(_QWORD *a1)
{
  return DeviceActivityReport.ClientConfiguration.encode(to:)(a1);
}

void sub_229105660(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4 >> 60 != 15)
    _s15ServiceHostViewV11CoordinatorCMa();
  __break(1u);
}

void sub_2291056E4()
{
  _s15ServiceHostViewVMa();
}

id sub_22910571C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  id result;
  _QWORD *v5;

  MEMORY[0x22E2C25B8](&unk_22910B7F8, a1);
  sub_22910A808();
  sub_22910A7FC();
  v3 = sub_2291057AC(v5, v2, v1);

  objc_opt_self();
  result = (id)swift_dynamicCastObjCClass();
  if (!result)
  {

    return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7BA8]), sel_init);
  }
  return result;
}

id sub_2291057AC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  id v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void (*v15)(id, void (*)(uint64_t), _QWORD *, uint64_t, uint64_t);
  id v16;

  v5 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *a1);
  v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 24);
  v8 = swift_unknownObjectRetain();
  v7(v8, a2, a3);
  v9 = objc_allocWithZone(MEMORY[0x24BDC79E8]);
  v10 = (void *)sub_22910A8A4();
  v11 = objc_msgSend(v9, sel_initWithExtensionPointIdentifier_, v10);

  v12 = v5[11];
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v5[10];
  v13[3] = v12;
  v13[4] = v5[12];
  v14 = v5[13];
  v13[5] = v14;
  v13[6] = v6;
  v13[7] = a3;
  v15 = *(void (**)(id, void (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v14 + 24);
  v16 = v6;
  v15(v11, sub_229108CE8, v13, v12, v14);

  swift_release();
  return v16;
}

void sub_2291058F4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t AssociatedTypeWitness;
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
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t v33;
  void *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD aBlock[7];

  v48 = a3;
  v49 = a7;
  v47 = a5;
  v50 = a2;
  v10 = sub_22910A868();
  v56 = *(_QWORD *)(v10 - 8);
  v57 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v55 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_22910A880();
  v53 = *(_QWORD *)(v12 - 8);
  v54 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v52 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v15 = sub_22910AA0C();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v45 - v18;
  v20 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v21 = MEMORY[0x24BDAC7A8](v17);
  v23 = (char *)&v45 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v51 = (char *)&v45 - v24;
  aBlock[0] = a1;
  v25 = sub_22910A904();
  MEMORY[0x22E2C25B8](MEMORY[0x24BEE12E0], v25);
  sub_22910A994();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v19, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
    if (qword_255A27500 != -1)
      swift_once();
    v26 = sub_22910A724();
    __swift_project_value_buffer(v26, (uint64_t)qword_255A28890);
    v27 = sub_22910A70C();
    v28 = sub_22910A9AC();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_2290F1000, v27, v28, "Failed to find the report service extension.", v29, 2u);
      MEMORY[0x22E2C2648](v29, -1, -1);
    }

  }
  else
  {
    v30 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    v31 = v20;
    v46 = v20;
    v32 = v51;
    v30(v51, v19, AssociatedTypeWitness);
    v33 = swift_allocBox();
    (*(void (**)(uint64_t, uint64_t))(a6 + 24))(a4, a6);
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v23, v32, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t, uint64_t))(a6 + 40))(v23, a4, a6);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(a6 + 64))(1, a4, a6);
    sub_229102688();
    v34 = (void *)sub_22910A9DC();
    v35 = (_QWORD *)swift_allocObject();
    v36 = v47;
    v35[2] = a4;
    v35[3] = v36;
    v37 = v49;
    v38 = v50;
    v35[4] = a6;
    v35[5] = v37;
    v39 = v48;
    v35[6] = v38;
    v35[7] = v39;
    v45 = v33;
    v35[8] = v33;
    aBlock[4] = sub_229108D24;
    aBlock[5] = v35;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_229102E04;
    aBlock[3] = &block_descriptor_7;
    v40 = _Block_copy(aBlock);
    v41 = v38;
    swift_retain();
    swift_release();
    v42 = v52;
    sub_22910A874();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_2290F873C((unint64_t *)&unk_255A27BE0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A27830);
    sub_229102B94((unint64_t *)&unk_255A27BF0, &qword_255A27830, MEMORY[0x24BEE12C8]);
    v43 = v55;
    v44 = v57;
    sub_22910AA3C();
    MEMORY[0x22E2C2090](0, v42, v43, v40);
    _Block_release(v40);

    (*(void (**)(char *, uint64_t))(v56 + 8))(v43, v44);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v42, v54);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v32, AssociatedTypeWitness);
    swift_release();
  }
}

uint64_t sub_229105DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t ObjectType;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13[5];

  v9 = swift_projectBox();
  ObjectType = swift_getObjectType();
  swift_beginAccess();
  v13[3] = a4;
  v13[4] = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(boxed_opaque_existential_1, v9, a4);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a2 + 48))(v13, ObjectType, a2);
}

void sub_229105E44()
{
  sub_2291056E4();
}

void sub_229105E78()
{
  sub_229108BF8();
}

void sub_229105EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_229105660(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_229105ED8(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t sub_229105EE8()
{
  return sub_22910A7B4();
}

uint64_t sub_229105F20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2C25B8](&unk_22910B7F8, a3);
  return sub_22910A7F0();
}

uint64_t sub_229105F7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2C25B8](&unk_22910B7F8, a3);
  return sub_22910A7C0();
}

void sub_229105FD8(uint64_t a1)
{
  MEMORY[0x22E2C25B8](&unk_22910B7F8, a1);
  sub_22910A7E4();
  __break(1u);
}

void sub_229106008()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v1 = sub_229106158();
  if (v1)
  {
    v2 = (void *)v1;
    v3 = v0 + qword_255A27A28;
    v4 = *(_QWORD *)(v0 + qword_255A27A28);
    v5 = *(_QWORD *)(v3 + 8);
    sub_2290F551C(v4, v5);
    v6 = (void *)sub_22910A40C();
    sub_2290F569C(v4, v5);
    v8[4] = sub_2291060E4;
    v8[5] = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1107296256;
    v8[2] = sub_2291060F0;
    v8[3] = &block_descriptor_0;
    v7 = _Block_copy(v8);
    objc_msgSend(v2, sel_updateClientConfiguration::, v6, v7);
    _Block_release(v7);
    swift_unknownObjectRelease();

  }
}

void sub_2291060E4(void *a1)
{
  sub_229106CC4(a1, "Failed to update the client's configuration: %{public}s");
}

void sub_2291060F0(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_229106144(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + qword_255A27A30);
  *(_QWORD *)(v1 + qword_255A27A30) = a1;

}

uint64_t sub_229106158()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A27808);
  sub_22910A9E8();
  return v1;
}

uint64_t sub_2291061C0@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[6];

  v3 = *(void **)(result + qword_255A27A30);
  if (!v3)
    goto LABEL_3;
  v7[4] = sub_2291062C8;
  v7[5] = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_2290FEDD4;
  v7[3] = &block_descriptor_48;
  v4 = _Block_copy(v7);
  v5 = v3;
  v6 = objc_msgSend(v5, sel_remoteObjectProxyWithErrorHandler_, v4);
  _Block_release(v4);

  sub_22910AA30();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A27C00);
  result = swift_dynamicCast();
  if ((result & 1) == 0)
LABEL_3:
    *a2 = 0;
  return result;
}

void sub_2291062C8(void *a1)
{
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *oslog;
  uint64_t v9;

  if (qword_255A27500 != -1)
    swift_once();
  v2 = sub_22910A724();
  __swift_project_value_buffer(v2, (uint64_t)qword_255A28890);
  MEMORY[0x22E2C251C](a1);
  MEMORY[0x22E2C251C](a1);
  oslog = sub_22910A70C();
  v3 = sub_22910A9A0();
  if (os_log_type_enabled(oslog, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136446210;
    MEMORY[0x22E2C251C](a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A27810);
    v6 = sub_22910A8BC();
    sub_2290F4B9C(v6, v7, &v9);
    sub_22910AA18();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2290F1000, oslog, v3, "Failed to create service proxy for service host coordinator: %{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2C2648](v5, -1, -1);
    MEMORY[0x22E2C2648](v4, -1, -1);

  }
  else
  {

  }
}

void sub_2291064A4(uint64_t a1)
{
  sub_22910655C(a1, (uint64_t)&off_24F1D24F0);
}

void sub_2291064B0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_2291064A4((uint64_t)v4);

}

void sub_229106504(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a1;
  v8 = a4;
  sub_229108F18();

}

void sub_22910655C(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  void *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char *v26;
  id v27;
  uint64_t v28;
  void *v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t aBlock;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD *v44;

  v3 = v2;
  v5 = *(_QWORD *)v2;
  v6 = *MEMORY[0x24BEE4EA0];
  ObjectType = swift_getObjectType();
  v8 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 64))(ObjectType, a2);
  v9 = (_QWORD *)(v6 & v5);
  v10 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_255A299E0);
  objc_msgSend(v8, sel_setRemoteObjectInterface_, v10);

  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = (_QWORD *)swift_allocObject();
  v13 = v9[10];
  v12[2] = v13;
  v14 = v9[11];
  v12[3] = v14;
  v15 = v9[12];
  v12[4] = v15;
  v16 = v9[13];
  v12[5] = v16;
  v12[6] = v11;
  v43 = sub_229108E44;
  v44 = v12;
  v17 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v40 = 1107296256;
  v41 = sub_229102E04;
  v42 = &block_descriptor_25;
  v18 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v8, sel_setInterruptionHandler_, v18);
  _Block_release(v18);
  v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = v13;
  v20[3] = v14;
  v20[4] = v15;
  v20[5] = v16;
  v20[6] = v19;
  v43 = sub_229108E54;
  v44 = v20;
  aBlock = v17;
  v40 = 1107296256;
  v41 = sub_229102E04;
  v42 = &block_descriptor_32;
  v21 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v8, sel_setInvalidationHandler_, v21);
  _Block_release(v21);
  objc_msgSend(v8, sel_activate);
  v22 = *(NSObject **)&v3[qword_255A27A38];
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v3;
  *(_QWORD *)(v23 + 24) = v8;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = sub_229108EB8;
  *(_QWORD *)(v24 + 24) = v23;
  v43 = sub_229108F4C;
  v44 = (_QWORD *)v24;
  aBlock = v17;
  v40 = 1107296256;
  v41 = sub_2290FF510;
  v42 = &block_descriptor_42;
  v25 = _Block_copy(&aBlock);
  v26 = v3;
  v27 = v8;
  swift_retain();
  swift_release();
  dispatch_sync(v22, v25);

  _Block_release(v25);
  LOBYTE(v27) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v27 & 1) != 0)
  {
    __break(1u);
LABEL_9:
    swift_once();
    goto LABEL_5;
  }
  v28 = sub_229106158();
  if (v28)
  {
    v29 = (void *)v28;
    v30 = &v26[qword_255A27A28];
    v31 = *(_QWORD *)&v26[qword_255A27A28];
    v32 = *((_QWORD *)v30 + 1);
    sub_2290F551C(v31, v32);
    v33 = (void *)sub_22910A40C();
    sub_2290F569C(v31, v32);
    v43 = sub_229106CB8;
    v44 = 0;
    aBlock = v17;
    v40 = 1107296256;
    v41 = sub_2291060F0;
    v42 = &block_descriptor_45;
    v34 = _Block_copy(&aBlock);
    objc_msgSend(v29, sel_discoverClientExtensionWithConfiguration::, v33, v34);
    _Block_release(v34);
    swift_release();
    swift_unknownObjectRelease();

    return;
  }
  if (qword_255A27500 != -1)
    goto LABEL_9;
LABEL_5:
  v35 = sub_22910A724();
  __swift_project_value_buffer(v35, (uint64_t)qword_255A28890);
  v36 = sub_22910A70C();
  v37 = sub_22910A9B8();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v38 = 0;
    _os_log_impl(&dword_2290F1000, v36, v37, "Can't discover the client's extension without a valid XPC proxy", v38, 2u);
    MEMORY[0x22E2C2648](v38, -1, -1);
  }
  swift_release();

}

void sub_229106BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const char *a6, char a7)
{
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  void *v15;

  v9 = a1 + 16;
  if (qword_255A27500 != -1)
    swift_once();
  v10 = sub_22910A724();
  __swift_project_value_buffer(v10, (uint64_t)qword_255A28890);
  v11 = sub_22910A70C();
  v12 = sub_22910A9B8();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2290F1000, v11, v12, a6, v13, 2u);
    MEMORY[0x22E2C2648](v13, -1, -1);
  }

  swift_beginAccess();
  v14 = MEMORY[0x22E2C26C0](v9);
  if (v14)
  {
    v15 = (void *)v14;
    sub_229106EC4(a7 & 1);

  }
}

void sub_229106CB8(void *a1)
{
  sub_229106CC4(a1, "Failed to discover the client's extension: %{public}s");
}

void sub_229106CC4(void *a1, const char *a2)
{
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *oslog;
  uint64_t v11;

  if (a1)
  {
    MEMORY[0x22E2C251C]();
    if (qword_255A27500 != -1)
      swift_once();
    v4 = sub_22910A724();
    __swift_project_value_buffer(v4, (uint64_t)qword_255A28890);
    MEMORY[0x22E2C251C](a1);
    MEMORY[0x22E2C251C](a1);
    oslog = sub_22910A70C();
    v5 = sub_22910A9A0();
    if (os_log_type_enabled(oslog, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v11 = v7;
      *(_DWORD *)v6 = 136446210;
      MEMORY[0x22E2C251C](a1);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A27810);
      v8 = sub_22910A8BC();
      sub_2290F4B9C(v8, v9, &v11);
      sub_22910AA18();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2290F1000, oslog, v5, a2, v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E2C2648](v7, -1, -1);
      MEMORY[0x22E2C2648](v6, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_229106EC4(char a1)
{
  char *v1;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v10[6];

  v3 = *(NSObject **)&v1[qword_255A27A38];
  v4 = swift_allocObject();
  *(_BYTE *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = v1;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_229108D98;
  *(_QWORD *)(v5 + 24) = v4;
  v10[4] = sub_229108DF4;
  v10[5] = v5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_2290FF510;
  v10[3] = &block_descriptor_16;
  v6 = _Block_copy(v10);
  v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

void sub_229106FF4()
{
  sub_229108F20();
}

void sub_229107014()
{
  _s15ServiceHostViewV11CoordinatorCMa();
}

id sub_229107048(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 16) = v1;
  *(_QWORD *)(v2 - 8) = a1;
  return objc_msgSendSuper2((objc_super *)(v2 - 16), sel_dealloc);
}

void sub_229107068(uint64_t a1)
{
  sub_2290F569C(*(_QWORD *)(a1 + qword_255A27A28), *(_QWORD *)(a1 + qword_255A27A28 + 8));

}

uint64_t sub_2291070B4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A27878);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_229107118()
{
  unint64_t result;

  result = qword_255A27888;
  if (!qword_255A27888)
  {
    result = MEMORY[0x22E2C25B8](&unk_22910B928, &_s19ClientConfigurationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255A27888);
  }
  return result;
}

unint64_t sub_22910715C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255A278B0;
  if (!qword_255A278B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A278A8);
    v2 = sub_229102B94(&qword_255A278B8, &qword_255A278C0, MEMORY[0x24BDDAEC8]);
    result = MEMORY[0x22E2C25B8](MEMORY[0x24BEE1700], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255A278B0);
  }
  return result;
}

unint64_t sub_2291071D8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255A278D0;
  if (!qword_255A278D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A278C8);
    v2 = sub_229102B94(&qword_255A278D8, &qword_255A278E0, MEMORY[0x24BDDAEC8]);
    result = MEMORY[0x22E2C25B8](MEMORY[0x24BEE1700], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255A278D0);
  }
  return result;
}

unint64_t sub_229107254()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255A278F0;
  if (!qword_255A278F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A278E8);
    v2 = sub_229102B94(&qword_255A278F8, &qword_255A27900, MEMORY[0x24BDDAEC8]);
    result = MEMORY[0x22E2C25B8](MEMORY[0x24BEE1700], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255A278F0);
  }
  return result;
}

unint64_t sub_2291072D0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255A27930;
  if (!qword_255A27930)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A278A8);
    v2 = sub_229102B94(&qword_255A27938, &qword_255A278C0, MEMORY[0x24BDDAED0]);
    result = MEMORY[0x22E2C25B8](MEMORY[0x24BEE1720], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255A27930);
  }
  return result;
}

unint64_t sub_22910734C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255A27940;
  if (!qword_255A27940)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A278C8);
    v2 = sub_229102B94(&qword_255A27948, &qword_255A278E0, MEMORY[0x24BDDAED0]);
    result = MEMORY[0x22E2C25B8](MEMORY[0x24BEE1720], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255A27940);
  }
  return result;
}

unint64_t sub_2291073C8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255A27950;
  if (!qword_255A27950)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A278E8);
    v2 = sub_229102B94(&qword_255A27958, &qword_255A27900, MEMORY[0x24BDDAED0]);
    result = MEMORY[0x22E2C25B8](MEMORY[0x24BEE1720], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255A27950);
  }
  return result;
}

uint64_t sub_229107444(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3;
    result = MEMORY[0x22E2C25B8](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *_s19ClientConfigurationVwCP(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
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
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v32 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v32 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    v8 = a3[6];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_22910A3E8();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[7];
    v14 = a3[8];
    v15 = (char *)v4 + v13;
    v16 = (char *)a2 + v13;
    *(_QWORD *)v15 = *(_QWORD *)v16;
    v15[8] = v16[8];
    *(uint64_t *)((char *)v4 + v14) = *(uint64_t *)((char *)a2 + v14);
    v17 = a3[10];
    *(uint64_t *)((char *)v4 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)v4 + v17) = *(uint64_t *)((char *)a2 + v17);
    v18 = a3[12];
    *(uint64_t *)((char *)v4 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    v19 = (uint64_t *)((char *)v4 + v18);
    v20 = (uint64_t *)((char *)a2 + v18);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    v22 = a3[13];
    v23 = a3[14];
    v24 = (uint64_t *)((char *)v4 + v22);
    v25 = (uint64_t *)((char *)a2 + v22);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    *(uint64_t *)((char *)v4 + v23) = *(uint64_t *)((char *)a2 + v23);
    v27 = a3[16];
    *(uint64_t *)((char *)v4 + a3[15]) = *(uint64_t *)((char *)a2 + a3[15]);
    *(uint64_t *)((char *)v4 + v27) = *(uint64_t *)((char *)a2 + v27);
    v28 = a3[17];
    v29 = (uint64_t *)((char *)v4 + v28);
    v30 = (uint64_t *)((char *)a2 + v28);
    v31 = v30[1];
    *v29 = *v30;
    v29[1] = v31;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t _s19ClientConfigurationVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_22910A3E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s19ClientConfigurationVwcp(_QWORD *a1, _QWORD *a2, int *a3)
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
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_22910A3E8();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[7];
  v13 = a3[8];
  v14 = (char *)a1 + v12;
  v15 = (char *)a2 + v12;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  v14[8] = v15[8];
  *(_QWORD *)((char *)a1 + v13) = *(_QWORD *)((char *)a2 + v13);
  v16 = a3[10];
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v16) = *(_QWORD *)((char *)a2 + v16);
  v17 = a3[12];
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  v21 = a3[13];
  v22 = a3[14];
  v23 = (_QWORD *)((char *)a1 + v21);
  v24 = (_QWORD *)((char *)a2 + v21);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  *(_QWORD *)((char *)a1 + v22) = *(_QWORD *)((char *)a2 + v22);
  v26 = a3[16];
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  *(_QWORD *)((char *)a1 + v26) = *(_QWORD *)((char *)a2 + v26);
  v27 = a3[17];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s19ClientConfigurationVwca(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_22910A3E8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[7];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = v12[8];
  *(_QWORD *)v11 = *(_QWORD *)v12;
  v11[8] = v13;
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[12];
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = a3[13];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  *v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[14]) = *(_QWORD *)((char *)a2 + a3[14]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[16]) = *(_QWORD *)((char *)a2 + a3[16]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v20 = a3[17];
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  *v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s19ClientConfigurationVwtk(uint64_t a1, uint64_t a2, int *a3)
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

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_22910A3E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  v11 = a3[8];
  v12 = a1 + v10;
  v13 = a2 + v10;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  v14 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  v15 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v15) = *(_OWORD *)(a2 + v15);
  v16 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);
  v17 = a3[16];
  *(_QWORD *)(a1 + a3[15]) = *(_QWORD *)(a2 + a3[15]);
  *(_QWORD *)(a1 + v17) = *(_QWORD *)(a2 + v17);
  *(_OWORD *)(a1 + a3[17]) = *(_OWORD *)(a2 + a3[17]);
  return a1;
}

_QWORD *_s19ClientConfigurationVwta(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_22910A3E8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[7];
  v12 = a3[8];
  v13 = (char *)a1 + v11;
  v14 = (char *)a2 + v11;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  v13[8] = v14[8];
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  swift_bridgeObjectRelease();
  v15 = a3[12];
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  v19 = *v17;
  v18 = v17[1];
  *v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  v20 = a3[13];
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  v24 = *v22;
  v23 = v22[1];
  *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[14]) = *(_QWORD *)((char *)a2 + a3[14]);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[16]) = *(_QWORD *)((char *)a2 + a3[16]);
  swift_bridgeObjectRelease();
  v25 = a3[17];
  v26 = (_QWORD *)((char *)a1 + v25);
  v27 = (_QWORD *)((char *)a2 + v25);
  v29 = *v27;
  v28 = v27[1];
  *v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s19ClientConfigurationVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_229107D04(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_22910A3E8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t _s19ClientConfigurationVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_229107D8C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_22910A3E8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_229107E00()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22910A3E8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_229107EBC()
{
  return swift_initClassMetadata2();
}

void _s15ServiceHostViewV11CoordinatorCMa()
{
  JUMPOUT(0x22E2C254CLL);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s19ClientConfigurationV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF3)
    goto LABEL_17;
  if (a2 + 13 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 13) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 13;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 13;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 13;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xE;
  v8 = v6 - 14;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s19ClientConfigurationV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 13 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 13) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF2)
    return ((uint64_t (*)(void))((char *)&loc_22910800C + 4 * byte_22910B623[v4]))();
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_229108040 + 4 * byte_22910B61E[v4]))();
}

uint64_t sub_229108040(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_229108048(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x229108050);
  return result;
}

uint64_t sub_22910805C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x229108064);
  *(_BYTE *)result = a2 + 13;
  return result;
}

uint64_t sub_229108068(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_229108070(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22910807C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_229108084(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *_s19ClientConfigurationV10CodingKeysOMa()
{
  return &_s19ClientConfigurationV10CodingKeysON;
}

uint64_t sub_22910809C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2291080A4(uint64_t result)
{
  unint64_t v1;

  v1 = *(_QWORD *)(result + 24);
  if (v1 >> 60 != 15)
    return sub_2290F569C(*(_QWORD *)(result + 16), v1);
  return result;
}

uint64_t sub_2291080C0(uint64_t a1, uint64_t a2)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = (uint64_t *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v3;
  }
  else
  {
    v5 = *v3;
    sub_2290F551C(*v3, *(_QWORD *)(a2 + 24));
    *(_QWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 24) = v4;
  }
  return a1;
}

uint64_t sub_229108128(uint64_t a1, uint64_t a2)
{
  _OWORD *v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = (_OWORD *)(a1 + 16);
  v4 = (uint64_t *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 24) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      v7 = *v4;
      sub_2290F551C(*v4, *(_QWORD *)(a2 + 24));
      v8 = *(_QWORD *)(a1 + 16);
      v9 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 24) = v5;
      sub_2290F569C(v8, v9);
      return a1;
    }
    sub_2290F587C(a1 + 16);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *v3 = *(_OWORD *)v4;
    return a1;
  }
  v6 = *v4;
  sub_2290F551C(*v4, *(_QWORD *)(a2 + 24));
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v5;
  return a1;
}

uint64_t sub_2291081D4(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = (_OWORD *)(a1 + 16);
  v5 = (_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  if (v6 >> 60 != 15)
  {
    v7 = *(_QWORD *)(a2 + 24);
    if (v7 >> 60 != 15)
    {
      v8 = *(_QWORD *)(a1 + 16);
      *(_QWORD *)(a1 + 16) = *v5;
      *(_QWORD *)(a1 + 24) = v7;
      sub_2290F569C(v8, v6);
      return a1;
    }
    sub_2290F587C(a1 + 16);
  }
  *v4 = *(_OWORD *)v5;
  return a1;
}

uint64_t sub_229108254(uint64_t *a1, int a2)
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

uint64_t sub_22910829C(uint64_t result, int a2, int a3)
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

void _s15ServiceHostViewVMa()
{
  JUMPOUT(0x22E2C254CLL);
}

void sub_2291082E8()
{
  JUMPOUT(0x22E2C25B8);
}

unint64_t sub_2291082FC()
{
  unint64_t result;

  result = qword_255A27BA0;
  if (!qword_255A27BA0)
  {
    result = MEMORY[0x22E2C25B8](&unk_22910B900, &_s19ClientConfigurationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255A27BA0);
  }
  return result;
}

unint64_t sub_229108344()
{
  unint64_t result;

  result = qword_255A27BA8;
  if (!qword_255A27BA8)
  {
    result = MEMORY[0x22E2C25B8](&unk_22910B870, &_s19ClientConfigurationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255A27BA8);
  }
  return result;
}

unint64_t sub_22910838C()
{
  unint64_t result;

  result = qword_255A27BB0;
  if (!qword_255A27BB0)
  {
    result = MEMORY[0x22E2C25B8](&unk_22910B898, &_s19ClientConfigurationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255A27BB0);
  }
  return result;
}

uint64_t sub_2291083D0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x747865746E6F63 && a2 == 0xE700000000000000;
  if (v3 || (sub_22910AB5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E656D676573 && a2 == 0xE700000000000000 || (sub_22910AB5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C61767265746E69 && a2 == 0xE800000000000000 || (sub_22910AB5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7372657375 && a2 == 0xE500000000000000 || (sub_22910AB5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x736C65646F6DLL && a2 == 0xE600000000000000 || (sub_22910AB5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x746163696C707061 && a2 == 0xEC000000736E6F69 || (sub_22910AB5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x69726F6765746163 && a2 == 0xEA00000000007365 || (sub_22910AB5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x69616D6F44626577 && a2 == 0xEA0000000000736ELL || (sub_22910AB5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x44746C4172657375 && a2 == 0xEB00000000444953 || (sub_22910AB5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000022910C420 || (sub_22910AB5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000022910C440 || (sub_22910AB5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000022910C460 || (sub_22910AB5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x736E69616D6F64 && a2 == 0xE700000000000000 || (sub_22910AB5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000022910C480)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else
  {
    v6 = sub_22910AB5C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 13;
    else
      return 14;
  }
}

void sub_229108910(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;

  v17 = a1;
  v18 = a2;
  v19 = *MEMORY[0x24BEE4EA0] & *v2;
  v16 = sub_22910A9D0();
  v3 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22910A9C4();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v6);
  v8 = sub_22910A880();
  MEMORY[0x24BDAC7A8](v8);
  *(_QWORD *)((char *)v2 + qword_255A27A30) = 0;
  v15 = qword_255A27A38;
  v14 = sub_229102688();
  v9 = v2;
  sub_22910A874();
  *(_QWORD *)&v20 = MEMORY[0x24BEE4AF8];
  sub_2290F873C((unint64_t *)&unk_255A27BC0, v7, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A27828);
  sub_229102B94((unint64_t *)&unk_255A27BD0, &qword_255A27828, MEMORY[0x24BEE12C8]);
  sub_22910AA3C();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5750], v16);
  *(_QWORD *)((char *)v2 + v15) = sub_22910AA00();
  v10 = (_QWORD *)((char *)v9 + qword_255A27A28);
  v11 = v17;
  v12 = v18;
  *v10 = v17;
  v10[1] = v12;
  sub_2290F551C(v11, v12);

  v13 = *(_OWORD *)(v19 + 96);
  v20 = *(_OWORD *)(v19 + 80);
  v21 = v13;
  _s15ServiceHostViewV11CoordinatorCMa();
}

id sub_229108B28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = v1;
  *(_QWORD *)(v2 - 88) = a1;
  return objc_msgSendSuper2((objc_super *)(v2 - 96), sel_init);
}

void sub_229108B5C()
{
  _s15ServiceHostViewV11CoordinatorCMa();
}

void sub_229108B8C(objc_class *a1)
{
  unint64_t v1;
  uint64_t v2;
  id v3;

  v3 = objc_allocWithZone(a1);
  sub_229108910(v2, v1);
}

void sub_229108BB4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;

  v3 = (uint64_t *)(v2 + qword_255A27A28);
  v4 = *(_QWORD *)(v2 + qword_255A27A28);
  v5 = *(_QWORD *)(v2 + qword_255A27A28 + 8);
  *v3 = a1;
  v3[1] = a2;
  sub_2290F551C(a1, a2);
  sub_2290F569C(v4, v5);
  sub_229106008();
}

void sub_229108BF8()
{
  _s15ServiceHostViewVMa();
}

void sub_229108C30(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  void *v3;

  MEMORY[0x22E2C25B8](&unk_22910B7F8, a1);
  sub_22910A808();
  sub_22910A7FC();
  if (v1 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    sub_2290F5508(v2, v1);
    sub_229108BB4(v2, v1);
    sub_229102298(v2, v1);

  }
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

uint64_t sub_229108CC4()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_229108CE8(uint64_t a1)
{
  uint64_t v1;

  sub_2291058F4(a1, *(void **)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_229108CF8()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_229108D24()
{
  uint64_t *v0;

  return sub_229105DA0(v0[6], v0[7], v0[8], v0[2], v0[3], v0[4]);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
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

uint64_t sub_229108D74()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_229108D98()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 24);
  if (*(_BYTE *)(v0 + 16) == 1)
    objc_msgSend(*(id *)(v1 + qword_255A27A30), sel_invalidate);
  v2 = *(void **)(v1 + qword_255A27A30);
  *(_QWORD *)(v1 + qword_255A27A30) = 0;

}

uint64_t sub_229108DE4()
{
  return swift_deallocObject();
}

uint64_t sub_229108DF4()
{
  uint64_t v0;

  return sub_2290F4AB4(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_229108DFC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_229108E20()
{
  swift_release();
  return swift_deallocObject();
}

void sub_229108E44()
{
  sub_229108E64("The app's connection to our view service was interrupted.", 1);
}

void sub_229108E54()
{
  sub_229108E64("The app's connection to our view service was invalidated.", 0);
}

void sub_229108E64(const char *a1, char a2)
{
  uint64_t *v2;

  sub_229106BA4(v2[6], v2[2], v2[3], v2[4], v2[5], a1, a2);
}

uint64_t sub_229108E8C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_229108EB8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v4 = *(id *)(v1 + qword_255A27A30);
  *(_QWORD *)(v1 + qword_255A27A30) = v2;
  v3 = v2;

}

uint64_t sub_229108EF0()
{
  return swift_deallocObject();
}

uint64_t sub_229108F00@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_2291061C0(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_229108F18()
{
  return sub_229106EC4(1);
}

void sub_229108F20()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

_QWORD *DeviceActivityData.activitySegments.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  __int128 v27;

  v26 = a1;
  v1 = sub_22910A598();
  v24 = *(_QWORD *)(v1 - 8);
  v25 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_22910A694();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22910A4CC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_22910A520();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22910A52C();
  v15 = sub_22910A514();
  v22 = v16;
  v23 = v15;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_22910A538();
  v17 = sub_22910A49C();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_22910A4FC();
  sub_22910A67C();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v3, v25);
  v20 = sub_22910A508();
  sub_22910A4F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A27C70);
  swift_allocObject();
  result = sub_229109284(v23, v22, v17, v19, (uint64_t)v6, v20, &v27);
  *v26 = result;
  return result;
}

double DeviceActivityData.ActivitySegment.categories.getter@<D0>(uint64_t *a1@<X8>)
{
  return sub_2291091B4(MEMORY[0x24BDC7210], &qword_255A27C78, a1);
}

double DeviceActivityData.CategoryActivity.applications.getter@<D0>(uint64_t *a1@<X8>)
{
  return sub_2291091B4(MEMORY[0x24BDC7188], &qword_255A27C98, a1);
}

double DeviceActivityData.CategoryActivity.webDomains.getter@<D0>(uint64_t *a1@<X8>)
{
  return sub_2291091B4(MEMORY[0x24BDC7180], &qword_255A27CA0, a1);
}

double sub_2291091B4@<D0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double result;

  v5 = a1();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = 0;
  *(_QWORD *)(v6 + 24) = v5;
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)(v6 + 48) = 0u;
  v7 = v6 + qword_255A27C80;
  v8 = sub_22910A694();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(_QWORD *)(v6 + qword_255A27C88) = 0;
  v9 = v6 + qword_255A27C90;
  *(_QWORD *)(v9 + 32) = 0;
  result = 0.0;
  *(_OWORD *)v9 = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  *a3 = v6;
  return result;
}

uint64_t DeviceActivityResults.makeAsyncIterator()()
{
  sub_229109A00();
  return swift_retain();
}

uint64_t sub_229109274()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_22910927C(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

_QWORD *sub_229109284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, __int128 *a7)
{
  _QWORD *v7;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  v7[6] = a3;
  v7[7] = a4;
  v11 = (char *)v7 + qword_255A27C80;
  v12 = sub_22910A694();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v11, a5, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  *(_QWORD *)((char *)v7 + qword_255A27C88) = a6;
  sub_229109A50(a7, (uint64_t)v7 + qword_255A27C90);
  return v7;
}

uint64_t sub_229109338(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v2[12] = a1;
  v2[13] = v1;
  v2[14] = *v1;
  v2[15] = __swift_instantiateConcreteTypeFromMangledName(&qword_255A277F8);
  v2[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A27CB0);
  v2[17] = swift_task_alloc();
  v3 = sub_22910A694();
  v2[18] = v3;
  v2[19] = *(_QWORD *)(v3 - 8);
  v2[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2291093EC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t *v3;
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
  uint64_t result;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD **)(v0 + 104);
  v2 = v1[3];
  if (v2)
  {
    v4 = v1[2];
    v3 = v1 + 2;
    v5 = *(_QWORD *)(*(_QWORD *)(v0 + 112) + 88);
    if (v4 < MEMORY[0x22E2C1F94](v2, v5))
    {
      v6 = *(_QWORD *)(v0 + 96);
      sub_22910A910();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v6, 0, 1, v5);
      v7 = *v3 + 1;
      if (!__OFADD__(*v3, 1))
        goto LABEL_19;
      __break(1u);
    }
    v1 = *(_QWORD **)(v0 + 104);
  }
  if (v1[7])
  {
    v8 = *(_QWORD *)(v0 + 144);
    v9 = *(_QWORD *)(v0 + 152);
    v10 = *(_QWORD *)(v0 + 136);
    sub_229109A0C((uint64_t)v1 + qword_255A27C80, v10, &qword_255A27CB0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v10, 1, v8) == 1)
    {
      sub_2290F58B0(*(_QWORD *)(v0 + 136), &qword_255A27CB0);
    }
    else
    {
      v11 = *(_QWORD *)(v0 + 104);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 32))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 144));
      v12 = *(_QWORD *)(v11 + qword_255A27C88);
      if (v12)
      {
        sub_229109A0C(*(_QWORD *)(v0 + 104) + qword_255A27C90, v0 + 56, qword_255A27CB8);
        if (*(_QWORD *)(v0 + 80))
        {
          v13 = *(_QWORD *)(v0 + 104);
          result = sub_229109A50((__int128 *)(v0 + 56), v0 + 16);
          v15 = *(_QWORD *)(v13 + 16);
          v16 = *(_QWORD *)(v12 + 16);
          if ((uint64_t)v15 < (uint64_t)v16)
          {
            if (v15 < v16)
            {
              *(_QWORD *)(v0 + 168) = *(_QWORD *)(v12 + 16 * v15 + 40);
              __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
              swift_bridgeObjectRetain();
              v17 = (_QWORD *)swift_task_alloc();
              *(_QWORD *)(v0 + 176) = v17;
              *v17 = v0;
              v17[1] = sub_2291096CC;
              return sub_22910A670();
            }
            goto LABEL_21;
          }
          (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
          __swift_destroy_boxed_opaque_existential_0(v0 + 16);
        }
        else
        {
          (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
          sub_2290F58B0(v0 + 56, qword_255A27CB8);
        }
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
      }
    }
  }
  v18 = *(_QWORD *)(v0 + 104);
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 112) + 88)
                                                                           - 8)
                                                               + 56))(*(_QWORD *)(v0 + 96), 1, 1);
  v19 = *(_QWORD *)(v18 + 16);
  v3 = (uint64_t *)(v18 + 16);
  v7 = v19 + 1;
  if (!__OFADD__(v19, 1))
  {
LABEL_19:
    *v3 = v7;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_2291096CC()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_229109728()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
  v4 = *(_QWORD *)(v1 + 88);
  v5 = swift_dynamicCast();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, v5 ^ 1u, 1, v4);
  result = __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  v7 = *(_QWORD *)(v2 + 16);
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  if (v8)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(v0 + 104) + 16) = v9;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t DeviceActivityResults.Iterator.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2290F58B0(v0 + qword_255A27C80, &qword_255A27CB0);
  swift_bridgeObjectRelease();
  sub_2290F58B0(v0 + qword_255A27C90, qword_255A27CB8);
  return v0;
}

uint64_t DeviceActivityResults.Iterator.__deallocating_deinit()
{
  DeviceActivityResults.Iterator.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_229109884(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_229102084;
  return sub_229109338(a1);
}

uint64_t sub_2291098D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;
  uint64_t v8;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v7;
  type metadata accessor for DeviceActivityResults.Iterator(0, *(_QWORD *)(a5 + 80), *(_QWORD *)(a5 + 88), v8);
  *v7 = v5;
  v7[1] = sub_229109970;
  return sub_22910A934();
}

uint64_t sub_229109970()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2291099C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_229109A00();
  swift_retain();
  result = swift_release();
  *a1 = v2;
  return result;
}

uint64_t sub_229109A00()
{
  uint64_t *v0;
  uint64_t result;

  result = *v0;
  *(_QWORD *)(*v0 + 16) = 0;
  return result;
}

uint64_t sub_229109A0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_229109A50(__int128 *a1, uint64_t a2)
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

uint64_t sub_229109A68()
{
  return MEMORY[0x24BEE40A8];
}

void sub_229109A74()
{
  JUMPOUT(0x22E2C25B8);
}

uint64_t sub_229109A84()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for DeviceActivityResults(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DeviceActivityResults);
}

void sub_229109A98()
{
  unint64_t v0;

  sub_229109BB4();
  if (v0 <= 0x3F)
    swift_initClassMetadata2();
}

uint64_t type metadata accessor for DeviceActivityResults.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DeviceActivityResults.Iterator);
}

uint64_t method lookup function for DeviceActivityResults.Iterator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DeviceActivityResults.Iterator.next()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 192) + *(_QWORD *)(*(_QWORD *)v1 + 192));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2290FDD04;
  return v6(a1);
}

void sub_229109BB4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255A27DD8)
  {
    sub_22910A694();
    v0 = sub_22910AA0C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255A27DD8);
  }
}

_UNKNOWN **sub_229109C08()
{
  return &protocol witness table for _EXExtensionIdentity;
}

uint64_t sub_229109C14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *ObjCClassFromMetadata;
  _QWORD v7[6];

  v7[4] = a2;
  v7[5] = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_229109CC4;
  v7[3] = &block_descriptor_1;
  v4 = _Block_copy(v7);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  swift_retain();
  objc_msgSend(ObjCClassFromMetadata, sel_executeQuery_completionHandler_, a1, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_229109CBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t sub_229109CC4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_229109D38();
  v2 = sub_22910A8EC();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_229109D38()
{
  unint64_t result;

  result = qword_255A27E00;
  if (!qword_255A27E00)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255A27E00);
  }
  return result;
}

uint64_t sub_229109D74()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*v0, sel_bundleIdentifier);
  v2 = sub_22910A8B0();

  return v2;
}

uint64_t dispatch thunk of ExtensionRepresenting.bundleIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_229109DD0()
{
  uint64_t v0;

  v0 = sub_22910A724();
  __swift_allocate_value_buffer(v0, qword_255A28890);
  __swift_project_value_buffer(v0, (uint64_t)qword_255A28890);
  return sub_22910A718();
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

uint64_t sub_229109E80(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v11[5];
  uint64_t v12;
  _BYTE v13[24];
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(v1, sel_setConfiguration_, 0);
    return sub_22910A2D0(a1);
  }
  sub_22910A310(a1, (uint64_t)v13);
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A27E60);
    sub_22910A358();
    if ((swift_dynamicCast() & 1) != 0)
    {
      objc_msgSend(v1, sel_setConfiguration_, v11[0]);

      return sub_22910A2D0(a1);
    }
  }
  else
  {
    sub_22910A2D0((uint64_t)v13);
  }
  if (qword_255A27500 != -1)
    swift_once();
  v3 = sub_22910A724();
  __swift_project_value_buffer(v3, (uint64_t)qword_255A28890);
  sub_22910A310(a1, (uint64_t)v13);
  v4 = sub_22910A70C();
  v5 = sub_22910A9AC();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v12 = v7;
    *(_DWORD *)v6 = 136446210;
    sub_22910A310((uint64_t)v13, (uint64_t)v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A27E58);
    v8 = sub_22910A8BC();
    v11[0] = (id)sub_2290F4B9C(v8, v9, &v12);
    sub_22910AA18();
    swift_bridgeObjectRelease();
    sub_22910A2D0((uint64_t)v13);
    _os_log_impl(&dword_2290F1000, v4, v5, "Unexpected hostConfiguration value: %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2C2648](v7, -1, -1);
    MEMORY[0x22E2C2648](v6, -1, -1);
  }
  else
  {
    sub_22910A2D0((uint64_t)v13);
  }

  return sub_22910A2D0(a1);
}

uint64_t sub_22910A0CC(uint64_t a1)
{
  void *v1;

  objc_msgSend(v1, sel_setDelegate_, a1);
  return swift_unknownObjectRelease();
}

id sub_22910A104()
{
  return sub_22910A118();
}

id sub_22910A118()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  v1 = objc_msgSend(v0, sel_makeXPCConnectionWithError_, v5);
  if (v1)
  {
    v2 = v5[0];
  }
  else
  {
    v3 = v5[0];
    sub_22910A400();

    swift_willThrow();
  }
  return v1;
}

id sub_22910A1CC@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  *a1 = result;
  return result;
}

void sub_22910A204(id *a1)
{
  id *v1;
  id v2;

  v2 = *a1;
  objc_msgSend(*v1, sel_setExtensionIdentity_);

}

id sub_22910A238(char a1)
{
  id *v1;

  return objc_msgSend(*v1, sel_setBeginHostingImmediately_, a1 & 1);
}

uint64_t sub_22910A250(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_22910A258(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_22910A260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_22910A268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_22910A270(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_22910A278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t sub_22910A280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t sub_22910A288(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_22910A2A0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_22910A2A8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_22910A2B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t sub_22910A2B8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_22910A2C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t sub_22910A2C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t sub_22910A2D0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A27E58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22910A310(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A27E58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_22910A358()
{
  unint64_t result;

  result = qword_255A27E68;
  if (!qword_255A27E68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255A27E68);
  }
  return result;
}

uint64_t sub_22910A394()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_22910A3A0()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_22910A3AC()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_22910A3B8()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_22910A3C4()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_22910A3D0()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_22910A3DC()
{
  return MEMORY[0x24BDCB828]();
}

uint64_t sub_22910A3E8()
{
  return MEMORY[0x24BDCB878]();
}

uint64_t sub_22910A3F4()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_22910A400()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_22910A40C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_22910A418()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_22910A424()
{
  return MEMORY[0x24BDC7A48]();
}

uint64_t sub_22910A430()
{
  return MEMORY[0x24BDC7A88]();
}

uint64_t sub_22910A43C()
{
  return MEMORY[0x24BDC7A90]();
}

uint64_t sub_22910A448()
{
  return MEMORY[0x24BDC7A98]();
}

uint64_t sub_22910A454()
{
  return MEMORY[0x24BDC7AA8]();
}

uint64_t sub_22910A460()
{
  return MEMORY[0x24BDC7090]();
}

uint64_t sub_22910A46C()
{
  return MEMORY[0x24BDC70B8]();
}

uint64_t sub_22910A478()
{
  return MEMORY[0x24BDC70C8]();
}

uint64_t sub_22910A484()
{
  return MEMORY[0x24BDC70D8]();
}

uint64_t sub_22910A490()
{
  return MEMORY[0x24BDC70E0]();
}

uint64_t sub_22910A49C()
{
  return MEMORY[0x24BDC71A0]();
}

uint64_t sub_22910A4A8()
{
  return MEMORY[0x24BDC71D8]();
}

uint64_t sub_22910A4B4()
{
  return MEMORY[0x24BDC71E0]();
}

uint64_t sub_22910A4C0()
{
  return MEMORY[0x24BDC71E8]();
}

uint64_t sub_22910A4CC()
{
  return MEMORY[0x24BDC7208]();
}

uint64_t sub_22910A4D8()
{
  return MEMORY[0x24BDC7218]();
}

uint64_t sub_22910A4E4()
{
  return MEMORY[0x24BDC7228]();
}

uint64_t sub_22910A4F0()
{
  return MEMORY[0x24BDC7230]();
}

uint64_t sub_22910A4FC()
{
  return MEMORY[0x24BDC7238]();
}

uint64_t sub_22910A508()
{
  return MEMORY[0x24BDC7240]();
}

uint64_t sub_22910A514()
{
  return MEMORY[0x24BDC7248]();
}

uint64_t sub_22910A520()
{
  return MEMORY[0x24BDC7250]();
}

uint64_t sub_22910A52C()
{
  return MEMORY[0x24BDC7258]();
}

uint64_t sub_22910A538()
{
  return MEMORY[0x24BDC7260]();
}

uint64_t sub_22910A544()
{
  return MEMORY[0x24BDC7268]();
}

uint64_t sub_22910A550()
{
  return MEMORY[0x24BDC7278]();
}

uint64_t sub_22910A55C()
{
  return MEMORY[0x24BDC7298]();
}

uint64_t sub_22910A568()
{
  return MEMORY[0x24BDC72A0]();
}

uint64_t sub_22910A574()
{
  return MEMORY[0x24BDC72A8]();
}

uint64_t sub_22910A580()
{
  return MEMORY[0x24BDC72B0]();
}

uint64_t sub_22910A58C()
{
  return MEMORY[0x24BDC72D0]();
}

uint64_t sub_22910A598()
{
  return MEMORY[0x24BDC72D8]();
}

uint64_t sub_22910A5A4()
{
  return MEMORY[0x24BDC72E0]();
}

uint64_t sub_22910A5B0()
{
  return MEMORY[0x24BDC72E8]();
}

uint64_t sub_22910A5BC()
{
  return MEMORY[0x24BDC72F0]();
}

uint64_t sub_22910A5C8()
{
  return MEMORY[0x24BDC72F8]();
}

uint64_t sub_22910A5D4()
{
  return MEMORY[0x24BDC7300]();
}

uint64_t sub_22910A5E0()
{
  return MEMORY[0x24BDC7308]();
}

uint64_t sub_22910A5EC()
{
  return MEMORY[0x24BDC7310]();
}

uint64_t sub_22910A5F8()
{
  return MEMORY[0x24BDC7318]();
}

uint64_t sub_22910A604()
{
  return MEMORY[0x24BDC7328]();
}

uint64_t sub_22910A610()
{
  return MEMORY[0x24BDC7330]();
}

uint64_t sub_22910A61C()
{
  return MEMORY[0x24BDC7338]();
}

uint64_t sub_22910A628()
{
  return MEMORY[0x24BDC7348]();
}

uint64_t sub_22910A634()
{
  return MEMORY[0x24BDC7350]();
}

uint64_t sub_22910A640()
{
  return MEMORY[0x24BDC7358]();
}

uint64_t sub_22910A64C()
{
  return MEMORY[0x24BDC7360]();
}

uint64_t sub_22910A658()
{
  return MEMORY[0x24BDC7368]();
}

uint64_t sub_22910A664()
{
  return MEMORY[0x24BDC7370]();
}

uint64_t sub_22910A670()
{
  return MEMORY[0x24BDC73A0]();
}

uint64_t sub_22910A67C()
{
  return MEMORY[0x24BDC73B0]();
}

uint64_t sub_22910A688()
{
  return MEMORY[0x24BDC73C0]();
}

uint64_t sub_22910A694()
{
  return MEMORY[0x24BDC73C8]();
}

uint64_t sub_22910A6A0()
{
  return MEMORY[0x24BDDAE48]();
}

uint64_t sub_22910A6AC()
{
  return MEMORY[0x24BDDAE50]();
}

uint64_t sub_22910A6B8()
{
  return MEMORY[0x24BDDAE58]();
}

uint64_t sub_22910A6C4()
{
  return MEMORY[0x24BDDAE78]();
}

uint64_t sub_22910A6D0()
{
  return MEMORY[0x24BDDAE88]();
}

uint64_t sub_22910A6DC()
{
  return MEMORY[0x24BDDAE90]();
}

uint64_t sub_22910A6E8()
{
  return MEMORY[0x24BDDAEE0]();
}

uint64_t sub_22910A6F4()
{
  return MEMORY[0x24BDDAEE8]();
}

uint64_t sub_22910A700()
{
  return MEMORY[0x24BDDAEF0]();
}

uint64_t sub_22910A70C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22910A718()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_22910A724()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22910A730()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_22910A73C()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_22910A748()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_22910A754()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_22910A760()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_22910A76C()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_22910A778()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_22910A784()
{
  return MEMORY[0x24BDB8348]();
}

uint64_t sub_22910A790()
{
  return MEMORY[0x24BDB8350]();
}

uint64_t sub_22910A79C()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_22910A7A8()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_22910A7B4()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_22910A7C0()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_22910A7CC()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_22910A7D8()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_22910A7E4()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_22910A7F0()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_22910A7FC()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_22910A808()
{
  return MEMORY[0x24BDF13B8]();
}

uint64_t sub_22910A814()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_22910A820()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_22910A82C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_22910A838()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_22910A844()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_22910A850()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_22910A85C()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_22910A868()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_22910A874()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_22910A880()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22910A88C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_22910A898()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22910A8A4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22910A8B0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22910A8BC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22910A8C8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22910A8D4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22910A8E0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22910A8EC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22910A8F8()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_22910A904()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_22910A910()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_22910A91C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_22910A928()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_22910A934()
{
  return MEMORY[0x24BEE6908]();
}

uint64_t sub_22910A940()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_22910A94C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_22910A958()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_22910A964()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_22910A970()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_22910A97C()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_22910A988()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_22910A994()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_22910A9A0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22910A9AC()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_22910A9B8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_22910A9C4()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_22910A9D0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_22910A9DC()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_22910A9E8()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_22910A9F4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_22910AA00()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_22910AA0C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22910AA18()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22910AA24()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22910AA30()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_22910AA3C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22910AA48()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_22910AA54()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_22910AA60()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22910AA6C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22910AA78()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22910AA84()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_22910AA90()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22910AA9C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_22910AAA8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22910AAB4()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_22910AAC0()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_22910AACC()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_22910AAD8()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_22910AAE4()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_22910AAF0()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_22910AAFC()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_22910AB08()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_22910AB14()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_22910AB20()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_22910AB2C()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_22910AB38()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_22910AB44()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22910AB50()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_22910AB5C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22910AB68()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_22910AB74()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_22910AB80()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22910AB8C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22910AB98()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22910ABA4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_22910ABB0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_22910ABBC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_22910ABC8()
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}


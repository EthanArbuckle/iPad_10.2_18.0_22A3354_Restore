unint64_t sub_2383430DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t result;
  __int16 v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  BOOL v44;
  _BOOL4 v45;
  unint64_t v46;
  unint64_t v47;
  int v48;
  int v49;
  unsigned int v50;
  unint64_t v51;
  uint64_t v52;
  BOOL v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  _OWORD *v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  BOOL v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  int64_t v101;
  uint64_t v102;
  int64_t v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _OWORD *v109;
  __int128 v110;
  uint64_t v111;
  _OWORD *v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t *v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  __int128 v131;
  __int128 v132;
  char v133;
  uint64_t v134;
  __int128 v135;
  __int128 v136;
  _OWORD v137[2];
  uint64_t v138;
  _QWORD v139[3];
  _OWORD v140[2];
  uint64_t v141;
  uint64_t v142;

  v112 = a3;
  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v111 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = _s9_IngesterVMa();
  MEMORY[0x24BDAC7A8](v118);
  v9 = (uint64_t *)((char *)&v111 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v134 = MEMORY[0x24BEE4AF8];
  v135 = 0u;
  v136 = 0u;
  memset(v137, 0, 30);
  v138 = 0;
  memset(v139, 0, 14);
  v139[2] = MEMORY[0x24BEE4AF8];
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, a2);
  sub_2382F9638((uint64_t)v7, a2, v9);
  v10 = 0;
  v115 = v9;
  while (1)
  {
    v11 = *v9;
    v12 = v9[1];
    v13 = v9[2];
    v14 = v9[3];
    v15 = v9[4];
    swift_bridgeObjectRetain();
    v16 = sub_23835B43C();
    swift_bridgeObjectRelease();
    v17 = v16 - 124;
    if (v16 >= 379)
      v17 = 255;
    if (v16 <= 255)
      v18 = v16;
    else
      v18 = v17;
    v19 = sub_238265ADC(v15, v12, v18, v13, v14);
    if ((v21 & 1) != 0 || (v19 ^ v20) < 0x4000)
    {
      sub_238265C60((uint64_t *)v140);
      v132 = v140[0];
      v131 = v140[1];
      v106 = (uint64_t)v9;
      v107 = v141;
      v108 = v142;
      sub_238265FE8(v106, (uint64_t (*)(_QWORD))_s9_IngesterVMa);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v109 = v112;
      v110 = v131;
      *v112 = v132;
      v109[1] = v110;
      *((_QWORD *)v109 + 4) = v107;
      *((_QWORD *)v109 + 5) = v108;
      return result;
    }
    v9[4] = v20;
    v122 = v19;
    v121 = v20;
    v124 = v13;
    v123 = v14;
    v22 = sub_23835B46C();
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v29 = sub_238265480(v22, v23, v25, v27);
    *(_QWORD *)&v131 = v26;
    result = sub_2382D10F4(v22, v24, v26, v28);
    *(_QWORD *)&v132 = v10;
    if ((v31 & 0x100) != 0)
      break;
    if ((v31 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v32 = sub_23835B430();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v33 = sub_23835B430();
      result = swift_bridgeObjectRelease();
      v34 = v33 >> 14;
      if (v33 >> 14 < v32 >> 14)
        goto LABEL_164;
      v35 = v24 >> 14;
LABEL_68:
      if (v35 >= v34)
      {
        v116 = v12;
        v117 = v11;
        v54 = sub_23835B46C();
        v56 = v55;
        v58 = v57;
        v60 = v59;
        result = swift_bridgeObjectRelease();
        *(_QWORD *)&v131 = v32;
        v90 = 1;
        while (1)
        {
          if ((v60 & 0x1000000000000000) != 0)
          {
            v74 = v56 >> 14;
            if (v54 >> 14 >= v56 >> 14)
              goto LABEL_129;
            v81 = v54 >> 14;
            v82 = 4 << ((v58 & 0x800000000000000) != 0);
            v83 = HIBYTE(v60) & 0xF;
            if ((v60 & 0x2000000000000000) == 0)
              v83 = v58 & 0xFFFFFFFFFFFFLL;
            v129 = v83;
            v84 = v54;
            v128 = v54 >> 14;
            v130 = 4 << ((v58 & 0x800000000000000) != 0);
            while (1)
            {
              v85 = v84 & 0xC;
              v86 = v85 == v82 || (v84 & 1) == 0;
              v127 = v81;
              if (v86)
              {
                v87 = v84;
                if (v85 == v82)
                {
                  result = sub_2382A6050(v84, v58, v60);
                  v85 = v84 & 0xC;
                  v87 = result;
                }
                if (v129 <= v87 >> 16)
                  goto LABEL_166;
                v126 = v85;
                if ((v87 & 1) == 0)
                  sub_23826674C(v87, v58, v60);
                v88 = sub_23835ADB8();
                result = v84;
                if (v126 == v130)
                  result = sub_2382A6050(v84, v58, v60);
                if (result >> 14 < v128 || result >> 14 >= v74)
                  goto LABEL_167;
                if ((result & 1) == 0)
                  sub_23826674C(result, v58, v60);
              }
              else
              {
                if (v129 <= v84 >> 16)
                  goto LABEL_168;
                result = sub_23835ADB8();
                if (v84 >> 14 < v128)
                  goto LABEL_169;
                v88 = result;
                result = v84;
                if (v84 >> 14 >= v74)
                  goto LABEL_169;
              }
              sub_23835B5A4();
              result = sub_23835BAE4();
              v75 = v88 >> 14;
              if ((result & 1) != 0)
                break;
              v84 = v88;
              v81 = v88 >> 14;
              v82 = v130;
              if (v75 >= v74)
                goto LABEL_129;
            }
            if (v75 < v127)
              goto LABEL_170;
          }
          else
          {
            if ((v60 & 0x2000000000000000) != 0)
            {
              *(_QWORD *)&v140[0] = v58;
              *((_QWORD *)&v140[0] + 1) = v60 & 0xFFFFFFFFFFFFFFLL;
              v62 = v140;
              v63 = v54;
              v64 = v56;
              v65 = v58;
              v66 = v60;
              v61 = v132;
            }
            else
            {
              v61 = v132;
              if ((v58 & 0x1000000000000000) != 0)
                v62 = (_OWORD *)((v60 & 0xFFFFFFFFFFFFFFFLL) + 32);
              else
                v62 = (_OWORD *)sub_23835B634();
              v63 = v54;
              v64 = v56;
              v65 = v58;
              v66 = v60;
            }
            v67 = sub_2382D14B0((uint64_t)v62, v63, v64, v65, v66);
            v69 = v68;
            v133 = v70 & 1;
            *(_QWORD *)&v132 = v61;
            if ((v70 & 1) != 0)
            {
LABEL_129:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              v29 = sub_23835B43C();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              v130 = sub_23835B43C();
              swift_bridgeObjectRelease();
              v22 = sub_23835B46C();
              v28 = v89;
              goto LABEL_130;
            }
            result = v54;
            if ((v54 & 0xC) == 8)
            {
              result = sub_2382A6050(v54, v58, v60);
              v71 = v67 + (result >> 16);
              if (__OFADD__(v67, result >> 16))
              {
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
LABEL_154:
                __break(1u);
LABEL_155:
                __break(1u);
                goto LABEL_156;
              }
            }
            else
            {
              v71 = v67 + (v54 >> 16);
              if (__OFADD__(v67, v54 >> 16))
                goto LABEL_142;
            }
            if ((v71 & 0x8000000000000000) != 0)
              goto LABEL_143;
            if ((v60 & 0x2000000000000000) != 0)
              v72 = HIBYTE(v60) & 0xF;
            else
              v72 = v58 & 0xFFFFFFFFFFFFLL;
            if (v72 < v71)
              goto LABEL_144;
            result = v54;
            if ((v54 & 0xC) == 8)
            {
              result = sub_2382A6050(v54, v58, v60);
              v73 = v69 + (result >> 16);
              if (__OFADD__(v69, result >> 16))
                goto LABEL_145;
            }
            else
            {
              v73 = v69 + (v54 >> 16);
              if (__OFADD__(v69, v54 >> 16))
                goto LABEL_145;
            }
            if ((v73 & 0x8000000000000000) != 0)
              goto LABEL_146;
            if (v72 < v73)
              goto LABEL_147;
            if (v73 < v71)
              goto LABEL_148;
            v74 = v56 >> 14;
            v75 = 4 * v73;
          }
          if (v74 < v75)
            goto LABEL_149;
          v54 = sub_23835B46C();
          v56 = v76;
          v58 = v77;
          v79 = v78;
          result = swift_bridgeObjectRelease();
          v60 = v79;
          if (__OFADD__(v90++, 1))
            goto LABEL_150;
        }
      }
      goto LABEL_163;
    }
    v90 = 0;
    v130 = v29;
    v37 = v24;
LABEL_65:
    v38 = v131;
LABEL_130:
    v91 = MEMORY[0x23B8306D4](v22, v37, v38, v28);
    v93 = v92;
    v128 = v29;
    if ((v92 & 0x1000000000000000) != 0)
    {
      v91 = sub_238266994();
      v105 = v104;
      swift_bridgeObjectRelease();
      v93 = v105;
    }
    swift_bridgeObjectRetain();
    v94 = sub_23835AF80();
    v96 = v95;
    v98 = v97;
    v100 = v99;
    swift_bridgeObjectRelease();
    result = sub_238265480(v94, v96, v98, v100);
    if ((uint64_t)result > 255)
      goto LABEL_155;
    v101 = sub_238265480(v94, v96, v98, v100);
    v102 = sub_23835AF2C();
    v103 = sub_23826648C(v94, v96, v98, v100);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if (v101 > 255)
    {
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
      goto LABEL_165;
    }
    if (v102 > 255)
      goto LABEL_157;
    if (v103 > 255)
      goto LABEL_158;
    if (v90 > 255)
      goto LABEL_159;
    if (v128 > 255)
      goto LABEL_160;
    if ((v128 | v90 | v130 | v101 | v102 | v103) < 0)
      goto LABEL_161;
    if (v130 > 255)
      goto LABEL_162;
    v125 = ((_DWORD)v90 << 24) | v125 & 0xFFFF000000000000 | ((unint64_t)v128 << 32) & 0xFFFF00FFFFFF0000 | ((unint64_t)v130 << 40) | v101 | ((unint64_t)v102 << 8) | ((unint64_t)v103 << 16);
    sub_238263184(v91, v93, v125);
    v9 = v115;
    v10 = v132;
  }
  v36 = v22 >> 14;
  v35 = v24 >> 14;
  v37 = v24;
  if (v22 >> 14 >= v24 >> 14)
  {
    v90 = 0;
    v130 = v29;
    goto LABEL_65;
  }
  v113 = v24;
  v128 = v29;
  v116 = v12;
  v117 = v11;
  v38 = v131;
  v39 = ((unint64_t)v131 >> 59) & 1;
  if ((v28 & 0x1000000000000000) == 0)
    LOBYTE(v39) = 1;
  v40 = 4 << v39;
  v41 = HIBYTE(v28) & 0xF;
  v120 = v41;
  v119 = v131 & 0xFFFFFFFFFFFFLL;
  if ((v28 & 0x2000000000000000) == 0)
    v41 = v131 & 0xFFFFFFFFFFFFLL;
  v130 = v41;
  v127 = v28 & 0xFFFFFFFFFFFFFFLL;
  v126 = (v28 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v114 = v22;
  v42 = v22;
  v129 = v22 >> 14;
  while (1)
  {
    v43 = v42 & 0xC;
    v44 = (v42 & 1) == 0 || v43 == v40;
    v45 = v44;
    v46 = v42;
    if (v44)
    {
      if (v43 == v40)
      {
        result = sub_2382A6050(v42, v38, v28);
        v38 = v131;
        v42 = result;
      }
      if (v130 <= v42 >> 16)
        goto LABEL_151;
      if ((v42 & 1) == 0)
      {
        result = sub_23826674C(v42, v38, v28);
        v38 = v131;
        v42 = v42 & 0xC | result & 0xFFFFFFFFFFFFFFF3 | 1;
      }
    }
    else if (v130 <= v42 >> 16)
    {
      goto LABEL_152;
    }
    if ((v28 & 0x1000000000000000) != 0)
    {
      result = sub_23835ADB8();
      v42 = result;
    }
    else
    {
      v47 = v42 >> 16;
      if ((v28 & 0x2000000000000000) != 0)
      {
        *(_QWORD *)&v140[0] = v38;
        *((_QWORD *)&v140[0] + 1) = v127;
        v48 = *((unsigned __int8 *)v140 + v47);
      }
      else
      {
        result = v126;
        if ((v38 & 0x1000000000000000) == 0)
          result = sub_23835B634();
        v48 = *(unsigned __int8 *)(result + v47);
      }
      v49 = (char)v48;
      v50 = __clz(v48 ^ 0xFF) - 24;
      if (v49 >= 0)
        LOBYTE(v50) = 1;
      v42 = ((v47 + v50) << 16) | 5;
    }
    v51 = v129;
    if (v45)
    {
      result = v46;
      v52 = v131;
      if (v43 == v40)
      {
        result = sub_2382A6050(v46, v131, v28);
        v52 = v131;
      }
      if (result >> 14 < v51 || result >> 14 >= v35)
        goto LABEL_153;
      if ((result & 1) == 0)
      {
        sub_23826674C(result, v52, v28);
        v52 = v131;
      }
    }
    else
    {
      v52 = v131;
      if (v46 >> 14 < v129)
        goto LABEL_154;
      result = v46;
      if (v46 >> 14 >= v35)
        goto LABEL_154;
    }
    if ((v28 & 0x1000000000000000) != 0)
    {
      sub_23835B5A4();
    }
    else
    {
      if ((v28 & 0x2000000000000000) != 0)
      {
        *(_QWORD *)&v140[0] = v52;
        *((_QWORD *)&v140[0] + 1) = v127;
        swift_bridgeObjectRetain();
      }
      else
      {
        if ((v52 & 0x1000000000000000) == 0)
          sub_23835B634();
        swift_bridgeObjectRetain();
      }
      sub_23835B640();
      swift_bridgeObjectRelease();
    }
    result = sub_23835BAE4();
    v34 = v42 >> 14;
    if ((result & 1) != 0)
      break;
    v36 = v42 >> 14;
    v38 = v131;
    if (v34 >= v35)
    {
      v90 = 0;
      v29 = v128;
      v130 = v128;
      v22 = v114;
      v37 = v113;
      goto LABEL_130;
    }
  }
  v53 = v34 >= v36;
  v11 = v117;
  v12 = v116;
  v32 = v46;
  if (v53)
    goto LABEL_68;
LABEL_165:
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
  return result;
}

ValueMetadata *type metadata accessor for BigString()
{
  return &type metadata for BigString;
}

uint64_t _HashNode.subtracting<A>(_:_:)(unsigned int a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v29;
  char *v30;
  unsigned int v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v35 = a5;
  v36 = a8;
  v33 = a3;
  v34 = a4;
  v32 = a2;
  v31 = a1;
  v11 = type metadata accessor for _HashNode.Builder(0, a6, a7, a9);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v30 = (char *)&v29 - v16;
  v17 = sub_23835B334();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v29 - v22;
  _HashNode._subtracting<A>(_:_:)(v31, v32, v33, v34, v35, a6, a7, v36, (_BYTE *)&v29 - v22, a9);
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v23, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v21, 1, v11) == 1)
  {
    v24 = *(void (**)(char *, uint64_t))(v18 + 8);
    v24(v23, v17);
    v24(v21, v17);
    return 0;
  }
  else
  {
    v26 = v30;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v30, v21, v11);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v26, v11);
    sub_2383058C8(v11);
    v25 = v27;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v26, v11);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v23, v17);
  }
  return v25;
}

uint64_t _HashNode._subtracting<A>(_:_:)@<X0>(unsigned int a1@<W0>, uint64_t a2@<X1>, void (*a3)(uint64_t, uint64_t, uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _BYTE *a9@<X8>, uint64_t a10)
{
  uint64_t v18;
  uint64_t v19;
  char *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v24;
  unsigned int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = a8;
  v18 = type metadata accessor for _HashNode.Builder.Kind(0, a6, a7, a10);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v27 - v19;
  if (a4 == a2)
  {
    swift_storeEnumTagMultiPayload();
    _HashNode.Builder.init(_:_:)(a1, (uint64_t)v20, a6, a7, a10, a9);
    v24 = type metadata accessor for _HashNode.Builder(0, a6, a7, a10);
    return (*(uint64_t (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(a9, 0, 1, v24);
  }
  else
  {
    v28 = a5;
    v21 = _HashNode.isCollisionNode.getter(a4, a5, a6, a7, a10);
    v22 = v29;
    if (v21 || _HashNode.isCollisionNode.getter(a2, (uint64_t)a3, a6, v29, a10))
    {
      return _HashNode._subtracting_slow<A>(_:_:)(a1, a2, a3, a4, v28, a6, a7, v22, (uint64_t)a9, a10);
    }
    else
    {
      v25 = (unsigned int *)nullsub_1(a4 + 16, a4 + 32, a6, a7, a10);
      return sub_2383443C8(v25, v26, a2, a1, a6, (uint64_t)a9, a7, v22, a10);
    }
  }
}

uint64_t _HashNode._subtracting_slow<A>(_:_:)@<X0>(unsigned int a1@<W0>, uint64_t a2@<X1>, void (*a3)(uint64_t, uint64_t, uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  BOOL v17;
  BOOL v18;
  int *v19;
  uint64_t *v20;
  __int32 *v21;
  uint64_t *v22;
  uint64_t v23;
  _QWORD *v24;

  v17 = _HashNode.isCollisionNode.getter(a4, a5, a6, a7, a10);
  v18 = _HashNode.isCollisionNode.getter(a2, (uint64_t)a3, a6, a8, a10);
  v19 = (int *)nullsub_1(a4 + 16, a4 + 32, a6, a7, a10);
  if (!v17)
    return sub_2383459AC(v19, (uint64_t)v20, a2, a3, a1, a4, a5, a6, a9, a7, a8, a10);
  if (!v18)
    return sub_2383454F0((uint64_t)v19, v20, a2, a1, a4, a5, a6, a9, a7, a8, a10);
  v21 = v19;
  v22 = v20;
  v23 = nullsub_1(a2 + 16, a2 + 32, a6, a8, a10);
  return sub_2383450F0(v23, v24, v21, v22, a1, a6, a9, a7, a8, a10);
}

uint64_t sub_2383443C8@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W4>, uint64_t a5@<X7>, uint64_t a6@<X8>, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _DWORD *v14;
  uint64_t v15;

  v14 = (_DWORD *)nullsub_1(a3 + 16, a3 + 32, a5, a8, a9);
  return sub_238344470(v14, v15, a4, a1, a2, a5, a6, a7, a8, a9);
}

uint64_t sub_238344470@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, unsigned int *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v13;
  uint64_t TupleTypeMetadata2;
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
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  _BYTE *v43;
  char v44;
  uint64_t v45;
  int8x8_t v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t v51;
  _DWORD *v52;
  int v53;
  int v54;
  uint64_t v55;
  uint8x8_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t, uint64_t);
  uint64_t v60;
  unsigned int *v61;
  char *v62;
  uint64_t v63;
  char *v64;
  void (*v65)(char *, uint64_t);
  char *v66;
  int v67;
  uint8x8_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unsigned int v84;
  uint64_t v85;
  char *v86;
  int v87;
  _DWORD *v88;
  uint64_t i;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  unsigned int v93;
  int v94;
  int v95;
  uint8x8_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(char *, uint64_t, uint64_t);
  unint64_t v104;
  void (*v105)(uint64_t, uint64_t);
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  int v113;
  _DWORD *v114;
  uint8x8_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  _DWORD *v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  char *v134;
  void (*v135)(char *, uint64_t);
  uint64_t v136;
  char *v137;
  int v138;
  char *v139;
  char *v140;
  void (*v141)(char *, uint64_t);
  char *v142;
  uint64_t v143;
  uint64_t v144;
  int v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  char *v151;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  char *v157;
  char *v158;
  char *v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  uint64_t v165;
  char *v166;
  char *v167;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  unsigned int v173;
  void (*v174)(char *);
  char *v175;
  unsigned int v176;
  char *v177;
  char *v178;
  uint64_t v179;
  uint64_t v180;
  unsigned int *v181;
  uint64_t v182;
  unsigned int v183;
  unsigned int v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  int v188;
  _DWORD *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;

  v191 = a5;
  v187 = a2;
  v189 = a1;
  v155 = a7;
  v13 = a10;
  v186 = a9;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v15 = type metadata accessor for _HashNode.Builder(255, a6, a8, a10);
  v169 = swift_getTupleTypeMetadata2();
  v162 = sub_23835B334();
  v161 = *(_QWORD *)(v162 - 8);
  MEMORY[0x24BDAC7A8](v162);
  v180 = (uint64_t)&v154 - v16;
  v171 = sub_23835B334();
  v170 = *(_QWORD *)(v171 - 8);
  v17 = MEMORY[0x24BDAC7A8](v171);
  v158 = (char *)&v154 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v157 = (char *)&v154 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v168 = (char *)&v154 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v167 = (char *)&v154 - v24;
  v165 = TupleTypeMetadata2;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v159 = (char *)&v154 - v26;
  v179 = *(_QWORD *)(a6 - 8);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v166 = (char *)&v154 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v178 = (char *)&v154 - v29;
  v30 = type metadata accessor for _HashNode.Builder.Kind(0, a6, a8, a10);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v154 - v32;
  v34 = *(_QWORD *)(v15 - 8);
  v35 = MEMORY[0x24BDAC7A8](v31);
  v156 = (char *)&v154 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = MEMORY[0x24BDAC7A8](v35);
  v164 = (char *)&v154 - v38;
  v39 = MEMORY[0x24BDAC7A8](v37);
  v160 = (char *)&v154 - v40;
  MEMORY[0x24BDAC7A8](v39);
  v42 = (char *)&v154 - v41;
  swift_storeEnumTagMultiPayload();
  v177 = v42;
  v43 = v42;
  LODWORD(v42) = a3;
  v44 = a3;
  v193 = a6;
  v45 = a8;
  _HashNode.Builder.init(_:_:)(v44, (uint64_t)v33, a6, a8, a10, v43);
  v47 = v42;
  v48 = *a4;
  v181 = a4;
  v176 = v47;
  v185 = v15;
  v190 = a10;
  v192 = a8;
  v172 = v34;
  if (!v48)
  {
    v84 = a4[1];
    v86 = v177;
    v85 = v34;
    if (v84)
    {
      v87 = 0;
      v173 = v176 + 5;
LABEL_27:
      v88 = v189;
      for (i = 0; ; i = (i + 1))
      {
        v93 = __clz(__rbit32(v84));
        v84 &= v84 - 1;
        v94 = *v88;
        v95 = 1 << v93;
        LODWORD(v182) = v93;
        if (((1 << v93) & v94) != 0)
          break;
        v113 = v88[1];
        if ((v113 & v95) != 0)
        {
          v114 = v88;
          v183 = v87;
          v184 = i;
          v188 = v84;
          v46.i32[0] = v113 & (v95 - 1);
          v115 = (uint8x8_t)vcnt_s8(v46);
          v115.i16[0] = vaddlv_u8(v115);
          v116 = v115.u32[0];
          v117 = i;
          v118 = v192;
          v119 = v193;
          v120 = v190;
          v121 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v117, a4, v191, v193, v192, v190);
          v122 = *v121;
          v123 = v121[1];
          v124 = v114;
          v125 = v186;
          v126 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v116, v124, v187, v119, v186, v120);
          v127 = *v126;
          v128 = v126[1];
          swift_retain();
          swift_retain();
          v153 = v120;
          v129 = v157;
          v130 = v118;
          v131 = v170;
          v132 = v171;
          _HashNode._subtracting<A>(_:_:)(v173, v127, v128, v122, v123, v119, v130, v125, v153);
          swift_release();
          v133 = v129;
          v85 = v172;
          swift_release();
          v134 = v158;
          (*(void (**)(char *, char *, uint64_t))(v131 + 16))(v158, v129, v132);
          i = v185;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v85 + 48))(v134, 1, v185) != 1)
          {
            v142 = v156;
            (*(void (**)(char *, char *, uint64_t))(v85 + 32))(v156, v134, i);
            v143 = v85;
            v86 = v177;
            v175 = v133;
            goto LABEL_47;
          }
          v135 = *(void (**)(char *, uint64_t))(v131 + 8);
          v135(v129, v132);
          v135(v134, v132);
          v109 = v192;
          a4 = v181;
LABEL_40:
          v84 = v188;
          i = v184;
          if ((v183 & 1) != 0)
            goto LABEL_28;
          goto LABEL_44;
        }
        v109 = v192;
        if ((v87 & 1) != 0)
        {
LABEL_28:
          v90 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(i, a4, v191, v193, v109, v190);
          v92 = *v90;
          v91 = v90[1];
          swift_retain();
          _HashNode.Builder.addNewChildNode(_:_:at:)(v176, v92, v91, v182, v185);
          if (!v84)
            goto LABEL_50;
          goto LABEL_29;
        }
LABEL_44:
        if (!v84)
          goto LABEL_51;
        v87 = 0;
LABEL_30:
        v88 = v189;
      }
      v183 = v87;
      v188 = v84;
      v46.i32[0] = (v95 - 1) & v94;
      v96 = (uint8x8_t)vcnt_s8(v46);
      v96.i16[0] = vaddlv_u8(v96);
      v97 = i;
      v98 = v193;
      v99 = v190;
      v100 = _HashNode.UnsafeHandle.itemPtr(at:)(v96.u32[0], (uint64_t)v88, v187);
      v101 = (uint64_t)v178;
      v102 = v179;
      v103 = *(void (**)(char *, uint64_t, uint64_t))(v179 + 16);
      v103(v178, v100, v98);
      v104 = sub_238358A4C();
      v105 = *(void (**)(uint64_t, uint64_t))(v102 + 8);
      v105(v101, v98);
      v184 = v97;
      v106 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v97, a4, v191, v98, v192, v99);
      v107 = *v106;
      v108 = v106[1];
      v103((char *)v101, v100, v98);
      v109 = v192;
      swift_retain();
      v110 = v180;
      _HashNode.removing(_:_:_:)(v173, v101, v104, v107, v108, v98, v109, v99, v180);
      swift_release();
      v105(v101, v98);
      v111 = v169;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v169 - 8) + 48))(v110, 1, v169) == 1)
      {
        (*(void (**)(uint64_t, uint64_t))(v161 + 8))(v110, v162);
        v85 = v172;
        v112 = v167;
        i = v185;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v172 + 56))(v167, 1, 1, v185);
      }
      else
      {
        v136 = v180 + *(int *)(v165 + 48);
        v85 = v172;
        v112 = v167;
        i = v185;
        (*(void (**)(char *, uint64_t, uint64_t))(v172 + 32))(v167, v180 + *(int *)(v111 + 48), v185);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v85 + 56))(v112, 0, 1, i);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v109 - 8) + 8))(v136, v109);
        v105(v180, v193);
      }
      v132 = v171;
      v131 = v170;
      v86 = v177;
      v137 = v168;
      (*(void (**)(char *, char *, uint64_t))(v170 + 16))(v168, v112, v171);
      v138 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v85 + 48))(v137, 1, i);
      a4 = v181;
      if (v138 != 1)
      {
        v142 = v160;
        (*(void (**)(char *, char *, uint64_t))(v85 + 32))(v160, v137, i);
        v143 = v85;
        v175 = v112;
LABEL_47:
        v144 = v176;
        v145 = v182;
        if ((v183 & 1) == 0)
          _HashNode.Builder.copyItemsAndChildren(_:from:upTo:)(v176, v181, v191, v182, i);
        v146 = (uint64_t)v164;
        (*(void (**)(char *, char *, uint64_t))(v143 + 16))(v164, v142, i);
        _HashNode.Builder.addNewChildBranch(_:_:at:)(v144, v146, v145, i);
        (*(void (**)(char *, uint64_t))(v143 + 8))(v142, i);
        (*(void (**)(char *, uint64_t))(v131 + 8))(v175, v132);
        v85 = v143;
        a4 = v181;
        v84 = v188;
        LODWORD(i) = v184;
        if (!v188)
          goto LABEL_50;
LABEL_29:
        v87 = 1;
        goto LABEL_30;
      }
      v139 = v112;
      v140 = v137;
      v141 = *(void (**)(char *, uint64_t))(v131 + 8);
      v141(v139, v132);
      v141(v140, v132);
      goto LABEL_40;
    }
LABEL_51:
    v151 = v86;
    v149 = v185;
    (*(void (**)(char *, uint64_t))(v85 + 8))(v151, v185);
    v150 = 1;
    v147 = v155;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v85 + 56))(v147, v150, 1, v149);
  }
  v188 = 0;
  v49 = 0;
  v173 = v47 + 5;
  while (1)
  {
    while (1)
    {
      v50 = __clz(__rbit32(v48));
      v48 &= v48 - 1;
      v51 = _HashNode.UnsafeHandle.itemPtr(at:)(v49, (uint64_t)a4, v191);
      v52 = v189;
      v53 = *v189;
      v54 = 1 << v50;
      v183 = v50;
      v182 = v51;
      if (((1 << v50) & v53) != 0)
        break;
      v67 = v189[1];
      if ((v67 & v54) == 0)
      {
        if ((v188 & 1) != 0)
        {
          v174 = *(void (**)(char *))(v179 + 16);
          goto LABEL_19;
        }
LABEL_3:
        if (v48)
        {
          v188 = 0;
          goto LABEL_5;
        }
        v84 = a4[1];
        v85 = v172;
        v86 = v177;
        if (v84)
        {
          v87 = 0;
          goto LABEL_27;
        }
        goto LABEL_51;
      }
      v184 = v49;
      v46.i32[0] = v67 & (v54 - 1);
      v68 = (uint8x8_t)vcnt_s8(v46);
      v68.i16[0] = vaddlv_u8(v68);
      v69 = v68.u32[0];
      v71 = (uint64_t)v178;
      v70 = v179;
      v72 = *(void (**)(char *, uint64_t, uint64_t))(v179 + 16);
      v73 = v51;
      v74 = v193;
      v72(v178, v51, v193);
      v75 = v190;
      v163 = sub_238358A4C();
      v175 = *(char **)(v70 + 8);
      ((void (*)(uint64_t, uint64_t))v175)(v71, v74);
      v76 = v186;
      v77 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v69, v52, v187, v74, v186, v75);
      v78 = *v77;
      v79 = v77[1];
      v174 = (void (*)(char *))v72;
      v72((char *)v71, v73, v74);
      swift_retain();
      v45 = v192;
      LOBYTE(v79) = _HashNode.containsKey(_:_:_:)(v173, v71, v163, v78, v79, v74, v76, v75);
      swift_release();
      ((void (*)(uint64_t, uint64_t))v175)(v71, v74);
      a4 = v181;
      if ((v79 & 1) == 0)
        goto LABEL_13;
LABEL_8:
      if ((v188 & 1) != 0)
      {
        if (!v48)
          goto LABEL_21;
      }
      else
      {
        _HashNode.Builder.copyItems(_:from:upTo:)(v176, a4, v191, v183, v185);
        if (!v48)
          goto LABEL_21;
      }
      v188 = 1;
      v13 = v190;
      v49 = v184 + 1;
    }
    v55 = v13;
    v184 = v49;
    v46.i32[0] = (v54 - 1) & v53;
    v56 = (uint8x8_t)vcnt_s8(v46);
    v56.i16[0] = vaddlv_u8(v56);
    v57 = v56.u32[0];
    v58 = v179;
    v59 = *(void (**)(char *, uint64_t, uint64_t))(v179 + 16);
    v60 = v193;
    LODWORD(v175) = v48;
    v61 = a4;
    v62 = v178;
    v59(v178, v51, v193);
    v63 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v57, v52, v187, v60, v186, v55);
    v64 = v166;
    v174 = (void (*)(char *))v59;
    v59(v166, v63, v60);
    LOBYTE(v57) = sub_23835AD40();
    v65 = *(void (**)(char *, uint64_t))(v58 + 8);
    v65(v64, v60);
    v66 = v62;
    a4 = v61;
    v45 = v192;
    v48 = v175;
    v65(v66, v60);
    if ((v57 & 1) != 0)
      goto LABEL_8;
LABEL_13:
    v49 = v184;
    if ((v188 & 1) == 0)
      goto LABEL_3;
LABEL_19:
    v80 = *(int *)(v165 + 48);
    v81 = (uint64_t)v159;
    v82 = (uint64_t)&v159[v80];
    v83 = v182 + v80;
    v174(v159);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 16))(v82, v83, v45);
    _HashNode.Builder.addNewItem(_:_:at:)(v176, v81, v82, v183, v185);
    if (!v48)
      break;
    v188 = 1;
LABEL_5:
    v13 = v190;
    ++v49;
  }
LABEL_21:
  v84 = a4[1];
  v85 = v172;
  v86 = v177;
  if (v84)
  {
    v87 = 1;
    goto LABEL_27;
  }
LABEL_50:
  v147 = v155;
  v148 = v86;
  v149 = v185;
  (*(void (**)(uint64_t, char *, uint64_t))(v85 + 32))(v155, v148, v185);
  v150 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v85 + 56))(v147, v150, 1, v149);
}

uint64_t sub_2383450F0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, __int32 *a3@<X2>, uint64_t *a4@<X3>, unsigned int a5@<W4>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10)
{
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
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  __int32 v27;
  uint8x8_t v28;
  unsigned int i;
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
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t TupleTypeMetadata2;
  unsigned int v51;
  _BYTE *v52;
  uint64_t v53;
  unsigned int *v54;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;

  v51 = a5;
  v61 = a1;
  v48 = a7;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v49 = (char *)&v46 - v14;
  v15 = type metadata accessor for _HashNode.Builder.Kind(0, a6, a8, a10);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v46 - v16;
  v18 = type metadata accessor for _HashNode.Builder(0, a6, a8, a10);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v46 - v21;
  v62 = a4;
  v23 = *a4;
  v65 = a2;
  if (v23 != *a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(v48, 1, 1, v19);
  v47 = v20;
  v53 = v19;
  v24 = v22;
  swift_storeEnumTagMultiPayload();
  v52 = v24;
  _HashNode.Builder.init(_:_:)(v51, (uint64_t)v17, a6, a8, a10, v24);
  v59 = a9;
  v25 = _HashNode.UnsafeHandle.reverseItems.getter();
  v57 = v26;
  v58 = v25;
  v27 = *a3;
  v28 = (uint8x8_t)vcnt_s8((int8x8_t)*a3);
  v28.i16[0] = vaddlv_u8(v28);
  if (*a3 != a3[1])
    v27 = v28.i32[0];
  v56 = v27;
  if (!v27)
  {
LABEL_18:
    v41 = v53;
    v42 = v47;
    (*(void (**)(_BYTE *, uint64_t))(v47 + 8))(v52, v53);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56))(v48, 1, 1, v41);
  }
  v60 = a8;
  v61 = a6;
  v54 = (unsigned int *)a3;
  v55 = a10;
  LODWORD(v65) = 0;
  for (i = 1; ; ++i)
  {
    while (1)
    {
      v30 = v61;
      v31 = v60;
      v32 = v55;
      v33 = _HashNode.UnsafeHandle.itemPtr(at:)(i - 1, (uint64_t)a3, (uint64_t)v62);
      v63 = v58;
      v64 = v57;
      v34 = MEMORY[0x24BDAC7A8](v33);
      *(&v46 - 6) = v30;
      *(&v46 - 5) = v31;
      *(&v46 - 4) = v59;
      *(&v46 - 3) = v32;
      *(&v46 - 2) = v34;
      swift_getTupleTypeMetadata2();
      v35 = sub_23835B3A0();
      MEMORY[0x23B831670](MEMORY[0x24BEE1D30], v35);
      if ((sub_23835B01C() & 1) == 0)
        break;
      if ((v65 & 1) != 0)
        goto LABEL_13;
      a3 = (__int32 *)v54;
      _HashNode.Builder.copyCollisions(from:upTo:)((uint64_t)v54, v62, i - 1, v53);
      if (i >= v56)
        goto LABEL_19;
LABEL_7:
      LODWORD(v65) = 1;
      ++i;
    }
    if ((v65 & 1) != 0)
      break;
    if (i >= v56)
      goto LABEL_18;
    LODWORD(v65) = 0;
    a3 = (__int32 *)v54;
  }
  v36 = (uint64_t)v49;
  v37 = *(int *)(TupleTypeMetadata2 + 48);
  v38 = (uint64_t)&v49[v37];
  v39 = v33 + v37;
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v61 - 8) + 16))(v49, v33);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 16))(v38, v39);
  _HashNode.Builder.addNewCollision(_:_:_:)(v51, v36, v38, *v62, v53);
LABEL_13:
  a3 = (__int32 *)v54;
  if (i < v56)
    goto LABEL_7;
LABEL_19:
  v44 = v47;
  v43 = v48;
  v45 = v53;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v47 + 32))(v48, v52, v53);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v44 + 56))(v43, 0, 1, v45);
}

uint64_t sub_2383454F0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int *v17;
  uint64_t v18;

  v17 = (int *)nullsub_1(a3 + 16, a3 + 32, a7, a10, a11);
  return sub_238345598(v17, v18, a1, a2, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t sub_238345598@<X0>(int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
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
  int8x8_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  int v35;
  int v36;
  uint8x8_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  unint64_t v42;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint8x8_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  v13 = v12;
  v72 = a6;
  v73 = a7;
  v74 = a3;
  v80 = a2;
  v77 = a9;
  v79 = a11;
  v18 = type metadata accessor for _HashNode.Builder(255, a8, a10, a12);
  v19 = sub_23835B334();
  v20 = MEMORY[0x24BDAC7A8](v19);
  v76 = v18;
  v21 = MEMORY[0x24BDAC7A8](v20);
  v22 = *(_QWORD *)(a10 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v24 = *(_QWORD *)(a8 - 8);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v33 = (char *)&v66 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = a4;
  v34 = (*a4 >> a5) & 0x1FLL;
  v35 = *a1;
  v36 = 1 << (*a4 >> a5);
  v78 = v13;
  if ((v36 & v35) != 0)
  {
    v67 = v26;
    v68 = v22;
    v69 = v29;
    v70 = v27;
    v71 = v34;
    v31.i32[0] = (v36 - 1) & v35;
    v37 = (uint8x8_t)vcnt_s8(v31);
    v37.i16[0] = vaddlv_u8(v37);
    v38 = _HashNode.UnsafeHandle.itemPtr(at:)(v37.u32[0], (uint64_t)a1, v80);
    v39 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 16);
    v39(v33, v38, a8);
    v40 = sub_238358A4C();
    v41 = *(void (**)(char *, uint64_t))(v24 + 8);
    v41(v33, a8);
    v39(v33, v38, a8);
    v42 = _HashNode.UnsafeHandle.find(_:_:_:)(a5, (uint64_t)v33, v40, v74, (uint64_t)v75, a8, a10, a12);
    v41(v33, a8);
    if (v42 == 2)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 56))(v77, 1, 1, v76);
    }
    else
    {
      v55 = HIDWORD(v42);
      v56 = v67;
      v57 = v69;
      _HashNode._removingItemFromLeaf(_:at:_:)((uint64_t)v33, v67, v69, a5, v71, v55, v72, v73, a8, a10, a12);
      (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v56, a10);
      v41(v33, a8);
      v58 = v70;
      v59 = v77;
      v60 = v57;
      v61 = v76;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 32))(v77, v60, v76);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v58 + 56))(v59, 0, 1, v61);
    }
  }
  else
  {
    v44 = v80;
    v45 = v79;
    v46 = a1[1];
    if ((v46 & v36) != 0)
    {
      v31.i32[0] = v46 & (v36 - 1);
      v47 = (uint8x8_t)vcnt_s8(v31);
      v47.i16[0] = vaddlv_u8(v47);
      v75 = (_QWORD *)v25;
      v71 = v34;
      v80 = v28;
      v48 = v30;
      v49 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v47.u32[0], a1, v44, a8, v79, a12);
      v51 = *v49;
      v50 = v49[1];
      swift_retain();
      _HashNode._subtracting<A>(_:_:)((a5 + 5), v51, v50, v72, v73, a8, a10, v45, a12);
      v52 = swift_release();
      MEMORY[0x24BDAC7A8](v52);
      *(&v66 - 6) = a8;
      *(&v66 - 5) = a10;
      v62 = v45;
      v63 = a12;
      v64 = a5;
      v65 = v71;
      v53 = (uint64_t)v75;
      sub_23828E824((void (*)(char *, char *))sub_2382D0358, (uint64_t)(&v66 - 8), MEMORY[0x24BEE4078], v76, v54, v77);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v80 + 8))(v48, v53);
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v77, 1, 1, v76);
    }
  }
}

uint64_t sub_2383459AC@<X0>(int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t, uint64_t, uint64_t)@<X3>, unsigned int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  void (*v18)(uint64_t, uint64_t, uint64_t);
  _QWORD *v19;

  v18 = (void (*)(uint64_t, uint64_t, uint64_t))nullsub_1(a3 + 16, a3 + 32, a8, a11, a12);
  return sub_238345A58(v18, v19, a5, a1, a2, a6, a7, a3, a9, a4, a8, a10, a11, a12);
}

uint64_t sub_238345A58@<X0>(void (*a1)(uint64_t, uint64_t, uint64_t)@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, int *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, void (*a10)(uint64_t, uint64_t, uint64_t), uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int8x8_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  uint8x8_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t, uint64_t);
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  int v52;
  uint64_t v53;
  uint8x8_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  void (*v68)(uint64_t, _QWORD *);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BYTE *v72;
  uint64_t v73;
  uint64_t v74;
  _BYTE *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE *v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  _BYTE *v94;
  uint64_t v95;
  uint64_t v96;
  void (*v97)(uint64_t, uint64_t, uint64_t);
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;

  v92 = a8;
  v95 = a6;
  v96 = a7;
  v102 = a5;
  v103 = a9;
  v97 = a1;
  v100 = a13;
  v17 = type metadata accessor for _HashNode.Builder(255, a11, a12, a14);
  v18 = sub_23835B334();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v101 = v17;
  v22 = MEMORY[0x24BDAC7A8](v21);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v85 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = *(_QWORD *)(a11 - 8);
  v29 = MEMORY[0x24BDAC7A8](v25);
  v40 = (char *)&v85 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98 = a2;
  v41 = a3;
  v42 = (*a2 >> a3) & 0x1FLL;
  v43 = *a4;
  v44 = 1 << (*a2 >> a3);
  if ((v44 & *a4) != 0)
  {
    v92 = v31;
    v93 = v42;
    v94 = v34;
    v99 = v35;
    v38.i32[0] = (v44 - 1) & v43;
    v45 = (uint8x8_t)vcnt_s8(v38);
    v45.i16[0] = vaddlv_u8(v45);
    LODWORD(v91) = v45.i32[0];
    v46 = v102;
    v102 = v36;
    v47 = _HashNode.UnsafeHandle.itemPtr(at:)(v45.u32[0], (uint64_t)a4, v46);
    v48 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 16);
    v48(v40, v47, a11);
    v49 = sub_238358A4C();
    v50 = *(void (**)(char *, uint64_t))(v28 + 8);
    v50(v40, a11);
    v48(v40, v47, a11);
    LOBYTE(v47) = _HashNode.UnsafeHandle.find(_:_:_:)(v41, (uint64_t)v40, v49, (uint64_t)v97, (uint64_t)v98, a11, v100, a14);
    v50(v40, a11);
    if (v47 == 2)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v99 + 56))(v103, 1, 1, v101);
    }
    else
    {
      v70 = v41;
      v71 = v102;
      v72 = v94;
      _HashNode._removingItemFromLeaf(_:at:_:)((uint64_t)v40, (uint64_t)v27, (uint64_t)v94, v70, v93, v91, v95, v96, a11, v102, a14);
      (*(void (**)(char *, uint64_t))(v92 + 8))(v27, v71);
      v50(v40, a11);
      v73 = v99;
      v74 = v103;
      v75 = v72;
      v76 = v101;
      (*(void (**)(uint64_t, _BYTE *, uint64_t))(v99 + 32))(v103, v75, v101);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v73 + 56))(v74, 0, 1, v76);
    }
  }
  else
  {
    v52 = a4[1];
    if ((v52 & v44) != 0)
    {
      v53 = a3;
      v89 = v32;
      v90 = v33;
      v93 = v42;
      v94 = v34;
      v97 = a10;
      v98 = (_QWORD *)v29;
      v38.i32[0] = v52 & (v44 - 1);
      v54 = (uint8x8_t)vcnt_s8(v38);
      v54.i16[0] = vaddlv_u8(v54);
      v88 = v54.i32[0];
      v55 = v37;
      v91 = v37;
      v56 = v30;
      v57 = v36;
      v99 = v35;
      v58 = v19;
      v59 = (uint64_t *)_HashNode.UnsafeHandle.subscript.unsafeAddressor(v54.u32[0], a4, v102, a11, v36, a14);
      v60 = *v59;
      v61 = v59[1];
      v86 = v53;
      swift_retain();
      v87 = a14;
      v62 = v99;
      v102 = v57;
      _HashNode._subtracting<A>(_:_:)((v53 + 5), v92, v97, v60, v61, a11, v57, v100, a14);
      swift_release();
      v100 = v58;
      (*(void (**)(uint64_t, uint64_t, _QWORD *))(v58 + 16))(v56, v55, v98);
      v63 = v62;
      v64 = v56;
      v65 = v101;
      v66 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v56, 1, v101);
      v67 = v103;
      if (v66 == 1)
      {
        v68 = *(void (**)(uint64_t, _QWORD *))(v100 + 8);
        v69 = (uint64_t)v98;
        v68(v91, v98);
        v68(v56, (_QWORD *)v69);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v63 + 56))(v67, 1, 1, v65);
      }
      else
      {
        v97 = *(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 32);
        v77 = v86;
        v78 = v90;
        v97(v90, v64, v65);
        v79 = v94;
        v80 = v77;
        v81 = v63;
        v82 = v93;
        _HashNode._removingChild(_:at:_:)(v77, v93, v88, v95, v96, a11, v102, v87, v94);
        v83 = v89;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v81 + 16))(v89, v78, v65);
        _HashNode.Builder.addNewChildBranch(_:_:at:)(v80, v83, v82, v65);
        (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v78, v65);
        (*(void (**)(uint64_t, _QWORD *))(v100 + 8))(v91, v98);
        v84 = v103;
        v97(v103, (uint64_t)v79, v65);
        return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v81 + 56))(v84, 0, 1, v65);
      }
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56))(v103, 1, 1, v101);
    }
  }
}

uint64_t Heap.init(arrayLiteral:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;

  v5 = a1;
  v3 = sub_23835B0D0();
  MEMORY[0x23B831670](MEMORY[0x24BEE12C8], v3);
  return Heap.init<A>(_:)((uint64_t)&v5, a2, v3);
}

uint64_t sub_238346050@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;

  result = Heap.init(arrayLiteral:)(a1, *(_QWORD *)(a2 + 16));
  *a3 = result;
  return result;
}

BOOL OrderedSet.isStrictSuperset(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;

  v10 = _s19CollectionsInternal4HeapV5countSivg_0();
  return _s19CollectionsInternal4HeapV5countSivg_0() < v10 && OrderedSet.isSubset(of:)(a3, a4, a1, a2, a5);
}

uint64_t OrderedSet.isStrictSuperset(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v7 = _s19CollectionsInternal4HeapV5countSivg_0();
  if (sub_23835B10C() >= v7)
  {
    v10 = 0;
  }
  else
  {
    v9 = type metadata accessor for OrderedSet(0, a4, a5, v8);
    MEMORY[0x23B831670](&protocol conformance descriptor for OrderedSet<A>, v9);
    v10 = sub_23835B13C();
  }
  return v10 & 1;
}

uint64_t OrderedSet.isStrictSuperset<A>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
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
  uint64_t result;
  char v37;
  char v38;
  uint64_t v39;
  char *v40;
  char v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52[3];

  v13 = *(_QWORD *)(a4 - 8);
  v46 = a7;
  v47 = v13;
  v14 = MEMORY[0x24BDAC7A8](a1);
  v49 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v43 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v43 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v50 = (char *)&v43 - v23;
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v43 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (type metadata accessor for OrderedSet(0, v28, v29, v28) == a5)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, a1, a5);
    swift_dynamicCast();
    v37 = OrderedSet.isStrictSuperset(of:)(v52[0], v52[1], a2, a3, a4);
    goto LABEL_9;
  }
  v51 = a1;
  v48 = a2;
  if (sub_23835B148() == a5)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, v51, a5);
    swift_dynamicCast();
    v37 = OrderedSet.isStrictSuperset(of:)(v52[0], v48, a3, a4, a6);
    swift_bridgeObjectRelease();
    return v37 & 1;
  }
  v45 = *(_QWORD *)(a3 + 16);
  if (!v45)
  {
LABEL_20:
    v37 = 0;
    return v37 & 1;
  }
  v30 = a3;
  swift_retain();
  swift_retain();
  sub_23835B724();
  v31 = v47;
  v44 = *(void (**)(char *, char *, uint64_t))(v47 + 32);
  v44(v50, v21, a4);
  v32 = v51;
  v33 = v46;
  v34 = sub_23835AFB0();
  if (v34 != 2)
  {
    v38 = v34;
    v43 = (uint64_t)&v43;
    MEMORY[0x24BDAC7A8](v34);
    *(&v43 - 6) = a4;
    *(&v43 - 5) = a5;
    *(&v43 - 4) = a6;
    *(&v43 - 3) = v33;
    *(&v43 - 2) = v48;
    *(&v43 - 1) = v30;
    if ((sub_23835AFC8() & 1) != 0)
    {
      if ((v38 & 1) == 0)
      {
        (*(void (**)(char *, uint64_t))(v31 + 8))(v50, a4);
LABEL_18:
        swift_release();
        swift_release();
        v37 = 1;
        return v37 & 1;
      }
      v39 = 1;
      while (v45 != v39)
      {
        v40 = v49;
        sub_23835B724();
        ++v39;
        v44(v18, v40, a4);
        v41 = sub_23835B034();
        v42 = *(void (**)(char *, uint64_t))(v31 + 8);
        v42(v18, a4);
        if ((v41 & 1) == 0)
        {
          v42(v50, a4);
          goto LABEL_18;
        }
      }
    }
    (*(void (**)(char *, uint64_t))(v31 + 8))(v50, a4);
    swift_release();
    swift_release();
    goto LABEL_20;
  }
  v35 = _s19CollectionsInternal4HeapV5countSivg_0();
  result = MEMORY[0x24BDAC7A8](v35);
  *(&v43 - 8) = a4;
  *(&v43 - 7) = a5;
  *(&v43 - 6) = a6;
  *(&v43 - 5) = v33;
  *(&v43 - 4) = v32;
  *(&v43 - 3) = v48;
  *(&v43 - 2) = v30;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    LOBYTE(v52[0]) = 2;
    result = (uint64_t)sub_238329EE0((unint64_t)(result + 63) >> 6, v52, (_QWORD *(*)(char *__return_ptr, _BYTE **))sub_23834691C);
    if (LOBYTE(v52[0]) != 2)
    {
      v37 = v52[0] & 1;
      (*(void (**)(char *, uint64_t))(v31 + 8))(v50, a4);
LABEL_9:
      swift_release();
      swift_release();
      return v37 & 1;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_238346624@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, BOOL *a8@<X8>)
{
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t AssociatedTypeWitness;
  uint64_t v20;
  char *v21;
  uint64_t AssociatedConformanceWitness;
  uint64_t v23;
  unsigned int (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t result;
  BOOL v27;
  void (*v28)(char *, char *, uint64_t);
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v35 = a8;
  v39 = a3;
  v40 = a7;
  v42 = a4;
  v41 = a2;
  v38 = a1;
  v36 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23835B334();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v33 - v14;
  v16 = *(_QWORD *)(a6 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v34 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v21 = (char *)&v33 - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v41, a6);
  sub_23835AF8C();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v41 = AssociatedTypeWitness;
  v37 = AssociatedConformanceWitness;
  sub_23835B484();
  v23 = v36;
  v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
  v25 = 0;
  if (v24(v15, 1, a5) == 1)
  {
LABEL_2:
    (*(void (**)(char *, uint64_t))(v34 + 8))(v21, v41);
    result = _s19CollectionsInternal4HeapV5countSivg_0();
    v27 = v25 < result;
LABEL_14:
    *v35 = v27;
  }
  else
  {
    v25 = 0;
    v28 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
    v28(v11, v15, a5);
    while (1)
    {
      result = OrderedSet._find(_:)();
      if ((v29 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t))(v23 + 8))(v11, a5);
LABEL_13:
        result = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v21, v41);
        v27 = 0;
        goto LABEL_14;
      }
      if (result < 0)
        break;
      v30 = ((unint64_t)result >> 3) & 0x1FFFFFFFFFFFFFF8;
      v31 = *(_QWORD *)(*v38 + v30);
      *(_QWORD *)(*v38 + v30) = v31 | (1 << result);
      if ((v31 & (1 << result)) != 0)
      {
        (*(void (**)(char *, uint64_t))(v23 + 8))(v11, a5);
      }
      else
      {
        ++v25;
        v32 = _s19CollectionsInternal4HeapV5countSivg_0();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v11, a5);
        if (v25 == v32)
          goto LABEL_13;
      }
      sub_23835B484();
      if (v24(v15, 1, a5) == 1)
        goto LABEL_2;
      v28(v11, v15, a5);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23834691C@<X0>(_QWORD *a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t *v2;

  return sub_238346624(a1, v2[6], v2[7], v2[8], v2[2], v2[3], v2[4], a2);
}

uint64_t BitSet.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t i;
  _BYTE v7[24];
  uint64_t v8;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23835BAA8();
  v4 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    for (i = 0; i != v4; ++i)
    {
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
      sub_23835B8EC();
      if (v2)
        break;
    }
    swift_bridgeObjectRelease();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

int64_t BitSet.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  int64_t v3;
  uint64_t v4;
  char v5;
  char *v6;
  _QWORD v8[4];

  v3 = (int64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23835BA84();
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1(v8, v8[3]);
    v4 = sub_23835B8A4();
    v6 = sub_2382C7250(v8, v4, v5 & 1);
    v3 = _s19CollectionsInternal6BitSetV6_wordsACSayAA07_UnsafecD0V5_WordVG_tcfC_0((int64_t)v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t sub_238346AE8@<X0>(_QWORD *a1@<X0>, int64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  char v6;
  char *v7;
  int64_t v8;
  uint64_t result;
  _QWORD v10[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23835BA84();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  v5 = sub_23835B8A4();
  v7 = sub_2382C7250(v10, v5, v6 & 1);
  v8 = _s19CollectionsInternal6BitSetV6_wordsACSayAA07_UnsafecD0V5_WordVG_tcfC_0((int64_t)v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *a2 = v8;
  return result;
}

uint64_t sub_238346BC4(_QWORD *a1)
{
  uint64_t *v1;

  return BitSet.encode(to:)(a1, *v1);
}

uint64_t static OrderedSet._UnstableInternals.isConsistencyCheckingEnabled.getter()
{
  return 0;
}

char *OrderedSet._UnstableInternals.hashTableContents.getter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  char *v3;

  if (!a1)
    return (char *)MEMORY[0x24BEE4AF8];
  v1 = (_QWORD *)(a1 + 16);
  v2 = a1 + 32;
  swift_retain();
  v3 = sub_2382BA16C(v1, v2);
  swift_release();
  return v3;
}

int64_t OrderedSet.init<A>(_scale:bias:contents:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  int64_t result;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v12 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v14, v15);
  v16 = sub_23835B0DC();
  v17 = _s19CollectionsInternal4HeapV5countSivg_0();
  result = _s19CollectionsInternal10_HashTableV5scale11forCapacityS2i_tFZ_0(v17);
  if ((a2 & 0x8000000000000000) != 0 || a1 > 56 || result > a1)
  {
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v19 = 1;
  if (a1)
  {
    v19 = (1 << a1) - 1;
    if (__OFSUB__(1 << a1, 1))
      goto LABEL_24;
  }
  if (v19 <= a2)
    goto LABEL_20;
  if (a1 <= 4 && a2)
    goto LABEL_25;
  v24 = a3;
  if (a1 <= 5)
    v20 = 5;
  else
    v20 = a1;
  v21 = _s19CollectionsInternal10_HashTableV5scale13reservedScaleACSi_SitcfC_0(v20, 0);
  swift_beginAccess();
  _HashTable.Header.bias.setter(a2);
  result = sub_238346E58((_QWORD *)(v21 + 16), v21 + 32, v16, a4, a5, a6);
  if ((result & 1) == 0)
    goto LABEL_21;
  if (a1 >= 5)
  {
    swift_retain();
    v22 = v21;
  }
  else
  {
    v22 = 0;
  }
  v23 = OrderedSet.init(_uniqueElements:_:)(v16, v22);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v24, a5);
  result = OrderedSet._scale.getter(v23);
  if (result == a1)
  {
    result = OrderedSet._bias.getter(v23);
    if (result == a2)
      return v23;
    goto LABEL_23;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_238346E58(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v12 = a3;
  v9 = sub_23835B6E8();
  v10 = MEMORY[0x23B831670](MEMORY[0x24BEE2A58], v9);
  return _HashTable.UnsafeHandle.fill<A>(untilFirstDuplicateIn:)((char *)&v13, (uint64_t)&v12, a1, a2, v9, v10, a6) & 1;
}

uint64_t TreeSet.description.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD v7[3];

  v7[0] = a1;
  v7[1] = a2;
  v7[2] = a3;
  v5 = type metadata accessor for TreeSet(0, a4, a5, a4);
  MEMORY[0x23B831670](&protocol conformance descriptor for TreeSet<A>, v5);
  return _arrayDescription<A>(for:debug:typeName:)((uint64_t)v7, 0, 0, 0, v5);
}

uint64_t sub_238346F40(uint64_t a1, uint64_t a2)
{
  return sub_238346FFC(a1, a2, TreeSet.description.getter);
}

uint64_t TreeSet.debugDescription.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[3];

  v14[0] = a1;
  v14[1] = a2;
  v14[2] = a3;
  v7 = sub_238347014();
  v9 = v8;
  v11 = type metadata accessor for TreeSet(0, a4, a5, v10);
  MEMORY[0x23B831670](&protocol conformance descriptor for TreeSet<A>, v11);
  v12 = _arrayDescription<A>(for:debug:typeName:)((uint64_t)v14, 1, v7, v9, v11);
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_238346FF0(uint64_t a1, uint64_t a2)
{
  return sub_238346FFC(a1, a2, TreeSet.debugDescription.getter);
}

uint64_t sub_238346FFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v3;

  return a3(*v3, v3[1], v3[2], *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t sub_238347014()
{
  sub_23835BB44();
  sub_23835AE90();
  swift_bridgeObjectRelease();
  sub_23835AE90();
  return 0x3C74655365657254;
}

uint64_t TreeDictionary.Values._base.getter()
{
  return swift_retain();
}

uint64_t TreeDictionary.Values._base.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t result;

  result = swift_release();
  *v3 = a1;
  v3[1] = a2;
  v3[2] = a3;
  return result;
}

uint64_t (*TreeDictionary.Values._base.modify())(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t TreeDictionary.values.getter()
{
  return swift_retain();
}

uint64_t TreeDictionary.Values.description.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD v8[3];

  v8[0] = a1;
  v8[1] = a2;
  v8[2] = a3;
  v6 = type metadata accessor for TreeDictionary.Values(0, a4, a5, a6);
  MEMORY[0x23B831670](&protocol conformance descriptor for TreeDictionary<A, B>.Values, v6);
  return _arrayDescription<A>(for:debug:typeName:)((uint64_t)v8, 0, 0, 0, v6);
}

uint64_t type metadata accessor for TreeDictionary.Values(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TreeDictionary.Values);
}

uint64_t sub_23834719C(_QWORD *a1, uint64_t a2)
{
  return sub_2382AC690(a1, a2, TreeDictionary.Values.description.getter);
}

uint64_t TreeDictionary.Values.debugDescription.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[3];

  v15[0] = a1;
  v15[1] = a2;
  v15[2] = a3;
  v13 = sub_238315BAC();
  v14 = v9;
  sub_23835AE90();
  v10 = type metadata accessor for TreeDictionary.Values(0, a4, a5, a6);
  MEMORY[0x23B831670](&protocol conformance descriptor for TreeDictionary<A, B>.Values, v10);
  v11 = _arrayDescription<A>(for:debug:typeName:)((uint64_t)v15, 1, v13, v14, v10);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_23834727C(_QWORD *a1, uint64_t a2)
{
  return sub_2382AC690(a1, a2, TreeDictionary.Values.debugDescription.getter);
}

uint64_t TreeDictionary.Values.Iterator._base.getter@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = type metadata accessor for TreeDictionary.Iterator(0, a1[2], a1[3], a1[4]);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v2, v4);
}

__n128 TreeDictionary.Values.Iterator._base.setter(uint64_t a1)
{
  _OWORD *v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __n128 result;
  _OWORD v11[7];
  _OWORD v12[2];

  v3 = v1[7];
  v11[6] = v1[6];
  v12[0] = v3;
  *(_OWORD *)((char *)v12 + 11) = *(_OWORD *)((char *)v1 + 123);
  v4 = v1[3];
  v11[2] = v1[2];
  v11[3] = v4;
  v5 = v1[5];
  v11[4] = v1[4];
  v11[5] = v5;
  v6 = v1[1];
  v11[0] = *v1;
  v11[1] = v6;
  sub_2382735AC((uint64_t)v11);
  v7 = *(_OWORD *)(a1 + 112);
  v1[6] = *(_OWORD *)(a1 + 96);
  v1[7] = v7;
  *(_OWORD *)((char *)v1 + 123) = *(_OWORD *)(a1 + 123);
  v8 = *(_OWORD *)(a1 + 48);
  v1[2] = *(_OWORD *)(a1 + 32);
  v1[3] = v8;
  v9 = *(_OWORD *)(a1 + 80);
  v1[4] = *(_OWORD *)(a1 + 64);
  v1[5] = v9;
  result = *(__n128 *)(a1 + 16);
  *v1 = *(_OWORD *)a1;
  v1[1] = result;
  return result;
}

uint64_t (*TreeDictionary.Values.Iterator._base.modify())(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

__n128 TreeDictionary.Values.Iterator.init(_base:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 112) = v2;
  *(_OWORD *)(a2 + 123) = *(_OWORD *)(a1 + 123);
  v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v3;
  v4 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v4;
  result = *(__n128 *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t TreeDictionary.Values.Iterator.next()@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t TupleTypeMetadata2;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;

  v5 = a1[2];
  v4 = a1[3];
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v7 = sub_23835B334();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v14 - v9;
  v11 = (_QWORD *)type metadata accessor for TreeDictionary.Iterator(0, v5, v4, a1[4]);
  TreeDictionary.Iterator.next()(v11, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 48))(v10, 1, TupleTypeMetadata2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a2, 1, 1, v4);
  }
  else
  {
    v13 = *(_QWORD *)(v4 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(a2, &v10[*(int *)(TupleTypeMetadata2 + 48)], v4);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(a2, 0, 1, v4);
    return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v10, v5);
  }
}

uint64_t TreeDictionary.Values.makeIterator()@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[7];
  _OWORD v9[2];

  TreeDictionary.makeIterator()(a1, (uint64_t)v8);
  v3 = v9[0];
  a2[6] = v8[6];
  a2[7] = v3;
  *(_OWORD *)((char *)a2 + 123) = *(_OWORD *)((char *)v9 + 11);
  v4 = v8[3];
  a2[2] = v8[2];
  a2[3] = v4;
  v5 = v8[5];
  a2[4] = v8[4];
  a2[5] = v5;
  v6 = v8[1];
  *a2 = v8[0];
  a2[1] = v6;
  return swift_retain();
}

__n128 sub_238347534@<Q0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  _OWORD v7[7];
  _OWORD v8[2];

  TreeDictionary.Values.makeIterator()(*v1, v7);
  swift_release();
  v3 = v8[0];
  *(_OWORD *)(a1 + 96) = v7[6];
  *(_OWORD *)(a1 + 112) = v3;
  *(_OWORD *)(a1 + 123) = *(_OWORD *)((char *)v8 + 11);
  v4 = v7[3];
  *(_OWORD *)(a1 + 32) = v7[2];
  *(_OWORD *)(a1 + 48) = v4;
  v5 = v7[5];
  *(_OWORD *)(a1 + 64) = v7[4];
  *(_OWORD *)(a1 + 80) = v5;
  result = (__n128)v7[1];
  *(_OWORD *)a1 = v7[0];
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2383475AC(uint64_t a1)
{
  MEMORY[0x23B831670](&protocol conformance descriptor for TreeDictionary<A, B>.Values, a1);
  return sub_23835B1F0();
}

uint64_t sub_2383475E0(uint64_t a1)
{
  MEMORY[0x23B831670](&protocol conformance descriptor for TreeDictionary<A, B>.Values, a1);
  return sub_23835B1FC();
}

double TreeDictionary.Values.startIndex.getter@<D0>(uint64_t a1@<X8>)
{
  return sub_2382D3A70((void (*)(__int128 *__return_ptr))TreeDictionary.startIndex.getter, a1);
}

double TreeDictionary.Values.endIndex.getter@<D0>(uint64_t a1@<X8>)
{
  return sub_2382D3A70((void (*)(__int128 *__return_ptr))TreeDictionary.endIndex.getter, a1);
}

uint64_t TreeDictionary.Values.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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
  uint64_t v17;

  v6 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  TreeDictionary.subscript.getter((uint64_t)v8, v9, v10, v11, v12, v13, a5, v15, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a5);
}

__n128 TreeDictionary.Values.index(after:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  __int128 v6;
  uint64_t v7;
  int v8;
  char v9;
  char v10;
  __n128 result;
  _BYTE v12[38];

  v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v12 = *(_OWORD *)a1;
  *(_OWORD *)&v12[16] = v6;
  *(_QWORD *)&v12[30] = *(_QWORD *)(a1 + 30);
  TreeDictionary.formIndex(after:)((uint64_t)v12, a2, a3, a4);
  v7 = *(_QWORD *)&v12[24];
  v8 = *(_DWORD *)&v12[32];
  v9 = v12[36];
  v10 = v12[37];
  result = *(__n128 *)&v12[8];
  *(_QWORD *)a5 = *(_QWORD *)v12;
  *(__n128 *)(a5 + 8) = result;
  *(_QWORD *)(a5 + 24) = v7;
  *(_DWORD *)(a5 + 32) = v8;
  *(_BYTE *)(a5 + 36) = v9;
  *(_BYTE *)(a5 + 37) = v10;
  return result;
}

double TreeDictionary.Values.index(_:offsetBy:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  double result;
  __int128 v7;
  __int128 v8;
  _BYTE v9[22];

  TreeDictionary.index(_:offsetBy:)(a1, a2, a3, a4, (uint64_t)&v8);
  result = *(double *)&v8;
  v7 = *(_OWORD *)v9;
  *(_OWORD *)a5 = v8;
  *(_OWORD *)(a5 + 16) = v7;
  *(_QWORD *)(a5 + 30) = *(_QWORD *)&v9[14];
  return result;
}

uint64_t TreeDictionary.Values.index(_:offsetBy:limitedBy:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  uint64_t v12;
  _BYTE v14[40];

  TreeDictionary.index(_:offsetBy:limitedBy:)(a1, a2, a3, a4, a5, (uint64_t)v14);
  type metadata accessor for TreeDictionary.Index(255, a6, a7, a9);
  v12 = sub_23835B334();
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a8, v14, v12);
}

void sub_2383477F4()
{
  JUMPOUT(0x23B831670);
}

void sub_238347804()
{
  JUMPOUT(0x23B831670);
}

double sub_238347814@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2382D3C8C(a1, (void (*)(__int128 *__return_ptr, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))TreeDictionary.Values.startIndex.getter, a2);
}

double sub_238347820@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2382D3C8C(a1, (void (*)(__int128 *__return_ptr, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))TreeDictionary.Values.endIndex.getter, a2);
}

void (*sub_23834782C(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  uint64_t *v3;
  char *v7;
  __int128 v8;

  v7 = (char *)malloc(0x50uLL);
  *a1 = v7;
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v7 = *(_OWORD *)a2;
  *((_OWORD *)v7 + 1) = v8;
  *(_QWORD *)(v7 + 30) = *(_QWORD *)(a2 + 30);
  *((_QWORD *)v7 + 9) = sub_2383478A8((_QWORD *)v7 + 5, (uint64_t)v7, *v3, v3[1], v3[2], *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
  return sub_2382CB0A8;
}

void (*sub_2383478A8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(_QWORD *a1)
{
  uint64_t v12;

  v12 = *(_QWORD *)(a7 - 8);
  *a1 = a7;
  a1[1] = v12;
  a1[2] = malloc(*(_QWORD *)(v12 + 64));
  TreeDictionary.Values.subscript.getter(a2, a3, a4, a5, a6);
  return sub_2382CB15C;
}

uint64_t sub_238347948(_QWORD *a1)
{
  _QWORD *v1;

  return TreeDictionary.Values.isEmpty.getter(*v1, v1[1], v1[2], a1[2], a1[3], a1[4]);
}

uint64_t sub_238347960(_QWORD *a1)
{
  _QWORD *v1;

  return TreeDictionary.Values.count.getter(*v1, v1[1], v1[2], a1[2], a1[3], a1[4]);
}

double sub_238347978@<D0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  __int128 v5;
  double result;
  __int128 v7;
  __int128 v8;
  _BYTE v9[22];
  __int128 v10;
  _OWORD v11[2];

  v5 = a1[1];
  v10 = *a1;
  v11[0] = v5;
  *(_QWORD *)((char *)v11 + 14) = *(_QWORD *)((char *)a1 + 30);
  TreeDictionary.Values.index(_:offsetBy:)((uint64_t)&v10, a2, *v3, v3[2], (uint64_t)&v8);
  result = *(double *)&v8;
  v7 = *(_OWORD *)v9;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v7;
  *(_QWORD *)(a3 + 30) = *(_QWORD *)&v9[14];
  return result;
}

uint64_t sub_2383479E0@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, _QWORD *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t *v5;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[40];
  __int128 v17;
  _OWORD v18[2];
  __int128 v19;
  _OWORD v20[2];

  v7 = a1[1];
  v17 = *a1;
  v18[0] = v7;
  *(_QWORD *)((char *)v18 + 14) = *(_QWORD *)((char *)a1 + 30);
  v8 = a3[1];
  v19 = *a3;
  v20[0] = v8;
  *(_QWORD *)((char *)v20 + 14) = *(_QWORD *)((char *)a3 + 30);
  v9 = *v5;
  v10 = v5[2];
  v11 = a4[2];
  v12 = a4[3];
  v13 = a4[4];
  TreeDictionary.Values.index(_:offsetBy:limitedBy:)((uint64_t)&v17, a2, (uint64_t)&v19, v9, v10, v11, v12, (uint64_t)v16, v13);
  type metadata accessor for TreeDictionary.Index(255, v11, v12, v13);
  v14 = sub_23835B334();
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a5, v16, v14);
}

uint64_t sub_238347A94(__int128 *a1, __int128 *a2, _QWORD *a3)
{
  _QWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v7;
  _OWORD v8[2];
  __int128 v9;
  _OWORD v10[2];

  v4 = a1[1];
  v7 = *a1;
  v8[0] = v4;
  *(_QWORD *)((char *)v8 + 14) = *(_QWORD *)((char *)a1 + 30);
  v5 = a2[1];
  v9 = *a2;
  v10[0] = v5;
  *(_QWORD *)((char *)v10 + 14) = *(_QWORD *)((char *)a2 + 30);
  return ((uint64_t (*)(__int128 *, __int128 *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))TreeDictionary.Values.distance(from:to:))(&v7, &v9, *v3, v3[1], v3[2], a3[2], a3[3], a3[4]);
}

double sub_238347AEC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  double result;
  __int128 v5;
  __int128 v6;
  _BYTE v7[22];

  TreeDictionary.Values.index(after:)(a1, *v2, v2[1], v2[2], (uint64_t)&v6);
  result = *(double *)&v6;
  v5 = *(_OWORD *)v7;
  *(_OWORD *)a2 = v6;
  *(_OWORD *)(a2 + 16) = v5;
  *(_QWORD *)(a2 + 30) = *(_QWORD *)&v7[14];
  return result;
}

uint64_t sub_238347B40(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;

  return TreeDictionary.Values.formIndex(after:)(a1, *v2, v2[1], v2[2], a2[2], a2[3], a2[4]);
}

uint64_t type metadata accessor for TreeDictionary.Values.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TreeDictionary.Values.Iterator);
}

uint64_t sub_238347B64(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  char v14;
  uint64_t result;
  uint64_t v16;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v5 = sub_23835B2EC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v16 - v8;
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v16 - v11;
  v13 = sub_23835AC8C();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, a2, v5);
  if ((v13 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, AssociatedTypeWitness);
    goto LABEL_5;
  }
  v14 = sub_23835AC74();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, AssociatedTypeWitness);
  if ((v14 & 1) == 0)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t sub_238347D00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char v11;
  void (*v12)(char *, uint64_t, uint64_t);
  char v13;
  void (*v14)(char *, uint64_t);
  uint64_t result;
  void (*v16)(char *, uint64_t);
  uint64_t v17;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v4 = sub_23835B2EC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  v11 = sub_23835AC8C();
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v12(v10, a1, v4);
  v12(v8, a2, v4);
  if ((v11 & 1) == 0)
  {
    v16 = *(void (**)(char *, uint64_t))(v5 + 8);
    v16(v8, v4);
    result = ((uint64_t (*)(char *, uint64_t))v16)(v10, v4);
    goto LABEL_5;
  }
  v13 = sub_23835AC8C();
  v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, v4);
  result = ((uint64_t (*)(char *, uint64_t))v14)(v10, v4);
  if ((v13 & 1) == 0)
LABEL_5:
    __break(1u);
  return result;
}

BOOL BitSet.isSubset(of:)(_QWORD *a1, _QWORD *a2)
{
  unint64_t v2;
  _BOOL8 result;
  uint64_t *v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2[2];
  if (a1[2] < v2)
    return 0;
  if (!v2)
    return 1;
  if ((a2[4] & ~a1[4]) != 0)
    return 0;
  v4 = a2 + 5;
  v5 = a1 + 5;
  v6 = v2 - 1;
  do
  {
    result = v6 == 0;
    if (!v6)
      break;
    v8 = *v4++;
    v7 = v8;
    v9 = *v5++;
    --v6;
  }
  while ((v7 & ~v9) == 0);
  return result;
}

unint64_t BitSet.isSubset(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;

  if (a2 <= 0)
    v3 = 0;
  else
    v3 = a1 & ~(a1 >> 63);
  return _UnsafeBitSet.isSubset(of:)(v3, a2 & ~(a2 >> 63), (_QWORD *)(a3 + 32), *(_QWORD *)(a3 + 16));
}

uint64_t BitSet.isSubset<A>(of:)(uint64_t a1, char *a2, ValueMetadata *a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (**Description)(char *, _QWORD, ValueMetadata *);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t result;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  int64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  int64_t v31;
  int64_t v33;
  int64_t v34;
  uint64_t v35;
  int64_t v36;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  unint64_t v42;
  char *v43;
  unint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = (char *)&v53 - v9;
  Description = (void (**)(char *, _QWORD, ValueMetadata *))a3[-1].Description;
  v12 = MEMORY[0x24BDAC7A8](v8);
  v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v53 - v15;
  if (a3 == &type metadata for BitSet)
  {
    Description[2]((char *)&v53 - v15, a1, &type metadata for BitSet);
LABEL_45:
    swift_dynamicCast();
    v41 = BitSet.isSubset(of:)((_QWORD *)v55, a2);
    swift_bridgeObjectRelease();
    return v41 & 1;
  }
  if (a3 == &type metadata for BitSet.Counted)
  {
    Description[2]((char *)&v53 - v15, a1, &type metadata for BitSet.Counted);
    goto LABEL_45;
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2568F0BA0);
  if ((ValueMetadata *)result == a3)
  {
    Description[2](v14, a1, a3);
    swift_dynamicCast();
    if (v56 <= 0)
      v42 = 0;
    else
      v42 = v55 & ~(v55 >> 63);
    v41 = _UnsafeBitSet.isSubset(of:)(v42, v56 & ~(v56 >> 63), (_QWORD *)a2 + 4, *((_QWORD *)a2 + 2));
    return v41 & 1;
  }
  v18 = *((_QWORD *)a2 + 2);
  if (!v18)
    goto LABEL_77;
  v54 = a2 + 32;
  v19 = *((_QWORD *)a2 + 4);
  if (!v19)
  {
    if (v18 > 1)
    {
      v49 = *((_QWORD *)a2 + 5);
      if (v49)
      {
        v53 = v7;
        v20 = 1;
        v50 = 64;
      }
      else
      {
        v51 = 0;
        v52 = v18 - 2;
        v50 = 64;
        do
        {
          if (v52 == v51)
            goto LABEL_77;
          v49 = *(_QWORD *)&a2[8 * v51++ + 48];
          v50 += 64;
        }
        while (!v49);
        if (v50 < 0)
          goto LABEL_85;
        v53 = v7;
        v20 = v51 + 1;
      }
      v22 = (v49 - 1) & v49;
      v21 = (_QWORD *)(__clz(__rbit64(v49)) + v50);
      goto LABEL_7;
    }
LABEL_77:
    v41 = 1;
    return v41 & 1;
  }
  v53 = v7;
  v20 = 0;
  v21 = (_QWORD *)__clz(__rbit64(v19));
  v22 = (v19 - 1) & v19;
LABEL_7:
  v55 = (uint64_t)v21;
  swift_bridgeObjectRetain();
  result = sub_23835AFB0();
  if (result != 2)
  {
    if ((result & 1) == 0)
    {
LABEL_70:
      swift_bridgeObjectRelease();
      v41 = 0;
      return v41 & 1;
    }
    v43 = v54;
    while (1)
    {
      if (v22)
      {
        if (v20 << 6 < 0)
          goto LABEL_81;
        v44 = __rbit64(v22);
        v22 &= v22 - 1;
        v45 = (_QWORD *)((v20 << 6) | __clz(v44));
      }
      else
      {
        v46 = v20 + 1;
        if (__OFADD__(v20, 1))
          goto LABEL_82;
        v47 = *((_QWORD *)a2 + 2);
        if (v46 >= v47)
          goto LABEL_79;
        v48 = *(_QWORD *)&v43[8 * v46];
        if (!v48)
        {
          while (1)
          {
            v20 = v46 + 1;
            if (__OFADD__(v46, 1))
              break;
            if (v20 >= v47)
              goto LABEL_79;
            v48 = *(_QWORD *)&v43[8 * v20];
            ++v46;
            if (v48)
              goto LABEL_64;
          }
          __break(1u);
LABEL_81:
          __break(1u);
LABEL_82:
          __break(1u);
LABEL_83:
          __break(1u);
LABEL_84:
          __break(1u);
LABEL_85:
          __break(1u);
LABEL_86:
          __break(1u);
LABEL_87:
          __break(1u);
LABEL_88:
          __break(1u);
LABEL_89:
          __break(1u);
          return result;
        }
        ++v20;
LABEL_64:
        if (v20 << 6 < 0)
          goto LABEL_84;
        v22 = (v48 - 1) & v48;
        v45 = (_QWORD *)(__clz(__rbit64(v48)) + (v20 << 6));
      }
      v55 = (uint64_t)v45;
      result = sub_23835B034();
      if ((result & 1) == 0)
        goto LABEL_70;
    }
  }
  swift_bridgeObjectRelease();
  Description[2](v16, a1, a3);
  swift_bridgeObjectRetain();
  sub_23835AF8C();
  swift_getAssociatedConformanceWitness();
  v23 = v53;
  while (1)
  {
    while (1)
    {
      sub_23835B484();
      if ((v56 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t))(v23 + 8))(v10, AssociatedTypeWitness);
        goto LABEL_70;
      }
      v24 = v55;
      if ((v55 & 0x8000000000000000) == 0)
      {
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_23826C260((uint64_t)a2);
          a2 = (char *)result;
        }
        v25 = *((_QWORD *)a2 + 2);
        if (v24 >> 6 < v25)
        {
          v26 = a2 + 32;
          v27 = 8 * (v24 >> 6);
          v28 = *(_QWORD *)&a2[v27 + 32];
          *(_QWORD *)&a2[v27 + 32] = v28 & ~(1 << v24);
          if ((v28 & (1 << v24)) != 0)
            break;
        }
      }
    }
    v29 = v25 - 1;
    v30 = v25 - 1;
    if (!*(_QWORD *)&v26[8 * v25 - 8])
    {
      v30 = v25 - 2;
      if ((unint64_t)v25 < 2)
        goto LABEL_17;
      if (!*(_QWORD *)&v26[8 * v30])
      {
        v31 = v25;
        while (v31 - 2 >= 1)
        {
          if (*(_QWORD *)&a2[8 * v31-- + 8])
          {
            v30 = v31 - 2;
            goto LABEL_23;
          }
        }
LABEL_17:
        v30 = -1;
      }
    }
LABEL_23:
    v33 = v29 - v30;
    if (v29 - v30 >= 1)
    {
      v34 = v25 - v33;
      if (v25 < v33)
        goto LABEL_86;
      if (v25 < v34)
        goto LABEL_87;
      if (v34 < 0)
        goto LABEL_88;
      v35 = v23;
      v36 = v25 - v33;
      if (__OFADD__(v25, v30 - v29))
        goto LABEL_89;
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)isUniquelyReferenced_nonNull_native || v36 > *((_QWORD *)a2 + 3) >> 1)
      {
        if (v25 <= v36)
          v38 = v25 - v33;
        else
          v38 = v25;
        a2 = sub_23826C3AC(isUniquelyReferenced_nonNull_native, v38, 1, a2);
      }
      v23 = v35;
      result = (uint64_t)memmove(&a2[8 * v34 + 32], &a2[8 * v25 + 32], 8 * (*((_QWORD *)a2 + 2) - v25));
      v25 = *((_QWORD *)a2 + 2) - v33;
      *((_QWORD *)a2 + 2) = v25;
    }
    if (!v25)
      break;
    if (!*((_QWORD *)a2 + 4))
    {
      if (v25 == 1)
        break;
      v39 = 5;
      while (!*(_QWORD *)&a2[8 * v39])
      {
        v40 = v39 - 3;
        if (__OFADD__(v39 - 4, 1))
          goto LABEL_83;
        ++v39;
        if (v40 == v25)
          goto LABEL_78;
      }
    }
  }
LABEL_78:
  (*(void (**)(char *, uint64_t))(v23 + 8))(v10, AssociatedTypeWitness);
LABEL_79:
  swift_bridgeObjectRelease();
  v41 = 1;
  return v41 & 1;
}

BOOL BitSet.isSubset(of:)(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  return BitSet.isSubset(of:)(a1, a3);
}

BOOL BitSet.isEqualSet(to:)(_QWORD *a1, _QWORD *a2)
{
  return _s19CollectionsInternal6BitSetV2eeoiySbAC_ACtFZ_0(a2, a1);
}

unint64_t BitSet.isEqualSet(to:)(unint64_t a1, unint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000) != 0 || (a2 & 0x8000000000000000) != 0)
    return 0;
  else
    return _UnsafeBitSet.isEqualSet(to:)(a1, a2, (_QWORD *)(a3 + 32), *(_QWORD *)(a3 + 16));
}

uint64_t BitSet.isEqualSet<A>(to:)(uint64_t a1, int8x8_t *a2, ValueMetadata *a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (**Description)(char *, _QWORD, ValueMetadata *);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char v22;
  _QWORD *v23;
  int8x8_t *v24;
  uint64_t result;
  void (*v26)(char *, uint64_t, ValueMetadata *);
  int8x8_t *v27;
  int8x8_t v28;
  uint64_t v29;
  uint64_t v30;
  int8x8_t *v31;
  uint8x8_t v32;
  BOOL v33;
  char v34;
  char *v35;
  uint64_t v36;
  int8x8_t *v37;
  int8x8_t *v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  BOOL v42;
  uint64_t v43;
  int8x8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint8x8_t v48;
  int8x8_t v49;
  uint64_t v50;
  uint64_t v51;
  int8x8_t *v52;
  uint8x8_t v53;
  uint64_t v54;
  uint64_t v55;
  int8x8_t *v56;
  int8x8_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int8x8_t *v61;
  uint8x8_t v62;
  uint64_t v63;
  uint8x8_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int8x8_t *v68;
  char *v69;
  unint64_t v70;
  unint64_t v71;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v66 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v67 = AssociatedTypeWitness;
  v7 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v66 - v11;
  Description = (void (**)(char *, _QWORD, ValueMetadata *))a3[-1].Description;
  v14 = MEMORY[0x24BDAC7A8](v10);
  v16 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v66 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v66 - v20;
  if (a3 == &type metadata for BitSet)
  {
    Description[2]((char *)&v66 - v20, a1, &type metadata for BitSet);
    swift_dynamicCast();
    v23 = (_QWORD *)v70;
    v24 = a2;
LABEL_8:
    v22 = _s19CollectionsInternal6BitSetV2eeoiySbAC_ACtFZ_0(v24, v23);
    swift_bridgeObjectRelease();
    return v22 & 1;
  }
  v68 = a2;
  if (a3 == &type metadata for BitSet.Counted)
  {
    Description[2]((char *)&v66 - v20, a1, &type metadata for BitSet.Counted);
    swift_dynamicCast();
    v23 = (_QWORD *)v70;
    v24 = v68;
    goto LABEL_8;
  }
  if ((ValueMetadata *)__swift_instantiateConcreteTypeFromMangledName(&qword_2568F0BA0) == a3)
  {
    Description[2](v19, a1, a3);
    swift_dynamicCast();
    v22 = 0;
    if ((v70 & 0x8000000000000000) == 0 && (v71 & 0x8000000000000000) == 0)
      v22 = _UnsafeBitSet.isEqualSet(to:)(v70, v71, &v68[4], *(_QWORD *)&v68[2]);
    return v22 & 1;
  }
  if ((BitSet.isEmpty.getter((uint64_t)v68) & 1) != 0)
  {
    v22 = sub_23835AFC8();
    return v22 & 1;
  }
  v26 = Description[2];
  v26(v16, a1, a3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568F0D00);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v70);
    result = sub_23835AFA4();
    v27 = v68 + 4;
    v28 = v68[2];
    if (v28)
    {
      v29 = 0;
      v30 = 8 * *(_QWORD *)&v28;
      v31 = v68 + 4;
      while (1)
      {
        v32 = (uint8x8_t)vcnt_s8(*v31);
        v32.i16[0] = vaddlv_u8(v32);
        v33 = __OFADD__(v29, v32.u32[0]);
        v29 += v32.u32[0];
        if (v33)
          break;
        ++v31;
        v30 -= 8;
        if (!v30)
        {
          if (v29 < result)
            goto LABEL_51;
          goto LABEL_52;
        }
      }
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }
    if (result <= 0)
    {
LABEL_52:
      v26(v21, a1, a3);
      sub_23835AF8C();
      v54 = v67;
      swift_getAssociatedConformanceWitness();
      sub_23835B484();
      if ((v71 & 1) == 0)
      {
        v55 = 0;
        v65 = v70;
        v56 = v68;
        while ((v65 & 0x8000000000000000) == 0
             && v65 >> 6 < *(_QWORD *)&v56[2]
             && ((*(_QWORD *)&v27[v65 >> 6] >> v65) & 1) != 0)
        {
          ++v55;
          sub_23835B484();
          v65 = v70;
          if ((v71 & 1) != 0)
            goto LABEL_54;
        }
        (*(void (**)(char *, uint64_t))(v66 + 8))(v12, v54);
        v22 = 0;
        return v22 & 1;
      }
      v55 = 0;
      v56 = v68;
LABEL_54:
      result = (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v12, v54);
      v57 = v56[2];
      if (!*(_QWORD *)&v57)
      {
        if (v55 <= 0)
        {
          v63 = 0;
LABEL_78:
          v22 = v55 == v63;
          return v22 & 1;
        }
        goto LABEL_87;
      }
      v58 = 0;
      v59 = 8 * *(_QWORD *)&v57;
      v60 = v59;
      v61 = v27;
      while (1)
      {
        v62 = (uint8x8_t)vcnt_s8(*v61);
        v62.i16[0] = vaddlv_u8(v62);
        v33 = __OFADD__(v58, v62.u32[0]);
        v58 += v62.u32[0];
        if (v33)
          break;
        ++v61;
        v60 -= 8;
        if (!v60)
        {
          if (v58 < v55)
            goto LABEL_86;
          v63 = 0;
          while (1)
          {
            v64 = (uint8x8_t)vcnt_s8(*v27);
            v64.i16[0] = vaddlv_u8(v64);
            v33 = __OFADD__(v63, v64.u32[0]);
            v63 += v64.u32[0];
            if (v33)
              goto LABEL_84;
            ++v27;
            v59 -= 8;
            if (!v59)
              goto LABEL_78;
          }
        }
      }
LABEL_83:
      __break(1u);
LABEL_84:
      __break(1u);
LABEL_85:
      __break(1u);
LABEL_86:
      __break(1u);
LABEL_87:
      __break(1u);
LABEL_88:
      __break(1u);
      goto LABEL_89;
    }
LABEL_51:
    v22 = 0;
    return v22 & 1;
  }
  result = (uint64_t)sub_23826B050(v68);
  if ((v34 & 1) == 0)
  {
    v35 = sub_23826C3AC(0, ((result & (unint64_t)~(result >> 63)) + 64) >> 6, 0, MEMORY[0x24BEE4AF8]);
    v69 = v35;
    v26(v21, a1, a3);
    sub_23835AF8C();
    v36 = v67;
    swift_getAssociatedConformanceWitness();
    result = sub_23835B484();
    v37 = v68;
    if ((v71 & 1) != 0)
    {
LABEL_22:
      if (!v35)
        goto LABEL_71;
    }
    else
    {
      v38 = v68 + 4;
      while ((v70 & 0x8000000000000000) == 0)
      {
        v39 = v70 >> 6;
        if (v70 >> 6 >= *(_QWORD *)&v37[2])
          break;
        v40 = 1 << v70;
        if ((*(_QWORD *)&v38[v39] & (1 << v70)) == 0)
          break;
        if (!v35)
          goto LABEL_88;
        v35 = v69;
        v41 = *((_QWORD *)v69 + 2);
        v42 = v39 >= v41;
        v43 = v39 - v41;
        if (v42)
        {
          if (v43 < -1)
            goto LABEL_85;
          sub_23829E648(v43 + 1, 0);
          v35 = v69;
        }
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_23826C260((uint64_t)v35);
          v35 = (char *)result;
        }
        v44 = (int8x8_t *)(v35 + 32);
        *(_QWORD *)&v35[8 * v39 + 32] |= v40;
        v69 = v35;
        v45 = *((_QWORD *)v35 + 2);
        if (v45)
        {
          v46 = 0;
          v47 = 8 * v45;
          do
          {
            v48 = (uint8x8_t)vcnt_s8(*v44);
            v48.i16[0] = vaddlv_u8(v48);
            v33 = __OFADD__(v46, v48.u32[0]);
            v46 += v48.u32[0];
            if (v33)
            {
LABEL_81:
              __break(1u);
              goto LABEL_82;
            }
            ++v44;
            v47 -= 8;
          }
          while (v47);
          v49 = v37[2];
          if (v49)
            goto LABEL_44;
          if (!v46)
          {
LABEL_70:
            swift_bridgeObjectRelease();
            v69 = 0;
LABEL_71:
            while (1)
            {
              sub_23835B484();
              if ((v71 & 1) != 0)
                break;
              if ((v70 & 0x8000000000000000) != 0
                || v70 >> 6 >= *(_QWORD *)&v37[2]
                || ((*(_QWORD *)&v37[(v70 >> 6) + 4] >> v70) & 1) == 0)
              {
                goto LABEL_23;
              }
            }
            (*(void (**)(char *, uint64_t))(v66 + 8))(v9, v36);
            swift_bridgeObjectRelease();
            v22 = 1;
            return v22 & 1;
          }
        }
        else
        {
          v49 = v37[2];
          if (!*(_QWORD *)&v49)
            goto LABEL_70;
          v46 = 0;
LABEL_44:
          v50 = 0;
          v51 = 8 * *(_QWORD *)&v49;
          v52 = v37 + 4;
          do
          {
            v53 = (uint8x8_t)vcnt_s8(*v52);
            v53.i16[0] = vaddlv_u8(v53);
            v33 = __OFADD__(v50, v53.u32[0]);
            v50 += v53.u32[0];
            if (v33)
            {
              __break(1u);
              goto LABEL_81;
            }
            ++v52;
            v51 -= 8;
          }
          while (v51);
          if (v46 == v50)
            goto LABEL_70;
        }
        result = sub_23835B484();
        if ((v71 & 1) != 0)
          goto LABEL_22;
      }
    }
LABEL_23:
    (*(void (**)(char *, uint64_t))(v66 + 8))(v9, v36);
    swift_bridgeObjectRelease();
    goto LABEL_51;
  }
LABEL_89:
  __break(1u);
  return result;
}

BOOL BitSet.isEqualSet(to:)(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  return _s19CollectionsInternal6BitSetV2eeoiySbAC_ACtFZ_0(a3, a1);
}

uint64_t _HashNode.mapValuesToVoid(copy:extraBytes:)(uint64_t a1, Swift::Int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[8];

  v12 = MEMORY[0x24BEE4AE0];
  v13 = MEMORY[0x24BEE4AE0] + 8;
  if (a6 != MEMORY[0x24BEE4AE0] + 8)
  {
    MEMORY[0x24BDAC7A8](a1);
    v19[2] = a5;
    v19[3] = v14;
    v19[4] = a7;
    _HashNode.mapValues<A>(_:)((void (*)(char *, char *))sub_2382D33A8, (uint64_t)v19, a3, a4, a5, v14, v13, a7);
    a3 = v15;
    a4 = v16;
    if (_HashNode.hasFreeSpace(_:)(a2))
      return a3;
    goto LABEL_8;
  }
  if ((a1 & 1) != 0 || !_HashNode.hasFreeSpace(_:)(a2))
  {
    swift_retain();
LABEL_8:
    v17 = _HashNode.copy(withFreeSpace:)(a2, a3, a4, a5, v12 + 8, a7);
    swift_release();
    return v17;
  }
  swift_retain();
  return a3;
}

void _HashNode.mapValues<A>(_:)(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v16 = nullsub_1(a3 + 16, a3 + 32, a5, a6, a8);
  sub_238348E2C(v16, v17, a3, a4, a4, a1, a2, a5, &v18, a6, a7, a8);
}

void sub_238348E2C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int64_t a5@<X4>, void (*a6)(char *, char *)@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int32 v24;
  int v25;
  int8x8_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  _BYTE v32[16];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  void (*v38)(char *, char *);
  uint64_t v39;

  v38 = a6;
  v39 = a7;
  v18 = _HashNode.isCollisionNode.getter(a3, a4, a8, a10, a12);
  v37 = a9;
  if (v18)
  {
    v19 = MEMORY[0x24BDAC7A8](v18);
    v33 = a8;
    v34 = a10;
    v35 = a11;
    v36 = a12;
    v21 = static _HashNode.allocateCollision<A>(count:_:extraBytes:initializingWith:)(v19, a5, v20, 0, (uint64_t (*)(uint64_t))nullsub_1, (uint64_t)v32, a8, a11, MEMORY[0x24BEE4AE0] + 8, a12);
  }
  else
  {
    v23 = MEMORY[0x24BDAC7A8](v18);
    v33 = a8;
    v34 = a10;
    v35 = a11;
    v36 = a12;
    v21 = static _HashNode.allocate<A>(itemMap:childMap:count:extraBytes:initializingWith:)(v26, v23, v24, v25, a5, 0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))nullsub_1, (uint64_t)v32, a8, a11, MEMORY[0x24BEE4AE0] + 8, a12);
  }
  v27 = v21;
  v28 = v22;
  v29 = nullsub_1(v21 + 16, v21 + 32, a8, a11, a12);
  sub_238348FD8(v29, v30, a1, a2, v38, v39, a8, a10, a11, a12);
  if (v12)
  {
    swift_release();
  }
  else
  {
    v31 = v37;
    *v37 = v27;
    v31[1] = v28;
  }
}

void sub_238348FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *), uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
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
  void (*v34)(char *);
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
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
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
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
  void (*v74)(char *, uint64_t);
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
  char *v85;
  uint64_t TupleTypeMetadata2;
  char *v87;
  uint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(char *, char *);
  uint64_t v96;
  void (*v97)(char *, uint64_t);
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  _QWORD v102[2];
  char v103;
  _QWORD v104[2];
  uint64_t v105;

  v11 = v10;
  v95 = a5;
  v96 = a6;
  v99 = a4;
  v79 = a2;
  v16 = a9;
  v17 = a10;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v18 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v85 = (char *)&v75 - v19;
  v84 = *(_QWORD *)(a9 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v90 = (char *)&v75 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = a8;
  v88 = swift_getTupleTypeMetadata2();
  v92 = *(_QWORD *)(v88 - 8);
  v21 = MEMORY[0x24BDAC7A8](v88);
  v89 = (char *)&v75 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v87 = (char *)&v75 - v24;
  v91 = *(_QWORD *)(a7 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v101 = (char *)&v75 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = v99;
  v98 = _HashNode.UnsafeHandle.reverseItems.getter();
  v27 = v79;
  v93 = _HashNode.UnsafeHandle.reverseItems.getter();
  v29 = v28;
  v30 = _HashNode.UnsafeHandle.children.getter(a3, v26, a7, v100, a10);
  v80 = _HashNode.UnsafeHandle.children.getter(a1, v27, a7, a9, a10);
  v81 = v31;
  v105 = 0;
  v104[0] = 0;
  v103 = 0;
  v78 = a1;
  v94 = v29;
  if (v29 < 1)
  {
    v62 = 0;
LABEL_8:
    if (v62 >= v81)
    {
LABEL_12:
      v103 = 1;
      sub_2383495DC(&v103, v93, v94, (uint64_t)&v105, v80, v81, (uint64_t)v104, v78, v79, a7, v100, v16, v17);
    }
    else
    {
      v63 = (uint64_t *)(v30 + 16 * v62 + 8);
      while (1)
      {
        v65 = *(v63 - 1);
        v64 = *v63;
        swift_retain();
        v66 = _HashNode.mapValues<A>(_:)(v95, v96, v65, v64, a7, v100, v16, v17);
        v68 = v16;
        v69 = v17;
        if (v11)
          break;
        v70 = v66;
        v71 = v67;
        swift_release();
        v102[0] = v70;
        v102[1] = v71;
        v72 = type metadata accessor for _HashNode(0, a7, v68, v69);
        v73 = v81;
        sub_238311564(v62++, (uint64_t)v102, v80, v81, v72);
        v104[0] = v62;
        v63 += 2;
        v16 = v68;
        v17 = v69;
        if (v73 == v62)
          goto LABEL_12;
      }
      swift_release();
      sub_2383495DC(&v103, v93, v94, (uint64_t)&v105, v80, v81, (uint64_t)v104, v78, v79, a7, v100, v16, v17);
    }
  }
  else
  {
    v32 = v100;
    v76 = v30;
    v77 = a10;
    v99 = v10;
    v33 = 0;
    v82 = *(_QWORD *)(v92 + 72);
    v34 = *(void (**)(char *))(v91 + 16);
    v83 = a9;
    while (1)
    {
      v36 = v87;
      v35 = v88;
      v37 = *(int *)(v88 + 48);
      v38 = &v87[v37];
      v39 = v82;
      v40 = a7;
      v41 = v98 + v82 * v33 + v37;
      v34(v87);
      v42 = *(_QWORD *)(v32 - 8);
      v43 = v32;
      v44 = *(void (**)(char *, uint64_t, uint64_t))(v42 + 16);
      v44(v38, v41, v43);
      ((void (*)(char *, char *, uint64_t))v34)(v101, v36, v40);
      (*(void (**)(char *, uint64_t))(v92 + 8))(v36, v35);
      v45 = v105;
      v46 = *(int *)(v35 + 48);
      v47 = v89;
      v48 = &v89[v46];
      v49 = v98 + v105 * v39 + v46;
      v34(v89);
      v50 = v49;
      v51 = v100;
      v44(v48, v50, v100);
      v52 = v90;
      v53 = v99;
      v95(v47, v48);
      v99 = v53;
      if (v53)
      {
        v74 = *(void (**)(char *, uint64_t))(v91 + 8);
        v74(v101, v40);
        (*(void (**)(char *, uint64_t))(v42 + 8))(v48, v51);
        v74(v47, v40);
        sub_2383495DC(&v103, v93, v94, (uint64_t)&v105, v80, v81, (uint64_t)v104, v78, v79, v40, v51, v83, v77);
        return;
      }
      (*(void (**)(char *, uint64_t))(v42 + 8))(v48, v51);
      v97 = *(void (**)(char *, uint64_t))(v91 + 8);
      v97(v47, v40);
      v54 = TupleTypeMetadata2;
      v55 = v52;
      v56 = v85;
      v57 = &v85[*(int *)(TupleTypeMetadata2 + 48)];
      ((void (*)(char *, char *, uint64_t))v34)(v85, v101, v40);
      v58 = v84;
      v59 = v57;
      v16 = v83;
      (*(void (**)(char *, char *, uint64_t))(v84 + 16))(v59, v55, v83);
      v60 = (uint64_t)v56;
      v61 = v94;
      sub_238311564(v45, v60, v93, v94, v54);
      (*(void (**)(char *, uint64_t))(v58 + 8))(v55, v16);
      v97(v101, v40);
      v33 = v105 + 1;
      v32 = v100;
      if (__OFADD__(v105, 1))
        break;
      a7 = v40;
      ++v105;
      if (v33 >= v61)
      {
        v62 = v104[0];
        v11 = v99;
        v17 = v77;
        v30 = v76;
        goto LABEL_8;
      }
    }
    __break(1u);
  }
}

void sub_2383495DC(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if ((*a1 & 1) == 0)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    v14 = sub_23835B3A0();
    MEMORY[0x23B831670](MEMORY[0x24BEE1D40], v14);
    sub_23835B220();
    sub_23834972C(v17, v18, v19, v20, TupleTypeMetadata2);
    v15 = type metadata accessor for _HashNode(255, a10, a12, a13);
    v16 = sub_23835B3A0();
    MEMORY[0x23B831670](MEMORY[0x24BEE1D40], v16);
    sub_23835B220();
    sub_23834972C(v17, v18, v19, v20, v15);
    _HashNode.UnsafeHandle.clear()();
  }
}

uint64_t sub_23834972C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  if (!a3)
    return 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a5 - 8) + 72);
  v6 = a3 + v5 * a1;
  v7 = a2 - a1;
  result = swift_arrayDestroy();
  if ((unsigned __int128)(v7 * (__int128)v5) >> 64 == (v7 * v5) >> 63)
    return v6;
  __break(1u);
  return result;
}

uint64_t TreeDictionary.init(dictionaryLiteral:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  uint64_t v11;

  v11 = a1;
  swift_getTupleTypeMetadata2();
  v7 = sub_23835B0D0();
  v8 = (void (*)(char *, char *, uint64_t))MEMORY[0x23B831670](MEMORY[0x24BEE12C8], v7);
  v9 = sub_2382A45B4((void (*)(char *, char *, uint64_t))&v11, a2, a3, v7, a4, v8);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_238349848@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v16 = a1;
  v5 = a2[2];
  v6 = a2[3];
  swift_getTupleTypeMetadata2();
  v7 = sub_23835B0D0();
  v8 = a2[4];
  v9 = (void (*)(char *, char *, uint64_t))MEMORY[0x23B831670](MEMORY[0x24BEE12C8], v7);
  v10 = sub_2382A45B4((void (*)(char *, char *, uint64_t))&v16, v5, v6, v7, v8, v9);
  v12 = v11;
  v14 = v13;
  result = swift_bridgeObjectRelease();
  *a3 = v10;
  a3[1] = v12;
  a3[2] = v14;
  return result;
}

uint64_t TreeDictionary<>.hash(into:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t TupleTypeMetadata2;
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
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _OWORD v59[2];
  _OWORD v60[7];
  _OWORD v61[6];
  uint64_t v62;

  v46 = a8;
  v51 = a1;
  v44 = *(_QWORD *)(a6 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v40 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v39 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v17 = sub_23835B334();
  v49 = *(_QWORD *)(v17 - 8);
  v50 = v17;
  v18 = MEMORY[0x24BDAC7A8](v17);
  v48 = (uint64_t)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v38 - v20;
  TreeDictionary.makeIterator()(a2, (uint64_t)v60);
  v41 = a5;
  v42 = a6;
  v45 = a7;
  v47 = (_QWORD *)type metadata accessor for TreeDictionary.Iterator(0, a5, a6, a7);
  swift_retain();
  v22 = 0;
  v38 = TupleTypeMetadata2;
  v24 = v42;
  v23 = v43;
  v26 = v39;
  v25 = v40;
  while (1)
  {
    v27 = v48;
    TreeDictionary.Iterator.next()(v47, v48);
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 32))(v21, v27, v50);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 48))(v21, 1, TupleTypeMetadata2) == 1)break;
    v28 = &v21[*(int *)(TupleTypeMetadata2 + 48)];
    v29 = v41;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v26, v21, v41);
    v30 = v22;
    v31 = v44;
    (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v25, v28, v24);
    v32 = *((_QWORD *)v51 + 8);
    v33 = v51[1];
    v52 = *v51;
    v53 = v33;
    v34 = v51[3];
    v54 = v51[2];
    v55 = v34;
    *(_QWORD *)&v56 = v32;
    sub_23835ABFC();
    sub_23835ABFC();
    v61[4] = v54;
    v61[5] = v55;
    v62 = v56;
    v61[2] = v52;
    v61[3] = v53;
    v35 = sub_23835BA3C();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v25, v24);
    v36 = v29;
    TupleTypeMetadata2 = v38;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v26, v36);
    v22 = v35 ^ v30;
  }
  v58 = v60[6];
  v59[0] = v61[0];
  *(_OWORD *)((char *)v59 + 11) = *(_OWORD *)((char *)v61 + 11);
  v54 = v60[2];
  v55 = v60[3];
  v56 = v60[4];
  v57 = v60[5];
  v52 = v60[0];
  v53 = v60[1];
  sub_2382735AC((uint64_t)&v52);
  return sub_23835BA00();
}

uint64_t TreeDictionary<>.hashValue.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  __int128 v15[4];

  sub_23835B9E8();
  TreeDictionary<>.hash(into:)(v15, a1, a2, a3, a4, a5, a6, a7);
  return sub_23835BA48();
}

uint64_t sub_238349C84(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;

  return TreeDictionary<>.hashValue.getter(*v2, v2[1], v2[2], a1[2], a1[3], a1[4], *(_QWORD *)(a2 - 8));
}

uint64_t sub_238349CA0(__int128 *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;

  return TreeDictionary<>.hash(into:)(a1, *v3, v3[1], v3[2], a2[2], a2[3], a2[4], *(_QWORD *)(a3 - 8));
}

uint64_t sub_238349CBC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v5;
  __int128 v7[4];

  v5 = *(_QWORD *)(a3 - 8);
  sub_23835B9E8();
  TreeDictionary<>.hash(into:)(v7, *v3, v3[1], v3[2], a2[2], a2[3], a2[4], v5);
  return sub_23835BA48();
}

uint64_t sub_238349D18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 8);
  return MEMORY[0x23B831670](&protocol conformance descriptor for <> TreeDictionary<A, B>, a1, &v4);
}

BOOL _HashNode.containsKey(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  while (1)
  {
    v14 = a4 + 32;
    v15 = nullsub_1(a4 + 16, a4 + 32, a6, a7, a8);
    v17 = _HashNode.UnsafeHandle.find(_:_:_:)(a1, a2, a3, v15, v16, a6, a7, a8);
    if ((v17 & 1) == 0)
      break;
    a4 = *(_QWORD *)(v14 + ((v17 >> 28) & 0xFFFFFFFF0));
    a1 = (a1 + 5);
  }
  return v17 != 2;
}

uint64_t _HashNode.findForInsertion(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_23834A168(a1, a2, a3, a4, a5, a6, a7, a8, _HashNode.UnsafeHandle.findForInsertion(_:_:_:));
}

uint64_t _HashNode.get(_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;

  while (1)
  {
    v15 = a4 + 32;
    v16 = nullsub_1(a4 + 16, a4 + 32, a5, a6, a7);
    v18 = v17;
    v19 = _HashNode.UnsafeHandle.find(_:_:_:)(a1, a2, a3, v16, v17, a5, a6, a7);
    if (v19 == 2)
    {
      v20 = 1;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 56))(a8, v20, 1, a6);
    }
    if ((v19 & 1) == 0)
      break;
    a4 = *(_QWORD *)(v15 + ((v19 >> 28) & 0xFFFFFFFF0));
    a1 = (a1 + 5);
  }
  sub_23834A4F4(v16, v18, v19 & 0xFFFFFFFF00000000, a5, a6, a7, a8);
  v20 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 56))(a8, v20, 1, a6);
}

uint64_t _HashNode.lookup(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  while (1)
  {
    v15 = nullsub_1(a4 + 16, a4 + 32, a6, a7, a8);
    v17 = _HashNode.UnsafeHandle.find(_:_:_:)(a1, a2, a3, v15, v16, a6, a7, a8);
    if (v17 == 2)
      break;
    if ((v17 & 1) == 0)
      return a4;
    a4 = *(_QWORD *)(a4 + 32 + 16 * HIDWORD(v17));
    a1 = (a1 + 5);
  }
  return 0;
}

unint64_t _HashNode.UnsafeHandle.find(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  unsigned __int8 v12;
  unint64_t v13;
  int *v14;
  _QWORD *v15;
  uint64_t v16;
  int8x8_t v17;
  uint64_t v18;
  char *v19;
  int v20;
  int v21;
  uint64_t v22;
  int v24;
  uint8x8_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint8x8_t v29;
  uint64_t v30;

  v11 = *(_QWORD *)(a6 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *v14;
  v21 = v14[1];
  if ((v21 & *v14) != 0)
  {
    if (_HashNode.UnsafeHandle._findInCollision(_:_:_:)(v12, a2, v13, (uint64_t)v14, v15))
      return 2;
    else
      return v22 << 32;
  }
  else
  {
    v24 = 1 << (v13 >> v12);
    if ((v20 & v24) != 0)
    {
      v17.i32[0] = v20 & (v24 - 1);
      v25 = (uint8x8_t)vcnt_s8(v17);
      v25.i16[0] = vaddlv_u8(v25);
      v26 = v25.u32[0];
      v27 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v25.u32[0], v14, v15, a6, v16, a8);
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v19, v27, a6);
      v28 = sub_23835AD40();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v19, a6);
      if ((v28 & 1) != 0)
        return v26 << 32;
    }
    else if ((v21 & v24) != 0)
    {
      v17.i32[0] = v21 & (v24 - 1);
      v29 = (uint8x8_t)vcnt_s8(v17);
      v29.i16[0] = vaddlv_u8(v29);
      return ((unint64_t)v29.u32[0] << 32) | 1;
    }
    return 2;
  }
}

uint64_t _HashNode.find(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_23834A168(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_HashNode.UnsafeHandle.find(_:_:_:));
}

uint64_t sub_23834A168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v15;
  uint64_t v16;

  v15 = nullsub_1(a4 + 16, a4 + 32, a6, a7, a8);
  return a9(a1, a2, a3, v15, v16, a6, a7, a8);
}

uint64_t _HashNode.UnsafeHandle._findInCollision(_:_:_:)(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v7;
  char v8;

  if (a1 <= 0x3Fu && *a5 != a3)
    return 2;
  v7 = _HashNode.UnsafeHandle.reverseItems.getter();
  MEMORY[0x24BDAC7A8](v7);
  swift_getTupleTypeMetadata2();
  v5 = sub_23835B3A0();
  MEMORY[0x23B831670](MEMORY[0x24BEE1D40], v5);
  sub_23835B1E4();
  return (v8 & 1) != 0;
}

uint64_t _HashNode.UnsafeHandle.findForInsertion(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  unsigned __int8 v12;
  unint64_t v13;
  int *v14;
  _QWORD *v15;
  uint64_t v16;
  int8x8_t v17;
  uint64_t v18;
  char *v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  int v27;
  uint8x8_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  int v32;
  uint8x8_t v33;
  uint8x8_t v34;
  uint64_t v35;

  v11 = *(_QWORD *)(a6 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *v14;
  v21 = v14[1];
  if ((v21 & *v14) != 0)
  {
    v22 = _HashNode.UnsafeHandle._findInCollision(_:_:_:)(v12, a2, v13, (uint64_t)v14, v15);
    v24 = 2147483649;
    if (!v22)
      v24 = (v23 << 32) | 0xFF;
    if (v22 == 1)
      return 0x80000000;
    else
      return v24;
  }
  else
  {
    v26 = (v13 >> v12) & 0x1F;
    v27 = 1 << (v13 >> v12);
    if ((v20 & v27) != 0)
    {
      v17.i32[0] = v20 & (v27 - 1);
      v28 = (uint8x8_t)vcnt_s8(v17);
      v28.i16[0] = vaddlv_u8(v28);
      v29 = v28.u32[0];
      v30 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(v28.u32[0], v14, v15, a6, v16, a8);
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v19, v30, a6);
      v31 = sub_23835AD40();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v19, a6);
      if ((v31 & 1) != 0)
        return v26 | (v29 << 32);
      else
        return v26 | (v29 << 32) | 0x40000000;
    }
    else
    {
      v32 = v27 - 1;
      if ((v21 & v27) != 0)
      {
        v17.i32[0] = v21 & v32;
        v33 = (uint8x8_t)vcnt_s8(v17);
        v33.i16[0] = vaddlv_u8(v33);
        return v26 | ((unint64_t)v33.u32[0] << 32) | 0x60000000;
      }
      else
      {
        v17.i32[0] = v20 & v32;
        v34 = (uint8x8_t)vcnt_s8(v17);
        v34.i16[0] = vaddlv_u8(v34);
        return v26 | ((unint64_t)v34.u32[0] << 32) | 0x20000000;
      }
    }
  }
}

uint64_t sub_23834A4F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v9;
  uint64_t TupleTypeMetadata2;

  v9 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(HIDWORD(a3), a1, a2, a4, a5, a6);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 16))(a7, v9 + *(int *)(TupleTypeMetadata2 + 48), a5);
}

unint64_t _HashNode.position(forKey:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v14 = a4 + 16;
  v15 = a4 + 32;
  v16 = nullsub_1(a4 + 16, a4 + 32, a6, a7, a8);
  v18 = _HashNode.UnsafeHandle.find(_:_:_:)(a2, a1, a3, v16, v17, a6, a7, a8);
  if (v18 == 2)
    return 0;
  v20 = v18;
  if ((v18 & 1) == 0)
    return HIDWORD(v18);
  v21 = nullsub_1(v14, v15, a6, a7, a8);
  sub_23834A694(v21, v22, v20 & 0xFFFFFFFF00000000 | 1, a1, a2, a3, a6, a7, (uint64_t)&v23, a8);
  return v23;
}

uint64_t sub_23834A694@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = HIDWORD(a3);
  v15 = *(_QWORD *)(_HashNode.UnsafeHandle.children.getter(a1, a2, a7, a8, a10) + 16 * HIDWORD(a3));
  swift_retain();
  v16 = a4;
  v17 = a8;
  v18 = _HashNode.position(forKey:_:_:)(v16, (a5 + 5), a6, v15);
  v20 = v19;
  result = swift_release();
  if ((v20 & 1) == 0)
  {
    type metadata accessor for _HashNode(255, a7, v17, a10);
    v22 = sub_23835B3A0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568F17F0);
    MEMORY[0x23B831670](MEMORY[0x24BEE1D28], v22);
    sub_2382DB1A0();
    v23 = sub_23835ACEC();
    MEMORY[0x24BDAC7A8](v23);
    MEMORY[0x23B831670](MEMORY[0x24BEE1D40], v22);
    v24 = sub_23835B9C4();
    MEMORY[0x23B831670](MEMORY[0x24BEE4228], v24);
    result = sub_23835B004();
    v18 = v25;
  }
  *(_QWORD *)a9 = v18;
  *(_BYTE *)(a9 + 8) = v20 & 1;
  return result;
}

uint64_t _HashNode.item(position:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v16;
  char *v17;
  unsigned int *v18;
  uint64_t v19;
  char *v20;
  uint64_t v22;

  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v17 = (char *)&v22 - v16;
  v18 = (unsigned int *)nullsub_1(a4 + 16, a4 + 32, a6, a7, a8);
  sub_23834A9D8(v18, v19, a3, a6, a7, a8, (uint64_t)v17);
  v20 = &v17[*(int *)(TupleTypeMetadata2 + 48)];
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(a1, v17, a6);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a7 - 8) + 32))(a2, v20, a7);
}

uint64_t sub_23834A9D8@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v10;
  uint8x8_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t TupleTypeMetadata2;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v10 = a7;
  LODWORD(a7) = *a1;
  v11 = (uint8x8_t)vcnt_s8((int8x8_t)*a1);
  v11.i16[0] = vaddlv_u8(v11);
  if (*a1 == a1[1])
    a7 = a7;
  else
    a7 = v11.u32[0];
  v12 = a3 - a7;
  if (a3 < a7)
  {
    v13 = _HashNode.UnsafeHandle.subscript.unsafeAddressor(a3, a1, a2, a4, a5, a6);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 16))(v10, v13, TupleTypeMetadata2);
  }
  v16 = _HashNode.UnsafeHandle.children.getter((uint64_t)a1, a2, a4, a5, a6);
  v18 = v17;
  v19 = type metadata accessor for _HashNode(0, a4, a5, a6);
  v20 = MEMORY[0x23B830CB0](v16, v18, v19);
  if (v20 == v21)
    goto LABEL_22;
  if (v21 < v20)
    goto LABEL_20;
  if (v20 >= v21)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    result = sub_23835B7CC();
    __break(1u);
    return result;
  }
  v22 = v16 + 16 * v20;
  v23 = *(_QWORD *)(v22 + 8);
  if (v12 >= v23)
  {
    v25 = (uint64_t *)(v22 + 24);
    v24 = v20;
    while (1)
    {
      v26 = __OFSUB__(v12, v23);
      v12 -= v23;
      if (v26)
        break;
      if (v21 - 1 == v24)
        goto LABEL_22;
      if (++v24 < v20 || v24 >= v21)
        goto LABEL_19;
      v27 = *v25;
      v25 += 2;
      v23 = v27;
      if (v12 < v27)
        goto LABEL_17;
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v24 = v20;
LABEL_17:
  v28 = v10 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  v29 = *(_QWORD *)(v16 + 16 * v24);
  swift_retain();
  _HashNode.item(position:)(v10, v28, v12, v29);
  return swift_release();
}

uint64_t sub_23834AC10()
{
  return sub_23835AD40() & 1;
}

uint64_t getEnumTagSinglePayload for _FindResult(uint64_t a1, unsigned int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 > 0xFFFFFB && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 16777212);
  if ((((*(_DWORD *)a1 >> 5) & 0xFFFFF8 | (*(_DWORD *)a1 >> 29)) ^ 0xFFFFFFu) >= 0xFFFFFB)
    v3 = -1;
  else
    v3 = ((*(_DWORD *)a1 >> 5) & 0xFFFFF8 | (*(_DWORD *)a1 >> 29)) ^ 0xFFFFFF;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for _FindResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFFFFFB)
  {
    *(_QWORD *)result = a2 - 16777212;
    if (a3 >= 0xFFFFFC)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0xFFFFFC)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = (((-a2 >> 3) & 0x1FFFFF) << 8) - (a2 << 29);
  }
  return result;
}

uint64_t sub_23834AD08(_QWORD *a1)
{
  if ((int)*a1 >= 0)
    return *a1 >> 29;
  else
    return ((*a1 >> 24) & 0xFFFFFF00 | *a1) + 4;
}

_QWORD *sub_23834AD28(_QWORD *result)
{
  *result &= 0xFFFFFFFF1FFFFFFFLL;
  return result;
}

unint64_t *sub_23834AD38(unint64_t *result, unsigned int a2)
{
  if (a2 < 4)
    *result = *result & 0xFFFFFFFF000000FFLL | (a2 << 29);
  else
    *result = ((a2 - 4) | ((unint64_t)(a2 - 4) << 24)) & 0xFFFFFFFF000000FFLL | 0x80000000;
  return result;
}

ValueMetadata *type metadata accessor for _FindResult()
{
  return &type metadata for _FindResult;
}

_QWORD *sub_23834AD7C(_QWORD *result, uint64_t a2)
{
  *result += *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t OrderedSet.description.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD v6[2];

  v6[0] = a1;
  v6[1] = a2;
  v4 = type metadata accessor for OrderedSet(0, a3, a4, a4);
  MEMORY[0x23B831670](&protocol conformance descriptor for OrderedSet<A>, v4);
  return _arrayDescription<A>(for:debug:typeName:)((uint64_t)v6, 0, 0, 0, v4);
}

uint64_t sub_23834ADF4()
{
  sub_23835BB44();
  sub_23835AE90();
  swift_bridgeObjectRelease();
  sub_23835AE90();
  return 0x536465726564724FLL;
}

uint64_t sub_23834AE64(uint64_t a1)
{
  uint64_t *v1;

  return OrderedSet.description.getter(*v1, v1[1], *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t OrderedSet.debugDescription.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[0] = a1;
  v13[1] = a2;
  v6 = sub_23834ADF4();
  v8 = v7;
  v10 = type metadata accessor for OrderedSet(0, a3, a4, v9);
  MEMORY[0x23B831670](&protocol conformance descriptor for OrderedSet<A>, v10);
  v11 = _arrayDescription<A>(for:debug:typeName:)((uint64_t)v13, 1, v6, v8, v10);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_23834AF10(uint64_t a1)
{
  uint64_t *v1;

  return OrderedSet.debugDescription.getter(*v1, v1[1], *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t sub_23834AF20(uint64_t result, _QWORD *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v13;
  uint64_t v14;
  uint64_t v15;

  v13 = result;
  if (qword_2568F09D0 != -1)
    result = swift_once();
  if ((char *)_emptySingleton != a3)
  {
    v14 = nullsub_1(a3 + 16, a3 + 32, a5, a6, a7);
    return sub_23834B168(v14, v15, a2, a3, a4, v13, a5, a6, a7);
  }
  return result;
}

uint64_t _HashTreeStatistics.nodeCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t _HashTreeStatistics.collisionNodeCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t _HashTreeStatistics.itemCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t _HashTreeStatistics.collisionCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t _HashTreeStatistics._collisionChainCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t _HashTreeStatistics.maxItemDepth.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t _HashTreeStatistics.capacityBytes.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t _HashTreeStatistics.itemBytes.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t _HashTreeStatistics.childBytes.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t _HashTreeStatistics.freeBytes.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t _HashTreeStatistics.grossBytes.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 88);
}

double _HashTreeStatistics.averageItemDepth.getter()
{
  uint64_t *v0;

  if (*v0 < 1)
    return 0.0;
  else
    return (double)v0[6] / (double)v0[2];
}

double _HashTreeStatistics.memoryEfficiency.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  if (v1 < 1)
    return 1.0;
  else
    return (double)*(uint64_t *)(v0 + 64) / (double)v1;
}

double _HashTreeStatistics.averageNodeSize.getter()
{
  uint64_t *v0;

  if (*v0 < 1)
    return 0.0;
  else
    return (double)v0[7] / (double)*v0;
}

void _HashTreeStatistics.averageLookupChainLength.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  if (v1 >= 1 && __OFADD__(v1, *(_QWORD *)(v0 + 32)))
    __break(1u);
}

uint64_t getEnumTagSinglePayload for _HashTreeStatistics(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 96))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for _HashTreeStatistics(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
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
  *(_BYTE *)(result + 96) = v3;
  return result;
}

ValueMetadata *type metadata accessor for _HashTreeStatistics()
{
  return &type metadata for _HashTreeStatistics;
}

uint64_t sub_23834B168(uint64_t result, uint64_t a2, _QWORD *a3, const void *a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  unsigned int v11;
  __int32 v12;
  uint8x8_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  int8x8_t v21;
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
  uint64_t v45;
  uint64_t v46;
  uint8x8_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  uint64_t v62;
  uint64_t v63;

  if (__OFADD__(*a3, 1))
  {
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v10 = result;
  ++*a3;
  v11 = *(_DWORD *)result;
  v12 = *(_DWORD *)(result + 4);
  v13 = (uint8x8_t)vcnt_s8((int8x8_t)*(unsigned int *)result);
  v13.i16[0] = vaddlv_u8(v13);
  if (*(_DWORD *)result == v12)
    v14 = v11;
  else
    v14 = v13.u32[0];
  v15 = a3[2];
  v16 = __OFADD__(v15, v14);
  v17 = v15 + v14;
  if (v16)
    goto LABEL_33;
  a3[2] = v17;
  result = _HashNode.isCollisionNode.getter((uint64_t)a4, a5, a7, a8, a9);
  if ((result & 1) != 0)
  {
    v22 = a3[1];
    v16 = __OFADD__(v22, 1);
    v23 = v22 + 1;
    if (v16)
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    a3[1] = v23;
    v24 = a3[3];
    v16 = __OFADD__(v24, v14);
    v25 = v24 + v14;
    if (v16)
    {
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    a3[3] = v25;
    v26 = v14 * (v14 - 1);
    if ((unsigned __int128)(v14 * (__int128)(v14 - 1)) >> 64 != v26 >> 63)
    {
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    v27 = a3[4];
    v16 = __OFADD__(v27, v26 / 2);
    v28 = v27 + v26 / 2;
    if (v16)
    {
LABEL_46:
      __break(1u);
      return result;
    }
    a3[4] = v28;
  }
  v29 = *(_QWORD *)(*(_QWORD *)(a7 - 8) + 72);
  v30 = *(_QWORD *)(*(_QWORD *)(a8 - 8) + 72);
  v31 = (13108 * a6 + 52432) >> 16;
  v32 = a3[5];
  v33 = a3[6];
  if (v31 > v32)
    v32 = (13108 * a6 + 52432) >> 16;
  a3[5] = v32;
  v34 = v14 + v14 * (unint64_t)v31;
  v16 = __OFADD__(v33, v34);
  v35 = v33 + v34;
  if (v16)
    goto LABEL_34;
  a3[6] = v35;
  v36 = *(unsigned int *)(v10 + 8);
  v37 = a3[7];
  v16 = __OFADD__(v37, v36);
  v38 = v37 + v36;
  if (v16)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  a3[7] = v38;
  v39 = *(unsigned int *)(v10 + 12);
  v40 = a3[10];
  v16 = __OFADD__(v40, v39);
  v41 = v40 + v39;
  if (v16)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  a3[10] = v41;
  v16 = __OFADD__(v29, v30);
  v42 = v29 + v30;
  if (v16)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v43 = v14 * v42;
  if ((unsigned __int128)(v14 * (__int128)v42) >> 64 != (v14 * v42) >> 63)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v44 = a3[8];
  v16 = __OFADD__(v44, v43);
  v45 = v44 + v43;
  if (v16)
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  a3[8] = v45;
  if (v11 == v12)
  {
    v46 = 0;
  }
  else
  {
    v21.i32[0] = v12;
    v47 = (uint8x8_t)vcnt_s8(v21);
    v47.i16[0] = vaddlv_u8(v47);
    v46 = (16 * v47.i32[0]);
  }
  v48 = a3[9];
  v16 = __OFADD__(v48, v46);
  v49 = v48 + v46;
  if (v16)
    goto LABEL_40;
  a3[9] = v49;
  result = _swift_stdlib_malloc_size(a4);
  v50 = result - 32;
  if (result < 32)
    v50 = result - 17;
  v51 = a2 + (v50 & 0xFFFFFFFFFFFFFFF0) - (_QWORD)a4 - 16;
  v16 = __OFADD__(v51, 16);
  v52 = v51 + 16;
  if (v16)
    goto LABEL_41;
  v53 = a3[11];
  v16 = __OFADD__(v53, v52);
  v54 = v53 + v52;
  if (v16)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  a3[11] = v54;
  v55 = _HashNode.UnsafeHandle.children.getter(v10, a2, a7, a8, a9);
  v57 = v56;
  v58 = type metadata accessor for _HashNode(0, a7, a8, a9);
  MEMORY[0x23B830C8C](v55, v57, v58);
  sub_23835AD70();
  result = sub_23835AD64();
  v59 = v62;
  if (v62)
  {
    for (i = v63; ; i = v63)
    {
      sub_23834AF20((a6 + 5), a3, v59, i, a7, a8, a9);
      swift_release();
      sub_23835AD64();
      v59 = v62;
    }
  }
  return result;
}

uint64_t Range<>._toUInt()(uint64_t a1, uint64_t a2)
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  void (*v28)(char *, uint64_t, uint64_t);
  char v29;
  char v30;
  void (*v31)(char *, uint64_t);
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  void (*v38)(char *, char *, uint64_t);
  char v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char v43;
  char *v44;
  char *v45;
  char v46;
  uint64_t v47;
  char v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char v52;
  uint64_t v53;
  char *v54;
  char v55;
  unint64_t v56;
  char *v57;
  unint64_t v58;
  char *v59;
  char *v60;
  char v61;
  char v62;
  unint64_t v63;
  char *v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  char *v79;
  uint64_t AssociatedTypeWitness;
  void (*v81)(char *, char *, uint64_t);
  unint64_t v82;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 8) + 24) + 16);
  v73 = a1;
  v4 = *(_QWORD *)(a1 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v78 = (char *)&v69 - v6;
  v7 = *(_QWORD *)(v4 - 8);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v69 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v75 = (char *)&v69 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v79 = (char *)&v69 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v76 = (char *)&v69 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v70 = (char *)&v69 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v77 = (char *)&v69 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v69 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v69 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v69 - v26;
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v74 = v2;
  v28((char *)&v69 - v26, v2, v4);
  v29 = sub_23835B4F0();
  v81 = (void (*)(char *, char *, uint64_t))v28;
  v28(v25, (uint64_t)v27, v4);
  v71 = v7;
  v72 = v3;
  if ((v29 & 1) != 0)
  {
    swift_getAssociatedConformanceWitness();
    sub_23835B97C();
    sub_23835B91C();
    v30 = sub_23835AC74();
    v31 = *(void (**)(char *, uint64_t))(v7 + 8);
    v31(v22, v4);
    v31(v25, v4);
    if ((v30 & 1) != 0)
    {
      v32 = v27;
LABEL_38:
      v31(v32, v4);
      return 0;
    }
  }
  else
  {
    v31 = *(void (**)(char *, uint64_t))(v7 + 8);
    v31(v25, v4);
  }
  v33 = v77;
  v34 = sub_23835B4E4();
  v81(v33, v27, v4);
  v77 = v22;
  if (v34 <= 63)
  {
    v35 = v33;
LABEL_7:
    v31(v35, v4);
    goto LABEL_8;
  }
  v82 = -1;
  v46 = sub_23835B4F0();
  v47 = sub_23835B4E4();
  if ((v46 & 1) != 0)
  {
    if (v47 > 64)
    {
      sub_23826C710();
      sub_23835B490();
      v48 = sub_23835AC74();
      v49 = v22;
      goto LABEL_26;
    }
    swift_getAssociatedConformanceWitness();
    sub_23835B97C();
    sub_23835B91C();
    v62 = sub_23835AC68();
    v31(v22, v4);
    v63 = v82;
    v64 = v70;
    (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v70, v33, v4);
    if ((v62 & 1) == 0)
    {
      v35 = v64;
      goto LABEL_7;
    }
    v65 = sub_23835B4D8();
    v31(v64, v4);
    if (v63 >= v65)
      goto LABEL_8;
LABEL_35:
    v32 = v27;
    goto LABEL_38;
  }
  if (v47 < 65)
  {
    v66 = sub_23835B4D8();
    v31(v33, v4);
    if (v82 >= v66)
      goto LABEL_8;
    goto LABEL_35;
  }
  sub_23826C710();
  v59 = v77;
  sub_23835B490();
  v48 = sub_23835AC74();
  v49 = v59;
LABEL_26:
  v31(v49, v4);
  v31(v33, v4);
  if ((v48 & 1) != 0)
    goto LABEL_35;
LABEL_8:
  v36 = sub_23835B4D8();
  v31(v27, v4);
  v37 = v76;
  v38 = v81;
  v81(v76, (char *)(v74 + *(int *)(v73 + 36)), v4);
  v39 = sub_23835B4F0();
  v38(v79, v37, v4);
  if ((v39 & 1) != 0)
  {
    swift_getAssociatedConformanceWitness();
    sub_23835B97C();
    v40 = v36;
    v41 = v79;
    v42 = v77;
    sub_23835B91C();
    v43 = sub_23835AC74();
    v31(v42, v4);
    v44 = v41;
    v36 = v40;
    v31(v44, v4);
    v45 = v75;
    if ((v43 & 1) != 0)
      goto LABEL_37;
  }
  else
  {
    v31(v79, v4);
    v45 = v75;
  }
  v50 = sub_23835B4E4();
  v81(v45, v37, v4);
  if (v50 <= 63)
  {
    v51 = v45;
LABEL_17:
    v31(v51, v4);
    goto LABEL_18;
  }
  v82 = -1;
  v52 = sub_23835B4F0();
  v53 = sub_23835B4E4();
  if ((v52 & 1) == 0)
  {
    if (v53 < 65)
    {
      v67 = sub_23835B4D8();
      v31(v45, v4);
      if (v82 < v67)
      {
LABEL_37:
        v32 = v37;
        goto LABEL_38;
      }
      goto LABEL_18;
    }
LABEL_29:
    sub_23826C710();
    v60 = v77;
    sub_23835B490();
    v61 = sub_23835AC74();
    v31(v60, v4);
    v31(v45, v4);
    if ((v61 & 1) != 0)
      goto LABEL_37;
    goto LABEL_18;
  }
  if (v53 > 64)
    goto LABEL_29;
  swift_getAssociatedConformanceWitness();
  sub_23835B97C();
  v54 = v77;
  sub_23835B91C();
  v55 = sub_23835AC68();
  v31(v54, v4);
  v56 = v82;
  v57 = v69;
  (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v69, v45, v4);
  if ((v55 & 1) == 0)
  {
    v51 = v57;
    goto LABEL_17;
  }
  v58 = sub_23835B4D8();
  v31(v57, v4);
  if (v56 < v58)
    goto LABEL_37;
LABEL_18:
  sub_23835B4D8();
  v31(v37, v4);
  return v36;
}

uint64_t Range<>._clampedToUInt()(uint64_t a1, uint64_t a2)
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
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  void (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  char v55;
  char *v56;
  uint64_t v57;
  char v58;
  char *v59;
  char v60;
  uint64_t result;
  char v62;
  uint64_t v63;
  char *v64;
  char v65;
  char *v66;
  unint64_t v67;
  char v68;
  unint64_t v69;
  char v70;
  uint64_t v71;
  char v72;
  char *v73;
  uint64_t v74;
  char v75;
  char v76;
  char v77;
  uint64_t v78;
  char *v79;
  char v80;
  unint64_t v81;
  unint64_t v82;
  char *v83;
  char v84;
  char *v85;
  unint64_t v86;
  uint64_t v87;
  char *v88;
  char *v89;
  char *v90;
  uint64_t v91;
  char *v92;
  char *v93;
  char *v94;
  char *v95;
  char *v96;
  char *v97;
  char *v98;
  uint64_t AssociatedTypeWitness;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(char *, uint64_t, uint64_t);
  unint64_t v104;

  v3 = a1;
  v4 = *(_QWORD *)(a1 + 16);
  v100 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 8) + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v98 = (char *)&v87 - v6;
  v7 = *(_QWORD *)(v4 - 8);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v89 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v94 = (char *)&v87 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v96 = (char *)&v87 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v92 = (char *)&v87 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v97 = (char *)&v87 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v88 = (char *)&v87 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v93 = (char *)&v87 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v95 = (char *)&v87 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v90 = (char *)&v87 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v87 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26);
  v31 = (char *)&v87 - v30;
  v32 = MEMORY[0x24BDAC7A8](v29);
  v34 = (char *)&v87 - v33;
  v35 = MEMORY[0x24BDAC7A8](v32);
  v37 = (char *)&v87 - v36;
  MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)&v87 - v38;
  v40 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v101 = v2 + *(int *)(v3 + 36);
  v102 = v2;
  v103 = v40;
  ((void (*)(char *))v40)((char *)&v87 - v38);
  LOBYTE(v3) = sub_23835B4F0();
  v41 = sub_23835B4E4();
  v91 = v7;
  if ((v3 & 1) != 0)
  {
    if (v41 <= 64)
      goto LABEL_3;
LABEL_6:
    v104 = 0;
    sub_23826C4A4();
    sub_23835B490();
    v45 = sub_23835AC74();
    v43 = *(void (**)(char *, uint64_t))(v7 + 8);
    v43(v37, v4);
    v43(v39, v4);
    v44 = 0;
    if ((v45 & 1) == 0)
      return v44;
    goto LABEL_7;
  }
  if (v41 > 63)
    goto LABEL_6;
LABEL_3:
  v42 = sub_23835B4D8();
  v43 = *(void (**)(char *, uint64_t))(v7 + 8);
  v43(v39, v4);
  if (v42 <= 0)
    return 0;
LABEL_7:
  v103(v34, v102, v4);
  if ((sub_23835B4F0() & 1) != 0)
  {
    v46 = sub_23835B4F0();
    v47 = sub_23835B4E4();
    if ((v46 & 1) != 0)
    {
      if (v47 <= 64)
      {
        swift_getAssociatedConformanceWitness();
        sub_23835B97C();
        sub_23835B91C();
        v48 = sub_23835AC74();
        v43(v37, v4);
        v103(v31, (uint64_t)v34, v4);
        if ((v48 & 1) != 0)
        {
          v43(v31, v4);
          v43(v34, v4);
          goto LABEL_18;
        }
        v49 = sub_23835B4D8();
        v43(v31, v4);
        goto LABEL_14;
      }
LABEL_17:
      v44 = -1;
      v104 = -1;
      sub_23826C710();
      sub_23835B490();
      v50 = sub_23835AC74();
      v43(v37, v4);
      v43(v34, v4);
      if ((v50 & 1) == 0)
        return v44;
      goto LABEL_18;
    }
    if (v47 >= 64)
      goto LABEL_17;
  }
  else if (sub_23835B4E4() >= 64)
  {
    goto LABEL_17;
  }
  v49 = sub_23835B4D8();
LABEL_14:
  v43(v34, v4);
  if (v49 == -1)
    return -1;
LABEL_18:
  v103(v28, v102, v4);
  if ((sub_23835B4F0() & 1) != 0)
  {
    v51 = sub_23835B4E4();
    v52 = (uint64_t)v97;
    if (v51 < 64)
    {
LABEL_27:
      v57 = sub_23835B4D8();
      while (1)
      {
        v43(v28, v4);
        v56 = v96;
        if (v57 < 0)
        {
          v44 = 0;
          goto LABEL_50;
        }
LABEL_32:
        v28 = v95;
        v103(v95, v102, v4);
        if ((sub_23835B4F0() & 1) != 0)
        {
          swift_getAssociatedConformanceWitness();
          sub_23835B97C();
          v28 = v95;
          sub_23835B91C();
          v60 = sub_23835AC80();
          result = ((uint64_t (*)(char *, uint64_t))v43)(v37, v4);
          if ((v60 & 1) == 0)
            goto LABEL_77;
        }
        if (sub_23835B4E4() < 64)
        {
LABEL_48:
          v44 = sub_23835B4D8();
          goto LABEL_49;
        }
        v103(v93, (uint64_t)v28, v4);
        v104 = -1;
        v62 = sub_23835B4F0();
        v63 = sub_23835B4E4();
        if ((v62 & 1) != 0)
        {
          if (v63 > 64)
            goto LABEL_41;
          swift_getAssociatedConformanceWitness();
          sub_23835B97C();
          sub_23835B91C();
          v64 = v93;
          v65 = sub_23835AC68();
          v43(v37, v4);
          v59 = (char *)v104;
          v66 = v88;
          (*(void (**)(char *, char *, uint64_t))(v91 + 32))(v88, v64, v4);
          if ((v65 & 1) == 0)
          {
            v43(v66, v4);
            v28 = v95;
            goto LABEL_48;
          }
          v67 = sub_23835B4D8();
          v43(v66, v4);
          v28 = v95;
          if ((unint64_t)v59 >= v67)
            goto LABEL_48;
        }
        else
        {
          if (v63 >= 65)
          {
LABEL_41:
            sub_23826C710();
            sub_23835B490();
            v59 = v93;
            v68 = sub_23835AC74();
            v43(v37, v4);
            v43(v59, v4);
            if ((v68 & 1) == 0)
              goto LABEL_48;
            goto LABEL_45;
          }
          v59 = v93;
          v69 = sub_23835B4D8();
          v43(v59, v4);
          if (v104 >= v69)
            goto LABEL_48;
        }
LABEL_45:
        __break(1u);
LABEL_46:
        v57 = sub_23835B4D8();
        v43(v59, v4);
      }
    }
LABEL_23:
    v104 = 0;
    sub_23826C4A4();
    sub_23835B490();
    v55 = sub_23835AC74();
    v43(v37, v4);
    v43(v28, v4);
    v44 = 0;
    v56 = v96;
    if ((v55 & 1) == 0)
      goto LABEL_32;
    goto LABEL_50;
  }
  v53 = sub_23835B4F0();
  v54 = sub_23835B4E4();
  v52 = (uint64_t)v97;
  if ((v53 & 1) == 0)
  {
    if (v54 >= 64)
    {
      v43(v28, v4);
      v56 = v96;
      goto LABEL_32;
    }
    goto LABEL_27;
  }
  if (v54 > 64)
    goto LABEL_23;
  swift_getAssociatedConformanceWitness();
  sub_23835B97C();
  sub_23835B91C();
  v58 = sub_23835AC74();
  v43(v37, v4);
  v59 = v90;
  v103(v90, (uint64_t)v28, v4);
  if ((v58 & 1) == 0)
    goto LABEL_46;
  v43(v59, v4);
  v44 = 0;
  v56 = v96;
LABEL_49:
  v43(v28, v4);
LABEL_50:
  v103((char *)v52, v101, v4);
  v70 = sub_23835B4F0();
  v71 = sub_23835B4E4();
  if ((v70 & 1) != 0)
  {
    if (v71 <= 64)
    {
      swift_getAssociatedConformanceWitness();
      sub_23835B97C();
      sub_23835B91C();
      v72 = sub_23835AC68();
      v43(v37, v4);
      v73 = v92;
      v103(v92, v52, v4);
      if ((v72 & 1) != 0)
        sub_23835B4D8();
      v43(v73, v4);
      goto LABEL_59;
    }
  }
  else if (v71 < 65)
  {
    sub_23835B4D8();
LABEL_59:
    v43((char *)v52, v4);
    goto LABEL_60;
  }
  v74 = v52;
  v52 = -1;
  v104 = -1;
  sub_23826C710();
  sub_23835B490();
  v75 = sub_23835AC74();
  v43(v37, v4);
  v43((char *)v74, v4);
  if ((v75 & 1) != 0)
    return v44;
LABEL_60:
  v103(v56, v101, v4);
  if ((sub_23835B4F0() & 1) == 0
    || (swift_getAssociatedConformanceWitness(),
        sub_23835B97C(),
        sub_23835B91C(),
        v76 = sub_23835AC80(),
        result = ((uint64_t (*)(char *, uint64_t))v43)(v37, v4),
        (v76 & 1) != 0))
  {
    if (sub_23835B4E4() < 64)
      goto LABEL_74;
    v103(v94, (uint64_t)v56, v4);
    v104 = -1;
    v77 = sub_23835B4F0();
    v78 = sub_23835B4E4();
    if ((v77 & 1) != 0)
    {
      if (v78 <= 64)
      {
        swift_getAssociatedConformanceWitness();
        sub_23835B97C();
        sub_23835B91C();
        v79 = v94;
        v80 = sub_23835AC68();
        v43(v37, v4);
        v81 = v104;
        v52 = (uint64_t)v89;
        (*(void (**)(char *, char *, uint64_t))(v91 + 32))(v89, v79, v4);
        if ((v80 & 1) == 0)
        {
LABEL_73:
          v43((char *)v52, v4);
          goto LABEL_74;
        }
        v82 = sub_23835B4D8();
        v43((char *)v52, v4);
        if (v81 < v82)
        {
LABEL_72:
          __break(1u);
          goto LABEL_73;
        }
LABEL_74:
        sub_23835B4D8();
        v43(v56, v4);
        return v44;
      }
    }
    else if (v78 < 65)
    {
      v85 = v94;
      v86 = sub_23835B4D8();
      v43(v85, v4);
      if (v104 < v86)
        goto LABEL_72;
      goto LABEL_74;
    }
    sub_23826C710();
    sub_23835B490();
    v83 = v94;
    v84 = sub_23835AC74();
    v43(v37, v4);
    v43(v83, v4);
    if ((v84 & 1) != 0)
      goto LABEL_72;
    goto LABEL_74;
  }
  __break(1u);
LABEL_77:
  __break(1u);
  return result;
}

uint64_t BitSet.intersection(_:)(int8x16_t *a1, int8x16_t *a2)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v6;
  int64_t v7;
  int8x16_t *v8;
  int8x16_t *v9;
  int8x16_t *v10;
  uint64_t v11;
  int8x16_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  if (a1[1].i64[0] >= (unint64_t)a2[1].i64[0])
    v2 = a2[1].u64[0];
  else
    v2 = a1[1].u64[0];
  if (!v2)
  {
    v7 = 0;
    result = MEMORY[0x24BEE4AF8];
    goto LABEL_23;
  }
  result = sub_23835B088();
  *(_QWORD *)(result + 16) = v2;
  if (v2 < 0xA)
  {
    v6 = 0;
LABEL_13:
    v13 = v2 - v6;
    v14 = 8 * v6 + 32;
    v15 = (uint64_t *)(result + v14);
    v16 = (uint64_t *)((char *)a1->i64 + v14);
    v17 = (uint64_t *)((char *)a2->i64 + v14);
    do
    {
      v19 = *v17++;
      v18 = v19;
      v20 = *v16++;
      *v15++ = v20 & v18;
      --v13;
    }
    while (v13);
    goto LABEL_15;
  }
  v6 = 0;
  if ((unint64_t)(result - (_QWORD)a2) < 0x20)
    goto LABEL_13;
  if ((unint64_t)(result - (_QWORD)a1) < 0x20)
    goto LABEL_13;
  v6 = v2 & 0x7FFFFFFFFFFFFFFCLL;
  v8 = a2 + 3;
  v9 = a1 + 3;
  v10 = (int8x16_t *)(result + 48);
  v11 = v2 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    v12 = vandq_s8(*v9, *v8);
    v10[-1] = vandq_s8(v9[-1], v8[-1]);
    *v10 = v12;
    v8 += 2;
    v9 += 2;
    v10 += 2;
    v11 -= 4;
  }
  while (v11);
  if (v2 != v6)
    goto LABEL_13;
LABEL_15:
  if (*(_QWORD *)(result + 32 + 8 * v2 - 8))
  {
    v7 = v2;
  }
  else
  {
    v21 = v2;
    while (1)
    {
      v7 = v21 - 1;
      if ((uint64_t)(v21 - 1) < 1)
        break;
      if (*(_QWORD *)(result + 8 * v21-- + 16))
      {
        if ((uint64_t)v2 >= v7)
          goto LABEL_23;
        __break(1u);
        break;
      }
    }
    v7 = 0;
  }
LABEL_23:
  *(_QWORD *)(result + 16) = v7;
  return result;
}

uint64_t BitSet.intersection(_:)(int8x16_t *a1, uint64_t a2, int8x16_t *a3)
{
  return BitSet.intersection(_:)(a1, a3);
}

uint64_t BitSet.intersection(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  BitSet.formIntersection(_:)(a1, a2);
  return a3;
}

uint64_t BitSet.intersection<A>(_:)(uint64_t a1, int8x16_t *a2, ValueMetadata *a3)
{
  void (**Description)(char *, _QWORD, ValueMetadata *);
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int8x16_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int8x16_t *v16;
  uint64_t v17;
  uint64_t v18;

  Description = (void (**)(char *, _QWORD, ValueMetadata *))a3[-1].Description;
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568F0BA0);
  Description[2](v8, a1, a3);
  if ((ValueMetadata *)v9 == a3)
  {
    swift_dynamicCast();
    v12 = v17;
    v13 = v18;
    v16 = a2;
    swift_bridgeObjectRetain();
    BitSet.formIntersection(_:)(v12, v13);
    v11 = (uint64_t)v16;
  }
  else
  {
    v10 = (int8x16_t *)BitSet.init<A>(_validMembersOf:)((uint64_t)v8, a3);
    v11 = BitSet.intersection(_:)(v10, a2);
    swift_bridgeObjectRelease();
  }
  ((void (*)(uint64_t, ValueMetadata *))Description[1])(a1, a3);
  return v11;
}

BOOL BitSet.isStrictSubset(of:)(_QWORD *a1, _QWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = a2[2];
  v3 = a1[2];
  if (v3 >= v2)
  {
    result = v2 < v3;
    if (!v2)
      return result;
    v6 = a2[4];
    v7 = a1[4];
    if ((v6 & ~v7) == 0)
    {
      v8 = v2 - 1;
      v9 = a2 + 5;
      v10 = a1 + 5;
      do
      {
        if (result)
        {
          result = 1;
          if (!v8)
            return result;
        }
        else
        {
          result = v6 != v7;
          if (!v8)
            return result;
        }
        v11 = *v9++;
        v6 = v11;
        v12 = *v10++;
        v7 = v12;
        --v8;
      }
      while ((v6 & ~v12) == 0);
    }
  }
  return 0;
}

uint64_t BitSet.isStrictSubset(of:)(uint64_t a1, int64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  char v8;
  char v9;

  v6 = a3 + 32;
  if (a2 <= 0)
    v7 = 0;
  else
    v7 = a1 & ~(a1 >> 63);
  v8 = _UnsafeBitSet.isSubset(of:)(v7, a2 & ~(a2 >> 63), (_QWORD *)(a3 + 32), *(_QWORD *)(a3 + 16));
  v9 = 0;
  if ((v8 & 1) != 0 && a1 != a2)
  {
    if ((a2 | a1) < 0)
      v9 = 1;
    else
      v9 = _UnsafeBitSet.isSuperset(of:)(a1, a2, v6, *(_QWORD *)(a3 + 16)) ^ 1;
  }
  return v9 & 1;
}

unint64_t BitSet.isStrictSubset<A>(of:)(uint64_t a1, int8x8_t *a2, ValueMetadata *a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (**Description)(char *, _QWORD, ValueMetadata *);
  uint64_t v14;
  char *v15;
  char v16;
  unint64_t result;
  uint64_t v18;
  int8x8_t *v19;
  uint64_t v20;
  uint8x8_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  int64_t v27;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v12 = (char *)&v25 - v11;
  Description = (void (**)(char *, _QWORD, ValueMetadata *))a3[-1].Description;
  MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 == &type metadata for BitSet)
  {
    Description[2](v15, a1, &type metadata for BitSet);
LABEL_8:
    swift_dynamicCast();
    v16 = BitSet.isStrictSubset(of:)(v26, a2);
    swift_bridgeObjectRelease();
    return v16 & 1;
  }
  if (a3 == &type metadata for BitSet.Counted)
  {
    Description[2](v15, a1, &type metadata for BitSet.Counted);
    goto LABEL_8;
  }
  if ((ValueMetadata *)__swift_instantiateConcreteTypeFromMangledName(&qword_2568F0BA0) == a3)
  {
    Description[2](v15, a1, a3);
    swift_dynamicCast();
    v16 = BitSet.isStrictSubset(of:)((uint64_t)v26, v27, (uint64_t)a2);
    return v16 & 1;
  }
  if ((BitSet.isEmpty.getter((uint64_t)a2) & 1) != 0)
  {
    Description[2](v15, a1, a3);
    sub_23835AF8C();
    swift_getAssociatedConformanceWitness();
    sub_23835B484();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, AssociatedTypeWitness);
    v16 = v27 ^ 1;
    return v16 & 1;
  }
  result = (unint64_t)a2[2];
  if (result)
  {
    v18 = 0;
    v19 = a2 + 4;
    v20 = 8 * result;
    while (1)
    {
      v21 = (uint8x8_t)vcnt_s8(*v19);
      v21.i16[0] = vaddlv_u8(v21);
      v22 = __OFADD__(v18, v21.u32[0]);
      v18 += v21.u32[0];
      if (v22)
        break;
      ++v19;
      v20 -= 8;
      if (!v20)
        goto LABEL_15;
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    v23 = MEMORY[0x24BDAC7A8](result);
    *(&v25 - 6) = (uint64_t)a3;
    *(&v25 - 5) = a4;
    *(&v25 - 4) = a1;
    *(&v25 - 3) = (uint64_t)a2;
    *(&v25 - 2) = v24;
    LOBYTE(v26) = 2;
    result = (unint64_t)sub_238329EE0(v23, &v26, (_QWORD *(*)(char *__return_ptr, _BYTE **))sub_23834D4AC);
    if (v26 != 2)
    {
      v16 = v26 & 1;
      return v16 & 1;
    }
  }
  __break(1u);
  return result;
}

BOOL BitSet.isStrictSubset(of:)(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  return BitSet.isStrictSubset(of:)(a1, a3);
}

uint64_t sub_23834D218@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  char *v14;
  uint64_t result;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  char *v28;
  unint64_t v29;
  char v30;

  v25 = a4;
  v26 = a1;
  v28 = a6;
  v9 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v27 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v14 = (char *)&v25 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, a5);
  sub_23835AF8C();
  swift_getAssociatedConformanceWitness();
  sub_23835B484();
  if ((v30 & 1) == 0)
  {
    v17 = 0;
    v18 = 0;
    v19 = a3 + 32;
    while (1)
    {
      if ((v29 & 0x8000000000000000) != 0 || (v20 = v29 >> 6, v29 >> 6 >= *(_QWORD *)(a3 + 16)))
      {
LABEL_9:
        while (1)
        {
          sub_23835B484();
          if ((v30 & 1) != 0)
            goto LABEL_2;
          if ((v29 & 0x8000000000000000) == 0)
          {
            v20 = v29 >> 6;
            if (v29 >> 6 < *(_QWORD *)(a3 + 16))
            {
              v21 = *(_QWORD *)(v19 + 8 * v20);
              v17 = 1;
              v22 = 1 << v29;
              goto LABEL_8;
            }
          }
        }
      }
      v21 = *(_QWORD *)(v19 + 8 * v20);
      v22 = 1 << v29;
LABEL_8:
      if ((v21 & v22) == 0)
        goto LABEL_9;
      v23 = 8 * v20;
      v24 = *(_QWORD *)(*v26 + v23);
      *(_QWORD *)(*v26 + v23) = v24 | v22;
      if ((v24 & v22) == 0 && ++v18 == v25)
        break;
      sub_23835B484();
      if (v30 == 1)
        goto LABEL_2;
    }
    if ((v17 & 1) != 0)
    {
LABEL_22:
      result = (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v14, AssociatedTypeWitness);
      v16 = 1;
      goto LABEL_3;
    }
    while (1)
    {
      sub_23835B484();
      if (v30 == 1)
        break;
      if ((v29 & 0x8000000000000000) != 0
        || v29 >> 6 >= *(_QWORD *)(a3 + 16)
        || ((*(_QWORD *)(v19 + 8 * (v29 >> 6)) >> v29) & 1) == 0)
      {
        goto LABEL_22;
      }
    }
  }
LABEL_2:
  result = (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v14, AssociatedTypeWitness);
  v16 = 0;
LABEL_3:
  *v28 = v16;
  return result;
}

uint64_t sub_23834D4AC@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  uint64_t *v2;

  return sub_23834D218(a1, v2[4], v2[5], v2[6], v2[2], a2);
}

uint64_t sub_23834D4D4(uint64_t result, unint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v3 = *(_QWORD *)(*v2 + 8 * (a2 >> 6));
    v4 = v3 & ((-1 << (a2 & 0x3F)) - 1);
    v5 = v3 | (1 << (a2 & 0x3F));
    if ((result & 1) == 0)
      v5 = v4;
    *(_QWORD *)(*v2 + 8 * (a2 >> 6)) = v5;
  }
  return result;
}

unint64_t sub_23834D518(unint64_t result, unint64_t a2)
{
  uint64_t *v2;
  int64_t v3;
  int64_t v4;
  char v5;
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  char v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  v3 = v2[2];
  if (v3 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v3 < (uint64_t)a2)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (__OFSUB__(a2, result))
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if ((uint64_t)(a2 - result) < 1)
    return result;
  if ((a2 & 0x8000000000000000) != 0)
    goto LABEL_28;
  v4 = result >> 6;
  v5 = result & 0x3F;
  v6 = a2 > 0x3F;
  v7 = (a2 & 0x3F) == 0;
  v8 = v6 & v7;
  if (v6 && v7)
    v9 = 64;
  else
    v9 = a2 & 0x3F;
  v10 = (a2 >> 6) - v8;
  v11 = *v2;
  if (v4 == v10)
  {
    if (a2 > 0x3F && v7)
      v12 = -1;
    else
      v12 = ~(-1 << v9);
    v13 = (-1 << v5) ^ ~v12;
    v10 = result >> 6;
    goto LABEL_22;
  }
  *(_QWORD *)(v11 + 8 * v4) |= -1 << v5;
  if (v10 <= v4)
    goto LABEL_29;
  if (v4 + 1 == v10)
    goto LABEL_19;
  if (v4 + 1 >= v10)
  {
LABEL_30:
    __break(1u);
    return result;
  }
  result = (unint64_t)memset((void *)(v11 + 8 * v4 + 8), 255, 8 * (v10 + ~v4));
LABEL_19:
  if ((v8 & 1) != 0)
    v13 = -1;
  else
    v13 = ~(-1 << v9);
LABEL_22:
  *(_QWORD *)(v11 + 8 * v10) |= v13;
  return result;
}

void sub_23834D644(unint64_t a1, unint64_t a2)
{
  uint64_t *v2;
  int64_t v3;
  int64_t v4;
  char v5;
  unint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  char v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  v3 = v2[2];
  if (v3 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v3 < (uint64_t)a2)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (__OFSUB__(a2, a1))
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if ((uint64_t)(a2 - a1) < 1)
    return;
  if ((a2 & 0x8000000000000000) != 0)
    goto LABEL_28;
  v4 = a1 >> 6;
  v5 = a1 & 0x3F;
  v6 = a2 >> 6;
  v7 = a2 > 0x3F;
  v8 = (a2 & 0x3F) == 0;
  v9 = v7 & v8;
  if (v7 && v8)
    v10 = 64;
  else
    v10 = a2 & 0x3F;
  v11 = v6 - v9;
  v12 = *v2;
  if (v4 == v6 - v9)
  {
    if (a2 > 0x3F && v8)
      v13 = -1;
    else
      v13 = ~(-1 << v10);
    v14 = v13 ^ (-1 << v5);
    v11 = a1 >> 6;
    goto LABEL_22;
  }
  *(_QWORD *)(v12 + 8 * v4) &= ~(-1 << v5);
  if (v11 <= v4)
    goto LABEL_29;
  if (v4 + 1 == v11)
    goto LABEL_19;
  if (v4 + 1 >= v11)
  {
LABEL_30:
    __break(1u);
    return;
  }
  bzero((void *)(v12 + 8 * v4 + 8), 8 * (v11 + ~v4));
LABEL_19:
  if ((v9 & 1) != 0)
    v14 = 0;
  else
    v14 = -1 << v10;
LABEL_22:
  *(_QWORD *)(v12 + 8 * v11) &= v14;
}

uint64_t BitArray._UnsafeHandle._count.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t BitArray._UnsafeHandle._count.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*BitArray._UnsafeHandle._count.modify())(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

ValueMetadata *type metadata accessor for BitArray._UnsafeHandle()
{
  return &type metadata for BitArray._UnsafeHandle;
}

uint64_t _HashTable.UnsafeHandle.bucketCount.getter(_QWORD *a1)
{
  return 1 << *a1;
}

uint64_t _HashTable.UnsafeHandle._find<A>(_:in:)(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t result;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t AssociatedTypeWitness;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41[40];
  __int128 v42;
  __int128 v43;
  unint64_t v44;
  char v45;

  v35 = a2;
  v39 = a6;
  v11 = *(_QWORD *)(*(_QWORD *)(a6 + 8) + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v34 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v32 - v15;
  v37 = v11;
  v17 = swift_getAssociatedTypeWitness();
  v33 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v32 - v18;
  v38 = a1;
  v40 = a7;
  result = sub_23835ABF0();
  v21 = 1 << *a3;
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    _HashTable.UnsafeHandle.startFind(_:)(v23 & result, a3, a4, (uint64_t)&v42);
    v24 = v44;
    if ((v45 & 1) == 0)
    {
      v25 = AssociatedTypeWitness;
      while (1)
      {
        sub_23835B178();
        sub_23835B154();
        v26 = *(void (**)(char *, uint64_t))(v34 + 8);
        v26(v14, v25);
        v27 = sub_23835B274();
        v28 = v33;
        (*(void (**)(char *))(v33 + 16))(v19);
        ((void (*)(char *, _QWORD))v27)(v41, 0);
        v26(v16, v25);
        LOBYTE(v27) = sub_23835AD40();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v19, v17);
        if ((v27 & 1) != 0)
          break;
        _HashTable.BucketIterator.advance()();
        if (!*((_QWORD *)&v43 + 1))
          return 0;
        v29 = -1 << *(_QWORD *)v42;
        v30 = (v29 ^ ~*((_QWORD *)&v43 + 1)) + (*(uint64_t *)(v42 + 8) >> 6);
        if (v30 >= ~v29)
          v31 = ~v29;
        else
          v31 = 0;
        v24 = v30 - v31;
      }
    }
    return v24;
  }
  return result;
}

uint64_t _HashTable.UnsafeHandle.scale.getter(_QWORD *a1)
{
  return *a1 & 0x3FLL;
}

uint64_t _HashTable.UnsafeHandle.seed.getter(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t _HashTable.UnsafeHandle.position(of:)(uint64_t a1, _QWORD *a2)
{
  return ((*a2 & 0x3FLL) * a1) >> 6;
}

uint64_t _HashTable.UnsafeHandle.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(_QWORD *)(a3 + 8 * a1);
}

uint64_t _HashTable.UnsafeHandle.bucketMask.getter(_QWORD *a1)
{
  return ~(-1 << *a1);
}

_QWORD *_HashTable.UnsafeHandle.wordCount.getter(_QWORD *result)
{
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (*result & 0x3FLL) << *result;
  v2 = __OFADD__(v1, 64);
  v3 = v1 + 64;
  if (v2)
  {
    __break(1u);
  }
  else
  {
    v5 = v3 - 1;
    v4 = v3 < 1;
    v6 = v3 + 62;
    if (!v4)
      v6 = v5;
    return (_QWORD *)(v6 >> 6);
  }
  return result;
}

Swift::Int __swiftcall _HashTable.UnsafeHandle.word(after:)(Swift::Int after)
{
  _QWORD *v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;

  if (__OFADD__(after, 1))
  {
    __break(1u);
    goto LABEL_9;
  }
  v2 = (*v1 & 0x3FLL) << *v1;
  v3 = __OFADD__(v2, 64);
  v4 = v2 + 64;
  if (v3)
  {
LABEL_9:
    __break(1u);
    return after;
  }
  v6 = v4 - 1;
  v5 = v4 < 1;
  v7 = v4 + 62;
  if (!v5)
    v7 = v6;
  if (after + 1 == v7 >> 6)
    return 0;
  return ++after;
}

Swift::Int_optional __swiftcall _HashTable.UnsafeHandle._value(forBucketContents:)(Swift::UInt64 forBucketContents)
{
  _QWORD *v1;
  uint64_t v2;
  Swift::UInt64 v3;
  uint64_t v4;
  Swift::Int v5;
  Swift::Bool v6;
  Swift::Int v7;
  Swift::Int_optional result;

  if (forBucketContents)
  {
    v2 = -1 << *v1;
    v3 = (v2 ^ ~forBucketContents) + ((uint64_t)v1[1] >> 6);
    if (v3 >= ~v2)
      v4 = ~v2;
    else
      v4 = 0;
    v5 = v3 - v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = forBucketContents == 0;
  v7 = v5;
  result.value = v7;
  result.is_nil = v6;
  return result;
}

Swift::UInt64 __swiftcall _HashTable.UnsafeHandle._bucketContents(for:)(Swift::Int_optional a1)
{
  _QWORD *v1;

  if (a1.is_nil)
    return 0;
  else
    return (-1 << *v1) ^ ~((((a1.value - ((uint64_t)v1[1] >> 6)) >> 63) & ~(-1 << *v1))
                           + a1.value
                           - ((uint64_t)v1[1] >> 6));
}

uint64_t _HashTable.UnsafeHandle.subscript.setter(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)(a4 + 8 * a2) = result;
  return result;
}

uint64_t _HashTable.UnsafeHandle.fill<A>(uncheckedUniqueElements:)(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t AssociatedConformanceWitness;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  _QWORD *v25;
  uint64_t v26;
  void (*v27)(_QWORD *, _QWORD);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  BOOL v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t result;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, char *, uint64_t);
  unsigned int (*v67)(char *, uint64_t, uint64_t);
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[2];
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  char v87;

  v75 = a6;
  v80 = a1;
  v9 = *(_QWORD *)(*(_QWORD *)(a5 + 8) + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v71 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v72 = AssociatedTypeWitness;
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v70 = (char *)&v64 - v11;
  v12 = swift_getAssociatedTypeWitness();
  v81 = *(_QWORD *)(v12 - 8);
  v79 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v69 = (char *)&v64 - v13;
  v14 = sub_23835B334();
  MEMORY[0x24BDAC7A8](v14);
  v78 = (char *)&v64 - v15;
  v16 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v16);
  swift_getAssociatedConformanceWitness();
  v17 = swift_getAssociatedTypeWitness();
  v65 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v64 - v18;
  v73 = v9;
  v74 = a4;
  sub_23835B1B4();
  sub_23835AF8C();
  v20 = v78;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v76 = v19;
  v77 = v17;
  v68 = AssociatedConformanceWitness;
  sub_23835B484();
  v22 = v79;
  v67 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v81 + 48);
  if (v67(v20, 1, v79) == 1)
    return (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v76, v77);
  v23 = 0;
  v66 = *(void (**)(char *, char *, uint64_t))(v81 + 32);
  v24 = v69;
  while (1)
  {
    v66(v24, v20, v22);
    v25 = a2;
    v26 = v22;
    v27 = (void (*)(_QWORD *, _QWORD))sub_23835B274();
    v29 = v70;
    v28 = v71;
    v30 = v72;
    (*(void (**)(char *))(v71 + 16))(v70);
    v27(v82, 0);
    v31 = v26;
    a2 = v25;
    (*(void (**)(char *, uint64_t))(v81 + 8))(v24, v31);
    v32 = sub_23835ABF0();
    v33 = 1 << *v25;
    v34 = __OFSUB__(v33, 1);
    v35 = v33 - 1;
    if (v34)
      goto LABEL_40;
    v36 = v35 & v32;
    v37 = _HashTable.UnsafeHandle._startIterator(bucket:)(v35 & v32, v25, a3);
    v38 = v29;
    v39 = v37;
    v40 = v30;
    v42 = v41;
    v43 = v28;
    v45 = v44;
    (*(void (**)(char *, uint64_t))(v43 + 8))(v38, v40);
    v82[0] = v25;
    v82[1] = a3;
    v83 = v36;
    v84 = v39;
    v85 = v42;
    v86 = v45;
    v87 = 0;
    if (v39)
      break;
LABEL_33:
    _HashTable.BucketIterator.currentValue.setter(v23, 0);
    v34 = __OFADD__(v23++, 1);
    if (v34)
      goto LABEL_41;
    v20 = v78;
    sub_23835B484();
    v22 = v79;
    if (v67(v20, 1, v79) == 1)
      return (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v76, v77);
  }
  v46 = 0;
  v47 = *v25 & 0x3FLL;
  v48 = 1 << *v25;
  v49 = v47 << *v25;
  v50 = v49 + 64;
  v51 = __OFADD__(v49, 64);
  v53 = v50 - 1;
  v52 = v50 < 1;
  v54 = v50 + 62;
  if (!v52)
    v54 = v53;
  v55 = v54 >> 6;
  while (1)
  {
    if (++v36 == v48)
    {
      if ((v46 & 1) != 0)
        goto LABEL_42;
      v36 = 0;
      v46 = 1;
    }
    if (v45 >= v47)
      break;
    v56 = (v36 * v47) >> 6;
    if (v45)
    {
      if (v51)
        goto LABEL_39;
      if (v56 + 1 == v55)
        v56 = 0;
      else
        ++v56;
    }
    v57 = v47 - v45;
    if (__OFSUB__(v47, v45))
      goto LABEL_37;
    if (v56 == 2 && v47 == 5)
      v59 = 32;
    else
      v59 = 64;
    v34 = __OFSUB__(v59, v57);
    v60 = v59 - v57;
    if (v34)
      goto LABEL_38;
    v61 = *(_QWORD *)(a3 + 8 * v56);
    v62 = (v61 << v45) | v42;
    v42 = v61 >> v57;
    v45 = v60;
LABEL_11:
    if ((v62 & (v48 - 1)) == 0)
    {
      v87 = v46;
      v85 = v42;
      v86 = v45;
      v83 = v36;
      v84 = 0;
      goto LABEL_33;
    }
  }
  v34 = __OFSUB__(v45, v47);
  v45 -= v47;
  if (!v34)
  {
    v62 = v42;
    v42 >>= v47;
    goto LABEL_11;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  result = sub_23835B7CC();
  __break(1u);
  return result;
}

uint64_t _HashTable.UnsafeHandle.fill<A>(untilFirstDuplicateIn:)(char *a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
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
  char *v25;
  _QWORD *v26;
  uint64_t AssociatedConformanceWitness;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  void (*v31)(_BYTE *, _QWORD);
  char *v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  void (*v49)(_BYTE *, _QWORD);
  uint64_t v50;
  void (*v51)(char *);
  void (*v52)(char *, uint64_t);
  uint64_t v53;
  char *v54;
  char *v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  int v58;
  uint64_t v59;
  char *v60;
  uint64_t (*v61)(char *, uint64_t, uint64_t);
  uint64_t v62;
  void (*v63)(char *, char *, uint64_t);
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  _QWORD *v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t);
  void (*v76)(char *);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  char *v84;
  _BYTE v85[32];
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;

  v78 = a7;
  v64 = a4;
  v70 = a3;
  v83 = a2;
  v60 = a1;
  v74 = a6;
  v8 = *(_QWORD *)(*(_QWORD *)(a6 + 8) + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v69 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v73 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v84 = (char *)&v59 - v12;
  v13 = swift_getAssociatedTypeWitness();
  v81 = *(_QWORD *)(v13 - 8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v72 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v71 = (char *)&v59 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v82 = (char *)&v59 - v18;
  v19 = sub_23835B334();
  MEMORY[0x24BDAC7A8](v19);
  v68 = (char *)&v59 - v20;
  v21 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v21);
  swift_getAssociatedConformanceWitness();
  v22 = swift_getAssociatedTypeWitness();
  v59 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v59 - v23;
  v79 = a5;
  v25 = v68;
  v80 = v8;
  sub_23835B1B4();
  sub_23835AF8C();
  v26 = v70;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v66 = v24;
  v28 = v69;
  v67 = v22;
  v62 = AssociatedConformanceWitness;
  sub_23835B484();
  v61 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v81 + 48);
  if (v61(v25, 1, v13) == 1)
  {
LABEL_2:
    (*(void (**)(char *, uint64_t))(v59 + 8))(v66, v67);
    sub_23835B1CC();
    return 1;
  }
  else
  {
    v30 = 0;
    v63 = *(void (**)(char *, char *, uint64_t))(v81 + 32);
    v77 = v13;
    while (1)
    {
      v63(v82, v25, v13);
      v31 = (void (*)(_BYTE *, _QWORD))sub_23835B274();
      v32 = v84;
      v76 = *(void (**)(char *))(v28 + 16);
      v76(v84);
      v31(v85, 0);
      result = sub_23835ABF0();
      v33 = 1 << *v26;
      v34 = __OFSUB__(v33, 1);
      v35 = v33 - 1;
      if (v34)
      {
        __break(1u);
LABEL_13:
        __break(1u);
        return result;
      }
      v65 = v30;
      v36 = v35 & result;
      v37 = v32;
      v38 = v64;
      v39 = _HashTable.UnsafeHandle._startIterator(bucket:)(v35 & result, v26, v64);
      v41 = v40;
      v43 = v42;
      v75 = *(void (**)(char *, uint64_t))(v28 + 8);
      v75(v37, AssociatedTypeWitness);
      v86 = v26;
      v87 = v38;
      v88 = v36;
      v89 = v39;
      v90 = v41;
      v91 = v43;
      v92 = 0;
      if (v39)
        break;
LABEL_8:
      v57 = v65;
      _HashTable.BucketIterator.currentValue.setter(v65, 0);
      v13 = v77;
      result = (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v82, v77);
      v34 = __OFADD__(v57, 1);
      v30 = v57 + 1;
      if (v34)
        goto LABEL_13;
      v25 = v68;
      sub_23835B484();
      v58 = v61(v25, 1, v13);
      v26 = v70;
      v28 = v69;
      if (v58 == 1)
        goto LABEL_2;
    }
    while (1)
    {
      v44 = v72;
      sub_23835B178();
      v45 = v71;
      sub_23835B154();
      v46 = v81;
      v47 = *(void (**)(char *, uint64_t))(v81 + 8);
      v48 = v77;
      v47(v44, v77);
      v49 = (void (*)(_BYTE *, _QWORD))sub_23835B274();
      v50 = AssociatedTypeWitness;
      v51 = v76;
      v76(v84);
      v49(v85, 0);
      v47(v45, v48);
      v52 = v47;
      (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v45, v82, v48);
      v53 = sub_23835B274();
      v54 = v73;
      v51(v73);
      AssociatedTypeWitness = v50;
      ((void (*)(_BYTE *, _QWORD))v53)(v85, 0);
      v52(v45, v48);
      v55 = v84;
      LOBYTE(v53) = sub_23835AD40();
      v56 = v75;
      v75(v54, v50);
      v56(v55, v50);
      if ((v53 & 1) != 0)
        break;
      _HashTable.BucketIterator.advance()();
      if (!v89)
        goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t))(v59 + 8))(v66, v67);
    v63(v60, v82, v77);
    return 0;
  }
}

BOOL _HashTable.UnsafeHandle.isOccupied(_:)(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return _HashTable.UnsafeHandle.subscript.getter(a1, a2, a3) != 0;
}

unint64_t _HashTable.UnsafeHandle.subscript.setter(uint64_t a1, char a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  unint64_t v5;

  if ((a2 & 1) != 0)
    v5 = 0;
  else
    v5 = (-1 << *a4) ^ ~((((a1 - ((uint64_t)a4[1] >> 6)) >> 63) & ~(-1 << *a4)) + a1 - ((uint64_t)a4[1] >> 6));
  return _HashTable.UnsafeHandle.subscript.setter(v5, a3, a4, a5);
}

uint64_t _HashTable.UnsafeHandle.adjustContents<A>(preparingForInsertionOfElementAtOffset:in:)(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
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
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  BOOL v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  BOOL v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  unint64_t v129;
  unint64_t v130;
  unint64_t v131;
  unint64_t v132;
  uint64_t v133;
  unint64_t v134;
  char *v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  void (*v140)(char *, char *, uint64_t);
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  char v155;
  uint64_t v156;
  BOOL v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  unint64_t v166;
  unint64_t v167;
  unint64_t v168;
  unint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t result;
  uint64_t v173;
  char *v174;
  uint64_t v175;
  uint64_t v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t (*v186)(char *, uint64_t);
  uint64_t v187;
  char *v188;
  uint64_t v189;
  char *v190;
  void (*v191)(char *, char *, uint64_t);
  char *v192;
  char *v193;
  char *v194;
  char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  _QWORD *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  unint64_t v203;
  uint64_t v204;
  char v205;

  v196 = a7;
  v189 = a6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v176 = sub_23835B748();
  v175 = *(_QWORD *)(v176 - 8);
  MEMORY[0x24BDAC7A8](v176);
  v174 = (char *)&v173 - v13;
  v14 = swift_getAssociatedTypeWitness();
  v197 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v194 = (char *)&v173 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v195 = (char *)&v173 - v17;
  v181 = v18;
  v19 = sub_23835B334();
  v20 = MEMORY[0x24BDAC7A8](v19);
  v191 = (void (*)(char *, char *, uint64_t))((char *)&v173 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v20);
  v190 = (char *)&v173 - v22;
  v23 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v23);
  v183 = (char *)&v173 - v24;
  v185 = AssociatedConformanceWitness;
  v179 = sub_23835B754();
  v178 = *(_QWORD *)(v179 - 8);
  MEMORY[0x24BDAC7A8](v179);
  v177 = (char *)&v173 - v25;
  v182 = *(_QWORD *)(swift_getAssociatedConformanceWitness() + 8);
  v184 = v23;
  v198 = swift_getAssociatedTypeWitness();
  v180 = *(_QWORD *)(v198 - 8);
  v26 = MEMORY[0x24BDAC7A8](v198);
  v192 = (char *)&v173 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v193 = (char *)&v173 - v29;
  v30 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v31 = MEMORY[0x24BDAC7A8](v28);
  v33 = (char *)&v173 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v173 - v34;
  sub_23835B178();
  v188 = v35;
  sub_23835B154();
  v36 = *(uint64_t (**)(char *, uint64_t))(v30 + 8);
  v189 = AssociatedTypeWitness;
  v186 = v36;
  v36(v33, AssociatedTypeWitness);
  v187 = a2;
  v37 = sub_23835B190();
  if (v37 >= 0)
    v38 = v37;
  else
    v38 = v37 + 1;
  if (a1 < v38 >> 1)
  {
    v39 = 1 << *a3;
    v40 = __OFSUB__(v39, 1);
    v41 = v39 - 1;
    if (v40)
      goto LABEL_167;
    v42 = *a3 & 0x3FLL;
    v43 = a3[1];
    if (v43 >= -64)
      v44 = 0;
    else
      v44 = v41;
    v45 = v44 + (v43 >> 6) + 1;
    if (v45 < v41)
      v41 = 0;
    a3[1] = a3[1] & 0x3FLL | ((v45 - v41) << 6);
    if (_s19CollectionsInternal10_HashTableV15maximumCapacity8forScaleS2i_tFZ_0(v42) / 3 < a1)
    {
      v46 = _HashTable.UnsafeHandle._startIterator(bucket:)(0, a3, a4);
      v47 = 0;
      v199 = a3;
      v200 = a4;
      v201 = 0;
      v202 = v46;
      v203 = v48;
      v204 = v49;
      v205 = 0;
      while (1)
      {
        if (v202)
        {
          v50 = v199;
          v51 = ~(-1 << *v199);
          v52 = (uint64_t)v199[1] >> 6;
          v53 = v52 + (v202 ^ v51);
          v54 = v53 >= v51 ? ~(-1 << *v199) : 0;
          v55 = v53 - v54;
          if (v55 <= a1)
          {
            v40 = __OFSUB__(v55, 1);
            v56 = v55 - 1;
            if (v40)
              goto LABEL_164;
            v57 = *v199 & 0x3FLL;
            v58 = ((v51 & ((v56 - v52) >> 63)) + v56 - v52) ^ v51;
            v59 = v58 ^ v202;
            v60 = v57 * v47;
            v61 = (v57 * v47) >> 6;
            v62 = (v57 * v47) & 0x3F;
            v63 = v200;
            *(_QWORD *)(v200 + 8 * v61) ^= (v58 ^ v202) << v60;
            v64 = *v50 & 0x3FLL;
            if (64 - v62 < v64)
            {
              v65 = v64 << v64;
              v40 = __OFADD__(v65, 64);
              v66 = v65 + 64;
              if (v40)
                goto LABEL_166;
              v68 = v66 - 1;
              v67 = v66 < 1;
              v69 = v66 + 62;
              if (!v67)
                v69 = v68;
              if (v61 + 1 == v69 >> 6)
                v70 = 0;
              else
                v70 = v61 + 1;
              *(_QWORD *)(v63 + 8 * v70) ^= v59 >> (64 - v62);
            }
            v202 = v58;
          }
        }
        _HashTable.BucketIterator.advance()();
        v47 = v201;
        if (!v201)
          return v186(v188, v189);
      }
    }
LABEL_51:
    v97 = v188;
    v98 = v189;
    if ((sub_23835AD40() & 1) != 0)
    {
      v99 = v177;
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v177, v97, v98);
      v100 = v179;
      MEMORY[0x23B831670](MEMORY[0x24BEE2C68], v179);
      sub_23835B244();
      (*(void (**)(char *, uint64_t))(v178 + 8))(v99, v100);
      sub_23835AF8C();
      v101 = swift_getAssociatedConformanceWitness();
      v102 = v190;
      v194 = (char *)v101;
      sub_23835B484();
      v103 = v181;
      v192 = *(char **)(v197 + 48);
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v192)(v102, 1, v181) != 1)
      {
        v191 = *(void (**)(char *, char *, uint64_t))(v197 + 32);
        v104 = 1;
        do
        {
          v191(v195, v102, v103);
          v105 = sub_23835ABF0();
          v106 = *a3;
          v107 = 1 << *a3;
          v108 = v107 - 1;
          if (__OFSUB__(v107, 1))
            goto LABEL_158;
          v109 = v108 & v105;
          v110 = _HashTable.UnsafeHandle._startIterator(bucket:)(v108 & v105, a3, a4);
          v199 = a3;
          v200 = a4;
          if (!v110)
            goto LABEL_172;
          v113 = -1 << *a3;
          v114 = ~v113;
          v115 = (uint64_t)a3[1] >> 6;
          v116 = (v113 ^ ~v110) + v115;
          if (v116 >= ~v113)
            v117 = ~v113;
          else
            v117 = 0;
          if (v116 - v117 != v104)
          {
            v118 = 0;
            v119 = v106 & 0x3F;
            v120 = __OFADD__(v119 << v119, 64);
            v121 = (v119 << v119) + 126;
            if ((v119 << v119) + 64 >= 1)
              v121 = (v119 << v119) + 63;
            v122 = v121 >> 6;
            while (1)
            {
              if (++v109 == v107)
              {
                if ((v118 & 1) != 0)
                  goto LABEL_174;
                v109 = 0;
                v118 = 1;
              }
              if (v112 >= v119)
              {
                v40 = __OFSUB__(v112, v119);
                v112 -= v119;
                if (v40)
                {
                  __break(1u);
LABEL_151:
                  __break(1u);
LABEL_152:
                  __break(1u);
LABEL_153:
                  __break(1u);
LABEL_154:
                  __break(1u);
                  goto LABEL_155;
                }
                v129 = v111 >> v119;
              }
              else
              {
                v123 = (v109 * v119) >> 6;
                if (v112)
                {
                  if (v120)
                    goto LABEL_156;
                  if (v123 + 1 == v122)
                    v123 = 0;
                  else
                    ++v123;
                }
                v124 = v119 - v112;
                if (__OFSUB__(v119, v112))
                  goto LABEL_151;
                if (v123 == 2 && v119 == 5)
                  v126 = 32;
                else
                  v126 = 64;
                v40 = __OFSUB__(v126, v124);
                v127 = v126 - v124;
                if (v40)
                  goto LABEL_153;
                v128 = *(_QWORD *)(a4 + 8 * v123);
                v111 |= v128 << v112;
                v129 = v128 >> v124;
                v112 = v127;
              }
              v110 = v111 & v108;
              if ((v111 & v108) == 0)
                goto LABEL_172;
              v130 = (v110 ^ v114) + v115;
              if (v130 >= v114)
                v131 = v114;
              else
                v131 = 0;
              v111 = v129;
              if (v130 - v131 == v104)
              {
                v111 = v129;
                goto LABEL_93;
              }
            }
          }
          v118 = 0;
LABEL_93:
          v205 = v118;
          v201 = v109;
          v202 = v110;
          v203 = v111;
          v204 = v112;
          v132 = v115 + (v110 ^ v108);
          if (v132 >= v108)
            v133 = v107 - 1;
          else
            v133 = 0;
          v134 = v132 - v133;
          if (__OFSUB__(v134, 1))
            goto LABEL_160;
          _HashTable.BucketIterator.currentValue.setter(v134 - 1, 0);
          (*(void (**)(char *, uint64_t))(v197 + 8))(v195, v103);
          v40 = __OFADD__(v104++, 1);
          if (v40)
            goto LABEL_161;
          v102 = v190;
          sub_23835B484();
        }
        while (((unsigned int (*)(char *, uint64_t, uint64_t))v192)(v102, 1, v103) != 1);
      }
      (*(void (**)(char *, uint64_t))(v180 + 8))(v193, v198);
      return v186(v188, v189);
    }
    goto LABEL_170;
  }
  v71 = sub_23835B190();
  v72 = v71 - a1;
  if (__OFSUB__(v71, a1))
    goto LABEL_168;
  if (__OFSUB__(v72, 1))
  {
LABEL_169:
    __break(1u);
LABEL_170:
    __break(1u);
LABEL_171:
    __break(1u);
LABEL_172:
    __break(1u);
    goto LABEL_173;
  }
  if (_s19CollectionsInternal10_HashTableV15maximumCapacity8forScaleS2i_tFZ_0(*a3 & 0x3FLL) / 3 < v72 - 1)
  {
    v73 = _HashTable.UnsafeHandle._startIterator(bucket:)(0, a3, a4);
    v74 = 0;
    v199 = a3;
    v200 = a4;
    v201 = 0;
    v202 = v73;
    v203 = v75;
    v204 = v76;
    v205 = 0;
    while (1)
    {
      if (v202)
      {
        v80 = v199;
        v81 = ~(-1 << *v199);
        v82 = (uint64_t)v199[1] >> 6;
        v83 = v82 + (v202 ^ v81);
        v84 = v83 >= v81 ? ~(-1 << *v199) : 0;
        v85 = v83 - v84;
        if (v85 >= a1)
        {
          v40 = __OFADD__(v85, 1);
          v86 = v85 + 1;
          if (v40)
            goto LABEL_165;
          v87 = *v199 & 0x3FLL;
          v88 = ((v81 & ((v86 - v82) >> 63)) + v86 - v82) ^ v81;
          v89 = v88 ^ v202;
          v90 = v87 * v74;
          v91 = (v87 * v74) >> 6;
          v92 = (v87 * v74) & 0x3F;
          v93 = v200;
          *(_QWORD *)(v200 + 8 * v91) ^= (v88 ^ v202) << v90;
          v94 = *v80 & 0x3FLL;
          if (64 - v92 < v94)
          {
            v95 = v94 << v94;
            v40 = __OFADD__(v95, 64);
            v96 = v95 + 64;
            if (v40)
            {
              __break(1u);
              goto LABEL_51;
            }
            v77 = v96 - 1;
            v67 = v96 < 1;
            v78 = v96 + 62;
            if (!v67)
              v78 = v77;
            if (v91 + 1 == v78 >> 6)
              v79 = 0;
            else
              v79 = v91 + 1;
            *(_QWORD *)(v93 + 8 * v79) ^= v89 >> (64 - v92);
          }
          v202 = v88;
        }
      }
      _HashTable.BucketIterator.advance()();
      v74 = v201;
      if (!v201)
        return v186(v188, v189);
    }
  }
  v135 = v188;
  v136 = v189;
  if ((sub_23835AD40() & 1) == 0)
    goto LABEL_171;
  v137 = v174;
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v174, v135, v136);
  v138 = v176;
  MEMORY[0x23B831670](MEMORY[0x24BEE2C50], v176);
  sub_23835B244();
  (*(void (**)(char *, uint64_t))(v175 + 8))(v137, v138);
  sub_23835AF8C();
  v139 = swift_getAssociatedConformanceWitness();
  v140 = v191;
  v195 = (char *)v139;
  sub_23835B484();
  v141 = v181;
  v193 = *(char **)(v197 + 48);
  if (((unsigned int (*)(_QWORD, uint64_t, uint64_t))v193)(v140, 1, v181) == 1)
  {
LABEL_148:
    (*(void (**)(char *, uint64_t))(v180 + 8))(v192, v198);
    return v186(v188, v189);
  }
  v190 = *(char **)(v197 + 32);
  while (1)
  {
    ((void (*)(char *, _QWORD, uint64_t))v190)(v194, v140, v141);
    v142 = sub_23835ABF0();
    v143 = *a3;
    v144 = 1 << *a3;
    v145 = v144 - 1;
    if (__OFSUB__(v144, 1))
      goto LABEL_159;
    v146 = v145 & v142;
    v147 = _HashTable.UnsafeHandle._startIterator(bucket:)(v145 & v142, a3, a4);
    v199 = a3;
    v200 = a4;
    if (!v147)
      break;
    v150 = -1 << *a3;
    v151 = ~v150;
    v152 = (uint64_t)a3[1] >> 6;
    v153 = (v150 ^ ~v147) + v152;
    if (v153 >= ~v150)
      v154 = ~v150;
    else
      v154 = 0;
    if (v153 - v154 != a1)
    {
      v155 = 0;
      v156 = v143 & 0x3F;
      v157 = __OFADD__(v156 << v156, 64);
      v158 = (v156 << v156) + 126;
      if ((v156 << v156) + 64 >= 1)
        v158 = (v156 << v156) + 63;
      v159 = v158 >> 6;
      while (1)
      {
        if (++v146 == v144)
        {
          if ((v155 & 1) != 0)
            goto LABEL_174;
          v146 = 0;
          v155 = 1;
        }
        if (v149 >= v156)
        {
          v40 = __OFSUB__(v149, v156);
          v149 -= v156;
          if (v40)
            goto LABEL_152;
          v166 = v148 >> v156;
        }
        else
        {
          v160 = (v146 * v156) >> 6;
          if (v149)
          {
            if (v157)
              goto LABEL_157;
            if (v160 + 1 == v159)
              v160 = 0;
            else
              ++v160;
          }
          v161 = v156 - v149;
          if (__OFSUB__(v156, v149))
            goto LABEL_154;
          if (v160 == 2 && v156 == 5)
            v163 = 32;
          else
            v163 = 64;
          v40 = __OFSUB__(v163, v161);
          v164 = v163 - v161;
          if (v40)
          {
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
            __break(1u);
LABEL_166:
            __break(1u);
LABEL_167:
            __break(1u);
LABEL_168:
            __break(1u);
            goto LABEL_169;
          }
          v165 = *(_QWORD *)(a4 + 8 * v160);
          v148 |= v165 << v149;
          v166 = v165 >> v161;
          v149 = v164;
        }
        v147 = v148 & v145;
        if ((v148 & v145) == 0)
          goto LABEL_173;
        v167 = (v147 ^ v151) + v152;
        if (v167 >= v151)
          v168 = v151;
        else
          v168 = 0;
        v148 = v166;
        if (v167 - v168 == a1)
        {
          v148 = v166;
          goto LABEL_142;
        }
      }
    }
    v155 = 0;
LABEL_142:
    v205 = v155;
    v201 = v146;
    v202 = v147;
    v203 = v148;
    v204 = v149;
    v169 = v152 + (v147 ^ v145);
    if (v169 >= v145)
      v170 = v144 - 1;
    else
      v170 = 0;
    v171 = v169 - v170;
    v140 = v191;
    if (__OFADD__(v171, 1))
      goto LABEL_162;
    _HashTable.BucketIterator.currentValue.setter(v171 + 1, 0);
    (*(void (**)(char *, uint64_t))(v197 + 8))(v194, v141);
    v40 = __OFADD__(a1++, 1);
    if (v40)
      goto LABEL_163;
    sub_23835B484();
    if (((unsigned int (*)(_QWORD, uint64_t, uint64_t))v193)(v140, 1, v141) == 1)
      goto LABEL_148;
  }
LABEL_173:
  __break(1u);
LABEL_174:
  result = sub_23835B7CC();
  __break(1u);
  return result;
}

Swift::Void __swiftcall _HashTable.UnsafeHandle.clear()()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (*v0 & 0x3FLL) << *v0;
  v3 = __OFADD__(v2, 64);
  v4 = v2 + 64;
  if (v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return;
  }
  v5 = v4 - 1;
  if (v4 < 1)
    v5 = v4 + 62;
  if (v4 < -62)
    goto LABEL_8;
  if ((unint64_t)(v4 + 62) >= 0x7F)
    bzero(v1, 8 * (v5 >> 6));
}

unint64_t _HashTable.UnsafeHandle.delete(bucket:hashValueGenerator:)(uint64_t a1, uint64_t (*a2)(unint64_t, _QWORD), uint64_t a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t result;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v26;
  uint64_t v29;

  v8 = a1;
  v29 = _HashTable.UnsafeHandle._startIterator(bucket:)(a1, a4, a5);
  _HashTable.BucketIterator.advance()();
  v9 = v29;
  if (!v29)
    return _HashTable.UnsafeHandle.subscript.setter(0, v8, a4, a5);
  v26 = a5;
  v10 = _HashTable.UnsafeHandle.firstOccupiedBucketInChain(with:)(v8, a4, a5);
  v11 = a1;
  while (1)
  {
    v16 = -1 << *a4;
    v17 = (v16 ^ ~v9) + ((uint64_t)a4[1] >> 6);
    v18 = v17 >= ~v16 ? ~v16 : 0;
    result = a2(v17 - v18, *a4);
    v20 = 1 << *a4;
    v21 = __OFSUB__(v20, 1);
    v22 = v20 - 1;
    if (v21)
      break;
    v23 = v22 & result;
    if (v8 >= v10)
    {
      if (v23 >= v10 && v8 >= v23)
      {
LABEL_3:
        v12 = -1 << *a4;
        v13 = (v12 ^ ~v9) + ((uint64_t)a4[1] >> 6);
        if (v13 >= ~v12)
          v14 = v12 + 1;
        else
          v14 = 0;
        v15 = v13 - ((uint64_t)a4[1] >> 6) + v14;
        _HashTable.UnsafeHandle.subscript.setter(((v22 & (v15 >> 63)) + v15) ^ v22, v8, a4, v26);
        v8 = v11;
      }
    }
    else if (v23 >= v10 || v8 >= v23)
    {
      goto LABEL_3;
    }
    _HashTable.BucketIterator.advance()();
    v11 = a1;
    v9 = v29;
  }
  __break(1u);
  return result;
}

uint64_t _HashTable.UnsafeHandle.adjustContents<A>(preparingForRemovalOf:in:)(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  char *v27;
  void (*v28)(char *, uint64_t, uint64_t);
  char *v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t TupleTypeMetadata2;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v46 = a4;
  v47 = a7;
  v45 = a3;
  v49 = a6;
  v50 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v10 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v37 - v13;
  swift_getAssociatedConformanceWitness();
  v15 = sub_23835B2EC();
  v42 = *(_QWORD *)(v15 - 8);
  v43 = v15;
  v16 = MEMORY[0x24BDAC7A8](v15);
  v40 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v37 - v19;
  v21 = *(_QWORD **)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v37 - v22;
  v44 = a2;
  v48 = a5;
  v24 = v50;
  sub_23835B19C();
  result = sub_23835AC8C();
  if ((result & 1) != 0)
  {
    v38 = v20;
    v26 = TupleTypeMetadata2;
    v27 = &v14[*(int *)(TupleTypeMetadata2 + 48)];
    v28 = (void (*)(char *, uint64_t, uint64_t))v21[2];
    v28(v14, v24, AssociatedTypeWitness);
    v39 = v23;
    v28(v27, (uint64_t)v23, AssociatedTypeWitness);
    v29 = &v12[*(int *)(v26 + 48)];
    v28(v12, (uint64_t)v14, AssociatedTypeWitness);
    v28(v29, (uint64_t)v27, AssociatedTypeWitness);
    v30 = (void (*)(char *, char *, uint64_t))v21[4];
    v31 = v40;
    v30(v40, v12, AssociatedTypeWitness);
    v32 = (void (*)(char *, uint64_t))v21[1];
    v32(v29, AssociatedTypeWitness);
    v33 = &v12[*(int *)(v26 + 48)];
    v30(v12, v14, AssociatedTypeWitness);
    v30(v33, v27, AssociatedTypeWitness);
    v34 = v43;
    v30(&v31[*(int *)(v43 + 36)], v33, AssociatedTypeWitness);
    v32(v12, AssociatedTypeWitness);
    v35 = v42;
    v36 = (uint64_t)v38;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v38, v31, v34);
    _HashTable.UnsafeHandle.adjustContents<A>(preparingForRemovalOf:in:)(v36, v44, v45, v46, v48, v49, v47);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v34);
    return ((uint64_t (*)(char *, uint64_t))v32)(v39, AssociatedTypeWitness);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void _HashTable.UnsafeHandle.adjustContents<A>(preparingForRemovalOf:in:)(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
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
  char *v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
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
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(char *, char *, uint64_t);
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  BOOL v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  BOOL v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;
  unint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  int64_t v128;
  int64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  char v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  _QWORD *v144;
  unint64_t v145;
  uint64_t v146;
  unint64_t v147;
  uint64_t v148;
  int64_t v149;
  int64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  char v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  _QWORD *v177;
  uint64_t v178;
  uint64_t v179;
  void (*v180)(char *, char *, uint64_t);
  char *v181;
  char *v182;
  char *v183;
  char *v184;
  char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  _QWORD *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  unint64_t v194;
  uint64_t v195;
  char v196;

  v186 = a7;
  v177 = a3;
  v178 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v168 = sub_23835B754();
  v167 = *(_QWORD *)(v168 - 8);
  MEMORY[0x24BDAC7A8](v168);
  v169 = (char *)&v164 - v11;
  v12 = swift_getAssociatedTypeWitness();
  v188 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v185 = (char *)&v164 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v184 = (char *)&v164 - v15;
  v187 = v16;
  v17 = sub_23835B334();
  v18 = MEMORY[0x24BDAC7A8](v17);
  v181 = (char *)&v164 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v180 = (void (*)(char *, char *, uint64_t))((char *)&v164 - v20);
  v21 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v21);
  v173 = (char *)&v164 - v22;
  v165 = sub_23835B748();
  v164 = *(_QWORD *)(v165 - 8);
  MEMORY[0x24BDAC7A8](v165);
  v166 = (char *)&v164 - v23;
  v172 = *(_QWORD *)(swift_getAssociatedConformanceWitness() + 8);
  v174 = v21;
  v189 = swift_getAssociatedTypeWitness();
  v171 = *(_QWORD *)(v189 - 8);
  v24 = MEMORY[0x24BDAC7A8](v189);
  v183 = (char *)&v164 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v182 = (char *)&v164 - v27;
  v28 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v164 - v29;
  sub_23835B178();
  v31 = sub_23835B160();
  v175 = v28;
  v32 = *(void (**)(char *, uint64_t))(v28 + 8);
  v32(v30, AssociatedTypeWitness);
  v176 = AssociatedConformanceWitness;
  v33 = *(int *)(sub_23835B2EC() + 36);
  v170 = a1;
  v34 = a1 + v33;
  sub_23835B178();
  v179 = a2;
  v35 = sub_23835B160();
  v32(v30, AssociatedTypeWitness);
  v36 = v35 - v31;
  if (__OFSUB__(v35, v31))
    goto LABEL_160;
  if (v36 < 1)
    return;
  v37 = sub_23835B190();
  if (__OFSUB__(v37, v36))
    goto LABEL_162;
  if (v31 < (v37 - v36) / 2)
  {
    v38 = v177;
    v39 = _s19CollectionsInternal10_HashTableV15maximumCapacity8forScaleS2i_tFZ_0(*v177 & 0x3FLL);
    v40 = v178;
    if (v31 >= v39 / 3)
    {
      v115 = _HashTable.UnsafeHandle._startIterator(bucket:)(0, v38, v178);
      v116 = 0;
      v190 = v38;
      v191 = v40;
      v192 = 0;
      v193 = v115;
      v194 = v117;
      v195 = v118;
      v35 = -1;
      v81 = 64;
      v196 = 0;
      while (1)
      {
        if (v193)
        {
          v123 = v190;
          v124 = ~(-1 << *v190);
          v125 = (uint64_t)v190[1] >> 6;
          v126 = v125 + (v193 ^ v124);
          v127 = v126 >= v124 ? ~(-1 << *v190) : 0;
          v128 = v126 - v127;
          if (v128 < v31)
          {
            v71 = __OFADD__(v128, v36);
            v129 = v128 + v36;
            if (v71)
              goto LABEL_158;
            v130 = *v190 & 0x3FLL;
            v131 = ((v124 & ((v129 - v125) >> 63)) + v129 - v125) ^ v124;
            v132 = v131 ^ v193;
            v133 = v130 * v116;
            v134 = (v130 * v116) >> 6;
            v135 = (v130 * v116) & 0x3F;
            v136 = v191;
            *(_QWORD *)(v191 + 8 * v134) ^= (v131 ^ v193) << v133;
            v137 = *v123 & 0x3FLL;
            if (64 - v135 < v137)
            {
              v138 = v137 << v137;
              v71 = __OFADD__(v138, 64);
              v139 = v138 + 64;
              if (v71)
              {
                __break(1u);
                goto LABEL_127;
              }
              v120 = v139 - 1;
              v119 = v139 < 1;
              v121 = v139 + 62;
              if (!v119)
                v121 = v120;
              if (v134 + 1 == v121 >> 6)
                v122 = 0;
              else
                v122 = v134 + 1;
              *(_QWORD *)(v136 + 8 * v122) ^= v132 >> (64 - v135);
            }
            v193 = v131;
          }
        }
        _HashTable.BucketIterator.advance()();
        v116 = v192;
        if (!v192)
          goto LABEL_53;
      }
    }
    v41 = v169;
    (*(void (**)(char *, uint64_t, uint64_t))(v175 + 16))(v169, v170, AssociatedTypeWitness);
    if ((sub_23835AD40() & 1) == 0)
      goto LABEL_166;
    v42 = v168;
    MEMORY[0x23B831670](MEMORY[0x24BEE2C68], v168);
    sub_23835B244();
    (*(void (**)(char *, uint64_t))(v167 + 8))(v41, v42);
    sub_23835AF8C();
    v43 = swift_getAssociatedConformanceWitness();
    v44 = v181;
    v184 = (char *)v43;
    sub_23835B484();
    v45 = v187;
    v182 = *(char **)(v188 + 48);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v182)(v44, 1, v187) != 1)
    {
      v46 = 0;
      v180 = *(void (**)(char *, char *, uint64_t))(v188 + 32);
      do
      {
        v180(v185, v44, v45);
        v47 = sub_23835ABF0();
        v48 = *v38;
        v49 = 1 << *v38;
        v50 = v49 - 1;
        if (__OFSUB__(v49, 1))
          goto LABEL_152;
        v51 = v50 & v47;
        v52 = _HashTable.UnsafeHandle._startIterator(bucket:)(v50 & v47, v38, v40);
        v190 = v38;
        v191 = v40;
        v192 = v51;
        v193 = v52;
        v194 = v53;
        v195 = v54;
        v196 = 0;
        if (v52)
        {
          v55 = -1 << *v38;
          v56 = ~v55;
          v57 = (uint64_t)v38[1] >> 6;
          v58 = (v55 ^ ~v52) + v57;
          if (v58 >= ~v55)
            v59 = ~v55;
          else
            v59 = 0;
          if (v58 - v59 != v46)
          {
            v60 = 0;
            v61 = v48 & 0x3F;
            v62 = __OFADD__(v61 << v61, 64);
            v63 = (v61 << v61) + 126;
            if ((v61 << v61) + 64 >= 1)
              v63 = (v61 << v61) + 63;
            v64 = v63 >> 6;
            while (1)
            {
              if (++v51 == v49)
              {
                if ((v60 & 1) != 0)
                  goto LABEL_168;
                v51 = 0;
                v60 = 1;
              }
              if (v54 >= v61)
              {
                v71 = __OFSUB__(v54, v61);
                v54 -= v61;
                if (v71)
                {
                  __break(1u);
LABEL_145:
                  __break(1u);
LABEL_146:
                  __break(1u);
LABEL_147:
                  __break(1u);
LABEL_148:
                  __break(1u);
                  goto LABEL_149;
                }
                v75 = v53 >> v61;
                v52 = v53 & v50;
                if ((v53 & v50) == 0)
                  goto LABEL_47;
              }
              else
              {
                v67 = (v51 * v61) >> 6;
                if (v54)
                {
                  if (v62)
                    goto LABEL_150;
                  if (v67 + 1 == v64)
                    v67 = 0;
                  else
                    ++v67;
                }
                v68 = v61 - v54;
                if (__OFSUB__(v61, v54))
                  goto LABEL_145;
                if (v67 == 2 && v61 == 5)
                  v70 = 32;
                else
                  v70 = 64;
                v71 = __OFSUB__(v70, v68);
                v72 = v70 - v68;
                if (v71)
                  goto LABEL_147;
                v73 = *(_QWORD *)(v40 + 8 * v67);
                v74 = (v73 << v54) | v53;
                v75 = v73 >> v68;
                v54 = v72;
                v52 = v74 & v50;
                if ((v74 & v50) == 0)
                {
LABEL_47:
                  v53 = v75;
                  goto LABEL_48;
                }
              }
              v65 = (v52 ^ v56) + v57;
              if (v65 >= v56)
                v66 = v56;
              else
                v66 = 0;
              v53 = v75;
              if (v65 - v66 == v46)
                goto LABEL_47;
            }
          }
          v60 = 0;
LABEL_48:
          v196 = v60;
          v192 = v51;
          v193 = v52;
          v194 = v53;
          v195 = v54;
        }
        if (__OFADD__(v46, v36))
          goto LABEL_154;
        _HashTable.BucketIterator.currentValue.setter(v46 + v36, 0);
        v45 = v187;
        (*(void (**)(char *, uint64_t))(v188 + 8))(v185, v187);
        v71 = __OFADD__(v46++, 1);
        if (v71)
          goto LABEL_155;
        v44 = v181;
        sub_23835B484();
      }
      while (((unsigned int (*)(char *, uint64_t, uint64_t))v182)(v44, 1, v45) != 1);
    }
    (*(void (**)(char *, uint64_t))(v171 + 8))(v183, v189);
LABEL_53:
    v76 = v38[1];
    if (__OFSUB__(v76 >> 6, v36))
      goto LABEL_164;
    v77 = 1 << *v38;
    v71 = __OFSUB__(v77, 1);
    v78 = v77 - 1;
    if (v71)
      goto LABEL_165;
    v79 = (v78 & (((v76 >> 6) - v36) >> 63)) + (v76 >> 6) - v36;
    if (v79 < v78)
      v78 = 0;
    v38[1] = v38[1] & 0x3FLL | ((v79 - v78) << 6);
    return;
  }
  v80 = sub_23835B190();
  v38 = v177;
  v81 = v178;
  if (__OFSUB__(v80, v35))
    goto LABEL_163;
  if (v80 - v35 >= _s19CollectionsInternal10_HashTableV15maximumCapacity8forScaleS2i_tFZ_0(*v177 & 0x3FLL) / 3)
  {
LABEL_127:
    v140 = _HashTable.UnsafeHandle._startIterator(bucket:)(0, v38, v81);
    v141 = 0;
    v190 = v38;
    v191 = v81;
    v192 = 0;
    v193 = v140;
    v194 = v142;
    v195 = v143;
    v196 = 0;
    while (1)
    {
      if (v193)
      {
        v144 = v190;
        v145 = ~(-1 << *v190);
        v146 = (uint64_t)v190[1] >> 6;
        v147 = v146 + (v193 ^ v145);
        v148 = v147 >= v145 ? ~(-1 << *v190) : 0;
        v149 = v147 - v148;
        if (v149 >= v35)
        {
          v71 = __OFSUB__(v149, v36);
          v150 = v149 - v36;
          if (v71)
            goto LABEL_159;
          v151 = *v190 & 0x3FLL;
          v152 = ((v145 & ((v150 - v146) >> 63)) + v150 - v146) ^ v145;
          v153 = v152 ^ v193;
          v154 = v151 * v141;
          v155 = (v151 * v141) >> 6;
          v156 = (v151 * v141) & 0x3F;
          v157 = v191;
          *(_QWORD *)(v191 + 8 * v155) ^= (v152 ^ v193) << v154;
          v158 = *v144 & 0x3FLL;
          if (64 - v156 < v158)
          {
            v159 = v158 << v158;
            v71 = __OFADD__(v159, 64);
            v160 = v159 + 64;
            if (v71)
              goto LABEL_161;
            v161 = v160 - 1;
            v119 = v160 < 1;
            v162 = v160 + 62;
            if (!v119)
              v162 = v161;
            if (v155 + 1 == v162 >> 6)
              v163 = 0;
            else
              v163 = v155 + 1;
            *(_QWORD *)(v157 + 8 * v163) ^= v153 >> (64 - v156);
          }
          v193 = v152;
        }
      }
      _HashTable.BucketIterator.advance()();
      v141 = v192;
      if (!v192)
        return;
    }
  }
  v82 = v166;
  (*(void (**)(char *, uint64_t, uint64_t))(v175 + 16))(v166, v34, AssociatedTypeWitness);
  if ((sub_23835AD40() & 1) == 0)
    goto LABEL_167;
  v83 = v165;
  MEMORY[0x23B831670](MEMORY[0x24BEE2C50], v165);
  sub_23835B244();
  (*(void (**)(char *, uint64_t))(v164 + 8))(v82, v83);
  sub_23835AF8C();
  v84 = swift_getAssociatedConformanceWitness();
  v85 = v180;
  v185 = (char *)v84;
  sub_23835B484();
  v86 = v187;
  v183 = *(char **)(v188 + 48);
  if (((unsigned int (*)(_QWORD, uint64_t, uint64_t))v183)(v85, 1, v187) == 1)
  {
LABEL_106:
    (*(void (**)(char *, uint64_t))(v171 + 8))(v182, v189);
    return;
  }
  v181 = *(char **)(v188 + 32);
  while (1)
  {
    ((void (*)(char *, _QWORD, uint64_t))v181)(v184, v85, v86);
    v87 = sub_23835ABF0();
    v88 = *v38;
    v89 = 1 << *v38;
    v90 = v89 - 1;
    if (__OFSUB__(v89, 1))
      goto LABEL_153;
    v91 = v90 & v87;
    v92 = _HashTable.UnsafeHandle._startIterator(bucket:)(v90 & v87, v38, v81);
    v190 = v38;
    v191 = v81;
    v192 = v91;
    v193 = v92;
    v194 = v93;
    v195 = v94;
    v196 = 0;
    if (!v92)
      goto LABEL_103;
    v95 = -1 << *v38;
    v96 = ~v95;
    v97 = (uint64_t)v38[1] >> 6;
    v98 = (v95 ^ ~v92) + v97;
    v99 = v98 >= ~v95 ? ~v95 : 0;
    if (v98 - v99 != v35)
      break;
    v100 = 0;
LABEL_102:
    v196 = v100;
    v192 = v91;
    v193 = v92;
    v194 = v93;
    v195 = v94;
LABEL_103:
    if (__OFSUB__(v35, v36))
      goto LABEL_156;
    _HashTable.BucketIterator.currentValue.setter(v35 - v36, 0);
    v86 = v187;
    (*(void (**)(char *, uint64_t))(v188 + 8))(v184, v187);
    v71 = __OFADD__(v35++, 1);
    if (v71)
      goto LABEL_157;
    v85 = v180;
    sub_23835B484();
    if (((unsigned int (*)(_QWORD, uint64_t, uint64_t))v183)(v85, 1, v86) == 1)
      goto LABEL_106;
  }
  v100 = 0;
  v101 = v88 & 0x3F;
  v102 = __OFADD__(v101 << v101, 64);
  v103 = (v101 << v101) + 126;
  if ((v101 << v101) + 64 >= 1)
    v103 = (v101 << v101) + 63;
  v104 = v103 >> 6;
  while (1)
  {
    if (++v91 == v89)
    {
      if ((v100 & 1) != 0)
        goto LABEL_168;
      v91 = 0;
      v100 = 1;
    }
    if (v94 < v101)
      break;
    v71 = __OFSUB__(v94, v101);
    v94 -= v101;
    if (v71)
      goto LABEL_146;
    v114 = v93 >> v101;
    v92 = v93 & v90;
    if ((v93 & v90) == 0)
    {
LABEL_101:
      v93 = v114;
      goto LABEL_102;
    }
LABEL_76:
    v105 = (v92 ^ v96) + v97;
    if (v105 >= v96)
      v106 = v96;
    else
      v106 = 0;
    v93 = v114;
    if (v105 - v106 == v35)
      goto LABEL_101;
  }
  v107 = (v91 * v101) >> 6;
  if (v94)
  {
    if (v102)
      goto LABEL_151;
    if (v107 + 1 == v104)
      v107 = 0;
    else
      ++v107;
  }
  v108 = v101 - v94;
  if (__OFSUB__(v101, v94))
    goto LABEL_148;
  if (v107 == 2 && v101 == 5)
    v110 = 32;
  else
    v110 = 64;
  v71 = __OFSUB__(v110, v108);
  v111 = v110 - v108;
  if (!v71)
  {
    v112 = *(_QWORD *)(v81 + 8 * v107);
    v113 = (v112 << v94) | v93;
    v114 = v112 >> v108;
    v94 = v111;
    v92 = v113 & v90;
    if ((v113 & v90) == 0)
      goto LABEL_101;
    goto LABEL_76;
  }
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
  __break(1u);
LABEL_166:
  __break(1u);
LABEL_167:
  __break(1u);
LABEL_168:
  sub_23835B7CC();
  __break(1u);
}

uint64_t _HashTable.UnsafeHandle.bias.setter(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;

  v2 = 1 << *a2;
  v3 = __OFSUB__(v2, 1);
  v4 = v2 - 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    v5 = (v4 & (result >> 63)) + result;
    if (v5 < v4)
      v4 = 0;
    a2[1] = a2[1] & 0x3FLL | ((v5 - v4) << 6);
  }
  return result;
}

uint64_t _HashTable.UnsafeHandle._header.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*_HashTable.UnsafeHandle._header.modify())(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t _HashTable.UnsafeHandle._buckets.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t _HashTable.UnsafeHandle._buckets.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*_HashTable.UnsafeHandle._buckets.modify())(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t _HashTable.UnsafeHandle.reservedScale.getter(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8) & 0x3FLL;
}

uint64_t _HashTable.UnsafeHandle.bias.getter(uint64_t a1)
{
  return *(uint64_t *)(a1 + 8) >> 6;
}

uint64_t *(*_HashTable.UnsafeHandle.bias.modify(uint64_t *a1, uint64_t a2))(uint64_t *result, char a2)
{
  *a1 = *(uint64_t *)(a2 + 8) >> 6;
  a1[1] = a2;
  return sub_23835094C;
}

uint64_t *sub_23835094C(uint64_t *result, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v2 = (_QWORD *)result[1];
  v3 = 1 << *v2;
  v4 = __OFSUB__(v3, 1);
  v5 = v3 - 1;
  v6 = v4;
  if ((a2 & 1) != 0)
  {
    if ((v6 & 1) == 0)
      goto LABEL_8;
    __break(1u);
  }
  if ((v6 & 1) != 0)
  {
    __break(1u);
    return result;
  }
LABEL_8:
  v7 = (v5 & (*result >> 63)) + *result;
  if (v7 < v5)
    v5 = 0;
  v2[1] = v2[1] & 0x3FLL | ((v7 - v5) << 6);
  return result;
}

uint64_t _HashTable.UnsafeHandle.bitCount.getter(_QWORD *a1)
{
  return (*a1 & 0x3FLL) << *a1;
}

uint64_t _HashTable.UnsafeHandle.capacity.getter(uint64_t result)
{
  unint64_t v1;
  double v2;

  v1 = *(_QWORD *)result & 0x3FLL;
  if (v1 < 5)
    return 15;
  v2 = (double)(1 << v1) * 0.75;
  if ((~*(_QWORD *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v2 < 9.22337204e18)
    return (uint64_t)v2;
LABEL_9:
  __break(1u);
  return result;
}

uint64_t _HashTable.UnsafeHandle.bucket(after:)(uint64_t result, _QWORD *a2)
{
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else if (result + 1 == 1 << *a2)
  {
    return 0;
  }
  else
  {
    ++result;
  }
  return result;
}

uint64_t _HashTable.UnsafeHandle.bucket(before:)(uint64_t a1, _QWORD *a2)
{
  BOOL v2;
  uint64_t result;

  if (!a1)
    a1 = 1 << *a2;
  v2 = __OFSUB__(a1, 1);
  result = a1 - 1;
  if (v2)
    __break(1u);
  return result;
}

Swift::Int __swiftcall _HashTable.UnsafeHandle.word(before:)(Swift::Int before)
{
  _QWORD *v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;

  if (before)
  {
    v2 = __OFSUB__(before--, 1);
    if (!v2)
      return before;
    __break(1u);
LABEL_9:
    __break(1u);
    return before;
  }
  v3 = (*v1 & 0x3FLL) << *v1;
  v2 = __OFADD__(v3, 64);
  v4 = v3 + 64;
  if (v2)
    goto LABEL_9;
  v6 = v4 - 1;
  v5 = v4 < 1;
  v7 = v4 + 62;
  if (!v5)
    v7 = v6;
  return (v7 >> 6) - 1;
}

_QWORD *(*_HashTable.UnsafeHandle.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4))(_QWORD *result)
{
  a1[1] = a2;
  a1[2] = a4;
  *a1 = *(_QWORD *)(a4 + 8 * a2);
  return sub_238350ACC;
}

_QWORD *sub_238350ACC(_QWORD *result)
{
  *(_QWORD *)(result[2] + 8 * result[1]) = *result;
  return result;
}

uint64_t _HashTable.UnsafeHandle.subscript.getter(uint64_t result, _QWORD *a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *a2 & 0x3FLL;
  v4 = (uint64_t)(v3 * result) >> 6;
  v5 = *(_QWORD *)(a3 + 8 * v4) >> (v3 * result);
  v6 = 64 - ((v3 * result) & 0x3F);
  if (v6 >= v3)
    return v5 & ~(-1 << v3);
  if (!__OFADD__(v3 << v3, 64))
  {
    v7 = (v3 << v3) + 126;
    if ((uint64_t)((v3 << v3) + 64) >= 1)
      v7 = (v3 << v3) + 63;
    if (v4 + 1 == v7 >> 6)
      v8 = 0;
    else
      v8 = v4 + 1;
    v5 = (*(_QWORD *)(a3 + 8 * v8) << v6) | v5 & ~(-1 << v6);
    return v5 & ~(-1 << v3);
  }
  __break(1u);
  return result;
}

unint64_t (*_HashTable.UnsafeHandle.subscript.modify(uint64_t *a1, uint64_t a2, _QWORD *a3, uint64_t a4))(uint64_t a1)
{
  a1[2] = (uint64_t)a3;
  a1[3] = a4;
  a1[1] = a2;
  *a1 = _HashTable.UnsafeHandle.subscript.getter(a2, a3, a4);
  return sub_238350B9C;
}

unint64_t sub_238350B9C(uint64_t a1)
{
  return _HashTable.UnsafeHandle.subscript.setter(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD **)(a1 + 16), *(_QWORD *)(a1 + 24));
}

unint64_t _HashTable.UnsafeHandle.subscript.getter(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = _HashTable.UnsafeHandle.subscript.getter(a1, a2, a3);
  if (!v4)
    return 0;
  v5 = -1 << *a2;
  v6 = (v5 ^ ~v4) + ((uint64_t)a2[1] >> 6);
  if (v6 >= ~v5)
    v7 = ~v5;
  else
    v7 = 0;
  return v6 - v7;
}

void (*_HashTable.UnsafeHandle.subscript.modify(_QWORD *a1, uint64_t a2, _QWORD *a3, uint64_t a4))(uint64_t a1)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[3] = a3;
  v8[4] = a4;
  v8[2] = a2;
  v9 = _HashTable.UnsafeHandle.subscript.getter(a2, a3, a4);
  if (v9)
  {
    v10 = -1 << *a3;
    v11 = (v10 ^ ~v9) + ((uint64_t)a3[1] >> 6);
    if (v11 >= ~v10)
      v12 = ~v10;
    else
      v12 = 0;
    v13 = v11 - v12;
  }
  else
  {
    v13 = 0;
  }
  *v8 = v13;
  *((_BYTE *)v8 + 8) = v9 == 0;
  return sub_238350CB0;
}

void sub_238350CB0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD **)a1;
  v2 = *(_QWORD **)(*(_QWORD *)a1 + 24);
  if ((*(_BYTE *)(*(_QWORD *)a1 + 8) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = *v1 - ((uint64_t)v2[1] >> 6);
    v3 = (-1 << *v2) ^ ~(((v4 >> 63) & ~(-1 << *v2)) + v4);
  }
  _HashTable.UnsafeHandle.subscript.setter(v3, v1[2], v2, v1[4]);
  free(v1);
}

uint64_t _HashTable.UnsafeHandle.firstOccupiedBucketInChain(with:)(uint64_t result, _QWORD *a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v3 = *a2 & 0x3FLL;
  v4 = 1 << *a2;
  v5 = v3 << *a2;
  v6 = v5 + 64;
  v7 = __OFADD__(v5, 64);
  v9 = v6 - 1;
  v8 = v6 < 1;
  v10 = v6 + 62;
  if (!v8)
    v10 = v9;
  v11 = v10 >> 6;
  while (1)
  {
    if (result)
      v14 = result;
    else
      v14 = 1 << *a2;
    result = v14 - 1;
    if (__OFSUB__(v14, 1))
    {
      __break(1u);
      goto LABEL_24;
    }
    v15 = (uint64_t)(result * v3) >> 6;
    v13 = *(_QWORD *)(a3 + 8 * v15) >> (result * v3);
    v16 = 64 - ((result * v3) & 0x3F);
    if (v16 < v3)
      break;
LABEL_11:
    if ((v13 & (v4 - 1)) == 0)
      goto LABEL_19;
  }
  if (!v7)
  {
    if (v15 + 1 == v11)
      v12 = 0;
    else
      v12 = v15 + 1;
    v13 = (*(_QWORD *)(a3 + 8 * v12) << v16) | v13 & ~(-1 << v16);
    goto LABEL_11;
  }
  __break(1u);
LABEL_19:
  if (__OFADD__(result, 1))
  {
LABEL_24:
    __break(1u);
    return result;
  }
  if (result + 1 == v4)
    return 0;
  return ++result;
}

ValueMetadata *type metadata accessor for _HashTable.UnsafeHandle()
{
  return &type metadata for _HashTable.UnsafeHandle;
}

CollectionsInternal::_RopeVersion __swiftcall _RopeVersion.init()()
{
  CollectionsInternal::_RopeVersion v1;

  v1._value = 0;
  MEMORY[0x23B831730](&v1, 8);
  return v1;
}

BOOL static _RopeVersion.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

Swift::Void __swiftcall _RopeVersion.bump()()
{
  _QWORD *v0;

  ++*v0;
}

uint64_t _RopeVersion._value.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*_RopeVersion._value.modify())(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

Swift::Void __swiftcall _RopeVersion.reset()()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = 0;
  MEMORY[0x23B831730](&v1, 8);
  *v0 = v1;
}

ValueMetadata *type metadata accessor for _RopeVersion()
{
  return &type metadata for _RopeVersion;
}

uint64_t Rope.find<A>(at:in:preferEnd:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t (*v33)(char *, uint64_t, uint64_t);
  uint64_t (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t *, char *, uint64_t);
  uint64_t *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unsigned __int16 *v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t *, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t result;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t (*v82)(char *, uint64_t);
  char *v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  void (*v88)(char *, uint64_t, uint64_t);
  uint64_t v89;
  uint64_t AssociatedConformanceWitness;
  uint64_t v91;
  uint64_t AssociatedTypeWitness;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102[2];

  v7 = v6;
  v95 = a5;
  v96 = a6;
  v97 = a3;
  v94 = a2;
  AssociatedConformanceWitness = a1;
  v91 = a4;
  v9 = *(_QWORD *)(a4 + 16);
  v8 = *(_QWORD *)(a4 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v87 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v86 = (char *)&v81 - v10;
  v98 = v9;
  v84 = v8;
  v12 = type metadata accessor for Rope._Node(0, v9, v8, v11);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (uint64_t *)((char *)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = MEMORY[0x24BDAC7A8](v14);
  v99 = (uint64_t *)((char *)&v81 - v18);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v81 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v85 = (char *)&v81 - v22;
  v23 = sub_23835B334();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v83 = (char *)&v81 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v81 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)&v81 - v30;
  v32 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 16);
  v93 = v7;
  v88 = v32;
  v32((char *)&v81 - v30, v7, v23);
  v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  LODWORD(v9) = v33(v31, 1, v12);
  v34 = *(uint64_t (**)(char *, uint64_t))(v24 + 8);
  v89 = v23;
  v82 = v34;
  v34(v31, v23);
  v38 = 0;
  if ((_DWORD)v9 != 1)
  {
    v88(v29, v93, v89);
    if (v33(v29, 1, v12) == 1)
    {
LABEL_15:
      v79 = v29;
      v80 = v89;
LABEL_17:
      result = v82(v79, v80);
      __break(1u);
      return result;
    }
    v39 = v85;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v85, v29, v12);
    v41 = v86;
    v40 = v87;
    v42 = AssociatedTypeWitness;
    (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v86, &v39[*(int *)(v12 + 36)], AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v39, v12);
    v38 = (*(uint64_t (**)(char *, uint64_t))(v96 + 24))(v41, v95);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v42);
  }
  v29 = (char *)AssociatedConformanceWitness;
  if (AssociatedConformanceWitness < 0 || v38 < AssociatedConformanceWitness)
  {
    __break(1u);
    goto LABEL_15;
  }
  v43 = v91;
  if ((Rope.isEmpty.getter(v91, v35, v36, v37) & 1) != 0 || !(v97 & 1 | (v38 > (uint64_t)v29)))
    return Rope.endIndex.getter(v43);
  v102[0] = (uint64_t)v29;
  v44 = v83;
  v45 = v89;
  v88(v83, v93, v89);
  if (v33(v44, 1, v12) == 1)
  {
    v79 = v44;
    v80 = v45;
    goto LABEL_17;
  }
  v46 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v46(v21, v44, v12);
  v47 = Rope._Node.header.getter() >> 16;
  v48 = v84;
  v49 = v98;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v101 = _RopePath.init(height:)(v47);
  v50 = Rope._Node.header.getter();
  v51 = *(void (**)(uint64_t *, char *, uint64_t))(v13 + 16);
  v52 = v99;
  if ((v50 & 0xFF0000) != 0)
  {
    do
    {
      v51(v16, v21, v12);
      v53 = *v16 + 16;
      v54 = *v16 + ((*(unsigned __int8 *)(v13 + 80) + 19) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
      MEMORY[0x23B831670](&protocol conformance descriptor for Rope<A>._Node, v12);
      v55 = nullsub_1(v53, v54, v98, v12, v48);
      v57 = v56;
      swift_unknownObjectRetain();
      v58 = v55;
      v52 = v99;
      v59 = v57;
      v49 = v98;
      sub_238351940(v58, v59, v102, v94, v97 & 1, v98, v95, (uint64_t)v99, v96);
      swift_unknownObjectRelease();
      v60 = *(void (**)(char *, uint64_t))(v13 + 8);
      v60((char *)v16, v12);
      v60(v21, v12);
      v46(v21, (char *)v52, v12);
    }
    while ((Rope._Node.header.getter() & 0xFF0000) != 0);
  }
  v51(v52, v21, v12);
  v61 = *v52;
  v62 = *v52 + 16;
  v64 = v49;
  v65 = type metadata accessor for Rope._Item(0, v49, v48, v63);
  v66 = *(unsigned __int8 *)(*(_QWORD *)(v65 - 8) + 80);
  v67 = v61 + ((v66 + 19) & ~v66);
  MEMORY[0x23B831670](&protocol conformance descriptor for Rope<A>._Item, v65);
  v68 = (unsigned __int16 *)nullsub_1(v62, v67, v64, v65, v48);
  v70 = v69;
  swift_unknownObjectRetain();
  sub_238351AC8(v68, v70, v102, v94, v97 & 1, v64, v95, v96, &v100);
  swift_unknownObjectRelease();
  v71 = *(void (**)(uint64_t *, uint64_t))(v13 + 8);
  v71(v99, v12);
  v72 = v100;
  v74 = type metadata accessor for _RopePath(0, AssociatedTypeWitness, AssociatedConformanceWitness, v73);
  _RopePath.subscript.setter(v72, 0, v74);
  v75 = *(_QWORD *)(v93 + *(int *)(v91 + 36));
  v76 = v101;
  v77 = Rope._Node.asUnmanagedLeaf.getter();
  v71((uint64_t *)v21, v12);
  return Rope.Index.init(version:path:leaf:)(v75, v76, v77, v64, v48);
}

uint64_t Rope._UnsafeHandle.findSlot<A>(at:in:preferEnd:)(uint64_t a1, uint64_t a2, int a3, unsigned __int16 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t AssociatedConformanceWitness;
  uint64_t AssociatedTypeWitness;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  _BYTE v33[4];
  int v34;
  uint64_t (*v35)(_BYTE *, uint64_t, uint64_t);
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned __int16 *v43;
  uint64_t v44;
  uint64_t v45;

  v34 = a3;
  v39 = a2;
  v40 = a8;
  v41 = a10;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v37 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v38 = AssociatedTypeWitness;
  v17 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v19 = &v33[-v18];
  v20 = *(_QWORD *)(a7 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v22 = &v33[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v43 = a4;
  v44 = a5;
  v45 = a6;
  v42 = AssociatedConformanceWitness;
  result = Rope._UnsafeHandle.childCount.getter(a4);
  if (result < 0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v24 = result;
  if (result)
  {
    v25 = 0;
    v26 = *(void (**)(uint64_t, uint64_t))(a9 + 24);
    v35 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v41 + 24);
    v36 = v26;
    v27 = ~v34 & 1;
    while (v24 != v25)
    {
      v28 = Rope._UnsafeHandle.children.getter(v43, v44, v45, a7, v42, a9);
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v20 + 16))(v22, v28 + *(_QWORD *)(v20 + 72) * v25, a7);
      v36(a7, a9);
      (*(void (**)(_BYTE *, uint64_t))(v20 + 8))(v22, a7);
      v29 = v35(v19, v40, v41);
      result = (*(uint64_t (**)(_BYTE *, uint64_t))(v37 + 8))(v19, v38);
      v30 = a1 - v29;
      if (__OFSUB__(a1, v29))
        goto LABEL_17;
      if (__OFADD__(v30, v27))
        goto LABEL_18;
      if (v30 + v27 < 1)
        return v25;
      ++v25;
      a1 -= v29;
      if (v24 == v25)
      {
        a1 = v30;
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
LABEL_10:
  v31 = v34;
  if (a1)
  {
LABEL_20:
    __break(1u);
    return result;
  }
  v32 = Rope._UnsafeHandle.childCount.getter(v43);
  v25 = v32;
  if ((v31 & 1) != 0)
  {
    v25 = v32 - 1;
    if (__OFSUB__(v32, 1))
      __break(1u);
  }
  return v25;
}

uint64_t Rope._UnsafeHandle.findSlot<A>(from:offsetBy:in:preferEnd:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, unsigned __int16 *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t AssociatedConformanceWitness;
  uint64_t AssociatedTypeWitness;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  char *v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int16 *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t (*v36)(char *, uint64_t, uint64_t);
  void (*v37)(uint64_t, uint64_t);
  _BOOL8 v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int16 *v45;
  uint64_t v46;
  uint64_t v47;

  v44 = a4;
  v47 = a12;
  v43 = a10;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v41 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v42 = AssociatedTypeWitness;
  v21 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v40 = (char *)&v36 - v22;
  v39 = *(_QWORD *)(a9 - 8);
  result = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v36 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __OFADD__(a2, a3);
  v27 = a2 + a3;
  if (!v26)
  {
    v45 = a6;
    v46 = a7;
    if (Rope._UnsafeHandle.childCount.getter(a6) <= a1)
      return a1;
    v37 = *(void (**)(uint64_t, uint64_t))(a11 + 24);
    v38 = (a5 & 1) == 0;
    v28 = v46;
    v36 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 24);
    v29 = a8;
    v30 = v45;
    while (1)
    {
      v31 = AssociatedConformanceWitness;
      v32 = Rope._UnsafeHandle.children.getter(v30, v28, v29, a9, AssociatedConformanceWitness, a11);
      v33 = v39;
      (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v25, v32 + *(_QWORD *)(v39 + 72) * a1, a9);
      v34 = v40;
      v37(a9, a11);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v25, a9);
      v35 = v36(v34, v43, v47);
      result = (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v34, v42);
      if (__OFADD__(v27, v38))
        break;
      if (v35 >= v27 + v38)
        return a1;
      v26 = __OFSUB__(v27, v35);
      v27 -= v35;
      if (v26)
        goto LABEL_10;
      ++a1;
      v30 = v45;
      v28 = v46;
      AssociatedConformanceWitness = v31;
      if (a1 >= Rope._UnsafeHandle.childCount.getter(v45))
        return a1;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_238351940@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  _QWORD *v11;
  uint64_t v14;
  uint64_t AssociatedConformanceWitness;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t AssociatedTypeWitness;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v11 = a3;
  v14 = *a3;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v17 = type metadata accessor for Rope._Node(0, a6, AssociatedConformanceWitness, v16);
  v18 = MEMORY[0x23B831670](&protocol conformance descriptor for Rope<A>._Node, v17);
  v19 = v14;
  v20 = a2;
  v21 = Rope._UnsafeHandle.findSlot<A>(at:in:preferEnd:)(v19, a4, a5, (unsigned __int16 *)a1, a2, a6, v17, a7, v18, a9);
  *v11 = v22;
  LOBYTE(v11) = *(_BYTE *)(a1 + 2);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v24 = swift_getAssociatedConformanceWitness();
  v26 = type metadata accessor for _RopePath(0, AssociatedTypeWitness, v24, v25);
  _RopePath.subscript.setter(v21, v11, v26);
  v27 = Rope._UnsafeHandle.children.getter((unsigned __int16 *)a1, v20, a6, v17, AssociatedConformanceWitness, v18);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(a8, v27 + *(_QWORD *)(*(_QWORD *)(v17 - 8) + 72) * v21, v17);
}

uint64_t sub_238351AC8@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  uint64_t v17;
  uint64_t AssociatedConformanceWitness;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;

  v17 = *a3;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v20 = type metadata accessor for Rope._Item(0, a6, AssociatedConformanceWitness, v19);
  v21 = MEMORY[0x23B831670](&protocol conformance descriptor for Rope<A>._Item, v20);
  result = Rope._UnsafeHandle.findSlot<A>(at:in:preferEnd:)(v17, a4, a5, a1, a2, a6, v20, a7, v21, a8);
  *a9 = result;
  a9[1] = v23;
  return result;
}

uint64_t static BitArray.|= infix(_:_:)(uint64_t *a1, int8x16_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  int8x16_t *v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  int8x16_t *v12;
  int8x16_t *v13;
  uint64_t v14;
  int8x16_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;

  v6 = a1[1];
  if ((v6 | a3) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (v6 != a3)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    result = (uint64_t)sub_23826C260(v4);
    v4 = result;
    *v3 = result;
    v8 = *(_QWORD *)(result + 16);
    if (!v8)
      goto LABEL_18;
    goto LABEL_5;
  }
  v5 = a2;
  v3 = a1;
  v4 = *a1;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v3 = v4;
  if ((result & 1) == 0)
    goto LABEL_21;
  v8 = *(_QWORD *)(v4 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  if (v8 < 6
    || ((v9 = 8 * v8 + 32, v4 + 32 < (unint64_t)v5->u64 + v9)
      ? (v10 = (unint64_t)&v5[2] >= v4 + v9)
      : (v10 = 1),
        !v10))
  {
    v11 = 0;
LABEL_16:
    v16 = v8 - v11;
    v17 = 8 * v11 + 32;
    v18 = (_QWORD *)(v4 + v17);
    v19 = (uint64_t *)((char *)v5->i64 + v17);
    do
    {
      v20 = *v19++;
      *v18++ |= v20;
      --v16;
    }
    while (v16);
    goto LABEL_18;
  }
  v11 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  v12 = v5 + 3;
  v13 = (int8x16_t *)(v4 + 48);
  v14 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    v15 = vorrq_s8(*v13, *v12);
    v13[-1] = vorrq_s8(v13[-1], v12[-1]);
    *v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 4;
  }
  while (v14);
  if (v8 != v11)
    goto LABEL_16;
LABEL_18:
  *v3 = v4;
  return result;
}

char *static BitArray.| infix(_:_:)(char *a1, uint64_t a2, int8x16_t *a3, uint64_t a4)
{
  char *v4;
  int8x16_t *v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int8x16_t *v10;
  int8x16_t *v11;
  uint64_t v12;
  int8x16_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t *v17;
  uint64_t v18;

  if ((a4 | a2) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (a2 != a4)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    v4 = sub_23826C260((uint64_t)v4);
    v6 = *((_QWORD *)v4 + 2);
    if (!v6)
      return v4;
    goto LABEL_5;
  }
  v5 = a3;
  v4 = a1;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_21;
  v6 = *((_QWORD *)v4 + 2);
  if (!v6)
    return v4;
LABEL_5:
  if (v6 < 6 || ((v7 = 8 * v6 + 32, v4 + 32 < &v5->i8[v7]) ? (v8 = &v5[2] >= (int8x16_t *)&v4[v7]) : (v8 = 1), !v8))
  {
    v9 = 0;
LABEL_16:
    v14 = v6 - v9;
    v15 = 8 * v9 + 32;
    v16 = &v4[v15];
    v17 = (uint64_t *)((char *)v5->i64 + v15);
    do
    {
      v18 = *v17++;
      *(_QWORD *)v16 |= v18;
      v16 += 8;
      --v14;
    }
    while (v14);
    return v4;
  }
  v9 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  v10 = v5 + 3;
  v11 = (int8x16_t *)(v4 + 48);
  v12 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    v13 = vorrq_s8(*v11, *v10);
    v11[-1] = vorrq_s8(v11[-1], v10[-1]);
    *v11 = v13;
    v10 += 2;
    v11 += 2;
    v12 -= 4;
  }
  while (v12);
  if (v6 != v9)
    goto LABEL_16;
  return v4;
}

uint64_t static BitArray.&= infix(_:_:)(uint64_t *a1, int8x16_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  int8x16_t *v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  int8x16_t *v12;
  int8x16_t *v13;
  uint64_t v14;
  int8x16_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;

  v6 = a1[1];
  if ((v6 | a3) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (v6 != a3)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    result = (uint64_t)sub_23826C260(v4);
    v4 = result;
    *v3 = result;
    v8 = *(_QWORD *)(result + 16);
    if (!v8)
      goto LABEL_18;
    goto LABEL_5;
  }
  v5 = a2;
  v3 = a1;
  v4 = *a1;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v3 = v4;
  if ((result & 1) == 0)
    goto LABEL_21;
  v8 = *(_QWORD *)(v4 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  if (v8 < 6
    || ((v9 = 8 * v8 + 32, v4 + 32 < (unint64_t)v5->u64 + v9)
      ? (v10 = (unint64_t)&v5[2] >= v4 + v9)
      : (v10 = 1),
        !v10))
  {
    v11 = 0;
LABEL_16:
    v16 = v8 - v11;
    v17 = 8 * v11 + 32;
    v18 = (_QWORD *)(v4 + v17);
    v19 = (uint64_t *)((char *)v5->i64 + v17);
    do
    {
      v20 = *v19++;
      *v18++ &= v20;
      --v16;
    }
    while (v16);
    goto LABEL_18;
  }
  v11 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  v12 = v5 + 3;
  v13 = (int8x16_t *)(v4 + 48);
  v14 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    v15 = vandq_s8(*v13, *v12);
    v13[-1] = vandq_s8(v13[-1], v12[-1]);
    *v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 4;
  }
  while (v14);
  if (v8 != v11)
    goto LABEL_16;
LABEL_18:
  *v3 = v4;
  return result;
}

char *static BitArray.& infix(_:_:)(char *a1, uint64_t a2, int8x16_t *a3, uint64_t a4)
{
  char *v4;
  int8x16_t *v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int8x16_t *v10;
  int8x16_t *v11;
  uint64_t v12;
  int8x16_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t *v17;
  uint64_t v18;

  if ((a4 | a2) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (a2 != a4)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    v4 = sub_23826C260((uint64_t)v4);
    v6 = *((_QWORD *)v4 + 2);
    if (!v6)
      return v4;
    goto LABEL_5;
  }
  v5 = a3;
  v4 = a1;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_21;
  v6 = *((_QWORD *)v4 + 2);
  if (!v6)
    return v4;
LABEL_5:
  if (v6 < 6 || ((v7 = 8 * v6 + 32, v4 + 32 < &v5->i8[v7]) ? (v8 = &v5[2] >= (int8x16_t *)&v4[v7]) : (v8 = 1), !v8))
  {
    v9 = 0;
LABEL_16:
    v14 = v6 - v9;
    v15 = 8 * v9 + 32;
    v16 = &v4[v15];
    v17 = (uint64_t *)((char *)v5->i64 + v15);
    do
    {
      v18 = *v17++;
      *(_QWORD *)v16 &= v18;
      v16 += 8;
      --v14;
    }
    while (v14);
    return v4;
  }
  v9 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  v10 = v5 + 3;
  v11 = (int8x16_t *)(v4 + 48);
  v12 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    v13 = vandq_s8(*v11, *v10);
    v11[-1] = vandq_s8(v11[-1], v10[-1]);
    *v11 = v13;
    v10 += 2;
    v11 += 2;
    v12 -= 4;
  }
  while (v12);
  if (v6 != v9)
    goto LABEL_16;
  return v4;
}

uint64_t static BitArray.^= infix(_:_:)(uint64_t *a1, int8x16_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  int8x16_t *v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  int8x16_t *v12;
  int8x16_t *v13;
  uint64_t v14;
  int8x16_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;

  v6 = a1[1];
  if ((v6 | a3) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (v6 != a3)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    result = (uint64_t)sub_23826C260(v4);
    v4 = result;
    *v3 = result;
    v8 = *(_QWORD *)(result + 16);
    if (!v8)
      goto LABEL_18;
    goto LABEL_5;
  }
  v5 = a2;
  v3 = a1;
  v4 = *a1;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v3 = v4;
  if ((result & 1) == 0)
    goto LABEL_21;
  v8 = *(_QWORD *)(v4 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  if (v8 < 6
    || ((v9 = 8 * v8 + 32, v4 + 32 < (unint64_t)v5->u64 + v9)
      ? (v10 = (unint64_t)&v5[2] >= v4 + v9)
      : (v10 = 1),
        !v10))
  {
    v11 = 0;
LABEL_16:
    v16 = v8 - v11;
    v17 = 8 * v11 + 32;
    v18 = (_QWORD *)(v4 + v17);
    v19 = (uint64_t *)((char *)v5->i64 + v17);
    do
    {
      v20 = *v19++;
      *v18++ ^= v20;
      --v16;
    }
    while (v16);
    goto LABEL_18;
  }
  v11 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  v12 = v5 + 3;
  v13 = (int8x16_t *)(v4 + 48);
  v14 = v8 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    v15 = veorq_s8(*v13, *v12);
    v13[-1] = veorq_s8(v13[-1], v12[-1]);
    *v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 4;
  }
  while (v14);
  if (v8 != v11)
    goto LABEL_16;
LABEL_18:
  *v3 = v4;
  return result;
}

char *static BitArray.^ infix(_:_:)(char *a1, uint64_t a2, int8x16_t *a3, uint64_t a4)
{
  char *v4;
  int8x16_t *v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int8x16_t *v10;
  int8x16_t *v11;
  uint64_t v12;
  int8x16_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t *v17;
  uint64_t v18;

  if ((a4 | a2) < 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (a2 != a4)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    v4 = sub_23826C260((uint64_t)v4);
    v6 = *((_QWORD *)v4 + 2);
    if (!v6)
      return v4;
    goto LABEL_5;
  }
  v5 = a3;
  v4 = a1;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_21;
  v6 = *((_QWORD *)v4 + 2);
  if (!v6)
    return v4;
LABEL_5:
  if (v6 < 6 || ((v7 = 8 * v6 + 32, v4 + 32 < &v5->i8[v7]) ? (v8 = &v5[2] >= (int8x16_t *)&v4[v7]) : (v8 = 1), !v8))
  {
    v9 = 0;
LABEL_16:
    v14 = v6 - v9;
    v15 = 8 * v9 + 32;
    v16 = &v4[v15];
    v17 = (uint64_t *)((char *)v5->i64 + v15);
    do
    {
      v18 = *v17++;
      *(_QWORD *)v16 ^= v18;
      v16 += 8;
      --v14;
    }
    while (v14);
    return v4;
  }
  v9 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  v10 = v5 + 3;
  v11 = (int8x16_t *)(v4 + 48);
  v12 = v6 & 0x7FFFFFFFFFFFFFFCLL;
  do
  {
    v13 = veorq_s8(*v11, *v10);
    v11[-1] = veorq_s8(v11[-1], v10[-1]);
    *v11 = v13;
    v10 += 2;
    v11 += 2;
    v12 -= 4;
  }
  while (v12);
  if (v6 != v9)
    goto LABEL_16;
  return v4;
}

int8x16_t *static BitArray.~ prefix(_:)(int8x16_t *a1, int8x16_t *a2)
{
  int8x16_t *v4;
  int8x16_t *v6[3];

  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    a1 = (int8x16_t *)sub_23826C260((uint64_t)a1);
  v4 = (int8x16_t *)a1[1].i64[0];
  v6[0] = a1 + 2;
  v6[1] = v4;
  v6[2] = a2;
  sub_238352310(v6);
  return a1;
}

Swift::Void __swiftcall BitArray.toggleAll()()
{
  int8x16_t **v0;
  int8x16_t *v1;
  char isUniquelyReferenced_nonNull_native;
  int8x16_t *v3;
  int8x16_t *v4;
  int8x16_t *v5[3];

  v1 = *v0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v1 = (int8x16_t *)sub_23826C260((uint64_t)v1);
    *v0 = v1;
  }
  v3 = (int8x16_t *)v1[1].i64[0];
  v4 = v0[1];
  v5[0] = v1 + 2;
  v5[1] = v3;
  v5[2] = v4;
  sub_238352310(v5);
  *v0 = v1;
}

int8x16_t **sub_238352310(int8x16_t **result)
{
  unint64_t v1;
  int8x16_t *v2;
  unint64_t v3;
  int8x16_t *v4;
  unint64_t v5;
  int8x16_t v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;

  v1 = (unint64_t)result[1];
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    return result;
  }
  v2 = *result;
  if (v1)
  {
    if (v1 >= 4)
    {
      v3 = v1 & 0xFFFFFFFFFFFFFFFCLL;
      v4 = v2 + 1;
      v5 = v1 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        v6 = vmvnq_s8(*v4);
        v4[-1] = vmvnq_s8(v4[-1]);
        *v4 = v6;
        v4 += 2;
        v5 -= 4;
      }
      while (v5);
      if (v1 == v3)
        goto LABEL_10;
    }
    else
    {
      v3 = 0;
    }
    v7 = v1 - v3;
    v8 = &v2->i64[v3];
    do
    {
      *v8 = ~*v8;
      ++v8;
      --v7;
    }
    while (v7);
  }
LABEL_10:
  v9 = (unint64_t)result[2];
  if ((v9 & 0x3F) != 0)
    *(uint64_t *)((char *)v2->i64 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(-1 << (v9 & 0x3F));
  return result;
}

uint64_t *BitArray.toggleAll(in:)(unint64_t a1, int64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char *v5;
  uint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t *result;
  uint64_t v10[3];

  v6 = *(_QWORD *)(v3 + 8);
  if (v6 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  v2 = a2;
  if (v6 < a2)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v4 = a1;
  v5 = *(char **)v3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v3 = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_7:
    v5 = sub_23826C260((uint64_t)v5);
    *(_QWORD *)v3 = v5;
  }
  v8 = *((_QWORD *)v5 + 2);
  v10[0] = (uint64_t)(v5 + 32);
  v10[1] = v8;
  v10[2] = v6;
  result = sub_23835244C(v10, v4, v2);
  *(_QWORD *)v3 = v5;
  return result;
}

uint64_t *sub_23835244C(uint64_t *result, unint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  char v6;
  unint64_t v7;
  unint64_t v8;
  int8x16_t *v9;
  unint64_t v10;
  int8x16_t v11;
  unint64_t v12;
  _QWORD *v13;

  if (((a3 | a2) & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v3 = *result;
    v4 = a2 >> 6;
    v5 = a3 >> 6;
    v6 = a2 & 0x3F;
    if (a2 >> 6 == a3 >> 6)
    {
      *(_QWORD *)(v3 + 8 * v4) ^= (-1 << a3) ^ (-1 << v6);
    }
    else
    {
      *(_QWORD *)(v3 + 8 * v4) ^= -1 << v6;
      v7 = v4 + 1;
      if (v4 + 1 < v5)
      {
        v8 = v5 + ~v4;
        if (v8 < 4)
          goto LABEL_9;
        v7 += v8 & 0xFFFFFFFFFFFFFFFCLL;
        v9 = (int8x16_t *)(v3 + 8 * v4 + 24);
        v10 = v8 & 0xFFFFFFFFFFFFFFFCLL;
        do
        {
          v11 = vmvnq_s8(*v9);
          v9[-1] = vmvnq_s8(v9[-1]);
          *v9 = v11;
          v9 += 2;
          v10 -= 4;
        }
        while (v10);
        if (v8 != (v8 & 0xFFFFFFFFFFFFFFFCLL))
        {
LABEL_9:
          v12 = v5 - v7;
          v13 = (_QWORD *)(v3 + 8 * v7);
          do
          {
            *v13 = ~*v13;
            ++v13;
            --v12;
          }
          while (v12);
        }
      }
      if ((a3 & 0x3F) != 0)
        *(_QWORD *)(v3 + 8 * v5) = (-1 << (a3 & 0x3F)) ^ ~*(_QWORD *)(v3 + 8 * v5);
    }
  }
  return result;
}

uint64_t *BitArray.toggleAll<A>(in:)()
{
  unint64_t v1;
  int64_t v2;

  sub_2382C97B4();
  sub_23835B040();
  return BitArray.toggleAll(in:)(v1, v2);
}

uint64_t sub_2383525B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  char v7;
  uint64_t result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _OWORD v14[2];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v3 = v2;
  v6 = *v2;
  v7 = *(_BYTE *)(v6 + 18);
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542CACA8);
    result = swift_allocObject();
    *(_WORD *)(result + 16) = 0;
    *(_BYTE *)(result + 18) = v7;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542CB268);
    result = swift_allocObject();
    *(_WORD *)(result + 16) = 0;
    *(_BYTE *)(result + 18) = 0;
  }
  v13 = result;
  v9 = 0uLL;
  if (*(unsigned __int16 *)(v6 + 16) <= a1)
  {
    v6 = result;
    v12 = 0uLL;
  }
  else if (a1 < 1)
  {
    v9 = *(_OWORD *)(v3 + 1);
    v12 = *(_OWORD *)(v3 + 3);
    *v3 = result;
    *(_OWORD *)(v3 + 1) = 0u;
    *(_OWORD *)(v3 + 3) = 0u;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
    {
      v10 = *((_OWORD *)v3 + 1);
      v16 = *(_OWORD *)v3;
      v17 = v10;
      v18 = v3[4];
      sub_238259B30((uint64_t)v14);
      swift_unknownObjectRelease();
      v11 = v14[1];
      *(_OWORD *)v3 = v14[0];
      *((_OWORD *)v3 + 1) = v11;
      v3[4] = v15;
    }
    result = sub_2383541B8(v3, *(unsigned __int16 *)(*v3 + 16) - a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_238354608, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_238354514);
    v6 = v13;
    v9 = 0u;
    v12 = 0u;
  }
  *(_QWORD *)a2 = v6;
  *(_OWORD *)(a2 + 8) = v9;
  *(_OWORD *)(a2 + 24) = v12;
  return result;
}

uint64_t sub_23835270C@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  unsigned int v18;
  __int128 v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  unsigned int v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _BYTE v36[40];
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v3 = (uint64_t *)result;
  v5 = *a2;
  if (!*a2)
    goto LABEL_14;
  if (!*(_WORD *)(v5 + 16))
  {
    result = sub_23825B804((uint64_t)a2);
LABEL_14:
    v5 = *v3;
    v7 = v3[1];
    v8 = v3[2];
    v9 = v3[3];
    v10 = v3[4];
    v22 = v3[5];
LABEL_27:
    *a3 = v5;
    a3[1] = v7;
    a3[2] = v8;
    a3[3] = v9;
    a3[4] = v10;
    a3[5] = v22;
    return result;
  }
  v7 = a2[1];
  v8 = a2[2];
  v9 = a2[3];
  v10 = a2[4];
  v11 = *(_QWORD *)result;
  if (!*(_QWORD *)result)
  {
LABEL_16:
    v22 = a2[5];
    goto LABEL_27;
  }
  if (!*(_WORD *)(v11 + 16))
  {
    result = sub_23825B804(result);
    goto LABEL_16;
  }
  v12 = *(_OWORD *)(result + 8);
  v13 = *(_OWORD *)(result + 24);
  v35 = a2[4];
  *(_QWORD *)v36 = v11;
  *(_OWORD *)&v36[8] = v12;
  *(_OWORD *)&v36[24] = v13;
  *(_QWORD *)&v33 = v5;
  *((_QWORD *)&v33 + 1) = v7;
  *(_QWORD *)&v34 = v8;
  *((_QWORD *)&v34 + 1) = v9;
  if (*(unsigned __int8 *)(v11 + 18) < *(unsigned __int8 *)(v5 + 18))
  {
    result = sub_238352DB0(v32, (uint64_t *)v36, (uint64_t *)&v40);
    v14 = v40;
    if (!(_QWORD)v40)
    {
      v7 = *((_QWORD *)&v33 + 1);
      v5 = v33;
      v9 = *((_QWORD *)&v34 + 1);
      v8 = v34;
      v10 = v35;
      *(_QWORD *)&v40 = 0;
      MEMORY[0x23B831730](&v40, 8);
      v22 = v40;
      goto LABEL_26;
    }
    v15 = *((_QWORD *)&v40 + 1);
    v16 = v41;
    v37 = v40;
    v38 = v41;
    v29 = v42;
    v39 = v42;
    v17 = v35;
    v42 = v35;
    v40 = v33;
    v41 = v34;
    v18 = *(unsigned __int8 *)(v14 + 18) + 1;
    if (((v18 >> 8) & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      v19 = v41;
      v20 = *((_QWORD *)&v40 + 1);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2542CACA8);
      v5 = swift_allocObject();
      *(_WORD *)(v5 + 16) = 0;
      result = v5 + 16;
      *(_BYTE *)(v5 + 18) = v18;
      v21 = __OFADD__(v15, v20);
      v7 = v15 + v20;
      if (!v21)
      {
        v8 = v16 + v19;
        if (!__OFADD__((_QWORD)v16, (_QWORD)v19))
        {
          v9 = *((_QWORD *)&v16 + 1) + *((_QWORD *)&v19 + 1);
          if (!__OFADD__(*((_QWORD *)&v16 + 1), *((_QWORD *)&v19 + 1)))
          {
            v21 = __OFADD__(v29, v17);
            v10 = v29 + v17;
            if (!v21)
            {
              sub_238354070((_WORD *)result, v5 + 24, (uint64_t)&v37, (uint64_t)&v40);
              v31 = 0;
              MEMORY[0x23B831730](&v31, 8);
              swift_unknownObjectRelease();
              sub_23825B804((uint64_t)&v40);
              v22 = v31;
LABEL_26:
              result = swift_unknownObjectRelease();
              goto LABEL_27;
            }
            goto LABEL_36;
          }
          goto LABEL_31;
        }
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
    }
    __break(1u);
    goto LABEL_30;
  }
  result = sub_238352A50(v32, (uint64_t *)&v33, (uint64_t *)&v40);
  if (!(_QWORD)v40)
  {
    v7 = *(_QWORD *)&v36[8];
    v5 = *(_QWORD *)v36;
    v8 = *(_QWORD *)&v36[16];
    v9 = *(_QWORD *)&v36[24];
    v10 = *(_QWORD *)&v36[32];
    *(_QWORD *)&v40 = 0;
    swift_unknownObjectRetain();
    MEMORY[0x23B831730](&v40, 8);
    v22 = v40;
    swift_unknownObjectRelease();
    goto LABEL_26;
  }
  v23 = *((_QWORD *)&v40 + 1);
  v24 = v41;
  v30 = v42;
  v37 = *(_OWORD *)v36;
  v38 = *(_OWORD *)&v36[16];
  v25 = *(_QWORD *)&v36[32];
  v39 = *(_QWORD *)&v36[32];
  v26 = *(unsigned __int8 *)(*(_QWORD *)v36 + 18) + 1;
  if (((v26 >> 8) & 1) != 0)
    goto LABEL_32;
  v27 = v38;
  v28 = *((_QWORD *)&v37 + 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CACA8);
  v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = 0;
  result = v5 + 16;
  *(_BYTE *)(v5 + 18) = v26;
  v21 = __OFADD__(v28, v23);
  v7 = v28 + v23;
  if (v21)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v8 = v27 + v24;
  if (__OFADD__((_QWORD)v27, (_QWORD)v24))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v9 = *((_QWORD *)&v27 + 1) + *((_QWORD *)&v24 + 1);
  if (__OFADD__(*((_QWORD *)&v27 + 1), *((_QWORD *)&v24 + 1)))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v21 = __OFADD__(v25, v30);
  v10 = v25 + v30;
  if (!v21)
  {
    sub_238354070((_WORD *)result, v5 + 24, (uint64_t)&v37, (uint64_t)&v40);
    v31 = 0;
    MEMORY[0x23B831730](&v31, 8);
    swift_unknownObjectRelease();
    v22 = v31;
    swift_unknownObjectRelease();
    result = sub_23825B804((uint64_t)&v37);
    goto LABEL_27;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_238352A50@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  __int128 *v3;
  _QWORD *v4;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
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
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  _QWORD v57[5];
  _QWORD v58[4];
  _OWORD v59[2];
  uint64_t v60;
  _OWORD v61[2];
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v4 = v3;
  if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
  {
    v8 = v3[1];
    v69 = *v3;
    v70 = v8;
    v71 = *((_QWORD *)v3 + 4);
    sub_238259B30((uint64_t)v59);
    swift_unknownObjectRelease();
    v9 = v59[1];
    *v3 = v59[0];
    v3[1] = v9;
    *((_QWORD *)v3 + 4) = v60;
  }
  if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
  {
    v10 = *((_OWORD *)a2 + 1);
    v66 = *(_OWORD *)a2;
    v67 = v10;
    v68 = a2[4];
    sub_238259B30((uint64_t)v61);
    swift_unknownObjectRelease();
    v11 = v61[1];
    *(_OWORD *)a2 = v61[0];
    *((_OWORD *)a2 + 1) = v11;
    a2[4] = v62;
  }
  if (*(unsigned __int8 *)(*a2 + 18) >= *(unsigned __int8 *)(*(_QWORD *)v3 + 18))
  {
    v36 = *((_QWORD *)v3 + 1);
    v35 = *((_QWORD *)v3 + 2);
    v50 = *((_QWORD *)v3 + 4);
    v52 = *((_QWORD *)v3 + 3);
    if (sub_23835315C(a2))
    {
      result = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
    }
    else
    {
      v12 = a2[1];
      v13 = a2[2];
      v14 = a2[3];
      v15 = a2[4];
      result = swift_unknownObjectRetain();
    }
    v37 = v4[1];
    v19 = __OFSUB__(v37, v36);
    v38 = v37 - v36;
    if (!v19)
    {
      v39 = v4[2];
      v19 = __OFSUB__(v39, v35);
      v40 = v39 - v35;
      if (!v19)
      {
        v41 = v4[3];
        v19 = __OFSUB__(v41, v52);
        v42 = v41 - v52;
        if (!v19)
        {
          v43 = v4[4];
          v19 = __OFSUB__(v43, v50);
          v44 = v43 - v50;
          if (!v19)
          {
            *a1 = v38;
            a1[1] = v40;
            a1[2] = v42;
            a1[3] = v44;
            goto LABEL_31;
          }
          goto LABEL_39;
        }
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        goto LABEL_40;
      }
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  swift_unknownObjectRetain();
  sub_238352A50(&v63, v58, a2);
  v12 = *((_QWORD *)&v63 + 1);
  v51 = v63;
  v14 = *((_QWORD *)&v64 + 1);
  v13 = v64;
  v15 = v65;
  result = swift_unknownObjectRelease();
  v17 = v58[0];
  v18 = v4[1];
  v19 = __OFADD__(v18, v58[0]);
  v20 = v18 + v58[0];
  if (v19)
  {
    __break(1u);
    goto LABEL_33;
  }
  v21 = v58[1];
  v22 = v58[2];
  v23 = v58[3];
  v4[1] = v20;
  v24 = v4[2];
  v19 = __OFADD__(v24, v21);
  v25 = v24 + v21;
  if (v19)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v4[2] = v25;
  v26 = v4[3];
  v19 = __OFADD__(v26, v22);
  v27 = v26 + v22;
  if (v19)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v4[3] = v27;
  v28 = v4[4];
  v19 = __OFADD__(v28, v23);
  v29 = v28 + v23;
  if (v19)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v4[4] = v29;
  result = v51;
  if (!v51)
  {
    *a1 = v17;
    a1[1] = v21;
    a1[2] = v22;
    a1[3] = v23;
    goto LABEL_31;
  }
  v57[0] = v51;
  v57[1] = v12;
  v57[2] = v13;
  v57[3] = v14;
  v57[4] = v15;
  if (*(_WORD *)(*v4 + 16) == 15)
  {
    v30 = v23;
    swift_unknownObjectRetain();
    result = sub_2383525B0(7, (uint64_t)&v63);
    v54 = v63;
    v55 = v64;
    v56 = v65;
    v31 = v17 - *((_QWORD *)&v63 + 1);
    if (!__OFSUB__(v17, *((_QWORD *)&v63 + 1)))
    {
      v32 = v21 - v64;
      if (!__OFSUB__(v21, (_QWORD)v64))
      {
        v33 = v22 - *((_QWORD *)&v64 + 1);
        if (!__OFSUB__(v22, *((_QWORD *)&v64 + 1)))
        {
          v34 = v30 - v65;
          if (!__OFSUB__(v30, v65))
          {
            sub_238353200((uint64_t)v57);
            swift_unknownObjectRelease();
            v12 = *((_QWORD *)&v54 + 1);
            result = v54;
            v14 = *((_QWORD *)&v55 + 1);
            v13 = v55;
            v15 = v56;
            *a1 = v31;
            a1[1] = v32;
            a1[2] = v33;
            a1[3] = v34;
LABEL_31:
            *a3 = result;
            a3[1] = v12;
            a3[2] = v13;
            a3[3] = v14;
            a3[4] = v15;
            return result;
          }
          goto LABEL_43;
        }
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
        goto LABEL_44;
      }
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v45 = v17 + v12;
  if (__OFADD__(v17, v12))
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v46 = v21 + v13;
  if (__OFADD__(v21, v13))
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  v47 = v22 + v14;
  if (__OFADD__(v22, v14))
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  v48 = v45;
  v53 = v23 + v15;
  if (!__OFADD__(v23, v15))
  {
    v49 = v46;
    sub_238353200((uint64_t)v57);
    result = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    *a1 = v48;
    a1[1] = v49;
    a1[2] = v47;
    a1[3] = v53;
    goto LABEL_31;
  }
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_238352DB0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  __int128 *v3;
  uint64_t *v4;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
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
  __int128 v36;
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
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[5];
  _QWORD v66[4];
  _OWORD v67[2];
  uint64_t v68;
  _OWORD v69[2];
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;

  v4 = (uint64_t *)v3;
  if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
  {
    v8 = v3[1];
    v77 = *v3;
    v78 = v8;
    v79 = *((_QWORD *)v3 + 4);
    sub_238259B30((uint64_t)v67);
    swift_unknownObjectRelease();
    v9 = v67[1];
    *v3 = v67[0];
    v3[1] = v9;
    *((_QWORD *)v3 + 4) = v68;
  }
  if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
  {
    v10 = *((_OWORD *)a2 + 1);
    v74 = *(_OWORD *)a2;
    v75 = v10;
    v76 = a2[4];
    sub_238259B30((uint64_t)v69);
    swift_unknownObjectRelease();
    v11 = v69[1];
    *(_OWORD *)a2 = v69[0];
    *((_OWORD *)a2 + 1) = v11;
    a2[4] = v70;
  }
  if (*(unsigned __int8 *)(*a2 + 18) >= *(unsigned __int8 *)(*(_QWORD *)v3 + 18))
  {
    v59 = a1;
    v41 = a2[1];
    v42 = a2[2];
    v44 = a2[3];
    v43 = a2[4];
    result = sub_23835315C((uint64_t *)v3);
    if ((result & 1) != 0)
    {
      result = 0;
      v12 = 0;
      v13 = 0;
      v45 = v43;
      v14 = 0;
      v15 = 0;
      v46 = *v4;
      v47 = *(_OWORD *)(a2 + 1);
      v48 = *(_OWORD *)(a2 + 3);
      *v4 = *a2;
      v49 = *(_OWORD *)(v4 + 1);
      *(_OWORD *)(v4 + 1) = v47;
      v50 = *(_OWORD *)(v4 + 3);
      *(_OWORD *)(v4 + 3) = v48;
      *a2 = v46;
      *(_OWORD *)(a2 + 1) = v49;
      *(_OWORD *)(a2 + 3) = v50;
      *v59 = v41;
      v59[1] = v42;
      v59[2] = v44;
      v59[3] = v45;
      goto LABEL_30;
    }
    v12 = a2[1];
    if (!__OFSUB__(v41, v12))
    {
      v13 = a2[2];
      if (!__OFSUB__(v42, v13))
      {
        v51 = v43;
        v14 = a2[3];
        if (!__OFSUB__(v44, v14))
        {
          v15 = a2[4];
          v19 = __OFSUB__(v51, v15);
          v52 = v51 - v15;
          if (!v19)
          {
            *v59 = v41 - v12;
            v59[1] = v42 - v13;
            v59[2] = v44 - v14;
            v59[3] = v52;
            result = swift_unknownObjectRetain();
            goto LABEL_30;
          }
          goto LABEL_38;
        }
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  swift_unknownObjectRetain();
  sub_238352DB0(&v71, v66, a2);
  v12 = *((_QWORD *)&v71 + 1);
  v58 = v71;
  v14 = *((_QWORD *)&v72 + 1);
  v13 = v72;
  v15 = v73;
  result = swift_unknownObjectRelease();
  v17 = v66[0];
  v18 = v4[1];
  v19 = __OFADD__(v18, v66[0]);
  v20 = v18 + v66[0];
  if (v19)
  {
    __break(1u);
    goto LABEL_32;
  }
  v21 = v66[1];
  v22 = v66[2];
  v23 = v66[3];
  v4[1] = v20;
  v24 = v4[2];
  v19 = __OFADD__(v24, v21);
  v25 = v24 + v21;
  if (v19)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v4[2] = v25;
  v26 = v4[3];
  v19 = __OFADD__(v26, v22);
  v27 = v26 + v22;
  if (v19)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v4[3] = v27;
  v28 = v4[4];
  v19 = __OFADD__(v28, v23);
  v29 = v28 + v23;
  if (v19)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v4[4] = v29;
  result = v58;
  if (!v58)
  {
    *a1 = v17;
    a1[1] = v21;
    a1[2] = v22;
    a1[3] = v23;
    goto LABEL_30;
  }
  v65[0] = v58;
  v65[1] = v12;
  v65[2] = v13;
  v65[3] = v14;
  v65[4] = v15;
  if (*(_WORD *)(*v4 + 16) == 15)
  {
    v30 = v23;
    swift_unknownObjectRetain();
    result = sub_2383525B0(7, (uint64_t)&v71);
    v31 = *v4;
    v32 = v4[1];
    v34 = v4[2];
    v33 = v4[3];
    v35 = v4[4];
    v36 = v72;
    *(_OWORD *)v4 = v71;
    *((_OWORD *)v4 + 1) = v36;
    v4[4] = v73;
    v60 = v31;
    v61 = v32;
    v62 = v34;
    v63 = v33;
    v64 = v35;
    v37 = v17 - v32;
    if (!__OFSUB__(v17, v32))
    {
      v19 = __OFSUB__(v21, v34);
      v38 = v21 - v34;
      if (!v19)
      {
        v39 = v22 - v33;
        if (!__OFSUB__(v22, v33))
        {
          v40 = v30 - v35;
          if (!__OFSUB__(v30, v35))
          {
            sub_238356BB4((uint64_t)v65, 0);
            swift_unknownObjectRelease_n();
            result = v60;
            v12 = v61;
            v13 = v62;
            v14 = v63;
            v15 = v64;
            *a1 = v37;
            a1[1] = v38;
            a1[2] = v39;
            a1[3] = v40;
LABEL_30:
            *a3 = result;
            a3[1] = v12;
            a3[2] = v13;
            a3[3] = v14;
            a3[4] = v15;
            return result;
          }
          goto LABEL_42;
        }
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        goto LABEL_43;
      }
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v53 = v17 + v12;
  if (__OFADD__(v17, v12))
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v54 = v21 + v13;
  if (__OFADD__(v21, v13))
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v19 = __OFADD__(v22, v14);
  v55 = v22 + v14;
  if (v19)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  v56 = v53;
  v57 = v23 + v15;
  if (!__OFADD__(v23, v15))
  {
    sub_238356BB4((uint64_t)v65, 0);
    swift_unknownObjectRelease();
    result = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    *a1 = v56;
    a1[1] = v54;
    a1[2] = v55;
    a1[3] = v57;
    goto LABEL_30;
  }
LABEL_46:
  __break(1u);
  return result;
}

BOOL sub_23835315C(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = *v1;
  v4 = *(unsigned __int16 *)(*v1 + 16);
  if (*(_WORD *)(*v1 + 16))
  {
    v5 = *(unsigned __int16 *)(*a1 + 16);
    if (v4 >= 8 && v5 >= 8)
    {
      return 0;
    }
    else
    {
      sub_238353A1C(v1, a1, (unint64_t)(v5 + v4) >> ((unint64_t)(v5 + v4) > 0xF));
      return *(_WORD *)(*a1 + 16) == 0;
    }
  }
  else
  {
    v8 = *(_OWORD *)(a1 + 1);
    v9 = *(_OWORD *)(a1 + 3);
    *v1 = *a1;
    v10 = *(_OWORD *)(v1 + 1);
    *(_OWORD *)(v1 + 1) = v8;
    v11 = *(_OWORD *)(v1 + 3);
    *(_OWORD *)(v1 + 3) = v9;
    *a1 = v3;
    *(_OWORD *)(a1 + 1) = v10;
    result = 1;
    *(_OWORD *)(a1 + 3) = v11;
  }
  return result;
}

uint64_t sub_238353200(uint64_t a1)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int128 v22;
  _OWORD v23[2];
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    v8 = v1[1];
    v25 = *v1;
    v26 = v8;
    v27 = *((_QWORD *)v1 + 4);
    sub_238259B30((uint64_t)v23);
    result = swift_unknownObjectRelease();
    v9 = v23[1];
    *v1 = v23[0];
    v1[1] = v9;
    *((_QWORD *)v1 + 4) = v24;
  }
  v10 = *((_QWORD *)v1 + 1);
  v11 = __OFADD__(v10, v4);
  v12 = v10 + v4;
  if (v11)
  {
    __break(1u);
    goto LABEL_10;
  }
  *((_QWORD *)v1 + 1) = v12;
  v13 = *((_QWORD *)v1 + 2);
  v11 = __OFADD__(v13, v3);
  v14 = v13 + v3;
  if (v11)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  *((_QWORD *)v1 + 2) = v14;
  v15 = *((_QWORD *)v1 + 3);
  v11 = __OFADD__(v15, v6);
  v16 = v15 + v6;
  if (v11)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  *((_QWORD *)v1 + 3) = v16;
  v17 = *((_QWORD *)v1 + 4);
  v11 = __OFADD__(v17, v5);
  v18 = v17 + v5;
  if (v11)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  *((_QWORD *)v1 + 4) = v18;
  v19 = *(_QWORD *)v1;
  v20 = *(unsigned __int16 *)(*(_QWORD *)v1 + 16);
  v21 = *(_QWORD *)v1 + 40 * *(unsigned __int16 *)(*(_QWORD *)v1 + 16);
  v22 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v21 + 24) = *(_OWORD *)a1;
  *(_OWORD *)(v21 + 40) = v22;
  *(_QWORD *)(v21 + 56) = *(_QWORD *)(a1 + 32);
  if (v20 != 0xFFFF)
  {
    *(_WORD *)(v19 + 16) = v20 + 1;
    return result;
  }
LABEL_13:
  __break(1u);
  return result;
}

_WORD *sub_238353318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _WORD *result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  uint64_t v29[5];
  _QWORD v30[5];
  _QWORD v31[6];

  v4 = v3;
  ++v4[5];
  if (!*v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542CB268);
    v25 = swift_allocObject();
    *(_WORD *)(v25 + 16) = 0;
    *(_BYTE *)(v25 + 18) = 0;
    v31[0] = v25;
    result = (_WORD *)sub_2382660A8(a1, a2, a3 & 0xFFFFFFFFFFFFLL);
    v19 = v31[0];
    v22 = 0;
    v21 = 0;
    v24 = 0;
    v23 = 0;
    goto LABEL_10;
  }
  sub_2383534D4(a1, a2, a3 & 0xFFFFFFFFFFFFLL, (uint64_t)v28);
  v8 = v28[0];
  v9 = v28[1];
  v11 = v28[2];
  v10 = v28[3];
  v12 = v28[4];
  result = (_WORD *)sub_238263E74((uint64_t)v28, (uint64_t)v29);
  if (!v29[0])
    return result;
  v31[0] = v8;
  v31[1] = v9;
  v31[2] = v11;
  v31[3] = v10;
  v27 = v10;
  v31[4] = v12;
  v14 = v4[1];
  v16 = v4[2];
  v15 = v4[3];
  v17 = v4[4];
  v30[0] = *v4;
  v30[1] = v14;
  v30[2] = v16;
  v30[3] = v15;
  v30[4] = v17;
  v18 = *(unsigned __int8 *)(v30[0] + 18) + 1;
  if (((v18 >> 8) & 1) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  v26 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CACA8);
  v19 = swift_allocObject();
  *(_WORD *)(v19 + 16) = 0;
  result = (_WORD *)(v19 + 16);
  *(_BYTE *)(v19 + 18) = v18;
  v20 = __OFADD__(v14, v9);
  v21 = v14 + v9;
  if (v20)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v20 = __OFADD__(v16, v11);
  v22 = v16 + v11;
  if (v20)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v23 = v15 + v27;
  if (__OFADD__(v15, v27))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v24 = v17 + v26;
  if (__OFADD__(v17, v26))
  {
LABEL_16:
    __break(1u);
    return result;
  }
  sub_238354070(result, v19 + 24, (uint64_t)v30, (uint64_t)v31);
  sub_23825B804((uint64_t)v28);
  result = (_WORD *)swift_unknownObjectRelease();
LABEL_10:
  *v4 = v19;
  v4[1] = v21;
  v4[2] = v22;
  v4[3] = v23;
  v4[4] = v24;
  return result;
}

double sub_2383534D4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v7;
  char v8;
  uint8x8_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _WORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  double result;
  __int128 v27;
  _OWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  unsigned __int8 v38;
  unsigned __int8 v39;
  _OWORD v40[3];
  _OWORD v41[2];
  uint64_t v42;
  _QWORD v43[5];
  _QWORD v44[5];
  uint64_t v45[5];

  v5 = v4;
  v35 = a1;
  v36 = a2;
  LOWORD(v37) = a3;
  BYTE2(v37) = BYTE2(a3);
  HIBYTE(v37) = BYTE3(a3);
  v38 = BYTE4(a3);
  v39 = BYTE5(a3);
  v7 = *v4;
  if ((a3 & 0xFCu) <= 0x7BuLL
    && *(_WORD *)(v7 + 16)
    && (v45[0] = *(unsigned __int8 *)(v7 + 18),
        sub_238354974(v45, (uint64_t)v28),
        v8 = sub_2382682A0((uint64_t)&v35),
        sub_23826A570((uint64_t)v45, (uint64_t)v28, v9),
        swift_bridgeObjectRelease(),
        (v8 & 1) != 0))
  {
    memset(v40, 0, 40);
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
    {
      v10 = *((_OWORD *)v4 + 1);
      v28[0] = *(_OWORD *)v4;
      v28[1] = v10;
      v29 = v4[4];
      sub_238259B30((uint64_t)v41);
      swift_unknownObjectRelease();
      v11 = v41[1];
      *(_OWORD *)v4 = v41[0];
      *((_OWORD *)v4 + 1) = v11;
      v4[4] = v42;
    }
    v12 = *v4;
    if (*(_BYTE *)(*v5 + 18))
    {
      v13 = *(_OWORD *)(v5 + 3);
      v33 = *(_OWORD *)(v5 + 1);
      v34 = v13;
      swift_unknownObjectRetain();
      sub_238353838((unsigned __int16 *)(v12 + 16), v12 + 24, &v33, &v35, (uint64_t)v43);
      v14 = v43[0];
      v15 = v43[1];
      v16 = v43[2];
      v17 = v43[3];
      v18 = v43[4];
      swift_unknownObjectRelease();
      v19 = v34;
      *(_OWORD *)(v5 + 1) = v33;
      *(_OWORD *)(v5 + 3) = v19;
      sub_238263E74((uint64_t)v43, (uint64_t)v44);
      if (v44[0])
      {
        v45[0] = v14;
        v45[1] = v15;
        v45[2] = v16;
        v45[3] = v17;
        v45[4] = v18;
        v20 = (_WORD *)(*v5 + 16);
        v21 = *v5 + 24;
        sub_238263DDC((uint64_t)v43);
        swift_unknownObjectRetain();
        sub_23835399C(v20, v21);
        swift_unknownObjectRelease();
        if (*(_WORD *)(*v5 + 16) == 15)
        {
          sub_2383525B0(8, (uint64_t)&v30);
          sub_238353200((uint64_t)v45);
          sub_23825B804((uint64_t)v43);
          *(_QWORD *)&v40[0] = v30;
          *(_OWORD *)((char *)v40 + 8) = v31;
          *(_OWORD *)((char *)&v40[1] + 8) = v32;
        }
        else
        {
          sub_238353200((uint64_t)v45);
          sub_23825B804((uint64_t)v43);
          memset(v40, 0, 40);
        }
      }
      else
      {
        sub_238263E74((uint64_t)v43, (uint64_t)v40);
      }
    }
    else
    {
      if (*(_WORD *)(v12 + 16) != 15)
      {
        sub_2382660A8(v35, v36, v37 | ((unint64_t)v38 << 32) | ((unint64_t)v39 << 40));
        memset(v40, 0, 40);
        goto LABEL_16;
      }
      sub_2383525B0(8, (uint64_t)v40);
      v22 = v35;
      v23 = v36;
      v24 = v37 | ((unint64_t)v38 << 32) | ((unint64_t)v39 << 40);
      swift_bridgeObjectRetain();
      sub_2382660A8(v22, v23, v24);
    }
  }
  swift_bridgeObjectRelease();
LABEL_16:
  v25 = *(_QWORD *)&v40[2];
  result = *(double *)v40;
  v27 = v40[1];
  *(_OWORD *)a4 = v40[0];
  *(_OWORD *)(a4 + 16) = v27;
  *(_QWORD *)(a4 + 32) = v25;
  return result;
}

uint64_t (*sub_2383537D0(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v5;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v3[8] = v1;
  v5 = *(unsigned __int8 *)(*(_QWORD *)v1 + 18);
  sub_238354974(&v5, (uint64_t)v3);
  return sub_238353834;
}

unsigned __int16 *sub_238353838@<X0>(unsigned __int16 *result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];

  v6 = a2 + 40 * *result;
  v9 = *(_QWORD *)(v6 - 16);
  v8 = (uint64_t *)(v6 - 16);
  v7 = v9;
  v11 = v8 - 2;
  v10 = *(v8 - 2);
  v12 = *a3 - v10;
  if (__OFSUB__(*a3, v10))
  {
    __break(1u);
    goto LABEL_11;
  }
  v14 = v8[1];
  v15 = *(v8 - 1);
  *a3 = v12;
  v16 = a3[1];
  v17 = __OFSUB__(v16, v15);
  v18 = v16 - v15;
  if (v17)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  a3[1] = v18;
  v19 = a3[2];
  v17 = __OFSUB__(v19, v7);
  v20 = v19 - v7;
  if (v17)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  a3[2] = v20;
  v21 = a3[3];
  v17 = __OFSUB__(v21, v14);
  v22 = v21 - v14;
  if (v17)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  a3[3] = v22;
  v23 = *a4;
  v24 = a4[1];
  v25 = *((unsigned int *)a4 + 4) | ((unint64_t)*((unsigned __int8 *)a4 + 20) << 32) | ((unint64_t)*((unsigned __int8 *)a4 + 21) << 40);
  swift_bridgeObjectRetain();
  result = (unsigned __int16 *)sub_2383534D4(v35, v23, v24, v25);
  if (__OFADD__(*a3, *v11))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v26 = *v8;
  v27 = v8[1];
  v28 = *(v8 - 1);
  *a3 += *v11;
  v29 = a3[1];
  v17 = __OFADD__(v29, v28);
  v30 = v29 + v28;
  if (v17)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  a3[1] = v30;
  v31 = a3[2];
  v17 = __OFADD__(v31, v26);
  v32 = v31 + v26;
  if (v17)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  a3[2] = v32;
  v33 = a3[3];
  v17 = __OFADD__(v33, v27);
  v34 = v33 + v27;
  if (!v17)
  {
    a3[3] = v34;
    return (unsigned __int16 *)sub_238263E74((uint64_t)v35, a5);
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t *sub_23835399C(_WORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *result;
  unint64_t v9;
  void *v10;
  _BYTE v11[40];

  v4 = (unsigned __int16)*a1;
  v5 = a2 + 40 * v4;
  v7 = *(_QWORD *)(v5 - 40);
  v6 = (uint64_t *)(v5 - 40);
  result = v6 - 5;
  v9 = *(unsigned __int16 *)(v7 + 16) + (unint64_t)*(unsigned __int16 *)(*(v6 - 5) + 16);
  if (v9 <= 0xF)
  {
    v10 = (void *)(v4 - 1);
    sub_238353A1C(result, v6, v9);
    sub_238353B4C(v10, a1, a2, (uint64_t)v11);
    return (uint64_t *)sub_23825B804((uint64_t)v11);
  }
  return result;
}

uint64_t sub_238353A1C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t result;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t *v16;
  BOOL v17;
  _OWORD v18[2];
  uint64_t v19;
  _OWORD v20[2];
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  if ((swift_isUniquelyReferenced_nonNull() & 1) == 0)
  {
    v6 = *((_OWORD *)a1 + 1);
    v25 = *(_OWORD *)a1;
    v26 = v6;
    v27 = a1[4];
    sub_238259B30((uint64_t)v18);
    swift_unknownObjectRelease();
    v7 = v18[1];
    *(_OWORD *)a1 = v18[0];
    *((_OWORD *)a1 + 1) = v7;
    a1[4] = v19;
  }
  result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    v9 = *((_OWORD *)a2 + 1);
    v22 = *(_OWORD *)a2;
    v23 = v9;
    v24 = a2[4];
    sub_238259B30((uint64_t)v20);
    result = swift_unknownObjectRelease();
    v10 = v20[1];
    *(_OWORD *)a2 = v20[0];
    *((_OWORD *)a2 + 1) = v10;
    a2[4] = v21;
  }
  v11 = *(unsigned __int16 *)(*a1 + 16);
  v12 = *(unsigned __int16 *)(*a2 + 16) + v11;
  if (v12 >= a3)
    v12 = a3;
  v13 = v12 - v11;
  if (__OFSUB__(v12, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  if (!v13)
    return result;
  if (v13 <= 0)
  {
    v17 = __OFSUB__(0, v13);
    v13 = v11 - v12;
    if (!v17)
    {
      v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_238354608;
      v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_238354514;
      v16 = a1;
      return sub_2383541B8(v16, v13, v14, v15);
    }
LABEL_16:
    __break(1u);
    return result;
  }
  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2383543FC;
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_238354308;
  v16 = a2;
  return sub_2383541B8(v16, v13, v14, v15);
}

void *sub_238353B4C@<X0>(void *result@<X0>, _WORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  v5 = (unsigned __int16)*a2;
  v6 = __OFSUB__(v5, result);
  v7 = v5 - (_QWORD)result;
  if (v6)
  {
    __break(1u);
    goto LABEL_6;
  }
  v6 = __OFSUB__(v7, 1);
  v8 = v7 - 1;
  if (v6)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v10 = (uint64_t *)(a3 + 40 * (_QWORD)result);
  v11 = *v10;
  v12 = *(_OWORD *)(v10 + 3);
  v13 = *(_OWORD *)(v10 + 1);
  result = memmove(v10, v10 + 5, 40 * v8);
  if (*a2)
  {
    --*a2;
    *(_QWORD *)a4 = v11;
    *(_OWORD *)(a4 + 8) = v13;
    *(_OWORD *)(a4 + 24) = v12;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_238353BE8(_OWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void (*v18)(char *, uint64_t);
  __int128 v19;
  unint64_t v21[3];
  _OWORD v22[2];
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v3 = sub_23835BAFC();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v21[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v21[-1] - v9;
  v11 = a1[2];
  v22[1] = a1[1];
  v23 = v11;
  v22[0] = *a1;
  if (*(_QWORD *)&v22[0])
  {
    v12 = v23;
    if (!(_QWORD)v23)
      return sub_23825B804((uint64_t)a1);
    v13 = *v1;
    if (*v1)
    {
      v15 = v1[3];
      v14 = v1[4];
      v24 = *v1;
      v25 = *(_OWORD *)(v1 + 1);
      v26 = v15;
      v27 = v14;
      if (v14)
      {
        v16 = *(unsigned __int8 *)(v13 + 18);
        swift_unknownObjectRetain();
        sub_238261C98(v16, (uint64_t)v21);
        swift_unknownObjectRelease();
        v17 = sub_2382672A8(v21[0], v21[1]);
        result = swift_bridgeObjectRelease();
        if ((v17 & 0x100000000) != 0)
        {
          __break(1u);
        }
        else
        {
          sub_23835BAF0();
          LOBYTE(v21[0]) = 0;
          sub_2382600B8((v12 << 11) | 0x300, 0, 0, (uint64_t *)1, v17, (unint64_t)v7);
          sub_238269BA4((uint64_t)v10);
          sub_238356698((uint64_t *)v22);
          v18 = *(void (**)(char *, uint64_t))(v4 + 8);
          v18(v7, v3);
          return ((uint64_t (*)(char *, uint64_t))v18)(v10, v3);
        }
        return result;
      }
      result = swift_unknownObjectRelease();
    }
    v19 = a1[1];
    *(_OWORD *)v1 = *a1;
    *((_OWORD *)v1 + 1) = v19;
    *((_OWORD *)v1 + 2) = a1[2];
  }
  return result;
}

uint64_t sub_238353DB4(__int128 *a1, unint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t result;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void (*v21)(_BYTE *, uint64_t);
  __int128 v22;
  _BYTE v23[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  __int128 v28;
  _OWORD v29[3];
  _BYTE v30[40];
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  v3 = v2;
  v6 = sub_23835BAFC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v23[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v23[-v11];
  if ((a2[4] ^ *a2) < 0x800)
    return sub_23825B804((uint64_t)a1);
  v14 = a1[1];
  v29[0] = *a1;
  v29[1] = v14;
  v29[2] = a1[2];
  sub_238263E74((uint64_t)v29, (uint64_t)v30);
  sub_238263DDC((uint64_t)v30);
  sub_238342810(a1, a2, &v24);
  v15 = *v3;
  if (!*v3)
  {
    result = sub_23825B804((uint64_t)a1);
LABEL_12:
    v22 = v25;
    *(_OWORD *)v3 = v24;
    *((_OWORD *)v3 + 1) = v22;
    *((_OWORD *)v3 + 2) = v26;
    return result;
  }
  v17 = v3[3];
  v16 = v3[4];
  v31 = *v3;
  v32 = *(_OWORD *)(v3 + 1);
  v33 = v17;
  v34 = v16;
  if (!v16)
  {
    sub_23825B804((uint64_t)a1);
    result = swift_unknownObjectRelease();
    goto LABEL_12;
  }
  v18 = *(unsigned __int8 *)(v15 + 18);
  swift_unknownObjectRetain();
  sub_238261C98(v18, (uint64_t)v27);
  swift_unknownObjectRelease();
  v19 = sub_2382672A8(*(unint64_t *)&v27[0], *((unint64_t *)&v27[0] + 1));
  result = swift_bridgeObjectRelease();
  if ((v19 & 0x100000000) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_23835BAF0();
    v27[0] = v24;
    v27[1] = v25;
    v28 = v26;
    if ((_QWORD)v24)
      v20 = ((_QWORD)v28 << 11) | 0x300;
    else
      v20 = 768;
    v23[12] = 0;
    sub_2382600B8(v20, 0, 0, (uint64_t *)1, v19, (unint64_t)v10);
    sub_238269BA4((uint64_t)v12);
    swift_unknownObjectRetain();
    sub_238356698((uint64_t *)v27);
    sub_23825B804((uint64_t)a1);
    sub_23825B804((uint64_t)&v24);
    v21 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v21(v10, v6);
    return ((uint64_t (*)(_BYTE *, uint64_t))v21)(v12, v6);
  }
  return result;
}

double sub_238354020@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CACA8);
  v4 = swift_allocObject();
  *(_WORD *)(v4 + 16) = 0;
  *(_BYTE *)(v4 + 18) = a1;
  *(_QWORD *)a2 = v4;
  result = 0.0;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  return result;
}

_WORD *sub_238354070(_WORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v8;
  __int128 v9;

  v4 = (unsigned __int16)*result;
  v5 = a2 + 40 * (unsigned __int16)*result;
  v6 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a3;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a3 + 32);
  if (v4 == 0xFFFF)
  {
    __break(1u);
  }
  else
  {
    *result = v4 + 1;
    v8 = a2 + 40 * (v4 + 1);
    v9 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)v8 = *(_OWORD *)a4;
    *(_OWORD *)(v8 + 16) = v9;
    *(_QWORD *)(v8 + 32) = *(_QWORD *)(a4 + 32);
    if (v4 != 65534)
    {
      *result = v4 + 2;
      sub_238263DDC(a3);
      return (_WORD *)sub_238263DDC(a4);
    }
  }
  __break(1u);
  return result;
}

void *sub_2383540F8(void *result, uint64_t a2, unint64_t a3, uint64_t a4, _WORD *a5, uint64_t a6)
{
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  char v10;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int v19;

  v6 = (unsigned __int16)*a5;
  v7 = __OFSUB__(v6, a4);
  v8 = v6 - a4;
  if (v7)
  {
    __break(1u);
  }
  else
  {
    v10 = a3;
    v12 = result;
    v13 = a3 >> 40;
    v14 = HIDWORD(a3);
    v15 = (_QWORD *)(a6 + 24 * a4);
    v16 = a3 >> 24;
    v17 = a3 >> 16;
    v18 = a3 >> 8;
    result = memmove(v15 + 3, v15, 24 * v8);
    *v15 = v12;
    v15[1] = a2;
    *((_BYTE *)v15 + 16) = v10;
    *((_BYTE *)v15 + 17) = v18;
    *((_BYTE *)v15 + 18) = v17;
    *((_BYTE *)v15 + 19) = v16;
    *((_BYTE *)v15 + 20) = v14;
    *((_BYTE *)v15 + 21) = v13;
    v19 = (unsigned __int16)*a5;
    if (v19 != 0xFFFF)
    {
      *a5 = v19 + 1;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2383541B8(uint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  _QWORD *v4;
  uint64_t v9;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  BOOL v26;
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

  v9 = *v4;
  v10 = *(unsigned __int8 *)(*v4 + 18);
  v11 = *v4 + 24;
  v12 = *a1;
  v13 = *a1 + 24;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v14 = v9 + 16;
  v15 = v12 + 16;
  if (v10)
    v16 = a4(v15, v13, a2, v14, v11);
  else
    v16 = a3(v15, v13, a2, v14, v11);
  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = v19;
  swift_unknownObjectRelease();
  result = swift_unknownObjectRelease();
  v25 = v4[1];
  v26 = __OFADD__(v25, v20);
  v27 = v25 + v20;
  if (v26)
  {
    __break(1u);
    goto LABEL_14;
  }
  v4[1] = v27;
  v28 = v4[2];
  v26 = __OFADD__(v28, v21);
  v29 = v28 + v21;
  if (v26)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v4[2] = v29;
  v30 = v4[3];
  v26 = __OFADD__(v30, v22);
  v31 = v30 + v22;
  if (v26)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v4[3] = v31;
  v32 = v4[4];
  v26 = __OFADD__(v32, v23);
  v33 = v32 + v23;
  if (v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v4[4] = v33;
  v34 = a1[1];
  v26 = __OFSUB__(v34, v20);
  v35 = v34 - v20;
  if (v26)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  a1[1] = v35;
  v36 = a1[2];
  v26 = __OFSUB__(v36, v21);
  v37 = v36 - v21;
  if (v26)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  a1[2] = v37;
  v38 = a1[3];
  v26 = __OFSUB__(v38, v22);
  v39 = v38 - v22;
  if (v26)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  a1[3] = v39;
  v40 = a1[4];
  v26 = __OFSUB__(v40, v23);
  v41 = v40 - v23;
  if (!v26)
  {
    a1[4] = v41;
    return result;
  }
LABEL_20:
  __break(1u);
  return result;
}

void *sub_238354308(_WORD *a1, char *__dst, uint64_t a3, _WORD *a4, uint64_t a5)
{
  char *v10;
  char *v11;
  void *result;
  uint64_t v14;
  BOOL v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;

  if (a3 < 1)
    return 0;
  v10 = (char *)(a5 + 40 * (unsigned __int16)*a4);
  v11 = &__dst[40 * a3];
  if (v10 != __dst || v10 >= v11)
    memmove(v10, __dst, 40 * a3);
  result = memmove(__dst, v11, 40 * ((unsigned __int16)*a1 - a3));
  v14 = (unsigned __int16)*a4;
  v15 = __OFADD__(v14, a3);
  v16 = v14 + a3;
  if (v15)
  {
    __break(1u);
    goto LABEL_18;
  }
  if ((v16 & 0x8000000000000000) != 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v16 >> 16)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  *a4 = v16;
  v17 = (unsigned __int16)*a1 - a3;
  if (v17 < 0)
  {
LABEL_20:
    __break(1u);
    return result;
  }
  *a1 = v17;
  v18 = (unsigned __int16)*a4;
  if (v18 >= a3)
    v19 = v18 - a3;
  else
    v19 = 0;
  return (void *)sub_238354AC0(v19, v18, a5);
}

char *sub_2383543FC(_WORD *a1, char *__dst, uint64_t a3, _WORD *a4, uint64_t a5)
{
  char *result;
  uint64_t v11;
  char *v12;
  size_t v14;
  uint64_t v15;
  BOOL v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;

  if (a3 < 1)
    return 0;
  result = (char *)(a5 + 24 * (unsigned __int16)*a4);
  v11 = 24 * a3;
  v12 = &__dst[24 * a3];
  if (result != __dst || result >= v12)
    result = (char *)memmove(result, __dst, 24 * a3);
  v14 = 24 * ((unsigned __int16)*a1 - a3);
  if (v11 > 0 || &v12[v14] <= __dst || v11)
    result = (char *)memmove(__dst, v12, v14);
  v15 = (unsigned __int16)*a4;
  v16 = __OFADD__(v15, a3);
  v17 = v15 + a3;
  if (v16)
  {
    __break(1u);
    goto LABEL_22;
  }
  if ((v17 & 0x8000000000000000) != 0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v17 >> 16)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  *a4 = v17;
  v18 = (unsigned __int16)*a1 - a3;
  if (v18 < 0)
  {
LABEL_24:
    __break(1u);
    return result;
  }
  *a1 = v18;
  v19 = (unsigned __int16)*a4;
  if (v19 >= a3)
    v20 = v19 - a3;
  else
    v20 = 0;
  return (char *)sub_238354B50(v20, v19, a5);
}

void *sub_238354514(_WORD *a1, uint64_t a2, uint64_t a3, _WORD *a4, char *__src)
{
  void *result;
  unint64_t v11;
  char *v12;
  uint64_t v14;
  BOOL v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a3 < 1)
    return 0;
  result = memmove(&__src[40 * a3], __src, 40 * (unsigned __int16)*a4);
  v11 = a2 + 40 * (unsigned __int16)*a1;
  v12 = (char *)(v11 - 40 * a3);
  if (v11 <= (unint64_t)__src || v12 != __src)
    result = memmove(__src, v12, 40 * a3);
  v14 = (unsigned __int16)*a4;
  v15 = __OFADD__(v14, a3);
  v16 = v14 + a3;
  if (v15)
  {
    __break(1u);
    goto LABEL_17;
  }
  if ((v16 & 0x8000000000000000) != 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v16 >> 16)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  *a4 = v16;
  v17 = (unsigned __int16)*a1 - a3;
  if (v17 < 0)
  {
LABEL_19:
    __break(1u);
    return result;
  }
  *a1 = v17;
  if ((unsigned __int16)*a4 >= a3)
    v18 = a3;
  else
    v18 = (unsigned __int16)*a4;
  return (void *)sub_238354AC0(0, v18, (uint64_t)__src);
}

void *sub_238354608(_WORD *a1, uint64_t a2, uint64_t a3, _WORD *a4, char *__src)
{
  size_t v10;
  void *result;
  char *v12;
  uint64_t v14;
  BOOL v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a3 < 1)
    return 0;
  v10 = 24 * a3;
  result = memmove(&__src[24 * a3], __src, 24 * (unsigned __int16)*a4);
  v12 = (char *)(a2 + 24 * (unsigned __int16)*a1 - 24 * a3);
  if (v12 != __src || &v12[v10] <= __src)
    result = memmove(__src, v12, v10);
  v14 = (unsigned __int16)*a4;
  v15 = __OFADD__(v14, a3);
  v16 = v14 + a3;
  if (v15)
  {
    __break(1u);
    goto LABEL_17;
  }
  if ((v16 & 0x8000000000000000) != 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v16 >> 16)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  *a4 = v16;
  v17 = (unsigned __int16)*a1 - a3;
  if (v17 < 0)
  {
LABEL_19:
    __break(1u);
    return result;
  }
  *a1 = v17;
  if ((unsigned __int16)*a4 >= a3)
    v18 = a3;
  else
    v18 = (unsigned __int16)*a4;
  return (void *)sub_238354B50(0, v18, (uint64_t)__src);
}

uint64_t *sub_238354704(uint64_t *result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];
  uint64_t v11;

  v2 = (uint64_t)v1;
  v3 = *v1;
  if (*(_WORD *)(v3 + 16))
  {
    v4 = result;
    v5 = *(unsigned __int16 *)(v3 + 16) - 1;
    v6 = *(unsigned __int8 *)(v3 + 18);
    *result = ((-15 << ((4 * v6 + 8) & 0x3C)) - 1) & *result | (v5 << ((4 * v6 + 8) & 0x3C));
    if (v6)
    {
      v7 = v3 + 40 * (int)v5;
      v8 = *(_OWORD *)(v7 + 24);
      v9 = *(_OWORD *)(v7 + 40);
      v11 = *(_QWORD *)(v7 + 56);
      v10[0] = v8;
      v10[1] = v9;
      sub_238263DDC(v2);
      sub_238263DDC((uint64_t)v10);
      v3 = sub_238354704(v4);
      sub_23825B804((uint64_t)v10);
      sub_23825B804(v2);
    }
    return (uint64_t *)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2383547CC(unsigned __int16 *a1, uint64_t a2, uint64_t *a3, uint64_t a4, char a5)
{
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t *v19;
  _OWORD v21[2];
  uint64_t v22;
  _OWORD v23[2];
  uint64_t v24;

  v9 = *a3;
  if (*a3 < *a1)
  {
    v10 = a2 + 40 * v9;
    v11 = *(_OWORD *)(v10 + 16);
    v23[0] = *(_OWORD *)v10;
    v23[1] = v11;
    v24 = *(_QWORD *)(v10 + 32);
    swift_unknownObjectRetain();
    v12 = sub_23826A4AC(a4);
    sub_23825B804((uint64_t)v23);
    if ((v12 & 1) != 0)
      return 1;
    v9 = *a3;
  }
  v13 = v9 < 1;
  v14 = v9 - 1;
  if (!v13)
  {
    *a3 = v14;
    v16 = *(_QWORD *)(a4 + 8);
    v15 = (uint64_t *)(a4 + 8);
    *v15 = v16 & ((-15 << ((4 * a5 + 8) & 0x3C)) - 1) | (v14 << ((4 * a5 + 8) & 0x3C));
    v17 = a2 + 40 * *a3;
    v18 = *(_OWORD *)(v17 + 16);
    v21[0] = *(_OWORD *)v17;
    v21[1] = v18;
    v22 = *(_QWORD *)(v17 + 32);
    swift_unknownObjectRetain();
    v19 = sub_238354704(v15);
    sub_23825B804((uint64_t)v21);
    v15[1] = (uint64_t)v19;
    return 1;
  }
  return 0;
}

uint64_t (*sub_2383548E0(_QWORD *a1, unint64_t a2))()
{
  uint64_t v2;
  _QWORD *v5;

  v5 = malloc(0x48uLL);
  *a1 = v5;
  v5[8] = v2;
  sub_2382593B4(a2, (uint64_t)v5);
  return sub_238353834;
}

void sub_238354934(uint64_t *a1, uint8x8_t a2)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)*a1;
  sub_23826A570((uint64_t)&v3, *a1, a2);
  swift_bridgeObjectRelease();
  free(v2);
}

uint64_t sub_238354974@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 *v2;
  uint64_t result;
  uint8x8_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int32 v18;
  int8x16_t v19;
  int8x16_t v20;
  _OWORD v21[2];
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    v7 = v2[1];
    v23 = *v2;
    v24 = v7;
    v25 = *((_QWORD *)v2 + 4);
    sub_238259B30((uint64_t)v21);
    result = swift_unknownObjectRelease();
    v6.i32[1] = DWORD1(v21[0]);
    v8 = v21[1];
    *v2 = v21[0];
    v2[1] = v8;
    *((_QWORD *)v2 + 4) = v22;
  }
  v9 = *(_QWORD *)v2;
  v10 = *(unsigned __int16 *)(*(_QWORD *)v2 + 16);
  if (*(_WORD *)(*(_QWORD *)v2 + 16))
  {
    v11 = v10 - 1;
    v12 = *(unsigned __int8 *)(v9 + 18);
    v13 = ((-15 << ((4 * v12 + 8) & 0x3C)) - 1) & *a1 | ((v10 - 1) << ((4 * v12 + 8) & 0x3C));
    *a1 = v13;
    if (v12)
    {
      swift_unknownObjectRetain();
      sub_238354974(a1);
      return swift_unknownObjectRelease();
    }
    else
    {
      v14 = v9 + 24 + 24 * v11;
      v15 = *(_QWORD *)(v14 + 8);
      v16 = *(unsigned __int8 *)(v14 + 16);
      v17 = *(unsigned __int8 *)(v14 + 17);
      *(_QWORD *)(a2 + 8) = *(_QWORD *)v14;
      *(_QWORD *)(a2 + 16) = v15;
      *(_BYTE *)(a2 + 24) = v16;
      *(_BYTE *)(a2 + 25) = v17;
      v6.i32[0] = *(_DWORD *)(v14 + 18);
      v18 = vmovl_u8(v6).u32[0];
      *(_DWORD *)(a2 + 26) = v6.i32[0];
      v19.i64[0] = HIWORD(v18);
      v19.i64[1] = (unsigned __int16)v18;
      v20.i64[0] = 255;
      v20.i64[1] = 255;
      *(int8x16_t *)(a2 + 32) = vandq_s8(v19, v20);
      *(_QWORD *)(a2 + 48) = v17;
      *(_QWORD *)(a2 + 56) = v16;
      *(_QWORD *)a2 = v13;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_238354AC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *i;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2 - a1;
  if (a2 == a1)
    return 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  result = 0;
  for (i = (_QWORD *)(a3 + 40 * a1 + 16); ; i += 5)
  {
    v11 = *(i - 1);
    v12 = __OFADD__(result, v11);
    result += v11;
    if (v12)
      break;
    v12 = __OFADD__(v9, *i);
    v9 += *i;
    if (v12)
      goto LABEL_11;
    v13 = i[1];
    v12 = __OFADD__(v8, v13);
    v8 += v13;
    if (v12)
      goto LABEL_12;
    v14 = i[2];
    v12 = __OFADD__(v7, v14);
    v7 += v14;
    if (v12)
      goto LABEL_13;
    if (!--v3)
      return result;
  }
  __break(1u);
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_238354B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *i;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2 - a1;
  if (a2 == a1)
    return 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  result = 0;
  for (i = (unsigned __int8 *)(a3 + 24 * a1 + 19); ; i += 24)
  {
    v11 = *i;
    v12 = __OFADD__(result, v11);
    result += v11;
    if (v12)
      break;
    v13 = *(i - 1);
    v12 = __OFADD__(v9, v13);
    v9 += v13;
    if (v12)
      goto LABEL_11;
    v14 = *(i - 2);
    v12 = __OFADD__(v8, v14);
    v8 += v14;
    if (v12)
      goto LABEL_12;
    v15 = *(i - 3);
    v12 = __OFADD__(v7, v15);
    v7 += v15;
    if (v12)
      goto LABEL_13;
    if (!--v3)
      return result;
  }
  __break(1u);
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

unint64_t _s19CollectionsInternal9BigStringV6append10contentsOfySsn_tF_0(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void (*v25)(void);
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  char v32;
  _OWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint8x8_t v39;
  unint64_t *v40;
  __int128 v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  __int16 v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  int v76;
  unsigned int v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  BOOL v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  _OWORD *v115;
  __int128 v116;
  uint64_t v117;
  uint64_t v118;
  __int128 v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  _OWORD *v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  uint64_t v135;
  unint64_t *v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  __int128 v140;
  __int128 v141;
  _BYTE v142[70];
  uint64_t v143;
  _QWORD v144[4];
  uint64_t v145[6];
  _OWORD v146[2];
  uint64_t v147;
  uint64_t v148;
  _QWORD v149[12];
  _OWORD v150[2];
  __int128 v151;
  uint64_t v152;
  __int128 v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  _BYTE v157[56];

  *(_QWORD *)&v141 = a3;
  v8 = sub_23835BAFC();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v120 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (unint64_t)&v120 - v13;
  v15 = _s9_IngesterVMa();
  MEMORY[0x24BDAC7A8](v15);
  v136 = (unint64_t *)((char *)&v120 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!((a2 ^ a1) >> 14))
    return swift_bridgeObjectRelease();
  v18 = *(_QWORD *)v4;
  if (!*(_QWORD *)v4 || (v19 = *(_QWORD *)(v4 + 32)) == 0)
  {
    sub_23825C1A0(a1, a2, v141, a4, v142);
    result = swift_unknownObjectRelease();
    v41 = *(_OWORD *)&v142[16];
    *(_OWORD *)v4 = *(_OWORD *)v142;
    *(_OWORD *)(v4 + 16) = v41;
    *(_OWORD *)(v4 + 32) = *(_OWORD *)&v142[32];
    return result;
  }
  v20 = *(_QWORD *)(v4 + 24);
  v21 = *(_QWORD *)(v4 + 40);
  v153 = *(_OWORD *)(v4 + 8);
  v152 = v18;
  v154 = v20;
  v155 = v19;
  v156 = v21;
  v139 = v18;
  *(_QWORD *)&v140 = (v19 << 11) | 0x300;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v22 = sub_23832E6D0(a1, a2, v141, a4);
  v130 = (_OWORD *)v4;
  v23 = v22;
  swift_bridgeObjectRelease();
  sub_2382600B8(v140, 0, 0, (uint64_t *)1, v23 | ((HIDWORD(v23) & 1) << 32), v14);
  (*(void (**)(char *, unint64_t, unint64_t))(v9 + 16))(v12, v14, v8);
  v24 = (unint64_t)v136;
  *v136 = a1;
  *(_QWORD *)(v24 + 8) = a2;
  *(_QWORD *)(v24 + 16) = v141;
  *(_QWORD *)(v24 + 24) = a4;
  if ((a4 & 0x1000000000000000) != 0)
    goto LABEL_182;
LABEL_6:
  *(_QWORD *)(v24 + 32) = a1;
  v25 = *(void (**)(void))(v9 + 32);
  *(_QWORD *)&v140 = v24 + *(int *)(v15 + 24);
  v25();
  (*(void (**)(unint64_t, unint64_t))(v9 + 8))(v14, v8);
  swift_unknownObjectRelease();
  v26 = v130[1];
  v150[0] = *v130;
  v150[1] = v26;
  v151 = v130[2];
  v27 = v150[0];
  v28 = v26;
  v29 = *((_QWORD *)&v151 + 1);
  v30 = (unint64_t *)v151;
  swift_unknownObjectRetain();
  v31 = sub_238269C7C();
  *(_QWORD *)v142 = v29;
  *(_QWORD *)&v142[8] = v31;
  *(_QWORD *)&v142[16] = 0;
  if (!(_QWORD)v27)
  {
    if (v31)
      goto LABEL_8;
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v31 <= *(unsigned __int8 *)(v27 + 18))
    goto LABEL_16;
LABEL_8:
  *(_OWORD *)&v149[7] = v27;
  *(_OWORD *)&v149[9] = v28;
  v149[11] = v30;
  swift_unknownObjectRetain();
  v32 = sub_23826A4AC((uint64_t)v142);
  sub_23825B804((uint64_t)v150);
  result = sub_23825B804((uint64_t)v150);
  if ((v32 & 1) == 0)
  {
    __break(1u);
LABEL_184:
    __break(1u);
    goto LABEL_185;
  }
  if (*(_QWORD *)v142 != v29)
    goto LABEL_184;
  if (!(_QWORD)v27)
    goto LABEL_195;
  v33 = v130;
  sub_2382593B4(*(unint64_t *)&v142[8], (uint64_t)v142);
  v30 = v136;
  v34 = sub_23829B708((unint64_t)v136);
  v36 = v35;
  v38 = v37;
  sub_23826A570((uint64_t)v149, (uint64_t)v142, v39);
  result = swift_bridgeObjectRelease();
  *((_QWORD *)v33 + 5) = v29 + 1;
  if (v36)
  {
    if ((v38 & 0xFCu) >= 0x7CuLL)
    {
      sub_238353318(v34, v36, v38 & 0xFFFFFFFFFFFFLL);
      v40 = v136;
      return sub_23831BD98((uint64_t)v40);
    }
LABEL_186:
    __break(1u);
LABEL_187:
    __break(1u);
    goto LABEL_188;
  }
LABEL_17:
  v24 = v30[4];
  v42 = v30[1];
  if ((v42 ^ v24) < 0x4000)
  {
    v40 = v30;
    return sub_23831BD98((uint64_t)v40);
  }
  *(_QWORD *)&v141 = 0;
  *(_QWORD *)v142 = MEMORY[0x24BEE4AF8];
  memset(&v142[8], 0, 62);
  v143 = 0;
  v144[0] = 0;
  *(_QWORD *)((char *)v144 + 6) = 0;
  v144[2] = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v43 = *v30;
    v44 = v30[2];
    v15 = v30[3];
    swift_bridgeObjectRetain();
    v45 = sub_23835B43C();
    swift_bridgeObjectRelease();
    v46 = v45 - 124;
    if (v45 >= 379)
      v46 = 255;
    if (v45 <= 255)
      v47 = v45;
    else
      v47 = v46;
    result = sub_238265ADC(v24, v42, v47, v44, v15);
    if ((v49 & 1) != 0 || (result ^ v48) < 0x4000)
    {
      if ((v24 ^ v42) >> 14)
        goto LABEL_193;
      v115 = v130;
      v116 = v130[1];
      *(_OWORD *)v149 = *v130;
      *(_OWORD *)&v149[2] = v116;
      *(_OWORD *)&v149[4] = v130[2];
      sub_238263E74((uint64_t)v149, (uint64_t)v157);
      sub_238263DDC((uint64_t)v157);
      sub_238265C60(v145);
      sub_23835270C((uint64_t)v149, v145, (uint64_t *)v146);
      v140 = v146[1];
      v141 = v146[0];
      v117 = v147;
      v118 = v148;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23831BD98((uint64_t)v136);
      result = swift_unknownObjectRelease();
      v119 = v140;
      *v115 = v141;
      v115[1] = v119;
      *((_QWORD *)v115 + 4) = v117;
      *((_QWORD *)v115 + 5) = v118;
      return result;
    }
    v30[4] = v48;
    v125 = v48;
    v126 = result;
    v127 = v43;
    v128 = v15;
    v129 = v44;
    v50 = sub_23835B46C();
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v57 = sub_238265480(v50, v51, v53, v55);
    v58 = v141;
    sub_2382D10F4(v50, v52, v54, v56);
    *(_QWORD *)&v141 = v58;
    if ((v59 & 0x100) != 0)
      break;
    v131 = v52;
    v60 = v50;
    if ((v59 & 1) == 0)
    {
      v122 = v42;
      swift_bridgeObjectRetain();
      v61 = v131;
      v62 = sub_23835B430();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v63 = sub_23835B430();
      result = swift_bridgeObjectRelease();
      v64 = v63 >> 14;
      if (v63 >> 14 < v62 >> 14)
        goto LABEL_187;
      v9 = v61 >> 14;
LABEL_84:
      if (v9 >= v64)
      {
        v80 = sub_23835B46C();
        v14 = v81;
        v9 = v82;
        a1 = v83;
        result = swift_bridgeObjectRelease();
        v139 = v62;
        v107 = 1;
        while (1)
        {
          if ((a1 & 0x1000000000000000) != 0)
          {
            v94 = v80 >> 14;
            v8 = v14 >> 14;
            if (v80 >> 14 >= v14 >> 14)
              goto LABEL_144;
            v95 = 4 << ((v9 & 0x800000000000000) != 0);
            v96 = HIBYTE(a1) & 0xF;
            if ((a1 & 0x2000000000000000) == 0)
              v96 = v9 & 0xFFFFFFFFFFFFLL;
            v134 = v80 >> 14;
            v135 = v96;
            v97 = v80;
            v137 = 4 << ((v9 & 0x800000000000000) != 0);
            while (1)
            {
              v98 = v97 & 0xC;
              v99 = v98 == v95 || (v97 & 1) == 0;
              v138 = v97;
              v133 = v94;
              if (v99)
              {
                v100 = v97;
                if (v98 == v95)
                {
                  result = sub_2382A6050(v138, v9, a1);
                  v98 = v97 & 0xC;
                  v100 = result;
                }
                v101 = v134;
                if (v135 <= v100 >> 16)
                  goto LABEL_189;
                v131 = v98;
                if ((v100 & 1) == 0)
                  sub_23826674C(v100, v9, a1);
                v15 = sub_23835ADB8();
                result = v138;
                if (v131 == v137)
                  result = sub_2382A6050(v138, v9, a1);
                if (result >> 14 < v101 || result >> 14 >= v8)
                  goto LABEL_190;
                if ((result & 1) == 0)
                  sub_23826674C(result, v9, a1);
              }
              else
              {
                if (v135 <= v97 >> 16)
                  goto LABEL_191;
                result = sub_23835ADB8();
                if (v97 >> 14 < v134)
                  goto LABEL_192;
                v15 = result;
                result = v138;
                if (v97 >> 14 >= v8)
                  goto LABEL_192;
              }
              sub_23835B5A4();
              v24 = v140;
              result = sub_23835BAE4();
              v89 = v15 >> 14;
              if ((result & 1) != 0)
                break;
              v97 = v15;
              v94 = v15 >> 14;
              v95 = v137;
              if (v89 >= v8)
                goto LABEL_144;
            }
            if (v89 < v133)
              goto LABEL_194;
          }
          else
          {
            if ((a1 & 0x2000000000000000) != 0)
            {
              v149[0] = v9;
              v149[1] = a1 & 0xFFFFFFFFFFFFFFLL;
              v84 = v149;
            }
            else if ((v9 & 0x1000000000000000) != 0)
            {
              v84 = (_QWORD *)((a1 & 0xFFFFFFFFFFFFFFFLL) + 32);
            }
            else
            {
              v84 = (_QWORD *)sub_23835B634();
            }
            v85 = v141;
            v15 = sub_2382D14B0((uint64_t)v84, v80, v14, v9, a1);
            v24 = v86;
            *(_QWORD *)&v141 = v85;
            LOBYTE(v146[0]) = v87 & 1;
            if ((v87 & 1) != 0)
            {
LABEL_144:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              v15 = v126;
              v104 = sub_23835B43C();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              v139 = sub_23835B43C();
              swift_bridgeObjectRelease();
              v57 = v104;
              v65 = sub_23835B46C();
              v54 = v105;
              v56 = v106;
              goto LABEL_146;
            }
            if ((v80 & 0xC) == 8)
            {
              v102 = sub_2382A6050(v80, v9, a1);
              v8 = v15 + (v102 >> 16);
              if (__OFADD__(v15, v102 >> 16))
              {
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
                goto LABEL_174;
              }
            }
            else
            {
              v8 = v15 + (v80 >> 16);
              if (__OFADD__(v15, v80 >> 16))
                goto LABEL_160;
            }
            if ((v8 & 0x8000000000000000) != 0)
              goto LABEL_161;
            if ((a1 & 0x2000000000000000) != 0)
              v15 = HIBYTE(a1) & 0xF;
            else
              v15 = v9 & 0xFFFFFFFFFFFFLL;
            if (v15 < v8)
              goto LABEL_162;
            if ((v80 & 0xC) == 8)
            {
              v103 = sub_2382A6050(v80, v9, a1);
              v88 = v24 + (v103 >> 16);
              if (__OFADD__(v24, v103 >> 16))
                goto LABEL_163;
            }
            else
            {
              v88 = v24 + (v80 >> 16);
              if (__OFADD__(v24, v80 >> 16))
                goto LABEL_163;
            }
            if ((v88 & 0x8000000000000000) != 0)
              goto LABEL_164;
            if (v15 < v88)
              goto LABEL_165;
            if (v88 < v8)
              goto LABEL_166;
            v8 = v14 >> 14;
            v89 = 4 * v88;
            v15 = (v88 << 16) | 4;
          }
          if (v8 < v89)
            goto LABEL_167;
          v80 = sub_23835B46C();
          v14 = v90;
          v9 = v91;
          v24 = v92;
          result = swift_bridgeObjectRelease();
          a1 = v24;
          if (__OFADD__(v107++, 1))
            goto LABEL_168;
        }
      }
LABEL_185:
      __break(1u);
      goto LABEL_186;
    }
    v107 = 0;
    v139 = v57;
    v65 = v60;
LABEL_145:
    v66 = v131;
LABEL_146:
    v8 = MEMORY[0x23B8306D4](v65, v66, v54, v56);
    v109 = v108;
    v135 = v57;
    if ((v108 & 0x1000000000000000) != 0)
    {
      v8 = sub_238266994();
      v114 = v113;
      swift_bridgeObjectRelease();
      v109 = v114;
    }
    swift_bridgeObjectRetain();
    v14 = sub_23835AF80();
    v24 = v110;
    a1 = v111;
    v9 = v112;
    swift_bridgeObjectRelease();
    if ((uint64_t)sub_238265480(v14, v24, a1, v9) > 255)
      goto LABEL_173;
    v138 = v8;
    v8 = sub_238265480(v14, v24, a1, v9);
    v15 = sub_23835AF2C();
    v14 = sub_23826648C(v14, v24, a1, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((uint64_t)v8 > 255)
    {
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
      sub_2382F977C();
      goto LABEL_6;
    }
    if ((uint64_t)v15 > 255)
      goto LABEL_175;
    if ((uint64_t)v14 > 255)
      goto LABEL_176;
    if (v107 > 255)
      goto LABEL_177;
    if (v135 > 255)
      goto LABEL_178;
    if (((v135 | v107 | v139 | v8 | v15 | v14) & 0x8000000000000000) != 0)
      goto LABEL_179;
    if (v139 > 255)
      goto LABEL_180;
    if (v8 < 0x7CuLL)
      goto LABEL_181;
    v132 = ((_DWORD)v107 << 24) | v132 & 0xFFFF000000000000 | ((unint64_t)v135 << 32) & 0xFFFF00FFFF0000FFLL | ((unint64_t)v139 << 40) | (unsigned __int16)(v15 << 8) | ((unint64_t)v14 << 16) | v8;
    sub_238263184(v138, v109, v132);
    v30 = v136;
    v42 = v136[1];
    v24 = v136[4];
  }
  v122 = v42;
  v9 = v52 >> 14;
  v65 = v50;
  v66 = v52;
  if (v50 >> 14 >= v52 >> 14)
  {
    v107 = 0;
    v139 = v57;
    goto LABEL_146;
  }
  v131 = v52;
  v67 = (v54 >> 59) & 1;
  if ((v56 & 0x1000000000000000) == 0)
    LOBYTE(v67) = 1;
  v68 = 4 << v67;
  v69 = HIBYTE(v56) & 0xF;
  v123 = v54 & 0xFFFFFFFFFFFFLL;
  v124 = v69;
  if ((v56 & 0x2000000000000000) == 0)
    v69 = v54 & 0xFFFFFFFFFFFFLL;
  v137 = v50 >> 14;
  v138 = v69;
  v134 = v56 & 0xFFFFFFFFFFFFFFLL;
  v135 = v57;
  v133 = (v56 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v121 = v50;
  v15 = v50;
  a1 = v50 >> 14;
  v139 = v68;
  while (1)
  {
    v8 = v15 & 0xC;
    v70 = (v15 & 1) == 0 || v8 == v68;
    v14 = v70;
    if (v70)
    {
      v62 = v15;
      if (v8 == v68)
      {
        v79 = sub_2382A6050(v15, v54, v56);
        v68 = v139;
        v15 = v79;
      }
      if (v138 <= v15 >> 16)
        goto LABEL_169;
      if ((v15 & 1) == 0)
      {
        v71 = sub_23826674C(v15, v54, v56);
        v68 = v139;
        v15 = v15 & 0xC | v71 & 0xFFFFFFFFFFFFFFF3 | 1;
      }
    }
    else
    {
      v62 = v15;
      if (v138 <= v15 >> 16)
        goto LABEL_170;
    }
    if ((v56 & 0x1000000000000000) != 0)
    {
      v75 = sub_23835ADB8();
      v68 = v139;
      v15 = v75;
      v24 = v137;
      if (!(_DWORD)v14)
        goto LABEL_58;
    }
    else
    {
      v72 = v15 >> 16;
      if ((v56 & 0x2000000000000000) != 0)
      {
        v149[0] = v54;
        v149[1] = v134;
        v74 = *((unsigned __int8 *)v149 + v72);
      }
      else
      {
        v73 = v133;
        if ((v54 & 0x1000000000000000) == 0)
        {
          v73 = sub_23835B634();
          v68 = v139;
        }
        v74 = *(unsigned __int8 *)(v73 + v72);
      }
      v76 = (char)v74;
      v77 = __clz(v74 ^ 0xFF) - 24;
      if (v76 >= 0)
        LOBYTE(v77) = 1;
      v15 = ((v72 + v77) << 16) | 5;
      v24 = v137;
      if (!(_DWORD)v14)
      {
LABEL_58:
        if (v62 >> 14 < v24 || v62 >> 14 >= v9)
          goto LABEL_171;
LABEL_70:
        if ((v56 & 0x1000000000000000) != 0)
          goto LABEL_77;
        goto LABEL_71;
      }
    }
    v78 = v62;
    if (v8 == v68)
      v78 = sub_2382A6050(v62, v54, v56);
    if (v78 >> 14 < v24 || v78 >> 14 >= v9)
      goto LABEL_172;
    if ((v78 & 1) != 0)
      goto LABEL_70;
    sub_23826674C(v78, v54, v56);
    if ((v56 & 0x1000000000000000) != 0)
    {
LABEL_77:
      sub_23835B5A4();
      goto LABEL_78;
    }
LABEL_71:
    if ((v56 & 0x2000000000000000) != 0)
    {
      v149[0] = v54;
      v149[1] = v134;
      swift_bridgeObjectRetain();
      sub_23835B640();
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v54 & 0x1000000000000000) == 0)
        sub_23835B634();
      swift_bridgeObjectRetain();
      sub_23835B640();
      swift_bridgeObjectRelease();
    }
LABEL_78:
    v24 = v140;
    result = sub_23835BAE4();
    v64 = v15 >> 14;
    if ((result & 1) != 0)
      break;
    a1 = v15 >> 14;
    v68 = v139;
    if (v64 >= v9)
    {
      v107 = 0;
      v57 = v135;
      v139 = v135;
      v65 = v121;
      goto LABEL_145;
    }
  }
  if (v64 >= a1)
    goto LABEL_84;
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
LABEL_195:
  __break(1u);
  return result;
}

uint64_t _s19CollectionsInternal9BigStringV6append10contentsOfyACn_tF_0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  __int128 v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[3];
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48[8];

  v2 = v1;
  v4 = sub_23835BAFC();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v5);
  v11 = (char *)&v24 - v10;
  v12 = *(_QWORD *)a1;
  if (*(_QWORD *)a1)
  {
    v14 = *(_QWORD *)(a1 + 8);
    v13 = *(_QWORD *)(a1 + 16);
    v15 = *(_QWORD *)(a1 + 24);
    v16 = *(_OWORD *)(a1 + 32);
    v43 = *(_QWORD *)a1;
    v44 = v14;
    v45 = v13;
    v46 = v15;
    v47 = v16;
    if (!(_QWORD)v16)
      return sub_23825B804(a1);
    v17 = *v1;
    if (*v1)
    {
      v18 = v1[4];
      if (v18)
      {
        v28 = v16;
        v29 = v17;
        v30 = v18;
        v31 = v9;
        v32 = result;
        v27 = v1[1];
        v26 = v1[2];
        v25 = v1[3];
        sub_238261C98(*(unsigned __int8 *)(v12 + 18), (uint64_t)&v37);
        v19 = sub_2382672A8(v37, v38);
        result = swift_bridgeObjectRelease();
        if ((v19 & 0x100000000) != 0)
        {
          __break(1u);
        }
        else
        {
          *(_QWORD *)&v33 = v12;
          *((_QWORD *)&v33 + 1) = v14;
          *(_QWORD *)&v34 = v13;
          *((_QWORD *)&v34 + 1) = v15;
          v35 = v28;
          swift_unknownObjectRetain();
          sub_23835BAF0();
          v20 = v2[5];
          v37 = v29;
          v38 = v27;
          v39 = v26;
          v40 = v25;
          v41 = v30;
          v42 = v20;
          LOBYTE(v36[0]) = 0;
          sub_2382600B8((v30 << 11) | 0x300, 0, 0, (uint64_t *)1, v19, (unint64_t)v7);
          sub_238269BA4((uint64_t)v11);
          v36[0] = v33;
          v36[1] = v34;
          v36[2] = v35;
          sub_238263E74((uint64_t)v36, (uint64_t)v48);
          sub_238263DDC((uint64_t)v48);
          sub_238259194((uint64_t *)v36);
          sub_23825B804(a1);
          v21 = *(void (**)(char *, uint64_t))(v31 + 8);
          v22 = v32;
          v21(v7, v32);
          v21(v11, v22);
          return swift_unknownObjectRelease();
        }
        return result;
      }
      result = swift_unknownObjectRelease();
    }
    v23 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)v1 = *(_OWORD *)a1;
    *((_OWORD *)v1 + 1) = v23;
    *((_OWORD *)v1 + 2) = *(_OWORD *)(a1 + 32);
  }
  return result;
}

_WORD *sub_238355DD4(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t *v4;
  uint64_t *v5;
  __int128 v10;
  unint64_t v11;
  _WORD *result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  uint64_t v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _OWORD v32[2];
  __int128 v33;
  _BYTE v34[40];
  uint64_t v35[6];

  v5 = v4;
  v10 = *((_OWORD *)v4 + 1);
  v32[0] = *(_OWORD *)v4;
  v32[1] = v10;
  v33 = *((_OWORD *)v4 + 2);
  sub_238263E74((uint64_t)v32, (uint64_t)v34);
  sub_238263DDC((uint64_t)v34);
  v11 = sub_238269C7C();
  sub_23825B804((uint64_t)v32);
  if (v11 == a4)
    return sub_238353318((uint64_t)a1, a2, a3 & 0xFFFFFFFFFFFFLL);
  result = (_WORD *)sub_238263E74((uint64_t)v34, (uint64_t)v35);
  if (!v35[0])
    goto LABEL_18;
  sub_238355FA8(a1, a2, a3 & 0xFFFFFFFFFFFFLL, a4, v28);
  v13 = v28[0];
  v14 = v28[1];
  v16 = v28[2];
  v15 = v28[3];
  v17 = v28[4];
  result = (_WORD *)sub_238263E74((uint64_t)v28, (uint64_t)v29);
  if (v29[0])
  {
    v31[0] = v13;
    v31[1] = v14;
    v31[2] = v16;
    v31[3] = v15;
    v27 = v15;
    v31[4] = v17;
    v18 = v5[1];
    v20 = v5[2];
    v19 = v5[3];
    v21 = v5[4];
    v30[0] = *v5;
    v30[1] = v18;
    v30[2] = v20;
    v30[3] = v19;
    v30[4] = v21;
    v22 = *(unsigned __int8 *)(v30[0] + 18) + 1;
    if (((v22 >> 8) & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      v26 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2542CACA8);
      v23 = swift_allocObject();
      *(_WORD *)(v23 + 16) = 0;
      result = (_WORD *)(v23 + 16);
      *(_BYTE *)(v23 + 18) = v22;
      v24 = __OFADD__(v18, v14);
      v25 = v18 + v14;
      if (!v24)
      {
        if (!__OFADD__(v20, v16))
        {
          if (!__OFADD__(v19, v27))
          {
            if (!__OFADD__(v21, v26))
            {
              sub_238354070(result, v23 + 24, (uint64_t)v30, (uint64_t)v31);
              sub_23825B804((uint64_t)v28);
              result = (_WORD *)swift_unknownObjectRelease();
              *v5 = v23;
              v5[1] = v25;
              v5[2] = v20 + v16;
              v5[3] = v19 + v27;
              v5[4] = v21 + v26;
              goto LABEL_11;
            }
            goto LABEL_17;
          }
LABEL_16:
          __break(1u);
LABEL_17:
          __break(1u);
LABEL_18:
          __break(1u);
          return result;
        }
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_11:
  v5[5] = *((_QWORD *)&v33 + 1) + 1;
  return result;
}

uint64_t sub_238355FA8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  __int128 *v5;
  __int128 *v6;
  uint64_t result;
  __int128 v13;
  __int128 v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  _QWORD v26[2];
  __int128 v27;
  __int128 v28;
  void *v29;
  uint64_t v30;
  unsigned int v31;
  char v32;
  char v33;
  _OWORD v34[2];
  uint64_t v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v6 = v5;
  v29 = a1;
  v30 = a2;
  LOWORD(v31) = a3;
  BYTE2(v31) = BYTE2(a3);
  HIBYTE(v31) = BYTE3(a3);
  v32 = BYTE4(a3);
  v33 = BYTE5(a3);
  result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    v13 = v5[1];
    v44 = *v5;
    v45 = v13;
    v46 = *((_QWORD *)v5 + 4);
    sub_238259B30((uint64_t)v34);
    result = swift_unknownObjectRelease();
    v14 = v34[1];
    *v5 = v34[0];
    v5[1] = v14;
    *((_QWORD *)v5 + 4) = v35;
  }
  v15 = a4 >> ((4 * *(_BYTE *)(*(_QWORD *)v5 + 18) + 8) & 0x3C);
  v16 = v15 & 0xF;
  v17 = *(unsigned __int16 *)(*(_QWORD *)v6 + 16);
  if (*(_BYTE *)(*(_QWORD *)v6 + 18))
  {
    if ((v15 & 0xF) < v17)
    {
      v26[1] = v26;
      MEMORY[0x24BDAC7A8](result);
      v18 = *(__int128 *)((char *)v6 + 24);
      v27 = *(__int128 *)((char *)v6 + 8);
      v28 = v18;
      v19 = *(_QWORD *)v6 + 24;
      swift_unknownObjectRetain();
      sub_238356A80(v19, v16, &v27, (_QWORD *(*)(_OWORD *__return_ptr))sub_238356A78, (uint64_t)v36);
      v20 = v36[0];
      v21 = v36[1];
      v22 = v36[2];
      v23 = v36[3];
      v24 = v36[4];
      swift_unknownObjectRelease();
      v25 = v28;
      *(__int128 *)((char *)v6 + 8) = v27;
      *(__int128 *)((char *)v6 + 24) = v25;
      sub_238263E74((uint64_t)v36, (uint64_t)v38);
      if (v38[0])
      {
        v39 = v20;
        v40 = v21;
        v41 = v22;
        v42 = v23;
        v43 = v24;
        sub_238356370((uint64_t)&v39, v16, v37);
        v20 = v37[0];
        v21 = v37[1];
        v22 = v37[2];
        v23 = v37[3];
        v24 = v37[4];
      }
      result = swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    __break(1u);
  }
  else if ((v15 & 0xF) <= v17)
  {
    result = sub_2383561C8(a1, a2, a3 & 0xFFFF00000000 | v31, v15 & 0xF, &v39);
    v20 = v39;
    v21 = v40;
    v22 = v41;
    v23 = v42;
    v24 = v43;
LABEL_10:
    *a5 = v20;
    a5[1] = v21;
    a5[2] = v22;
    a5[3] = v23;
    a5[4] = v24;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_2383561C8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  void *v15;
  uint64_t v16;
  unsigned int v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v15 = a1;
  v16 = a2;
  LOWORD(v17) = a3;
  BYTE2(v17) = BYTE2(a3);
  HIBYTE(v17) = BYTE3(a3);
  v18 = BYTE4(a3);
  v19 = BYTE5(a3);
  v8 = *v5;
  if ((a3 & 0xFCu) <= 0x7BuLL && *(_WORD *)(v8 + 16))
  {
    if ((sub_2383565CC((uint64_t)&v15, a4) & 1) != 0)
    {
LABEL_9:
      result = swift_bridgeObjectRelease();
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      goto LABEL_11;
    }
    v8 = *v5;
  }
  if (*(_WORD *)(v8 + 16) != 15)
  {
    sub_238356DE0(v15, v16, v17 | ((unint64_t)v18 << 32) | ((unint64_t)v19 << 40), a4);
    goto LABEL_9;
  }
  if (a4 >= 8)
  {
    sub_2383525B0(8, (uint64_t)&v20);
    sub_238356DE0(v15, v16, ((unint64_t)v19 << 40) | ((unint64_t)v18 << 32) | v17, a4 - *(unsigned __int16 *)(*v5 + 16));
    result = swift_bridgeObjectRelease();
    v9 = v20;
    v10 = v21;
    v11 = v22;
    v12 = v23;
    v13 = v24;
  }
  else
  {
    sub_2383525B0(7, (uint64_t)&v20);
    v9 = v20;
    v10 = v21;
    v11 = v22;
    v12 = v23;
    v13 = v24;
    sub_238356DE0(v15, v16, v17 | ((unint64_t)v18 << 32) | ((unint64_t)v19 << 40), a4);
    result = swift_bridgeObjectRelease();
  }
LABEL_11:
  *a5 = v9;
  a5[1] = v10;
  a5[2] = v11;
  a5[3] = v12;
  a5[4] = v13;
  return result;
}

uint64_t sub_238356370@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *v3;
  __int128 v5;
  uint64_t v6;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
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
  _OWORD v37[2];
  uint64_t v38;
  _BYTE v39[40];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v5 = *(_OWORD *)(result + 16);
  v37[0] = *(_OWORD *)result;
  v37[1] = v5;
  v38 = *(_QWORD *)(result + 32);
  v6 = a2 + 1;
  if (__OFADD__(a2, 1))
  {
    __break(1u);
    goto LABEL_22;
  }
  v8 = (_QWORD *)result;
  if (a2 >= 1)
  {
    v9 = *v3;
    v10 = *v3 + 24;
    v11 = v10 + 40 * a2;
    v13 = *(_QWORD *)(v11 - 40);
    v12 = (uint64_t *)(v11 - 40);
    v14 = *(unsigned __int16 *)(*(_QWORD *)(v10 + 40 * a2) + 16) + (unint64_t)*(unsigned __int16 *)(v13 + 16);
    if (v14 >= 0x10)
    {
      swift_unknownObjectRetain();
LABEL_6:
      swift_unknownObjectRelease();
      goto LABEL_7;
    }
    swift_unknownObjectRetain();
    sub_238353A1C(v12, (uint64_t *)(v10 + 40 * a2), v14);
    sub_238353B4C((void *)a2, (_WORD *)(v9 + 16), v10, (uint64_t)v39);
    result = sub_23825B804((uint64_t)v39);
    v15 = __OFSUB__(v6--, 1);
    if (!v15)
      goto LABEL_6;
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
LABEL_7:
  v16 = *(unsigned __int16 *)(*v3 + 16);
  if (v6 >= v16
    || (v17 = *v3 + 40 * v6,
        v19 = *(_QWORD *)(v17 + 24),
        v18 = (uint64_t *)(v17 + 24),
        *(unsigned __int16 *)(v19 + 16) + (unint64_t)*(unsigned __int16 *)(*v8 + 16) > 0xF))
  {
    if ((_DWORD)v16 == 15)
    {
      sub_2383525B0(7, (uint64_t)&v40);
      if (v6 >= 8)
      {
        sub_238356BB4((uint64_t)v8, v6 - *(unsigned __int16 *)(*v3 + 16));
        result = sub_23825B804((uint64_t)v8);
        v20 = v40;
        v21 = v41;
        v22 = v42;
        v23 = v43;
        v24 = v44;
      }
      else
      {
        v20 = v40;
        v21 = v41;
        v22 = v42;
        v23 = v43;
        v24 = v44;
        sub_238356BB4((uint64_t)v8, v6);
        result = sub_23825B804((uint64_t)v8);
      }
      goto LABEL_20;
    }
    sub_238356BB4((uint64_t)v8, v6);
    result = sub_23825B804((uint64_t)v8);
LABEL_18:
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
LABEL_20:
    *a3 = v20;
    a3[1] = v21;
    a3[2] = v22;
    a3[3] = v23;
    a3[4] = v24;
    return result;
  }
  v26 = v8[1];
  v25 = v8[2];
  v28 = v8[3];
  v27 = v8[4];
  swift_unknownObjectRetain();
  sub_238353A1C((uint64_t *)v37, v18, 0);
  result = swift_unknownObjectRelease();
  v29 = v3[1];
  v15 = __OFADD__(v29, v26);
  v30 = v29 + v26;
  if (v15)
    goto LABEL_23;
  v3[1] = v30;
  v31 = v3[2];
  v15 = __OFADD__(v31, v25);
  v32 = v31 + v25;
  if (v15)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v3[2] = v32;
  v33 = v3[3];
  v15 = __OFADD__(v33, v28);
  v34 = v33 + v28;
  if (v15)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v3[3] = v34;
  v35 = v3[4];
  v15 = __OFADD__(v35, v27);
  v36 = v35 + v27;
  if (!v15)
  {
    v3[4] = v36;
    result = swift_unknownObjectRelease();
    goto LABEL_18;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_2383565CC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[8];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v5 = *v2 + 24;
  swift_unknownObjectRetain();
  sub_238356D08(v5, a2, a1, (uint64_t)v21);
  v6 = v21[0];
  v8 = v22;
  v7 = v23;
  v10 = v24;
  v9 = v25;
  result = swift_unknownObjectRelease();
  v12 = v2[1];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (v13)
  {
    __break(1u);
    goto LABEL_7;
  }
  v2[1] = v14;
  v15 = v2[2];
  v13 = __OFADD__(v15, v7);
  v16 = v15 + v7;
  if (v13)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v2[2] = v16;
  v17 = v2[3];
  v13 = __OFADD__(v17, v10);
  v18 = v17 + v10;
  if (v13)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v2[3] = v18;
  v19 = v2[4];
  v13 = __OFADD__(v19, v9);
  v20 = v19 + v9;
  if (!v13)
  {
    v2[4] = v20;
    return v6;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t *sub_238356698(uint64_t *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _QWORD *v10;
  unsigned __int8 *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
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
  unsigned __int8 *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v2 = *result;
  if (!*result)
    return result;
  v3 = (uint64_t)result;
  v4 = result[1];
  v5 = result[2];
  v7 = result[3];
  v6 = result[4];
  v8 = result[5];
  v27 = *result;
  v28 = v4;
  v29 = v5;
  v30 = v7;
  v31 = v6;
  v9 = *(unsigned __int16 *)(v2 + 16);
  if (!*(_WORD *)(v2 + 16))
    return (uint64_t *)sub_23825B804(v3);
  v10 = v1;
  v11 = (unsigned __int8 *)*v1;
  if (!*v1)
  {
LABEL_10:
    *v1 = v2;
    v1[1] = v4;
    v1[2] = v5;
    v1[3] = v7;
    v1[4] = v6;
    v1[5] = v8;
    return result;
  }
  v13 = v1[1];
  v12 = v1[2];
  v15 = v1[3];
  v14 = v1[4];
  v32 = *v1;
  v33 = v13;
  v34 = v12;
  v35 = v15;
  v36 = v14;
  if (!v14)
  {
    result = (uint64_t *)swift_unknownObjectRelease();
    goto LABEL_10;
  }
  if (v9 != 1 || *(_BYTE *)(v2 + 18))
  {
    v16 = v1[5];
    if (v14 > 123)
    {
      v37 = v11;
      v38 = v13;
      v39 = v12;
      v40 = v15;
      v41 = v14;
      v42 = v16;
      result = (uint64_t *)sub_23835270C((uint64_t)result, (uint64_t *)&v37, (uint64_t *)&v24);
      v18 = v25;
      *(_OWORD *)v1 = v24;
      *((_OWORD *)v1 + 1) = v18;
      *((_OWORD *)v1 + 2) = v26;
      return result;
    }
    v37 = v11;
    v38 = v13;
    v39 = v12;
    v40 = v15;
    v41 = v14;
    v42 = v16;
    v22 = v11[18];
    swift_unknownObjectRetain();
    if (sub_238269C7C() != v22)
    {
      swift_unknownObjectRetain();
      sub_238261C98(v22, (uint64_t)&v24);
      swift_unknownObjectRelease_n();
      v21 = *((_QWORD *)&v24 + 1);
      v23 = v24;
      v20 = v25;
      v19 = BYTE4(v25);
      v17 = BYTE5(v25);
      sub_238263DDC(v3);
      swift_unknownObjectRelease();
      *v10 = v2;
      v10[1] = v4;
      v10[2] = v5;
      v10[3] = v7;
      v10[4] = v6;
      v10[5] = v8;
      sub_23825981C(v23, v21, v20 | (v19 << 32) | (v17 << 40));
      return (uint64_t *)sub_23825B804(v3);
    }
  }
  else
  {
    if (sub_238269C7C())
    {
      swift_unknownObjectRetain();
      sub_238261C98(0, (uint64_t)&v37);
      sub_23825B804(v3);
      sub_2383568B4(v37, v38, v39 | ((unint64_t)BYTE4(v39) << 32) | ((unint64_t)BYTE5(v39) << 40));
      return (uint64_t *)sub_23825B804(v3);
    }
    __break(1u);
  }
  result = (uint64_t *)swift_unknownObjectRelease();
  __break(1u);
  return result;
}

_WORD *sub_2383568B4(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;
  BOOL v10;
  uint8x8_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[32];
  _BYTE v16[16];
  void *v17;
  uint64_t v18;
  unsigned int v19;
  unsigned __int8 v20;
  unsigned __int8 v21;

  v4 = *v3;
  if (!*v3)
  {
    v6 = 0;
    ++v3[5];
    goto LABEL_7;
  }
  v5 = v3[4];
  if (!v5 || v5 >= 124 && (a3 & 0xFCu) > 0x7BuLL)
  {
    ++v3[5];
    v6 = *(unsigned __int8 *)(v4 + 18);
LABEL_7:
    v7 = a3 & 0xFFFFFFFFFFFFLL;
    return sub_238355DD4(a1, a2, v7, v6);
  }
  v17 = a1;
  v18 = a2;
  LOWORD(v19) = a3;
  BYTE2(v19) = BYTE2(a3);
  HIBYTE(v19) = BYTE3(a3);
  v20 = BYTE4(a3);
  v21 = BYTE5(a3);
  v9 = v3[5];
  sub_2382593B4(*(unsigned __int8 *)(v4 + 18), (uint64_t)v16);
  v10 = sub_2382A2448((uint64_t)&v17);
  sub_23826A570((uint64_t)v15, (uint64_t)v16, v11);
  swift_bridgeObjectRelease();
  v3[5] = v9 + 1;
  if (!v10)
  {
    a1 = v17;
    a2 = v18;
    v12 = v19;
    v13 = v20;
    v14 = v21;
    v3[5] = v9 + 2;
    if (*v3)
      v6 = *(unsigned __int8 *)(*v3 + 18);
    else
      v6 = 0;
    v7 = v12 | (v13 << 32) | (v14 << 40);
    return sub_238355DD4(a1, a2, v7, v6);
  }
  return (_WORD *)swift_bridgeObjectRelease();
}

uint64_t sub_2383569F8@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[5];

  v5 = *a1;
  v6 = a1[1];
  v7 = *((unsigned int *)a1 + 4) | ((unint64_t)*((unsigned __int8 *)a1 + 20) << 32) | ((unint64_t)*((unsigned __int8 *)a1 + 21) << 40);
  swift_bridgeObjectRetain();
  sub_238355FA8(v9, v5, v6, v7, a2);
  return sub_238263E74((uint64_t)v9, a3);
}

uint64_t sub_238356A78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2383569F8(*(uint64_t **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

_QWORD *sub_238356A80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _QWORD *(*a4)(_OWORD *__return_ptr)@<X3>, uint64_t a5@<X8>)
{
  _QWORD *result;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
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
  __int128 v34;
  _OWORD v35[2];
  uint64_t v36;

  result = (_QWORD *)(a1 + 40 * a2);
  v8 = result + 1;
  v7 = result[1];
  v9 = *a3 - v7;
  if (__OFSUB__(*a3, v7))
  {
    __break(1u);
    goto LABEL_11;
  }
  v11 = result + 2;
  v13 = result + 3;
  v12 = result[3];
  v15 = result + 4;
  v14 = result[4];
  v16 = result[2];
  *a3 = v9;
  v17 = a3[1];
  v18 = __OFSUB__(v17, v16);
  v19 = v17 - v16;
  if (v18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  a3[1] = v19;
  v20 = a3[2];
  v18 = __OFSUB__(v20, v12);
  v21 = v20 - v12;
  if (v18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  a3[2] = v21;
  v22 = a3[3];
  v18 = __OFSUB__(v22, v14);
  v23 = v22 - v14;
  if (v18)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  a3[3] = v23;
  result = a4(v35);
  if (__OFADD__(*a3, *v8))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v24 = *v13;
  v25 = *v15;
  v26 = *v11;
  *a3 += *v8;
  v27 = a3[1];
  v18 = __OFADD__(v27, v26);
  v28 = v27 + v26;
  if (v18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  a3[1] = v28;
  v29 = a3[2];
  v18 = __OFADD__(v29, v24);
  v30 = v29 + v24;
  if (v18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  a3[2] = v30;
  v31 = a3[3];
  v18 = __OFADD__(v31, v25);
  v32 = v31 + v25;
  if (!v18)
  {
    a3[3] = v32;
    v33 = v36;
    v34 = v35[1];
    *(_OWORD *)a5 = v35[0];
    *(_OWORD *)(a5 + 16) = v34;
    *(_QWORD *)(a5 + 32) = v33;
    return result;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_238356BB4(uint64_t a1, uint64_t a2)
{
  __int128 *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
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
  __int128 v25;
  __int128 v26;
  int v27;
  _OWORD v28[2];
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    v10 = v2[1];
    v30 = *v2;
    v31 = v10;
    v32 = *((_QWORD *)v2 + 4);
    sub_238259B30((uint64_t)v28);
    result = swift_unknownObjectRelease();
    v11 = v28[1];
    *v2 = v28[0];
    v2[1] = v11;
    *((_QWORD *)v2 + 4) = v29;
  }
  v12 = *((_QWORD *)v2 + 1);
  v13 = __OFADD__(v12, v6);
  v14 = v12 + v6;
  if (v13)
  {
    __break(1u);
    goto LABEL_11;
  }
  *((_QWORD *)v2 + 1) = v14;
  v15 = *((_QWORD *)v2 + 2);
  v13 = __OFADD__(v15, v5);
  v16 = v15 + v5;
  if (v13)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  *((_QWORD *)v2 + 2) = v16;
  v17 = *((_QWORD *)v2 + 3);
  v13 = __OFADD__(v17, v8);
  v18 = v17 + v8;
  if (v13)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  *((_QWORD *)v2 + 3) = v18;
  v19 = *((_QWORD *)v2 + 4);
  v13 = __OFADD__(v19, v7);
  v20 = v19 + v7;
  if (v13)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  *((_QWORD *)v2 + 4) = v20;
  v21 = *(_QWORD *)v2;
  swift_unknownObjectRetain();
  result = sub_238263DDC(a1);
  v22 = *(unsigned __int16 *)(v21 + 16);
  v13 = __OFSUB__(v22, a2);
  v23 = v22 - a2;
  if (v13)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v24 = v21 + 40 * a2;
  result = (uint64_t)memmove((void *)(v24 + 64), (const void *)(v24 + 24), 40 * v23);
  v26 = *(_OWORD *)a1;
  v25 = *(_OWORD *)(a1 + 16);
  *(_QWORD *)(v24 + 56) = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(v24 + 24) = v26;
  *(_OWORD *)(v24 + 40) = v25;
  v27 = *(unsigned __int16 *)(v21 + 16);
  if (v27 != 0xFFFF)
  {
    *(_WORD *)(v21 + 16) = v27 + 1;
    return swift_unknownObjectRelease();
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_238356D08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  unsigned int v6;
  unsigned __int8 *v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned int v11;
  unsigned __int8 *v12;
  unsigned int v13;
  uint64_t result;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = 24 * a2;
  if (a2 < 1)
  {
    v9 = (unsigned __int8 *)(a1 + v5 + 16);
    v8 = *v9;
    v7 = (unsigned __int8 *)(a1 + v5 + 17);
    v6 = *v7;
    v10 = (unsigned __int8 *)(a1 + v5 + 18);
    v11 = *v10;
    v12 = (unsigned __int8 *)(a1 + v5 + 19);
    v13 = *v12;
    result = sub_2382A2448(a3);
  }
  else
  {
    v7 = (unsigned __int8 *)(v5 + a1 - 7);
    v6 = *v7;
    v9 = (unsigned __int8 *)(v5 + a1 - 8);
    v8 = *v9;
    v10 = (unsigned __int8 *)(v5 + a1 - 6);
    v11 = *v10;
    v12 = (unsigned __int8 *)(v5 + a1 - 5);
    v13 = *v12;
    result = sub_2382682A0(a3);
  }
  v15 = *v9;
  v16 = *v12 - (unint64_t)v13;
  v17 = *v10 - (unint64_t)v11;
  v18 = *v7 - (unint64_t)v6;
  *(_BYTE *)a4 = result & 1;
  *(_QWORD *)(a4 + 8) = v16;
  *(_QWORD *)(a4 + 16) = v17;
  *(_QWORD *)(a4 + 24) = v18;
  *(_QWORD *)(a4 + 32) = v15 - v8;
  return result;
}

uint64_t sub_238356DE0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
  _QWORD *v5;
  uint64_t result;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  _WORD *v20;
  _OWORD v21[2];
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v5 = v4;
  result = swift_isUniquelyReferenced_nonNull();
  if ((result & 1) == 0)
  {
    v11 = v4[1];
    v23 = *v4;
    v24 = v11;
    v25 = *((_QWORD *)v4 + 4);
    sub_238259B30((uint64_t)v21);
    result = swift_unknownObjectRelease();
    v12 = v21[1];
    *v4 = v21[0];
    v4[1] = v12;
    *((_QWORD *)v4 + 4) = v22;
  }
  v13 = *((_QWORD *)v4 + 1);
  if (__OFADD__(v13, BYTE3(a3)))
  {
    __break(1u);
    goto LABEL_9;
  }
  *((_QWORD *)v4 + 1) = v13 + BYTE3(a3);
  v14 = *((_QWORD *)v4 + 2);
  if (__OFADD__(v14, BYTE2(a3)))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  *((_QWORD *)v4 + 2) = v14 + BYTE2(a3);
  v15 = *((_QWORD *)v4 + 3);
  if (__OFADD__(v15, BYTE1(a3)))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  *((_QWORD *)v4 + 3) = v15 + BYTE1(a3);
  v16 = *((_QWORD *)v4 + 4);
  v17 = __OFADD__(v16, a3);
  v18 = v16 + a3;
  if (!v17)
  {
    *((_QWORD *)v4 + 4) = v18;
    v19 = *(_QWORD *)v4;
    v20 = (_WORD *)(*v5 + 16);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    sub_2383540F8(a1, a2, ((unint64_t)BYTE2(a3) << 16) | ((unint64_t)BYTE1(a3) << 8) | ((unint64_t)BYTE3(a3) << 24) | a3 & 0xFFFF000000FFLL, a4, v20, v19 + 24);
    return swift_unknownObjectRelease();
  }
LABEL_11:
  __break(1u);
  return result;
}

BOOL _HeapNode.isRoot.getter(uint64_t a1)
{
  return a1 == 0;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.parent()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  Swift::Int v3;
  Swift::Int v4;
  CollectionsInternal::_HeapNode result;

  v2 = v0 - 1;
  if (v0 - 1 < 0)
    v2 = v0;
  v3 = v2 >> 1;
  v4 = v1 - 1;
  result.level = v4;
  result.offset = v3;
  return result;
}

BOOL _HeapNode.isMinLevel.getter(uint64_t a1, char a2)
{
  return (a2 & 1) == 0;
}

CollectionsInternal::_HeapNode_optional __swiftcall _HeapNode.grandParent()()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  BOOL v3;
  Swift::Bool v4;
  Swift::Int v5;
  Swift::Int v6;
  CollectionsInternal::_HeapNode_optional result;

  v3 = __OFSUB__(v0, 3);
  v2 = v0 - 3 < 0;
  v4 = v0 < 3;
  if (v0 >= 3)
    v5 = (unint64_t)(v0 - 3) >> 2;
  else
    v5 = 0;
  if (v2 != v3)
    v6 = 0;
  else
    v6 = v1 - 2;
  result.value.level = v6;
  result.value.offset = v5;
  result.is_nil = v4;
  return result;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.firstGrandchild()()
{
  uint64_t v0;
  uint64_t v1;
  Swift::Int v2;
  Swift::Int v3;
  CollectionsInternal::_HeapNode result;

  v2 = (4 * v0) | 3;
  v3 = v1 + 2;
  result.level = v3;
  result.offset = v2;
  return result;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.leftChild()()
{
  uint64_t v0;
  uint64_t v1;
  Swift::Int v2;
  Swift::Int v3;
  CollectionsInternal::_HeapNode result;

  v2 = (2 * v0) | 1;
  v3 = v1 + 1;
  result.level = v3;
  result.offset = v2;
  return result;
}

BOOL static _HeapNode.< infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 < a3;
}

unint64_t static _HeapNode.level(forOffset:)(unint64_t result)
{
  if (result <= 0x7FFFFFFFFFFFFFFELL)
    return __clz(result + 1) ^ 0x3F;
  __break(1u);
  return result;
}

uint64_t static _HeapNode.allNodes(onLevel:limit:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = ~(-1 << result);
  v4 = (1 << (result + 1)) - 2;
  if (v4 >= a2)
    v4 = a2 - 1;
  v5 = v3 < a2;
  if (v3 < a2)
    v6 = ~(-1 << result);
  else
    v6 = 0;
  if (v3 < a2)
    v7 = result;
  else
    v7 = 0;
  if (!v5)
    v4 = 0;
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v7;
  v8 = !v5;
  *(_QWORD *)(a3 + 16) = v4;
  *(_QWORD *)(a3 + 24) = v7;
  *(_BYTE *)(a3 + 32) = v8;
  return result;
}

BOOL static _HeapNode.isMinLevel(_:)(char a1)
{
  return (a1 & 1) == 0;
}

uint64_t ClosedRange<>._forEach(_:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);

  if (a5 >= a3)
  {
    v7 = a3;
    v8 = (uint64_t (*)(uint64_t, uint64_t))result;
    do
      result = v8(v7++, a4);
    while (v7 <= a5);
  }
  return result;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.init(offset:)(Swift::Int offset)
{
  Swift::Int v1;
  CollectionsInternal::_HeapNode result;

  if ((unint64_t)offset > 0x7FFFFFFFFFFFFFFELL)
    __break(1u);
  else
    v1 = __clz(offset + 1) ^ 0x3F;
  result.level = v1;
  result.offset = offset;
  return result;
}

uint64_t static _HeapNode.root.getter()
{
  return 0;
}

uint64_t static _HeapNode.leftMax.getter()
{
  return 1;
}

uint64_t static _HeapNode.rightMax.getter()
{
  return 2;
}

uint64_t _HeapNode.offset.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*_HeapNode.offset.modify())(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t _HeapNode.level.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t _HeapNode.level.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*_HeapNode.level.modify())(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

BOOL static _HeapNode.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

uint64_t _HeapNode.description.getter()
{
  sub_23835B5B0();
  swift_bridgeObjectRelease();
  sub_23835B880();
  sub_23835AE90();
  swift_bridgeObjectRelease();
  sub_23835AE90();
  sub_23835B880();
  sub_23835AE90();
  swift_bridgeObjectRelease();
  sub_23835AE90();
  return 0x3A74657366666F28;
}

uint64_t sub_238357204()
{
  return _HeapNode.description.getter();
}

uint64_t static _HeapNode.firstNode(onLevel:)(char a1)
{
  return ~(-1 << a1);
}

uint64_t static _HeapNode.lastNode(onLevel:)(char a1)
{
  return (1 << (a1 + 1)) - 2;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.rightChild()()
{
  uint64_t v0;
  uint64_t v1;
  Swift::Int v2;
  Swift::Int v3;
  CollectionsInternal::_HeapNode result;

  v2 = 2 * v0 + 2;
  v3 = v1 + 1;
  result.level = v3;
  result.offset = v2;
  return result;
}

CollectionsInternal::_HeapNode __swiftcall _HeapNode.lastGrandchild()()
{
  uint64_t v0;
  uint64_t v1;
  Swift::Int v2;
  Swift::Int v3;
  CollectionsInternal::_HeapNode result;

  v2 = 4 * v0 + 6;
  v3 = v1 + 2;
  result.level = v3;
  result.offset = v2;
  return result;
}

unint64_t sub_23835725C()
{
  unint64_t result;

  result = qword_2568F2298;
  if (!qword_2568F2298)
  {
    result = MEMORY[0x23B831670](&protocol conformance descriptor for _HeapNode, &type metadata for _HeapNode);
    atomic_store(result, (unint64_t *)&qword_2568F2298);
  }
  return result;
}

ValueMetadata *type metadata accessor for _HeapNode()
{
  return &type metadata for _HeapNode;
}

uint64_t OrderedSet<>.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;
  uint64_t v12;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23835BAB4();
  v12 = a3;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
  v7 = sub_23835B6E8();
  v9 = a5;
  MEMORY[0x23B831670](MEMORY[0x24BEE2A30], v7, &v9);
  sub_23835B94C();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

uint64_t sub_238357384(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return OrderedSet<>.encode(to:)(a1, a2, *(_QWORD *)(v3 + 8), *(_QWORD *)(a2 + 16), *(_QWORD *)(a3 - 8));
}

uint64_t OrderedSet<>.init(from:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  uint64_t v32;
  _QWORD v33[3];
  uint64_t v34;
  uint64_t v35;

  v29 = a3;
  v30 = a2;
  v7 = sub_23835B5F8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23835BA90();
  if (v4)
    goto LABEL_8;
  v26 = v10;
  v27 = v8;
  v28 = v7;
  __swift_project_boxed_opaque_existential_1(v33, v34);
  v12 = sub_23835B6E8();
  v35 = v29;
  MEMORY[0x23B831670](MEMORY[0x24BEE2A50], v12, &v35);
  sub_23835B940();
  v13 = v31[0];
  v32 = v31[0];
  v14 = sub_2382838F8();
  v15 = (uint64_t (*)(char *, uint64_t, uint64_t))MEMORY[0x23B831670](MEMORY[0x24BEE2A58], v12);
  v16 = static _HashTable.create<A>(untilFirstDuplicateIn:scale:reservedScale:)((uint64_t)v31, (uint64_t)&v32, 0, 1, v14, v12, v15, a4);
  v17 = v31[0];
  if (v31[0] != *(_QWORD *)(v13 + 16))
  {
    swift_release();
    __swift_project_boxed_opaque_existential_1(v33, v34);
    sub_23835B88C();
    v31[0] = 0;
    v31[1] = 0xE000000000000000;
    sub_23835B5B0();
    sub_23835AE90();
    v32 = v17;
    sub_23835B904();
    sub_23835AE90();
    v19 = v26;
    sub_23835B5EC();
    v11 = sub_23835B604();
    swift_allocError();
    v21 = v20;
    v22 = v27;
    v23 = v28;
    (*(void (**)(uint64_t, char *, uint64_t))(v27 + 16))(v20, v19, v28);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v21, *MEMORY[0x24BEE26D8], v11);
    swift_willThrow();
    swift_release();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
LABEL_8:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v11;
  }
  if (_s19CollectionsInternal4HeapV5countSivg_0() < 16)
  {
    v18 = 0;
  }
  else
  {
    swift_retain();
    v18 = v16;
  }
  v11 = OrderedSet.init(_uniqueElements:_:)(v13, v18);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v11;
}

uint64_t sub_2383576C4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v7;

  result = OrderedSet<>.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a3 - 8), *(_QWORD *)(a2 + 24));
  if (!v4)
  {
    *a4 = result;
    a4[1] = v7;
  }
  return result;
}

uint64_t _HashTable.Header._description.getter()
{
  sub_23835B5B0();
  swift_bridgeObjectRelease();
  sub_23835B880();
  sub_23835AE90();
  swift_bridgeObjectRelease();
  sub_23835AE90();
  sub_23835B880();
  sub_23835AE90();
  swift_bridgeObjectRelease();
  sub_23835AE90();
  sub_23835B880();
  sub_23835AE90();
  swift_bridgeObjectRelease();
  sub_23835AE90();
  sub_23826C4A4();
  sub_23835AF50();
  sub_23835AE90();
  swift_bridgeObjectRelease();
  sub_23835AE90();
  return 0x203A656C61637328;
}

unint64_t _HashTable.Header.description.getter()
{
  sub_23835B5B0();
  swift_bridgeObjectRelease();
  _HashTable.Header._description.getter();
  sub_23835AE90();
  swift_bridgeObjectRelease();
  return 0xD000000000000011;
}

unint64_t sub_238357924()
{
  return _HashTable.Header.description.getter();
}

uint64_t sub_23835792C(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t result;

  sub_23835B5B0();
  sub_23835AE90();
  _HashTable.Header._description.getter();
  sub_23835AE90();
  swift_bridgeObjectRelease();
  sub_23835AE90();
  sub_2382BA0D8(a3, a4);
  sub_23835B100();
  result = 0;
  if (1 << *a3 <= 127)
  {
    sub_23835AE90();
    sub_2382BA16C(a3, a4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568F22A0);
    sub_238357C68();
    sub_23835AC5C();
    swift_bridgeObjectRelease();
    sub_23835AE90();
    swift_bridgeObjectRelease();
    return 0;
  }
  return result;
}

uint64_t sub_238357AA0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v3;
  uint64_t result;

  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    v3 = 0xE100000000000000;
    result = 95;
  }
  else
  {
    result = sub_23835B880();
  }
  *a2 = result;
  a2[1] = v3;
  return result;
}

uint64_t _HashTable.UnsafeHandle.description.getter(_QWORD *a1, uint64_t a2)
{
  return sub_23835792C(0xD000000000000017, 0x80000002383638A0, a1, a2);
}

uint64_t sub_238357B20()
{
  uint64_t v0;

  return sub_23835792C(0xD000000000000017, 0x80000002383638A0, *(_QWORD **)v0, *(_QWORD *)(v0 + 8));
}

uint64_t _HashTable.description.getter(uint64_t a1)
{
  return sub_23835792C(0x626154687361485FLL, 0xEA0000000000656CLL, (_QWORD *)(a1 + 16), a1 + 32);
}

uint64_t sub_238357B64()
{
  uint64_t v0;

  return sub_23835792C(0x626154687361485FLL, 0xEA0000000000656CLL, (_QWORD *)(*(_QWORD *)v0 + 16), *(_QWORD *)v0 + 32);
}

uint64_t _HashTable.Storage.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_retain();
  v1 = sub_23835792C(0xD000000000000012, 0x80000002383638C0, (_QWORD *)(v0 + 16), v0 + 32);
  swift_release();
  return v1;
}

uint64_t sub_238357BF8()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *v0;
  v2 = (_QWORD *)(*v0 + 16);
  swift_retain();
  v3 = sub_23835792C(0xD000000000000012, 0x80000002383638C0, v2, v1 + 32);
  swift_release();
  return v3;
}

unint64_t sub_238357C68()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2568F22A8;
  if (!qword_2568F22A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568F22A0);
    v2 = sub_238357CCC();
    result = MEMORY[0x23B831670](MEMORY[0x24BEE2B38], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2568F22A8);
  }
  return result;
}

unint64_t sub_238357CCC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568F22B0;
  if (!qword_2568F22B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568F22B8);
    result = MEMORY[0x23B831670](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2568F22B0);
  }
  return result;
}

uint64_t TreeSet.isSuperset(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _HashNode.isSubset<A>(_:of:)(0, a4, a5, a1, a2, a7, MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE4AE0] + 8, a8) & 1;
}

uint64_t TreeSet.isSuperset<A>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _HashNode.isSubset<A>(_:of:)(0, a4, a5, a1, a2, a7, a8, MEMORY[0x24BEE4AE0] + 8, a9);
}

uint64_t TreeSet.isSuperset<A>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v25;
  uint64_t v26[4];

  v16 = *(_QWORD *)(a6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for TreeSet(0, v20, v21, v19);
  if (v22 == a6)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, a6);
    swift_dynamicCast();
    v23 = _HashNode.isSubset<A>(_:of:)(0, a2, a3, v26[0], v26[1], a5, MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE4AE0] + 8, a7);
    swift_release();
  }
  else
  {
    MEMORY[0x24BDAC7A8](v22);
    v26[-8] = a5;
    v26[-7] = a6;
    v26[-6] = a7;
    v26[-5] = a8;
    v26[-4] = a2;
    v26[-3] = a3;
    v25 = a4;
    v23 = sub_23835AFC8();
  }
  return v23 & 1;
}

void TreeDictionary.mapValues<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[8];

  v14[2] = a6;
  v14[3] = a7;
  v14[4] = a8;
  v14[5] = a9;
  v14[6] = a1;
  v14[7] = a2;
  _HashNode.mapValues<A>(_:)((void (*)(char *, char *))sub_2383580A0, (uint64_t)v14, a3, a4, a6, a7, a8, a9);
  if (!v9)
    TreeDictionary.init(_new:)(v12, v13, a6, a8, a9);
}

uint64_t sub_238357F90(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v16;
  void (*v17)(char *);

  v17 = a3;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v11 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v13 = (char *)&v16 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 16))((char *)&v16 - v12, a1, a5);
  v14 = &v13[*(int *)(TupleTypeMetadata2 + 48)];
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 16))(v14, a2, a6);
  v17(v14);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, TupleTypeMetadata2);
}

uint64_t sub_2383580A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_238357F90(a1, a2, *(void (**)(char *))(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t TreeDictionary.compactMapValues<A>(_:)(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v28 = a4;
  v29 = a7;
  v27 = a3;
  v13 = type metadata accessor for _HashNode.Builder(0, a6, a8, a9);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v26 - v18;
  v20 = v30;
  result = _HashNode.compactMapValues<A>(_:_:)(0, a1, a2, v27, v28, a6, v29, a8, (uint64_t)&v26 - v18, a9);
  if (!v20)
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
    sub_2383058C8(v13);
    v23 = v22;
    v25 = v24;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    return TreeDictionary.init(_new:)(v23, v25, a6, a8, a9);
  }
  return result;
}

uint64_t _s6_ChunkVwca(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_BYTE *)(a1 + 19) = *(_BYTE *)(a2 + 19);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_BYTE *)(a1 + 21) = *(_BYTE *)(a2 + 21);
  return a1;
}

uint64_t _s6_ChunkVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_WORD *)(a1 + 20) = *(_WORD *)(a2 + 20);
  return a1;
}

unint64_t sub_2383582CC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  char **v4;
  char *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t result;

  v9 = *v4;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v4 = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v9 = sub_23826C260((uint64_t)v9);
    *v4 = v9;
  }
  result = sub_238358598(a1, a2, a3, a4);
  *v4 = v9;
  return result;
}

unint64_t sub_238358378(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  char v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3 + a2;
  if (__CFADD__(a3, a2))
  {
    __break(1u);
  }
  else
  {
    v5 = a3 >> 6;
    v6 = a3 & 0x3F;
    v7 = v4 >> 6;
    v8 = v4 > 0x3F;
    v9 = v4 & 0x3F;
    v10 = v8 & (v9 == 0);
    v11 = 64;
    if (!(_DWORD)v10)
      v11 = v9;
    v12 = v7 - v10;
    v13 = *v3;
    if (v5 == v12)
    {
      v14 = -1 << v11;
      if ((v10 & 1) != 0)
        v15 = -1;
      else
        v15 = ~v14;
      *(_QWORD *)(v13 + 8 * v5) = *(_QWORD *)(v13 + 8 * v5) & (v15 ^ (-1 << v6)) | (result << v6);
    }
    else
    {
      *(_QWORD *)(v13 + 8 * v5) = *(_QWORD *)(v13 + 8 * v5) & ~(-1 << v6) | (result << v6);
      v16 = -1 << v11;
      if ((v10 & 1) != 0)
        v16 = 0;
      *(_QWORD *)(v13 + 8 * v12) = *(_QWORD *)(v13 + 8 * v12) & v16 | (result >> -(char)a3);
    }
  }
  return result;
}

unint64_t sub_23835843C(unint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  BOOL v19;
  unint64_t v20;
  unint64_t v21;
  char v22;

  v6 = a2 - result;
  if (a2 == result)
    return result;
  v7 = a5;
  v10 = result;
  result = sub_238358798(a5, result, a2, v5, a3);
  v11 = a2 | v10;
  if ((result & 1) != 0)
  {
    if (((v11 | v7) & 0x8000000000000000) == 0)
    {
      if (a2 <= v10)
        return result;
      v12 = a2 >> 6;
      v13 = a2 & 0x3F;
      while (1)
      {
        v14 = v10 >> 6;
        v15 = v10 & 0x3F;
        if (v10 >> 6 == v12)
        {
          v16 = v13 - v15;
          if (v13 < v15)
            goto LABEL_23;
          v17 = *(_QWORD *)(a3 + 8 * v12) & ~(-1 << a2);
          v10 = a2;
        }
        else
        {
          v16 = 64 - v15;
          v10 += 64 - v15;
          v17 = *(_QWORD *)(a3 + 8 * v14);
        }
        result = sub_238358378(v17 >> v15, v16, v7);
        v18 = __CFADD__(v7, v16);
        v7 += v16;
        if (v18)
          break;
        if (v10 >= a2)
          return result;
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
    }
    __break(1u);
    goto LABEL_25;
  }
  if ((v11 & 0x8000000000000000) != 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v19 = __OFADD__(v7, v6);
  v20 = v7 + v6;
  if (v19)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if ((v20 & 0x8000000000000000) != 0)
  {
LABEL_27:
    __break(1u);
    return result;
  }
  while (1)
  {
    result = sub_2382A6E94();
    if ((v22 & 1) != 0)
      return result;
    v18 = v20 >= v21;
    v20 -= v21;
    if (!v18)
      goto LABEL_22;
    sub_238358378(result, v21, v20);
  }
}

unint64_t sub_238358598(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  unint64_t result;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = a3;
  v7 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  result = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v14 = (char *)&v23 - v13;
  if ((a2 & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return result;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a4);
  sub_23835AF8C();
  if ((a2 & 0x3F) == 0)
    goto LABEL_6;
  swift_getAssociatedConformanceWitness();
  v15 = sub_2382A6F48(64 - (a2 & 0x3F));
  v17 = v16;
  sub_238358378(v15, v16, a2);
  v18 = __CFADD__(a2, v17);
  a2 += v17;
  if (v18)
  {
    __break(1u);
LABEL_6:
    swift_getAssociatedConformanceWitness();
  }
  v19 = sub_2382A6F48(64);
  if (v20)
  {
    v21 = v20;
    while (1)
    {
      result = sub_238358378(v19, v21, a2);
      v18 = __CFADD__(a2, v21);
      a2 += v21;
      if (v18)
        break;
      v19 = sub_2382A6F48(64);
      v21 = v22;
      if (!v22)
        goto LABEL_11;
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_11:
  result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, AssociatedTypeWitness);
  if (v24 < 0 || a2 != v24)
    goto LABEL_16;
  return result;
}

unint64_t sub_238358798(unint64_t result, unint64_t a2, unint64_t a3, _QWORD *a4, uint64_t a5)
{
  _BOOL8 v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  if (((a2 | result | a3) & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v5 = (a3 & 0x3F) == 0 && a3 > 0x3F;
    v6 = *a4 + 8 * (result >> 6);
    v7 = a5 + 8 * (a2 >> 6);
    v8 = 1;
    if (v6 >= v7)
    {
      v9 = a5 + 8 * ((a3 >> 6) - v5);
      if (v9 >= v6)
      {
        if ((result & 0x3F) < (a2 & 0x3F) && v6 == v7)
          return 1;
        LODWORD(v8) = ((a3 & 0x3F) <= (result & 0x3F)) ^ v5;
        if (v6 == v9)
          return v8;
        else
          return 0;
      }
    }
    return v8;
  }
  return result;
}

uint64_t _Hash.init<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_238358A4C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

BOOL static _Hash.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _Hash.subscript.getter(char a1, unint64_t a2)
{
  return (a2 >> a1) & 0x1F;
}

BOOL _Hash.isEqual(to:upTo:)(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return a2 < 0x40u || a3 == a1;
}

uint64_t _Hash.description.getter()
{
  uint64_t result;

  sub_23826C710();
  sub_23835AF50();
  result = sub_23835AE24();
  if (__OFSUB__(13, result))
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x23B830878](48, 0xE100000000000000, (13 - result) & ~((13 - result) >> 63));
    swift_bridgeObjectRetain();
    sub_23835AE90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568F0E58);
    sub_238296FE4();
    return sub_23835AF68();
  }
  return result;
}

uint64_t static _Hash.emptyPath.getter()
{
  return 0;
}

uint64_t static _Hash.bitWidth.getter()
{
  return 64;
}

uint64_t _Hash.value.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*_Hash.value.modify())(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t sub_2383589A0()
{
  return _Hash.description.getter();
}

uint64_t _Hash.subscript.setter(uint64_t result, char a2)
{
  unint64_t *v2;

  *v2 = *v2 & ((-31 << a2) - 1) | ((unint64_t)result << a2);
  return result;
}

uint64_t (*_Hash.subscript.modify(uint64_t a1, char a2))(uint64_t result)
{
  _QWORD *v2;

  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 9) = a2;
  *(_BYTE *)(a1 + 8) = (*v2 >> a2) & 0x1F;
  return sub_2383589FC;
}

uint64_t sub_2383589FC(uint64_t result)
{
  **(_QWORD **)result = ((-31 << *(_BYTE *)(result + 9)) - 1) & **(_QWORD **)result | ((unint64_t)*(unsigned __int8 *)(result + 8) << *(_BYTE *)(result + 9));
  return result;
}

unint64_t _Hash.appending(_:at:)(unsigned __int8 a1, char a2, uint64_t a3)
{
  return ((-31 << a2) - 1) & a3 | ((unint64_t)a1 << a2);
}

uint64_t sub_238358A4C()
{
  return sub_23835ABF0();
}

ValueMetadata *type metadata accessor for _Hash()
{
  return &type metadata for _Hash;
}

uint64_t static Deque._isConsistencyCheckingEnabled.getter()
{
  return 0;
}

uint64_t Deque._capacity.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  sub_23827FD60((uint64_t)sub_23826B2E4, 0, a1, (uint64_t)&type metadata for _DequeBufferHeader, a2, MEMORY[0x24BEE4078], MEMORY[0x24BEE1768], MEMORY[0x24BEE40A8], v3);
  return v4;
}

uint64_t Deque._startSlot.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  sub_23827FD60((uint64_t)sub_23827FEC8, 0, a1, (uint64_t)&type metadata for _DequeBufferHeader, a2, MEMORY[0x24BEE4078], (uint64_t)&type metadata for _DequeSlot, MEMORY[0x24BEE40A8], v3);
  return v4;
}

uint64_t Deque.init<A>(_capacity:startSlot:contents:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  _BYTE v23[16];

  v12 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(&v23[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)], v14, v15);
  result = sub_23835B0DC();
  if ((a2 | a1) < 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v17 = result;
  if (a2 >= a1 && a2 | a1)
    goto LABEL_10;
  result = _s19CollectionsInternal4HeapV5countSivg_0();
  if (result > a1)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  v20 = type metadata accessor for _DequeBuffer(0, a4, v18, v19);
  MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)&v23[-48] = a5;
  *(_QWORD *)&v23[-40] = a6;
  *(_QWORD *)&v23[-32] = a1;
  *(_QWORD *)&v23[-24] = v17;
  *(_QWORD *)&v23[-16] = a2;
  sub_23835B610();
  swift_retain();
  v21 = Deque._Storage.init(_:)();
  v22 = _s19CollectionsInternal4HeapV5countSivg_0();
  if (v22 >= 1)
  {
    MEMORY[0x24BDAC7A8](v22);
    *(_QWORD *)&v23[-32] = a4;
    *(_QWORD *)&v23[-24] = a5;
    *(_QWORD *)&v23[-16] = a6;
    *(_QWORD *)&v23[-8] = v21;
    sub_23835B694();
  }
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a3, a5);
  return Deque.init(_storage:)(v21, a4);
}

uint64_t sub_238358D3C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 48);
  result = _s19CollectionsInternal4HeapV5countSivg_0();
  *a1 = v3;
  a1[1] = result;
  a1[2] = v4;
  return result;
}

uint64_t sub_238358D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;
  uint64_t (*v12)(_QWORD *, uint64_t);
  char *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[8];

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a1;
  v19 = a2;
  v11 = a4;
  v12 = sub_23835904C;
  v13 = &v14;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568F0938);
  return sub_23827FF04((uint64_t)sub_2382DAA90, (uint64_t)v10, a3, (uint64_t)&type metadata for _DequeBufferHeader, a4, v8, MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE3F20], (uint64_t)v20);
}

uint64_t sub_238358E44(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_238358D98(a1, a2, v2[5], v2[2], v2[3], v2[4]);
}

uint64_t sub_238358E60(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  __int128 v21;
  _BYTE v22[16];
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30[4];
  uint64_t v31;

  Deque._UnsafeHandle.segments()(a1, (uint64_t)&v28);
  v31 = sub_23835B388();
  v9 = v8;
  v10 = sub_23835AD7C();
  v11 = sub_23835B334();
  v12 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 32);
  v12(v30, &v29, v11);
  v12((uint64_t *)&v24, v30, v11);
  v23 = a5;
  v13 = sub_23835B3A0();
  sub_23828E824((void (*)(char *, char *))sub_2382F471C, (uint64_t)v22, MEMORY[0x24BEE4078], v13, v14, (uint64_t)&v26);
  *((_QWORD *)&v21 + 1) = a4;
  v20 = v26;
  *(_QWORD *)&v21 = a3;
  v15 = v27;
  *(_QWORD *)&v24 = a3;
  *((_QWORD *)&v24 + 1) = a4;
  v16 = *((_QWORD *)&v26 + 1);
  MEMORY[0x23B831670](MEMORY[0x24BEE09E8], v10);
  sub_23835B220();
  v24 = v26;
  v25 = v27;
  v17 = sub_23835B9C4();
  v18 = MEMORY[0x23B831670](MEMORY[0x24BEE4238], v17);
  result = UnsafeMutableBufferPointer.initialize<A>(fromContentsOf:)((uint64_t)&v24, v31, v9, a5, v17, v18);
  if ((v15 & 1) == 0)
  {
    if (v16)
    {
      v24 = v21;
      sub_23835B238();
      v24 = v26;
      v25 = v27;
      return UnsafeMutableBufferPointer.initialize<A>(fromContentsOf:)((uint64_t)&v24, v20, v16, a5, v17, v18);
    }
  }
  return result;
}

uint64_t sub_23835904C(_QWORD *a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_238358E60(a1, a2, v2[5], v2[6], v2[2]);
}

unint64_t UInt._reversed.getter(unint64_t a1)
{
  return __rbit64(a1);
}

char *BitArray.init(arrayLiteral:)(unint64_t a1)
{
  char *v3;

  v3 = sub_23826C3AC(0, (unint64_t)(*(_QWORD *)(a1 + 16) + 63) >> 6, 0, MEMORY[0x24BEE4AF8]);
  sub_238359154(a1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_2383590E0@<X0>(unint64_t a1@<X0>, char **a2@<X8>)
{
  uint64_t result;
  char *v5;

  v5 = sub_23826C3AC(0, (unint64_t)(*(_QWORD *)(a1 + 16) + 63) >> 6, 0, MEMORY[0x24BEE4AF8]);
  sub_238359154(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v5;
  a2[1] = 0;
  return result;
}

unint64_t sub_238359154(unint64_t result)
{
  char **v1;
  char *v2;
  char **v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  char **v26;
  uint64_t v27;

  v3 = v1;
  v4 = result;
  v5 = (unint64_t)v1[1];
  v6 = v5 & 0x3F;
  if ((v5 & 0x3F) != 0)
  {
    v7 = 0;
    v8 = 0;
    v9 = (char *)(64 - v6);
    v10 = *(_QWORD *)(result + 16);
    v11 = v6 ^ 0x3F;
    if (v10 >= v11)
      v12 = (char *)v11;
    else
      v12 = *(char **)(result + 16);
    while ((char *)v10 != v7)
    {
      v13 = v7 + 1;
      if (v7[result + 32])
        v14 = 1 << (char)v7;
      else
        v14 = 0;
      v8 |= v14;
      v7 = v13;
      if (v9 == v13)
      {
        v12 = v9;
        goto LABEL_13;
      }
    }
    if (!v12)
      return result;
LABEL_13:
    v15 = (unint64_t)&v12[v5];
    if (__CFADD__(v5, v12))
    {
LABEL_47:
      __break(1u);
    }
    else
    {
      v1[1] = (char *)v15;
      v2 = *v1;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v1 = v2;
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
LABEL_15:
        result = sub_238358378(v8, (uint64_t)v12, v5);
        *v3 = v2;
        goto LABEL_16;
      }
    }
    v2 = sub_23826C260((uint64_t)v2);
    *v3 = v2;
    goto LABEL_15;
  }
  v12 = 0;
  v15 = (unint64_t)v1[1];
LABEL_16:
  v8 = 0;
  v5 = 0;
  v2 = *(char **)(v4 + 16);
  v17 = v2 - v12;
  if (v2 < v12)
    v17 = 0;
  while (v12 - v2 + v8)
  {
    if (v17 == v8)
      goto LABEL_46;
    v18 = v8 + 1;
    if (v12[v4 + 32 + v8])
      v19 = 1 << v8;
    else
      v19 = 0;
    v5 |= v19;
    ++v8;
    if (v18 == 64)
    {
      v20 = v12 + 64;
      goto LABEL_26;
    }
  }
  v20 = *(char **)(v4 + 16);
  if (!v8)
    return result;
LABEL_26:
  v12 = *v3;
  v26 = v3;
  v27 = v4 + 32;
  v4 = 1;
LABEL_28:
  while (2)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_23826C3AC(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v22 = *((_QWORD *)v12 + 2);
    v21 = *((_QWORD *)v12 + 3);
    if (v22 >= v21 >> 1)
      v12 = sub_23826C3AC((char *)(v21 > 1), v22 + 1, 1, v12);
    *((_QWORD *)v12 + 2) = v22 + 1;
    *(_QWORD *)&v12[8 * v22 + 32] = 0;
    v3 = (char **)(v15 + v8);
    if (__CFADD__(v15, v8))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    result = sub_238358378(v5, v8, v15);
    v8 = 0;
    v5 = 0;
    v23 = (char *)(v2 - v20);
    if (v2 < v20)
      v23 = 0;
    while (v20 - v2 + v8)
    {
      if (v23 == (char *)v8)
      {
        __break(1u);
        goto LABEL_45;
      }
      v24 = v8 + 1;
      if (v20[v27 + v8])
        v25 = 1 << v8;
      else
        v25 = 0;
      v5 |= v25;
      ++v8;
      if (v24 == 64)
      {
        v20 += 64;
        v15 = (unint64_t)v3;
        goto LABEL_28;
      }
    }
    v20 = v2;
    v15 = (unint64_t)v3;
    if (v8)
      continue;
    break;
  }
  *v26 = v12;
  v26[1] = (char *)v3;
  return result;
}

unint64_t UInt._lastSetBit.getter(unint64_t a1)
{
  return __clz(__rbit64(a1)) & 0x3F;
}

unint64_t UInt._firstSetBit.getter(unint64_t a1)
{
  unint64_t v1;

  v1 = __clz(a1) ^ 0x3F;
  if (a1)
    return v1;
  else
    return 0;
}

uint64_t _HashNode.insertChild(_:_:)(uint64_t a1, uint64_t a2, char a3, _QWORD *a4)
{
  sub_238359B44(a1, a2, a3, a4);
  return swift_release();
}

uint64_t _HashNode.UnsafeHandle._makeRoomForNewItem(at:_:)(unsigned int a1, char a2, int *a3, uint64_t a4)
{
  int v8;
  uint8x8_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;

  v8 = ~a2;
  v9 = (uint8x8_t)vcnt_s8((int8x8_t)*a3);
  v9.i16[0] = vaddlv_u8(v9);
  if (*a3 == a3[1])
    v10 = *a3;
  else
    v10 = v9.u32[0];
  v11 = *(_QWORD *)(*(_QWORD *)(swift_getTupleTypeMetadata2() - 8) + 72);
  v12 = a3[2];
  a3[3] -= v11;
  v13 = a4 + v12 + v11 * ~v10;
  v14 = v10 - a1;
  sub_23835B31C();
  v15 = *a3;
  if (v8)
  {
    v16 = v15 | (1 << a2);
  }
  else
  {
    v16 = v15 + 1;
    a3[1] = v16;
  }
  *a3 = v16;
  return v13 + v14 * v11;
}

uint64_t _HashNode.insertItem(_:at:)(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t TupleTypeMetadata2;
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
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int8x8_t v29;
  uint8x8_t v30;
  _BYTE *v31;
  void (*v32)(_BYTE *, _BYTE *, uint64_t);
  void (*v33)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v34;
  _BYTE *v35;
  _BYTE *v36;
  _BYTE *v37;
  uint64_t v38;
  _BYTE *v39;
  _BYTE *v40;
  uint64_t v41;
  _BYTE *v42;
  void (*v43)(_BYTE *, uint64_t);
  _BYTE v45[4];
  unsigned int v46;
  int *v47;
  uint64_t v48;
  _BYTE *v49;
  _BYTE *v50;
  _BYTE *v51;
  _BYTE *v52;
  uint64_t v53;
  _BYTE *v54;
  void (*v55)(_BYTE *, uint64_t, uint64_t);
  void (*v56)(_BYTE *, uint64_t, uint64_t);
  uint64_t v57;

  v5 = v4;
  v57 = a3;
  v48 = a2;
  v8 = a4[2];
  v9 = a4[3];
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v53 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v11 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v52 = &v45[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = MEMORY[0x24BDAC7A8](v11);
  v51 = &v45[-v14];
  v15 = MEMORY[0x24BDAC7A8](v13);
  v50 = &v45[-v16];
  v17 = MEMORY[0x24BDAC7A8](v15);
  v54 = &v45[-v18];
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = &v45[-v20];
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = &v45[-v23];
  v25 = &v45[*(int *)(v22 + 48) - v23];
  v26 = *(_QWORD *)(v8 - 8);
  v56 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v26 + 32);
  v49 = &v45[-v23];
  v56(&v45[-v23], a1, v8);
  v27 = *(_QWORD *)(v9 - 8);
  v55 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v27 + 32);
  v55(v25, v48, v9);
  v47 = (int *)nullsub_1(*v5 + 16, *v5 + 32, v8, v9, a4[4]);
  v48 = v28;
  v29.i32[0] = *v47 & ~(-1 << v57);
  v30 = (uint8x8_t)vcnt_s8(v29);
  v30.i16[0] = vaddlv_u8(v30);
  v46 = v30.i32[0];
  v31 = &v21[*(int *)(TupleTypeMetadata2 + 48)];
  v32 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v26 + 16);
  v32(v21, v24, v8);
  v33 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v27 + 16);
  v33(v31, v25, v9);
  v34 = v54;
  v35 = &v54[*(int *)(TupleTypeMetadata2 + 48)];
  v56(v54, (uint64_t)v21, v8);
  v55(v35, (uint64_t)v31, v9);
  ++v5[1];
  v36 = v50;
  v37 = &v50[*(int *)(TupleTypeMetadata2 + 48)];
  v32(v50, v34, v8);
  v33(v37, v35, v9);
  v38 = _HashNode.UnsafeHandle._makeRoomForNewItem(at:_:)(v46, v57, v47, v48);
  v39 = v51;
  v40 = &v51[*(int *)(TupleTypeMetadata2 + 48)];
  v32(v51, v36, v8);
  v33(v40, v37, v9);
  v41 = (uint64_t)v52;
  v42 = &v52[*(int *)(TupleTypeMetadata2 + 48)];
  v56(v52, (uint64_t)v39, v8);
  v55(v42, (uint64_t)v40, v9);
  sub_2382F7024(v41, v38, TupleTypeMetadata2);
  v43 = *(void (**)(_BYTE *, uint64_t))(v53 + 8);
  v43(v54, TupleTypeMetadata2);
  v43(v36, TupleTypeMetadata2);
  return ((uint64_t (*)(_BYTE *, uint64_t))v43)(v49, TupleTypeMetadata2);
}

uint64_t _HashNode.UnsafeHandle._insertChild(_:at:)(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  *(_DWORD *)(a4 + 12) -= 16;
  v10 = a5 + 16 * a3;
  v11 = type metadata accessor for _HashNode(0, a6, a7, a8);
  sub_23835B31C();
  v13[0] = a1;
  v13[1] = a2;
  return sub_2382F7024((uint64_t)v13, v10, v11);
}

uint64_t _HashNode.insertItem(_:at:_:)(uint64_t a1, uint64_t a2, unsigned int a3, int a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t TupleTypeMetadata2;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, char *, uint64_t);
  void (*v26)(char *, char *, uint64_t);
  int *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, uint64_t);
  void (*v35)(char *, uint64_t, uint64_t);
  void (*v36)(char *, uint64_t, uint64_t);
  char *v37;
  uint64_t v38;
  char *v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;

  v40 = a3;
  LODWORD(v41) = a4;
  v38 = a5;
  v8 = *(_QWORD *)(a5 + 16);
  v9 = *(_QWORD *)(a5 + 24);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v42 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v11 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v39 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v37 = (char *)&v35 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v35 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v35 - v19;
  v21 = (char *)&v35 + *(int *)(v18 + 48) - v19;
  v22 = *(_QWORD *)(v8 - 8);
  v36 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 32);
  v36((char *)&v35 - v19, a1, v8);
  v23 = *(_QWORD *)(v9 - 8);
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 32);
  v35(v21, a2, v9);
  ++v5[1];
  v24 = &v17[*(int *)(TupleTypeMetadata2 + 48)];
  v25 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  v25(v17, v20, v8);
  v26 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
  v26(v24, v21, v9);
  v27 = (int *)nullsub_1(*v5 + 16, *v5 + 32, v8, v9, *(_QWORD *)(v38 + 32));
  v41 = _HashNode.UnsafeHandle._makeRoomForNewItem(at:_:)(v40, v41, v27, v28);
  v29 = v37;
  v30 = &v37[*(int *)(TupleTypeMetadata2 + 48)];
  v25(v37, v17, v8);
  v26(v30, v24, v9);
  v31 = (uint64_t)v39;
  v32 = &v39[*(int *)(TupleTypeMetadata2 + 48)];
  v36(v39, (uint64_t)v29, v8);
  v35(v32, (uint64_t)v30, v9);
  sub_2382F7024(v31, v41, TupleTypeMetadata2);
  v33 = *(void (**)(char *, uint64_t))(v42 + 8);
  v33(v20, TupleTypeMetadata2);
  return ((uint64_t (*)(char *, uint64_t))v33)(v17, TupleTypeMetadata2);
}

uint64_t sub_238359B44(uint64_t a1, uint64_t a2, char a3, _QWORD *a4)
{
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int8x8_t v15;
  uint8x8_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t result;

  v7 = *v4;
  v4[1] += a2;
  v8 = a4[2];
  v9 = a4[3];
  v10 = a4[4];
  v11 = nullsub_1(v7 + 16, v7 + 32, v8, v9, v10);
  v13 = v12;
  v14 = 1 << a3;
  v15.i32[0] = *(_DWORD *)(v11 + 4) & ((1 << a3) - 1);
  v16 = (uint8x8_t)vcnt_s8(v15);
  v16.i16[0] = vaddlv_u8(v16);
  v17 = v16.i32[0];
  v18 = swift_retain();
  result = _HashNode.UnsafeHandle._insertChild(_:at:)(v18, a2, v17, v11, v13, v8, v9, v10);
  *(_DWORD *)(v11 + 4) |= v14;
  return result;
}

_BYTE *BitSet.formIntersection(_:)(int8x16_t *a1)
{
  uint64_t *v1;
  unint64_t v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int8x16_t *v10;
  int8x16_t *v11;
  uint64_t v12;
  int8x16_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t *v17;
  uint64_t v18;
  char v20;

  v3 = a1[1].u64[0];
  v4 = (char *)*v1;
  v5 = *(_QWORD *)(*v1 + 16);
  if (v5 > v3)
  {
    sub_238359D3C(v5 - v3);
    v4 = (char *)*v1;
  }
  v20 = 1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v4 = sub_23826C260((uint64_t)v4);
  v6 = *((_QWORD *)v4 + 2);
  if (v3 < v6)
    v6 = v3;
  if (v6)
  {
    if (v6 < 6 || ((v7 = 8 * v6 + 32, v4 + 32 < &a1->i8[v7]) ? (v8 = &a1[2] >= (int8x16_t *)&v4[v7]) : (v8 = 1), !v8))
    {
      v9 = 0;
LABEL_19:
      v14 = v6 - v9;
      v15 = 8 * v9 + 32;
      v16 = &v4[v15];
      v17 = (uint64_t *)((char *)a1->i64 + v15);
      do
      {
        v18 = *v17++;
        *(_QWORD *)v16 &= v18;
        v16 += 8;
        --v14;
      }
      while (v14);
      goto LABEL_21;
    }
    v9 = v6 & 0x7FFFFFFFFFFFFFFCLL;
    v10 = a1 + 3;
    v11 = (int8x16_t *)(v4 + 48);
    v12 = v6 & 0x7FFFFFFFFFFFFFFCLL;
    do
    {
      v13 = vandq_s8(*v11, *v10);
      v11[-1] = vandq_s8(v11[-1], v10[-1]);
      *v11 = v13;
      v10 += 2;
      v11 += 2;
      v12 -= 4;
    }
    while (v12);
    if (v6 != v9)
      goto LABEL_19;
  }
LABEL_21:
  *v1 = (uint64_t)v4;
  return sub_2382FC0D0(&v20, v1);
}

unint64_t sub_238359D3C(unint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  BOOL v3;

  if (result)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      v2 = *(_QWORD *)(*(_QWORD *)v1 + 16);
      v3 = v2 >= result;
      result = v2 - result;
      if (v3)
        return sub_2382E2A7C(result, v2);
    }
    __break(1u);
  }
  return result;
}

_BYTE *BitSet.formIntersection(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  _BYTE *result;
  int64_t v7;
  char v8;

  if (a2 <= 0)
    v4 = 0;
  else
    v4 = a1 & ~(a1 >> 63);
  v5 = a2 & ~(a2 >> 63);
  if (v4 == v5)
  {
    result = (_BYTE *)swift_bridgeObjectRelease();
    *v2 = MEMORY[0x24BEE4AF8];
    return result;
  }
  if (v4 >= v5)
  {
    __break(1u);
  }
  else
  {
    v3 = (char *)*v2;
    v7 = *(_QWORD *)(*v2 + 16) + ~((v5 - 1) >> 6);
    if (v7 >= 1)
    {
      sub_238359D3C(v7);
      v3 = (char *)*v2;
    }
    v8 = 1;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      goto LABEL_10;
  }
  v3 = sub_23826C260((uint64_t)v3);
LABEL_10:
  _UnsafeBitSet.formIntersection(_:)(v4, v5);
  *v2 = (uint64_t)v3;
  return sub_2382FC0D0(&v8, v2);
}

uint64_t BitSet.formIntersection<A>(_:)(uint64_t a1, ValueMetadata *a2)
{
  void (**Description)(char *, _QWORD, ValueMetadata *);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  int8x16_t *v8;
  uint64_t v10[2];

  Description = (void (**)(char *, _QWORD, ValueMetadata *))a2[-1].Description;
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568F0BA0);
  Description[2](v6, a1, a2);
  if ((ValueMetadata *)v7 == a2)
  {
    swift_dynamicCast();
    BitSet.formIntersection(_:)(v10[0], v10[1]);
  }
  else
  {
    v8 = (int8x16_t *)BitSet.init<A>(_validMembersOf:)((uint64_t)v6, a2);
    BitSet.formIntersection(_:)(v8);
    swift_bridgeObjectRelease();
  }
  return ((uint64_t (*)(uint64_t, ValueMetadata *))Description[1])(a1, a2);
}

uint64_t TreeDictionary.merge<A>(_:uniquingKeysWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_2382E43DC(a1, a2, a3, a4, a5, a6, (void (*)(void))sub_23835A3BC);
}

{
  return sub_2382E43DC(a1, a2, a3, a4, a5, a6, (void (*)(void))sub_23835A860);
}

_DWORD *TreeDictionary.merge(_:uniquingKeysWith:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, char *), uint64_t a5, uint64_t *a6)
{
  uint64_t v6;
  _QWORD *v11;

  ++*(_QWORD *)(v6 + 16);
  v11 = (_QWORD *)type metadata accessor for _HashNode(0, a6[2], a6[3], a6[4]);
  return _HashNode.merge(_:_:_:)(0, a1, a2, a4, a5, v11);
}

uint64_t sub_238359FD4(uint64_t a1, void (*a2)(char *, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
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
  char *v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;

  v23 = a3;
  v24 = a2;
  v9 = sub_23835B334();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v23 - v15;
  v17 = *(_QWORD *)(a6 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v16, a1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1, a6) == 1)
  {
    v20 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v20(a1, v9);
    v20((uint64_t)v16, v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(a1, a4, a6);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, a6);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v16, a6);
    v22 = v25;
    v24(v19, a4);
    if (v22)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, a6);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, a6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, a6);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v13, v9);
    }
  }
}

uint64_t TreeDictionary.merging(_:uniquingKeysWith:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, char *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t *v17;
  uint64_t v18;
  uint64_t result;

  v12 = v11;
  v17 = (uint64_t *)type metadata accessor for TreeDictionary(0, a9, a10, a11);
  swift_retain();
  TreeDictionary.merge(_:uniquingKeysWith:)(a1, a2, v18, a4, a5, v17);
  result = a6;
  if (v12)
    return swift_release();
  return result;
}

uint64_t TreeDictionary.merging<A>(_:uniquingKeysWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return sub_23835A2F0(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23835A3BC);
}

{
  return sub_23835A2F0(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23835A860);
}

uint64_t sub_23835A2F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void (*a12)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v17;
  uint64_t result;

  v13 = v12;
  v17 = type metadata accessor for TreeDictionary(0, a7, a8, a10);
  swift_retain();
  a12(a1, a2, a3, v17, a9, a11);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a9 - 8) + 8))(a1, a9);
  result = a4;
  if (v13)
    return swift_release();
  return result;
}

uint64_t sub_23835A3BC(uint64_t a1, void (*a2)(char *, uint64_t), uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t updated;
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
  char *v27;
  uint64_t AssociatedTypeWitness;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t AssociatedConformanceWitness;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  void (*v37)(char *, char *, uint64_t);
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  void (*v51)(char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  unsigned int (*v56)(char *, uint64_t, uint64_t);
  uint64_t v57;
  char *v58;
  void (*v59)(char *, char *, uint64_t);
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  uint64_t v63;
  uint64_t TupleTypeMetadata2;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v7 = v6;
  v68 = a6;
  v62 = a2;
  v63 = a3;
  v66 = a1;
  v9 = a4[2];
  v10 = a4[3];
  v11 = a4[4];
  updated = type metadata accessor for _HashNode.ValueUpdateState(0, v9, v10, v11);
  v13 = *(_QWORD *)(updated - 8);
  v60 = updated;
  v61 = v13;
  v14 = MEMORY[0x24BDAC7A8](updated);
  v16 = (char *)&v52 - v15;
  v71 = *(_QWORD *)(v10 - 8);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v70 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = *(_QWORD *)(v9 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v69 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v52 - v21;
  v53 = v9;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v23 = sub_23835B334();
  v24 = MEMORY[0x24BDAC7A8](v23);
  v54 = (char *)&v52 - v25;
  v65 = *(char **)(a5 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v52 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v55 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v30 = (char *)&v52 - v29;
  v31 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v65 + 2);
  v67 = a5;
  v31(v27, v66, a5);
  sub_23835AF8C();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v65 = v30;
  v66 = AssociatedTypeWitness;
  v33 = AssociatedConformanceWitness;
  v34 = v54;
  sub_23835B484();
  v35 = TupleTypeMetadata2;
  v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 48);
  if (v36(v34, 1, TupleTypeMetadata2) == 1)
    return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v65, v66);
  v56 = v36;
  v57 = v33;
  v37 = *(void (**)(char *, char *, uint64_t))(v72 + 32);
  v58 = v22;
  v59 = v37;
  v38 = v53;
  while (1)
  {
    v39 = &v34[*(int *)(v35 + 48)];
    v59(v22, v34, v38);
    v40 = (uint64_t)v70;
    (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v70, v39, v10);
    v41 = v22;
    v42 = v10;
    v43 = v69;
    (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v69, v41, v38);
    ++*(_QWORD *)(v7 + 16);
    v44 = sub_238358A4C();
    v45 = (_QWORD *)type metadata accessor for _HashNode(0, v38, v42, v11);
    v46 = (uint64_t)v43;
    v10 = v42;
    _HashNode.prepareValueUpdate(_:_:)(v46, v44, v45, (uint64_t)v16);
    v47 = v60;
    v48 = v73;
    sub_238359FD4((uint64_t)&v16[*(int *)(v60 + 44)], v62, v63, v40, v38, v10);
    if (v48)
      break;
    v73 = 0;
    sub_2382A0EA4(v7, (uint64_t)v16, v38, v10, v11);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v16, v47);
    v49 = *(void (**)(char *, uint64_t))(v72 + 8);
    v49(v69, v38);
    v22 = v58;
    v49(v58, v38);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v10);
    sub_23835B484();
    v35 = TupleTypeMetadata2;
    if (v56(v34, 1, TupleTypeMetadata2) == 1)
      return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v65, v66);
  }
  sub_2382A0EA4(v7, (uint64_t)v16, v38, v10, v11);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v16, v47);
  v51 = *(void (**)(char *, uint64_t))(v72 + 8);
  v51(v69, v38);
  v51(v58, v38);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v65, v66);
  return (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v70, v10);
}

uint64_t sub_23835A860(uint64_t a1, void (*a2)(char *, uint64_t), uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  _QWORD *v22;
  uint64_t TupleTypeMetadata2;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;

  v27 = a3;
  v26 = a2;
  v9 = sub_23835B5BC();
  v25 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v21 - v10;
  v12 = a4[3];
  v21 = a4[2];
  v22 = a4;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v13 = sub_23835B730();
  v24 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v21 - v14;
  sub_23835AFF8();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v21;
  v16[3] = v12;
  v17 = v22;
  v18 = v22[4];
  v16[4] = a5;
  v16[5] = v18;
  v16[6] = a6;
  MEMORY[0x23B831670](MEMORY[0x24BEE25B0], v9);
  sub_23835B808();
  swift_release();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v9);
  v19 = MEMORY[0x23B831670](MEMORY[0x24BEE2B40], v13);
  sub_23835A3BC((uint64_t)v15, v26, v27, v17, v13, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v15, v13);
}

uint64_t sub_23835AA3C()
{
  return swift_deallocObject();
}

uint64_t Deque.customMirror.getter(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];

  v4 = sub_23835BA60();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568F0B10);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = a1;
  v17[1] = a1;
  v10 = *MEMORY[0x24BEE4368];
  v11 = sub_23835BA54();
  v12 = *(_QWORD *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 104))(v9, v10, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  v15 = type metadata accessor for Deque(0, a2, v13, v14);
  MEMORY[0x23B831670](&protocol conformance descriptor for Deque<A>, v15);
  sub_23829A850((uint64_t)v6);
  swift_retain_n();
  return sub_23835BA6C();
}

uint64_t sub_23835ABB0(uint64_t a1)
{
  uint64_t *v1;

  return Deque.customMirror.getter(*v1, *(_QWORD *)(a1 + 16));
}

uint64_t sub_23835ABC0()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_23835ABCC()
{
  return MEMORY[0x24BEE0300]();
}

uint64_t sub_23835ABD8()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_23835ABE4()
{
  return MEMORY[0x24BEE0608]();
}

uint64_t sub_23835ABF0()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23835ABFC()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23835AC08()
{
  return MEMORY[0x24BEE0760]();
}

uint64_t sub_23835AC14()
{
  return MEMORY[0x24BEE0780]();
}

uint64_t sub_23835AC20()
{
  return MEMORY[0x24BEE0788]();
}

uint64_t sub_23835AC2C()
{
  return MEMORY[0x24BEE0790]();
}

uint64_t sub_23835AC38()
{
  return MEMORY[0x24BEE0798]();
}

uint64_t sub_23835AC44()
{
  return MEMORY[0x24BEE07A0]();
}

uint64_t sub_23835AC50()
{
  return MEMORY[0x24BEE07B0]();
}

uint64_t sub_23835AC5C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23835AC68()
{
  return MEMORY[0x24BEE07D8]();
}

uint64_t sub_23835AC74()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23835AC80()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_23835AC8C()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_23835AC98()
{
  return MEMORY[0x24BEE07F8]();
}

uint64_t sub_23835ACA4()
{
  return MEMORY[0x24BEE0800]();
}

uint64_t sub_23835ACB0()
{
  return MEMORY[0x24BEE0808]();
}

uint64_t sub_23835ACBC()
{
  return MEMORY[0x24BEE0818]();
}

uint64_t sub_23835ACC8()
{
  return MEMORY[0x24BEE0830]();
}

uint64_t sub_23835ACD4()
{
  return MEMORY[0x24BEE0838]();
}

uint64_t sub_23835ACE0()
{
  return MEMORY[0x24BEE0840]();
}

uint64_t sub_23835ACEC()
{
  return MEMORY[0x24BEE0850]();
}

uint64_t sub_23835ACF8()
{
  return MEMORY[0x24BEE0860]();
}

uint64_t sub_23835AD04()
{
  return MEMORY[0x24BEE0868]();
}

uint64_t sub_23835AD10()
{
  return MEMORY[0x24BEE0870]();
}

uint64_t sub_23835AD1C()
{
  return MEMORY[0x24BEE0878]();
}

uint64_t sub_23835AD28()
{
  return MEMORY[0x24BEE0880]();
}

uint64_t sub_23835AD34()
{
  return MEMORY[0x24BEE08B8]();
}

uint64_t sub_23835AD40()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23835AD4C()
{
  return MEMORY[0x24BEE0990]();
}

uint64_t sub_23835AD58()
{
  return MEMORY[0x24BEE0998]();
}

uint64_t sub_23835AD64()
{
  return MEMORY[0x24BEE09A0]();
}

uint64_t sub_23835AD70()
{
  return MEMORY[0x24BEE09A8]();
}

uint64_t sub_23835AD7C()
{
  return MEMORY[0x24BEE09B0]();
}

uint64_t sub_23835AD88()
{
  return MEMORY[0x24BEE09C8]();
}

uint64_t sub_23835AD94()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_23835ADA0()
{
  return MEMORY[0x24BEE0A70]();
}

uint64_t sub_23835ADAC()
{
  return MEMORY[0x24BEE0A78]();
}

uint64_t sub_23835ADB8()
{
  return MEMORY[0x24BEE0A80]();
}

uint64_t sub_23835ADC4()
{
  return MEMORY[0x24BEE0A88]();
}

uint64_t sub_23835ADD0()
{
  return MEMORY[0x24BEE0A90]();
}

uint64_t sub_23835ADDC()
{
  return MEMORY[0x24BEE0A98]();
}

uint64_t sub_23835ADE8()
{
  return MEMORY[0x24BEE0AA0]();
}

uint64_t sub_23835ADF4()
{
  return MEMORY[0x24BEE0AC0]();
}

uint64_t sub_23835AE00()
{
  return MEMORY[0x24BEE0AC8]();
}

uint64_t sub_23835AE0C()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_23835AE18()
{
  return MEMORY[0x24BEE0B00]();
}

uint64_t sub_23835AE24()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_23835AE30()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_23835AE3C()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_23835AE48()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_23835AE54()
{
  return MEMORY[0x24BEE0B90]();
}

uint64_t sub_23835AE60()
{
  return MEMORY[0x24BEE0B98]();
}

uint64_t sub_23835AE6C()
{
  return MEMORY[0x24BEE0BA8]();
}

uint64_t sub_23835AE78()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_23835AE84()
{
  return MEMORY[0x24BEE0BB8]();
}

uint64_t sub_23835AE90()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23835AE9C()
{
  return MEMORY[0x24BEE0BD0]();
}

uint64_t sub_23835AEA8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23835AEB4()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_23835AEC0()
{
  return MEMORY[0x24BEE0C28]();
}

uint64_t sub_23835AECC()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_23835AED8()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_23835AEE4()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_23835AEF0()
{
  return MEMORY[0x24BEE0C60]();
}

uint64_t sub_23835AEFC()
{
  return MEMORY[0x24BEE0C78]();
}

uint64_t sub_23835AF08()
{
  return MEMORY[0x24BEE0C88]();
}

uint64_t sub_23835AF14()
{
  return MEMORY[0x24BEE0C98]();
}

uint64_t sub_23835AF20()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_23835AF2C()
{
  return MEMORY[0x24BEE0CA8]();
}

uint64_t sub_23835AF38()
{
  return MEMORY[0x24BEE0CE8]();
}

uint64_t sub_23835AF44()
{
  return MEMORY[0x24BEE0CF0]();
}

uint64_t sub_23835AF50()
{
  return MEMORY[0x24BEE0D58]();
}

uint64_t sub_23835AF5C()
{
  return MEMORY[0x24BEE0DB8]();
}

uint64_t sub_23835AF68()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_23835AF74()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23835AF80()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23835AF8C()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_23835AF98()
{
  return MEMORY[0x24BEE0DF0]();
}

uint64_t sub_23835AFA4()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_23835AFB0()
{
  return MEMORY[0x24BEE0E08]();
}

uint64_t sub_23835AFBC()
{
  return MEMORY[0x24BEE0E10]();
}

uint64_t sub_23835AFC8()
{
  return MEMORY[0x24BEE0E38]();
}

uint64_t sub_23835AFD4()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_23835AFE0()
{
  return MEMORY[0x24BEE0E58]();
}

uint64_t sub_23835AFEC()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_23835AFF8()
{
  return MEMORY[0x24BEE0E90]();
}

uint64_t sub_23835B004()
{
  return MEMORY[0x24BEE0EB0]();
}

uint64_t sub_23835B010()
{
  return MEMORY[0x24BEE0EC0]();
}

uint64_t sub_23835B01C()
{
  return MEMORY[0x24BEE0EE8]();
}

uint64_t sub_23835B028()
{
  return MEMORY[0x24BEE0F20]();
}

uint64_t sub_23835B034()
{
  return MEMORY[0x24BEE0F30]();
}

uint64_t sub_23835B040()
{
  return MEMORY[0x24BEE0FB8]();
}

uint64_t sub_23835B04C()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_23835B058()
{
  return MEMORY[0x24BEE1150]();
}

uint64_t sub_23835B064()
{
  return MEMORY[0x24BEE1178]();
}

uint64_t sub_23835B070()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23835B07C()
{
  return MEMORY[0x24BEE1188]();
}

uint64_t sub_23835B088()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23835B094()
{
  return MEMORY[0x24BEE1198]();
}

uint64_t sub_23835B0A0()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_23835B0AC()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_23835B0B8()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_23835B0C4()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_23835B0D0()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23835B0DC()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_23835B0E8()
{
  return MEMORY[0x24BEE1300]();
}

uint64_t sub_23835B0F4()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_23835B100()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_23835B10C()
{
  return MEMORY[0x24BEE1628]();
}

uint64_t sub_23835B118()
{
  return MEMORY[0x24BEE1668]();
}

uint64_t sub_23835B124()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_23835B130()
{
  return MEMORY[0x24BEE1690]();
}

uint64_t sub_23835B13C()
{
  return MEMORY[0x24BEE16A8]();
}

uint64_t sub_23835B148()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_23835B154()
{
  return MEMORY[0x24BEE1850]();
}

uint64_t sub_23835B160()
{
  return MEMORY[0x24BEE1860]();
}

uint64_t sub_23835B16C()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t sub_23835B178()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_23835B184()
{
  return MEMORY[0x24BEE18B8]();
}

uint64_t sub_23835B190()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_23835B19C()
{
  return MEMORY[0x24BEE18D8]();
}

uint64_t sub_23835B1A8()
{
  return MEMORY[0x24BEE18E8]();
}

uint64_t sub_23835B1B4()
{
  return MEMORY[0x24BEE18F8]();
}

uint64_t sub_23835B1C0()
{
  return MEMORY[0x24BEE1900]();
}

uint64_t sub_23835B1CC()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_23835B1D8()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_23835B1E4()
{
  return MEMORY[0x24BEE1938]();
}

uint64_t sub_23835B1F0()
{
  return MEMORY[0x24BEE1950]();
}

uint64_t sub_23835B1FC()
{
  return MEMORY[0x24BEE1970]();
}

uint64_t sub_23835B208()
{
  return MEMORY[0x24BEE1978]();
}

uint64_t sub_23835B214()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_23835B220()
{
  return MEMORY[0x24BEE19A8]();
}

uint64_t sub_23835B22C()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_23835B238()
{
  return MEMORY[0x24BEE19D0]();
}

uint64_t sub_23835B244()
{
  return MEMORY[0x24BEE19E8]();
}

uint64_t sub_23835B250()
{
  return MEMORY[0x24BEE19F8]();
}

uint64_t sub_23835B25C()
{
  return MEMORY[0x24BEE1A00]();
}

uint64_t sub_23835B268()
{
  return MEMORY[0x24BEE1A18]();
}

uint64_t sub_23835B274()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_23835B280()
{
  return MEMORY[0x24BEE1A50]();
}

uint64_t sub_23835B28C()
{
  return MEMORY[0x24BEE1A80]();
}

uint64_t sub_23835B298()
{
  return MEMORY[0x24BEE1A88]();
}

uint64_t sub_23835B2A4()
{
  return MEMORY[0x24BEE1AF0]();
}

uint64_t sub_23835B2B0()
{
  return MEMORY[0x24BEE1B10]();
}

uint64_t sub_23835B2BC()
{
  return MEMORY[0x24BEE1B18]();
}

uint64_t sub_23835B2C8()
{
  return MEMORY[0x24BEE1B20]();
}

uint64_t sub_23835B2D4()
{
  return MEMORY[0x24BEE1B28]();
}

uint64_t sub_23835B2E0()
{
  return MEMORY[0x24BEE1B30]();
}

uint64_t sub_23835B2EC()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_23835B2F8()
{
  return MEMORY[0x24BEE1BE8]();
}

uint64_t sub_23835B304()
{
  return MEMORY[0x24BEE1BF0]();
}

uint64_t sub_23835B310()
{
  return MEMORY[0x24BEE1C00]();
}

uint64_t sub_23835B31C()
{
  return MEMORY[0x24BEE1C08]();
}

uint64_t sub_23835B328()
{
  return MEMORY[0x24BEE1C10]();
}

uint64_t sub_23835B334()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23835B340()
{
  return MEMORY[0x24BEE1CB0]();
}

uint64_t sub_23835B34C()
{
  return MEMORY[0x24BEE1CB8]();
}

uint64_t sub_23835B358()
{
  return MEMORY[0x24BEE1CC8]();
}

uint64_t sub_23835B364()
{
  return MEMORY[0x24BEE1CD8]();
}

uint64_t sub_23835B370()
{
  return MEMORY[0x24BEE1CE0]();
}

uint64_t sub_23835B37C()
{
  return MEMORY[0x24BEE1CF0]();
}

uint64_t sub_23835B388()
{
  return MEMORY[0x24BEE1CF8]();
}

uint64_t sub_23835B394()
{
  return MEMORY[0x24BEE1D00]();
}

uint64_t sub_23835B3A0()
{
  return MEMORY[0x24BEE1D08]();
}

uint64_t sub_23835B3AC()
{
  return MEMORY[0x24BEE1D18]();
}

uint64_t sub_23835B3B8()
{
  return MEMORY[0x24BEE1D48]();
}

uint64_t sub_23835B3C4()
{
  return MEMORY[0x24BEE1D78]();
}

uint64_t sub_23835B3D0()
{
  return MEMORY[0x24BEE1D80]();
}

uint64_t sub_23835B3DC()
{
  return MEMORY[0x24BEE1D88]();
}

uint64_t sub_23835B3E8()
{
  return MEMORY[0x24BEE1DA0]();
}

uint64_t sub_23835B3F4()
{
  return MEMORY[0x24BEE1DA8]();
}

uint64_t sub_23835B400()
{
  return MEMORY[0x24BEE1DB0]();
}

uint64_t sub_23835B40C()
{
  return MEMORY[0x24BEE1DB8]();
}

uint64_t sub_23835B418()
{
  return MEMORY[0x24BEE1DC0]();
}

uint64_t sub_23835B424()
{
  return MEMORY[0x24BEE1DC8]();
}

uint64_t sub_23835B430()
{
  return MEMORY[0x24BEE1DD0]();
}

uint64_t sub_23835B43C()
{
  return MEMORY[0x24BEE1DD8]();
}

uint64_t sub_23835B448()
{
  return MEMORY[0x24BEE1DF0]();
}

uint64_t sub_23835B454()
{
  return MEMORY[0x24BEE1E48]();
}

uint64_t sub_23835B460()
{
  return MEMORY[0x24BEE1E50]();
}

uint64_t sub_23835B46C()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_23835B478()
{
  return MEMORY[0x24BEE1E68]();
}

uint64_t sub_23835B484()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_23835B490()
{
  return MEMORY[0x24BEE1FD0]();
}

uint64_t sub_23835B49C()
{
  return MEMORY[0x24BEE1FD8]();
}

uint64_t sub_23835B4A8()
{
  return MEMORY[0x24BEE2028]();
}

uint64_t sub_23835B4B4()
{
  return MEMORY[0x24BEE2030]();
}

uint64_t sub_23835B4C0()
{
  return MEMORY[0x24BEE2048]();
}

uint64_t sub_23835B4CC()
{
  return MEMORY[0x24BEE2058]();
}

uint64_t sub_23835B4D8()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_23835B4E4()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_23835B4F0()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_23835B4FC()
{
  return MEMORY[0x24BEE2108]();
}

uint64_t sub_23835B508()
{
  return MEMORY[0x24BEE2110]();
}

uint64_t sub_23835B514()
{
  return MEMORY[0x24BEE2128]();
}

uint64_t sub_23835B520()
{
  return MEMORY[0x24BEE2130]();
}

uint64_t sub_23835B52C()
{
  return MEMORY[0x24BEE2138]();
}

uint64_t sub_23835B538()
{
  return MEMORY[0x24BEE2148]();
}

uint64_t sub_23835B544()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_23835B550()
{
  return MEMORY[0x24BEE21A0]();
}

uint64_t sub_23835B55C()
{
  return MEMORY[0x24BEE2298]();
}

uint64_t sub_23835B568()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_23835B574()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_23835B580()
{
  return MEMORY[0x24BEE2390]();
}

uint64_t sub_23835B58C()
{
  return MEMORY[0x24BEE24E8]();
}

uint64_t sub_23835B598()
{
  return MEMORY[0x24BEE2500]();
}

uint64_t sub_23835B5A4()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_23835B5B0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23835B5BC()
{
  return MEMORY[0x24BEE2588]();
}

uint64_t sub_23835B5C8()
{
  return MEMORY[0x24BEE2638]();
}

uint64_t sub_23835B5D4()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_23835B5E0()
{
  return MEMORY[0x24BEE26C0]();
}

uint64_t sub_23835B5EC()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23835B5F8()
{
  return MEMORY[0x24BEE2700]();
}

uint64_t sub_23835B604()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23835B610()
{
  return MEMORY[0x24BEE2788]();
}

uint64_t sub_23835B61C()
{
  return MEMORY[0x24BEE2790]();
}

uint64_t sub_23835B628()
{
  return MEMORY[0x24BEE27B0]();
}

uint64_t sub_23835B634()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23835B640()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_23835B64C()
{
  return MEMORY[0x24BEE2910]();
}

uint64_t sub_23835B658()
{
  return MEMORY[0x24BEE2918]();
}

uint64_t sub_23835B664()
{
  return MEMORY[0x24BEE2920]();
}

uint64_t sub_23835B670()
{
  return MEMORY[0x24BEE2940]();
}

uint64_t sub_23835B67C()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_23835B688()
{
  return MEMORY[0x24BEE2968]();
}

uint64_t sub_23835B694()
{
  return MEMORY[0x24BEE2970]();
}

uint64_t _s19CollectionsInternal4HeapV5countSivg_0()
{
  return MEMORY[0x24BEE2990]();
}

uint64_t sub_23835B6AC()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_23835B6B8()
{
  return MEMORY[0x24BEE29C8]();
}

uint64_t sub_23835B6C4()
{
  return MEMORY[0x24BEE29D0]();
}

uint64_t sub_23835B6D0()
{
  return MEMORY[0x24BEE29F0]();
}

uint64_t sub_23835B6DC()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_23835B6E8()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_23835B6F4()
{
  return MEMORY[0x24BEE2A18]();
}

uint64_t sub_23835B700()
{
  return MEMORY[0x24BEE2A20]();
}

uint64_t sub_23835B70C()
{
  return MEMORY[0x24BEE2A28]();
}

uint64_t sub_23835B718()
{
  return MEMORY[0x24BEE2A78]();
}

uint64_t sub_23835B724()
{
  return MEMORY[0x24BEE2A80]();
}

uint64_t sub_23835B730()
{
  return MEMORY[0x24BEE2B20]();
}

uint64_t sub_23835B73C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23835B748()
{
  return MEMORY[0x24BEE2C38]();
}

uint64_t sub_23835B754()
{
  return MEMORY[0x24BEE2C58]();
}

uint64_t sub_23835B760()
{
  return MEMORY[0x24BEE2C90]();
}

uint64_t sub_23835B76C()
{
  return MEMORY[0x24BEE2C98]();
}

uint64_t sub_23835B778()
{
  return MEMORY[0x24BEE2CA0]();
}

uint64_t sub_23835B784()
{
  return MEMORY[0x24BEE2D18]();
}

uint64_t sub_23835B790()
{
  return MEMORY[0x24BEE2D40]();
}

uint64_t sub_23835B79C()
{
  return MEMORY[0x24BEE2D48]();
}

uint64_t sub_23835B7A8()
{
  return MEMORY[0x24BEE2D70]();
}

uint64_t sub_23835B7B4()
{
  return MEMORY[0x24BEE2D78]();
}

uint64_t sub_23835B7C0()
{
  return MEMORY[0x24BEE2DC0]();
}

uint64_t sub_23835B7CC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23835B7D8()
{
  return MEMORY[0x24BEE2F88]();
}

uint64_t sub_23835B7E4()
{
  return MEMORY[0x24BEE3110]();
}

uint64_t sub_23835B7F0()
{
  return MEMORY[0x24BEE3128]();
}

uint64_t sub_23835B7FC()
{
  return MEMORY[0x24BEE3140]();
}

uint64_t sub_23835B808()
{
  return MEMORY[0x24BEE3168]();
}

uint64_t sub_23835B814()
{
  return MEMORY[0x24BEE3198]();
}

uint64_t sub_23835B820()
{
  return MEMORY[0x24BEE31A0]();
}

uint64_t sub_23835B82C()
{
  return MEMORY[0x24BEE31A8]();
}

uint64_t sub_23835B838()
{
  return MEMORY[0x24BEE32A0]();
}

uint64_t sub_23835B844()
{
  return MEMORY[0x24BEE32A8]();
}

uint64_t sub_23835B850()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23835B85C()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23835B868()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23835B874()
{
  return MEMORY[0x24BEE3558]();
}

uint64_t sub_23835B880()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23835B88C()
{
  return MEMORY[0x24BEE35D8]();
}

uint64_t sub_23835B898()
{
  return MEMORY[0x24BEE35E0]();
}

uint64_t sub_23835B8A4()
{
  return MEMORY[0x24BEE3610]();
}

uint64_t sub_23835B8B0()
{
  return MEMORY[0x24BEE3638]();
}

uint64_t sub_23835B8BC()
{
  return MEMORY[0x24BEE3660]();
}

uint64_t sub_23835B8C8()
{
  return MEMORY[0x24BEE3668]();
}

uint64_t sub_23835B8D4()
{
  return MEMORY[0x24BEE3748]();
}

uint64_t sub_23835B8E0()
{
  return MEMORY[0x24BEE3788]();
}

uint64_t sub_23835B8EC()
{
  return MEMORY[0x24BEE37C8]();
}

uint64_t sub_23835B8F8()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_23835B904()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_23835B910()
{
  return MEMORY[0x24BEE39B0]();
}

uint64_t sub_23835B91C()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_23835B928()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23835B934()
{
  return MEMORY[0x24BEE3A50]();
}

uint64_t sub_23835B940()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_23835B94C()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t sub_23835B958()
{
  return MEMORY[0x24BEE3D38]();
}

uint64_t sub_23835B964()
{
  return MEMORY[0x24BEE3D58]();
}

uint64_t sub_23835B970()
{
  return MEMORY[0x24BEE3D90]();
}

uint64_t sub_23835B97C()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_23835B988()
{
  return MEMORY[0x24BEE3DF8]();
}

uint64_t sub_23835B994()
{
  return MEMORY[0x24BEE3EC8]();
}

uint64_t sub_23835B9A0()
{
  return MEMORY[0x24BEE41A0]();
}

uint64_t sub_23835B9AC()
{
  return MEMORY[0x24BEE41A8]();
}

uint64_t sub_23835B9B8()
{
  return MEMORY[0x24BEE41B0]();
}

uint64_t sub_23835B9C4()
{
  return MEMORY[0x24BEE41D8]();
}

uint64_t sub_23835B9D0()
{
  return MEMORY[0x24BEE42B8]();
}

uint64_t sub_23835B9DC()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_23835B9E8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23835B9F4()
{
  return MEMORY[0x24BEE42E8]();
}

uint64_t sub_23835BA00()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23835BA0C()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23835BA18()
{
  return MEMORY[0x24BEE4308]();
}

uint64_t sub_23835BA24()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23835BA30()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_23835BA3C()
{
  return MEMORY[0x24BEE4320]();
}

uint64_t sub_23835BA48()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23835BA54()
{
  return MEMORY[0x24BEE4398]();
}

uint64_t sub_23835BA60()
{
  return MEMORY[0x24BEE43C8]();
}

uint64_t sub_23835BA6C()
{
  return MEMORY[0x24BEE43E8]();
}

uint64_t sub_23835BA78()
{
  return MEMORY[0x24BEE45E8]();
}

uint64_t sub_23835BA84()
{
  return MEMORY[0x24BEE45F0]();
}

uint64_t sub_23835BA90()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_23835BA9C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23835BAA8()
{
  return MEMORY[0x24BEE4620]();
}

uint64_t sub_23835BAB4()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_23835BAC0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23835BACC()
{
  return MEMORY[0x24BEE4710]();
}

uint64_t sub_23835BAD8()
{
  return MEMORY[0x24BEE4718]();
}

uint64_t sub_23835BAE4()
{
  return MEMORY[0x24BEE4720]();
}

uint64_t sub_23835BAF0()
{
  return MEMORY[0x24BEE4728]();
}

uint64_t sub_23835BAFC()
{
  return MEMORY[0x24BEE4730]();
}

uint64_t sub_23835BB08()
{
  return MEMORY[0x24BEE47F0]();
}

uint64_t sub_23835BB14()
{
  return MEMORY[0x24BEE49E8]();
}

uint64_t sub_23835BB20()
{
  return MEMORY[0x24BEE49F8]();
}

uint64_t sub_23835BB2C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23835BB38()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23835BB44()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x24BEE4B28]();
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x24BEE4DD8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x24BEE4E80]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x24BEE4E88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}


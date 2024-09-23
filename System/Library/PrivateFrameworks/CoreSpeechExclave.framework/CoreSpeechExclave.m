BOOL sub_23A0D9040(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23A0D9054()
{
  sub_23A0DD688();
  sub_23A0DD694();
  return sub_23A0DD6A0();
}

uint64_t sub_23A0D9098()
{
  return sub_23A0DD694();
}

uint64_t sub_23A0D90C0()
{
  sub_23A0DD688();
  sub_23A0DD694();
  return sub_23A0DD6A0();
}

uint64_t sub_23A0D9100@<X0>(unsigned int *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_23A0DAA48(*a1);
  *a2 = result;
  return result;
}

void sub_23A0D9128(_DWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_23A0D9138()
{
  sub_23A0DAFA4();
  sub_23A0DAFE8();
  return sub_23A0DD67C();
}

uint64_t sub_23A0D9184()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_23A0D91A8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v4 = sub_23A0DD604();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_23A0DD61C();
  swift_allocObject();
  v9 = sub_23A0DD610();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(_QWORD *)(v8 + 16) = v9;
  *a2 = v8;
  return result;
}

void (*sub_23A0D9280(char *a1))(uint64_t, _QWORD, uint64_t, uint64_t)
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
  char *v16;
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
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  void (*v54)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  char *v65;
  void (*v66)(uint64_t, _QWORD, uint64_t, uint64_t);
  char *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  void (*v75)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  unint64_t v100;
  uint64_t v101;
  void (*v102)(_QWORD, _QWORD, uint64_t, uint64_t);
  uint64_t v103;
  unsigned int v104;
  char v105;
  int v106;
  int v107;
  unint64_t v108;
  void (*v109)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char v114;
  char *v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  unint64_t v129;
  uint64_t v130;
  unint64_t v131;
  void (*v132)(_QWORD, _QWORD, uint64_t, uint64_t);
  uint64_t v133;
  uint64_t v134;
  char v135;
  unint64_t v136;
  uint64_t v137;
  unint64_t v138;
  void (*v139)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  int v143;
  char *v144;
  uint64_t v146;
  char *v147;
  char *v148;
  char *v149;
  char *v150;
  char *v151;
  char *v152;
  char *v153;
  char *v154;
  char *v155;
  char *v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  _QWORD *v164;
  unint64_t v165;
  char *v166;
  char *v167;
  uint64_t v168;
  unint64_t v169;
  unint64_t v170;
  uint64_t v171;

  v167 = a1;
  v1 = sub_23A0DD5F8();
  v2 = *(_QWORD *)(v1 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v157 = (char *)&v146 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569425E0);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v161 = (char *)&v146 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v155 = (char *)&v146 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v156 = (char *)&v146 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v148 = (char *)&v146 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v160 = (char *)&v146 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v146 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v154 = (char *)&v146 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v153 = (char *)&v146 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v146 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v151 = (char *)&v146 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v150 = (char *)&v146 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v146 - v29;
  v31 = MEMORY[0x24BDAC7A8](v28);
  v149 = (char *)&v146 - v32;
  v33 = MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v146 - v34;
  v36 = MEMORY[0x24BDAC7A8](v33);
  v38 = (char *)&v146 - v37;
  v39 = MEMORY[0x24BDAC7A8](v36);
  v147 = (char *)&v146 - v40;
  v41 = MEMORY[0x24BDAC7A8](v39);
  v152 = (char *)&v146 - v42;
  MEMORY[0x24BDAC7A8](v41);
  v44 = (char *)&v146 - v43;
  v45 = sub_23A0DD598();
  MEMORY[0x24BDAC7A8](v45);
  v47 = (char *)&v146 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v162 = v49;
  v163 = v48;
  (*(void (**)(char *, char *))(v49 + 16))(v47, v167);
  v158 = v1;
  v159 = v2;
  v50 = *(_QWORD *)(v2 + 56);
  v166 = v44;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v50)(v44, 1, 1, v1);
  v167 = v47;
  v51 = sub_23A0DD580();
  v52 = v51;
  if (v51 > 0x27639B712DF9D8DDLL)
  {
    if (v51 > 0x3B97179C438E7D3ELL)
    {
      v53 = v167;
      if (v51 > 0x5AB466FC8E211106)
      {
        if (v51 != 0x5AB466FC8E211107)
        {
          if (v51 == 0x60019795105E77C2)
          {
            v54 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v50;
            v55 = v164[6];
            v56 = v164[7];
            __swift_project_boxed_opaque_existential_1(v164 + 3, v55);
            v57 = sub_23A0DD574();
            v58 = v165;
            v59 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v56 + 8))(v57, v55, v56);
            v60 = (uint64_t)v166;
            if (!v58)
            {
              v64 = v59 & 1;
              v63 = v158;
              v62 = v159;
              v50 = (uint64_t)v152;
              goto LABEL_85;
            }
            v169 = v58;
            __swift_instantiateConcreteTypeFromMangledName(&qword_2569425E8);
            v61 = swift_dynamicCast();
            v63 = v158;
            v62 = v159;
            v50 = (uint64_t)v152;
            if (v61)
            {
              v64 = v171 | 0xFFFFFF80;
              MEMORY[0x23B8409F8](v169);
LABEL_85:
              sub_23A0DD58C();
              v54(v50, 0, 1, v63);
              sub_23A0DAD70(v50, v60);
              if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v60, 1, v63))
                goto LABEL_93;
              if ((v64 & 0x80000000) == 0)
              {
                sub_23A0DD5C8();
                sub_23A0DD5A4();
                goto LABEL_93;
              }
              sub_23A0DD5C8();
              goto LABEL_60;
            }
            MEMORY[0x23B8409F8](v169);
            while (1)
            {
LABEL_100:
              sub_23A0DD640();
              __break(1u);
LABEL_101:
              v169 = 0;
              v170 = 0xE000000000000000;
              sub_23A0DD634();
              swift_bridgeObjectRelease();
              v169 = 0xD000000000000020;
              v170 = 0x800000023A0DDF10;
              LODWORD(v171) = v50;
              sub_23A0DD64C();
              sub_23A0DD628();
              swift_bridgeObjectRelease();
            }
          }
          v60 = (uint64_t)v166;
          if (v51 == 0x6235F79F0F251BA0)
          {
            v122 = v164[6];
            v123 = v164[7];
            __swift_project_boxed_opaque_existential_1(v164 + 3, v122);
            v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))(*(uint64_t (**)(uint64_t, uint64_t))(v123 + 40))(v122, v123);
            v124 = (uint64_t)v149;
            v53 = v167;
            v125 = v165;
            sub_23A0DD58C();
            if (!v125)
            {
              v63 = v158;
              ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v50)(v124, 0, 1, v158);
              sub_23A0DAD70(v124, v60);
              v62 = v159;
              if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v159 + 48))(v60, 1, v63))
                sub_23A0DD5E0();
              goto LABEL_93;
            }
LABEL_83:
            (*(void (**)(char *, uint64_t))(v162 + 8))(v53, v163);
            sub_23A0DAD30(v60);
            return v66;
          }
          goto LABEL_99;
        }
        v102 = (void (*)(_QWORD, _QWORD, uint64_t, uint64_t))v50;
        v103 = v164[6];
        v50 = v164[7];
        __swift_project_boxed_opaque_existential_1(v164 + 3, v103);
        v104 = sub_23A0DD574();
        if (v104 >= 2)
        {
          v169 = 0;
          v170 = 0xE000000000000000;
          sub_23A0DD634();
          sub_23A0DD628();
          LODWORD(v171) = v104;
          sub_23A0DD64C();
          sub_23A0DD628();
          swift_bridgeObjectRelease();
          goto LABEL_100;
        }
        v105 = sub_23A0DD55C();
        if ((sub_23A0DD55C() & 1) != 0)
          v106 = 0x10000;
        else
          v106 = 0;
        if ((v105 & 1) != 0)
          v107 = 256;
        else
          v107 = 0;
        (*(void (**)(_QWORD, uint64_t, uint64_t))(v50 + 88))(v107 | v106 | v104, v103, v50);
        v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v154;
        v108 = v165;
        sub_23A0DD58C();
        if (!v108)
        {
          v63 = v158;
          v102(v66, 0, 1, v158);
          v84 = (uint64_t)v66;
LABEL_71:
          v60 = (uint64_t)v166;
          goto LABEL_72;
        }
        goto LABEL_82;
      }
      if (v51 == 0x3B97179C438E7D3FLL)
      {
        v85 = v164[6];
        v86 = v164[7];
        __swift_project_boxed_opaque_existential_1(v164 + 3, v85);
        v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))(*(uint64_t (**)(uint64_t, uint64_t))(v86 + 16))(v85, v86);
        v87 = v147;
        v88 = v165;
        sub_23A0DD58C();
        if (v88)
          goto LABEL_82;
        v63 = v158;
        ((void (*)(char *, _QWORD, uint64_t, uint64_t))v50)(v87, 0, 1, v158);
LABEL_89:
        v121 = (uint64_t)v87;
        v60 = (uint64_t)v166;
        goto LABEL_90;
      }
      v60 = (uint64_t)v166;
      if (v51 != 0x4AEFB38382AAD867)
        goto LABEL_99;
      v126 = v164[6];
      v127 = v164[7];
      __swift_project_boxed_opaque_existential_1(v164 + 3, v126);
      v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))(*(uint64_t (**)(uint64_t, uint64_t))(v127 + 128))(v126, v127);
      v128 = v155;
      v53 = v167;
      v129 = v165;
      sub_23A0DD58C();
      if (v129)
        goto LABEL_83;
      v63 = v158;
      ((void (*)(char *, _QWORD, uint64_t, uint64_t))v50)(v128, 0, 1, v158);
      v101 = (uint64_t)v128;
LABEL_59:
      sub_23A0DAD70(v101, v60);
      v62 = v159;
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v159 + 48))(v60, 1, v63))
        goto LABEL_60;
      goto LABEL_93;
    }
    v53 = v167;
    if (v51 <= 0x2FCE95A5051B2A82)
    {
      v60 = (uint64_t)v166;
      if (v51 == 0x27639B712DF9D8DELL)
      {
        v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v50;
        v71 = v164[6];
        v72 = v164[7];
        __swift_project_boxed_opaque_existential_1(v164 + 3, v71);
        (*(void (**)(uint64_t, uint64_t))(v72 + 64))(v71, v72);
        v73 = (uint64_t)v151;
        v74 = v165;
        sub_23A0DD58C();
        if (v74)
          goto LABEL_83;
        v63 = v158;
        v66(v73, 0, 1, v158);
        sub_23A0DAD70(v73, v60);
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v159 + 48))(v60, 1, v63))
        {
          sub_23A0DD5D4();
          sub_23A0DD5D4();
        }
LABEL_73:
        v62 = v159;
        goto LABEL_93;
      }
      if (v51 != 0x2D198AE7D7D567D8)
        goto LABEL_99;
      v109 = (void (*)(char *, _QWORD, uint64_t, uint64_t))v50;
      v110 = v164[6];
      v111 = v164[7];
      __swift_project_boxed_opaque_existential_1(v164 + 3, v110);
      v53 = v167;
      LODWORD(v50) = sub_23A0DD574();
      v112 = sub_23A0DAA58(v50);
      if (v112 == 42)
        goto LABEL_101;
      v113 = v112;
      v114 = sub_23A0DD55C();
      v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))(*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v111 + 120))(v113, v114 & 1, v110, v111);
      v115 = v156;
      v116 = v165;
      sub_23A0DD58C();
      if (v116)
        goto LABEL_82;
      v63 = v158;
      v109(v115, 0, 1, v158);
      v101 = (uint64_t)v115;
      v60 = (uint64_t)v166;
      goto LABEL_59;
    }
    v60 = (uint64_t)v166;
    if (v51 != 0x2FCE95A5051B2A83)
    {
      if (v51 != 0x2FECE9015A139163)
        goto LABEL_99;
      v117 = v164[6];
      v118 = v164[7];
      __swift_project_boxed_opaque_existential_1(v164 + 3, v117);
      v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))(*(uint64_t (**)(uint64_t, uint64_t))(v118 + 80))(v117, v118);
      v119 = v153;
      v53 = v167;
      v120 = v165;
      sub_23A0DD58C();
      if (v120)
        goto LABEL_83;
      v63 = v158;
      ((void (*)(char *, _QWORD, uint64_t, uint64_t))v50)(v119, 0, 1, v158);
      v121 = (uint64_t)v119;
LABEL_90:
      sub_23A0DAD70(v121, v60);
      v62 = v159;
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v159 + 48))(v60, 1, v63))
        sub_23A0DD5A4();
      goto LABEL_93;
    }
    v81 = v164[6];
    v82 = v164[7];
    __swift_project_boxed_opaque_existential_1(v164 + 3, v81);
    (*(void (**)(uint64_t, uint64_t))(v82 + 56))(v81, v82);
    v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v150;
    v83 = v165;
    sub_23A0DD58C();
    if (v83)
      goto LABEL_83;
LABEL_26:
    v63 = v158;
    ((void (*)(_QWORD, _QWORD, uint64_t, uint64_t))v50)(v66, 0, 1, v158);
    v84 = (uint64_t)v66;
LABEL_72:
    sub_23A0DAD70(v84, v60);
    goto LABEL_73;
  }
  v65 = (char *)v50;
  v50 = (uint64_t)v38;
  v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v160;
  v67 = v161;
  if (v51 <= (uint64_t)0xD571083EBEDFAEF8)
  {
    if (v51 > (uint64_t)0x92C89C79D4633700)
    {
      v50 = (uint64_t)v65;
      if (v51 != 0x92C89C79D4633701)
      {
        if (v51 != 0xAA9E7E89658C60C7)
          goto LABEL_99;
        v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v164[6];
        v137 = v164[7];
        __swift_project_boxed_opaque_existential_1(v164 + 3, (uint64_t)v66);
        (*(void (**)(void (*)(uint64_t, _QWORD, uint64_t, uint64_t), uint64_t))(v137 + 72))(v66, v137);
        v53 = v167;
        v138 = v165;
        sub_23A0DD58C();
        if (!v138)
        {
          v63 = v158;
          ((void (*)(char *, _QWORD, uint64_t, uint64_t))v50)(v23, 0, 1, v158);
          v84 = (uint64_t)v23;
          goto LABEL_71;
        }
LABEL_82:
        v60 = (uint64_t)v166;
        goto LABEL_83;
      }
      v160 = v65;
      v89 = v164[6];
      v90 = v164[7];
      __swift_project_boxed_opaque_existential_1(v164 + 3, v89);
      v91 = sub_23A0DD580();
      v92 = v165;
      v93 = sub_23A0DA81C(0, v91);
      LODWORD(v50) = sub_23A0DD574();
      v94 = sub_23A0DD574();
      v95 = sub_23A0DD574();
      if (v95 == 1)
      {
        v96 = 0;
      }
      else
      {
        v143 = v95;
        if (v95 != 2)
        {
          v169 = 0;
          v170 = 0xE000000000000000;
          sub_23A0DD634();
          swift_bridgeObjectRelease();
          v169 = 0xD00000000000002BLL;
          v170 = 0x800000023A0DDEE0;
          LODWORD(v171) = v143;
          sub_23A0DD64C();
          sub_23A0DD628();
          swift_bridgeObjectRelease();
          goto LABEL_100;
        }
        v96 = 1;
      }
      v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))(*(uint64_t (**)(unint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(v90 + 112))(v93, v50 | (unint64_t)(v94 << 32), v96, v89, v90);
      swift_bridgeObjectRelease();
      v87 = v148;
      v53 = v167;
      sub_23A0DD58C();
      if (v92)
        goto LABEL_82;
      v63 = v158;
      ((void (*)(char *, _QWORD, uint64_t, uint64_t))v160)(v87, 0, 1, v158);
      goto LABEL_89;
    }
    v50 = (uint64_t)v65;
    if (v51 != 0x8459910482DE32B0)
    {
      if (v51 != 0x8BBD137760ACEDA0)
        goto LABEL_99;
      v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v164[6];
      v130 = v164[7];
      __swift_project_boxed_opaque_existential_1(v164 + 3, (uint64_t)v66);
      (*(void (**)(void (*)(uint64_t, _QWORD, uint64_t, uint64_t), uint64_t))(v130 + 48))(v66, v130);
      v131 = v165;
      sub_23A0DD58C();
      if (!v131)
      {
        v63 = v158;
        ((void (*)(char *, _QWORD, uint64_t, uint64_t))v50)(v30, 0, 1, v158);
        v60 = (uint64_t)v166;
        sub_23A0DAD70((uint64_t)v30, (uint64_t)v166);
        v62 = v159;
        v53 = v167;
        goto LABEL_93;
      }
      v53 = v167;
      goto LABEL_82;
    }
    v68 = v164[6];
    v69 = v164[7];
    __swift_project_boxed_opaque_existential_1(v164 + 3, v68);
    (*(void (**)(uint64_t, uint64_t))(v69 + 96))(v68, v69);
    v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v16;
    v53 = v167;
    v70 = v165;
    sub_23A0DD58C();
    v60 = (uint64_t)v166;
    if (v70)
      goto LABEL_83;
    goto LABEL_26;
  }
  v60 = (uint64_t)v166;
  if (v51 > (uint64_t)0xE9AA53E884DC53ECLL)
  {
    if (v51 != 0xE9AA53E884DC53EDLL)
    {
      if (v51 == 0x31EB8B1F9F153B4)
      {
        v139 = (void (*)(char *, _QWORD, uint64_t, uint64_t))v65;
        v140 = v164[6];
        v141 = v164[7];
        __swift_project_boxed_opaque_existential_1(v164 + 3, v140);
        v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))(*(uint64_t (**)(uint64_t, uint64_t))(v141 + 32))(v140, v141);
        v53 = v167;
        v142 = v165;
        sub_23A0DD58C();
        if (!v142)
        {
          v63 = v158;
          v139(v35, 0, 1, v158);
          sub_23A0DAD70((uint64_t)v35, v60);
          v62 = v159;
          if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v159 + 48))(v60, 1, v63))
            sub_23A0DD5A4();
          goto LABEL_93;
        }
        goto LABEL_83;
      }
      goto LABEL_99;
    }
    v160 = v65;
    v97 = v164[6];
    v98 = v164[7];
    __swift_project_boxed_opaque_existential_1(v164 + 3, v97);
    v53 = v167;
    v99 = sub_23A0DD55C();
    v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))(*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v98 + 136))(v99 & 1, v97, v98);
    v100 = v165;
    sub_23A0DD58C();
    if (v100)
      goto LABEL_83;
    v63 = v158;
    ((void (*)(char *, _QWORD, uint64_t, uint64_t))v160)(v67, 0, 1, v158);
    v101 = (uint64_t)v67;
    goto LABEL_59;
  }
  if (v51 != 0xD571083EBEDFAEF9)
  {
    if (v51 == 0xE4883D286D903511)
    {
      v132 = (void (*)(_QWORD, _QWORD, uint64_t, uint64_t))v65;
      v133 = v164[6];
      v134 = v164[7];
      __swift_project_boxed_opaque_existential_1(v164 + 3, v133);
      v53 = v167;
      v135 = sub_23A0DD55C();
      (*(void (**)(uint64_t *__return_ptr, _QWORD, uint64_t, uint64_t))(v134 + 104))(&v168, v135 & 1, v133, v134);
      v136 = v165;
      sub_23A0DD58C();
      if (!v136)
      {
        v63 = v158;
        v132(v66, 0, 1, v158);
        sub_23A0DAD70((uint64_t)v66, v60);
        v62 = v159;
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v159 + 48))(v60, 1, v63))
        {
          sub_23A0DD5D4();
          sub_23A0DD5D4();
          sub_23A0DD5B0();
          sub_23A0DD5D4();
          sub_23A0DD5BC();
          sub_23A0DD5BC();
          sub_23A0DD5BC();
          sub_23A0DD5E0();
          sub_23A0DD5E0();
        }
        goto LABEL_93;
      }
      goto LABEL_83;
    }
LABEL_99:
    v169 = 0;
    v170 = 0xE000000000000000;
    sub_23A0DD634();
    sub_23A0DD628();
    v171 = v52;
    sub_23A0DD64C();
    sub_23A0DD628();
    swift_bridgeObjectRelease();
    goto LABEL_100;
  }
  v75 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v65;
  v76 = v164[6];
  v77 = v164[7];
  __swift_project_boxed_opaque_existential_1(v164 + 3, v76);
  v53 = v167;
  v78 = sub_23A0DD580();
  v79 = sub_23A0DD580();
  v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v77 + 24))(v78, v79, v76, v77);
  v80 = v165;
  sub_23A0DD58C();
  if (v80)
    goto LABEL_82;
  v63 = v158;
  v75(v50, 0, 1, v158);
  v60 = (uint64_t)v166;
  sub_23A0DAD70(v50, (uint64_t)v166);
  v62 = v159;
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v159 + 48))(v60, 1, v63))
  {
    sub_23A0DD5D4();
    v62 = v159;
LABEL_60:
    sub_23A0DD5D4();
  }
LABEL_93:
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v60, 1, v63))
  {
    (*(void (**)(char *, uint64_t))(v162 + 8))(v53, v163);
    v66 = 0;
  }
  else
  {
    v144 = v157;
    (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v157, v60, v63);
    v66 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))sub_23A0DD5EC();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v144, v63);
    (*(void (**)(char *, uint64_t))(v162 + 8))(v53, v163);
  }
  sub_23A0DAD30(v60);
  return v66;
}

uint64_t sub_23A0DA6D8()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocClassInstance();
}

void (*sub_23A0DA704(char *a1))(uint64_t, _QWORD, uint64_t, uint64_t)
{
  return sub_23A0D9280(a1);
}

uint64_t sub_23A0DA724()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SiriVoiceTriggerService()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for SiriVoiceTriggerService.Service()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for SiriVoiceTriggerService.Server()
{
  return objc_opt_self();
}

unint64_t sub_23A0DA798()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569425D8;
  if (!qword_2569425D8)
  {
    v1 = type metadata accessor for SiriVoiceTriggerService.Server();
    result = MEMORY[0x23B840A10](&unk_23A0DDB60, v1);
    atomic_store(result, (unint64_t *)&qword_2569425D8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B840A04]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23A0DA81C(unint64_t result, unint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v3 = result;
  v4 = a2 - result;
  if (a2 < result)
  {
    if ((uint64_t)(result - a2) < 0)
    {
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
    v4 = a2 - result;
LABEL_5:
    v5 = MEMORY[0x24BEE4AF8];
    if (!v4)
      return v5;
    v12 = MEMORY[0x24BEE4AF8];
    result = (unint64_t)sub_23A0DA934(0, v4 & ~(v4 >> 63), 0);
    v6 = a2 >= v3;
    v7 = a2 - v3;
    if (v6 && (v4 & 0x8000000000000000) == 0)
    {
      v5 = v12;
      while (1)
      {
        result = sub_23A0DD568();
        v9 = v8;
        v11 = *(_QWORD *)(v12 + 16);
        v10 = *(_QWORD *)(v12 + 24);
        if (v11 >= v10 >> 1)
          result = (unint64_t)sub_23A0DA934((char *)(v10 > 1), v11 + 1, 1);
        *(_QWORD *)(v12 + 16) = v11 + 1;
        *(_DWORD *)(v12 + 4 * v11 + 32) = v9;
        if (!v7)
          break;
        --v7;
        if (!--v4)
          return v5;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_17;
  }
  if ((uint64_t)(a2 - result) >= 0)
    goto LABEL_5;
LABEL_18:
  __break(1u);
  return result;
}

char *sub_23A0DA934(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_23A0DA950(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_23A0DA950(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569425F0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_23A0DAA48(uint64_t result)
{
  if (result >= 4)
    return 4;
  else
    return result;
}

uint64_t sub_23A0DAA58(int a1)
{
  uint64_t result;

  if (a1 > 699)
  {
    if (a1 > 1399)
    {
      if (a1 <= 1799)
      {
        if (a1 <= 1499)
        {
          if (a1 == 1400)
            return 31;
          if (a1 == 1401)
            return 32;
        }
        else
        {
          switch(a1)
          {
            case 1500:
              return 33;
            case 1600:
              return 34;
            case 1700:
              return 35;
          }
        }
      }
      else if (a1 > 2099)
      {
        switch(a1)
        {
          case 2100:
            return 39;
          case 2101:
            return 40;
          case 2102:
            return 41;
        }
      }
      else
      {
        switch(a1)
        {
          case 1800:
            return 36;
          case 1900:
            return 37;
          case 2000:
            return 38;
        }
      }
    }
    else
    {
      if (a1 <= 900)
      {
        switch(a1)
        {
          case 700:
            result = 20;
            break;
          case 701:
            result = 21;
            break;
          case 702:
            result = 22;
            break;
          case 703:
            result = 23;
            break;
          default:
            if (a1 == 800)
            {
              result = 24;
            }
            else
            {
              if (a1 != 900)
                return 42;
              result = 25;
            }
            break;
        }
        return result;
      }
      if (a1 <= 1099)
      {
        if (a1 == 901)
          return 26;
        if (a1 == 1000)
          return 27;
      }
      else
      {
        switch(a1)
        {
          case 1100:
            return 28;
          case 1200:
            return 29;
          case 1300:
            return 30;
        }
      }
    }
    return 42;
  }
  if (a1 <= 299)
  {
    switch(a1)
    {
      case 100:
        return 0;
      case 101:
        return 1;
      case 200:
        return 2;
    }
    return 42;
  }
  switch(a1)
  {
    case 300:
      result = 3;
      break;
    case 301:
      result = 4;
      break;
    case 302:
      result = 5;
      break;
    case 303:
    case 304:
    case 305:
    case 306:
    case 307:
    case 308:
    case 309:
    case 310:
    case 311:
    case 312:
    case 313:
    case 314:
    case 315:
    case 316:
    case 317:
    case 318:
    case 319:
    case 320:
    case 321:
    case 322:
    case 323:
    case 324:
    case 325:
    case 326:
    case 327:
    case 328:
    case 329:
    case 330:
    case 331:
    case 332:
    case 333:
    case 334:
    case 335:
    case 336:
    case 337:
    case 338:
    case 339:
    case 340:
    case 341:
    case 342:
    case 343:
    case 344:
    case 345:
    case 346:
    case 347:
    case 348:
    case 349:
    case 350:
    case 351:
    case 352:
    case 353:
    case 354:
    case 355:
    case 356:
    case 357:
    case 358:
    case 359:
    case 360:
    case 361:
    case 362:
    case 363:
    case 364:
    case 365:
    case 366:
    case 367:
    case 368:
    case 369:
    case 370:
    case 371:
    case 372:
    case 373:
    case 374:
    case 375:
    case 376:
    case 377:
    case 378:
    case 379:
    case 380:
    case 381:
    case 382:
    case 383:
    case 384:
    case 385:
    case 386:
    case 387:
    case 388:
    case 389:
    case 390:
    case 391:
    case 392:
    case 393:
    case 394:
    case 395:
    case 396:
    case 397:
    case 398:
    case 399:
      return 42;
    case 400:
      result = 6;
      break;
    case 401:
      result = 7;
      break;
    case 402:
      result = 8;
      break;
    case 403:
      result = 9;
      break;
    case 404:
      result = 10;
      break;
    case 405:
      result = 11;
      break;
    case 406:
      result = 12;
      break;
    case 407:
      result = 13;
      break;
    case 408:
      result = 14;
      break;
    default:
      switch(a1)
      {
        case 500:
          result = 15;
          break;
        case 501:
          result = 16;
          break;
        case 502:
          result = 17;
          break;
        case 503:
          result = 18;
          break;
        default:
          if (a1 != 600)
            return 42;
          result = 19;
          break;
      }
      break;
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

uint64_t sub_23A0DAD30(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569425E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A0DAD70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569425E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
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

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriAudioProvidingError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SiriAudioProvidingError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A0DAEC8 + 4 * byte_23A0DDADA[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23A0DAEFC + 4 * byte_23A0DDAD5[v4]))();
}

uint64_t sub_23A0DAEFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A0DAF04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A0DAF0CLL);
  return result;
}

uint64_t sub_23A0DAF18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A0DAF20);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23A0DAF24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A0DAF2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A0DAF38(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A0DAF44(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriAudioProvidingError()
{
  return &type metadata for SiriAudioProvidingError;
}

unint64_t sub_23A0DAF60()
{
  unint64_t result;

  result = qword_2569425F8;
  if (!qword_2569425F8)
  {
    result = MEMORY[0x23B840A10](&unk_23A0DDCB0, &type metadata for SiriAudioProvidingError);
    atomic_store(result, (unint64_t *)&qword_2569425F8);
  }
  return result;
}

unint64_t sub_23A0DAFA4()
{
  unint64_t result;

  result = qword_256942600;
  if (!qword_256942600)
  {
    result = MEMORY[0x23B840A10](&unk_23A0DDC38, &type metadata for SiriAudioProvidingError);
    atomic_store(result, (unint64_t *)&qword_256942600);
  }
  return result;
}

unint64_t sub_23A0DAFE8()
{
  unint64_t result;

  result = qword_256942608;
  if (!qword_256942608)
  {
    result = MEMORY[0x23B840A10](MEMORY[0x24BEE4540], MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_256942608);
  }
  return result;
}

void sub_23A0DBC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23A0DC2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23A0DC620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unsigned __int8 *f32__v_visit(unsigned __int8 *result, uint64_t a2)
{
  _QWORD *v3;
  int v4;
  unint64_t v5;
  unint64_t v6;

  v3 = result;
  v4 = *result;
  if (v4 != 1)
  {
    if (v4 != 2)
    {
      if (v4 == 3)
      {
        if (*((_QWORD *)result + 2))
        {
          v5 = 0;
          do
          {
            result = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, unint64_t, float))(a2 + 16))(a2, v5, *(float *)(v3[1] + 4 * v5));
            ++v5;
          }
          while (v5 < v3[2]);
        }
        return result;
      }
      printf("TB_FATAL: invalid tag in array metadata: 0x%x (%s:%d)\n", v4, "/Library/Caches/com.apple.xbs/Binaries/CoreSpeech_Common/install/TempContent/Objects/CoreSpeech.build/CoreSpeechExclave.build/DerivedSources/CoreSpeechExclave_C.c", 824);
      _os_crash();
      __break(1u);
LABEL_16:
      result = (unsigned __int8 *)_os_crash();
      __break(1u);
      return result;
    }
    result = (unsigned __int8 *)tb_message_subrange();
    if (!(_DWORD)result)
      return result;
    _os_crash();
    __break(1u);
  }
  tb_transport_message_buffer_wrap_buffer();
  if (tb_message_construct())
    goto LABEL_16;
  result = (unsigned __int8 *)tb_message_configure_recieved();
  if (v3[3])
  {
    v6 = 0;
    do
    {
      tb_message_decode_f32();
      result = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, unint64_t, float))(a2 + 16))(a2, v6++, 0.0);
    }
    while (v6 < v3[3]);
  }
  return result;
}

uint64_t __f32__v_visit_block_invoke(uint64_t a1)
{
  unint64_t v2;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32))
  {
    v2 = 0;
    do
    {
      tb_message_decode_f32();
      (*(void (**)(float))(*(_QWORD *)(a1 + 32) + 16))(0.0);
      ++v2;
    }
    while (v2 < *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  }
  return 0;
}

uint64_t __f32__v_sizeof_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t __f32__v_encode_block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __f32__v_encode_block_invoke_2()
{
  return tb_message_encode_f32();
}

uint64_t corespeechexclave_sirivoicetriggerservice_bargeinprocess()
{
  uint64_t result;

  result = tb_client_connection_message_construct();
  if (!(_DWORD)result)
  {
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    return tb_client_connection_message_destruct();
  }
  return result;
}

uint64_t sub_23A0DD55C()
{
  return MEMORY[0x24BEB6DE8]();
}

uint64_t sub_23A0DD568()
{
  return MEMORY[0x24BEB6E08]();
}

uint64_t sub_23A0DD574()
{
  return MEMORY[0x24BEB6E30]();
}

uint64_t sub_23A0DD580()
{
  return MEMORY[0x24BEB6E38]();
}

uint64_t sub_23A0DD58C()
{
  return MEMORY[0x24BEB6E50]();
}

uint64_t sub_23A0DD598()
{
  return MEMORY[0x24BEB6E68]();
}

uint64_t sub_23A0DD5A4()
{
  return MEMORY[0x24BEB6E70]();
}

uint64_t sub_23A0DD5B0()
{
  return MEMORY[0x24BEB6E78]();
}

uint64_t sub_23A0DD5BC()
{
  return MEMORY[0x24BEB6E80]();
}

uint64_t sub_23A0DD5C8()
{
  return MEMORY[0x24BEB6E88]();
}

uint64_t sub_23A0DD5D4()
{
  return MEMORY[0x24BEB6E90]();
}

uint64_t sub_23A0DD5E0()
{
  return MEMORY[0x24BEB6EA8]();
}

uint64_t sub_23A0DD5EC()
{
  return MEMORY[0x24BEB6EB0]();
}

uint64_t sub_23A0DD5F8()
{
  return MEMORY[0x24BEB6EC0]();
}

uint64_t sub_23A0DD604()
{
  return MEMORY[0x24BEB6EF0]();
}

uint64_t sub_23A0DD610()
{
  return MEMORY[0x24BEB6F10]();
}

uint64_t sub_23A0DD61C()
{
  return MEMORY[0x24BEB6F20]();
}

uint64_t sub_23A0DD628()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A0DD634()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A0DD640()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23A0DD64C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A0DD658()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A0DD664()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A0DD670()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A0DD67C()
{
  return MEMORY[0x24BEE3F18]();
}

uint64_t sub_23A0DD688()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A0DD694()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23A0DD6A0()
{
  return MEMORY[0x24BEE4328]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x24BDAF4E8]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t tb_client_connection_activate()
{
  return MEMORY[0x24BEB6F70]();
}

uint64_t tb_client_connection_create_with_endpoint()
{
  return MEMORY[0x24BEB6F78]();
}

uint64_t tb_client_connection_message_construct()
{
  return MEMORY[0x24BEB6F90]();
}

uint64_t tb_client_connection_message_destruct()
{
  return MEMORY[0x24BEB6FA0]();
}

uint64_t tb_conclave_endpoint_for_service()
{
  return MEMORY[0x24BEB6FB0]();
}

uint64_t tb_connection_send_query()
{
  return MEMORY[0x24BEB6FB8]();
}

uint64_t tb_message_complete()
{
  return MEMORY[0x24BEB6FD0]();
}

uint64_t tb_message_configure_recieved()
{
  return MEMORY[0x24BEB6FE0]();
}

uint64_t tb_message_construct()
{
  return MEMORY[0x24BEB6FE8]();
}

uint64_t tb_message_decode_BOOL()
{
  return MEMORY[0x24BEB6FF8]();
}

uint64_t tb_message_decode_f32()
{
  return MEMORY[0x24BEB7008]();
}

uint64_t tb_message_decode_f64()
{
  return MEMORY[0x24BEB7010]();
}

uint64_t tb_message_decode_u32()
{
  return MEMORY[0x24BEB7018]();
}

uint64_t tb_message_decode_u64()
{
  return MEMORY[0x24BEB7030]();
}

uint64_t tb_message_decode_u8()
{
  return MEMORY[0x24BEB7038]();
}

uint64_t tb_message_encode_BOOL()
{
  return MEMORY[0x24BEB7048]();
}

uint64_t tb_message_encode_f32()
{
  return MEMORY[0x24BEB7058]();
}

uint64_t tb_message_encode_u32()
{
  return MEMORY[0x24BEB7088]();
}

uint64_t tb_message_encode_u64()
{
  return MEMORY[0x24BEB70A0]();
}

uint64_t tb_message_subrange()
{
  return MEMORY[0x24BEB70B0]();
}

uint64_t tb_transport_message_buffer_wrap_buffer()
{
  return MEMORY[0x24BEB70B8]();
}


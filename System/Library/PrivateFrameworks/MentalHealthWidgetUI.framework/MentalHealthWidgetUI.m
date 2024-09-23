uint64_t sub_2419023CC()
{
  return swift_deallocClassInstance();
}

uint64_t _s8SentinelCMa()
{
  return objc_opt_self();
}

id sub_2419023FC()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  _s8SentinelCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_254391B78 = (uint64_t)result;
  return result;
}

void sub_241902450()
{
  qword_25715E1E0 = 0x40AC200000000000;
}

double sub_241902464()
{
  double result;

  if (qword_25715E1D0 != -1)
    swift_once();
  result = *(double *)&qword_25715E1E0 * 24.0;
  *(double *)&qword_25715E1E8 = *(double *)&qword_25715E1E0 * 24.0;
  return result;
}

uint64_t sub_2419024B4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2419024D0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2419024D0(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  size_t v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
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
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  sub_241903588(0, (unint64_t *)&qword_25715E1F0, (uint64_t (*)(uint64_t))sub_241902988, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  sub_241902988();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = (_QWORD *)swift_allocObject();
  v15 = _swift_stdlib_malloc_size(v14);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v15 - v13 == 0x8000000000000000 && v12 == -1)
    goto LABEL_34;
  v14[2] = v8;
  v14[3] = 2 * ((uint64_t)(v15 - v13) / v12);
LABEL_19:
  sub_241902988();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = (char *)v14 + v19;
  v21 = (char *)a4 + v19;
  if ((a1 & 1) != 0)
  {
    if (v14 < a4 || v20 >= &v21[*(_QWORD *)(v18 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v14 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v22 = *(_QWORD *)(v18 + 72) * v8;
  v23 = &v20[v22];
  v24 = (unint64_t)&v21[v22];
  if (v21 >= v23 || (unint64_t)v20 >= v24)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v14;
  }
LABEL_36:
  result = sub_24190995C();
  __break(1u);
  return result;
}

uint64_t sub_2419026C4(uint64_t a1)
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
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  unint64_t v22;
  unint64_t v23;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;

  v2 = sub_2419095A8();
  MEMORY[0x24BDAC7A8](v2);
  v30 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_24190962C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v25 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v25 - v12;
  sub_241902988();
  v29 = v14;
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v31 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(_QWORD *)(a1 + 16);
  v18 = MEMORY[0x24BEE4AF8];
  if (v17)
  {
    v32 = MEMORY[0x24BEE4AF8];
    sub_2419024B4(0, v17, 0);
    v19 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v20 = *(_QWORD *)(v5 + 72);
    v26 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v27 = v20;
    v28 = v5;
    do
    {
      v26(v13, v19, v4);
      if (qword_25715E1D0 != -1)
        swift_once();
      sub_241909614();
      sub_241909614();
      sub_241909590();
      v21 = *(void (**)(char *, uint64_t))(v5 + 8);
      v21(v8, v4);
      v21(v11, v4);
      sub_241909824();
      v21(v13, v4);
      v18 = v32;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2419024B4(0, *(_QWORD *)(v18 + 16) + 1, 1);
        v18 = v32;
      }
      v23 = *(_QWORD *)(v18 + 16);
      v22 = *(_QWORD *)(v18 + 24);
      if (v23 >= v22 >> 1)
      {
        sub_2419024B4(v22 > 1, v23 + 1, 1);
        v18 = v32;
      }
      *(_QWORD *)(v18 + 16) = v23 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v18+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(_QWORD *)(v15 + 72) * v23, v31, v29);
      v32 = v18;
      v5 = v28;
      v19 += v27;
      --v17;
    }
    while (v17);
  }
  return v18;
}

void sub_241902988()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254391A40)
  {
    v0 = sub_241909830();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254391A40);
  }
}

unint64_t sub_2419029E4(uint64_t a1, char *a2)
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
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
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
  char *v36;
  void (*v37)(char *, char *, uint64_t);
  unint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  unsigned int (*v55)(uint64_t, uint64_t, uint64_t);
  void (*v56)(char *, uint64_t, uint64_t);
  char *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  _QWORD *v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  os_log_type_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char *v96;
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  unsigned int v106;
  void (*v107)(char *, char *, uint64_t);
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  unsigned int v112;
  unsigned int v113;
  void (*v114)(char *, _QWORD, uint64_t);
  unsigned int v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  char *v129;
  char *v130;
  uint64_t v131;
  char *v132;
  _QWORD *v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;

  v126 = a1;
  v102 = sub_2419095E4();
  v101 = *(_QWORD *)(v102 - 8);
  MEMORY[0x24BDAC7A8](v102);
  v97 = (char *)&v96 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = sub_2419096EC();
  v99 = *(_QWORD *)(v100 - 8);
  v4 = MEMORY[0x24BDAC7A8](v100);
  v98 = (char *)&v96 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v96 = (char *)&v96 - v6;
  v111 = sub_24190968C();
  v110 = *(_QWORD *)(v111 - 8);
  MEMORY[0x24BDAC7A8](v111);
  v109 = (char *)&v96 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24190965C();
  v124 = *(_QWORD *)(v8 - 8);
  v125 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v123 = (char *)&v96 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_241909668();
  v121 = *(_QWORD *)(v10 - 8);
  v122 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v120 = (char *)&v96 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = sub_241909650();
  v12 = *(_QWORD *)(v119 - 8);
  MEMORY[0x24BDAC7A8](v119);
  v117 = (char *)&v96 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241903588(0, &qword_254391A28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BEE1C68]);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v105 = (char *)&v96 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v116 = (uint64_t)&v96 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v131 = (uint64_t)&v96 - v19;
  v20 = sub_24190962C();
  v21 = *(_QWORD **)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v96 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v22);
  v130 = (char *)&v96 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v129 = (char *)&v96 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v96 - v29;
  v31 = sub_241909638();
  v32 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v34 = (char *)&v96 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = sub_241909698();
  v103 = *(_QWORD *)(v104 - 8);
  MEMORY[0x24BDAC7A8](v104);
  v36 = (char *)&v96 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v32 + 104))(v34, *MEMORY[0x24BDCEF70], v31);
  v132 = v36;
  sub_241909644();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v31);
  v37 = (void (*)(char *, char *, uint64_t))v21[2];
  v135 = v20;
  v107 = v37;
  v37(v30, a2, v20);
  v115 = *MEMORY[0x24BDCF020];
  v118 = v12;
  v114 = *(void (**)(char *, _QWORD, uint64_t))(v12 + 104);
  v113 = *MEMORY[0x24BDCF0B0];
  v112 = *MEMORY[0x24BDCF068];
  v106 = *MEMORY[0x24BDCF220];
  v38 = MEMORY[0x24BEE4AF8];
  v39 = 7;
  v133 = v21;
  v127 = v30;
  v108 = v24;
  while (1)
  {
    v134 = v38;
    v128 = v39;
    v44 = v117;
    v45 = v119;
    v114(v117, v115, v119);
    v47 = v121;
    v46 = v122;
    v48 = v120;
    (*(void (**)(char *, _QWORD, uint64_t))(v121 + 104))(v120, v113, v122);
    v49 = v123;
    v50 = v124;
    v51 = v125;
    (*(void (**)(char *, _QWORD, uint64_t))(v124 + 104))(v123, v112, v125);
    v52 = v131;
    sub_241909680();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v49, v51);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v46);
    (*(void (**)(char *, uint64_t))(v118 + 8))(v44, v45);
    v53 = v116;
    sub_2419035E0(v52, v116);
    v54 = v133;
    v55 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v133[6];
    if (v55(v53, 1, v135) == 1)
      break;
    v56 = (void (*)(char *, uint64_t, uint64_t))v54[4];
    v57 = v129;
    v58 = v53;
    v59 = v135;
    v56(v129, v58, v135);
    v107(v130, v57, v59);
    v60 = v134;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v60 = sub_2419081DC(0, *(_QWORD *)(v60 + 16) + 1, 1, v60);
    v61 = (uint64_t)v105;
    v63 = *(_QWORD *)(v60 + 16);
    v62 = *(_QWORD *)(v60 + 24);
    if (v63 >= v62 >> 1)
      v60 = sub_2419081DC(v62 > 1, v63 + 1, 1, v60);
    *(_QWORD *)(v60 + 16) = v63 + 1;
    v64 = v133;
    v65 = (*((unsigned __int8 *)v64 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v64 + 80);
    v134 = v60;
    v66 = v60 + v65 + v133[9] * v63;
    v67 = v135;
    v56((char *)v66, (uint64_t)v130, v135);
    v68 = v110;
    v69 = v109;
    v70 = v111;
    (*(void (**)(char *, _QWORD, uint64_t))(v110 + 104))(v109, v106, v111);
    v71 = v127;
    sub_241909674();
    (*(void (**)(char *, uint64_t))(v68 + 8))(v69, v70);
    if (v55(v61, 1, v67) == 1)
    {
      v72 = v131;
      v42 = v108;
      if (qword_25715E1D8 != -1)
        swift_once();
      v43 = v127;
      sub_241909614();
      v40 = (void (*)(char *, uint64_t))v133[1];
      v73 = v135;
      v40(v129, v135);
      sub_24190363C(v72);
      v40(v43, v73);
      sub_24190363C(v61);
    }
    else
    {
      v40 = (void (*)(char *, uint64_t))v64[1];
      v41 = v135;
      v40(v129, v135);
      sub_24190363C(v131);
      v40(v71, v41);
      v42 = v108;
      v56(v108, v61, v41);
      v43 = v71;
    }
    v38 = v134;
    v56(v43, (uint64_t)v42, v135);
    v39 = v128 - 1;
    if (v128 == 1)
    {
      v40(v43, v135);
      (*(void (**)(char *, uint64_t))(v103 + 8))(v132, v104);
      return v38;
    }
  }
  sub_24190363C(v53);
  v74 = sub_2419095C0();
  v75 = v98;
  v76 = v97;
  if ((v77 & 1) == 0)
  {
    v78 = v74;
    v79 = sub_2419095CC();
    if ((v80 & 1) == 0)
    {
      v81 = v79;
      v75 = v96;
      sub_2419096D4();
      v82 = sub_2419096E0();
      v83 = sub_2419098CC();
      if (os_log_type_enabled(v82, v83))
      {
        v84 = swift_slowAlloc();
        v85 = swift_slowAlloc();
        v137 = v85;
        *(_DWORD *)v84 = 136315650;
        v136 = sub_24190862C(0xD00000000000001CLL, 0x8000000241909C80, &v137);
        sub_2419098FC();
        *(_WORD *)(v84 + 12) = 2048;
        v136 = v78;
        sub_2419098FC();
        *(_WORD *)(v84 + 22) = 2048;
        v136 = v81;
        sub_2419098FC();
        _os_log_impl(&dword_241900000, v82, v83, "[%s] Next Date nil for scheduleTime: %ld:%ld", (uint8_t *)v84, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x24269DCA4](v85, -1, -1);
        MEMORY[0x24269DCA4](v84, -1, -1);

        (*(void (**)(char *, uint64_t))(v99 + 8))(v75, v100);
LABEL_23:
        sub_24190363C(v131);
        ((void (*)(char *, uint64_t))v54[1])(v127, v135);
        goto LABEL_24;
      }

LABEL_22:
      (*(void (**)(char *, uint64_t))(v99 + 8))(v75, v100);
      goto LABEL_23;
    }
  }
  sub_2419096D4();
  v86 = v101;
  v87 = v102;
  (*(void (**)(char *, uint64_t, uint64_t))(v101 + 16))(v76, v126, v102);
  v88 = sub_2419096E0();
  v89 = sub_2419098CC();
  if (!os_log_type_enabled(v88, v89))
  {

    (*(void (**)(char *, uint64_t))(v86 + 8))(v76, v87);
    goto LABEL_22;
  }
  v90 = swift_slowAlloc();
  v91 = swift_slowAlloc();
  v137 = v91;
  *(_DWORD *)v90 = 136315394;
  v136 = sub_24190862C(0xD00000000000001CLL, 0x8000000241909C80, &v137);
  sub_2419098FC();
  *(_WORD *)(v90 + 12) = 2080;
  sub_241903690();
  v92 = v102;
  v93 = sub_241909968();
  v136 = sub_24190862C(v93, v94, &v137);
  sub_2419098FC();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v101 + 8))(v76, v92);
  _os_log_impl(&dword_241900000, v88, v89, "[%s] DateComponent doesn't contain hour and/or minute %s", (uint8_t *)v90, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x24269DCA4](v91, -1, -1);
  MEMORY[0x24269DCA4](v90, -1, -1);

  (*(void (**)(char *, uint64_t))(v99 + 8))(v75, v100);
  sub_24190363C(v131);
  ((void (*)(char *, uint64_t))v133[1])(v127, v135);
LABEL_24:
  (*(void (**)(char *, uint64_t))(v103 + 8))(v132, v104);
  return v134;
}

void sub_241903588(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_2419035E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_241903588(0, &qword_254391A28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24190363C(uint64_t a1)
{
  uint64_t v2;

  sub_241903588(0, &qword_254391A28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_241903690()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25715E1F8;
  if (!qword_25715E1F8)
  {
    v1 = sub_2419095E4();
    result = MEMORY[0x24269DC50](MEMORY[0x24BDCBE28], v1);
    atomic_store(result, (unint64_t *)&qword_25715E1F8);
  }
  return result;
}

ValueMetadata *type metadata accessor for SOMWidgetRelevanceDateHelper()
{
  return &type metadata for SOMWidgetRelevanceDateHelper;
}

uint64_t MentalHealthLauncherComplicationView.init(overriddenWidgetFamily:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;

  *a2 = swift_getKeyPath();
  sub_241903588(0, &qword_254391940, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  swift_storeEnumTagMultiPayload();
  v4 = (uint64_t)a2 + *(int *)(type metadata accessor for MentalHealthLauncherComplicationView() + 20);
  return sub_24190455C(a1, v4);
}

uint64_t MentalHealthLauncherComplicationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int v17;
  _QWORD v20[2];

  v20[1] = a1;
  sub_241905724(0, &qword_25715E200, MEMORY[0x24BDEF380]);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v20 - v3;
  sub_2419045B8(0);
  v20[0] = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_241903588(0, &qword_254391960, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v20 - v10;
  v12 = sub_24190983C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for MentalHealthLauncherComplicationView();
  sub_2419059D0(v1 + *(int *)(v16 + 20), (uint64_t)v11, &qword_254391960, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_241905138((uint64_t)v11, &qword_254391960, MEMORY[0x24BEE1C68]);
    sub_24190489C((uint64_t)v15);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  }
  v17 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v15, v12);
  if (MEMORY[0x24BDFAEE8])
  {
    if (v17 != *MEMORY[0x24BDFAEE8] && v17 != *MEMORY[0x24BDFAF00])
      goto LABEL_6;
  }
  else if (v17 != *MEMORY[0x24BDFAF00])
  {
LABEL_6:
    swift_storeEnumTagMultiPayload();
    sub_241904AFC();
    sub_241909758();
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  sub_241903A0C((uint64_t)v7);
  sub_2419058EC((uint64_t)v7, (uint64_t)v4, (uint64_t (*)(_QWORD))sub_2419045B8);
  swift_storeEnumTagMultiPayload();
  sub_241904AFC();
  sub_241909758();
  return sub_2419058B0((uint64_t)v7, (uint64_t (*)(_QWORD))sub_2419045B8);
}

uint64_t sub_241903A0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t KeyPath;
  uint64_t *v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v19 = a1;
  v1 = sub_241909800();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BE49EA8];
  MEMORY[0x24BDAC7A8](v1);
  v3 = sub_24190980C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241904694(0);
  v18 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241905784();
  sub_2419098F0();
  sub_2419097E8();
  v20 = MEMORY[0x24BEE4AF8];
  sub_2419057C0(&qword_254391B30, v2, MEMORY[0x24BE49EB0]);
  sub_241903588(0, &qword_254391B58, v2, MEMORY[0x24BEE1250]);
  sub_241905800();
  sub_241909914();
  if (qword_254391B50 != -1)
    swift_once();
  v10 = qword_254391980;
  swift_bridgeObjectRetain();
  if (v10 != -1)
    swift_once();
  sub_2419095F0();
  sub_2419097F4();
  if (qword_254391B20 != -1)
    swift_once();
  v11 = qword_254391B18;
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v3);
  v13 = (uint64_t *)&v9[*(int *)(v18 + 36)];
  *v13 = KeyPath;
  v13[1] = v11;
  v14 = *(void (**)(char *, uint64_t))(v4 + 8);
  swift_retain();
  v14(v6, v3);
  v15 = sub_241903D1C();
  sub_241903EFC(v15, v16, v19);
  swift_bridgeObjectRelease();
  return sub_2419058B0((uint64_t)v9, (uint64_t (*)(_QWORD))sub_241904694);
}

uint64_t sub_241903D1C()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int v9;
  uint64_t v11;

  v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_241903588(0, &qword_254391960, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v11 - v2;
  v4 = sub_24190983C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MentalHealthLauncherComplicationView();
  sub_2419059D0(v0 + *(int *)(v8 + 20), (uint64_t)v3, &qword_254391960, v1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_241905138((uint64_t)v3, &qword_254391960, MEMORY[0x24BEE1C68]);
    sub_24190489C((uint64_t)v7);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  }
  v9 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (MEMORY[0x24BDFAEE8] && v9 == *MEMORY[0x24BDFAEE8])
  {
    if (qword_254391980 != -1)
      swift_once();
    return sub_2419095F0();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return 0;
  }
}

uint64_t sub_241903EFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t OpaqueTypeConformance2;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD v28[3];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;

  v28[2] = a3;
  sub_241904694(0);
  v29 = v6;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2419046B8(0, &qword_254391AE0, (uint64_t (*)(uint64_t))sub_2419045DC, v9, MEMORY[0x24BDEF380]);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)v28 - v10;
  sub_2419045DC(0);
  v13 = v12;
  v14 = *(_QWORD *)(v12 - 8);
  v15 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v28[1] = v28;
    MEMORY[0x24BDAC7A8](v15);
    v28[-2] = a1;
    v28[-1] = a2;
    sub_241904798();
    v19 = v18;
    v20 = sub_241904804();
    v30 = MEMORY[0x24BDF1FA8];
    v31 = MEMORY[0x24BDF1F80];
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v22 = v29;
    sub_2419097A0();
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v17, v13);
    swift_storeEnumTagMultiPayload();
    v30 = v22;
    v31 = v19;
    v32 = v20;
    v33 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    sub_241909758();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  else
  {
    sub_2419058EC(v3, (uint64_t)v8, (uint64_t (*)(_QWORD))sub_241904694);
    sub_2419058EC((uint64_t)v8, (uint64_t)v11, (uint64_t (*)(_QWORD))sub_241904694);
    swift_storeEnumTagMultiPayload();
    sub_241904798();
    v25 = v24;
    v26 = sub_241904804();
    v30 = MEMORY[0x24BDF1FA8];
    v31 = MEMORY[0x24BDF1F80];
    v27 = swift_getOpaqueTypeConformance2();
    v30 = v29;
    v31 = v25;
    v32 = v26;
    v33 = v27;
    swift_getOpaqueTypeConformance2();
    sub_241909758();
    return sub_2419058B0((uint64_t)v8, (uint64_t (*)(_QWORD))sub_241904694);
  }
}

uint64_t sub_2419041DC()
{
  return sub_2419097D0();
}

uint64_t sub_2419041F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;

  v23[1] = a3;
  v24 = sub_2419096B0();
  v5 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = a1;
  v26 = a2;
  sub_241905938();
  swift_bridgeObjectRetain();
  v8 = sub_241909788();
  v10 = v9;
  v12 = v11;
  if (qword_254391B20 != -1)
    swift_once();
  v13 = sub_24190977C();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  sub_24190597C(v8, v10, v12 & 1);
  swift_bridgeObjectRelease();
  v25 = v13;
  v26 = v15;
  v27 = v17 & 1;
  v28 = v19;
  v20 = v24;
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BE65E48], v24);
  sub_24190598C(0, &qword_254391B70, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_241909CC0;
  *(_QWORD *)(v21 + 32) = 0xD000000000000020;
  *(_QWORD *)(v21 + 40) = 0x8000000241909F90;
  *(_QWORD *)(v21 + 48) = 0x6C6562614CLL;
  *(_QWORD *)(v21 + 56) = 0xE500000000000000;
  sub_241909794();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v20);
  sub_24190597C(v25, v26, v27);
  return swift_bridgeObjectRelease();
}

uint64_t sub_241904410()
{
  uint64_t result;

  result = sub_2419097DC();
  qword_254391B18 = result;
  return result;
}

uint64_t sub_24190442C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v0 = sub_2419096B0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BE65E48], v0);
  v4 = sub_2419098A8();
  v6 = v5;
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_254391B40 = v4;
  *(_QWORD *)algn_254391B48 = v6;
  return result;
}

uint64_t sub_2419044E0()
{
  return sub_241909710();
}

uint64_t sub_241904500()
{
  return sub_241909710();
}

uint64_t type metadata accessor for MentalHealthLauncherComplicationView()
{
  uint64_t result;

  result = qword_2543918A8;
  if (!qword_2543918A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24190455C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_241903588(0, &qword_254391960, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2419045B8(uint64_t a1)
{
  sub_2419046B8(a1, &qword_254391AF0, (uint64_t (*)(uint64_t))sub_2419045DC, (uint64_t (*)(uint64_t))sub_241904694, MEMORY[0x24BDEF3B8]);
}

void sub_2419045DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD v7[4];

  if (!qword_254391B10)
  {
    sub_241904694(255);
    v3 = v2;
    sub_241904798();
    v7[0] = v3;
    v7[1] = v4;
    v7[2] = sub_241904804();
    v7[3] = swift_getOpaqueTypeConformance2();
    v5 = MEMORY[0x24269DC38](a1, v7, MEMORY[0x24BDFAC00], 0);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_254391B10);
  }
}

void sub_241904694(uint64_t a1)
{
  sub_2419046B8(a1, &qword_254391AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BE49EB8], (uint64_t (*)(uint64_t))sub_24190472C, MEMORY[0x24BDED2D0]);
}

void sub_2419046B8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (!*a2)
  {
    v9 = a3(255);
    v10 = a4(255);
    v11 = a5(a1, v9, v10);
    if (!v12)
      atomic_store(v11, a2);
  }
}

void sub_24190472C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254391B00)
  {
    sub_24190598C(255, &qword_254391B28, MEMORY[0x24BDF3E48], MEMORY[0x24BEE1C68]);
    v0 = sub_241909764();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254391B00);
  }
}

void sub_241904798()
{
  unint64_t v0;
  uint64_t v1;
  _QWORD v2[2];

  if (!qword_254391B08)
  {
    v2[0] = MEMORY[0x24BDF1FA8];
    v2[1] = MEMORY[0x24BDF1F80];
    v0 = MEMORY[0x24269DC38](0, v2, MEMORY[0x24BE661E0], 0);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254391B08);
  }
}

unint64_t sub_241904804()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254391AD0;
  if (!qword_254391AD0)
  {
    sub_241904694(255);
    v2 = v1;
    v3[0] = sub_2419057C0(&qword_254391B38, (uint64_t (*)(uint64_t))MEMORY[0x24BE49EB8], MEMORY[0x24BE49E88]);
    v3[1] = sub_2419057C0(&qword_254391AF8, (uint64_t (*)(uint64_t))sub_24190472C, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24269DC50](MEMORY[0x24BDED308], v2, v3);
    atomic_store(result, (unint64_t *)&qword_254391AD0);
  }
  return result;
}

uint64_t sub_24190489C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;

  v2 = v1;
  v4 = sub_241909728();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
  sub_241903588(0, &qword_254391940, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  MEMORY[0x24BDAC7A8]();
  v10 = (_QWORD *)((char *)v19 - v9);
  sub_2419059D0(v2, (uint64_t)v19 - v9, &qword_254391940, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_24190983C();
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = *v10;
    v14 = sub_2419098D8();
    v15 = sub_241909770();
    v16 = v14;
    if (os_log_type_enabled(v15, v14))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v20 = v18;
      v19[1] = v13;
      *(_DWORD *)v17 = 136315138;
      v19[2] = sub_24190862C(0x6146746567646957, 0xEC000000796C696DLL, &v20);
      sub_2419098FC();
      _os_log_impl(&dword_241900000, v15, v16, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24269DCA4](v18, -1, -1);
      MEMORY[0x24269DCA4](v17, -1, -1);
    }

    sub_24190971C();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

unint64_t sub_241904AFC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  unint64_t v7;
  uint64_t OpaqueTypeConformance2;

  result = qword_254391AE8;
  if (!qword_254391AE8)
  {
    sub_2419045B8(255);
    v2 = v1;
    sub_241904694(255);
    v4 = v3;
    sub_241904798();
    v6[2] = v4;
    v6[3] = v5;
    v7 = sub_241904804();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v6[0] = swift_getOpaqueTypeConformance2();
    v6[1] = v7;
    result = MEMORY[0x24269DC50](MEMORY[0x24BDEF3E0], v2, v6);
    atomic_store(result, (unint64_t *)&qword_254391AE8);
  }
  return result;
}

uint64_t sub_241904BC4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for MentalHealthLauncherComplicationView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_241903588(0, &qword_254391940, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_24190983C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_24190983C();
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      sub_241903588(0, &qword_254391960, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BEE1C68]);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for MentalHealthLauncherComplicationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  sub_241903588(0, &qword_254391940, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_24190983C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_24190983C();
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

_QWORD *initializeWithCopy for MentalHealthLauncherComplicationView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_241903588(0, &qword_254391940, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_24190983C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_24190983C();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_241903588(0, &qword_254391960, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BEE1C68]);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

_QWORD *assignWithCopy for MentalHealthLauncherComplicationView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;

  if (a1 != a2)
  {
    v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_241905138((uint64_t)a1, &qword_254391940, MEMORY[0x24BDEB560]);
    sub_241903588(0, &qword_254391940, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], v6);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_24190983C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_24190983C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_11;
  }
  if (v15)
  {
LABEL_11:
    sub_241903588(0, &qword_254391960, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BEE1C68]);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t sub_241905138(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v4;

  sub_241903588(0, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

char *initializeWithTake for MentalHealthLauncherComplicationView(char *a1, char *a2, uint64_t a3)
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

  sub_241903588(0, &qword_254391940, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_24190983C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_24190983C();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    sub_241903588(0, &qword_254391960, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BEE1C68]);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  return a1;
}

char *assignWithTake for MentalHealthLauncherComplicationView(char *a1, char *a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;

  if (a1 != a2)
  {
    v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560];
    sub_241905138((uint64_t)a1, &qword_254391940, MEMORY[0x24BDEB560]);
    sub_241903588(0, &qword_254391940, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], v6);
    v8 = v7;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_24190983C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
  }
  v10 = *(int *)(a3 + 20);
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = sub_24190983C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_10;
  }
  if (v17)
  {
LABEL_10:
    sub_241903588(0, &qword_254391960, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BEE1C68]);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for MentalHealthLauncherComplicationView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_241905498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_241903588(0, &qword_25715E208, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    sub_241903588(0, &qword_254391960, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BEE1C68]);
    v8 = v11;
    v12 = *(_QWORD *)(v11 - 8);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for MentalHealthLauncherComplicationView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_241905548(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  sub_241903588(0, &qword_25715E208, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB580]);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    sub_241903588(0, &qword_254391960, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BEE1C68]);
    v10 = v13;
    v14 = *(_QWORD *)(v13 - 8);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_2419055F4()
{
  unint64_t v0;
  unint64_t v1;

  sub_241903588(319, &qword_254391940, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    sub_241903588(319, &qword_254391960, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], MEMORY[0x24BEE1C68]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

unint64_t sub_2419056AC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25715E210;
  if (!qword_25715E210)
  {
    sub_241905724(255, qword_25715E218, MEMORY[0x24BDEF3B8]);
    v2 = v1;
    v3[0] = sub_241904AFC();
    v3[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x24269DC50](MEMORY[0x24BDEF3E0], v2, v3);
    atomic_store(result, (unint64_t *)&qword_25715E210);
  }
  return result;
}

void sub_241905724(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_2419045B8(255);
    v7 = a3(a1, v6, MEMORY[0x24BDF5158]);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_241905784()
{
  unint64_t result;

  result = qword_254391B68;
  if (!qword_254391B68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254391B68);
  }
  return result;
}

uint64_t sub_2419057C0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24269DC50](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_241905800()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254391B60;
  if (!qword_254391B60)
  {
    sub_241903588(255, &qword_254391B58, (uint64_t (*)(uint64_t))MEMORY[0x24BE49EA8], MEMORY[0x24BEE1250]);
    result = MEMORY[0x24269DC50](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254391B60);
  }
  return result;
}

uint64_t sub_241905860@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2419096F8();
  *a1 = result;
  return result;
}

uint64_t sub_241905888()
{
  swift_retain();
  return sub_241909704();
}

uint64_t sub_2419058B0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2419058EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_241905930@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2419041F8(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_241905938()
{
  unint64_t result;

  result = qword_254391978;
  if (!qword_254391978)
  {
    result = MEMORY[0x24269DC50](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254391978);
  }
  return result;
}

uint64_t sub_24190597C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

void sub_24190598C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

uint64_t sub_2419059D0(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;

  sub_241903588(0, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

void sub_241905A24(uint64_t a1@<X8>)
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
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  unsigned int v17;
  id v18;
  void *v19;
  unsigned __int8 v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t OpaqueTypeConformance2;
  id v35;
  void *v36;
  unsigned __int8 v37;
  id v38;
  void *v39;
  id v40;
  unsigned __int8 v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;

  v50 = a1;
  v1 = sub_2419096EC();
  v48 = *(_QWORD *)(v1 - 8);
  v49 = v1;
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v48 - v6;
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v48 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v48 - v11;
  v13 = (void *)objc_opt_self();
  v14 = objc_msgSend(v13, sel_sharedBehavior);
  if (!v14)
  {
    __break(1u);
    goto LABEL_25;
  }
  v15 = v14;
  v16 = objc_msgSend(v14, sel_features);

  if (!v16)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v17 = objc_msgSend(v16, sel_chamomile);

  if (!v17)
  {
    sub_2419096D4();
    v24 = sub_2419096E0();
    v25 = sub_2419098E4();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_241900000, v24, v25, "[MentalHealthLauncherComplication] not available because chamomile feature disabled", v26, 2u);
      MEMORY[0x24269DCA4](v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v48 + 8))(v12, v49);
    goto LABEL_12;
  }
  v18 = objc_msgSend(v13, sel_sharedBehavior);
  if (!v18)
    goto LABEL_26;
  v19 = v18;
  v20 = objc_msgSend(v18, sel_tinkerModeEnabled);

  if ((v20 & 1) != 0)
  {
    sub_2419096D4();
    v21 = sub_2419096E0();
    v22 = sub_2419098E4();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_241900000, v21, v22, "[MentalHealthLauncherComplication] not available in tinker mode", v23, 2u);
      MEMORY[0x24269DCA4](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v48 + 8))(v10, v49);
LABEL_12:
    sub_2419064F0(0);
    sub_241906448(255);
    v28 = v27;
    sub_241906310();
    v30 = v29;
    v31 = sub_2419057C0(&qword_254391968, (uint64_t (*)(uint64_t))sub_241906310, MEMORY[0x24BDFB170]);
    v32 = sub_241905938();
    v33 = MEMORY[0x24BEE0D00];
    v51 = v30;
    v52 = MEMORY[0x24BEE0D00];
    v53 = v31;
    v54 = v32;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v51 = v28;
    v52 = v33;
    v53 = OpaqueTypeConformance2;
    v54 = v32;
    swift_getOpaqueTypeConformance2();
    sub_241909740();
    swift_bridgeObjectRelease();
    return;
  }
  v35 = objc_msgSend(v13, sel_sharedBehavior);
  if (!v35)
    goto LABEL_27;
  v36 = v35;
  v37 = objc_msgSend(v35, sel_isiPad);

  if ((v37 & 1) == 0)
  {
LABEL_18:
    sub_2419096D4();
    v42 = sub_2419096E0();
    v43 = sub_2419098E4();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_241900000, v42, v43, "[MentalHealthLauncherComplication] is available", v44, 2u);
      MEMORY[0x24269DCA4](v44, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v48 + 8))(v4, v49);
    swift_bridgeObjectRetain();
    goto LABEL_12;
  }
  v38 = objc_msgSend(v13, sel_sharedBehavior);
  if (!v38)
    goto LABEL_28;
  v39 = v38;
  v40 = objc_msgSend(v38, sel_features);

  if (v40)
  {
    v41 = objc_msgSend(v40, sel_stanley);

    if ((v41 & 1) == 0)
    {
      sub_2419096D4();
      v45 = sub_2419096E0();
      v46 = sub_2419098E4();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v47 = 0;
        _os_log_impl(&dword_241900000, v45, v46, "[MentalHealthLauncherComplication] not available on iPad because stanley feature disabled", v47, 2u);
        MEMORY[0x24269DCA4](v47, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v48 + 8))(v7, v49);
      goto LABEL_12;
    }
    goto LABEL_18;
  }
LABEL_29:
  __break(1u);
}

MentalHealthWidgetUI::MentalHealthLauncherComplication __swiftcall MentalHealthLauncherComplication.init()()
{
  _QWORD *v0;
  MentalHealthWidgetUI::MentalHealthLauncherComplication result;

  *v0 = 0xD000000000000020;
  v0[1] = 0x8000000241909DD0;
  return result;
}

uint64_t MentalHealthLauncherComplication.body.getter@<X0>(uint64_t a1@<X8>)
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
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
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
  unint64_t v36;
  id v37;
  uint64_t v38;

  v32 = a1;
  sub_241906310();
  v2 = v1;
  v26 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241906448(0);
  v27 = *(_QWORD *)(v5 - 8);
  v28 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2419064F0(0);
  v30 = *(_QWORD *)(v8 - 8);
  v31 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v29 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_allocWithZone(MEMORY[0x24BE65DF0]);
  swift_bridgeObjectRetain();
  v37 = objc_msgSend(v10, sel_init);
  sub_2419063BC(0);
  v11 = type metadata accessor for MentalHealthLauncherComplicationView();
  v12 = sub_2419057C0(&qword_2543918A0, (uint64_t (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationView, (uint64_t)&protocol conformance descriptor for MentalHealthLauncherComplicationView);
  v33 = v11;
  v34 = v12;
  swift_getOpaqueTypeConformance2();
  sub_241906924();
  sub_241909860();
  if (qword_254391980 != -1)
    swift_once();
  v33 = sub_2419095F0();
  v34 = v13;
  v14 = sub_2419057C0(&qword_254391968, (uint64_t (*)(uint64_t))sub_241906310, MEMORY[0x24BDFB170]);
  v15 = sub_241905938();
  v16 = MEMORY[0x24BEE0D00];
  sub_24190974C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v4, v2);
  v37 = (id)sub_2419095F0();
  v38 = v17;
  v33 = v2;
  v34 = v16;
  v35 = v14;
  v36 = v15;
  swift_getOpaqueTypeConformance2();
  v18 = v28;
  v19 = v29;
  sub_241909734();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v18);
  sub_241903588(0, &qword_254391A20, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v20 = sub_24190983C();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_241909DC0;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v21 + 104))(v23 + v22, *MEMORY[0x24BDFAF00], v20);
  sub_241905A24(v32);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v19, v31);
}

void sub_241906310()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254391970)
  {
    sub_2419063BC(255);
    type metadata accessor for MentalHealthLauncherComplicationView();
    sub_2419057C0(&qword_2543918A0, (uint64_t (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationView, (uint64_t)&protocol conformance descriptor for MentalHealthLauncherComplicationView);
    swift_getOpaqueTypeConformance2();
    v0 = sub_24190986C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254391970);
  }
}

void sub_2419063BC(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  if (!qword_254391958)
  {
    v4[0] = type metadata accessor for MentalHealthLauncherComplicationView();
    v4[1] = sub_2419057C0(&qword_2543918A0, (uint64_t (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationView, (uint64_t)&protocol conformance descriptor for MentalHealthLauncherComplicationView);
    v2 = MEMORY[0x24269DC38](a1, v4, MEMORY[0x24BDFAC50], 0);
    if (!v3)
      atomic_store(v2, (unint64_t *)&qword_254391958);
  }
}

void sub_241906448(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD v8[4];

  if (!qword_254391950)
  {
    sub_241906310();
    v3 = v2;
    v4 = sub_2419057C0(&qword_254391968, (uint64_t (*)(uint64_t))sub_241906310, MEMORY[0x24BDFB170]);
    v5 = sub_241905938();
    v8[0] = v3;
    v8[1] = MEMORY[0x24BEE0D00];
    v8[2] = v4;
    v8[3] = v5;
    v6 = MEMORY[0x24269DC38](a1, v8, MEMORY[0x24BDFABC8], 0);
    if (!v7)
      atomic_store(v6, (unint64_t *)&qword_254391950);
  }
}

void sub_2419064F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD v7[4];

  if (!qword_254391948)
  {
    sub_241906448(255);
    v3 = v2;
    sub_241906310();
    sub_2419057C0(&qword_254391968, (uint64_t (*)(uint64_t))sub_241906310, MEMORY[0x24BDFB170]);
    v4 = sub_241905938();
    v7[0] = v3;
    v7[1] = MEMORY[0x24BEE0D00];
    v7[2] = swift_getOpaqueTypeConformance2();
    v7[3] = v4;
    v5 = MEMORY[0x24269DC38](a1, v7, MEMORY[0x24BDFAB98], 0);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_254391948);
  }
}

uint64_t sub_2419065CC()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;

  v0 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_241903588(0, &qword_254391AA8, (uint64_t (*)(uint64_t))MEMORY[0x24BE66028], MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v27 - v2;
  sub_241903588(0, &qword_254391AB0, (uint64_t (*)(uint64_t))MEMORY[0x24BE661C0], v0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v27 - v5;
  sub_241903588(0, &qword_254391AA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], v0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v27 - v8;
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10];
  sub_241903588(0, &qword_254391960, (uint64_t (*)(uint64_t))MEMORY[0x24BDFAF10], v0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v27 - v12;
  v14 = type metadata accessor for MentalHealthLauncherComplicationView();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (uint64_t *)((char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v27 - v18;
  v20 = sub_24190983C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v13, 1, 1, v20);
  *v17 = swift_getKeyPath();
  sub_241903588(0, &qword_254391940, v10, MEMORY[0x24BDEB560]);
  swift_storeEnumTagMultiPayload();
  sub_24190455C((uint64_t)v13, (uint64_t)v17 + *(int *)(v14 + 20));
  sub_241909268((uint64_t)v17, (uint64_t)v19);
  v21 = *MEMORY[0x24BE661A0];
  v22 = sub_2419096C8();
  v23 = *(_QWORD *)(v22 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 104))(v6, v21, v22);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v6, 0, 1, v22);
  v24 = sub_2419096BC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v3, 1, 1, v24);
  sub_2419095FC();
  sub_2419092AC((uint64_t)v3, &qword_254391AA8, (uint64_t (*)(uint64_t))MEMORY[0x24BE66028]);
  sub_2419092AC((uint64_t)v6, &qword_254391AB0, (uint64_t (*)(uint64_t))MEMORY[0x24BE661C0]);
  v25 = sub_241909608();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v9, 0, 1, v25);
  sub_2419057C0(&qword_2543918A0, (uint64_t (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationView, (uint64_t)&protocol conformance descriptor for MentalHealthLauncherComplicationView);
  sub_2419097AC();
  sub_2419092AC((uint64_t)v9, &qword_254391AA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0]);
  return sub_2419058B0((uint64_t)v19, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthLauncherComplicationView);
}

unint64_t sub_241906924()
{
  unint64_t result;

  result = qword_254391938;
  if (!qword_254391938)
  {
    result = MEMORY[0x24269DC50](&unk_241909EC4, &type metadata for MentalHealthLauncherComplicationTimelineProvider);
    atomic_store(result, (unint64_t *)&qword_254391938);
  }
  return result;
}

uint64_t sub_241906968()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_241906978(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000020;
  a1[1] = 0x8000000241909DD0;
}

_QWORD *initializeBufferWithCopyOfBuffer for MentalHealthLauncherComplication(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for MentalHealthLauncherComplication()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for MentalHealthLauncherComplication(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for MentalHealthLauncherComplication(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MentalHealthLauncherComplication(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MentalHealthLauncherComplication(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MentalHealthLauncherComplication()
{
  return &type metadata for MentalHealthLauncherComplication;
}

uint64_t sub_241906AE0()
{
  sub_2419064F0(255);
  sub_241906448(255);
  sub_241906310();
  sub_2419057C0(&qword_254391968, (uint64_t (*)(uint64_t))sub_241906310, MEMORY[0x24BDFB170]);
  sub_241905938();
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

void **initializeBufferWithCopyOfBuffer for MentalHealthLauncherComplicationTimelineProvider(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void destroy for MentalHealthLauncherComplicationTimelineProvider(id *a1)
{

}

void **assignWithCopy for MentalHealthLauncherComplicationTimelineProvider(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a2;
  v4 = *a1;
  *a1 = *a2;
  v5 = v3;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for MentalHealthLauncherComplicationTimelineProvider(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for MentalHealthLauncherComplicationTimelineProvider(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 8))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MentalHealthLauncherComplicationTimelineProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
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
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MentalHealthLauncherComplicationTimelineProvider()
{
  return &type metadata for MentalHealthLauncherComplicationTimelineProvider;
}

uint64_t sub_241906CF0(uint64_t a1, void (*a2)(char *))
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v3 = type metadata accessor for MentalHealthLauncherComplicationTimelineEntry();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241909620();
  a2(v5);
  return sub_2419058B0((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthLauncherComplicationTimelineEntry);
}

uint64_t sub_241906D78(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_241909570;
  return sub_241906DD0(a1, v4);
}

uint64_t sub_241906DD0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2[22] = a1;
  v2[23] = a2;
  v3 = sub_24190962C();
  v2[24] = v3;
  v2[25] = *(_QWORD *)(v3 - 8);
  v2[26] = swift_task_alloc();
  v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68];
  sub_241903588(0, &qword_254391A38, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], MEMORY[0x24BEE1C68]);
  v2[27] = swift_task_alloc();
  sub_241903588(0, &qword_254391A30, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF2D8], v4);
  v2[28] = swift_task_alloc();
  v5 = sub_2419095E4();
  v2[29] = v5;
  v2[30] = *(_QWORD *)(v5 - 8);
  v2[31] = swift_task_alloc();
  v6 = sub_241909584();
  v2[32] = v6;
  v2[33] = *(_QWORD *)(v6 - 8);
  v2[34] = swift_task_alloc();
  sub_2419095A8();
  v2[35] = swift_task_alloc();
  sub_24190598C(0, (unint64_t *)&qword_254391A40, MEMORY[0x24BEE4AE0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDFAE00]);
  v2[36] = v7;
  v2[37] = *(_QWORD *)(v7 - 8);
  v2[38] = swift_task_alloc();
  v8 = sub_2419096EC();
  v2[39] = v8;
  v2[40] = *(_QWORD *)(v8 - 8);
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_241906FBC()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  id v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  os_log_type_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  unint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  _BOOL4 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
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
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void (*v106)(uint64_t, uint64_t);
  uint64_t v107[2];

  sub_2419096D4();
  v1 = sub_2419096E0();
  v2 = sub_2419098E4();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 368);
    v4 = *(_QWORD *)(v0 + 312);
    v5 = *(_QWORD *)(v0 + 320);
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v107[0] = v7;
    *(_DWORD *)v6 = 136446210;
    *(_QWORD *)(v0 + 168) = sub_24190862C(0xD000000000000030, 0x8000000241909E40, v107);
    sub_2419098FC();
    _os_log_impl(&dword_241900000, v1, v2, "[%{public}s] Retrieving widget relevance entries", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24269DCA4](v7, -1, -1);
    MEMORY[0x24269DCA4](v6, -1, -1);

    v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 368);
    v4 = *(_QWORD *)(v0 + 312);
    v9 = *(_QWORD *)(v0 + 320);

    v8 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  }
  v8(v3, v4);
  v10 = *(void **)(v0 + 184);
  *(_QWORD *)(v0 + 128) = MEMORY[0x24BEE4AF8];
  if (!objc_msgSend(v10, sel_hasAnyStateOfMindReminderEnabled))
  {
    sub_2419096D4();
    v34 = sub_2419096E0();
    v35 = sub_2419098E4();
    v36 = os_log_type_enabled(v34, v35);
    v37 = *(_QWORD *)(v0 + 328);
    v38 = *(_QWORD *)(v0 + 312);
    if (v36)
    {
      v39 = swift_slowAlloc();
      v40 = swift_slowAlloc();
      v107[0] = v40;
      *(_DWORD *)v39 = 136446466;
      *(_QWORD *)(v0 + 96) = sub_24190862C(0xD000000000000030, 0x8000000241909E40, v107);
      sub_2419098FC();
      *(_WORD *)(v39 + 12) = 2048;
      *(_QWORD *)(v0 + 88) = 0;
      sub_2419098FC();
      _os_log_impl(&dword_241900000, v34, v35, "[%{public}s] No enabled reminders so no Smart Stack relevance entries are provided (Count: %ld)", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24269DCA4](v40, -1, -1);
      MEMORY[0x24269DCA4](v39, -1, -1);

      v8(v37, v38);
      goto LABEL_30;
    }
LABEL_29:

    v8(v37, v38);
    goto LABEL_30;
  }
  v106 = v8;
  if (objc_msgSend(*(id *)(v0 + 184), sel_endOfDayNotificationsEnabled))
  {
    sub_2419096D4();
    v11 = sub_2419096E0();
    v12 = sub_2419098E4();
    v13 = os_log_type_enabled(v11, v12);
    v14 = *(_QWORD *)(v0 + 360);
    v15 = *(_QWORD *)(v0 + 312);
    if (v13)
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v107[0] = v17;
      *(_DWORD *)v16 = 136446210;
      *(_QWORD *)(v0 + 160) = sub_24190862C(0xD000000000000030, 0x8000000241909E40, v107);
      sub_2419098FC();
      _os_log_impl(&dword_241900000, v11, v12, "[%{public}s] Bedtime relevance added", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24269DCA4](v17, -1, -1);
      MEMORY[0x24269DCA4](v16, -1, -1);
    }

    v8(v14, v15);
    v18 = *(_QWORD *)(v0 + 272);
    v19 = *(_QWORD *)(v0 + 256);
    v20 = *(_QWORD *)(v0 + 264);
    sub_241909578();
    sub_24190959C();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
    sub_241909824();
    v21 = *(_QWORD *)(v0 + 128);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v21 = sub_2419083F8(0, *(_QWORD *)(v21 + 16) + 1, 1, v21);
    v23 = *(_QWORD *)(v21 + 16);
    v22 = *(_QWORD *)(v21 + 24);
    if (v23 >= v22 >> 1)
      v21 = sub_2419083F8(v22 > 1, v23 + 1, 1, v21);
    v25 = *(_QWORD *)(v0 + 296);
    v24 = *(_QWORD *)(v0 + 304);
    v26 = *(_QWORD *)(v0 + 288);
    *(_QWORD *)(v21 + 16) = v23 + 1;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v25 + 32))(v21+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(_QWORD *)(v25 + 72) * v23, v24, v26);
    *(_QWORD *)(v0 + 128) = v21;
  }
  if (objc_msgSend(*(id *)(v0 + 184), sel_middayNotificationsEnabled))
  {
    sub_2419096D4();
    v27 = sub_2419096E0();
    v28 = sub_2419098E4();
    v29 = os_log_type_enabled(v27, v28);
    v30 = *(_QWORD *)(v0 + 352);
    v31 = *(_QWORD *)(v0 + 312);
    if (v29)
    {
      v32 = (uint8_t *)swift_slowAlloc();
      v33 = swift_slowAlloc();
      v107[0] = v33;
      *(_DWORD *)v32 = 136446210;
      *(_QWORD *)(v0 + 152) = sub_24190862C(0xD000000000000030, 0x8000000241909E40, v107);
      sub_2419098FC();
      _os_log_impl(&dword_241900000, v27, v28, "[%{public}s] Midday relevance added", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24269DCA4](v33, -1, -1);
      MEMORY[0x24269DCA4](v32, -1, -1);
    }

    v8(v30, v31);
    v42 = *(_QWORD *)(v0 + 240);
    v41 = *(_QWORD *)(v0 + 248);
    v44 = *(_QWORD *)(v0 + 224);
    v43 = *(_QWORD *)(v0 + 232);
    v45 = *(char **)(v0 + 208);
    v46 = *(_QWORD *)(v0 + 216);
    v47 = *(_QWORD *)(v0 + 192);
    v48 = *(_QWORD *)(v0 + 200);
    v49 = sub_241909698();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v44, 1, 1, v49);
    v50 = sub_2419096A4();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v46, 1, 1, v50);
    LOBYTE(v102) = 1;
    v101 = 0;
    LOBYTE(v100) = 1;
    v99 = 0;
    LOBYTE(v98) = 1;
    v97 = 0;
    LOBYTE(v96) = 1;
    v95 = 0;
    LOBYTE(v94) = 1;
    v93 = 0;
    LOBYTE(v92) = 1;
    v91 = 0;
    LOBYTE(v90) = 1;
    v89 = 0;
    LOBYTE(v88) = 1;
    v87 = 0;
    LOBYTE(v86) = 0;
    v85 = 0;
    LOBYTE(v84) = 0;
    v83 = 12;
    LOBYTE(v82) = 1;
    v81 = 0;
    sub_2419095D8();
    sub_241909620();
    v51 = sub_2419029E4(v41, v45);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v45, v47);
    v52 = sub_2419026C4(v51);
    swift_bridgeObjectRelease();
    sub_241907D1C(v52);
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
    v8 = v106;
  }
  v53 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0 + 184), sel_customReminderSchedule, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96,
            v97,
            v98,
            v99,
            v100,
            v101,
            v102));
  sub_241908C94();
  v54 = sub_2419098C0();

  if (v54 >> 62)
  {
    swift_bridgeObjectRetain();
    v55 = sub_241909950();
    swift_bridgeObjectRelease();
  }
  else
  {
    v55 = *(_QWORD *)((v54 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v55)
  {
    sub_2419096D4();
    v71 = *(_QWORD *)(v0 + 128);
    swift_bridgeObjectRetain();
    v72 = sub_2419096E0();
    v73 = sub_2419098E4();
    v74 = os_log_type_enabled(v72, v73);
    v75 = *(_QWORD *)(v0 + 336);
    v76 = *(_QWORD *)(v0 + 312);
    if (v74)
    {
      v105 = *(_QWORD *)(v0 + 336);
      v77 = swift_slowAlloc();
      v78 = swift_slowAlloc();
      v107[0] = v78;
      *(_DWORD *)v77 = 136446466;
      *(_QWORD *)(v0 + 136) = sub_24190862C(0xD000000000000030, 0x8000000241909E40, v107);
      sub_2419098FC();
      *(_WORD *)(v77 + 12) = 2048;
      *(_QWORD *)(v0 + 144) = *(_QWORD *)(v71 + 16);
      sub_2419098FC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_241900000, v72, v73, "[%{public}s] Widget relevance provided (no custom scheduled reminders) (Count: %ld)", (uint8_t *)v77, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24269DCA4](v78, -1, -1);
      MEMORY[0x24269DCA4](v77, -1, -1);

      v106(v105, v76);
    }
    else
    {
      swift_bridgeObjectRelease();

      v8(v75, v76);
    }
    goto LABEL_30;
  }
  v56 = *(void **)(v0 + 184);
  sub_241907EAC(v56);
  sub_241907D1C(v57);
  sub_2419096D4();
  v58 = *(_QWORD *)(v0 + 128);
  v59 = v56;
  swift_bridgeObjectRetain_n();
  v60 = v59;
  v34 = sub_2419096E0();
  v61 = sub_2419098E4();
  if (!os_log_type_enabled(v34, v61))
  {
    v37 = *(_QWORD *)(v0 + 344);
    v38 = *(_QWORD *)(v0 + 312);
    v79 = *(void **)(v0 + 184);
    swift_bridgeObjectRelease_n();

    goto LABEL_29;
  }
  v62 = *(void **)(v0 + 184);
  v63 = swift_slowAlloc();
  v64 = swift_slowAlloc();
  v107[0] = v64;
  *(_DWORD *)v63 = 136446722;
  *(_QWORD *)(v0 + 104) = sub_24190862C(0xD000000000000030, 0x8000000241909E40, v107);
  sub_2419098FC();
  *(_WORD *)(v63 + 12) = 2048;
  v65 = objc_msgSend(v62, sel_customReminderSchedule);
  v66 = sub_2419098C0();

  v67 = *(void **)(v0 + 184);
  if (v66 >> 62)
  {
    swift_bridgeObjectRetain();
    v68 = sub_241909950();
    swift_bridgeObjectRelease();
  }
  else
  {
    v68 = *(_QWORD *)((v66 & 0xFFFFFFFFFFFFF8) + 0x10);
  }

  v103 = *(_QWORD *)(v0 + 312);
  v104 = *(_QWORD *)(v0 + 344);
  v69 = *(void **)(v0 + 184);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 112) = v68;
  sub_2419098FC();

  *(_WORD *)(v63 + 22) = 2048;
  v70 = *(_QWORD *)(v58 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 120) = v70;
  sub_2419098FC();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_241900000, v34, v61, "[%{public}s] Widget relevance provided (including %ld custom scheduled reminders) (Count: %ld)", (uint8_t *)v63, 0x20u);
  swift_arrayDestroy();
  MEMORY[0x24269DCA4](v64, -1, -1);
  MEMORY[0x24269DCA4](v63, -1, -1);

  v106(v104, v103);
LABEL_30:
  swift_beginAccess();
  sub_241909818();
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

uint64_t sub_241907C74()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_241909570;
  return sub_241909854();
}

uint64_t sub_241907CE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_24190962C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_241907D1C(uint64_t a1)
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
  v3 = sub_2419083F8(isUniquelyReferenced_nonNull_native, v24, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *(_QWORD *)(v3 + 16);
  v10 = (*(_QWORD *)(v3 + 24) >> 1) - v9;
  sub_24190598C(0, (unint64_t *)&qword_254391A40, MEMORY[0x24BEE4AE0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDFAE00]);
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
  result = sub_24190995C();
  __break(1u);
  return result;
}

void sub_241907EAC(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = sub_24190962C();
  v18 = *(_QWORD *)(v2 - 8);
  v19 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2419095E4();
  v17 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BEE4AF8];
  v8 = objc_msgSend(a1, sel_customReminderSchedule);
  sub_241908C94();
  v9 = sub_2419098C0();

  if (!(v9 >> 62))
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v10)
      goto LABEL_3;
LABEL_11:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v10 = sub_241909950();
  swift_bridgeObjectRelease();
  if (!v10)
    goto LABEL_11;
LABEL_3:
  if (v10 < 1)
  {
    __break(1u);
  }
  else
  {
    v11 = 0;
    do
    {
      if ((v9 & 0xC000000000000001) != 0)
        v12 = (id)MEMORY[0x24269DA04](v11, v9);
      else
        v12 = *(id *)(v9 + 8 * v11 + 32);
      v13 = v12;
      ++v11;
      v14 = objc_msgSend(v12, sel_dateComponents);
      sub_2419095B4();

      sub_241909620();
      v15 = sub_2419029E4((uint64_t)v7, v4);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v19);
      (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v5);
      v16 = sub_2419026C4(v15);
      swift_bridgeObjectRelease();
      sub_241907D1C(v16);

    }
    while (v10 != v11);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2419080D4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24190812C;
  return sub_241906DD0(a1, v4);
}

uint64_t sub_24190812C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_241908174()
{
  return sub_2419057C0(&qword_254391AB8, (uint64_t (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationTimelineEntry, (uint64_t)&unk_241909F1C);
}

uint64_t type metadata accessor for MentalHealthLauncherComplicationTimelineEntry()
{
  uint64_t result;

  result = qword_254391AC0;
  if (!qword_254391AC0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2419081DC(char a1, int64_t a2, char a3, unint64_t a4)
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
  sub_241903588(0, &qword_25715E248, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v10 = *(_QWORD *)(sub_24190962C() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_241909944();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_24190962C() - 8);
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
    sub_241908CD0(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_2419083F8(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  size_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
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
  v10 = MEMORY[0x24BEE4AE0];
  if (!v9)
  {
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  sub_241908DE8();
  sub_24190598C(0, (unint64_t *)&qword_254391A40, v10 + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDFAE00]);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 72);
  v14 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v15 = (_QWORD *)swift_allocObject();
  v16 = _swift_stdlib_malloc_size(v15);
  if (!v13 || (v16 - v14 == 0x8000000000000000 ? (v17 = v13 == -1) : (v17 = 0), v17))
  {
LABEL_29:
    result = sub_241909944();
    __break(1u);
    return result;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v13);
LABEL_19:
  sub_24190598C(0, (unint64_t *)&qword_254391A40, v10 + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDFAE00]);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v15 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_241909018(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v15;
}

uint64_t sub_24190862C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2419086FC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24190916C((uint64_t)v12, *a3);
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
      sub_24190916C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2419086FC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_241909908();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2419088B4(a5, a6);
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
  v8 = sub_241909938();
  if (!v8)
  {
    sub_241909944();
    __break(1u);
LABEL_17:
    result = sub_24190995C();
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

uint64_t sub_2419088B4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_241908948(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_241908B34(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_241908B34(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_241908948(uint64_t a1, unint64_t a2)
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
      v3 = sub_241908ABC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_241909920();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_241909944();
      __break(1u);
LABEL_10:
      v2 = sub_2419098B4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_24190995C();
    __break(1u);
LABEL_14:
    result = sub_241909944();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_241908ABC(uint64_t a1, uint64_t a2)
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
  sub_24190598C(0, &qword_25715E250, MEMORY[0x24BEE4260], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_241908B34(char a1, int64_t a2, char a3, char *a4)
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
    sub_24190598C(0, &qword_25715E250, MEMORY[0x24BEE4260], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
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
  result = sub_24190995C();
  __break(1u);
  return result;
}

unint64_t sub_241908C94()
{
  unint64_t result;

  result = qword_25715E240;
  if (!qword_25715E240)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25715E240);
  }
  return result;
}

uint64_t sub_241908CD0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_24190962C() - 8);
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
  result = sub_24190995C();
  __break(1u);
  return result;
}

void sub_241908DE8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25715E1F0)
  {
    sub_24190598C(255, (unint64_t *)&qword_254391A40, MEMORY[0x24BEE4AE0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDFAE00]);
    v0 = sub_241909974();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25715E1F0);
  }
}

uint64_t sub_241908E58(uint64_t a1, void (*a2)(char *))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;
  void (*v16)(char *);

  v16 = a2;
  v2 = sub_241909884();
  MEMORY[0x24BDAC7A8](v2);
  sub_2419091A8();
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MentalHealthLauncherComplicationTimelineEntry();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_241909620();
  sub_241903588(0, qword_25715E260, (uint64_t (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationTimelineEntry, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v12 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_241909DC0;
  sub_241909220((uint64_t)v11, v13 + v12);
  sub_241909878();
  sub_2419057C0(&qword_254391AB8, (uint64_t (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationTimelineEntry, (uint64_t)&unk_241909F1C);
  sub_241909890();
  v16(v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_2419058B0((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthLauncherComplicationTimelineEntry);
  return swift_release();
}

uint64_t sub_241909018(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    sub_24190598C(0, (unint64_t *)&qword_254391A40, MEMORY[0x24BEE4AE0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDFAE00]);
    v9 = *(_QWORD *)(v8 - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v4;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_24190995C();
  __break(1u);
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

uint64_t sub_24190916C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_2419091A8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25715E258)
  {
    type metadata accessor for MentalHealthLauncherComplicationTimelineEntry();
    sub_2419057C0(&qword_254391AB8, (uint64_t (*)(uint64_t))type metadata accessor for MentalHealthLauncherComplicationTimelineEntry, (uint64_t)&unk_241909F1C);
    v0 = sub_24190989C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25715E258);
  }
}

uint64_t sub_241909220(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MentalHealthLauncherComplicationTimelineEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_241909268(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MentalHealthLauncherComplicationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2419092AC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_241903588(0, a2, a3, MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_2419092F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24190962C();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_24190932C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24190962C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_241909360(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24190962C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_2419093A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24190962C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_2419093E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24190962C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_24190942C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24190962C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_241909470()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24190947C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24190962C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_2419094B8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2419094C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24190962C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_241909504()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24190962C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_241909578()
{
  return MEMORY[0x24BDB55F8]();
}

uint64_t sub_241909584()
{
  return MEMORY[0x24BDB5600]();
}

uint64_t sub_241909590()
{
  return MEMORY[0x24BDB5608]();
}

uint64_t sub_24190959C()
{
  return MEMORY[0x24BDB5628]();
}

uint64_t sub_2419095A8()
{
  return MEMORY[0x24BDB5630]();
}

uint64_t sub_2419095B4()
{
  return MEMORY[0x24BDCBCC0]();
}

uint64_t sub_2419095C0()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_2419095CC()
{
  return MEMORY[0x24BDCBD60]();
}

uint64_t sub_2419095D8()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_2419095E4()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_2419095F0()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_2419095FC()
{
  return MEMORY[0x24BE65E20]();
}

uint64_t sub_241909608()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_241909614()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_241909620()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_24190962C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_241909638()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_241909644()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_241909650()
{
  return MEMORY[0x24BDCF028]();
}

uint64_t sub_24190965C()
{
  return MEMORY[0x24BDCF078]();
}

uint64_t sub_241909668()
{
  return MEMORY[0x24BDCF0B8]();
}

uint64_t sub_241909674()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_241909680()
{
  return MEMORY[0x24BDCF1C0]();
}

uint64_t sub_24190968C()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_241909698()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_2419096A4()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_2419096B0()
{
  return MEMORY[0x24BE65E50]();
}

uint64_t sub_2419096BC()
{
  return MEMORY[0x24BE66028]();
}

uint64_t sub_2419096C8()
{
  return MEMORY[0x24BE661C0]();
}

uint64_t sub_2419096D4()
{
  return MEMORY[0x24BE45998]();
}

uint64_t sub_2419096E0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2419096EC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2419096F8()
{
  return MEMORY[0x24BDEDED8]();
}

uint64_t sub_241909704()
{
  return MEMORY[0x24BDEDEE0]();
}

uint64_t sub_241909710()
{
  return MEMORY[0x24BDFAAE8]();
}

uint64_t sub_24190971C()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_241909728()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_241909734()
{
  return MEMORY[0x24BDFAB90]();
}

uint64_t sub_241909740()
{
  return MEMORY[0x24BDFABA0]();
}

uint64_t sub_24190974C()
{
  return MEMORY[0x24BDFABC0]();
}

uint64_t sub_241909758()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_241909764()
{
  return MEMORY[0x24BDF1008]();
}

uint64_t sub_241909770()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_24190977C()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_241909788()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_241909794()
{
  return MEMORY[0x24BE661D8]();
}

uint64_t sub_2419097A0()
{
  return MEMORY[0x24BDFABF8]();
}

uint64_t sub_2419097AC()
{
  return MEMORY[0x24BDFAC48]();
}

uint64_t sub_2419097B8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2419097C4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2419097D0()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2419097DC()
{
  return MEMORY[0x24BDF3CD0]();
}

uint64_t sub_2419097E8()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_2419097F4()
{
  return MEMORY[0x24BE49EA0]();
}

uint64_t sub_241909800()
{
  return MEMORY[0x24BE49EA8]();
}

uint64_t sub_24190980C()
{
  return MEMORY[0x24BE49EB8]();
}

uint64_t sub_241909818()
{
  return MEMORY[0x24BDFACC0]();
}

uint64_t sub_241909824()
{
  return MEMORY[0x24BDFADF8]();
}

uint64_t sub_241909830()
{
  return MEMORY[0x24BDFAE00]();
}

uint64_t sub_24190983C()
{
  return MEMORY[0x24BDFAF10]();
}

uint64_t sub_241909848()
{
  return MEMORY[0x24BDFB040]();
}

uint64_t sub_241909854()
{
  return MEMORY[0x24BDFB0B8]();
}

uint64_t sub_241909860()
{
  return MEMORY[0x24BDFB158]();
}

uint64_t sub_24190986C()
{
  return MEMORY[0x24BDFB160]();
}

uint64_t sub_241909878()
{
  return MEMORY[0x24BDFB190]();
}

uint64_t sub_241909884()
{
  return MEMORY[0x24BDFB198]();
}

uint64_t sub_241909890()
{
  return MEMORY[0x24BDFB4D0]();
}

uint64_t sub_24190989C()
{
  return MEMORY[0x24BDFB4D8]();
}

uint64_t sub_2419098A8()
{
  return MEMORY[0x24BE661E8]();
}

uint64_t sub_2419098B4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2419098C0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2419098CC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2419098D8()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2419098E4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2419098F0()
{
  return MEMORY[0x24BE66218]();
}

uint64_t sub_2419098FC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_241909908()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_241909914()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_241909920()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24190992C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_241909938()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_241909944()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_241909950()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_24190995C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_241909968()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_241909974()
{
  return MEMORY[0x24BEE3598]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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


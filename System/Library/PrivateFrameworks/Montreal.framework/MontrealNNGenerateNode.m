@implementation MontrealNNGenerateNode

- (MontrealNNGenerateNode)initWithParameters:(id *)a3 weightDataFormat:(unint64_t)a4
{
  MontrealNNGenerateNode *v6;
  MontrealNNGenerateNode *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MontrealNNGenerateNode;
  v6 = -[MontrealNNGenerateNode init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    memcpy(&v6->_parameters, a3, sizeof(v6->_parameters));
    v7->_weightDataFormat = a4;
  }
  return v7;
}

- (id)dataFromWeights:(float *)a3 length:(unint64_t)a4
{
  return (id)MEMORY[0x1E0DE7D20](MEMORY[0x1E0C99D50], sel_dataWithBytesNoCopy_length_freeWhenDone_, a3, 4 * a4);
}

- (unint64_t)generateNode:(id)a3 node:(id)a4 weightIter:(unint64_t)a5 inputs:(id)a6 outputs:(id)a7
{
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  void *v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  int v84;
  int v85;
  uint64_t v86;
  __CFString **v87;
  int v88;
  __CFString **v89;
  int v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  __CFString *v107;
  void (*v108)(_QWORD, uint64_t, __CFString *);
  int v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  float v121;
  void *v122;
  const char *v123;
  double v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  MontrealNNModelNode *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  MontrealNNModelNode *v174;
  MontrealNNModelNode *node;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  unint64_t weightIter;
  void *v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  _QWORD v197[5];
  id v198;
  id v199;
  uint64_t *v200;
  uint64_t v201;
  uint64_t *v202;
  uint64_t v203;
  void *(*v204)(uint64_t, uint64_t);
  uint64_t (*v205)();
  void *v206;
  _BYTE v207[704];
  _QWORD v208[2];
  __CFString *v209;
  void *v210;
  _QWORD v211[2];
  __CFString *v212;
  void *v213;
  void *v214;
  __CFString *v215;
  void *v216;
  void *v217;
  __CFString *v218;
  _QWORD v219[3];

  v219[1] = *MEMORY[0x1E0C80C00];
  v196 = a3;
  v192 = a4;
  v194 = a6;
  v195 = a7;
  self->_weightIter = a5;
  v201 = 0;
  v202 = &v201;
  v203 = 0x2F012000000;
  v204 = sub_19C224864;
  v205 = nullsub_173;
  v206 = &unk_19C2849F1;
  memcpy(v207, &self->_parameters, sizeof(v207));
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C2526B8(v202[12]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v15, v17, (uint64_t)v16, (uint64_t)off_1EE418B60);

  sub_19C252794(v202[11]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v15, v19, (uint64_t)v18, (uint64_t)off_1EE418B68);

  sub_19C252794(v202[10]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v15, v21, (uint64_t)v20, (uint64_t)off_1EE418B78);

  sub_19C252978(v202[21], v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v15, v26, (uint64_t)v25, (uint64_t)off_1EE418B70);

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v197[0] = MEMORY[0x1E0C809B0];
  v197[1] = 3221225472;
  v197[2] = sub_19C224878;
  v197[3] = &unk_1E3D257B8;
  v200 = &v201;
  v197[4] = self;
  v191 = v192;
  v198 = v191;
  v193 = v30;
  v199 = v193;
  v31 = MEMORY[0x1A1AD22D4](v197);
  v35 = (void (**)(_QWORD, _QWORD, _QWORD))v31;
  switch(v202[6])
  {
    case 0:
      (*(void (**)(uint64_t, uint64_t, __CFString *))(v31 + 16))(v31, *((int *)v202 + 76) * (uint64_t)*((int *)v202 + 44), off_1EE418DB8);
      v88 = *((_DWORD *)v202 + 76);
      goto LABEL_8;
    case 1:
      v90 = *((_DWORD *)v202 + 46);
      if (v90 <= 1)
        v90 = *((_DWORD *)v202 + 44);
      v91 = v90;
      (*(void (**)(uint64_t, _QWORD, __CFString *))(v31 + 16))(v31, v90, off_1EE418DB8);
      ((void (**)(_QWORD, uint64_t, __CFString *))v35)[2](v35, v91, off_1EE418DC0);
      ((void (**)(_QWORD, uint64_t, __CFString *))v35)[2](v35, v91, off_1EE418E10);
      ((void (**)(_QWORD, uint64_t, __CFString *))v35)[2](v35, v91, off_1EE418E18);
      break;
    case 2:
      (*(void (**)(uint64_t, uint64_t, __CFString *))(v31 + 16))(v31, *((int *)v202 + 76) * (uint64_t)*((int *)v202 + 44), off_1EE418DB8);
      ((void (**)(_QWORD, _QWORD, __CFString *))v35)[2](v35, *((int *)v202 + 76), off_1EE418DC0);
      if (v202[13] != 6)
        break;
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v92, v93, v94);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v95) = *((_DWORD *)v202 + 108);
      objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v96, v97, v98, v95);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v190, v100, (uint64_t)v99, (uint64_t)off_1EE418BB0);

      v104 = (void *)objc_msgSend_copy(v190, v101, v102, v103);
      objc_msgSend_setObject_forKeyedSubscript_(v15, v105, (uint64_t)v104, (uint64_t)off_1EE418B98);
      goto LABEL_28;
    case 4:
    case 23:
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v32, v33, v34);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      v218 = off_1EE418DA0;
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v36, *((unsigned int *)v202 + 76), v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v217 = v38;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v39, (uint64_t)&v217, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v219[0] = v40;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v41, (uint64_t)v219, (uint64_t)&v218, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v190, v43, (uint64_t)v42, (uint64_t)off_1EE418B90);

      v215 = off_1EE418DA0;
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v44, *((unsigned int *)v202 + 92), v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v214 = v46;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v47, (uint64_t)&v214, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v216 = v48;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v49, (uint64_t)&v216, (uint64_t)&v215, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v190, v51, (uint64_t)v50, (uint64_t)off_1EE418B88);

      v55 = (void *)objc_msgSend_copy(v190, v52, v53, v54);
      objc_msgSend_setObject_forKeyedSubscript_(v15, v56, (uint64_t)v55, (uint64_t)off_1EE418B98);

      ((void (**)(_QWORD, uint64_t, __CFString *))v35)[2](v35, *((int *)v202 + 76) * (uint64_t)*((int *)v202 + 92), off_1EE418DB8);
      goto LABEL_29;
    case 5:
      v84 = *((_DWORD *)v202 + 44);
      v85 = *((_DWORD *)v202 + 76);
      if ((v202[21] & 0x20) != 0)
      {
        v86 = 4 * v85 * (v85 + v84);
        v87 = &off_1EE418DB8;
      }
      else
      {
        (*(void (**)(uint64_t, _QWORD, __CFString *))(v31 + 16))(v31, 4 * v84 * v85, off_1EE418DB8);
        v86 = (4 * *((_DWORD *)v202 + 76) * *((_DWORD *)v202 + 76));
        v87 = &off_1EE418DC8;
      }
      ((void (**)(_QWORD, uint64_t, __CFString *))v35)[2](v35, v86, *v87);
      v106 = 4 * *((int *)v202 + 76);
      v107 = off_1EE418DC0;
      v108 = (void (*)(_QWORD, uint64_t, __CFString *))v35[2];
      if ((v202[21] & 0x80) == 0)
      {
        v108(v35, v106, off_1EE418DC0);
        v106 = 4 * *((int *)v202 + 76);
        v107 = off_1EE418DD0;
        v108 = (void (*)(_QWORD, uint64_t, __CFString *))v35[2];
      }
      v108(v35, v106, v107);
      if (!v202[68])
        break;
      v109 = *((_DWORD *)v202 + 92);
      if (!v109)
        break;
      v110 = v109;
      ((void (**)(_QWORD, uint64_t, __CFString *))v35)[2](v35, *((int *)v202 + 76) * (uint64_t)v109, off_1EE418E08);
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v111, v112, v113);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v114, v110, v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v190, v117, (uint64_t)v116, (uint64_t)off_1EE418BB8);

      if (*((float *)v202 + 120) < 0.0)
      {
        v121 = *((float *)v202 + 121);
        if (v121 > 0.0)
        {
          objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v118, v119, v120);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v190, v123, (uint64_t)v122, (uint64_t)off_1EE418BC0);

          *(float *)&v124 = v121;
          objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v125, v126, v127, v124);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v190, v129, (uint64_t)v128, (uint64_t)off_1EE418BC8);

        }
      }
      v104 = (void *)objc_msgSend_copy(v190, v118, v119, v120);
      objc_msgSend_setObject_forKeyedSubscript_(v15, v130, (uint64_t)v104, (uint64_t)off_1EE418B98);
LABEL_28:

      goto LABEL_29;
    case 6:
      (*(void (**)(uint64_t, _QWORD, __CFString *))(v31 + 16))(v31, 4 * *((_DWORD *)v202 + 44) * *((_DWORD *)v202 + 76), off_1EE418DB8);
      ((void (**)(_QWORD, _QWORD, __CFString *))v35)[2](v35, (4 * *((_DWORD *)v202 + 76) * *((_DWORD *)v202 + 76)), off_1EE418DC8);
      ((void (**)(_QWORD, uint64_t, __CFString *))v35)[2](v35, 4 * *((int *)v202 + 76), off_1EE418DC0);
      ((void (**)(_QWORD, uint64_t, __CFString *))v35)[2](v35, 4 * *((int *)v202 + 76), off_1EE418DD0);
      ((void (**)(_QWORD, _QWORD, __CFString *))v35)[2](v35, 4 * *((_DWORD *)v202 + 44) * *((_DWORD *)v202 + 76), off_1EE418DD8);
      ((void (**)(_QWORD, _QWORD, __CFString *))v35)[2](v35, (4 * *((_DWORD *)v202 + 76) * *((_DWORD *)v202 + 76)), off_1EE418DE8);
      ((void (**)(_QWORD, uint64_t, __CFString *))v35)[2](v35, 4 * *((int *)v202 + 76), off_1EE418DE0);
      v88 = 4 * *((_DWORD *)v202 + 76);
      goto LABEL_17;
    case 9:
      (*(void (**)(uint64_t, _QWORD, __CFString *))(v31 + 16))(v31, 3 * *((_DWORD *)v202 + 44) * *((_DWORD *)v202 + 76), off_1EE418DB8);
      ((void (**)(_QWORD, _QWORD, __CFString *))v35)[2](v35, (3 * *((_DWORD *)v202 + 76) * *((_DWORD *)v202 + 76)), off_1EE418DC8);
      ((void (**)(_QWORD, uint64_t, __CFString *))v35)[2](v35, 3 * *((int *)v202 + 76), off_1EE418DC0);
      v88 = 3 * *((_DWORD *)v202 + 76);
      v89 = &off_1EE418DD0;
      goto LABEL_18;
    case 10:
      (*(void (**)(uint64_t, _QWORD, __CFString *))(v31 + 16))(v31, 3 * *((_DWORD *)v202 + 44) * *((_DWORD *)v202 + 76), off_1EE418DB8);
      ((void (**)(_QWORD, _QWORD, __CFString *))v35)[2](v35, (3 * *((_DWORD *)v202 + 76) * *((_DWORD *)v202 + 76)), off_1EE418DC8);
      ((void (**)(_QWORD, uint64_t, __CFString *))v35)[2](v35, 3 * *((int *)v202 + 76), off_1EE418DC0);
      ((void (**)(_QWORD, uint64_t, __CFString *))v35)[2](v35, 3 * *((int *)v202 + 76), off_1EE418DD0);
      ((void (**)(_QWORD, _QWORD, __CFString *))v35)[2](v35, 3 * *((_DWORD *)v202 + 44) * *((_DWORD *)v202 + 76), off_1EE418DD8);
      ((void (**)(_QWORD, _QWORD, __CFString *))v35)[2](v35, (3 * *((_DWORD *)v202 + 76) * *((_DWORD *)v202 + 76)), off_1EE418DE8);
      ((void (**)(_QWORD, uint64_t, __CFString *))v35)[2](v35, 3 * *((int *)v202 + 76), off_1EE418DE0);
      v88 = 3 * *((_DWORD *)v202 + 76);
LABEL_17:
      v89 = &off_1EE418DF0;
      goto LABEL_18;
    case 11:
    case 12:
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v32, v33, v34);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      v212 = off_1EE418DA0;
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v57, *((unsigned int *)v202 + 92), v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v211[0] = v59;
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v60, *((unsigned int *)v202 + 93), v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v211[1] = v62;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v63, (uint64_t)v211, 2);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v213 = v64;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v65, (uint64_t)&v213, (uint64_t)&v212, 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v190, v67, (uint64_t)v66, (uint64_t)off_1EE418BA0);

      v209 = off_1EE418DA0;
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v68, *((unsigned int *)v202 + 94), v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v208[0] = v70;
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v71, *((unsigned int *)v202 + 95), v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v208[1] = v73;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v74, (uint64_t)v208, 2);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v210 = v75;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v76, (uint64_t)&v210, (uint64_t)&v209, 1);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v190, v78, (uint64_t)v77, (uint64_t)off_1EE418BA8);

      v82 = (void *)objc_msgSend_copy(v190, v79, v80, v81);
      objc_msgSend_setObject_forKeyedSubscript_(v15, v83, (uint64_t)v82, (uint64_t)off_1EE418B98);

      ((void (**)(_QWORD, uint64_t, __CFString *))v35)[2](v35, *((int *)v202 + 93) * (uint64_t)*((int *)v202 + 92) * *((int *)v202 + 46) * *((int *)v202 + 76), off_1EE418DB8);
      ((void (**)(_QWORD, _QWORD, __CFString *))v35)[2](v35, *((int *)v202 + 76), off_1EE418DC0);
LABEL_29:

      break;
    case 13:
      (*(void (**)(uint64_t, _QWORD, __CFString *))(v31 + 16))(v31, (2 * *((_DWORD *)v202 + 44) * *((_DWORD *)v202 + 44)), off_1EE418DB8);
      v88 = 2 * *((_DWORD *)v202 + 44);
LABEL_8:
      v89 = &off_1EE418DC0;
LABEL_18:
      ((void (**)(_QWORD, _QWORD, __CFString *))v35)[2](v35, v88, *v89);
      break;
    default:
      break;
  }
  v131 = arc4random_uniform(0x3E8u);
  v132 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v133, v131, v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v132, v136, (uint64_t)CFSTR("Node_%@"), v137, v135);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v139, 8, v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C252414(v202[13]);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v141, v143, (uint64_t)v142, v144);

  sub_19C252414(v202[14]);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v141, v146, (uint64_t)v145, v147);

  sub_19C252414(v202[15]);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v141, v149, (uint64_t)v148, v150);

  sub_19C252414(v202[16]);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v141, v152, (uint64_t)v151, v153);

  sub_19C252414(v202[17]);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v141, v155, (uint64_t)v154, v156);

  sub_19C252414(v202[18]);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v141, v158, (uint64_t)v157, v159);

  sub_19C252414(v202[19]);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v141, v161, (uint64_t)v160, v162);

  sub_19C252414(v202[20]);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v141, v164, (uint64_t)v163, v165);

  v166 = [MontrealNNModelNode alloc];
  if (v196)
    v167 = (uint64_t)v196;
  else
    v167 = (uint64_t)v138;
  sub_19C251EFC(v202[6]);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = (void *)objc_msgSend_copy(v193, v169, v170, v171);
  v174 = (MontrealNNModelNode *)objc_msgSend_initWithName_nodeStr_activations_properties_weights_(v166, v173, v167, (uint64_t)v168, v141, v15, v172);
  node = self->_node;
  self->_node = v174;

  objc_msgSend_node(self, v176, v177, v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInputs_(v179, v180, (uint64_t)v194, v181);

  objc_msgSend_node(self, v182, v183, v184);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOutputs_(v185, v186, (uint64_t)v195, v187);

  weightIter = self->_weightIter;
  _Block_object_dispose(&v201, 8);

  return weightIter;
}

- (void)setInputs:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend_node(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInputs_(v7, v8, (uint64_t)v10, v9);

}

- (void)setInput:(id)a3 inputIndex:(int64_t)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  id v29;

  v29 = a3;
  objc_msgSend_node(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputs(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_mutableCopy(v13, v14, v15, v16);

  objc_msgSend_setObject_atIndexedSubscript_(v17, v18, (uint64_t)v29, a4);
  v22 = (void *)objc_msgSend_copy(v17, v19, v20, v21);
  objc_msgSend_node(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInputs_(v26, v27, (uint64_t)v22, v28);

}

- ($2F5DD3F8DC6DFA190B2787CD1D3A833E)parameters
{
  $2F5DD3F8DC6DFA190B2787CD1D3A833E *result;

  objc_copyStruct(retstr, &self->_parameters, 704, 1, 0);
  return result;
}

- (unint64_t)weightIter
{
  return self->_weightIter;
}

- (MontrealNNModelNode)node
{
  return (MontrealNNModelNode *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)weightDataFormat
{
  return self->_weightDataFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
}

@end

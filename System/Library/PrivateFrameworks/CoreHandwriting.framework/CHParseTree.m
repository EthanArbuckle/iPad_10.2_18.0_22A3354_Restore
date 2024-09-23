@implementation CHParseTree

- (CHParseTree)initWithGrammar:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CHParseTree *v12;
  NSNumberFormatter *v13;
  NSNumberFormatter *formatter;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a3;
  v11 = objc_msgSend_init(self, v6, v7, v8, v9, v10);
  v12 = (CHParseTree *)v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 16), a3);
    v13 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    formatter = v12->_formatter;
    v12->_formatter = v13;

    objc_msgSend_setMaximumFractionDigits_(v12->_formatter, v15, 9, v16, v17, v18);
    objc_msgSend_setRoundingMode_(v12->_formatter, v19, 6, v20, v21, v22);
  }

  return v12;
}

- (id)latexRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_root(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__latexRepresentationRecursive_(self, v8, (uint64_t)v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_latexRepresentationRecursive:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __CFString *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char isEqualToString;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  int v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  __CFString *v163;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8, v9))
  {
    v16 = v4;
    objc_msgSend_rightNode(v16, v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_leftNode(v16, v23, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__latexRepresentationRecursive_(self, v29, (uint64_t)v28, v30, v31, v32);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      objc_msgSend_name(v16, v33, v34, v35, v36, v37);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(v67, v68, (uint64_t)CFSTR("Op"), v69, v70, v71))
      {
        isEqualToString = objc_msgSend_isEqualToString_(v15, v72, (uint64_t)CFSTR("x"), v73, v74, v75);

        if ((isEqualToString & 1) == 0)
        {
LABEL_23:

          goto LABEL_24;
        }
        v67 = v15;
        v15 = CFSTR("×");
      }
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend_rightNode(v16, v33, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__latexRepresentationRecursive_(self, v39, (uint64_t)v38, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_rightNode(v16, v44, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v49, v50, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend_isEqualToString_(v55, v56, (uint64_t)CFSTR("FracExp"), v57, v58, v59);

    if (v60)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v61, (uint64_t)CFSTR("\\frac{%@}{%@}"), v63, v64, v65, v15, v43);
      v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_leftNode(v16, v61, v62, v63, v64, v65);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v77, v78, v79, v80, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend_isEqualToString_(v83, v84, (uint64_t)CFSTR("Frac"), v85, v86, v87);

      if (!v88)
      {
        objc_msgSend_rightNode(v16, v89, v90, v91, v92, v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v94, v95, v96, v97, v98, v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = objc_msgSend_isEqualToString_(v100, v101, (uint64_t)CFSTR("ParArg"), v102, v103, v104);

        objc_msgSend_leftNode(v16, v106, v107, v108, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v111, v112, v113, v114, v115, v116);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = v117;
        if (v105)
        {
          v123 = objc_msgSend_isEqualToString_(v117, v118, (uint64_t)CFSTR("Sqrt"), v119, v120, v121);

          if (v123)
          {

            v133 = objc_msgSend_length(v43, v128, v129, v130, v131, v132);
            objc_msgSend_substringWithRange_(v43, v134, 1, v133 - 2, v135, v136);
            v137 = objc_claimAutoreleasedReturnValue();

            v15 = CFSTR("sqrt");
            v43 = (void *)v137;
          }
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v124, (uint64_t)CFSTR("\\%@{%@}"), v125, v126, v127, v15, v43);
          v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        }
        if (objc_msgSend_isEqualToString_(v117, v118, (uint64_t)CFSTR("Pow"), v119, v120, v121)
          && (objc_msgSend_isEqualToString_(v15, v138, (uint64_t)CFSTR("^"), v139, v140, v141) & 1) != 0)
        {
          objc_msgSend_rightNode(v16, v142, v143, v144, v145, v146);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v147, v148, v149, v150, v151, v152);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          v158 = objc_msgSend_isEqualToString_(v153, v154, (uint64_t)CFSTR("CurlyArg"), v155, v156, v157);

          if ((v158 & 1) == 0)
          {
            objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v159, (uint64_t)CFSTR("%@{%@}"), v160, v161, v162, v15, v43);
            v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          }
        }
        else
        {

        }
        objc_msgSend_stringByAppendingString_(v15, v159, (uint64_t)v43, v160, v161, v162);
        v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      v66 = v43;
      v43 = v66;
    }
LABEL_21:
    v163 = v66;

    v67 = v15;
    v15 = v163;
    goto LABEL_22;
  }
  objc_msgSend_name(v4, v10, v11, v12, v13, v14);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v15;
}

- (id)functionRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;

  objc_msgSend_evaluationWithVariables_(self, a2, (uint64_t)&unk_1E78272E0, v2, v3, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = 0;
    v13 = 0;
  }
  else
  {
    objc_msgSend_evaluationWithVariables_(self, v6, (uint64_t)&unk_1E7827308, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend_evaluationWithVariables_(self, v6, (uint64_t)&unk_1E7827330, v8, v9, v10);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v15 = 0;
      if (!v13)
        goto LABEL_10;
    }
  }
  objc_msgSend_evaluation(self, v6, v7, v8, v9, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend_root(self, v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__functionRepresentationRecursive_(self, v23, (uint64_t)v22, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v27, v28, v29, v30, v31, v32);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = (void *)v13;
LABEL_10:
  v33 = v15;

  return v33;
}

- (id)_functionRepresentationRecursive:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int isEqualToString;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  int v167;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  char v180;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8, v9))
  {
    v16 = v4;
    objc_msgSend_rightNode(v16, v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_leftNode(v16, v23, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__functionRepresentationRecursive_(self, v29, (uint64_t)v28, v30, v31, v32);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend_rightNode(v16, v33, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__functionRepresentationRecursive_(self, v39, (uint64_t)v38, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_name(v16, v44, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v49, v50, (uint64_t)CFSTR("CurlyArg"), v51, v52, v53);

    if (isEqualToString)
    {
      v60 = (void *)MEMORY[0x1E0CB3940];
      v61 = objc_msgSend_length(v43, v55, v56, v57, v58, v59);
      objc_msgSend_substringToIndex_(v43, v62, v61 - 1, v63, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v60, v67, (uint64_t)CFSTR("%@)"), v68, v69, v70, v66);
      v71 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v72, (uint64_t)CFSTR("(%@"), v73, v74, v75, v71);
      v76 = objc_claimAutoreleasedReturnValue();
      v43 = (void *)v71;
LABEL_20:

      v15 = (void *)v76;
      goto LABEL_21;
    }
    objc_msgSend_leftNode(v16, v55, v56, v57, v58, v59);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v77, v78, v79, v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend_isEqualToString_(v83, v84, (uint64_t)CFSTR("Backslash"), v85, v86, v87);

    if (v88)
    {
      v94 = v43;
      v43 = v94;
LABEL_19:
      v76 = (uint64_t)v94;
      goto LABEL_20;
    }
    objc_msgSend_leftNode(v16, v89, v90, v91, v92, v93);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v95, v96, v97, v98, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v101, v102, (uint64_t)CFSTR("Pow"), v103, v104, v105)
      && objc_msgSend_isEqualToString_(v15, v106, (uint64_t)CFSTR("^"), v107, v108, v109))
    {
      objc_msgSend_rightNode(v16, v110, v111, v112, v113, v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v115, v116, v117, v118, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToString_(v121, v122, (uint64_t)CFSTR("ParArg"), v123, v124, v125) & 1) == 0)
      {
        objc_msgSend_rightNode(v16, v126, v127, v128, v129, v130);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v169, v170, v171, v172, v173, v174);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        v180 = objc_msgSend_isEqualToString_(v175, v176, (uint64_t)CFSTR("CurlyArg"), v177, v178, v179);

        if ((v180 & 1) == 0)
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v131, (uint64_t)CFSTR("%@(%@)"), v133, v134, v135, v15, v43);
LABEL_17:
          v94 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
LABEL_13:
        objc_msgSend_leftNode(v16, v131, v132, v133, v134, v135);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v136, v137, v138, v139, v140, v141);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v142, v143, (uint64_t)CFSTR("UExp"), v144, v145, v146))
        {

        }
        else
        {
          objc_msgSend_leftNode(v16, v147, v148, v149, v150, v151);
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v156, v157, v158, v159, v160, v161);
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          v167 = objc_msgSend_isEqualToString_(v162, v163, (uint64_t)CFSTR("UExp"), v164, v165, v166);

          if (!v167)
          {
            objc_msgSend_stringByAppendingString_(v15, v152, (uint64_t)v43, v153, v154, v155);
            v94 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_19;
          }
        }
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v152, (uint64_t)CFSTR("%@*%@"), v153, v154, v155, v15, v43);
        goto LABEL_17;
      }

    }
    goto LABEL_13;
  }
  objc_msgSend_name(v4, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v15;
}

- (id)evaluation
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_evaluationWithVariables_caseSensitive_(self, a2, 0, 1, v2, v3);
}

- (id)evaluationWithVariables:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_evaluationWithVariables_caseSensitive_(self, a2, (uint64_t)a3, 1, v3, v4);
}

- (id)evaluationWithVariables:(id)a3 caseSensitive:(BOOL)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;

  self->__caseSensitive = a4;
  v5 = a3;
  objc_msgSend_root(self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__evaluationRecursive_withVariables_(self, v12, (uint64_t)v11, (uint64_t)v5, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_isEqualToString_(v15, v16, (uint64_t)CFSTR("STOP"), v17, v18, v19) & 1) != 0)
  {

    return 0;
  }
  else
  {
    objc_msgSend_evaluateOpExpPriority_(self, v20, (uint64_t)v15, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_numberFromString_(self->_formatter, v25, (uint64_t)v24, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    return v29;
  }
}

- (id)_evaluationRecursive:(id)a3 withVariables:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BOOL4 caseSensitive;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __CFString *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __CFString *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  __CFString *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  int v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  char v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  void *v349;
  const char *v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  const char *v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  const char *v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  const char *v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  const char *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  void *v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  void *v402;
  const char *v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  void *v412;
  const char *v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  void *v418;
  const char *v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  int v423;
  uint64_t v424;
  void *v425;
  const char *v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  int v430;
  const char *v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  void *v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  void *v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  char v447;
  void *v448;
  const char *v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  void *v454;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  const char *v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  const char *v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  void *v468;
  const char *v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  void *v474;
  const char *v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  int v479;
  uint64_t v480;
  void *v481;
  const char *v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  void *v487;
  const char *v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  int v492;
  uint64_t v493;
  void *v494;
  const char *v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  void *v500;
  const char *v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  int v505;
  const char *v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  void *v511;
  const char *v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  double v517;
  long double v518;
  const char *v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  void *v523;
  const char *v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  double v529;
  long double v530;
  long double v531;
  NSNumberFormatter *formatter;
  const char *v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  void *v538;
  const char *v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  __CFString *v543;
  void *v544;
  const char *v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  void *v550;
  const char *v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  int v555;
  const char *v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  uint64_t v560;
  void *v561;
  const char *v562;
  uint64_t v563;
  uint64_t v564;
  uint64_t v565;
  uint64_t v566;
  void *v567;
  const char *v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  const char *v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  void *v577;
  const char *v578;
  uint64_t v579;
  uint64_t v580;
  uint64_t v581;
  uint64_t v582;
  void *v583;
  const char *v584;
  uint64_t v585;
  uint64_t v586;
  uint64_t v587;
  int v588;
  const char *v589;
  uint64_t v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  void *v594;
  const char *v595;
  uint64_t v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  void *v600;
  const char *v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  const char *v605;
  uint64_t v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  const char *v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  void *v614;
  const char *v615;
  uint64_t v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  void *v620;
  const char *v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  int v625;
  uint64_t v626;
  void *v627;
  const char *v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  uint64_t v632;
  void *v633;
  const char *v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  int v638;
  const char *v639;
  uint64_t v640;
  uint64_t v641;
  uint64_t v642;
  uint64_t v643;
  void *v644;
  const char *v645;
  uint64_t v646;
  uint64_t v647;
  uint64_t v648;
  uint64_t v649;
  void *v650;
  const char *v651;
  uint64_t v652;
  uint64_t v653;
  uint64_t v654;
  int v655;
  const char *v656;
  uint64_t v657;
  uint64_t v658;
  uint64_t v659;
  uint64_t v660;
  const char *v661;
  uint64_t v662;
  uint64_t v663;
  uint64_t v664;
  uint64_t v665;
  void *v666;
  const char *v667;
  uint64_t v668;
  uint64_t v669;
  uint64_t v670;
  uint64_t v671;
  void *v672;
  const char *v673;
  uint64_t v674;
  uint64_t v675;
  void *v676;
  const char *v677;
  uint64_t v678;
  uint64_t v679;
  uint64_t v680;
  void *v681;
  const char *v682;
  uint64_t v683;
  uint64_t v684;
  uint64_t v685;
  const char *v686;
  uint64_t v687;
  uint64_t v688;
  uint64_t v689;
  const char *v690;
  uint64_t v691;
  uint64_t v692;
  uint64_t v693;
  void *v694;
  const char *v695;
  uint64_t v696;
  uint64_t v697;
  uint64_t v698;
  uint64_t v699;
  double v700;
  double v701;
  const char *v702;
  uint64_t v703;
  uint64_t v704;
  uint64_t v705;
  void *v706;
  const char *v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  uint64_t v711;
  double v712;
  double v713;
  NSNumberFormatter *v714;
  const char *v715;
  uint64_t v716;
  uint64_t v717;
  uint64_t v718;
  uint64_t v719;
  void *v720;
  const char *v721;
  uint64_t v722;
  uint64_t v723;
  uint64_t v724;
  void *v725;
  const char *v726;
  uint64_t v727;
  uint64_t v728;
  uint64_t v729;
  uint64_t v730;
  void *v731;
  const char *v732;
  uint64_t v733;
  uint64_t v734;
  uint64_t v735;
  int v736;
  const char *v737;
  uint64_t v738;
  uint64_t v739;
  uint64_t v740;
  uint64_t v741;
  void *v742;
  const char *v743;
  uint64_t v744;
  uint64_t v745;
  uint64_t v746;
  uint64_t v747;
  double v748;
  double v749;
  const char *v750;
  uint64_t v751;
  uint64_t v752;
  uint64_t v753;
  const char *v754;
  uint64_t v755;
  uint64_t v756;
  uint64_t v757;
  uint64_t v758;
  void *v759;
  const char *v760;
  uint64_t v761;
  uint64_t v762;
  uint64_t v763;
  uint64_t v764;
  void *v765;
  const char *v766;
  uint64_t v767;
  uint64_t v768;
  uint64_t v769;
  int isEqual;
  const char *v771;
  uint64_t v772;
  uint64_t v773;
  uint64_t v774;
  uint64_t v775;
  void *v776;
  const char *v777;
  uint64_t v778;
  uint64_t v779;
  uint64_t v780;
  uint64_t v781;
  double v782;
  double v783;
  const char *v784;
  uint64_t v785;
  uint64_t v786;
  uint64_t v787;
  uint64_t v788;
  void *v789;
  const char *v790;
  uint64_t v791;
  uint64_t v792;
  uint64_t v793;
  uint64_t v794;
  void *v795;
  const char *v796;
  uint64_t v797;
  uint64_t v798;
  uint64_t v799;
  int v800;
  const char *v801;
  uint64_t v802;
  uint64_t v803;
  uint64_t v804;
  uint64_t v805;
  void *v806;
  const char *v807;
  uint64_t v808;
  uint64_t v809;
  uint64_t v810;
  uint64_t v811;
  double v812;
  long double v813;
  void *v814;
  const char *v815;
  uint64_t v816;
  uint64_t v817;
  uint64_t v818;
  uint64_t v819;
  double v820;
  void *v821;
  const char *v822;
  uint64_t v823;
  uint64_t v824;
  uint64_t v825;
  uint64_t v826;
  void *v827;
  const char *v828;
  uint64_t v829;
  uint64_t v830;
  uint64_t v831;
  int v832;
  const char *v833;
  uint64_t v834;
  uint64_t v835;
  uint64_t v836;
  uint64_t v837;
  void *v838;
  const char *v839;
  uint64_t v840;
  uint64_t v841;
  uint64_t v842;
  uint64_t v843;
  double v844;
  long double v845;
  void *v846;
  const char *v847;
  uint64_t v848;
  uint64_t v849;
  uint64_t v850;
  uint64_t v851;
  void *v852;
  const char *v853;
  uint64_t v854;
  uint64_t v855;
  uint64_t v856;
  int v857;
  const char *v858;
  uint64_t v859;
  uint64_t v860;
  uint64_t v861;
  uint64_t v862;
  void *v863;
  const char *v864;
  uint64_t v865;
  uint64_t v866;
  uint64_t v867;
  uint64_t v868;
  double v869;
  long double v870;
  void *v871;
  void *v872;
  const char *v873;
  uint64_t v874;
  uint64_t v875;
  uint64_t v876;
  uint64_t v877;
  void *v878;
  const char *v879;
  uint64_t v880;
  uint64_t v881;
  uint64_t v882;
  uint64_t v883;
  void *v884;
  const char *v885;
  uint64_t v886;
  uint64_t v887;
  uint64_t v888;
  uint64_t v889;
  void *v890;
  const char *v891;
  uint64_t v892;
  uint64_t v893;
  uint64_t v894;
  const char *v895;
  uint64_t v896;
  uint64_t v897;
  uint64_t v898;
  uint64_t v899;
  void *v900;
  const char *v901;
  uint64_t v902;
  uint64_t v903;
  uint64_t v904;
  uint64_t v905;
  void *v906;
  const char *v907;
  uint64_t v908;
  uint64_t v909;
  uint64_t v910;
  const char *v911;
  uint64_t v912;
  uint64_t v913;
  uint64_t v914;
  uint64_t v915;
  void *v916;
  const char *v917;
  uint64_t v918;
  uint64_t v919;
  uint64_t v920;
  uint64_t v921;
  void *v922;
  const char *v923;
  uint64_t v924;
  uint64_t v925;
  uint64_t v926;
  const char *v927;
  uint64_t v928;
  uint64_t v929;
  uint64_t v930;
  const char *v931;
  uint64_t v932;
  uint64_t v933;
  uint64_t v934;
  const char *v935;
  uint64_t v936;
  uint64_t v937;
  uint64_t v938;
  const char *v939;
  uint64_t v940;
  uint64_t v941;
  uint64_t v942;
  const char *v943;
  uint64_t v944;
  uint64_t v945;
  uint64_t v946;
  const char *v947;
  uint64_t v948;
  uint64_t v949;
  uint64_t v950;
  const char *v951;
  uint64_t v952;
  uint64_t v953;
  uint64_t v954;
  const char *v955;
  uint64_t v956;
  uint64_t v957;
  uint64_t v958;
  void *v959;
  const char *v960;
  uint64_t v961;
  uint64_t v962;
  uint64_t v963;
  uint64_t v964;
  double v965;
  double v966;
  const char *v967;
  uint64_t v968;
  uint64_t v969;
  uint64_t v970;
  void *v971;
  const char *v972;
  uint64_t v973;
  uint64_t v974;
  uint64_t v975;
  uint64_t v976;
  double v977;
  double v978;
  NSNumberFormatter *v979;
  const char *v980;
  uint64_t v981;
  uint64_t v982;
  uint64_t v983;
  uint64_t v984;
  void *v985;
  const char *v986;
  uint64_t v987;
  uint64_t v988;
  uint64_t v989;
  uint64_t v990;
  void *v991;
  const char *v992;
  uint64_t v993;
  uint64_t v994;
  uint64_t v995;
  uint64_t v996;
  void *v997;
  const char *v998;
  uint64_t v999;
  uint64_t v1000;
  uint64_t v1001;
  int v1002;
  const char *v1003;
  uint64_t v1004;
  uint64_t v1005;
  uint64_t v1006;
  uint64_t v1007;
  void *v1008;
  void *v1009;
  const char *v1010;
  uint64_t v1011;
  uint64_t v1012;
  uint64_t v1013;
  const char *v1014;
  uint64_t v1015;
  uint64_t v1016;
  uint64_t v1017;
  void *v1018;
  void *v1019;
  void *v1020;
  void *v1021;
  char v1022;
  char v1023;
  void *v1024;
  void *v1025;
  void *v1026;
  void *v1027;
  void *v1028;
  void *v1029;
  void *v1030;
  char isEqualToString;
  void *v1032;
  void *v1033;
  void *v1034;
  void *v1035;
  void *v1036;
  char v1037;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend_rightNode(v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_leftNode(v8, v15, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__evaluationRecursive_withVariables_(self, v21, (uint64_t)v20, (uint64_t)v7, v22, v23);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_isEqualToString_(v24, v25, (uint64_t)CFSTR("STOP"), v26, v27, v28))
    {
      v34 = v24;
      v24 = v34;
LABEL_35:
      v122 = v34;
      goto LABEL_36;
    }
    objc_msgSend_rightNode(v8, v29, v30, v31, v32, v33);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__evaluationRecursive_withVariables_(self, v76, (uint64_t)v75, (uint64_t)v7, v77, v78);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_isEqualToString_(v69, v79, (uint64_t)CFSTR("STOP"), v80, v81, v82))
      goto LABEL_10;
    objc_msgSend_name(v8, v83, v84, v85, v86, v87);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v123, v124, (uint64_t)CFSTR("Number"), v125, v126, v127) & 1) != 0)
      goto LABEL_25;
    objc_msgSend_name(v8, v128, v129, v130, v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v133, v134, (uint64_t)CFSTR("DecPointDigitBlock"), v135, v136, v137) & 1) != 0)
    {
LABEL_24:

LABEL_25:
      goto LABEL_26;
    }
    objc_msgSend_name(v8, v138, v139, v140, v141, v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v143, v144, (uint64_t)CFSTR("DigitBlock"), v145, v146, v147) & 1) != 0)
    {
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend_name(v8, v148, v149, v150, v151, v152);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v153, v154, (uint64_t)CFSTR("IntDigitBlock"), v155, v156, v157) & 1) != 0)
    {
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend_name(v8, v158, v159, v160, v161, v162);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v163, v164, (uint64_t)CFSTR("TSepDigitTriplet"), v165, v166, v167) & 1) != 0)
    {
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend_name(v8, v168, v169, v170, v171, v172);
    v1034 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v1034, v173, (uint64_t)CFSTR("DigitTriplet"), v174, v175, v176) & 1) != 0)
    {

      goto LABEL_21;
    }
    objc_msgSend_name(v8, v177, v178, v179, v180, v181);
    v1028 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v1028, v227, (uint64_t)CFSTR("DigitPair"), v228, v229, v230);

    if ((isEqualToString & 1) != 0)
      goto LABEL_26;
    objc_msgSend_leftNode(v8, v182, v183, v184, v185, v186);
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v231, v232, v233, v234, v235, v236);
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v237, v238, (uint64_t)CFSTR("DecPointDigitBlock"), v239, v240, v241) & 1) != 0)
    {
LABEL_48:

LABEL_28:
      objc_msgSend_stringByAppendingString_(v24, v199, (uint64_t)v69, v200, v201, v202);
      v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    objc_msgSend_leftNode(v8, v242, v243, v244, v245, v246);
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v247, v248, v249, v250, v251, v252);
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v253, v254, (uint64_t)CFSTR("DigitBlock"), v255, v256, v257) & 1) != 0)
    {
LABEL_47:

      goto LABEL_48;
    }
    objc_msgSend_leftNode(v8, v258, v259, v260, v261, v262);
    v1035 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1035, v263, v264, v265, v266, v267);
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v268, v269, (uint64_t)CFSTR("IntDigitBlock"), v270, v271, v272) & 1) != 0)
    {
LABEL_46:

      goto LABEL_47;
    }
    objc_msgSend_leftNode(v8, v273, v274, v275, v276, v277);
    v1032 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1032, v278, v279, v280, v281, v282);
    v1029 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v1029, v283, (uint64_t)CFSTR("TSepDigitTriplet"), v284, v285, v286) & 1) != 0)
    {
LABEL_45:

      goto LABEL_46;
    }
    objc_msgSend_leftNode(v8, v287, v288, v289, v290, v291);
    v1026 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1026, v292, v293, v294, v295, v296);
    v1024 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v1024, v297, (uint64_t)CFSTR("DigitTriplet"), v298, v299, v300) & 1) != 0)
    {

      goto LABEL_45;
    }
    objc_msgSend_leftNode(v8, v301, v302, v303, v304, v305);
    v1020 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1020, v306, v307, v308, v309, v310);
    v1018 = (void *)objc_claimAutoreleasedReturnValue();
    v1022 = objc_msgSend_isEqualToString_(v1018, v311, (uint64_t)CFSTR("DigitPair"), v312, v313, v314);

    if ((v1022 & 1) != 0)
      goto LABEL_28;
    objc_msgSend_rightNode(v8, v199, v315, v200, v201, v202);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v123, v316, v317, v318, v319, v320);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v133, v321, (uint64_t)CFSTR("DecPointDigitBlock"), v322, v323, v324) & 1) != 0)
      goto LABEL_24;
    objc_msgSend_rightNode(v8, v325, v326, v327, v328, v329);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v143, v330, v331, v332, v333, v334);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v153, v335, (uint64_t)CFSTR("DigitBlock"), v336, v337, v338) & 1) != 0)
      goto LABEL_22;
    objc_msgSend_rightNode(v8, v339, v340, v341, v342, v343);
    v1036 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1036, v344, v345, v346, v347, v348);
    v349 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v349, v350, (uint64_t)CFSTR("IntDigitBlock"), v351, v352, v353) & 1) != 0)
    {
LABEL_57:

      goto LABEL_22;
    }
    objc_msgSend_rightNode(v8, v354, v355, v356, v357, v358);
    v1033 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1033, v359, v360, v361, v362, v363);
    v1030 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v1030, v364, (uint64_t)CFSTR("TSepDigitTriplet"), v365, v366, v367) & 1) != 0)
    {
LABEL_56:

      goto LABEL_57;
    }
    objc_msgSend_rightNode(v8, v368, v369, v370, v371, v372);
    v1027 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1027, v373, v374, v375, v376, v377);
    v1025 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v1025, v378, (uint64_t)CFSTR("DigitTriplet"), v379, v380, v381) & 1) != 0)
    {

      goto LABEL_56;
    }
    objc_msgSend_rightNode(v8, v382, v383, v384, v385, v386);
    v1021 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1021, v387, v388, v389, v390, v391);
    v1019 = (void *)objc_claimAutoreleasedReturnValue();
    v1023 = objc_msgSend_isEqualToString_(v1019, v392, (uint64_t)CFSTR("DigitPair"), v393, v394, v395);

    if ((v1023 & 1) != 0)
    {
LABEL_26:
      objc_msgSend_leftNode(v8, v182, v183, v184, v185, v186);
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v187, v188, v189, v190, v191, v192);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      v198 = objc_msgSend_isEqualToString_(v193, v194, (uint64_t)CFSTR("TSep"), v195, v196, v197);

      if (v198)
      {

        v24 = &stru_1E77F6F28;
      }
      goto LABEL_28;
    }
    objc_msgSend_leftNode(v8, v182, v183, v184, v185, v186);
    v396 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v396, v397, v398, v399, v400, v401);
    v402 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v402, v403, (uint64_t)CFSTR("Digit"), v404, v405, v406) & 1) != 0)
    {
      objc_msgSend_rightNode(v8, v407, v408, v409, v410, v411);
      v412 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v412, v413, v414, v415, v416, v417);
      v418 = (void *)objc_claimAutoreleasedReturnValue();
      v423 = objc_msgSend_isEqualToString_(v418, v419, (uint64_t)CFSTR("Digit"), v420, v421, v422);

      if (v423)
        goto LABEL_28;
    }
    else
    {

    }
    objc_msgSend_name(v8, v199, v424, v200, v201, v202);
    v425 = (void *)objc_claimAutoreleasedReturnValue();
    v430 = objc_msgSend_isEqualToString_(v425, v426, (uint64_t)CFSTR("Const"), v427, v428, v429);

    if (v430)
    {
      objc_msgSend_rightNode(v8, v431, v432, v433, v434, v435);
      v436 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v436, v437, v438, v439, v440, v441);
      v442 = (void *)objc_claimAutoreleasedReturnValue();
      v447 = objc_msgSend_isEqualToString_(v442, v443, (uint64_t)CFSTR("Pi"), v444, v445, v446);

      if ((v447 & 1) != 0)
      {
        v122 = CFSTR("3.1415926");
        goto LABEL_30;
      }
    }
    objc_msgSend_leftNode(v8, v431, v432, v433, v434, v435);
    v448 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v448, v449, v450, v451, v452, v453);
    v454 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v454, v455, (uint64_t)CFSTR("Op"), v456, v457, v458))
    {

LABEL_70:
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v464, (uint64_t)CFSTR("%@ %@"), v465, v466, v467, v24, v69);
      v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    objc_msgSend_leftNode(v8, v459, v460, v461, v462, v463);
    v468 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v468, v469, v470, v471, v472, v473);
    v474 = (void *)objc_claimAutoreleasedReturnValue();
    v479 = objc_msgSend_isEqualToString_(v474, v475, (uint64_t)CFSTR("Frac"), v476, v477, v478);

    if (v479)
      goto LABEL_70;
    objc_msgSend_rightNode(v8, v464, v480, v465, v466, v467);
    v481 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v481, v482, v483, v484, v485, v486);
    v487 = (void *)objc_claimAutoreleasedReturnValue();
    v492 = objc_msgSend_isEqualToString_(v487, v488, (uint64_t)CFSTR("OpExp"), v489, v490, v491);

    if (v492)
      goto LABEL_70;
    objc_msgSend_rightNode(v8, v464, v493, v465, v466, v467);
    v494 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v494, v495, v496, v497, v498, v499);
    v500 = (void *)objc_claimAutoreleasedReturnValue();
    v505 = objc_msgSend_isEqualToString_(v500, v501, (uint64_t)CFSTR("PowExp"), v502, v503, v504);

    if (v505)
    {
      objc_msgSend_numberFromString_(self->_formatter, v506, (uint64_t)v24, v508, v509, v510);
      v511 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v511, v512, v513, v514, v515, v516);
      v518 = v517;

      objc_msgSend_numberFromString_(self->_formatter, v519, (uint64_t)v69, v520, v521, v522);
      v523 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v523, v524, v525, v526, v527, v528);
      v530 = v529;

      v531 = pow(v518, v530);
      formatter = self->_formatter;
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v533, v534, v535, v536, v537, (double)v531);
LABEL_73:
      v538 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringFromNumber_(formatter, v539, (uint64_t)v538, v540, v541, v542);
      v543 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_74:
      v122 = v543;
LABEL_75:

      goto LABEL_30;
    }
    objc_msgSend_leftNode(v8, v506, v507, v508, v509, v510);
    v544 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v544, v545, v546, v547, v548, v549);
    v550 = (void *)objc_claimAutoreleasedReturnValue();
    v555 = objc_msgSend_isEqualToString_(v550, v551, (uint64_t)CFSTR("Pow"), v552, v553, v554);

    if (v555)
    {
LABEL_10:
      v74 = v69;
LABEL_29:
      v122 = v74;
LABEL_30:

LABEL_36:
      goto LABEL_37;
    }
    objc_msgSend_leftNode(v8, v556, v557, v558, v559, v560);
    v561 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v561, v562, v563, v564, v565, v566);
    v567 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v567, v568, (uint64_t)CFSTR("LPar"), v569, v570, v571))
    {

      goto LABEL_10;
    }
    objc_msgSend_leftNode(v8, v572, v573, v574, v575, v576);
    v577 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v577, v578, v579, v580, v581, v582);
    v583 = (void *)objc_claimAutoreleasedReturnValue();
    v588 = objc_msgSend_isEqualToString_(v583, v584, (uint64_t)CFSTR("LCurly"), v585, v586, v587);

    if (v588)
      goto LABEL_10;
    objc_msgSend_rightNode(v8, v589, v590, v591, v592, v593);
    v594 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v594, v595, v596, v597, v598, v599);
    v600 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v600, v601, (uint64_t)CFSTR("RPar"), v602, v603, v604))
    {

LABEL_83:
      objc_msgSend_evaluateOpExpPriority_(self, v610, (uint64_t)v24, v611, v612, v613);
      v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    objc_msgSend_rightNode(v8, v605, v606, v607, v608, v609);
    v614 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v614, v615, v616, v617, v618, v619);
    v620 = (void *)objc_claimAutoreleasedReturnValue();
    v625 = objc_msgSend_isEqualToString_(v620, v621, (uint64_t)CFSTR("RCurly"), v622, v623, v624);

    if (v625)
      goto LABEL_83;
    objc_msgSend_rightNode(v8, v610, v626, v611, v612, v613);
    v627 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v627, v628, v629, v630, v631, v632);
    v633 = (void *)objc_claimAutoreleasedReturnValue();
    v638 = objc_msgSend_isEqualToString_(v633, v634, (uint64_t)CFSTR("Eq"), v635, v636, v637);

    if (v638)
    {
      v74 = v24;
      v24 = v74;
      goto LABEL_29;
    }
    objc_msgSend_rightNode(v8, v639, v640, v641, v642, v643);
    v644 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v644, v645, v646, v647, v648, v649);
    v650 = (void *)objc_claimAutoreleasedReturnValue();
    v655 = objc_msgSend_isEqualToString_(v650, v651, (uint64_t)CFSTR("FracExp"), v652, v653, v654);

    if (v655)
    {
      objc_msgSend_evaluateOpExpPriority_(self, v656, (uint64_t)v24, v658, v659, v660);
      v538 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rightNode(v8, v661, v662, v663, v664, v665);
      v666 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rightNode(v666, v667, v668, v669, v670, v671);
      v672 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__evaluationRecursive_withVariables_(self, v673, (uint64_t)v672, (uint64_t)v7, v674, v675);
      v676 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_evaluateOpExpPriority_(self, v677, (uint64_t)v676, v678, v679, v680);
      v681 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = CFSTR("STOP");
      if ((objc_msgSend_isEqualToString_(v538, v682, (uint64_t)CFSTR("STOP"), v683, v684, v685) & 1) == 0)
      {
        v122 = CFSTR("STOP");
        if ((objc_msgSend_isEqualToString_(v681, v686, (uint64_t)CFSTR("STOP"), v687, v688, v689) & 1) == 0)
        {
          objc_msgSend_numberFromString_(self->_formatter, v690, (uint64_t)v538, v691, v692, v693);
          v694 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v694, v695, v696, v697, v698, v699);
          v701 = v700;

          objc_msgSend_numberFromString_(self->_formatter, v702, (uint64_t)v681, v703, v704, v705);
          v706 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v706, v707, v708, v709, v710, v711);
          v713 = v712;

          v714 = self->_formatter;
          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v715, v716, v717, v718, v719, v701 / v713);
          v720 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringFromNumber_(v714, v721, (uint64_t)v720, v722, v723, v724);
          v122 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
      }

      goto LABEL_75;
    }
    objc_msgSend_leftNode(v8, v656, v657, v658, v659, v660);
    v725 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v725, v726, v727, v728, v729, v730);
    v731 = (void *)objc_claimAutoreleasedReturnValue();
    v736 = objc_msgSend_isEqualToString_(v731, v732, (uint64_t)CFSTR("Mod"), v733, v734, v735);

    if (v736)
    {
      objc_msgSend_numberFromString_(self->_formatter, v737, (uint64_t)v69, v739, v740, v741);
      v742 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v742, v743, v744, v745, v746, v747);
      v749 = v748;

      if ((objc_msgSend_isEqualToString_(v24, v750, (uint64_t)CFSTR("+"), v751, v752, v753) & 1) == 0)
      {
        if (!objc_msgSend_isEqualToString_(v24, v754, (uint64_t)CFSTR("-"), v756, v757, v758))
        {
          v122 = CFSTR("STOP");
          goto LABEL_30;
        }
        v749 = -v749;
      }
      formatter = self->_formatter;
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v754, v755, v756, v757, v758, v749);
      goto LABEL_73;
    }
    objc_msgSend_leftNode(v8, v737, v738, v739, v740, v741);
    v759 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v759, v760, v761, v762, v763, v764);
    v765 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v765, v766, (uint64_t)CFSTR("Sqrt"), v767, v768, v769);

    if (isEqual)
    {
      objc_msgSend_numberFromString_(self->_formatter, v771, (uint64_t)v69, v773, v774, v775);
      v776 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v776, v777, v778, v779, v780, v781);
      v783 = v782;

      formatter = self->_formatter;
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v784, v785, v786, v787, v788, sqrt(v783));
      goto LABEL_73;
    }
    objc_msgSend_leftNode(v8, v771, v772, v773, v774, v775);
    v789 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v789, v790, v791, v792, v793, v794);
    v795 = (void *)objc_claimAutoreleasedReturnValue();
    v800 = objc_msgSend_isEqual_(v795, v796, (uint64_t)CFSTR("Sin"), v797, v798, v799);

    if (v800)
    {
      objc_msgSend_numberFromString_(self->_formatter, v801, (uint64_t)v69, v803, v804, v805);
      v806 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v806, v807, v808, v809, v810, v811);
      v813 = v812;

      formatter = self->_formatter;
      v814 = (void *)MEMORY[0x1E0CB37E8];
      v820 = sin(v813);
LABEL_105:
      objc_msgSend_numberWithDouble_(v814, v815, v816, v817, v818, v819, v820);
      goto LABEL_73;
    }
    objc_msgSend_leftNode(v8, v801, v802, v803, v804, v805);
    v821 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v821, v822, v823, v824, v825, v826);
    v827 = (void *)objc_claimAutoreleasedReturnValue();
    v832 = objc_msgSend_isEqual_(v827, v828, (uint64_t)CFSTR("Cos"), v829, v830, v831);

    if (v832)
    {
      objc_msgSend_numberFromString_(self->_formatter, v833, (uint64_t)v69, v835, v836, v837);
      v838 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v838, v839, v840, v841, v842, v843);
      v845 = v844;

      formatter = self->_formatter;
      v814 = (void *)MEMORY[0x1E0CB37E8];
      v820 = cos(v845);
      goto LABEL_105;
    }
    objc_msgSend_leftNode(v8, v833, v834, v835, v836, v837);
    v846 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v846, v847, v848, v849, v850, v851);
    v852 = (void *)objc_claimAutoreleasedReturnValue();
    v857 = objc_msgSend_isEqual_(v852, v853, (uint64_t)CFSTR("Tan"), v854, v855, v856);

    if (v857)
    {
      objc_msgSend_numberFromString_(self->_formatter, v858, (uint64_t)v69, v860, v861, v862);
      v863 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v863, v864, v865, v866, v867, v868);
      v870 = v869;

      formatter = self->_formatter;
      v814 = (void *)MEMORY[0x1E0CB37E8];
      v820 = tan(v870);
      goto LABEL_105;
    }
    v871 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_leftNode(v8, v858, v859, v860, v861, v862);
    v872 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v872, v873, v874, v875, v876, v877);
    v878 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_rightNode(v8, v879, v880, v881, v882, v883);
    v884 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v884, v885, v886, v887, v888, v889);
    v890 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v871, v891, (uint64_t)CFSTR("%@ %@"), v892, v893, v894, v878, v890);
    v538 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_leftNode(v8, v895, v896, v897, v898, v899);
    v900 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v900, v901, v902, v903, v904, v905);
    v906 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v906, v907, (uint64_t)CFSTR("UExp"), v908, v909, v910) & 1) == 0)
    {
      objc_msgSend_rightNode(v8, v911, v912, v913, v914, v915);
      v916 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v916, v917, v918, v919, v920, v921);
      v922 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToString_(v922, v923, (uint64_t)CFSTR("UExp"), v924, v925, v926) & 1) == 0
        && (objc_msgSend_isEqualToString_(v538, v927, (uint64_t)CFSTR("Number Const"), v928, v929, v930) & 1) == 0
        && (objc_msgSend_isEqualToString_(v538, v931, (uint64_t)CFSTR("Digit Const"), v932, v933, v934) & 1) == 0
        && (objc_msgSend_isEqualToString_(v538, v935, (uint64_t)CFSTR("Number Variable"), v936, v937, v938) & 1) == 0
        && (objc_msgSend_isEqualToString_(v538, v939, (uint64_t)CFSTR("Digit Variable"), v940, v941, v942) & 1) == 0
        && (objc_msgSend_isEqualToString_(v538, v943, (uint64_t)CFSTR("Const Number"), v944, v945, v946) & 1) == 0
        && (objc_msgSend_isEqualToString_(v538, v947, (uint64_t)CFSTR("Const Digit"), v948, v949, v950) & 1) == 0)
      {
        v1037 = objc_msgSend_isEqualToString_(v538, v951, (uint64_t)CFSTR("Const Const"), v952, v953, v954);

        if ((v1037 & 1) == 0)
        {
          objc_msgSend_leftNode(v8, v955, v990, v956, v957, v958);
          v991 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v991, v992, v993, v994, v995, v996);
          v997 = (void *)objc_claimAutoreleasedReturnValue();
          v1002 = objc_msgSend_isEqualToString_(v997, v998, (uint64_t)CFSTR("Backslash"), v999, v1000, v1001);

          if (v1002)
          {
            v543 = v69;
          }
          else
          {
            if (qword_1EF567FD0 != -1)
              dispatch_once(&qword_1EF567FD0, &unk_1E77F1550);
            v1008 = (void *)qword_1EF567FC8;
            objc_msgSend_name(v8, v1003, v1004, v1005, v1006, v1007);
            v1009 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v1008) = objc_msgSend_containsObject_(v1008, v1010, (uint64_t)v1009, v1011, v1012, v1013);

            if (!(_DWORD)v1008)
            {
              v122 = CFSTR("STOP");
              goto LABEL_75;
            }
            objc_msgSend_stringByAppendingString_(v24, v1014, (uint64_t)v69, v1015, v1016, v1017);
            v543 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_74;
        }
LABEL_116:
        objc_msgSend_numberFromString_(self->_formatter, v955, (uint64_t)v24, v956, v957, v958);
        v959 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v959, v960, v961, v962, v963, v964);
        v966 = v965;

        objc_msgSend_numberFromString_(self->_formatter, v967, (uint64_t)v69, v968, v969, v970);
        v971 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v971, v972, v973, v974, v975, v976);
        v978 = v977;

        v979 = self->_formatter;
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v980, v981, v982, v983, v984, v966 * v978);
        v985 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringFromNumber_(v979, v986, (uint64_t)v985, v987, v988, v989);
        v122 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_75;
      }

    }
    goto LABEL_116;
  }
  objc_msgSend_name(v8, v15, v16, v17, v18, v19);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend_isEqualToString_(v35, v36, (uint64_t)CFSTR("Variable"), v37, v38, v39);

  if (v40)
  {
    caseSensitive = self->__caseSensitive;
    objc_msgSend_leftNode(v8, v41, v42, v43, v44, v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v47, v48, v49, v50, v51, v52);
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v24 = v53;
    if (!caseSensitive)
    {
      objc_msgSend_lowercaseString(v53, v54, v55, v56, v57, v58);
      v59 = objc_claimAutoreleasedReturnValue();

      v24 = (__CFString *)v59;
    }

    objc_msgSend_objectForKeyedSubscript_(v7, v60, (uint64_t)v24, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v64)
    {
      v122 = CFSTR("STOP");
      goto LABEL_36;
    }
    objc_msgSend_objectForKeyedSubscript_(v7, v65, (uint64_t)v24, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromNumber_(self->_formatter, v70, (uint64_t)v69, v71, v72, v73);
    v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  objc_msgSend_name(v8, v41, v42, v43, v44, v45);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend_isEqualToString_(v88, v89, (uint64_t)CFSTR("Variable"), v90, v91, v92);

  if (!v93)
    goto LABEL_34;
  objc_msgSend_leftNode(v8, v94, v95, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v99, v100, v101, v102, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v105, v106, v107, v108, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend_isEqualToString_(v111, v112, (uint64_t)CFSTR("e"), v113, v114, v115);

  if ((v116 & 1) == 0)
  {
    objc_msgSend_leftNode(v8, v117, v118, v119, v120, v121);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v203, v204, v205, v206, v207, v208);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v209, v210, v211, v212, v213, v214);
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    v220 = objc_msgSend_isEqualToString_(v215, v216, (uint64_t)CFSTR("π"), v217, v218, v219);

    if ((v220 & 1) != 0)
    {
      v122 = CFSTR("3.1415926");
      goto LABEL_37;
    }
LABEL_34:
    objc_msgSend_leftNode(v8, v94, v95, v96, v97, v98);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getStringValue(v24, v221, v222, v223, v224, v225);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  v122 = CFSTR("2.7182818");
LABEL_37:

  return v122;
}

- (id)evaluateOpExpPriority:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSNumberFormatter *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  double v75;
  NSNumberFormatter *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  double v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  NSNumberFormatter *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char isEqualToString;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  NSNumberFormatter *formatter;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  double v158;
  double v159;
  NSNumberFormatter *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  double v176;
  double v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  char v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  int v189;
  NSNumberFormatter *v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  double v202;
  long double v203;
  NSNumberFormatter *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  double v220;
  long double v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  __CFString *v232;
  double v233;
  NSNumberFormatter *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  NSNumberFormatter *v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  double v266;
  double v267;
  NSNumberFormatter *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  void *v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  double v284;
  double v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  void *v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  int v304;

  v4 = a3;
  objc_msgSend_componentsSeparatedByString_(v4, v5, (uint64_t)CFSTR(" "), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_mutableCopy(v9, v10, v11, v12, v13, v14);

  if (objc_msgSend_count(v15, v16, v17, v18, v19, v20) == 1)
  {
    v26 = (__CFString *)v4;
LABEL_34:
    v232 = v26;
    goto LABEL_35;
  }
  if ((objc_msgSend_count(v15, v21, v22, v23, v24, v25) & 1) != 0)
  {
    if ((unint64_t)objc_msgSend_count(v15, v27, v28, v29, v30, v31) >= 2)
    {
      v37 = 1;
      v38 = 1;
      while (1)
      {
        objc_msgSend_objectAtIndexedSubscript_(v15, v32, v37, v34, v35, v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v39, v40, (uint64_t)CFSTR("*"), v41, v42, v43) & 1) != 0)
          goto LABEL_9;
        objc_msgSend_objectAtIndexedSubscript_(v15, v44, v37, v45, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v48, v49, (uint64_t)CFSTR("x"), v50, v51, v52))
          break;
        objc_msgSend_objectAtIndexedSubscript_(v15, v53, v37, v54, v55, v56);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v118, v119, (uint64_t)CFSTR("⋅"), v120, v121, v122);

        if ((isEqualToString & 1) != 0)
          goto LABEL_10;
        objc_msgSend_objectAtIndexedSubscript_(v15, v57, v37, v58, v59, v60);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v124, v125, (uint64_t)CFSTR("/"), v126, v127, v128) & 1) != 0)
          goto LABEL_18;
        objc_msgSend_objectAtIndexedSubscript_(v15, v129, v37, v130, v131, v132);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v133, v134, (uint64_t)CFSTR("÷"), v135, v136, v137))
        {

LABEL_18:
LABEL_19:
          formatter = self->_formatter;
          v62 = v38 - 1;
          objc_msgSend_objectAtIndexedSubscript_(v15, v142, v62, v143, v144, v145);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_numberFromString_(formatter, v148, (uint64_t)v147, v149, v150, v151);
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v152, v153, v154, v155, v156, v157);
          v159 = v158;

          v160 = self->_formatter;
          objc_msgSend_objectAtIndexedSubscript_(v15, v161, v38 + 1, v162, v163, v164);
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_numberFromString_(v160, v166, (uint64_t)v165, v167, v168, v169);
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v170, v171, v172, v173, v174, v175);
          v177 = v176;

          v97 = v159 / v177;
          goto LABEL_11;
        }
        objc_msgSend_objectAtIndexedSubscript_(v15, v138, v37, v139, v140, v141);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        v183 = objc_msgSend_isEqualToString_(v178, v179, (uint64_t)CFSTR(":"), v180, v181, v182);

        if ((v183 & 1) != 0)
          goto LABEL_19;
        objc_msgSend_objectAtIndexedSubscript_(v15, v142, v37, v143, v144, v145);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        v189 = objc_msgSend_isEqualToString_(v184, v185, (uint64_t)CFSTR("^"), v186, v187, v188);

        if (!v189)
          goto LABEL_12;
        v190 = self->_formatter;
        v62 = v38 - 1;
        objc_msgSend_objectAtIndexedSubscript_(v15, v113, v62, v115, v116, v117);
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberFromString_(v190, v192, (uint64_t)v191, v193, v194, v195);
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v196, v197, v198, v199, v200, v201);
        v203 = v202;

        v204 = self->_formatter;
        objc_msgSend_objectAtIndexedSubscript_(v15, v205, v38 + 1, v206, v207, v208);
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberFromString_(v204, v210, (uint64_t)v209, v211, v212, v213);
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v214, v215, v216, v217, v218, v219);
        v221 = v220;

        v97 = pow(v203, v221);
LABEL_11:
        objc_msgSend_removeObjectsInRange_(v15, v94, v62, 3, v95, v96);
        v98 = self->_formatter;
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v99, v100, v101, v102, v103, v97);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringFromNumber_(v98, v105, (uint64_t)v104, v106, v107, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_insertObject_atIndex_(v15, v110, (uint64_t)v109, v62, v111, v112);
        v38 -= 2;

LABEL_12:
        v38 += 2;
        v37 = v38;
        if (objc_msgSend_count(v15, v113, v114, v115, v116, v117) <= (unint64_t)v38)
          goto LABEL_23;
      }

LABEL_9:
LABEL_10:
      v61 = self->_formatter;
      v62 = v38 - 1;
      objc_msgSend_objectAtIndexedSubscript_(v15, v57, v62, v58, v59, v60);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v61, v64, (uint64_t)v63, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v68, v69, v70, v71, v72, v73);
      v75 = v74;

      v76 = self->_formatter;
      objc_msgSend_objectAtIndexedSubscript_(v15, v77, v38 + 1, v78, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v76, v82, (uint64_t)v81, v83, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v86, v87, v88, v89, v90, v91);
      v93 = v92;

      v97 = v75 * v93;
      goto LABEL_11;
    }
LABEL_23:
    if (objc_msgSend_count(v15, v32, v33, v34, v35, v36) != 1)
    {
      if ((objc_msgSend_count(v15, v222, v223, v224, v225, v226) & 1) == 0)
        goto LABEL_25;
      if ((unint64_t)objc_msgSend_count(v15, v227, v228, v229, v230, v231) >= 2)
      {
        v232 = CFSTR("STOP");
        do
        {
          v254 = self->_formatter;
          objc_msgSend_objectAtIndexedSubscript_(v15, v222, 0, v224, v225, v226);
          v255 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_numberFromString_(v254, v256, (uint64_t)v255, v257, v258, v259);
          v260 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v260, v261, v262, v263, v264, v265);
          v267 = v266;

          v268 = self->_formatter;
          objc_msgSend_objectAtIndexedSubscript_(v15, v269, 2, v270, v271, v272);
          v273 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_numberFromString_(v268, v274, (uint64_t)v273, v275, v276, v277);
          v278 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v278, v279, v280, v281, v282, v283);
          v285 = v284;

          objc_msgSend_objectAtIndexedSubscript_(v15, v286, 1, v287, v288, v289);
          v290 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v273) = objc_msgSend_isEqualToString_(v290, v291, (uint64_t)CFSTR("+"), v292, v293, v294);

          if ((_DWORD)v273)
          {
            v233 = v267 + v285;
          }
          else
          {
            objc_msgSend_objectAtIndexedSubscript_(v15, v295, 1, v296, v297, v298);
            v299 = (void *)objc_claimAutoreleasedReturnValue();
            v304 = objc_msgSend_isEqualToString_(v299, v300, (uint64_t)CFSTR("-"), v301, v302, v303);

            if (!v304)
              goto LABEL_35;
            v233 = v267 - v285;
          }
          objc_msgSend_removeObjectsInRange_(v15, v295, 0, 3, v297, v298);
          v234 = self->_formatter;
          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v235, v236, v237, v238, v239, v233);
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringFromNumber_(v234, v241, (uint64_t)v240, v242, v243, v244);
          v245 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_insertObject_atIndex_(v15, v246, (uint64_t)v245, 0, v247, v248);
        }
        while ((unint64_t)objc_msgSend_count(v15, v249, v250, v251, v252, v253) > 1);
      }
    }
    objc_msgSend_objectAtIndexedSubscript_(v15, v222, 0, v224, v225, v226);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
LABEL_25:
  v232 = CFSTR("STOP");
LABEL_35:

  return v232;
}

- (id)getSymbols
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int64_t)getNumberOfNodes
{
  return 0;
}

- (BOOL)compareWith:(id)a3 compareTree:(BOOL)a4
{
  return 1;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_root(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__descriptionRecursive_level_(self, v8, (uint64_t)v7, 0, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_descriptionRecursive:(id)a3 level:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v6 = a3;
  objc_msgSend_string(MEMORY[0x1E0CB37A0], v7, v8, v9, v10, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 >= 1)
  {
    v17 = a4;
    do
    {
      objc_msgSend_appendString_(v16, v12, (uint64_t)CFSTR("  "), v13, v14, v15);
      --v17;
    }
    while (v17);
  }
  v18 = objc_opt_class();
  if ((objc_msgSend_isMemberOfClass_(v6, v19, v18, v20, v21, v22) & 1) != 0)
  {
    v23 = v6;
    objc_msgSend_leftNode(v23, v24, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = a4 + 1;
    objc_msgSend__descriptionRecursive_level_(self, v31, (uint64_t)v29, a4 + 1, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_rightNode(v23, v35, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend_rightNode(v23, v41, v42, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__descriptionRecursive_level_(self, v47, (uint64_t)v46, v30, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_description(v23, v51, v52, v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingFormat_(v16, v57, (uint64_t)CFSTR("%@\n%@\n%@"), v58, v59, v60, v56, v34, v50);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend_description(v23, v41, v42, v43, v44, v45);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingFormat_(v16, v62, (uint64_t)CFSTR("%@\n%@"), v63, v64, v65, v50, v34);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v61 = 0;
  }
  v66 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v6, v67, v66, v68, v69, v70))
  {
    objc_msgSend_description(v6, v71, v72, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(v16, v77, (uint64_t)v76, v78, v79, v80);
    v81 = objc_claimAutoreleasedReturnValue();

    v61 = (void *)v81;
  }

  return v61;
}

- (CHGrammar)grammar
{
  return self->_grammar;
}

- (void)setGrammar:(id)a3
{
  objc_storeStrong((id *)&self->_grammar, a3);
}

- (CHNonTerminal)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
  objc_storeStrong((id *)&self->_root, a3);
}

- (NSNumberFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_formatter, a3);
}

- (_NSRange)inputRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_inputRange.length;
  location = self->_inputRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setInputRange:(_NSRange)a3
{
  self->_inputRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_grammar, 0);
}

@end

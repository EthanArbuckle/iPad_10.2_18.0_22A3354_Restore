@implementation CHLatexParseTree

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
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const __CFString *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const __CFString *v126;
  uint64_t v127;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  char isEqualToString;
  void *v141;

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
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend_rightNode(v16, v33, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__latexRepresentationRecursive_(self, v39, (uint64_t)v38, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_hasSuffix_(v15, v44, (uint64_t)CFSTR("{"), v45, v46, v47) & 1) != 0
      || (objc_msgSend_hasPrefix_(v43, v48, (uint64_t)CFSTR("}"), v49, v50, v51) & 1) != 0
      || (objc_msgSend_hasSuffix_(v15, v48, (uint64_t)CFSTR("("), v49, v50, v51) & 1) != 0
      || objc_msgSend_hasPrefix_(v43, v48, (uint64_t)CFSTR(")"), v49, v50, v51))
    {
      v52 = &stru_1E77F6F28;
      if ((objc_msgSend_hasPrefix_(v43, v48, (uint64_t)CFSTR("{"), v49, v50, v51) & 1) != 0)
        goto LABEL_14;
    }
    else
    {
      v52 = CFSTR(" ");
      if ((objc_msgSend_hasPrefix_(v43, v48, (uint64_t)CFSTR("{"), v49, v50, v51) & 1) != 0)
        goto LABEL_14;
    }
    if ((objc_msgSend_hasSuffix_(v15, v53, (uint64_t)CFSTR("}"), v55, v56, v57) & 1) == 0
      && (objc_msgSend_hasPrefix_(v43, v53, (uint64_t)CFSTR("("), v55, v56, v57) & 1) == 0
      && !objc_msgSend_hasSuffix_(v15, v53, (uint64_t)CFSTR(")"), v55, v56, v57))
    {
      goto LABEL_21;
    }
LABEL_14:
    objc_msgSend_rightNode(v16, v53, v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v58, v59, v60, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v64, v65, (uint64_t)CFSTR("ScriptArgs"), v66, v67, v68) & 1) == 0)
    {
      objc_msgSend_rightNode(v16, v69, v70, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v74, v75, v76, v77, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToString_(v80, v81, (uint64_t)CFSTR("ScriptArg"), v82, v83, v84) & 1) == 0)
      {
        objc_msgSend_rightNode(v16, v85, v86, v87, v88, v89);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v141, v90, v91, v92, v93, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v95, v96, (uint64_t)CFSTR("TwoArgs"), v97, v98, v99) & 1) == 0)
        {
          objc_msgSend_rightNode(v16, v100, v101, v102, v103, v104);
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v139, v129, v130, v131, v132, v133);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v138, v134, (uint64_t)CFSTR("Arg"), v135, v136, v137);

          if ((isEqualToString & 1) == 0)
          {
LABEL_21:
            if ((objc_msgSend_isEqualToString_(v15, v53, (uint64_t)CFSTR("_"), v55, v56, v57) & 1) != 0
              || (objc_msgSend_isEqualToString_(v15, v105, (uint64_t)CFSTR("^"), v107, v108, v109) & 1) != 0
              || (objc_msgSend_hasPrefix_(v43, v105, (uint64_t)CFSTR("_"), v107, v108, v109) & 1) != 0
              || objc_msgSend_hasPrefix_(v43, v105, (uint64_t)CFSTR("^"), v107, v108, v109))
            {
              v52 = &stru_1E77F6F28;
            }
            objc_msgSend_rightNode(v16, v105, v106, v107, v108, v109);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_name(v110, v111, v112, v113, v114, v115);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = objc_msgSend_isEqualToString_(v116, v117, (uint64_t)CFSTR("Fact"), v118, v119, v120);

            v126 = &stru_1E77F6F28;
            if (!v121)
              v126 = v52;
            objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v122, (uint64_t)CFSTR("%@%@%@"), v123, v124, v125, v15, v126, v43);
            v127 = objc_claimAutoreleasedReturnValue();

            v15 = (void *)v127;
            goto LABEL_29;
          }
LABEL_20:
          v52 = &stru_1E77F6F28;
          goto LABEL_21;
        }

      }
    }

    goto LABEL_20;
  }
  objc_msgSend_name(v4, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

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

  objc_msgSend_evaluationWithVariables_(self, a2, (uint64_t)&unk_1E7827498, v2, v3, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = 0;
    v13 = 0;
  }
  else
  {
    objc_msgSend_evaluationWithVariables_(self, v6, (uint64_t)&unk_1E78274C0, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend_evaluationWithVariables_(self, v6, (uint64_t)&unk_1E78274E8, v8, v9, v10);
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
  const __CFString *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const __CFString *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
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
  int isEqual;
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
  int v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  int v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  int v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  int v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  int v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  int v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  void *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  void *v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  void *v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  char v326;

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
      if ((objc_msgSend_isEqualToString_(v15, v33, (uint64_t)CFSTR("\\cdot"), v35, v36, v37) & 1) == 0
        && (objc_msgSend_isEqualToString_(v15, v61, (uint64_t)CFSTR("\\times"), v62, v63, v64) & 1) == 0)
      {
        goto LABEL_25;
      }
      v65 = CFSTR("*");
LABEL_24:

      v15 = (void *)v65;
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend_rightNode(v16, v33, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__functionRepresentationRecursive_(self, v39, (uint64_t)v38, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_name(v16, v44, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v49, v50, (uint64_t)CFSTR("Arg"), v51, v52, v53);

    if (isEqualToString)
    {
      v60 = v43;
LABEL_22:
      v65 = v60;
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend_name(v16, v55, v56, v57, v58, v59);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend_isEqualToString_(v66, v67, (uint64_t)CFSTR("ExpRArgCurly"), v68, v69, v70);

    if (v71)
    {
      v60 = v15;
      goto LABEL_22;
    }
    objc_msgSend_leftNode(v16, v72, v73, v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v77, v78, v79, v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v83, v84, (uint64_t)CFSTR("Sqrt"), v85, v86, v87);

    if (isEqual)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v89, (uint64_t)CFSTR("sqrt(%@)"), v91, v92, v93, v43);
LABEL_21:
      v60 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    objc_msgSend_leftNode(v16, v89, v90, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v94, v95, v96, v97, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend_isEqual_(v100, v101, (uint64_t)CFSTR("Sin"), v102, v103, v104);

    if (v105)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v106, (uint64_t)CFSTR("sin(%@)"), v108, v109, v110, v43);
      goto LABEL_21;
    }
    objc_msgSend_leftNode(v16, v106, v107, v108, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v111, v112, v113, v114, v115, v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend_isEqual_(v117, v118, (uint64_t)CFSTR("Cos"), v119, v120, v121);

    if (v122)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v123, (uint64_t)CFSTR("cos(%@)"), v125, v126, v127, v43);
      goto LABEL_21;
    }
    objc_msgSend_leftNode(v16, v123, v124, v125, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v128, v129, v130, v131, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = objc_msgSend_isEqual_(v134, v135, (uint64_t)CFSTR("Tan"), v136, v137, v138);

    if (v139)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v140, (uint64_t)CFSTR("tan(%@)"), v142, v143, v144, v43);
      goto LABEL_21;
    }
    objc_msgSend_leftNode(v16, v140, v141, v142, v143, v144);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v145, v146, v147, v148, v149, v150);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = objc_msgSend_isEqual_(v151, v152, (uint64_t)CFSTR("Arctan"), v153, v154, v155);

    if (v156)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v157, (uint64_t)CFSTR("atan(%@)"), v159, v160, v161, v43);
      goto LABEL_21;
    }
    objc_msgSend_leftNode(v16, v157, v158, v159, v160, v161);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v163, v164, v165, v166, v167, v168);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = objc_msgSend_isEqualToString_(v169, v170, (uint64_t)CFSTR("Frac"), v171, v172, v173);

    objc_msgSend_rightNode(v16, v175, v176, v177, v178, v179);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = v180;
    if (v174)
    {
      objc_msgSend_leftNode(v180, v181, v182, v183, v184, v185);
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__functionRepresentationRecursive_(self, v188, (uint64_t)v187, v189, v190, v191);
      v192 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_rightNode(v186, v193, v194, v195, v196, v197);
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__functionRepresentationRecursive_(self, v199, (uint64_t)v198, v200, v201, v202);
      v203 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v204, (uint64_t)CFSTR("(%@)/(%@)"), v205, v206, v207, v192, v203);
      v65 = (const __CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    }
    objc_msgSend_name(v180, v181, v182, v183, v184, v185);
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    v213 = objc_msgSend_isEqualToString_(v208, v209, (uint64_t)CFSTR("ScriptArg"), v210, v211, v212);

    if (v213)
    {
      objc_msgSend_rightNode(v16, v214, v215, v216, v217, v218);
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_leftNode(v219, v220, v221, v222, v223, v224);
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v225, v226, v227, v228, v229, v230);
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      v236 = objc_msgSend_isEqualToString_(v231, v232, (uint64_t)CFSTR("Sup"), v233, v234, v235);

      if (v236)
      {
        objc_msgSend_rightNode(v219, v237, v238, v239, v240, v241);
        v242 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__functionRepresentationRecursive_(self, v243, (uint64_t)v242, v244, v245, v246);
        v247 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v248, (uint64_t)CFSTR("pow(%@,%@)"), v249, v250, v251, v15, v247);
        v65 = (const __CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_23;
      }

    }
    v252 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_leftNode(v16, v214, v215, v216, v217, v218);
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v253, v254, v255, v256, v257, v258);
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_rightNode(v16, v260, v261, v262, v263, v264);
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v265, v266, v267, v268, v269, v270);
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v252, v272, (uint64_t)CFSTR("%@ %@"), v273, v274, v275, v259, v271);
    v276 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_leftNode(v16, v277, v278, v279, v280, v281);
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v282, v283, v284, v285, v286, v287);
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v288, v289, (uint64_t)CFSTR("ClosedExp"), v290, v291, v292) & 1) == 0)
    {
      objc_msgSend_rightNode(v16, v293, v294, v295, v296, v297);
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v298, v299, v300, v301, v302, v303);
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToString_(v304, v305, (uint64_t)CFSTR("ClosedExp"), v306, v307, v308) & 1) == 0
        && (objc_msgSend_isEqualToString_(v276, v309, (uint64_t)CFSTR("Number Variable"), v310, v311, v312) & 1) == 0
        && (objc_msgSend_isEqualToString_(v276, v313, (uint64_t)CFSTR("Variable Number"), v314, v315, v316) & 1) == 0)
      {
        v326 = objc_msgSend_isEqualToString_(v276, v317, (uint64_t)CFSTR("Variable Variable"), v318, v319, v320);

        if ((v326 & 1) == 0)
        {
          objc_msgSend_stringByAppendingString_(v15, v321, (uint64_t)v43, v322, v323, v324);
          v325 = objc_claimAutoreleasedReturnValue();
          goto LABEL_40;
        }
LABEL_39:
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v321, (uint64_t)CFSTR("(%@)*(%@)"), v322, v323, v324, v15, v43);
        v325 = objc_claimAutoreleasedReturnValue();
LABEL_40:
        v65 = (const __CFString *)v325;

        goto LABEL_23;
      }

    }
    goto LABEL_39;
  }
  objc_msgSend_name(v4, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

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
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;

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

    objc_msgSend_formatter(self, v25, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberFromString_(v30, v31, (uint64_t)v24, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    return v35;
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
  uint64_t v69;
  void *v70;
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
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
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
  const char *v105;
  uint64_t v106;
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
  int isEqualToString;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  __CFString *v132;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  int v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  int v156;
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
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  int v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  int v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  int v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  int v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  void *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  double v268;
  long double v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  void *v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  double v286;
  long double v287;
  double v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  void *v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  void *v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  void *v325;
  const char *v326;
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
  uint64_t v339;
  void *v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  const char *v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  const char *v355;
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
  uint64_t v368;
  const char *v369;
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
  uint64_t v382;
  const char *v383;
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
  uint64_t v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  const char *v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  const char *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  const char *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  const char *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  const char *v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  const char *v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  const char *v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  const char *v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  const char *v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  const char *v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  const char *v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  const char *v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  const char *v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  const char *v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  const char *v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  const char *v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  const char *v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  void *v504;
  const char *v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  const char *v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  void *v514;
  const char *v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  const char *v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  void *v524;
  const char *v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  const char *v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  void *v534;
  const char *v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  const char *v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  uint64_t v543;
  void *v544;
  const char *v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  const char *v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t v552;
  uint64_t v553;
  const char *v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  const char *v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  void *v563;
  const char *v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  const char *v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t v572;
  const char *v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  void *v578;
  const char *v579;
  uint64_t v580;
  uint64_t v581;
  uint64_t v582;
  int v583;
  void *v584;
  const char *v585;
  uint64_t v586;
  uint64_t v587;
  uint64_t v588;
  void *v589;
  const char *v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  void *v594;
  const char *v595;
  uint64_t v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  double v600;
  double v601;
  const char *v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  uint64_t v606;
  void *v607;
  const char *v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  void *v613;
  const char *v614;
  uint64_t v615;
  uint64_t v616;
  uint64_t v617;
  void *v618;
  const char *v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  const char *v623;
  uint64_t v624;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
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
  void *v639;
  const char *v640;
  uint64_t v641;
  uint64_t v642;
  uint64_t v643;
  void *v644;
  const char *v645;
  uint64_t v646;
  uint64_t v647;
  uint64_t v648;
  void *v649;
  const char *v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  uint64_t v654;
  double v655;
  double v656;
  const char *v657;
  uint64_t v658;
  uint64_t v659;
  uint64_t v660;
  uint64_t v661;
  const char *v662;
  uint64_t v663;
  uint64_t v664;
  uint64_t v665;
  uint64_t v666;
  void *v667;
  const char *v668;
  uint64_t v669;
  uint64_t v670;
  uint64_t v671;
  const char *v672;
  uint64_t v673;
  uint64_t v674;
  uint64_t v675;
  uint64_t v676;
  const char *v677;
  uint64_t v678;
  uint64_t v679;
  uint64_t v680;
  uint64_t v681;
  void *v682;
  const char *v683;
  uint64_t v684;
  uint64_t v685;
  uint64_t v686;
  int v687;
  void *v688;
  const char *v689;
  uint64_t v690;
  uint64_t v691;
  uint64_t v692;
  void *v693;
  const char *v694;
  uint64_t v695;
  uint64_t v696;
  uint64_t v697;
  void *v698;
  const char *v699;
  uint64_t v700;
  uint64_t v701;
  uint64_t v702;
  uint64_t v703;
  double v704;
  double v705;
  const char *v706;
  uint64_t v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  const char *v711;
  uint64_t v712;
  uint64_t v713;
  uint64_t v714;
  uint64_t v715;
  void *v716;
  const char *v717;
  uint64_t v718;
  uint64_t v719;
  uint64_t v720;
  int v721;
  const char *v722;
  uint64_t v723;
  uint64_t v724;
  uint64_t v725;
  uint64_t v726;
  void *v727;
  const char *v728;
  uint64_t v729;
  uint64_t v730;
  uint64_t v731;
  int v732;
  uint64_t v733;
  const char *v734;
  uint64_t v735;
  uint64_t v736;
  uint64_t v737;
  const char *v738;
  uint64_t v739;
  uint64_t v740;
  uint64_t v741;
  uint64_t v742;
  void *v743;
  const char *v744;
  uint64_t v745;
  uint64_t v746;
  uint64_t v747;
  const char *v748;
  uint64_t v749;
  uint64_t v750;
  uint64_t v751;
  uint64_t v752;
  void *v753;
  const char *v754;
  uint64_t v755;
  uint64_t v756;
  uint64_t v757;
  char v758;
  uint64_t v759;
  void *v760;
  const char *v761;
  uint64_t v762;
  uint64_t v763;
  uint64_t v764;
  uint64_t v765;
  void *v766;
  const char *v767;
  uint64_t v768;
  uint64_t v769;
  uint64_t v770;
  int v771;
  const char *v772;
  uint64_t v773;
  uint64_t v774;
  uint64_t v775;
  uint64_t v776;
  void *v777;
  const char *v778;
  uint64_t v779;
  uint64_t v780;
  uint64_t v781;
  uint64_t v782;
  void *v783;
  const char *v784;
  uint64_t v785;
  uint64_t v786;
  uint64_t v787;
  int v788;
  const char *v789;
  uint64_t v790;
  uint64_t v791;
  uint64_t v792;
  uint64_t v793;
  const char *v794;
  uint64_t v795;
  uint64_t v796;
  uint64_t v797;
  uint64_t v798;
  void *v799;
  const char *v800;
  uint64_t v801;
  uint64_t v802;
  void *v803;
  const char *v804;
  uint64_t v805;
  uint64_t v806;
  uint64_t v807;
  uint64_t v808;
  void *v809;
  const char *v810;
  uint64_t v811;
  uint64_t v812;
  void *v813;
  const char *v814;
  uint64_t v815;
  uint64_t v816;
  uint64_t v817;
  const char *v818;
  uint64_t v819;
  uint64_t v820;
  uint64_t v821;
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
  void *v832;
  const char *v833;
  uint64_t v834;
  uint64_t v835;
  uint64_t v836;
  uint64_t v837;
  double v838;
  double v839;
  const char *v840;
  uint64_t v841;
  uint64_t v842;
  uint64_t v843;
  uint64_t v844;
  void *v845;
  const char *v846;
  uint64_t v847;
  uint64_t v848;
  uint64_t v849;
  void *v850;
  const char *v851;
  uint64_t v852;
  uint64_t v853;
  uint64_t v854;
  uint64_t v855;
  double v856;
  double v857;
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
  void *v869;
  const char *v870;
  uint64_t v871;
  uint64_t v872;
  uint64_t v873;
  void *v874;
  const char *v875;
  uint64_t v876;
  uint64_t v877;
  uint64_t v878;
  uint64_t v879;
  void *v880;
  const char *v881;
  uint64_t v882;
  uint64_t v883;
  uint64_t v884;
  int v885;
  const char *v886;
  uint64_t v887;
  uint64_t v888;
  uint64_t v889;
  uint64_t v890;
  void *v891;
  const char *v892;
  uint64_t v893;
  uint64_t v894;
  uint64_t v895;
  void *v896;
  const char *v897;
  uint64_t v898;
  uint64_t v899;
  uint64_t v900;
  uint64_t v901;
  double v902;
  double v903;
  const char *v904;
  uint64_t v905;
  uint64_t v906;
  uint64_t v907;
  uint64_t v908;
  const char *v909;
  uint64_t v910;
  uint64_t v911;
  uint64_t v912;
  uint64_t v913;
  void *v914;
  const char *v915;
  uint64_t v916;
  uint64_t v917;
  uint64_t v918;
  uint64_t v919;
  void *v920;
  const char *v921;
  uint64_t v922;
  uint64_t v923;
  uint64_t v924;
  int v925;
  const char *v926;
  uint64_t v927;
  uint64_t v928;
  uint64_t v929;
  uint64_t v930;
  void *v931;
  const char *v932;
  uint64_t v933;
  uint64_t v934;
  uint64_t v935;
  void *v936;
  const char *v937;
  uint64_t v938;
  uint64_t v939;
  uint64_t v940;
  uint64_t v941;
  double v942;
  long double v943;
  const char *v944;
  uint64_t v945;
  uint64_t v946;
  uint64_t v947;
  uint64_t v948;
  void *v949;
  const char *v950;
  uint64_t v951;
  uint64_t v952;
  uint64_t v953;
  uint64_t v954;
  double v955;
  void *v956;
  const char *v957;
  uint64_t v958;
  uint64_t v959;
  uint64_t v960;
  uint64_t v961;
  void *v962;
  const char *v963;
  uint64_t v964;
  uint64_t v965;
  uint64_t v966;
  int v967;
  const char *v968;
  uint64_t v969;
  uint64_t v970;
  uint64_t v971;
  uint64_t v972;
  void *v973;
  const char *v974;
  uint64_t v975;
  uint64_t v976;
  uint64_t v977;
  void *v978;
  const char *v979;
  uint64_t v980;
  uint64_t v981;
  uint64_t v982;
  uint64_t v983;
  double v984;
  long double v985;
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
  const char *v1009;
  uint64_t v1010;
  uint64_t v1011;
  uint64_t v1012;
  void *v1013;
  const char *v1014;
  uint64_t v1015;
  uint64_t v1016;
  uint64_t v1017;
  uint64_t v1018;
  double v1019;
  double v1020;
  const char *v1021;
  uint64_t v1022;
  uint64_t v1023;
  uint64_t v1024;
  uint64_t v1025;
  double v1026;
  void *v1027;
  const char *v1028;
  uint64_t v1029;
  uint64_t v1030;
  uint64_t v1031;
  uint64_t v1032;
  void *v1033;
  const char *v1034;
  uint64_t v1035;
  uint64_t v1036;
  uint64_t v1037;
  int v1038;
  const char *v1039;
  uint64_t v1040;
  uint64_t v1041;
  uint64_t v1042;
  uint64_t v1043;
  void *v1044;
  const char *v1045;
  uint64_t v1046;
  uint64_t v1047;
  uint64_t v1048;
  void *v1049;
  const char *v1050;
  uint64_t v1051;
  uint64_t v1052;
  uint64_t v1053;
  uint64_t v1054;
  double v1055;
  long double v1056;
  const char *v1057;
  uint64_t v1058;
  uint64_t v1059;
  uint64_t v1060;
  uint64_t v1061;
  const char *v1062;
  uint64_t v1063;
  uint64_t v1064;
  uint64_t v1065;
  uint64_t v1066;
  void *v1067;
  const char *v1068;
  uint64_t v1069;
  uint64_t v1070;
  uint64_t v1071;
  void *v1072;
  const char *v1073;
  uint64_t v1074;
  uint64_t v1075;
  uint64_t v1076;
  uint64_t v1077;
  double v1078;
  double v1079;
  const char *v1080;
  uint64_t v1081;
  uint64_t v1082;
  uint64_t v1083;
  uint64_t v1084;
  const char *v1085;
  uint64_t v1086;
  uint64_t v1087;
  uint64_t v1088;
  uint64_t v1089;
  void *v1090;
  const char *v1091;
  uint64_t v1092;
  uint64_t v1093;
  uint64_t v1094;
  void *v1095;
  const char *v1096;
  uint64_t v1097;
  uint64_t v1098;
  uint64_t v1099;
  uint64_t v1100;
  double v1101;
  long double v1102;
  const char *v1103;
  uint64_t v1104;
  uint64_t v1105;
  uint64_t v1106;
  uint64_t v1107;
  const char *v1108;
  uint64_t v1109;
  uint64_t v1110;
  uint64_t v1111;
  uint64_t v1112;
  void *v1113;
  const char *v1114;
  uint64_t v1115;
  uint64_t v1116;
  uint64_t v1117;
  void *v1118;
  const char *v1119;
  uint64_t v1120;
  uint64_t v1121;
  uint64_t v1122;
  uint64_t v1123;
  double v1124;
  long double v1125;
  const char *v1126;
  uint64_t v1127;
  uint64_t v1128;
  uint64_t v1129;
  uint64_t v1130;
  const char *v1131;
  uint64_t v1132;
  uint64_t v1133;
  uint64_t v1134;
  uint64_t v1135;
  void *v1136;
  const char *v1137;
  uint64_t v1138;
  uint64_t v1139;
  uint64_t v1140;
  void *v1141;
  const char *v1142;
  uint64_t v1143;
  uint64_t v1144;
  uint64_t v1145;
  uint64_t v1146;
  double v1147;
  long double v1148;
  const char *v1149;
  uint64_t v1150;
  uint64_t v1151;
  uint64_t v1152;
  uint64_t v1153;
  const char *v1154;
  uint64_t v1155;
  uint64_t v1156;
  uint64_t v1157;
  uint64_t v1158;
  void *v1159;
  const char *v1160;
  uint64_t v1161;
  uint64_t v1162;
  uint64_t v1163;
  void *v1164;
  const char *v1165;
  uint64_t v1166;
  uint64_t v1167;
  uint64_t v1168;
  uint64_t v1169;
  double v1170;
  long double v1171;
  const char *v1172;
  uint64_t v1173;
  uint64_t v1174;
  uint64_t v1175;
  uint64_t v1176;
  const char *v1177;
  uint64_t v1178;
  uint64_t v1179;
  uint64_t v1180;
  uint64_t v1181;
  void *v1182;
  const char *v1183;
  uint64_t v1184;
  uint64_t v1185;
  uint64_t v1186;
  void *v1187;
  const char *v1188;
  uint64_t v1189;
  uint64_t v1190;
  uint64_t v1191;
  uint64_t v1192;
  double v1193;
  long double v1194;
  const char *v1195;
  uint64_t v1196;
  uint64_t v1197;
  uint64_t v1198;
  uint64_t v1199;
  const char *v1200;
  uint64_t v1201;
  uint64_t v1202;
  uint64_t v1203;
  uint64_t v1204;
  void *v1205;
  const char *v1206;
  uint64_t v1207;
  uint64_t v1208;
  uint64_t v1209;
  void *v1210;
  const char *v1211;
  uint64_t v1212;
  uint64_t v1213;
  uint64_t v1214;
  uint64_t v1215;
  double v1216;
  long double v1217;
  const char *v1218;
  uint64_t v1219;
  uint64_t v1220;
  uint64_t v1221;
  uint64_t v1222;
  const char *v1223;
  uint64_t v1224;
  uint64_t v1225;
  uint64_t v1226;
  uint64_t v1227;
  void *v1228;
  const char *v1229;
  uint64_t v1230;
  uint64_t v1231;
  uint64_t v1232;
  void *v1233;
  const char *v1234;
  uint64_t v1235;
  uint64_t v1236;
  uint64_t v1237;
  uint64_t v1238;
  double v1239;
  long double v1240;
  const char *v1241;
  uint64_t v1242;
  uint64_t v1243;
  uint64_t v1244;
  uint64_t v1245;
  const char *v1246;
  uint64_t v1247;
  uint64_t v1248;
  uint64_t v1249;
  uint64_t v1250;
  void *v1251;
  const char *v1252;
  uint64_t v1253;
  uint64_t v1254;
  uint64_t v1255;
  void *v1256;
  const char *v1257;
  uint64_t v1258;
  uint64_t v1259;
  uint64_t v1260;
  uint64_t v1261;
  double v1262;
  long double v1263;
  const char *v1264;
  uint64_t v1265;
  uint64_t v1266;
  uint64_t v1267;
  uint64_t v1268;
  const char *v1269;
  uint64_t v1270;
  uint64_t v1271;
  uint64_t v1272;
  uint64_t v1273;
  void *v1274;
  const char *v1275;
  uint64_t v1276;
  uint64_t v1277;
  uint64_t v1278;
  void *v1279;
  const char *v1280;
  uint64_t v1281;
  uint64_t v1282;
  uint64_t v1283;
  uint64_t v1284;
  double v1285;
  long double v1286;
  const char *v1287;
  uint64_t v1288;
  uint64_t v1289;
  uint64_t v1290;
  uint64_t v1291;
  const char *v1292;
  uint64_t v1293;
  uint64_t v1294;
  uint64_t v1295;
  uint64_t v1296;
  void *v1297;
  const char *v1298;
  uint64_t v1299;
  uint64_t v1300;
  uint64_t v1301;
  void *v1302;
  const char *v1303;
  uint64_t v1304;
  uint64_t v1305;
  uint64_t v1306;
  uint64_t v1307;
  double v1308;
  long double v1309;
  const char *v1310;
  uint64_t v1311;
  uint64_t v1312;
  uint64_t v1313;
  uint64_t v1314;
  void *v1315;
  const char *v1316;
  uint64_t v1317;
  uint64_t v1318;
  uint64_t v1319;
  uint64_t v1320;
  void *v1321;
  const char *v1322;
  uint64_t v1323;
  uint64_t v1324;
  uint64_t v1325;
  const char *v1326;
  uint64_t v1327;
  uint64_t v1328;
  uint64_t v1329;
  int v1330;
  const char *v1331;
  uint64_t v1332;
  uint64_t v1333;
  uint64_t v1334;
  uint64_t v1335;
  void *v1336;
  const char *v1337;
  uint64_t v1338;
  uint64_t v1339;
  uint64_t v1340;
  void *v1341;
  const char *v1342;
  uint64_t v1343;
  uint64_t v1344;
  uint64_t v1345;
  uint64_t v1346;
  double v1347;
  double v1348;
  const char *v1349;
  uint64_t v1350;
  uint64_t v1351;
  uint64_t v1352;
  uint64_t v1353;
  const char *v1354;
  uint64_t v1355;
  uint64_t v1356;
  uint64_t v1357;
  uint64_t v1358;
  void *v1359;
  const char *v1360;
  uint64_t v1361;
  uint64_t v1362;
  uint64_t v1363;
  uint64_t v1364;
  void *v1365;
  const char *v1366;
  uint64_t v1367;
  uint64_t v1368;
  uint64_t v1369;
  int v1370;
  const char *v1371;
  uint64_t v1372;
  uint64_t v1373;
  uint64_t v1374;
  uint64_t v1375;
  void *v1376;
  const char *v1377;
  uint64_t v1378;
  uint64_t v1379;
  uint64_t v1380;
  void *v1381;
  const char *v1382;
  uint64_t v1383;
  uint64_t v1384;
  uint64_t v1385;
  uint64_t v1386;
  double v1387;
  double v1388;
  const char *v1389;
  uint64_t v1390;
  uint64_t v1391;
  uint64_t v1392;
  uint64_t v1393;
  void *v1394;
  void *v1395;
  const char *v1396;
  uint64_t v1397;
  uint64_t v1398;
  uint64_t v1399;
  uint64_t v1400;
  void *v1401;
  const char *v1402;
  uint64_t v1403;
  uint64_t v1404;
  uint64_t v1405;
  uint64_t v1406;
  void *v1407;
  const char *v1408;
  uint64_t v1409;
  uint64_t v1410;
  uint64_t v1411;
  uint64_t v1412;
  void *v1413;
  const char *v1414;
  uint64_t v1415;
  uint64_t v1416;
  uint64_t v1417;
  const char *v1418;
  uint64_t v1419;
  uint64_t v1420;
  uint64_t v1421;
  uint64_t v1422;
  void *v1423;
  const char *v1424;
  uint64_t v1425;
  uint64_t v1426;
  uint64_t v1427;
  uint64_t v1428;
  void *v1429;
  const char *v1430;
  uint64_t v1431;
  uint64_t v1432;
  uint64_t v1433;
  const char *v1434;
  uint64_t v1435;
  uint64_t v1436;
  uint64_t v1437;
  uint64_t v1438;
  void *v1439;
  const char *v1440;
  uint64_t v1441;
  uint64_t v1442;
  uint64_t v1443;
  uint64_t v1444;
  void *v1445;
  const char *v1446;
  uint64_t v1447;
  uint64_t v1448;
  uint64_t v1449;
  const char *v1450;
  uint64_t v1451;
  uint64_t v1452;
  uint64_t v1453;
  const char *v1454;
  uint64_t v1455;
  uint64_t v1456;
  uint64_t v1457;
  const char *v1458;
  uint64_t v1459;
  uint64_t v1460;
  uint64_t v1461;
  const char *v1462;
  uint64_t v1463;
  uint64_t v1464;
  uint64_t v1465;
  const char *v1466;
  uint64_t v1467;
  uint64_t v1468;
  uint64_t v1469;
  uint64_t v1470;
  void *v1471;
  const char *v1472;
  uint64_t v1473;
  uint64_t v1474;
  uint64_t v1475;
  void *v1476;
  const char *v1477;
  uint64_t v1478;
  uint64_t v1479;
  uint64_t v1480;
  uint64_t v1481;
  double v1482;
  double v1483;
  const char *v1484;
  uint64_t v1485;
  uint64_t v1486;
  uint64_t v1487;
  uint64_t v1488;
  void *v1489;
  const char *v1490;
  uint64_t v1491;
  uint64_t v1492;
  uint64_t v1493;
  void *v1494;
  const char *v1495;
  uint64_t v1496;
  uint64_t v1497;
  uint64_t v1498;
  uint64_t v1499;
  double v1500;
  double v1501;
  const char *v1502;
  uint64_t v1503;
  uint64_t v1504;
  uint64_t v1505;
  uint64_t v1506;
  void *v1507;
  const char *v1508;
  uint64_t v1509;
  uint64_t v1510;
  uint64_t v1511;
  uint64_t v1512;
  void *v1513;
  const char *v1514;
  uint64_t v1515;
  uint64_t v1516;
  uint64_t v1517;
  void *v1518;
  const char *v1519;
  uint64_t v1520;
  uint64_t v1521;
  uint64_t v1522;
  const char *v1523;
  uint64_t v1524;
  uint64_t v1525;
  uint64_t v1526;
  uint64_t v1527;
  __CFString *v1528;
  void *v1529;
  const char *v1530;
  uint64_t v1531;
  uint64_t v1532;
  uint64_t v1533;
  int v1534;
  const char *v1535;
  uint64_t v1536;
  uint64_t v1537;
  uint64_t v1538;
  uint64_t v1539;
  void *v1540;
  const char *v1541;
  uint64_t v1542;
  uint64_t v1543;
  uint64_t v1544;
  uint64_t v1545;
  void *v1546;
  const char *v1547;
  uint64_t v1548;
  uint64_t v1549;
  uint64_t v1550;
  const char *v1551;
  uint64_t v1552;
  uint64_t v1553;
  uint64_t v1554;
  uint64_t v1555;
  void *v1556;
  const char *v1557;
  uint64_t v1558;
  uint64_t v1559;
  uint64_t v1560;
  int v1561;
  const char *v1562;
  uint64_t v1563;
  uint64_t v1564;
  uint64_t v1565;
  uint64_t v1566;
  void *v1567;
  const char *v1568;
  uint64_t v1569;
  uint64_t v1570;
  uint64_t v1571;
  int v1572;
  const char *v1573;
  uint64_t v1574;
  uint64_t v1575;
  uint64_t v1576;
  uint64_t v1577;
  void *v1578;
  const char *v1579;
  uint64_t v1580;
  uint64_t v1581;
  uint64_t v1582;
  int v1583;
  const char *v1584;
  uint64_t v1585;
  uint64_t v1586;
  uint64_t v1587;
  uint64_t v1588;
  void *v1589;
  const char *v1590;
  uint64_t v1591;
  uint64_t v1592;
  uint64_t v1593;
  uint64_t v1594;
  void *v1595;
  const char *v1596;
  uint64_t v1597;
  uint64_t v1598;
  uint64_t v1599;
  int v1600;
  void *v1601;
  const char *v1602;
  uint64_t v1603;
  uint64_t v1604;
  uint64_t v1605;
  uint64_t v1606;
  void *v1607;
  const char *v1608;
  uint64_t v1609;
  uint64_t v1610;
  uint64_t v1611;
  int v1612;
  const char *v1613;
  uint64_t v1614;
  uint64_t v1615;
  uint64_t v1616;
  void *v1617;
  void *v1618;
  void *v1619;
  void *v1620;
  void *v1621;
  void *v1622;
  void *v1623;
  void *v1624;
  void *v1625;
  void *v1626;
  void *v1627;
  void *v1628;
  void *v1629;
  void *v1630;
  void *v1631;
  void *v1632;
  char v1633;
  void *v1634;
  void *v1635;
  void *v1636;
  void *v1637;
  void *v1638;
  void *v1639;
  void *v1640;
  void *v1641;
  char v1642;
  char v1643;

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
      v24 = v24;
      v34 = v24;
      goto LABEL_17;
    }
    objc_msgSend_rightNode(v8, v29, v30, v31, v32, v33);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__evaluationRecursive_withVariables_(self, v82, (uint64_t)v81, (uint64_t)v7, v83, v84);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_isEqualToString_(v70, v85, (uint64_t)CFSTR("STOP"), v86, v87, v88))
      goto LABEL_14;
    objc_msgSend_leftNode(v8, v89, v90, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v94, v95, v96, v97, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v100, v101, (uint64_t)CFSTR("LPar"), v102, v103, v104))
      goto LABEL_11;
    objc_msgSend_leftNode(v8, v105, v106, v107, v108, v109);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v115, v116, v117, v118, v119, v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v121, v122, (uint64_t)CFSTR("LeftPar"), v123, v124, v125);

    if (isEqualToString)
      goto LABEL_14;
    objc_msgSend_name(v8, v127, v128, v129, v130, v131);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = objc_msgSend_isEqualToString_(v151, v152, (uint64_t)CFSTR("TwoArgs"), v153, v154, v155);

    if (v156)
    {
LABEL_28:
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v157, (uint64_t)CFSTR("%@ %@"), v159, v160, v161, v24, v70);
      v132 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    objc_msgSend_name(v8, v157, v158, v159, v160, v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v162, v163, (uint64_t)CFSTR("OpExp"), v164, v165, v166))
    {
LABEL_22:

      goto LABEL_28;
    }
    objc_msgSend_rightNode(v8, v167, v168, v169, v170, v171);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v194, v195, v196, v197, v198, v199);
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    v205 = objc_msgSend_isEqualToString_(v200, v201, (uint64_t)CFSTR("OpExp"), v202, v203, v204);

    if (v205)
      goto LABEL_28;
    objc_msgSend_rightNode(v8, v157, v206, v159, v160, v161);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v207, v208, v209, v210, v211, v212);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    v218 = objc_msgSend_isEqualToString_(v213, v214, (uint64_t)CFSTR("ScriptArg"), v215, v216, v217);

    if (v218)
    {
      objc_msgSend_rightNode(v8, v219, v220, v221, v222, v223);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_leftNode(v224, v225, v226, v227, v228, v229);
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v230, v231, v232, v233, v234, v235);
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      v241 = objc_msgSend_isEqualToString_(v236, v237, (uint64_t)CFSTR("Sup"), v238, v239, v240);

      if (v241)
      {
        objc_msgSend_rightNode(v224, v242, v243, v244, v245, v246);
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__evaluationRecursive_withVariables_(self, v248, (uint64_t)v247, (uint64_t)v7, v249, v250);
        v251 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_formatter(self, v252, v253, v254, v255, v256);
        v257 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberFromString_(v257, v258, (uint64_t)v24, v259, v260, v261);
        v262 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v262, v263, v264, v265, v266, v267);
        v269 = v268;

        objc_msgSend_formatter(self, v270, v271, v272, v273, v274);
        v275 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberFromString_(v275, v276, (uint64_t)v251, v277, v278, v279);
        v280 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v280, v281, v282, v283, v284, v285);
        v287 = v286;

        v288 = pow(v269, v287);
        objc_msgSend_formatter(self, v289, v290, v291, v292, v293);
        v294 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v295, v296, v297, v298, v299, v288);
        v300 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringFromNumber_(v294, v301, (uint64_t)v300, v302, v303, v304);
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_169:
        goto LABEL_16;
      }
LABEL_168:
      v34 = CFSTR("STOP");
      goto LABEL_169;
    }
    objc_msgSend_leftNode(v8, v219, v220, v221, v222, v223);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v94, v305, v306, v307, v308, v309);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v100, v310, (uint64_t)CFSTR("LPar"), v311, v312, v313) & 1) != 0)
    {
LABEL_11:

LABEL_14:
      v132 = v70;
LABEL_15:
      v34 = v132;
      goto LABEL_16;
    }
    objc_msgSend_leftNode(v8, v314, v315, v316, v317, v318);
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v319, v320, v321, v322, v323, v324);
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v325, v326, (uint64_t)CFSTR("LeftPar"), v327, v328, v329) & 1) != 0)
    {
LABEL_40:

      goto LABEL_11;
    }
    objc_msgSend_leftNode(v8, v330, v331, v332, v333, v334);
    v1641 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1641, v335, v336, v337, v338, v339);
    v340 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v340, v341, (uint64_t)CFSTR("LCurly"), v342, v343, v344) & 1) != 0)
    {
LABEL_39:

      goto LABEL_40;
    }
    objc_msgSend_leftNode(v8, v345, v346, v347, v348, v349);
    v1639 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1639, v350, v351, v352, v353, v354);
    v1638 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v1638, v355, (uint64_t)CFSTR("LeftCurly"), v356, v357, v358) & 1) != 0)
    {
LABEL_38:

      goto LABEL_39;
    }
    objc_msgSend_leftNode(v8, v359, v360, v361, v362, v363);
    v1637 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1637, v364, v365, v366, v367, v368);
    v1636 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v1636, v369, (uint64_t)CFSTR("LBrack"), v370, v371, v372) & 1) != 0)
    {

      goto LABEL_38;
    }
    objc_msgSend_leftNode(v8, v373, v374, v375, v376, v377);
    v1635 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1635, v378, v379, v380, v381, v382);
    v1634 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v1634, v383, (uint64_t)CFSTR("LeftBrack"), v384, v385, v386) & 1) != 0)
    {
      v1633 = 1;
    }
    else
    {
      objc_msgSend_leftNode(v8, v387, v388, v389, v390, v391);
      v1632 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v1632, v392, v393, v394, v395, v396);
      v1631 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToString_(v1631, v397, (uint64_t)CFSTR("LAbs"), v398, v399, v400) & 1) != 0)
      {
        v1633 = 1;
      }
      else
      {
        objc_msgSend_leftNode(v8, v401, v402, v403, v404, v405);
        v1630 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v1630, v406, v407, v408, v409, v410);
        v1629 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v1629, v411, (uint64_t)CFSTR("LeftAbs"), v412, v413, v414) & 1) != 0)
        {
          v1633 = 1;
        }
        else
        {
          objc_msgSend_leftNode(v8, v415, v416, v417, v418, v419);
          v1628 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v1628, v420, v421, v422, v423, v424);
          v1627 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToString_(v1627, v425, (uint64_t)CFSTR("LAngle"), v426, v427, v428) & 1) != 0)
          {
            v1633 = 1;
          }
          else
          {
            objc_msgSend_leftNode(v8, v429, v430, v431, v432, v433);
            v1626 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_name(v1626, v434, v435, v436, v437, v438);
            v1625 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend_isEqualToString_(v1625, v439, (uint64_t)CFSTR("LeftAngle"), v440, v441, v442) & 1) != 0)
            {
              v1633 = 1;
            }
            else
            {
              objc_msgSend_leftNode(v8, v443, v444, v445, v446, v447);
              v1624 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_name(v1624, v448, v449, v450, v451, v452);
              v1623 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend_isEqualToString_(v1623, v453, (uint64_t)CFSTR("LFloor"), v454, v455, v456) & 1) != 0)
              {
                v1633 = 1;
              }
              else
              {
                objc_msgSend_leftNode(v8, v457, v458, v459, v460, v461);
                v1622 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_name(v1622, v462, v463, v464, v465, v466);
                v1621 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend_isEqualToString_(v1621, v467, (uint64_t)CFSTR("LeftFloor"), v468, v469, v470) & 1) != 0)
                {
                  v1633 = 1;
                }
                else
                {
                  objc_msgSend_leftNode(v8, v471, v472, v473, v474, v475);
                  v1620 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_name(v1620, v476, v477, v478, v479, v480);
                  v1619 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend_isEqualToString_(v1619, v481, (uint64_t)CFSTR("LCeil"), v482, v483, v484) & 1) != 0)
                  {
                    v1633 = 1;
                  }
                  else
                  {
                    objc_msgSend_leftNode(v8, v485, v486, v487, v488, v489);
                    v1618 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_name(v1618, v490, v491, v492, v493, v494);
                    v1617 = (void *)objc_claimAutoreleasedReturnValue();
                    v1633 = objc_msgSend_isEqualToString_(v1617, v495, (uint64_t)CFSTR("LeftCeil"), v496, v497, v498);

                  }
                }

              }
            }

          }
        }

      }
    }

    if ((v1633 & 1) != 0)
      goto LABEL_14;
    objc_msgSend_name(v8, v499, v500, v501, v502, v503);
    v504 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v504, v505, (uint64_t)CFSTR("ExpRPar"), v506, v507, v508) & 1) != 0)
      goto LABEL_75;
    objc_msgSend_name(v8, v509, v510, v511, v512, v513);
    v514 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v514, v515, (uint64_t)CFSTR("ExpRightPar"), v516, v517, v518) & 1) != 0)
    {
LABEL_74:

LABEL_75:
      goto LABEL_76;
    }
    objc_msgSend_name(v8, v519, v520, v521, v522, v523);
    v524 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v524, v525, (uint64_t)CFSTR("ExpRCurly"), v526, v527, v528) & 1) != 0)
    {
LABEL_73:

      goto LABEL_74;
    }
    objc_msgSend_name(v8, v529, v530, v531, v532, v533);
    v534 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v534, v535, (uint64_t)CFSTR("ExpRightCurly"), v536, v537, v538) & 1) != 0)
    {
LABEL_72:

      goto LABEL_73;
    }
    objc_msgSend_name(v8, v539, v540, v541, v542, v543);
    v544 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v544, v545, (uint64_t)CFSTR("ExpRAngle"), v546, v547, v548) & 1) != 0)
    {

      goto LABEL_72;
    }
    objc_msgSend_name(v8, v549, v550, v551, v552, v553);
    v1640 = (void *)objc_claimAutoreleasedReturnValue();
    v1642 = objc_msgSend_isEqualToString_(v1640, v558, (uint64_t)CFSTR("ExpRightAngle"), v559, v560, v561);

    if ((v1642 & 1) != 0)
      goto LABEL_76;
    objc_msgSend_name(v8, v554, v562, v555, v556, v557);
    v563 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v563, v564, (uint64_t)CFSTR("ExpRAbs"), v565, v566, v567))
    {

LABEL_81:
      objc_msgSend_formatter(self, v573, v574, v575, v576, v577);
      v584 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_evaluateOpExpPriority_(self, v585, (uint64_t)v24, v586, v587, v588);
      v589 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v584, v590, (uint64_t)v589, v591, v592, v593);
      v594 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v594, v595, v596, v597, v598, v599);
      v601 = v600;

      objc_msgSend_formatter(self, v602, v603, v604, v605, v606);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v608, v609, v610, v611, v612, fabs(v601));
LABEL_82:
      v613 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringFromNumber_(v607, v614, (uint64_t)v613, v615, v616, v617);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
    objc_msgSend_name(v8, v568, v569, v570, v571, v572);
    v578 = (void *)objc_claimAutoreleasedReturnValue();
    v583 = objc_msgSend_isEqualToString_(v578, v579, (uint64_t)CFSTR("ExpRightAbs"), v580, v581, v582);

    if (v583)
      goto LABEL_81;
    objc_msgSend_name(v8, v573, v574, v575, v576, v577);
    v618 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v618, v619, (uint64_t)CFSTR("ExpRFloor"), v620, v621, v622))
    {

LABEL_86:
      objc_msgSend_formatter(self, v628, v629, v630, v631, v632);
      v639 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_evaluateOpExpPriority_(self, v640, (uint64_t)v24, v641, v642, v643);
      v644 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v639, v645, (uint64_t)v644, v646, v647, v648);
      v649 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v649, v650, v651, v652, v653, v654);
      v656 = v655;

      objc_msgSend_formatter(self, v657, v658, v659, v660, v661);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v662, v663, v664, v665, v666, floor(v656));
      goto LABEL_82;
    }
    objc_msgSend_name(v8, v623, v624, v625, v626, v627);
    v633 = (void *)objc_claimAutoreleasedReturnValue();
    v638 = objc_msgSend_isEqualToString_(v633, v634, (uint64_t)CFSTR("ExpRightFloor"), v635, v636, v637);

    if (v638)
      goto LABEL_86;
    objc_msgSend_name(v8, v628, v629, v630, v631, v632);
    v667 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v667, v668, (uint64_t)CFSTR("ExpRCeil"), v669, v670, v671))
    {

LABEL_90:
      objc_msgSend_formatter(self, v677, v678, v679, v680, v681);
      v688 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_evaluateOpExpPriority_(self, v689, (uint64_t)v24, v690, v691, v692);
      v693 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v688, v694, (uint64_t)v693, v695, v696, v697);
      v698 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v698, v699, v700, v701, v702, v703);
      v705 = v704;

      objc_msgSend_formatter(self, v706, v707, v708, v709, v710);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v711, v712, v713, v714, v715, ceil(v705));
      goto LABEL_82;
    }
    objc_msgSend_name(v8, v672, v673, v674, v675, v676);
    v682 = (void *)objc_claimAutoreleasedReturnValue();
    v687 = objc_msgSend_isEqualToString_(v682, v683, (uint64_t)CFSTR("ExpRightCeil"), v684, v685, v686);

    if (v687)
      goto LABEL_90;
    objc_msgSend_name(v8, v677, v678, v679, v680, v681);
    v716 = (void *)objc_claimAutoreleasedReturnValue();
    v721 = objc_msgSend_isEqualToString_(v716, v717, (uint64_t)CFSTR("Arg"), v718, v719, v720);

    if (v721)
      goto LABEL_14;
    objc_msgSend_name(v8, v722, v723, v724, v725, v726);
    v727 = (void *)objc_claimAutoreleasedReturnValue();
    v732 = objc_msgSend_isEqualToString_(v727, v728, (uint64_t)CFSTR("ExpRArgCurly"), v729, v730, v731);

    if (v732)
    {
LABEL_76:
      objc_msgSend_evaluateOpExpPriority_(self, v554, (uint64_t)v24, v555, v556, v557);
      v132 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    objc_msgSend_name(v8, v554, v733, v555, v556, v557);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v162, v734, (uint64_t)CFSTR("TwoArgs"), v735, v736, v737) & 1) != 0)
      goto LABEL_22;
    objc_msgSend_name(v8, v738, v739, v740, v741, v742);
    v743 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v743, v744, (uint64_t)CFSTR("ScriptArg"), v745, v746, v747))
    {

      goto LABEL_22;
    }
    objc_msgSend_name(v8, v748, v749, v750, v751, v752);
    v753 = (void *)objc_claimAutoreleasedReturnValue();
    v758 = objc_msgSend_isEqualToString_(v753, v754, (uint64_t)CFSTR("ScriptArgs"), v755, v756, v757);

    if ((v758 & 1) != 0)
      goto LABEL_28;
    objc_msgSend_rightNode(v8, v157, v759, v159, v160, v161);
    v760 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v760, v761, v762, v763, v764, v765);
    v766 = (void *)objc_claimAutoreleasedReturnValue();
    v771 = objc_msgSend_isEqualToString_(v766, v767, (uint64_t)CFSTR("Eq"), v768, v769, v770);

    if (v771)
    {
      v132 = v24;
      goto LABEL_15;
    }
    objc_msgSend_leftNode(v8, v772, v773, v774, v775, v776);
    v777 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v777, v778, v779, v780, v781, v782);
    v783 = (void *)objc_claimAutoreleasedReturnValue();
    v788 = objc_msgSend_isEqualToString_(v783, v784, (uint64_t)CFSTR("Frac"), v785, v786, v787);

    if (v788)
    {
      objc_msgSend_rightNode(v8, v789, v790, v791, v792, v793);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_leftNode(v224, v794, v795, v796, v797, v798);
      v799 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__evaluationRecursive_withVariables_(self, v800, (uint64_t)v799, (uint64_t)v7, v801, v802);
      v803 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_rightNode(v224, v804, v805, v806, v807, v808);
      v809 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__evaluationRecursive_withVariables_(self, v810, (uint64_t)v809, (uint64_t)v7, v811, v812);
      v813 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = CFSTR("STOP");
      if ((objc_msgSend_isEqualToString_(v803, v814, (uint64_t)CFSTR("STOP"), v815, v816, v817) & 1) == 0
        && (objc_msgSend_isEqualToString_(v813, v818, (uint64_t)CFSTR("STOP"), v819, v820, v821) & 1) == 0)
      {
        objc_msgSend_formatter(self, v822, v823, v824, v825, v826);
        v827 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberFromString_(v827, v828, (uint64_t)v803, v829, v830, v831);
        v832 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v832, v833, v834, v835, v836, v837);
        v839 = v838;

        objc_msgSend_formatter(self, v840, v841, v842, v843, v844);
        v845 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberFromString_(v845, v846, (uint64_t)v813, v847, v848, v849);
        v850 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v850, v851, v852, v853, v854, v855);
        v857 = v856;

        objc_msgSend_formatter(self, v858, v859, v860, v861, v862);
        v863 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v864, v865, v866, v867, v868, v839 / v857);
        v869 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringFromNumber_(v863, v870, (uint64_t)v869, v871, v872, v873);
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_169;
    }
    objc_msgSend_leftNode(v8, v789, v790, v791, v792, v793);
    v874 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v874, v875, v876, v877, v878, v879);
    v880 = (void *)objc_claimAutoreleasedReturnValue();
    v885 = objc_msgSend_isEqualToString_(v880, v881, (uint64_t)CFSTR("Sqrt"), v882, v883, v884);

    if (v885)
    {
      objc_msgSend_formatter(self, v886, v887, v888, v889, v890);
      v891 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v891, v892, (uint64_t)v70, v893, v894, v895);
      v896 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v896, v897, v898, v899, v900, v901);
      v903 = v902;

      objc_msgSend_formatter(self, v904, v905, v906, v907, v908);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v909, v910, v911, v912, v913, sqrt(v903));
      goto LABEL_82;
    }
    objc_msgSend_leftNode(v8, v886, v887, v888, v889, v890);
    v914 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v914, v915, v916, v917, v918, v919);
    v920 = (void *)objc_claimAutoreleasedReturnValue();
    v925 = objc_msgSend_isEqualToString_(v920, v921, (uint64_t)CFSTR("Sin"), v922, v923, v924);

    if (v925)
    {
      objc_msgSend_formatter(self, v926, v927, v928, v929, v930);
      v931 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v931, v932, (uint64_t)v70, v933, v934, v935);
      v936 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v936, v937, v938, v939, v940, v941);
      v943 = v942;

      objc_msgSend_formatter(self, v944, v945, v946, v947, v948);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v955 = sin(v943);
LABEL_117:
      objc_msgSend_numberWithDouble_(v949, v950, v951, v952, v953, v954, v955);
      goto LABEL_82;
    }
    objc_msgSend_leftNode(v8, v926, v927, v928, v929, v930);
    v956 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v956, v957, v958, v959, v960, v961);
    v962 = (void *)objc_claimAutoreleasedReturnValue();
    v967 = objc_msgSend_isEqualToString_(v962, v963, (uint64_t)CFSTR("Cos"), v964, v965, v966);

    if (v967)
    {
      objc_msgSend_formatter(self, v968, v969, v970, v971, v972);
      v973 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v973, v974, (uint64_t)v70, v975, v976, v977);
      v978 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v978, v979, v980, v981, v982, v983);
      v985 = v984;

      objc_msgSend_formatter(self, v986, v987, v988, v989, v990);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v955 = cos(v985);
      goto LABEL_117;
    }
    objc_msgSend_leftNode(v8, v968, v969, v970, v971, v972);
    v991 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v991, v992, v993, v994, v995, v996);
    v997 = (void *)objc_claimAutoreleasedReturnValue();
    v1002 = objc_msgSend_isEqualToString_(v997, v998, (uint64_t)CFSTR("Tan"), v999, v1000, v1001);

    if (v1002)
    {
      objc_msgSend_formatter(self, v1003, v1004, v1005, v1006, v1007);
      v1008 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1008, v1009, (uint64_t)v70, v1010, v1011, v1012);
      v1013 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1013, v1014, v1015, v1016, v1017, v1018);
      v1020 = v1019;

      objc_msgSend_formatter(self, v1021, v1022, v1023, v1024, v1025);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v1026 = v1020;
LABEL_116:
      v955 = tan(v1026);
      goto LABEL_117;
    }
    objc_msgSend_leftNode(v8, v1003, v1004, v1005, v1006, v1007);
    v1027 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1027, v1028, v1029, v1030, v1031, v1032);
    v1033 = (void *)objc_claimAutoreleasedReturnValue();
    v1038 = objc_msgSend_isEqualToString_(v1033, v1034, (uint64_t)CFSTR("Arctan"), v1035, v1036, v1037);

    if (v1038)
    {
      objc_msgSend_formatter(self, v1039, v1040, v1041, v1042, v1043);
      v1044 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1044, v1045, (uint64_t)v70, v1046, v1047, v1048);
      v1049 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1049, v1050, v1051, v1052, v1053, v1054);
      v1056 = v1055;

      objc_msgSend_formatter(self, v1057, v1058, v1059, v1060, v1061);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v955 = atan(v1056);
      goto LABEL_117;
    }
    if (objc_msgSend_isEqualToString_(v24, v1039, (uint64_t)CFSTR("\\cot"), v1041, v1042, v1043))
    {
      objc_msgSend_formatter(self, v1062, v1063, v1064, v1065, v1066);
      v1067 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1067, v1068, (uint64_t)v70, v1069, v1070, v1071);
      v1072 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1072, v1073, v1074, v1075, v1076, v1077);
      v1079 = v1078;

      objc_msgSend_formatter(self, v1080, v1081, v1082, v1083, v1084);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v1026 = 1.57079633 - v1079;
      goto LABEL_116;
    }
    if (objc_msgSend_isEqualToString_(v24, v1062, (uint64_t)CFSTR("\\arcsin"), v1064, v1065, v1066))
    {
      objc_msgSend_formatter(self, v1085, v1086, v1087, v1088, v1089);
      v1090 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1090, v1091, (uint64_t)v70, v1092, v1093, v1094);
      v1095 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1095, v1096, v1097, v1098, v1099, v1100);
      v1102 = v1101;

      objc_msgSend_formatter(self, v1103, v1104, v1105, v1106, v1107);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v955 = asin(v1102);
      goto LABEL_117;
    }
    if (objc_msgSend_isEqualToString_(v24, v1085, (uint64_t)CFSTR("\\arccos"), v1087, v1088, v1089))
    {
      objc_msgSend_formatter(self, v1108, v1109, v1110, v1111, v1112);
      v1113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1113, v1114, (uint64_t)v70, v1115, v1116, v1117);
      v1118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1118, v1119, v1120, v1121, v1122, v1123);
      v1125 = v1124;

      objc_msgSend_formatter(self, v1126, v1127, v1128, v1129, v1130);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v955 = acos(v1125);
      goto LABEL_117;
    }
    if (objc_msgSend_isEqualToString_(v24, v1108, (uint64_t)CFSTR("\\sinh"), v1110, v1111, v1112))
    {
      objc_msgSend_formatter(self, v1131, v1132, v1133, v1134, v1135);
      v1136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1136, v1137, (uint64_t)v70, v1138, v1139, v1140);
      v1141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1141, v1142, v1143, v1144, v1145, v1146);
      v1148 = v1147;

      objc_msgSend_formatter(self, v1149, v1150, v1151, v1152, v1153);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v955 = sinh(v1148);
      goto LABEL_117;
    }
    if (objc_msgSend_isEqualToString_(v24, v1131, (uint64_t)CFSTR("\\cosh"), v1133, v1134, v1135))
    {
      objc_msgSend_formatter(self, v1154, v1155, v1156, v1157, v1158);
      v1159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1159, v1160, (uint64_t)v70, v1161, v1162, v1163);
      v1164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1164, v1165, v1166, v1167, v1168, v1169);
      v1171 = v1170;

      objc_msgSend_formatter(self, v1172, v1173, v1174, v1175, v1176);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v955 = cosh(v1171);
      goto LABEL_117;
    }
    if (objc_msgSend_isEqualToString_(v24, v1154, (uint64_t)CFSTR("\\tanh"), v1156, v1157, v1158))
    {
      objc_msgSend_formatter(self, v1177, v1178, v1179, v1180, v1181);
      v1182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1182, v1183, (uint64_t)v70, v1184, v1185, v1186);
      v1187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1187, v1188, v1189, v1190, v1191, v1192);
      v1194 = v1193;

      objc_msgSend_formatter(self, v1195, v1196, v1197, v1198, v1199);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v955 = tanh(v1194);
      goto LABEL_117;
    }
    if (objc_msgSend_isEqualToString_(v24, v1177, (uint64_t)CFSTR("\\coth"), v1179, v1180, v1181))
    {
      objc_msgSend_formatter(self, v1200, v1201, v1202, v1203, v1204);
      v1205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1205, v1206, (uint64_t)v70, v1207, v1208, v1209);
      v1210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1210, v1211, v1212, v1213, v1214, v1215);
      v1217 = v1216;

      objc_msgSend_formatter(self, v1218, v1219, v1220, v1221, v1222);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v955 = 1.0 / tanh(v1217);
      goto LABEL_117;
    }
    if (objc_msgSend_isEqualToString_(v24, v1200, (uint64_t)CFSTR("\\exp"), v1202, v1203, v1204))
    {
      objc_msgSend_formatter(self, v1223, v1224, v1225, v1226, v1227);
      v1228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1228, v1229, (uint64_t)v70, v1230, v1231, v1232);
      v1233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1233, v1234, v1235, v1236, v1237, v1238);
      v1240 = v1239;

      objc_msgSend_formatter(self, v1241, v1242, v1243, v1244, v1245);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v955 = exp(v1240);
      goto LABEL_117;
    }
    if (objc_msgSend_isEqualToString_(v24, v1223, (uint64_t)CFSTR("\\log"), v1225, v1226, v1227))
    {
      objc_msgSend_formatter(self, v1246, v1247, v1248, v1249, v1250);
      v1251 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1251, v1252, (uint64_t)v70, v1253, v1254, v1255);
      v1256 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1256, v1257, v1258, v1259, v1260, v1261);
      v1263 = v1262;

      objc_msgSend_formatter(self, v1264, v1265, v1266, v1267, v1268);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v955 = log10(v1263);
      goto LABEL_117;
    }
    if (objc_msgSend_isEqualToString_(v24, v1246, (uint64_t)CFSTR("\\ln"), v1248, v1249, v1250))
    {
      objc_msgSend_formatter(self, v1269, v1270, v1271, v1272, v1273);
      v1274 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1274, v1275, (uint64_t)v70, v1276, v1277, v1278);
      v1279 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1279, v1280, v1281, v1282, v1283, v1284);
      v1286 = v1285;

      objc_msgSend_formatter(self, v1287, v1288, v1289, v1290, v1291);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v955 = log(v1286);
      goto LABEL_117;
    }
    if (objc_msgSend_isEqualToString_(v24, v1269, (uint64_t)CFSTR("\\lg"), v1271, v1272, v1273))
    {
      objc_msgSend_formatter(self, v1292, v1293, v1294, v1295, v1296);
      v1297 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1297, v1298, (uint64_t)v70, v1299, v1300, v1301);
      v1302 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1302, v1303, v1304, v1305, v1306, v1307);
      v1309 = v1308;

      objc_msgSend_formatter(self, v1310, v1311, v1312, v1313, v1314);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v955 = log2(v1309);
      goto LABEL_117;
    }
    objc_msgSend_leftNode(v8, v1292, v1293, v1294, v1295, v1296);
    v1315 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1315, v1316, v1317, v1318, v1319, v1320);
    v1321 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v1321, v1322, (uint64_t)CFSTR("UnOp"), v1323, v1324, v1325))
    {
      v1330 = objc_msgSend_isEqualToString_(v24, v1326, (uint64_t)CFSTR("-"), v1327, v1328, v1329);

      if (v1330)
      {
        objc_msgSend_formatter(self, v1331, v1332, v1333, v1334, v1335);
        v1336 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberFromString_(v1336, v1337, (uint64_t)v70, v1338, v1339, v1340);
        v1341 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v1341, v1342, v1343, v1344, v1345, v1346);
        v1348 = v1347;

        objc_msgSend_formatter(self, v1349, v1350, v1351, v1352, v1353);
        v607 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v1354, v1355, v1356, v1357, v1358, -v1348);
        goto LABEL_82;
      }
    }
    else
    {

    }
    objc_msgSend_rightNode(v8, v1331, v1332, v1333, v1334, v1335);
    v1359 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1359, v1360, v1361, v1362, v1363, v1364);
    v1365 = (void *)objc_claimAutoreleasedReturnValue();
    v1370 = objc_msgSend_isEqualToString_(v1365, v1366, (uint64_t)CFSTR("Fact"), v1367, v1368, v1369);

    if (v1370)
    {
      objc_msgSend_formatter(self, v1371, v1372, v1373, v1374, v1375);
      v1376 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1376, v1377, (uint64_t)v24, v1378, v1379, v1380);
      v1381 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1381, v1382, v1383, v1384, v1385, v1386);
      v1388 = v1387;

      objc_msgSend_formatter(self, v1389, v1390, v1391, v1392, v1393);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      v949 = (void *)MEMORY[0x1E0CB37E8];
      v955 = tgamma(v1388 + 1.0);
      goto LABEL_117;
    }
    v1394 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_leftNode(v8, v1371, v1372, v1373, v1374, v1375);
    v1395 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1395, v1396, v1397, v1398, v1399, v1400);
    v1401 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_rightNode(v8, v1402, v1403, v1404, v1405, v1406);
    v1407 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1407, v1408, v1409, v1410, v1411, v1412);
    v1413 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v1394, v1414, (uint64_t)CFSTR("%@ %@"), v1415, v1416, v1417, v1401, v1413);
    v224 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_leftNode(v8, v1418, v1419, v1420, v1421, v1422);
    v1423 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1423, v1424, v1425, v1426, v1427, v1428);
    v1429 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v1429, v1430, (uint64_t)CFSTR("ClosedExp"), v1431, v1432, v1433) & 1) != 0)
      goto LABEL_150;
    objc_msgSend_rightNode(v8, v1434, v1435, v1436, v1437, v1438);
    v1439 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1439, v1440, v1441, v1442, v1443, v1444);
    v1445 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v1445, v1446, (uint64_t)CFSTR("ClosedExp"), v1447, v1448, v1449) & 1) != 0
      || (objc_msgSend_isEqualToString_(v224, v1450, (uint64_t)CFSTR("Number Variable"), v1451, v1452, v1453) & 1) != 0
      || (objc_msgSend_isEqualToString_(v224, v1454, (uint64_t)CFSTR("Variable Number"), v1455, v1456, v1457) & 1) != 0
      || (objc_msgSend_isEqualToString_(v224, v1458, (uint64_t)CFSTR("Variable Variable"), v1459, v1460, v1461) & 1) != 0)
    {

LABEL_150:
LABEL_151:
      objc_msgSend_formatter(self, v1466, v1467, v1468, v1469, v1470);
      v1471 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1471, v1472, (uint64_t)v24, v1473, v1474, v1475);
      v1476 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1476, v1477, v1478, v1479, v1480, v1481);
      v1483 = v1482;

      objc_msgSend_formatter(self, v1484, v1485, v1486, v1487, v1488);
      v1489 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v1489, v1490, (uint64_t)v70, v1491, v1492, v1493);
      v1494 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v1494, v1495, v1496, v1497, v1498, v1499);
      v1501 = v1500;

      objc_msgSend_formatter(self, v1502, v1503, v1504, v1505, v1506);
      v1507 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v1508, v1509, v1510, v1511, v1512, v1483 * v1501);
      v1513 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringFromNumber_(v1507, v1514, (uint64_t)v1513, v1515, v1516, v1517);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_169;
    }
    v1643 = objc_msgSend_isEqualToString_(v224, v1462, (uint64_t)CFSTR("Variable VarVar"), v1463, v1464, v1465);

    if ((v1643 & 1) != 0)
      goto LABEL_151;
    objc_msgSend_name(v8, v1466, v1467, v1468, v1469, v1470);
    v1518 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v1518, v1519, (uint64_t)CFSTR("EntriesHLine"), v1520, v1521, v1522))
    {

      v1528 = v24;
      goto LABEL_167;
    }
    objc_msgSend_name(v8, v1523, v1524, v1525, v1526, v1527);
    v1529 = (void *)objc_claimAutoreleasedReturnValue();
    v1534 = objc_msgSend_isEqualToString_(v1529, v1530, (uint64_t)CFSTR("NumberLinebreak"), v1531, v1532, v1533);

    if (v1534)
    {
      v1528 = v24;
      goto LABEL_167;
    }
    objc_msgSend_leftNode(v8, v1535, v1536, v1537, v1538, v1539);
    v1540 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v1540, v1541, v1542, v1543, v1544, v1545);
    v1546 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v1546, v1547, (uint64_t)CFSTR("OpenVerticalMath"), v1548, v1549, v1550))
    {

      v1528 = v70;
      goto LABEL_167;
    }
    objc_msgSend_name(v8, v1551, v1552, v1553, v1554, v1555);
    v1556 = (void *)objc_claimAutoreleasedReturnValue();
    v1561 = objc_msgSend_isEqualToString_(v1556, v1557, (uint64_t)CFSTR("AndNumberLinebreak"), v1558, v1559, v1560);

    if (!v1561)
    {
      objc_msgSend_name(v8, v1562, v1563, v1564, v1565, v1566);
      v1567 = (void *)objc_claimAutoreleasedReturnValue();
      v1572 = objc_msgSend_isEqualToString_(v1567, v1568, (uint64_t)CFSTR("Entries"), v1569, v1570, v1571);

      if (v1572)
        goto LABEL_164;
      objc_msgSend_name(v8, v1573, v1574, v1575, v1576, v1577);
      v1578 = (void *)objc_claimAutoreleasedReturnValue();
      v1583 = objc_msgSend_isEqualToString_(v1578, v1579, (uint64_t)CFSTR("Entry"), v1580, v1581, v1582);

      if (!v1583)
      {
        objc_msgSend_rightNode(v8, v1584, v1585, v1586, v1587, v1588);
        v1601 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v1601, v1602, v1603, v1604, v1605, v1606);
        v1607 = (void *)objc_claimAutoreleasedReturnValue();
        v1612 = objc_msgSend_isEqualToString_(v1607, v1608, (uint64_t)CFSTR("CloseVerticalMath"), v1609, v1610, v1611);

        if (!v1612)
          goto LABEL_168;
        objc_msgSend_evaluateVerticalMath_(self, v1613, (uint64_t)v24, v1614, v1615, v1616);
        v1528 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_167:
        v34 = v1528;
        goto LABEL_169;
      }
      objc_msgSend_leftNode(v8, v1584, v1585, v1586, v1587, v1588);
      v1589 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v1589, v1590, v1591, v1592, v1593, v1594);
      v1595 = (void *)objc_claimAutoreleasedReturnValue();
      v1600 = objc_msgSend_isEqualToString_(v1595, v1596, (uint64_t)CFSTR("Op"), v1597, v1598, v1599);

      if (v1600)
      {
LABEL_164:
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v1573, (uint64_t)CFSTR("%@ %@"), v1575, v1576, v1577, v24, v70);
        v1528 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_167;
      }
    }
    v1528 = v70;
    goto LABEL_167;
  }
  objc_msgSend_name(v8, v15, v16, v17, v18, v19);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend_isEqualToString_(v35, v36, (uint64_t)CFSTR("Variable"), v37, v38, v39);

  if (!v40)
  {
    objc_msgSend_leftNode(v8, v41, v42, v43, v44, v45);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getStringValue(v24, v110, v111, v112, v113, v114);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
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

  if (v64)
  {
    objc_msgSend_objectForKeyedSubscript_(v7, v65, (uint64_t)v24, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_formatter(self, v71, v72, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromNumber_(v76, v77, (uint64_t)v70, v78, v79, v80);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    goto LABEL_17;
  }
  objc_msgSend_leftNode(v8, v65, v66, v67, v68, v69);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v134, v135, v136, v137, v138, v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = objc_msgSend_isEqualToString_(v140, v141, (uint64_t)CFSTR("e"), v142, v143, v144);

  if (v145)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v146, (uint64_t)CFSTR("%0.9f"), v148, v149, v150, 0x4005BF0A8B145769);
  }
  else
  {
    objc_msgSend_leftNode(v8, v146, v147, v148, v149, v150);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v172, v173, v174, v175, v176, v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v178, v179, v180, v181, v182, v183);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = objc_msgSend_isEqualToString_(v184, v185, (uint64_t)CFSTR("\\pi"), v186, v187, v188);

    if (!v189)
    {
      v34 = CFSTR("STOP");
      goto LABEL_17;
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v190, (uint64_t)CFSTR("%0.9f"), v191, v192, v193, 0x400921FB54442D18);
  }
  v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v34;
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
  unint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  double v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  double v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
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
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char isEqualToString;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  double v177;
  double v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  double v200;
  double v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  char v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  int v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  double v230;
  long double v231;
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
  void *v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  double v253;
  long double v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  __CFString *v265;
  uint64_t v266;
  double v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  void *v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  double v309;
  double v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  void *v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  void *v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  void *v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  double v332;
  double v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  int v352;

  v4 = a3;
  objc_msgSend_componentsSeparatedByString_(v4, v5, (uint64_t)CFSTR(" "), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_mutableCopy(v9, v10, v11, v12, v13, v14);

  if (objc_msgSend_count(v15, v16, v17, v18, v19, v20) == 1)
  {
    v26 = (__CFString *)v4;
LABEL_34:
    v265 = v26;
    goto LABEL_35;
  }
  if ((objc_msgSend_count(v15, v21, v22, v23, v24, v25) & 1) != 0)
  {
    if ((unint64_t)objc_msgSend_count(v15, v27, v28, v29, v30, v31) >= 2)
    {
      v37 = 1;
      while (1)
      {
        objc_msgSend_objectAtIndexedSubscript_(v15, v32, v37, v34, v35, v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v38, v39, (uint64_t)CFSTR("\\times"), v40, v41, v42) & 1) != 0)
          goto LABEL_9;
        objc_msgSend_objectAtIndexedSubscript_(v15, v43, v37, v44, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v47, v48, (uint64_t)CFSTR("\\cdot"), v49, v50, v51))
          break;
        objc_msgSend_objectAtIndexedSubscript_(v15, v52, v37, v53, v54, v55);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v132, v133, (uint64_t)CFSTR("\\ast"), v134, v135, v136);

        if ((isEqualToString & 1) != 0)
          goto LABEL_10;
        objc_msgSend_objectAtIndexedSubscript_(v15, v56, v37, v58, v59, v60);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v138, v139, (uint64_t)CFSTR("/"), v140, v141, v142) & 1) != 0)
          goto LABEL_18;
        objc_msgSend_objectAtIndexedSubscript_(v15, v143, v37, v144, v145, v146);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v147, v148, (uint64_t)CFSTR("\\div"), v149, v150, v151))
        {

LABEL_18:
LABEL_19:
          objc_msgSend_formatter(self, v156, v157, v158, v159, v160);
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v37 - 1;
          objc_msgSend_objectAtIndexedSubscript_(v15, v162, v37 - 1, v163, v164, v165);
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_numberFromString_(v161, v167, (uint64_t)v166, v168, v169, v170);
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v171, v172, v173, v174, v175, v176);
          v178 = v177;

          objc_msgSend_formatter(self, v179, v180, v181, v182, v183);
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v15, v185, v37 + 1, v186, v187, v188);
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_numberFromString_(v184, v190, (uint64_t)v189, v191, v192, v193);
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v194, v195, v196, v197, v198, v199);
          v201 = v200;

          v106 = v178 / v201;
          goto LABEL_11;
        }
        objc_msgSend_objectAtIndexedSubscript_(v15, v152, v37, v153, v154, v155);
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        v207 = objc_msgSend_isEqualToString_(v202, v203, (uint64_t)CFSTR(":"), v204, v205, v206);

        if ((v207 & 1) != 0)
          goto LABEL_19;
        objc_msgSend_objectAtIndexedSubscript_(v15, v156, v37, v158, v159, v160);
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        v213 = objc_msgSend_isEqualToString_(v208, v209, (uint64_t)CFSTR("^"), v210, v211, v212);

        if (!v213)
          goto LABEL_12;
        objc_msgSend_formatter(self, v127, v128, v129, v130, v131);
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v37 - 1;
        objc_msgSend_objectAtIndexedSubscript_(v15, v215, v37 - 1, v216, v217, v218);
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberFromString_(v214, v220, (uint64_t)v219, v221, v222, v223);
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v224, v225, v226, v227, v228, v229);
        v231 = v230;

        objc_msgSend_formatter(self, v232, v233, v234, v235, v236);
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v15, v238, v37 + 1, v239, v240, v241);
        v242 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberFromString_(v237, v243, (uint64_t)v242, v244, v245, v246);
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v247, v248, v249, v250, v251, v252);
        v254 = v253;

        v106 = pow(v231, v254);
LABEL_11:
        objc_msgSend_removeObjectsInRange_(v15, v103, v62, 3, v104, v105);
        objc_msgSend_formatter(self, v107, v108, v109, v110, v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v113, v114, v115, v116, v117, v106);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringFromNumber_(v112, v119, (uint64_t)v118, v120, v121, v122);
        v123 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_insertObject_atIndex_(v15, v124, (uint64_t)v123, v62, v125, v126);
        v37 -= 2;

LABEL_12:
        v37 += 2;
        if (v37 >= objc_msgSend_count(v15, v127, v128, v129, v130, v131))
          goto LABEL_23;
      }

LABEL_9:
LABEL_10:
      objc_msgSend_formatter(self, v56, v57, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v37 - 1;
      objc_msgSend_objectAtIndexedSubscript_(v15, v63, v37 - 1, v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v61, v68, (uint64_t)v67, v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v72, v73, v74, v75, v76, v77);
      v79 = v78;

      objc_msgSend_formatter(self, v80, v81, v82, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v15, v86, v37 + 1, v87, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberFromString_(v85, v91, (uint64_t)v90, v92, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v95, v96, v97, v98, v99, v100);
      v102 = v101;

      v106 = v79 * v102;
      goto LABEL_11;
    }
LABEL_23:
    if (objc_msgSend_count(v15, v32, v33, v34, v35, v36) != 1)
    {
      if ((objc_msgSend_count(v15, v255, v256, v257, v258, v259) & 1) == 0)
        goto LABEL_25;
      if ((unint64_t)objc_msgSend_count(v15, v260, v261, v262, v263, v264) >= 2)
      {
        v265 = CFSTR("STOP");
        do
        {
          objc_msgSend_formatter(self, v255, v266, v257, v258, v259);
          v293 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v15, v294, 0, v295, v296, v297);
          v298 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_numberFromString_(v293, v299, (uint64_t)v298, v300, v301, v302);
          v303 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v303, v304, v305, v306, v307, v308);
          v310 = v309;

          objc_msgSend_formatter(self, v311, v312, v313, v314, v315);
          v316 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v15, v317, 2, v318, v319, v320);
          v321 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_numberFromString_(v316, v322, (uint64_t)v321, v323, v324, v325);
          v326 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v326, v327, v328, v329, v330, v331);
          v333 = v332;

          objc_msgSend_objectAtIndexedSubscript_(v15, v334, 1, v335, v336, v337);
          v338 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v321) = objc_msgSend_isEqualToString_(v338, v339, (uint64_t)CFSTR("+"), v340, v341, v342);

          if ((_DWORD)v321)
          {
            v267 = v310 + v333;
          }
          else
          {
            objc_msgSend_objectAtIndexedSubscript_(v15, v343, 1, v344, v345, v346);
            v347 = (void *)objc_claimAutoreleasedReturnValue();
            v352 = objc_msgSend_isEqualToString_(v347, v348, (uint64_t)CFSTR("-"), v349, v350, v351);

            if (!v352)
              goto LABEL_35;
            v267 = v310 - v333;
          }
          objc_msgSend_removeObjectsInRange_(v15, v343, 0, 3, v345, v346);
          objc_msgSend_formatter(self, v268, v269, v270, v271, v272);
          v273 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v274, v275, v276, v277, v278, v267);
          v279 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringFromNumber_(v273, v280, (uint64_t)v279, v281, v282, v283);
          v284 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_insertObject_atIndex_(v15, v285, (uint64_t)v284, 0, v286, v287);
        }
        while ((unint64_t)objc_msgSend_count(v15, v288, v289, v290, v291, v292) > 1);
      }
    }
    objc_msgSend_objectAtIndexedSubscript_(v15, v255, 0, v257, v258, v259);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
LABEL_25:
  v265 = CFSTR("STOP");
LABEL_35:

  return v265;
}

- (id)evaluateVerticalMath:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
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
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __CFString *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  __CFString *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
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
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  double v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  __CFString *v145;
  __CFString *v147;
  void *v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (qword_1EF568270 != -1)
    dispatch_once(&qword_1EF568270, &unk_1E77F18F0);
  v148 = v8;
  objc_msgSend_componentsSeparatedByString_(v8, v4, (uint64_t)CFSTR(" "), v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_mutableCopy(v9, v10, v11, v12, v13, v14);

  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  v16 = v15;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v149, (uint64_t)v153, 16, v18);
  if (!v19)
  {

    v25 = 0;
    goto LABEL_17;
  }
  v24 = v19;
  v25 = 0;
  v26 = 0;
  v27 = *(_QWORD *)v150;
  while (2)
  {
    for (i = 0; i != v24; ++i)
    {
      if (*(_QWORD *)v150 == v27)
      {
        v29 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * i);
        if (!objc_msgSend_containsObject_((void *)qword_1EF568278, v20, (uint64_t)v29, v21, v22, v23))
          continue;
      }
      else
      {
        objc_enumerationMutation(v16);
        v29 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * i);
        if (!objc_msgSend_containsObject_((void *)qword_1EF568278, v30, (uint64_t)v29, v31, v32, v33))
          continue;
      }
      ++v26;
      v34 = v29;

      v25 = v34;
    }
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v20, (uint64_t)&v149, (uint64_t)v153, 16, v23);
    if (v24)
      continue;
    break;
  }

  if (!v26)
  {
LABEL_17:
    v40 = CFSTR("+");
    goto LABEL_18;
  }
  if (v26 == 1)
  {
    v25 = v25;
    v40 = v25;
  }
  else
  {
    if (v26 != (unint64_t)(objc_msgSend_count(v16, v35, v36, v37, v38, v39) - 1) >> 1)
    {
      v145 = CFSTR("STOP");
      goto LABEL_39;
    }
    v40 = 0;
  }
LABEL_18:
  objc_msgSend_formatter(self, v35, v36, v37, v38, v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v16, v42, 0, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberFromString_(v41, v47, (uint64_t)v46, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v51, v52, v53, v54, v55, v56);
  v58 = v57;

  v59 = v40;
  v147 = v59;
  if ((unint64_t)objc_msgSend_count(v16, v60, v61, v62, v63, v64) < 2)
  {
LABEL_37:
    objc_msgSend_formatter(self, v65, v66, v67, v68, v69, v147);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v136, v137, v138, v139, v140, v58);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromNumber_(v77, v141, (uint64_t)v71, v142, v143, v144);
    v145 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  v70 = 1;
  objc_msgSend_objectAtIndexedSubscript_(v16, v65, 1, v67, v68, v69, v59);
  while (2)
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_containsObject_((void *)qword_1EF568278, v78, (uint64_t)v77, v79, v80, v81))
    {
      v71 = v59;
      v59 = v77;
LABEL_21:

      if (++v70 >= (unint64_t)objc_msgSend_count(v16, v72, v73, v74, v75, v76))
        goto LABEL_37;
      objc_msgSend_objectAtIndexedSubscript_(v16, v65, v70, v67, v68, v69, v147);
      continue;
    }
    break;
  }
  objc_msgSend_formatter(self, v82, v83, v84, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v16, v88, v70, v89, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberFromString_(v87, v93, (uint64_t)v92, v94, v95, v96);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v71)
    goto LABEL_42;
  objc_msgSend_doubleValue(v71, v97, v98, v99, v100, v101);
  v103 = v102;
  if (objc_msgSend_isEqualToString_(v59, v104, (uint64_t)CFSTR("+"), v105, v106, v107))
  {
    v58 = v58 + v103;
    goto LABEL_21;
  }
  if (objc_msgSend_isEqualToString_(v59, v108, (uint64_t)CFSTR("-"), v109, v110, v111))
  {
    v58 = v58 - v103;
    goto LABEL_21;
  }
  if ((objc_msgSend_isEqualToString_(v59, v112, (uint64_t)CFSTR("\\times"), v113, v114, v115) & 1) != 0
    || (objc_msgSend_isEqualToString_(v59, v116, (uint64_t)CFSTR("\\cdot"), v117, v118, v119) & 1) != 0
    || objc_msgSend_isEqualToString_(v59, v120, (uint64_t)CFSTR("\\ast"), v121, v122, v123))
  {
    v58 = v58 * v103;
    goto LABEL_21;
  }
  if ((objc_msgSend_isEqualToString_(v59, v124, (uint64_t)CFSTR("/"), v125, v126, v127) & 1) != 0
    || (objc_msgSend_isEqualToString_(v59, v128, (uint64_t)CFSTR("\\div"), v129, v130, v131) & 1) != 0
    || objc_msgSend_isEqualToString_(v59, v132, (uint64_t)CFSTR(":"), v133, v134, v135))
  {
    v58 = v58 / v103;
    goto LABEL_21;
  }
LABEL_42:
  v145 = CFSTR("STOP");
LABEL_38:

LABEL_39:
  return v145;
}

@end

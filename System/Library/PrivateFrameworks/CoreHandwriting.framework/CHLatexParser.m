@implementation CHLatexParser

- (CHLatexParser)initWithGrammar:(id)a3 parseNormalizedLatex:(BOOL)a4
{
  id v7;
  CHLatexParser *v8;
  CHLatexParser *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHLatexParser;
  v8 = -[CHLatexParser init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_grammar, a3);
    v9->_parseNormalizedLatex = a4;
  }

  return v9;
}

- (id)_initializeParseTableForNormalizedLatex:(id)a3
{
  CHParseTable *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
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
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  CHTerminal *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  CHNonTerminal *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  CHParseTableCell *v76;
  const char *v77;
  uint64_t v78;
  void *inited;
  CHProductionRule *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  CHParseTree *v98;
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
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t j;
  void *v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  int isEqualToString;
  double v151;
  double v152;
  CHTerminal *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  CHNonTerminal *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  CHParseTableCell *v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  CHParseTree *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  id v221;
  uint64_t v222;
  void *v223;
  id v224;
  id v225;
  uint64_t v227;
  uint64_t v228;
  unint64_t i;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  _BYTE v234[128];
  uint64_t v235;

  v235 = *MEMORY[0x1E0C80C00];
  v224 = a3;
  v3 = [CHParseTable alloc];
  v9 = objc_msgSend_count(v224, v4, v5, v6, v7, v8);
  objc_msgSend_grammar(self, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nonTerminals(v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_count(v21, v22, v23, v24, v25, v26);
  v225 = (id)objc_msgSend_initWithInputLength_grammarSize_(v3, v28, v9, v27, v29, v30);

  v221 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend_setMaximumFractionDigits_(v221, v31, 9, v32, v33, v34);
  objc_msgSend_setRoundingMode_(v221, v35, 6, v36, v37, v38);
  v228 = 0;
  for (i = 0; i < objc_msgSend_count(v224, v39, v40, v41, v42, v43); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v224, v44, i, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v227 = objc_msgSend_length(v48, v49, v50, v51, v52, v53);
    v222 = objc_msgSend_length(v48, v54, v55, v56, v57, v58);
    objc_msgSend_numberFromString_(v221, v59, (uint64_t)v48, v60, v61, v62);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    if (v223)
    {
      v68 = [CHTerminal alloc];
      v71 = (void *)objc_msgSend_initWithName_inputRange_(v68, v69, (uint64_t)v48, v228, v227, v70);
      v72 = [CHNonTerminal alloc];
      v75 = (void *)objc_msgSend_initWithName_leftNode_rightNode_(v72, v73, (uint64_t)CFSTR("Number"), (uint64_t)v71, 0, v74);
      v76 = [CHParseTableCell alloc];
      inited = (void *)objc_msgSend_initNonTerminal_range_(v76, v77, (uint64_t)v75, i, 1, v78);
      v80 = [CHProductionRule alloc];
      v84 = (void *)objc_msgSend_initWithLeftNode_rightNode_(v80, v81, (uint64_t)CFSTR("Number"), (uint64_t)v48, v82, v83);
      objc_msgSend_setRule_(inited, v85, (uint64_t)v84, v86, v87, v88);

      objc_msgSend_setTerminal_(inited, v89, (uint64_t)v71, v90, v91, v92);
      objc_msgSend_setProbability_(inited, v93, v94, v95, v96, v97, 1.0);
      v98 = [CHParseTree alloc];
      objc_msgSend_grammar(self, v99, v100, v101, v102, v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = (void *)objc_msgSend_initWithGrammar_(v98, v105, (uint64_t)v104, v106, v107, v108);
      objc_msgSend_setParseTree_(inited, v110, (uint64_t)v109, v111, v112, v113);

      objc_msgSend_parseTree(inited, v114, v115, v116, v117, v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRoot_(v119, v120, (uint64_t)v75, v121, v122, v123);

      objc_msgSend_addCell_(v225, v124, (uint64_t)inited, v125, v126, v127);
    }
    else
    {
      v232 = 0u;
      v233 = 0u;
      v230 = 0u;
      v231 = 0u;
      objc_msgSend_grammar(self, v63, v64, v65, v66, v67);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_terminalProductions(v128, v129, v130, v131, v132, v133);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v134, (uint64_t)&v230, (uint64_t)v234, 16, v135);
      if (v141)
      {
        v142 = *(_QWORD *)v231;
        do
        {
          for (j = 0; j != v141; ++j)
          {
            if (*(_QWORD *)v231 != v142)
              objc_enumerationMutation(v71);
            v144 = *(void **)(*((_QWORD *)&v230 + 1) + 8 * j);
            objc_msgSend_rightNode1(v144, v136, v137, v138, v139, v140);
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v145, v146, (uint64_t)v48, v147, v148, v149);

            if (isEqualToString)
            {
              objc_msgSend_probability(v144, v136, v137, v138, v139, v140);
              v152 = v151;
              if (v151 > 0.0)
              {
                v153 = [CHTerminal alloc];
                objc_msgSend_rightNode1(v144, v154, v155, v156, v157, v158);
                v159 = (void *)objc_claimAutoreleasedReturnValue();
                v162 = (void *)objc_msgSend_initWithName_inputRange_(v153, v160, (uint64_t)v159, v228, v227, v161);

                v163 = [CHNonTerminal alloc];
                objc_msgSend_leftNode(v144, v164, v165, v166, v167, v168);
                v169 = (void *)objc_claimAutoreleasedReturnValue();
                v172 = (void *)objc_msgSend_initWithName_leftNode_rightNode_(v163, v170, (uint64_t)v169, (uint64_t)v162, 0, v171);

                v173 = [CHParseTableCell alloc];
                v176 = (void *)objc_msgSend_initNonTerminal_range_(v173, v174, (uint64_t)v172, i, 1, v175);
                objc_msgSend_setRule_(v176, v177, (uint64_t)v144, v178, v179, v180);
                objc_msgSend_setTerminal_(v176, v181, (uint64_t)v162, v182, v183, v184);
                objc_msgSend_setProbability_(v176, v185, v186, v187, v188, v189, v152);
                v190 = [CHParseTree alloc];
                objc_msgSend_grammar(self, v191, v192, v193, v194, v195);
                v196 = (void *)objc_claimAutoreleasedReturnValue();
                v201 = (void *)objc_msgSend_initWithGrammar_(v190, v197, (uint64_t)v196, v198, v199, v200);
                objc_msgSend_setParseTree_(v176, v202, (uint64_t)v201, v203, v204, v205);

                objc_msgSend_parseTree(v176, v206, v207, v208, v209, v210);
                v211 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setRoot_(v211, v212, (uint64_t)v172, v213, v214, v215);

                objc_msgSend_addCell_(v225, v216, (uint64_t)v176, v217, v218, v219);
              }
            }
          }
          v141 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v136, (uint64_t)&v230, (uint64_t)v234, 16, v140);
        }
        while (v141);
      }
    }

    v228 += v222;
  }

  return v225;
}

- (id)_initializeParseTableForPlainText:(id)a3
{
  id v4;
  CHParseTable *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  const char *v41;
  void *v42;
  id v43;
  _QWORD v45[5];
  id v46;

  v4 = a3;
  v5 = [CHParseTable alloc];
  v11 = objc_msgSend_length(v4, v6, v7, v8, v9, v10);
  objc_msgSend_grammar(self, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nonTerminals(v17, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_count(v23, v24, v25, v26, v27, v28);
  v33 = (void *)objc_msgSend_initWithInputLength_grammarSize_(v5, v30, v11, v29, v31, v32);

  v39 = objc_msgSend_length(v4, v34, v35, v36, v37, v38);
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = sub_1BE7B5C8C;
  v45[3] = &unk_1E77F50F0;
  v45[4] = self;
  v40 = v33;
  v46 = v40;
  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v4, v41, 0, v39, 2, (uint64_t)v45);
  v42 = v46;
  v43 = v40;

  return v43;
}

- (id)_joinNumbers:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
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
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t i;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  char v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v3 = a3;
  objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsSeparatedByCharactersInSet_(v3, v10, (uint64_t)v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_string(MEMORY[0x1E0CB37A0], v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v14, v21, v22, v23, v24, v25))
  {
    objc_msgSend_objectAtIndexedSubscript_(v14, v26, 0, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v20, v31, (uint64_t)v30, v32, v33, v34);

    for (i = 1; ; ++i)
    {
      if (i >= objc_msgSend_count(v14, v35, v36, v37, v38, v39))
        goto LABEL_10;
      objc_msgSend_objectAtIndexedSubscript_(v14, v41, i, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((sub_1BE7B61C0(v45) & 1) == 0)
        break;
      objc_msgSend_objectAtIndexedSubscript_(v14, v46, i - 1, v47, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = sub_1BE7B61C0(v50);

      if ((v51 & 1) == 0)
        goto LABEL_8;
LABEL_9:
      objc_msgSend_objectAtIndexedSubscript_(v14, v52, i, v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v20, v57, (uint64_t)v56, v58, v59, v60);

    }
LABEL_8:
    objc_msgSend_appendString_(v20, v52, (uint64_t)CFSTR(" "), v53, v54, v55);
    goto LABEL_9;
  }
LABEL_10:

  return v20;
}

- (id)parseLatex:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_parseLatex_outCorrectedLatex_(self, a2, (uint64_t)a3, 0, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)parseLatex:(id)a3 outCorrectedLatex:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  _QWORD *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void **v114;
  void **v115;
  _QWORD *v116;
  BOOL v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  unint64_t v123;
  id v124;
  uint64_t v125;
  const char *v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  id v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t jj;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t *v153;
  const char *v154;
  _QWORD *v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  id v168;
  const char *v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  uint64_t kk;
  id v180;
  void *v181;
  double v182;
  double v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  double v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  CHLatexParseTree *v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  char *v242;
  unint64_t v243;
  uint64_t v244;
  unint64_t v245;
  uint64_t *v246;
  uint64_t v247;
  const char *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  unint64_t v256;
  char *v257;
  unint64_t v258;
  uint64_t v259;
  unint64_t v260;
  _QWORD *v261;
  id v262;
  unint64_t v263;
  void *v264;
  void *v265;
  uint64_t v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  const char *v272;
  uint64_t v273;
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
  uint64_t v284;
  uint64_t v285;
  NSUInteger v286;
  const char *v287;
  uint64_t v288;
  const char *length;
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
  NSUInteger v300;
  NSUInteger v301;
  NSUInteger v302;
  NSRange v303;
  const char *v305;
  uint64_t v306;
  void *v307;
  const char *v308;
  uint64_t v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  void *v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t ii;
  void *v330;
  void *v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  void *inited;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  void *v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  void *v359;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  void *v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  int isEqualToString;
  uint64_t v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  double v389;
  double v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  double v396;
  double v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  double v403;
  double v404;
  const char *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  void *v410;
  const char *v411;
  const char *v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  double v417;
  double v418;
  CHNonTerminal *v419;
  const char *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  void *v425;
  const char *v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  void *v431;
  const char *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  void *v437;
  const char *v438;
  uint64_t v439;
  CHParseTableCell *v440;
  const char *v441;
  uint64_t v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  const char *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  const char *v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  CHParseTree *v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  void *v462;
  const char *v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  void *v467;
  const char *v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  const char *v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  void *v477;
  const char *v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  const char *v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  const char *v486;
  uint64_t v487;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  id v494;
  void *v495;
  void *v496;
  id v497;
  void *v498;
  uint64_t j;
  uint64_t v500;
  id v501;
  uint64_t v502;
  uint64_t m;
  void *v504;
  NSUInteger v505;
  NSUInteger v506;
  void *v507;
  uint64_t v508;
  id v509;
  uint64_t k;
  id v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t n;
  id obj;
  uint64_t v516;
  void *v517;
  id v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  void *v522;
  CHLatexParser *v523;
  __int128 v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  void *v532[2];
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  void *v559;
  _QWORD *v560;
  char *v561;
  void *__p;
  char *v563;
  char *v564;
  _BYTE v565[128];
  _BYTE v566[128];
  _BYTE v567[128];
  _BYTE v568[128];
  _BYTE v569[128];
  _BYTE v570[128];
  _BYTE v571[128];
  _BYTE v572[128];
  uint64_t v573;
  NSRange v574;
  NSRange v575;

  v573 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v523 = self;
  objc_msgSend__joinNumbers_(self, v7, (uint64_t)v6, v8, v9, v10);
  v509 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = objc_retainAutorelease(v509);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v11, v12, v13, v14, v15);
  v504 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsSeparatedByCharactersInSet_(v509, v22, (uint64_t)v21, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v563 = 0;
  __p = 0;
  v564 = 0;
  v560 = 0;
  v559 = 0;
  v561 = 0;
  v555 = 0u;
  v556 = 0u;
  v557 = 0u;
  v558 = 0u;
  obj = v26;
  v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v555, (uint64_t)v572, 16, v28);
  if (v34)
  {
    v35 = 0;
    v36 = 0;
    v521 = *(_QWORD *)v556;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        while (1)
        {
          if (*(_QWORD *)v556 != v521)
            objc_enumerationMutation(obj);
          v38 = *(void **)(*((_QWORD *)&v555 + 1) + 8 * i);
          if (objc_msgSend_length(v38, v29, v30, v31, v32, v33))
            break;
          ++v36;
          if (++i == v34)
            goto LABEL_47;
        }
        v39 = objc_msgSend_length(v38, v29, v30, v31, v32, v33);
        v45 = v39;
        v46 = v563;
        if (v563 < v564)
        {
          *(_QWORD *)v563 = v36;
          *((_QWORD *)v46 + 1) = v39;
          v47 = v46 + 16;
          goto LABEL_28;
        }
        v48 = (char *)__p;
        v49 = (v563 - (_BYTE *)__p) >> 4;
        v50 = v49 + 1;
        if ((unint64_t)(v49 + 1) >> 60)
          sub_1BE61F930();
        v51 = v564 - (_BYTE *)__p;
        if ((v564 - (_BYTE *)__p) >> 3 > v50)
          v50 = v51 >> 3;
        if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF0)
          v52 = 0xFFFFFFFFFFFFFFFLL;
        else
          v52 = v50;
        if (v52)
        {
          if (v52 >> 60)
            sub_1BE61F100();
          v53 = (char *)operator new(16 * v52);
          v54 = &v53[16 * v49];
          *(_QWORD *)v54 = v36;
          *((_QWORD *)v54 + 1) = v45;
          v55 = v54;
          if (v46 == v48)
          {
LABEL_26:
            v47 = v54 + 16;
            __p = v55;
            v564 = &v53[16 * v52];
            if (!v46)
              goto LABEL_28;
LABEL_27:
            operator delete(v46);
            goto LABEL_28;
          }
        }
        else
        {
          v53 = 0;
          v54 = (char *)(16 * v49);
          *(_QWORD *)v54 = v36;
          *((_QWORD *)v54 + 1) = v45;
          v55 = (char *)(16 * v49);
          if (v46 == v48)
            goto LABEL_26;
        }
        do
        {
          *((_OWORD *)v55 - 1) = *((_OWORD *)v46 - 1);
          v55 -= 16;
          v46 -= 16;
        }
        while (v46 != v48);
        v46 = (char *)__p;
        v47 = v54 + 16;
        __p = v55;
        v564 = &v53[16 * v52];
        if (v46)
          goto LABEL_27;
LABEL_28:
        v563 = v47;
        v56 = objc_msgSend_length(v38, v40, v41, v42, v43, v44);
        v62 = v56;
        v63 = v560;
        if (v560 < (_QWORD *)v561)
        {
          *v560 = v35;
          v63[1] = v56;
          v64 = v63 + 2;
          goto LABEL_46;
        }
        v65 = v559;
        v66 = ((char *)v560 - (_BYTE *)v559) >> 4;
        v67 = v66 + 1;
        if ((unint64_t)(v66 + 1) >> 60)
          sub_1BE61F930();
        v68 = v561 - (_BYTE *)v559;
        if ((v561 - (_BYTE *)v559) >> 3 > v67)
          v67 = v68 >> 3;
        if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF0)
          v69 = 0xFFFFFFFFFFFFFFFLL;
        else
          v69 = v67;
        if (v69)
        {
          if (v69 >> 60)
            sub_1BE61F100();
          v70 = (char *)operator new(16 * v69);
          v71 = &v70[16 * v66];
          *(_QWORD *)v71 = v35;
          *((_QWORD *)v71 + 1) = v62;
          v72 = v71;
          if (v63 == v65)
          {
LABEL_44:
            v64 = v71 + 16;
            v559 = v72;
            v561 = &v70[16 * v69];
            if (!v63)
              goto LABEL_46;
LABEL_45:
            operator delete(v63);
            goto LABEL_46;
          }
        }
        else
        {
          v70 = 0;
          v71 = (char *)(16 * v66);
          *(_QWORD *)v71 = v35;
          *((_QWORD *)v71 + 1) = v62;
          v72 = (char *)(16 * v66);
          if (v63 == v65)
            goto LABEL_44;
        }
        do
        {
          *((_OWORD *)v72 - 1) = *((_OWORD *)v63 - 1);
          v72 -= 16;
          v63 -= 2;
        }
        while (v63 != v65);
        v63 = v559;
        v64 = v71 + 16;
        v559 = v72;
        v561 = &v70[16 * v69];
        if (v63)
          goto LABEL_45;
LABEL_46:
        v560 = v64;
        v73 = objc_msgSend_length(v38, v57, v58, v59, v60, v61);
        v35 += objc_msgSend_length(v38, v74, v75, v76, v77, v78);
        v36 += v73 + 1;
      }
LABEL_47:
      v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v555, (uint64_t)v572, 16, v33);
    }
    while (v34);
  }

  if (objc_msgSend_parseNormalizedLatex(v523, v79, v80, v81, v82, v83))
  {
    v508 = objc_msgSend_count(obj, v84, v85, v86, v87, v88);
    objc_msgSend__initializeParseTableForNormalizedLatex_(v523, v89, (uint64_t)obj, v90, v91, v92);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v509, v84, (uint64_t)CFSTR(" "), (uint64_t)&stru_1E77F6F28, v87, v88);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v508 = objc_msgSend_length(v98, v99, v100, v101, v102, v103);
    objc_msgSend__initializeParseTableForPlainText_(v523, v104, (uint64_t)v98, v105, v106, v107);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v517 = v97;
  if (v508 >= 2)
  {
    v516 = 2;
    do
    {
      v267 = 1;
      do
      {
        objc_msgSend_cellsByRangeForLength_(v97, v93, v267, v94, v95, v96);
        v496 = (void *)objc_claimAutoreleasedReturnValue();
        v489 = v267;
        objc_msgSend_cellsByRangeForLength_(v97, v268, v516 - v267, v269, v270, v271);
        v498 = (void *)objc_claimAutoreleasedReturnValue();
        v553 = 0u;
        v554 = 0u;
        v551 = 0u;
        v552 = 0u;
        v497 = v496;
        v490 = objc_msgSend_countByEnumeratingWithState_objects_count_(v497, v272, (uint64_t)&v551, (uint64_t)v571, 16, v273);
        if (!v490)
          goto LABEL_184;
        v492 = *(_QWORD *)v552;
        do
        {
          for (j = 0; j != v490; ++j)
          {
            if (*(_QWORD *)v552 != v492)
              objc_enumerationMutation(v497);
            v495 = *(void **)(*((_QWORD *)&v551 + 1) + 8 * j);
            objc_msgSend_firstObject(v495, v274, v275, v276, v277, v278);
            v279 = (void *)objc_claimAutoreleasedReturnValue();
            v285 = objc_msgSend_inputRange(v279, v280, v281, v282, v283, v284);
            v505 = v286;
            v506 = v285;

            v549 = 0u;
            v550 = 0u;
            v547 = 0u;
            v548 = 0u;
            v501 = v498;
            v500 = objc_msgSend_countByEnumeratingWithState_objects_count_(v501, v287, (uint64_t)&v547, (uint64_t)v570, 16, v288);
            if (v500)
            {
              v502 = *(_QWORD *)v548;
              do
              {
                for (k = 0; k != v500; ++k)
                {
                  if (*(_QWORD *)v548 != v502)
                    objc_enumerationMutation(v501);
                  v507 = *(void **)(*((_QWORD *)&v547 + 1) + 8 * k);
                  objc_msgSend_firstObject(v507, length, v290, v291, v292, v293);
                  v294 = (void *)objc_claimAutoreleasedReturnValue();
                  v300 = objc_msgSend_inputRange(v294, v295, v296, v297, v298, v299);
                  v302 = v301;

                  v574.location = v506;
                  v574.length = v505;
                  v575.location = v300;
                  v575.length = v302;
                  v303 = NSUnionRange(v574, v575);
                  length = (const char *)v303.length;
                  if (v303.length == v302 + v505 && v506 <= v300)
                  {
                    v545 = 0u;
                    v546 = 0u;
                    v543 = 0u;
                    v544 = 0u;
                    v494 = v495;
                    v491 = objc_msgSend_countByEnumeratingWithState_objects_count_(v494, v305, (uint64_t)&v543, (uint64_t)v569, 16, v306);
                    if (!v491)
                      goto LABEL_141;
                    v493 = *(_QWORD *)v544;
                    while (1)
                    {
                      for (m = 0; m != v491; ++m)
                      {
                        if (*(_QWORD *)v544 != v493)
                          objc_enumerationMutation(v494);
                        v307 = *(void **)(*((_QWORD *)&v543 + 1) + 8 * m);
                        v539 = 0u;
                        v540 = 0u;
                        v541 = 0u;
                        v542 = 0u;
                        v511 = v507;
                        v513 = objc_msgSend_countByEnumeratingWithState_objects_count_(v511, v308, (uint64_t)&v539, (uint64_t)v568, 16, v309);
                        if (v513)
                        {
                          v512 = *(_QWORD *)v540;
                          do
                          {
                            for (n = 0; n != v513; ++n)
                            {
                              if (*(_QWORD *)v540 != v512)
                                objc_enumerationMutation(v511);
                              v522 = *(void **)(*((_QWORD *)&v539 + 1) + 8 * n);
                              v535 = 0u;
                              v536 = 0u;
                              v537 = 0u;
                              v538 = 0u;
                              objc_msgSend_grammar(v523, v310, v311, v312, v313, v314);
                              v315 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_nonTerminalProductions(v315, v316, v317, v318, v319, v320);
                              v518 = (id)objc_claimAutoreleasedReturnValue();

                              v323 = objc_msgSend_countByEnumeratingWithState_objects_count_(v518, v321, (uint64_t)&v535, (uint64_t)v567, 16, v322);
                              if (v323)
                              {
                                v519 = *(_QWORD *)v536;
                                do
                                {
                                  v520 = v323;
                                  for (ii = 0; ii != v520; ++ii)
                                  {
                                    if (*(_QWORD *)v536 != v519)
                                      objc_enumerationMutation(v518);
                                    v330 = *(void **)(*((_QWORD *)&v535 + 1) + 8 * ii);
                                    objc_msgSend_rightNode1(v330, v324, v325, v326, v327, v328);
                                    v331 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend_nonTerminal(v307, v332, v333, v334, v335, v336);
                                    v337 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend_name(v337, v338, v339, v340, v341, v342);
                                    inited = (void *)objc_claimAutoreleasedReturnValue();
                                    if (!objc_msgSend_isEqualToString_(v331, v344, (uint64_t)inited, v345, v346, v347))goto LABEL_174;
                                    objc_msgSend_rightNode2(v330, v348, v349, v350, v351, v352);
                                    v353 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend_nonTerminal(v522, v354, v355, v356, v357, v358);
                                    v359 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend_name(v359, v360, v361, v362, v363, v364);
                                    v365 = (void *)objc_claimAutoreleasedReturnValue();
                                    isEqualToString = objc_msgSend_isEqualToString_(v353, v366, (uint64_t)v365, v367, v368, v369);

                                    if (isEqualToString)
                                    {
                                      v371 = objc_msgSend_combinations(v307, v324, v325, v326, v327, v328);
                                      if (v371 <= objc_msgSend_combinations(v522, v372, v373, v374, v375, v376))
                                        v382 = objc_msgSend_combinations(v522, v377, v378, v379, v380, v381);
                                      else
                                        v382 = objc_msgSend_combinations(v307, v377, v378, v379, v380, v381);
                                      v388 = v382;
                                      objc_msgSend_probability(v307, v383, v384, v385, v386, v387);
                                      v390 = v389;
                                      objc_msgSend_probability(v522, v391, v392, v393, v394, v395);
                                      v397 = v396;
                                      objc_msgSend_probability(v330, v398, v399, v400, v401, v402);
                                      v404 = v403;
                                      objc_msgSend_leftNode(v330, v405, v406, v407, v408, v409);
                                      v410 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend_cellWithLength_range_nonTerminal_(v517, v411, v516, v303.location, v303.length, (uint64_t)v410);
                                      v331 = (void *)objc_claimAutoreleasedReturnValue();

                                      v417 = v390 * v397 * v404;
                                      if (!v331
                                        || (objc_msgSend_probability(v331, v412, v413, v414, v415, v416), v417 > v418))
                                      {
                                        v419 = [CHNonTerminal alloc];
                                        objc_msgSend_leftNode(v330, v420, v421, v422, v423, v424);
                                        v425 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend_nonTerminal(v307, v426, v427, v428, v429, v430);
                                        v431 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend_nonTerminal(v522, v432, v433, v434, v435, v436);
                                        v437 = (void *)objc_claimAutoreleasedReturnValue();
                                        v337 = (void *)objc_msgSend_initWithName_leftNode_rightNode_(v419, v438, (uint64_t)v425, (uint64_t)v431, (uint64_t)v437, v439);

                                        v440 = [CHParseTableCell alloc];
                                        inited = (void *)objc_msgSend_initNonTerminal_range_(v440, v441, (uint64_t)v337, v303.location, v303.length, v442);
                                        objc_msgSend_setRule_(inited, v443, (uint64_t)v330, v444, v445, v446);
                                        objc_msgSend_setCombinations_(inited, v447, v388 + 1, v448, v449, v450);
                                        objc_msgSend_setProbability_(inited, v451, v452, v453, v454, v455, v417);
                                        v456 = [CHParseTree alloc];
                                        objc_msgSend_grammar(v523, v457, v458, v459, v460, v461);
                                        v462 = (void *)objc_claimAutoreleasedReturnValue();
                                        v467 = (void *)objc_msgSend_initWithGrammar_(v456, v463, (uint64_t)v462, v464, v465, v466);
                                        objc_msgSend_setParseTree_(inited, v468, (uint64_t)v467, v469, v470, v471);

                                        objc_msgSend_parseTree(inited, v472, v473, v474, v475, v476);
                                        v477 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend_setRoot_(v477, v478, (uint64_t)v337, v479, v480, v481);

                                        objc_msgSend_addCell_(v517, v482, (uint64_t)inited, v483, v484, v485);
LABEL_174:

                                      }
                                      continue;
                                    }
                                  }
                                  v323 = objc_msgSend_countByEnumeratingWithState_objects_count_(v518, v324, (uint64_t)&v535, (uint64_t)v567, 16, v328);
                                }
                                while (v323);
                              }

                            }
                            v513 = objc_msgSend_countByEnumeratingWithState_objects_count_(v511, v310, (uint64_t)&v539, (uint64_t)v568, 16, v314);
                          }
                          while (v513);
                        }

                      }
                      v491 = objc_msgSend_countByEnumeratingWithState_objects_count_(v494, v486, (uint64_t)&v543, (uint64_t)v569, 16, v487);
                      if (!v491)
                      {
LABEL_141:

                        break;
                      }
                    }
                  }
                }
                v500 = objc_msgSend_countByEnumeratingWithState_objects_count_(v501, length, (uint64_t)&v547, (uint64_t)v570, 16, v293);
              }
              while (v500);
            }

          }
          v490 = objc_msgSend_countByEnumeratingWithState_objects_count_(v497, v274, (uint64_t)&v551, (uint64_t)v571, 16, v278);
        }
        while (v490);
LABEL_184:

        v267 = v489 + 1;
        v97 = v517;
      }
      while (v489 + 1 != v516);
    }
    while (v516++ != v508);
  }
  v533 = 0u;
  v534 = 0u;
  *(_OWORD *)v532 = 0u;
  sub_1BE7B7754(v532);
  v113 = *((_QWORD *)&v534 + 1);
  v114 = (void **)v532[1];
  v115 = (void **)v533;
  v116 = (_QWORD *)(*(_QWORD *)((char *)v532[1] + ((((_QWORD)v534 + *((_QWORD *)&v534 + 1)) >> 5) & 0x7FFFFFFFFFFFFF8))
                  + 16 * (v534 + BYTE8(v534)));
  *v116 = 0;
  v116[1] = v508;
  v117 = __CFADD__(v113, 1);
  v118 = v113 + 1;
  if (v117)
    goto LABEL_119;
  do
  {
    v119 = v533;
    v120 = 32 * (v533 - (unint64_t)v532[1]) - 1;
    if ((void *)v533 == v532[1])
      v120 = 0;
    v121 = (uint64_t *)(*(_QWORD *)((char *)v532[1] + (((unint64_t)(v534 + v118 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                     + 16 * (v534 + v118 - 1));
    v122 = *v121;
    v123 = v121[1];
    *((_QWORD *)&v534 + 1) = v118 - 1;
    if (v120 - (v118 + (_QWORD)v534) + 1 >= 0x200)
    {
      operator delete(*(void **)(v533 - 8));
      *(_QWORD *)&v533 = v119 - 8;
    }
    v124 = 0;
    v125 = v123;
LABEL_58:
    if (!objc_msgSend_count(v124, v108, v109, v110, v111, v112) && v125 >= 1)
    {
      objc_msgSend_startCellsWithLength_inRange_startSymbol_(v517, v126, v125, v122, v123, (uint64_t)CFSTR("Expression"));
      v127 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_array(MEMORY[0x1E0C99DE8], v128, v129, v130, v131, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v530 = 0u;
      v531 = 0u;
      v528 = 0u;
      v529 = 0u;
      v134 = v127;
      v142 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v528, (uint64_t)v566, 16, v136);
      if (!v142)
        goto LABEL_84;
      v143 = *(_QWORD *)v529;
      while (1)
      {
        for (jj = 0; jj != v142; ++jj)
        {
          if (*(_QWORD *)v529 != v143)
            objc_enumerationMutation(v134);
          v145 = *(void **)(*((_QWORD *)&v528 + 1) + 8 * jj);
          if (objc_msgSend_parseNormalizedLatex(v523, v137, v138, v139, v140, v141))
            v151 = objc_msgSend_terminalsRange(v145, v146, v147, v148, v149, v150);
          else
            v151 = objc_msgSend_inputRange(v145, v146, v147, v148, v149, v150);
          if (v560 != v559)
          {
            v152 = ((char *)v560 - (_BYTE *)v559) >> 4;
            v153 = (uint64_t *)__p;
            v154 = &v137[v151];
            if (v152 <= 1)
              v152 = 1;
            v155 = (char *)v559 + 8;
            v156 = 0x7FFFFFFFFFFFFFFFLL;
            v138 = 0x7FFFFFFFFFFFFFFFLL;
            while (1)
            {
              v157 = *(v155 - 1);
              if (v151 == v157)
              {
                v138 = *v153;
                if (v154 != (const char *)(*v155 + v157))
                  goto LABEL_74;
              }
              else if (v154 != (const char *)(*v155 + v157))
              {
                goto LABEL_74;
              }
              v156 = v153[1] + *v153;
LABEL_74:
              v153 += 2;
              v155 += 2;
              if (!--v152)
              {
                if (v138 != 0x7FFFFFFFFFFFFFFFLL && v156 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  objc_msgSend_setOriginalRange_(v145, v137, v138, v156 - v138, v140, v141);
                  objc_msgSend_addObject_(v133, v158, (uint64_t)v145, v159, v160, v161);
                }
                break;
              }
            }
          }
        }
        v142 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v137, (uint64_t)&v528, (uint64_t)v566, 16, v141);
        if (!v142)
        {
LABEL_84:

          v124 = v133;
          v167 = objc_msgSend_count(v124, v162, v163, v164, v165, v166) == 0;

          v125 -= v167;
          goto LABEL_58;
        }
      }
    }
    v526 = 0u;
    v527 = 0u;
    v524 = 0u;
    v525 = 0u;
    v168 = v124;
    v176 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v169, (uint64_t)&v524, (uint64_t)v565, 16, v170);
    if (!v176)
    {

      v177 = 0;
LABEL_100:
      v206 = 0;
      goto LABEL_117;
    }
    v177 = 0;
    v178 = *(_QWORD *)v525;
    do
    {
      for (kk = 0; kk != v176; ++kk)
      {
        if (*(_QWORD *)v525 != v178)
          objc_enumerationMutation(v168);
        v181 = *(void **)(*((_QWORD *)&v524 + 1) + 8 * kk);
        if (v177)
        {
          objc_msgSend_probability(*(void **)(*((_QWORD *)&v524 + 1) + 8 * kk), v171, v172, v173, v174, v175);
          v183 = v182;
          objc_msgSend_probability(v177, v184, v185, v186, v187, v188);
          if (v183 <= v189)
            continue;
        }
        v180 = v181;

        v177 = v180;
      }
      v176 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v171, (uint64_t)&v524, (uint64_t)v565, 16, v175);
    }
    while (v176);

    if (!v177)
      goto LABEL_100;
    if (objc_msgSend_parseNormalizedLatex(v523, v190, v191, v192, v193, v194))
      v200 = [CHLatexParseTree alloc];
    else
      v200 = [CHParseTree alloc];
    objc_msgSend_grammar(v523, v195, v196, v197, v198, v199);
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = (void *)objc_msgSend_initWithGrammar_(v200, v202, (uint64_t)v201, v203, v204, v205);

    objc_msgSend_nonTerminal(v177, v207, v208, v209, v210, v211);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRoot_(v206, v213, (uint64_t)v212, v214, v215, v216);

    v222 = objc_msgSend_originalRange(v177, v217, v218, v219, v220, v221);
    objc_msgSend_setInputRange_(v206, v223, v222, (uint64_t)v223, v224, v225);
    objc_msgSend_addObject_(v504, v226, (uint64_t)v206, v227, v228, v229);
    if (v125 < v123)
    {
      v235 = objc_msgSend_inputRange(v177, v230, v231, v232, v233, v234);
      v241 = v235 - v122;
      if (v235 != v122)
      {
        v242 = (char *)v532[1];
        if ((void *)v533 == v532[1])
          v243 = 0;
        else
          v243 = 32 * (v533 - (unint64_t)v532[1]) - 1;
        v244 = *((_QWORD *)&v534 + 1);
        v245 = *((_QWORD *)&v534 + 1) + v534;
        if (v243 == *((_QWORD *)&v534 + 1) + (_QWORD)v534)
        {
          sub_1BE7B7754(v532);
          v242 = (char *)v532[1];
          v244 = *((_QWORD *)&v534 + 1);
          v245 = *((_QWORD *)&v534 + 1) + v534;
        }
        v246 = (uint64_t *)(*(_QWORD *)&v242[(v245 >> 5) & 0x7FFFFFFFFFFFFF8] + 16 * v245);
        *v246 = v122;
        v246[1] = v241;
        *((_QWORD *)&v534 + 1) = v244 + 1;
      }
      v247 = objc_msgSend_inputRange(v177, v236, v237, v238, v239, v240);
      v249 = v248;
      v254 = objc_msgSend_inputRange(v177, v248, v250, v251, v252, v253);
      v256 = v123 + v122 - (v255 + v254);
      if (v123 + v122 != v255 + v254)
      {
        v257 = (char *)v532[1];
        if ((void *)v533 == v532[1])
          v258 = 0;
        else
          v258 = 32 * (v533 - (unint64_t)v532[1]) - 1;
        v259 = *((_QWORD *)&v534 + 1);
        v260 = *((_QWORD *)&v534 + 1) + v534;
        if (v258 == *((_QWORD *)&v534 + 1) + (_QWORD)v534)
        {
          sub_1BE7B7754(v532);
          v257 = (char *)v532[1];
          v259 = *((_QWORD *)&v534 + 1);
          v260 = *((_QWORD *)&v534 + 1) + v534;
        }
        v261 = (_QWORD *)(*(_QWORD *)&v257[(v260 >> 5) & 0x7FFFFFFFFFFFFF8] + 16 * v260);
        *v261 = &v249[v247];
        v261[1] = v256;
        *((_QWORD *)&v534 + 1) = v259 + 1;
      }
    }
LABEL_117:

    v118 = *((_QWORD *)&v534 + 1);
  }
  while (*((_QWORD *)&v534 + 1));
  v114 = (void **)v532[1];
  v115 = (void **)v533;
  v97 = v517;
LABEL_119:
  v262 = v504;
  v263 = (char *)v115 - (char *)v114;
  if ((unint64_t)((char *)v115 - (char *)v114) >= 0x11)
  {
    do
    {
      v264 = *v114++;
      operator delete(v264);
      v263 -= 8;
    }
    while (v263 > 0x10);
    v532[1] = v114;
  }
  while (v114 != v115)
  {
    v265 = *v114++;
    operator delete(v265);
  }
  if (v532[0])
    operator delete(v532[0]);

  if (v559)
    operator delete(v559);
  if (__p)
    operator delete(__p);

  return v262;
}

- (CHGrammar)grammar
{
  return self->_grammar;
}

- (BOOL)parseNormalizedLatex
{
  return self->_parseNormalizedLatex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grammar, 0);
}

@end

@implementation IATextInputActionsSessionAction

- (IATextInputActionsSessionBeganAction)asBegan
{
  IATextInputActionsSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (IATextInputActionsSessionBeganAction *)v3;
}

- (IATextInputActionsSessionEndAction)asEnd
{
  IATextInputActionsSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (IATextInputActionsSessionEndAction *)v3;
}

- (IATextInputActionsSessionInsertionAction)asInsertion
{
  IATextInputActionsSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (IATextInputActionsSessionInsertionAction *)v3;
}

- (IATextInputActionsSessionDeletionAction)asDeletion
{
  IATextInputActionsSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (IATextInputActionsSessionDeletionAction *)v3;
}

- (IATextInputActionsSessionSelectionAction)asSelection
{
  IATextInputActionsSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (IATextInputActionsSessionSelectionAction *)v3;
}

- (IATextInputActionsSessionCopyAction)asCopy
{
  IATextInputActionsSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (IATextInputActionsSessionCopyAction *)v3;
}

- (IATextInputActionsSessionCutAction)asCut
{
  IATextInputActionsSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (IATextInputActionsSessionCutAction *)v3;
}

- (IATextInputActionsSessionPasteAction)asPaste
{
  IATextInputActionsSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (IATextInputActionsSessionPasteAction *)v3;
}

- (IATextInputActionsSessionUndoAction)asUndo
{
  IATextInputActionsSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (IATextInputActionsSessionUndoAction *)v3;
}

- (IATextInputActionsSessionRedoAction)asRedo
{
  IATextInputActionsSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (IATextInputActionsSessionRedoAction *)v3;
}

- (IATextInputActionsSessionKeyboardDockItemButtonPressAction)asKeyboardDockItemButtonPress
{
  IATextInputActionsSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (IATextInputActionsSessionKeyboardDockItemButtonPressAction *)v3;
}

- (IATextInputActionsSessionDictationBeganAction)asDictationBegan
{
  IATextInputActionsSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (IATextInputActionsSessionDictationBeganAction *)v3;
}

- (IATextInputActionsSessionDictationEndedAction)asDictationEnded
{
  IATextInputActionsSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (IATextInputActionsSessionDictationEndedAction *)v3;
}

- (IATextInputActionsSessionReplaceTextAction)asReplaceText
{
  IATextInputActionsSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (IATextInputActionsSessionReplaceTextAction *)v3;
}

- (IATextInputActionsSessionReplaceWithCandidateAction)asReplaceWithCandidate
{
  IATextInputActionsSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (IATextInputActionsSessionReplaceWithCandidateAction *)v3;
}

- (int64_t)mergeActionIfPossible:(id)a3
{
  return 0;
}

- (BOOL)changedContent
{
  return 0;
}

- (BOOL)isCapableOfTextInsertion
{
  return 0;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  char isEmpty;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  uint64_t v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  objc_super v251;
  NSRange v252;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v251.receiver = self;
  v251.super_class = (Class)IATextInputActionsSessionAction;
  -[IAXPCObject description](&v251, sel_description);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v9, v11, (uint64_t)v10, v12, v13);

  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_appBundleId(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v14, v20, (uint64_t)CFSTR("appBundleId=%@"), v21, v22, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v9, v24, (uint64_t)v23, v25, v26);

  v27 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_processBundleId(self, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v27, v33, (uint64_t)CFSTR("procBundleId=%@"), v34, v35, v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v9, v37, (uint64_t)v36, v38, v39);

  v40 = (void *)MEMORY[0x24BDD17C8];
  v45 = objc_msgSend_source(self, v41, v42, v43, v44);
  objc_msgSend_stringForSource_(IATextInputActionsUtils, v46, v45, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v40, v50, (uint64_t)CFSTR("source=%@"), v51, v52, v49);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v9, v54, (uint64_t)v53, v55, v56);

  v57 = (void *)MEMORY[0x24BDD17C8];
  v62 = objc_msgSend_textInputActionsType(self, v58, v59, v60, v61);
  objc_msgSend_stringForType_(IATextInputActionsUtils, v63, v62, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v57, v67, (uint64_t)CFSTR("textInputActionsType=%@"), v68, v69, v66);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v9, v71, (uint64_t)v70, v72, v73);

  if (objc_msgSend_changedContent(self, v74, v75, v76, v77))
  {
    v82 = (void *)MEMORY[0x24BDD17C8];
    v83 = objc_msgSend_removedTextLength(self, v78, v79, v80, v81);
    objc_msgSend_stringWithFormat_(v82, v84, (uint64_t)CFSTR("removedTextLength=%lu"), v85, v86, v83);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v9, v88, (uint64_t)v87, v89, v90);

    v91 = (void *)MEMORY[0x24BDD17C8];
    v96 = objc_msgSend_insertedTextLength(self, v92, v93, v94, v95);
    objc_msgSend_stringWithFormat_(v91, v97, (uint64_t)CFSTR("insertedTextLength=%lu"), v98, v99, v96);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v9, v101, (uint64_t)v100, v102, v103);

    v104 = (void *)MEMORY[0x24BDD17C8];
    v109 = objc_msgSend_removedEmojiCount(self, v105, v106, v107, v108);
    objc_msgSend_stringWithFormat_(v104, v110, (uint64_t)CFSTR("removedEmojiCount=%lu"), v111, v112, v109);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v9, v114, (uint64_t)v113, v115, v116);

    v117 = (void *)MEMORY[0x24BDD17C8];
    v122 = objc_msgSend_insertedEmojiCount(self, v118, v119, v120, v121);
    objc_msgSend_stringWithFormat_(v117, v123, (uint64_t)CFSTR("insertedEmojiCount=%lu"), v124, v125, v122);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v9, v127, (uint64_t)v126, v128, v129);

    v130 = (void *)MEMORY[0x24BDD17C8];
    v135 = objc_msgSend_removedPunctuationCount(self, v131, v132, v133, v134);
    objc_msgSend_stringWithFormat_(v130, v136, (uint64_t)CFSTR("removedPunctuationCount=%lu"), v137, v138, v135);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v9, v140, (uint64_t)v139, v141, v142);

    v143 = (void *)MEMORY[0x24BDD17C8];
    v148 = objc_msgSend_insertedPunctuationCount(self, v144, v145, v146, v147);
    objc_msgSend_stringWithFormat_(v143, v149, (uint64_t)CFSTR("insertedPunctuationCount=%lu"), v150, v151, v148);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v9, v153, (uint64_t)v152, v154, v155);

    v156 = (void *)MEMORY[0x24BDD17C8];
    v161 = objc_msgSend_largestSingleDeletionLength(self, v157, v158, v159, v160);
    objc_msgSend_stringWithFormat_(v156, v162, (uint64_t)CFSTR("largestSingleDeletionLength=%lu"), v163, v164, v161);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v9, v166, (uint64_t)v165, v167, v168);

    v169 = (void *)MEMORY[0x24BDD17C8];
    v174 = objc_msgSend_largestSingleInsertionLength(self, v170, v171, v172, v173);
    objc_msgSend_stringWithFormat_(v169, v175, (uint64_t)CFSTR("largestSingleInsertionLength=%lu"), v176, v177, v174);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v9, v179, (uint64_t)v178, v180, v181);

  }
  objc_msgSend_inputMode(self, v78, v79, v80, v81);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  isEmpty = objc_msgSend_isEmpty(v182, v183, v184, v185, v186);

  if ((isEmpty & 1) == 0)
  {
    v192 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_inputMode(self, v188, v189, v190, v191);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v193, v194, v195, v196, v197);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v192, v199, (uint64_t)CFSTR("inputMode=%@"), v200, v201, v198);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v9, v203, (uint64_t)v202, v204, v205);

  }
  if (objc_msgSend_flagOptions(self, v188, v189, v190, v191))
  {
    v210 = (void *)MEMORY[0x24BDD17C8];
    v211 = objc_msgSend_flagOptions(self, v206, v207, v208, v209);
    objc_msgSend_stringWithFormat_(v210, v212, (uint64_t)CFSTR("flagOptions=%lu"), v213, v214, v211);
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v9, v216, (uint64_t)v215, v217, v218);

  }
  if (objc_msgSend_inputActionCount(self, v206, v207, v208, v209))
  {
    v223 = (void *)MEMORY[0x24BDD17C8];
    v224 = objc_msgSend_inputActionCount(self, v219, v220, v221, v222);
    objc_msgSend_stringWithFormat_(v223, v225, (uint64_t)CFSTR("inputActionCount=%ld"), v226, v227, v224);
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v9, v229, (uint64_t)v228, v230, v231);

  }
  if (objc_msgSend_relativeRangeBefore(self, v219, v220, v221, v222)
    || (objc_msgSend_relativeRangeBefore(self, v232, v233, v234, v235), v232))
  {
    v236 = (void *)MEMORY[0x24BDD17C8];
    v252.location = objc_msgSend_relativeRangeBefore(self, v232, v233, v234, v235);
    NSStringFromRange(v252);
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v236, v238, (uint64_t)CFSTR("relativeRangeBefore=%@"), v239, v240, v237);
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v9, v242, (uint64_t)v241, v243, v244);

  }
  objc_msgSend_componentsJoinedByString_(v9, v232, (uint64_t)CFSTR(", "), v234, v235);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v4, v246, (uint64_t)CFSTR(": %@"), v247, v248, v245);
  v249 = (void *)objc_claimAutoreleasedReturnValue();

  return v249;
}

+ (BOOL)shouldSeparatelyTrackKeystrokesForSource:(int64_t)a3 type:(int64_t)a4
{
  BOOL v5;

  v5 = a4 == 1 || a4 == 16;
  return a3 == 4 && v5;
}

- (int64_t)inputActionCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_inputActionCountFromMergedActions(self, a2, v2, v3, v4) + 1;
}

- (void)setInsertedTextLength:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  const char *v21;

  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3, v4) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], a2, a3, v3, v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v21, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("IATextInputActionsSessionAction.m"), 161, CFSTR("Attempted to set insertedTextLength on an action of class %@, which does not support changing content"), v20);

  }
  self->_insertedTextLength = a3;
  v8 = a3 - objc_msgSend_removedTextLength(self, a2, a3, v3, v4);
  objc_msgSend_setLargestSingleInsertionLength_(self, v9, 0, v10, v11);
  objc_msgSend_setLargestSingleDeletionLength_(self, v12, 0, v13, v14);
  if (v8 < 1)
  {
    if (v8 < 0)
      objc_msgSend_setLargestSingleDeletionLength_(self, v15, -v8, v16, v17);
  }
  else
  {
    objc_msgSend_setLargestSingleInsertionLength_(self, v15, v8, v16, v17);
  }
}

- (void)setRemovedTextLength:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  const char *v21;

  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3, v4) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], a2, a3, v3, v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v21, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("IATextInputActionsSessionAction.m"), 182, CFSTR("Attempted to set removedTextLength on an action of class %@, which does not support changing content"), v20);

  }
  self->_removedTextLength = a3;
  v8 = objc_msgSend_insertedTextLength(self, a2, a3, v3, v4) - a3;
  objc_msgSend_setLargestSingleInsertionLength_(self, v9, 0, v10, v11);
  objc_msgSend_setLargestSingleDeletionLength_(self, v12, 0, v13, v14);
  if (v8 < 1)
  {
    if (v8 < 0)
      objc_msgSend_setLargestSingleDeletionLength_(self, v15, -v8, v16, v17);
  }
  else
  {
    objc_msgSend_setLargestSingleInsertionLength_(self, v15, v8, v16, v17);
  }
}

- (void)setInsertedTextLengthWithoutTracking:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  const char *v15;

  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3, v4) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v15, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("IATextInputActionsSessionAction.m"), 201, CFSTR("Attempted to set insertedTextLength on an action of class %@, which does not support changing content"), v14);

  }
  self->_insertedTextLength = a3;
}

- (void)setRemovedTextLengthWithoutTracking:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  const char *v15;

  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3, v4) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v15, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("IATextInputActionsSessionAction.m"), 209, CFSTR("Attempted to set removedTextLength on an action of class %@, which does not support changing content"), v14);

  }
  self->_removedTextLength = a3;
}

- (void)setInsertedEmojiCount:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  const char *v15;

  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3, v4) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v15, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("IATextInputActionsSessionAction.m"), 217, CFSTR("Attempted to set insertedEmojiCount on an action of class %@, which does not support changing content"), v14);

  }
  self->_insertedEmojiCount = a3;
}

- (void)setRemovedEmojiCount:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  const char *v15;

  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3, v4) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v15, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("IATextInputActionsSessionAction.m"), 225, CFSTR("Attempted to set removedEmojiCount on an action of class %@, which does not support changing content"), v14);

  }
  self->_removedEmojiCount = a3;
}

- (void)setInsertedPunctuationCount:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  const char *v15;

  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3, v4) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v15, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("IATextInputActionsSessionAction.m"), 233, CFSTR("Attempted to set insertedPunctuationCount on an action of class %@, which does not support changing content"), v14);

  }
  self->_insertedPunctuationCount = a3;
}

- (void)setRemovedPunctuationCount:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  const char *v15;

  if (a3 && (objc_msgSend_changedContent(self, a2, a3, v3, v4) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v15, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("IATextInputActionsSessionAction.m"), 241, CFSTR("Attempted to set removedPunctuationCount on an action of class %@, which does not support changing content"), v14);

  }
  self->_removedPunctuationCount = a3;
}

- (int64_t)netCharacterCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = objc_msgSend_insertedTextLength(self, a2, v2, v3, v4);
  return v6 - objc_msgSend_removedTextLength(self, v7, v8, v9, v10);
}

- (BOOL)isMergeableWith:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
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
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  char isEqualToString;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;

  v7 = a3;
  v12 = objc_msgSend_source(self, v8, v9, v10, v11);
  if (v12 != objc_msgSend_source(v7, v13, v14, v15, v16)
    || (v21 = objc_msgSend_flagOptions(self, v17, v18, v19, v20), v21 != objc_msgSend_flagOptions(v7, v22, v23, v24, v25))|| (v30 = objc_msgSend_textInputActionsType(self, v26, v27, v28, v29), v30 != objc_msgSend_textInputActionsType(v7, v31, v32, v33, v34)))
  {
    isEqualToString = 0;
    goto LABEL_9;
  }
  objc_msgSend_inputMode(self, v35, v36, v37, v38);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43
    || (objc_msgSend_inputMode(v7, v39, v40, v41, v42), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_inputMode(self, v39, v40, v41, v42);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputMode(v7, v44, v45, v46, v47);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v4, v48, (uint64_t)v5, v49, v50))
    {
      isEqualToString = 0;
LABEL_13:

      goto LABEL_14;
    }
    v51 = 1;
  }
  else
  {
    v51 = 0;
  }
  objc_msgSend_appBundleId(self, v39, v40, v41, v42);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appBundleId(v7, v55, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v54, v60, (uint64_t)v59, v61, v62);

  if (v51)
    goto LABEL_13;
LABEL_14:
  if (!v43)

LABEL_9:
  return isEqualToString;
}

- (_NSRange)relativeRangeBefore
{
  _NSRange *p_relativeRangeBefore;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_relativeRangeBefore = &self->_relativeRangeBefore;
  location = self->_relativeRangeBefore.location;
  length = p_relativeRangeBefore->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRelativeRangeBefore:(_NSRange)a3
{
  self->_relativeRangeBefore = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (int64_t)textInputActionsType
{
  return self->_textInputActionsType;
}

- (void)setTextInputActionsType:(int64_t)a3
{
  self->_textInputActionsType = a3;
}

- (unint64_t)insertedTextLength
{
  return self->_insertedTextLength;
}

- (unint64_t)insertedEmojiCount
{
  return self->_insertedEmojiCount;
}

- (unint64_t)insertedPunctuationCount
{
  return self->_insertedPunctuationCount;
}

- (unint64_t)removedTextLength
{
  return self->_removedTextLength;
}

- (unint64_t)removedEmojiCount
{
  return self->_removedEmojiCount;
}

- (unint64_t)removedPunctuationCount
{
  return self->_removedPunctuationCount;
}

- (int64_t)inputActionCountFromMergedActions
{
  return self->_inputActionCountFromMergedActions;
}

- (void)setInputActionCountFromMergedActions:(int64_t)a3
{
  self->_inputActionCountFromMergedActions = a3;
}

- (unint64_t)largestSingleInsertionLength
{
  return self->_largestSingleInsertionLength;
}

- (void)setLargestSingleInsertionLength:(unint64_t)a3
{
  self->_largestSingleInsertionLength = a3;
}

- (unint64_t)largestSingleDeletionLength
{
  return self->_largestSingleDeletionLength;
}

- (void)setLargestSingleDeletionLength:(unint64_t)a3
{
  self->_largestSingleDeletionLength = a3;
}

- (IATextInputActionsInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)processBundleId
{
  return self->_processBundleId;
}

- (void)setProcessBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int64_t)flagOptions
{
  return self->_flagOptions;
}

- (void)setFlagOptions:(int64_t)a3
{
  self->_flagOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processBundleId, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

- (IATextInputActionsSessionAction)initWithCoder:(id)a3
{
  id v4;
  IATextInputActionsSessionAction *v5;
  IATextInputActionsSessionAction *v6;
  _NSRange *p_relativeRangeBefore;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  IATextInputActionsInputMode *inputMode;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  NSString *processBundleId;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  objc_super v133;

  v4 = a3;
  v133.receiver = self;
  v133.super_class = (Class)IATextInputActionsSessionAction;
  v5 = -[IAXPCObject initWithCoder:](&v133, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    p_relativeRangeBefore = &v5->_relativeRangeBefore;
    v8 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, (uint64_t)CFSTR("relativeRangeBefore_location"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_unsignedLongValue(v11, v12, v13, v14, v15);
    v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("relativeRangeBefore_length"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_unsignedLongValue(v20, v21, v22, v23, v24);
    p_relativeRangeBefore->location = v16;
    v6->_relativeRangeBefore.length = v25;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("source"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_source = objc_msgSend_unsignedLongValue(v29, v30, v31, v32, v33);

    v34 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, (uint64_t)CFSTR("textInputActionsType"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_textInputActionsType = objc_msgSend_unsignedLongValue(v37, v38, v39, v40, v41);

    v42 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, (uint64_t)CFSTR("inputActionCountFromMergedActions"), v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_inputActionCountFromMergedActions = objc_msgSend_longValue(v45, v46, v47, v48, v49);

    v50 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, (uint64_t)CFSTR("inputMode"), v52);
    v53 = objc_claimAutoreleasedReturnValue();
    inputMode = v6->_inputMode;
    v6->_inputMode = (IATextInputActionsInputMode *)v53;

    v55 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v56, v55, (uint64_t)CFSTR("processBundleId"), v57);
    v58 = objc_claimAutoreleasedReturnValue();
    processBundleId = v6->_processBundleId;
    v6->_processBundleId = (NSString *)v58;

    v60 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v61, v60, (uint64_t)CFSTR("flagOptions"), v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_flagOptions = objc_msgSend_unsignedLongValue(v63, v64, v65, v66, v67);

    v68 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v68, (uint64_t)CFSTR("insertedTextLength"), v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_insertedTextLength = objc_msgSend_unsignedLongValue(v71, v72, v73, v74, v75);

    v76 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v77, v76, (uint64_t)CFSTR("insertedEmojiCount"), v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_insertedEmojiCount = objc_msgSend_unsignedLongValue(v79, v80, v81, v82, v83);

    v84 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v85, v84, (uint64_t)CFSTR("insertedPunctuationCount"), v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_insertedPunctuationCount = objc_msgSend_unsignedLongValue(v87, v88, v89, v90, v91);

    v92 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v93, v92, (uint64_t)CFSTR("removedTextLength"), v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_removedTextLength = objc_msgSend_unsignedLongValue(v95, v96, v97, v98, v99);

    v100 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v101, v100, (uint64_t)CFSTR("removedEmojiCount"), v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_removedEmojiCount = objc_msgSend_unsignedLongValue(v103, v104, v105, v106, v107);

    v108 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v109, v108, (uint64_t)CFSTR("removedPunctuationCount"), v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_removedPunctuationCount = objc_msgSend_unsignedLongValue(v111, v112, v113, v114, v115);

    v116 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v117, v116, (uint64_t)CFSTR("largestSingleInsertionLength"), v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_largestSingleInsertionLength = objc_msgSend_unsignedLongValue(v119, v120, v121, v122, v123);

    v124 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v125, v124, (uint64_t)CFSTR("largestSingleDeletionLength"), v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_largestSingleDeletionLength = objc_msgSend_unsignedLongValue(v127, v128, v129, v130, v131);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  objc_super v93;

  v93.receiver = self;
  v93.super_class = (Class)IATextInputActionsSessionAction;
  v4 = a3;
  -[IAXPCObject encodeWithCoder:](&v93, sel_encodeWithCoder_, v4);
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v5, self->_relativeRangeBefore.location, v6, v7, v93.receiver, v93.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, (uint64_t)CFSTR("relativeRangeBefore_location"), v10);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v11, self->_relativeRangeBefore.length, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("relativeRangeBefore_length"), v16);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v17, self->_source, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, (uint64_t)CFSTR("source"), v22);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v23, self->_textInputActionsType, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)v26, (uint64_t)CFSTR("textInputActionsType"), v28);

  objc_msgSend_numberWithLong_(MEMORY[0x24BDD16E0], v29, self->_inputActionCountFromMergedActions, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v33, (uint64_t)v32, (uint64_t)CFSTR("inputActionCountFromMergedActions"), v34);

  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)self->_inputMode, (uint64_t)CFSTR("inputMode"), v36);
  objc_msgSend_encodeObject_forKey_(v4, v37, (uint64_t)self->_processBundleId, (uint64_t)CFSTR("processBundleId"), v38);
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v39, self->_flagOptions, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v43, (uint64_t)v42, (uint64_t)CFSTR("flagOptions"), v44);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v45, self->_insertedTextLength, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v49, (uint64_t)v48, (uint64_t)CFSTR("insertedTextLength"), v50);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v51, self->_insertedEmojiCount, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v55, (uint64_t)v54, (uint64_t)CFSTR("insertedEmojiCount"), v56);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v57, self->_insertedPunctuationCount, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v61, (uint64_t)v60, (uint64_t)CFSTR("insertedPunctuationCount"), v62);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v63, self->_removedTextLength, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v67, (uint64_t)v66, (uint64_t)CFSTR("removedTextLength"), v68);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v69, self->_removedEmojiCount, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v73, (uint64_t)v72, (uint64_t)CFSTR("removedEmojiCount"), v74);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v75, self->_removedPunctuationCount, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v79, (uint64_t)v78, (uint64_t)CFSTR("removedPunctuationCount"), v80);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v81, self->_largestSingleInsertionLength, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v85, (uint64_t)v84, (uint64_t)CFSTR("largestSingleInsertionLength"), v86);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v87, self->_largestSingleDeletionLength, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v91, (uint64_t)v90, (uint64_t)CFSTR("largestSingleDeletionLength"), v92);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

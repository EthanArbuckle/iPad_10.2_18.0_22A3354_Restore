@implementation CHContextualTextResult

- (CHContextualTextResult)initWithTextResult:(id)a3 terminatingSpecialCharacter:(id)a4 strokeGroup:(id)a5
{
  id v9;
  id v10;
  id v11;
  CHContextualTextResult *v12;
  CHContextualTextResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CHContextualTextResult;
  v12 = -[CHContextualTextResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_textResult, a3);
    objc_storeStrong((id *)&v13->_terminatingSpecialCharacter, a4);
    objc_storeStrong((id *)&v13->_strokeGroup, a5);
  }

  return v13;
}

+ (id)defaultWordTerminationCharacterForLocale:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int shouldApplyLatinSpacingForLocale;
  __CFString *v7;

  shouldApplyLatinSpacingForLocale = objc_msgSend_shouldApplyLatinSpacingForLocale_(CHRecognizerConfiguration, a2, (uint64_t)a3, v3, v4, v5);
  v7 = &stru_1E77F6F28;
  if (shouldApplyLatinSpacingForLocale)
    v7 = CFSTR(" ");
  return v7;
}

- (BOOL)isNonTextCandidateForContextLookup
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
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char isSingleTokenResult;
  char v32;
  const char *v33;
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
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  id v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  char isGibberish;
  char v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  BOOL v99;
  char v100;
  char v101;
  BOOL v102;
  char v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  objc_msgSend_textResult(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topTranscription(v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend_length(v13, v14, v15, v16, v17, v18);
  if (qword_1EF568368 != -1)
    dispatch_once(&qword_1EF568368, &unk_1E77F1A10);
  objc_msgSend_textResult(self, v19, v20, v21, v22, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  isSingleTokenResult = objc_msgSend_isSingleTokenResult(v25, v26, v27, v28, v29, v30);
  if (v24 < 2)
    v32 = isSingleTokenResult;
  else
    v32 = 0;

  objc_msgSend_firstMatchInString_options_range_((void *)qword_1EF568360, v33, (uint64_t)v13, 0, 0, v24);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_textResult(self, v35, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textResult(self, v41, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v46, v47, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v52, v53, v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokensFromTranscriptionPath_characterRange_(v40, v59, (uint64_t)v58, 0, v24, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v62 = v61;
  v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v105, (uint64_t)v109, 16, v64);
  if (v65)
  {
    v71 = v65;
    v72 = *(_QWORD *)v106;
LABEL_8:
    v73 = 0;
    while (1)
    {
      if (*(_QWORD *)v106 != v72)
        objc_enumerationMutation(v62);
      v74 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * v73);
      v104 = 0;
      objc_msgSend_textResult(self, v66, v67, v68, v69, v70);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      isGibberish = objc_msgSend_shouldFilterOutStringForToken_isGibberish_(v75, v76, v74, (uint64_t)&v104, v77, v78);

      v80 = 1;
      if (v104 || (isGibberish & 1) != 0)
        break;
      if (v71 == ++v73)
      {
        v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v66, (uint64_t)&v105, (uint64_t)v109, 16, v70);
        if (v71)
          goto LABEL_8;
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    v80 = 0;
  }

  objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v81, (uint64_t)CFSTR("0"), v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v13, v86, (uint64_t)v85, -1, v87, v88);

  if (v89 < 1)
  {
    v99 = 0;
  }
  else
  {
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v90, (uint64_t)CFSTR("0123456789"), v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v13, v95, (uint64_t)v94, -1, v96, v97);

    v99 = v98 == v89;
  }
  if (v34)
    v100 = 1;
  else
    v100 = v32;
  v101 = v80 | v99;
  if ((v100 & 1) != 0)
    v102 = 1;
  else
    v102 = v101;

  return v102;
}

- (BOOL)isNonTextCandidateForContextLookupByNonTextStrokesBounds:(id)a3 strokeClassificationResult:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
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
  float v67;
  double v68;
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
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  double v99;
  double v100;
  double v101;
  double v102;
  id v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  double width;
  double height;
  CHContextualTextResult *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  _BYTE v133[128];
  uint64_t v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;

  v134 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_textResult(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputStrokeIdentifiers(v13, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend_count(v19, v20, v21, v22, v23, v24);
  if (v25)
  {
    v120 = self;
    v121 = v25;
    v122 = v19;
    v123 = v6;
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    v26 = v19;
    v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v128, (uint64_t)v133, 16, v28);
    if (v29)
    {
      v35 = v29;
      v36 = 0;
      v37 = *(_QWORD *)v129;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v129 != v37)
            objc_enumerationMutation(v26);
          v39 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * i);
          objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(v7, v30, v31, v32, v33, v34, v120);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v40, v41, v39, v42, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45)
          {
            objc_msgSend_orderedScriptClassification(v45, v46, v47, v48, v49, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend_indexOfObject_(v51, v52, (uint64_t)&unk_1E78292A0, v53, v54, v55);

            objc_msgSend_scriptProbabilityAtIndex_(v45, v57, 0, v58, v59, v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_floatValue(v61, v62, v63, v64, v65, v66);
            v68 = v67;

            objc_msgSend_orderedScriptClassification(v45, v69, v70, v71, v72, v73);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = objc_msgSend_indexOfObject_(v74, v75, (uint64_t)&unk_1E78292B8, v76, v77, v78);

            LODWORD(v82) = v79 < 3 && v56 < 3 || v56 < 2;
            if (v68 >= 0.9)
              LODWORD(v82) = 0;
            if (v56)
              v82 = v82;
            else
              v82 = 1;
            v36 += v82;
          }

        }
        v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v30, (uint64_t)&v128, (uint64_t)v133, 16, v34);
      }
      while (v35);
    }
    else
    {
      v36 = 0;
    }

    if (v36 / v121 < 1)
    {
      LOBYTE(v83) = 0;
      v19 = v122;
      v6 = v123;
    }
    else
    {
      objc_msgSend_strokeGroup(v120, v84, v85, v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bounds(v89, v90, v91, v92, v93, v94);
      v96 = v95;
      v98 = v97;
      v100 = v99;
      v102 = v101;

      v126 = 0u;
      v127 = 0u;
      v124 = 0u;
      v125 = 0u;
      v6 = v123;
      v103 = v123;
      v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v104, (uint64_t)&v124, (uint64_t)v132, 16, v105);
      v19 = v122;
      if (v83)
      {
        v111 = *(_QWORD *)v125;
LABEL_31:
        v112 = 0;
        while (1)
        {
          if (*(_QWORD *)v125 != v111)
            objc_enumerationMutation(v103);
          objc_msgSend_ch_CGRectValue(*(void **)(*((_QWORD *)&v124 + 1) + 8 * v112), v106, v107, v108, v109, v110, v120);
          v137.origin.x = v113;
          v137.origin.y = v114;
          v137.size.width = v115;
          v137.size.height = v116;
          v135.origin.x = v96;
          v135.origin.y = v98;
          v135.size.width = v100;
          v135.size.height = v102;
          v136 = CGRectIntersection(v135, v137);
          width = v136.size.width;
          height = v136.size.height;
          if (!CGRectIsNull(v136) && width * height / (v100 * v102) > 0.2)
            break;
          if (v83 == ++v112)
          {
            v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v106, (uint64_t)&v124, (uint64_t)v132, 16, v110);
            if (!v83)
              goto LABEL_38;
            goto LABEL_31;
          }
        }
        LOBYTE(v83) = 1;
      }
LABEL_38:

    }
  }
  else
  {
    LOBYTE(v83) = 0;
  }

  return v83;
}

- (CHTokenizedTextResult)textResult
{
  return self->_textResult;
}

- (void)setTextResult:(id)a3
{
  objc_storeStrong((id *)&self->_textResult, a3);
}

- (CHStrokeGroup)strokeGroup
{
  return self->_strokeGroup;
}

- (void)setStrokeGroup:(id)a3
{
  objc_storeStrong((id *)&self->_strokeGroup, a3);
}

- (NSString)terminatingSpecialCharacter
{
  return self->_terminatingSpecialCharacter;
}

- (void)setTerminatingSpecialCharacter:(id)a3
{
  objc_storeStrong((id *)&self->_terminatingSpecialCharacter, a3);
}

- (CHStrokeGroupRecognitionResult)strokeGroupResult
{
  return self->_strokeGroupResult;
}

- (void)setStrokeGroupResult:(id)a3
{
  objc_storeStrong((id *)&self->_strokeGroupResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminatingSpecialCharacter, 0);
  objc_storeStrong((id *)&self->_strokeGroup, 0);
  objc_storeStrong((id *)&self->_textResult, 0);
  objc_storeStrong((id *)&self->_strokeGroupResult, 0);
}

@end

@implementation CHContextualTextResults

- (CHContextualTextResults)initWithTextResults:(id)a3
{
  id v5;
  CHContextualTextResults *v6;
  CHContextualTextResults *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHContextualTextResults;
  v6 = -[CHContextualTextResults init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_textResults, a3);

  return v7;
}

- (id)topTranscription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  NSArray *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
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
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v8 = self->_textResults;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v65, (uint64_t)v69, 16, v10);
  if (v11)
  {
    v17 = v11;
    v18 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v66 != v18)
          objc_enumerationMutation(v8);
        v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend_textResult(v20, v12, v13, v14, v15, v16, (_QWORD)v65);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_precedingSeparatorForTopTranscriptionPath(v21, v22, v23, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v7, v28, (uint64_t)v27, v29, v30, v31);

        objc_msgSend_textResult(v20, v32, v33, v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_topTranscription(v37, v38, v39, v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_appendString_(v7, v44, (uint64_t)v43, v45, v46, v47);
        objc_msgSend_terminatingSpecialCharacter(v20, v48, v49, v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          objc_msgSend_terminatingSpecialCharacter(v20, v54, v55, v56, v57, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendString_(v7, v60, (uint64_t)v59, v61, v62, v63);

        }
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, (uint64_t)&v65, (uint64_t)v69, 16, v16);
    }
    while (v17);
  }

  return v7;
}

- (id)rawTranscription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  NSArray *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
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
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v8 = self->_textResults;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v65, (uint64_t)v69, 16, v10);
  if (v11)
  {
    v17 = v11;
    v18 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v66 != v18)
          objc_enumerationMutation(v8);
        v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend_textResult(v20, v12, v13, v14, v15, v16, (_QWORD)v65);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_precedingSeparatorForRawTranscriptionPath(v21, v22, v23, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v7, v28, (uint64_t)v27, v29, v30, v31);

        objc_msgSend_textResult(v20, v32, v33, v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_rawTranscription(v37, v38, v39, v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_appendString_(v7, v44, (uint64_t)v43, v45, v46, v47);
        objc_msgSend_terminatingSpecialCharacter(v20, v48, v49, v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          objc_msgSend_terminatingSpecialCharacter(v20, v54, v55, v56, v57, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendString_(v7, v60, (uint64_t)v59, v61, v62, v63);

        }
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, (uint64_t)&v65, (uint64_t)v69, 16, v16);
    }
    while (v17);
  }

  return v7;
}

- (void)enumerateGroupsCoveredByStringRange:(_NSRange)a3 block:(id)a4
{
  NSUInteger location;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
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
  NSUInteger v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSRange v63;
  void *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t i;
  void *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
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
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  NSUInteger v132;
  uint64_t v133;
  NSUInteger v134;
  uint64_t v135;
  void (**v136)(id, void *, void *, void *);
  NSArray *obj;
  void *v138;
  uint64_t v139;
  NSUInteger v140;
  NSUInteger range1;
  void *v142;
  NSUInteger v143;
  void *v144;
  id v145;
  void *v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  _BYTE v155[128];
  _BYTE v156[128];
  uint64_t v157;
  NSRange v158;
  NSRange v159;

  range1 = a3.length;
  location = a3.location;
  v157 = *MEMORY[0x1E0C80C00];
  v136 = (void (**)(id, void *, void *, void *))a4;
  v151 = 0u;
  v152 = 0u;
  v153 = 0u;
  v154 = 0u;
  obj = self->_textResults;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v151, (uint64_t)v156, 16, v7);
  if (v8)
  {
    v14 = v8;
    v15 = 0;
    v16 = *(_QWORD *)v152;
    v17 = location + range1;
    v133 = *(_QWORD *)v152;
    v134 = location;
    v132 = location + range1;
LABEL_3:
    v18 = 0;
    v135 = v14;
    while (1)
    {
      if (*(_QWORD *)v152 != v16)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * v18);
      objc_msgSend_textResult(v19, v9, v10, v11, v12, v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rawTranscriptionPath(v20, v21, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_textResult(v19, v27, v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend_length(v26, v33, v34, v35, v36, v37);
      objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v32, v39, (uint64_t)v26, 0, v38, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v144 = v40;
      v46 = objc_msgSend_length(v40, v41, v42, v43, v44, v45);
      objc_msgSend_terminatingSpecialCharacter(v19, v47, v48, v49, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend_length(v52, v53, v54, v55, v56, v57) + v46;

      v158.location = location;
      v158.length = range1;
      v159.location = v15;
      v143 = v58;
      v159.length = v58;
      v63 = NSIntersectionRange(v158, v159);
      if (v63.length)
      {
        objc_msgSend_textResult(v19, (const char *)v63.length, v59, v60, v61, v62);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (uint64_t)v26;
        v66 = v64;
        v142 = (void *)v65;
        objc_msgSend_tokensFromTranscriptionPath_characterRange_(v64, v67, v65, v63.location - v15, v63.length, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_strokeGroupResult(v19, v70, v71, v72, v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (v75)
        {
          v81 = v19;
          v139 = v18;
          v140 = v15;
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v76, v77, v78, v79, v80);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v82, v83, v84, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v147 = 0u;
          v148 = 0u;
          v149 = 0u;
          v150 = 0u;
          v138 = v69;
          v145 = v69;
          v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v145, v88, (uint64_t)&v147, (uint64_t)v155, 16, v89);
          if (v90)
          {
            v96 = v90;
            v97 = *(_QWORD *)v148;
            do
            {
              for (i = 0; i != v96; ++i)
              {
                if (*(_QWORD *)v148 != v97)
                  objc_enumerationMutation(v145);
                v99 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * i);
                objc_msgSend_strokeGroupResult(v81, v91, v92, v93, v94, v95);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_inputStrokeIdentifiers(v100, v101, v102, v103, v104, v105);
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_strokeIndexes(v99, v107, v108, v109, v110, v111);
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectsAtIndexes_(v106, v113, (uint64_t)v112, v114, v115, v116);
                v117 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_addObject_(v87, v118, (uint64_t)v117, v119, v120, v121);
                objc_msgSend_addObject_(v146, v122, (uint64_t)v99, v123, v124, v125);

              }
              v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v145, v91, (uint64_t)&v147, (uint64_t)v155, 16, v95);
            }
            while (v96);
          }

          objc_msgSend_strokeGroup(v81, v126, v127, v128, v129, v130);
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v136[2](v136, v131, v146, v87);

          v16 = v133;
          location = v134;
          v18 = v139;
          v15 = v140;
          v14 = v135;
          v17 = v132;
          v69 = v138;
        }

        v26 = v142;
      }
      v15 += v143;

      if (v15 >= v17)
        break;
      if (++v18 == v14)
      {
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v151, (uint64_t)v156, 16, v13);
        if (v14)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)textResultToIndexMappingFromTopTranscriptionWithCharacterRange:(_NSRange)a3 intersectionRanges:(id *)a4
{
  uint64_t v4;
  const char *v6;
  uint64_t v7;
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
  NSUInteger v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSUInteger v49;
  NSRange v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
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
  void *v96;
  id v97;
  CHContextualTextResults *v98;
  NSRange v100;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, a3.location, a3.length, (uint64_t)a4, v4);
  v97 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v6, v7, v8, v9, v10);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(self->_textResults, v11, v12, v13, v14, v15))
  {
    v20 = 0;
    v21 = 0;
    v98 = self;
    objc_msgSend_objectAtIndexedSubscript_(self->_textResults, v16, 0, v17, v18, v19);
    while (1)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_textResult(v31, v32, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_topTranscription(v37, v38, v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_length(v43, v44, v45, v46, v47, v48);

      v100.location = v20;
      v100.length = v49;
      v50 = NSIntersectionRange(a3, v100);
      objc_msgSend_topTranscription(v37, (const char *)v50.length, v51, v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend_length(v55, v56, v57, v58, v59, v60);
      objc_msgSend_terminatingSpecialCharacter(v31, v62, v63, v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend_length(v67, v68, v69, v70, v71, v72);

      if (v50.length)
      {
        objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v74, v21, v75, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v97, v79, (uint64_t)v78, (uint64_t)v37, v80, v81);

        objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v82, v50.location - v20, v50.length, v83, v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v86, v21, v87, v88, v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v96, v91, (uint64_t)v85, (uint64_t)v90, v92, v93);

      }
      v20 += v61 + v73;

      if (++v21 >= (unint64_t)objc_msgSend_count(v98->_textResults, v22, v23, v24, v25, v26))
        break;
      objc_msgSend_objectAtIndexedSubscript_(v98->_textResults, v27, v21, v28, v29, v30);
    }
  }
  if (a4)
    *a4 = objc_retainAutorelease(v96);

  return v97;
}

- (NSArray)textResults
{
  return self->_textResults;
}

- (void)setTextResults:(id)a3
{
  objc_storeStrong((id *)&self->_textResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textResults, 0);
}

@end

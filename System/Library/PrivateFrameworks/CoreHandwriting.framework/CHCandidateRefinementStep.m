@implementation CHCandidateRefinementStep

- (CHCandidateRefinementStep)initWithShouldKeepOutOfPatternCandidates:(BOOL)a3 shouldKeepDuplicateTokenIDs:(BOOL)a4 shouldKeepOutOfLexiconAlternatives:(BOOL)a5 shouldKeepAlternativeLengths:(BOOL)a6 shouldKeepSubstrings:(BOOL)a7 shouldKeepOriginalSpelling:(BOOL)a8
{
  CHCandidateRefinementStep *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CHCandidateRefinementStep;
  result = -[CHCandidateRefinementStep init](&v15, sel_init);
  if (result)
  {
    result->_shouldKeepOutOfPatternCandidates = a3;
    result->_shouldKeepDuplicateTokenIDs = a4;
    result->_shouldKeepOutOfLexiconAlternatives = a5;
    result->_shouldKeepAlternativeLengths = a6;
    result->_shouldKeepSubstrings = a7;
    result->_shouldKeepOriginalSpelling = a8;
  }
  return result;
}

- (id)process:(id)a3 options:(id)a4
{
  id *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
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
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
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
  uint64_t v64;
  uint64_t v65;
  id v66;
  const char *v67;
  const char *v68;
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
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  id v95;
  id obj;
  void *v97;
  _QWORD v98[4];
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t buf[16];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v95 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v7 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_DEBUG, "CHCandidateRefinementStep is running", buf, 2u);
  }

  objc_msgSend_result(v6, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filterCandidatesWithOutOfPattern_duplicateTokenIDs_keepOutOfLexiconAlternatives_keepAlternativeLengths_keepSubstrings_shouldKeepOriginalSpelling_(v13, v14, self->_shouldKeepOutOfPatternCandidates, self->_shouldKeepDuplicateTokenIDs, self->_shouldKeepOutOfLexiconAlternatives, self->_shouldKeepAlternativeLengths, self->_shouldKeepSubstrings, self->_shouldKeepOriginalSpelling);

  v15 = (void *)objc_opt_class();
  if (objc_msgSend_shouldAdjustColumnsFromPostprocessingStepOptions_(v15, v16, (uint64_t)v95, v17, v18, v19))
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v20, v21, v22, v23, v24);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    objc_msgSend_result(v6, v25, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v30, v31, v32, v33, v34, v35);
    obj = (id)objc_claimAutoreleasedReturnValue();

    v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v100, (uint64_t)v105, 16, v37);
    if (v43)
    {
      v44 = *(_QWORD *)v101;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v101 != v44)
            objc_enumerationMutation(obj);
          v46 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * i);
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v38, v39, v40, v41, v42, v95);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_result(v6, v48, v49, v50, v51, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_result(v6, v54, v55, v56, v57, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend_tokenColumnCount(v59, v60, v61, v62, v63, v64);
          v98[0] = MEMORY[0x1E0C809B0];
          v98[1] = 3221225472;
          v98[2] = sub_1BE8AFDF8;
          v98[3] = &unk_1E77F4928;
          v66 = v47;
          v99 = v66;
          objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v53, v67, v46, 0, v65, (uint64_t)v98);

          objc_msgSend_addObject_(v97, v68, (uint64_t)v66, v69, v70, v71);
        }
        v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v100, (uint64_t)v105, 16, v42);
      }
      while (v43);
    }

    objc_msgSend_result(v6, v72, v73, v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v6, v78, v79, v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(v83, v84, v85, v86, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v77, v90, (uint64_t)v97, (uint64_t)v89, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_storeStrong(v6 + 3, v93);

  }
  return v6;
}

@end

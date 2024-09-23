@implementation CHTokenizedTextResult

- (CHTokenizedTextResult)init
{
  return (CHTokenizedTextResult *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(self, a2, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], (uint64_t)CFSTR(" "), 1, 0);
}

- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7 changeableColumnCount:(int64_t)a8 isMinimalDrawingResult:(BOOL)a9 baseWritingDirection:(int)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CHTokenizedTextResult *v47;
  uint64_t v48;
  NSArray *tokenColumns;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSArray *transcriptionPaths;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSArray *transcriptionPathScores;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSString *trailingSeparator;
  objc_super v72;
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v77 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v25 = objc_msgSend_count(v17, v20, v21, v22, v23, v24);
  if (v25 != objc_msgSend_count(v18, v26, v27, v28, v29, v30))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v31 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      v74 = objc_msgSend_count(v17, v32, v33, v34, v35, v36);
      v75 = 2048;
      v76 = objc_msgSend_count(v18, v37, v38, v39, v40, v41);
      _os_log_impl(&dword_1BE607000, v31, OS_LOG_TYPE_FAULT, "transcriptionPaths count (%ld) != scores count (%ld)", buf, 0x16u);
    }

  }
  v72.receiver = self;
  v72.super_class = (Class)CHTokenizedTextResult;
  v47 = -[CHTokenizedResult initWithIsMinimalDrawingResult:](&v72, sel_initWithIsMinimalDrawingResult_, a9);
  if (v47)
  {
    v48 = objc_msgSend_copy(v16, v42, v43, v44, v45, v46);
    tokenColumns = v47->_tokenColumns;
    v47->_tokenColumns = (NSArray *)v48;

    v55 = objc_msgSend_copy(v17, v50, v51, v52, v53, v54);
    transcriptionPaths = v47->_transcriptionPaths;
    v47->_transcriptionPaths = (NSArray *)v55;

    v62 = objc_msgSend_copy(v18, v57, v58, v59, v60, v61);
    transcriptionPathScores = v47->_transcriptionPathScores;
    v47->_transcriptionPathScores = (NSArray *)v62;

    v47->_recognizerGenerationIdentifier = a7;
    v47->_changeableCount = a8;
    v69 = objc_msgSend_copy(v19, v64, v65, v66, v67, v68);
    trailingSeparator = v47->_trailingSeparator;
    v47->_trailingSeparator = (NSString *)v69;

    *(_QWORD *)&v47->_baseWritingDirection = v78;
  }

  return v47;
}

- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7 changeableColumnCount:(int64_t)a8
{
  char v9;

  v9 = 0;
  return (CHTokenizedTextResult *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_isMinimalDrawingResult_baseWritingDirection_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8, v9, 0);
}

- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  const char *v22;
  CHTokenizedTextResult *v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v21 = objc_msgSend_count(v12, v16, v17, v18, v19, v20) != 0;
  v23 = (CHTokenizedTextResult *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(self, v22, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, a7, v21);

  return v23;
}

- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 recognizerGenerationIdentifier:(int64_t)a6
{
  return (CHTokenizedTextResult *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)CFSTR(" "), a6);
}

- (CHTokenizedTextResult)initWithTokenColumns:(id)a3 transcriptionPaths:(id)a4 scores:(id)a5 recognizerGenerationIdentifier:(int64_t)a6 isMinimalDrawingResult:(BOOL)a7 baseWritingDirection:(int)a8
{
  uint64_t v8;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  const char *v23;
  CHTokenizedTextResult *isMinimalDrawingResult_baseWritingDirection;
  BOOL v26;

  v8 = *(_QWORD *)&a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v22 = objc_msgSend_count(v14, v17, v18, v19, v20, v21) != 0;
  v26 = a7;
  isMinimalDrawingResult_baseWritingDirection = (CHTokenizedTextResult *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_isMinimalDrawingResult_baseWritingDirection_(self, v23, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16, (uint64_t)CFSTR(" "), a6, v22, v26, v8);

  return isMinimalDrawingResult_baseWritingDirection;
}

- (CHTokenizedTextResult)initWithBestPathTokens:(id)a3 pathProbabilities:(id)a4 trailingSeparator:(id)a5 recognizerGenerationIdentifier:(int64_t)a6
{
  return (CHTokenizedTextResult *)objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, -1);
}

- (CHTokenizedTextResult)initWithBestPathTokens:(id)a3 pathProbabilities:(id)a4 trailingSeparator:(id)a5 recognizerGenerationIdentifier:(int64_t)a6 changeableColumnCount:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CHTokenizedTextResult *v29;
  id v31;
  id v32;
  id v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v32 = 0;
  v33 = 0;
  v31 = 0;
  sub_1BE73B600((uint64_t)CHTokenizedTextResult, v12, v13, &v33, &v32, &v31);
  v15 = v33;
  v16 = v32;
  v22 = v31;
  if (a7 < 1)
  {
    v28 = objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_(self, v17, (uint64_t)v15, (uint64_t)v16, (uint64_t)v22, (uint64_t)v14, a6);
  }
  else
  {
    if (objc_msgSend_count(v15, v17, v18, v19, v20, v21) <= (unint64_t)a7)
      a7 = objc_msgSend_count(v15, v23, v24, v25, v26, v27);
    v28 = objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(self, v23, (uint64_t)v15, (uint64_t)v16, (uint64_t)v22, (uint64_t)v14, a6, a7);
  }
  v29 = (CHTokenizedTextResult *)v28;

  return v29;
}

- (id)modifiedResultWithBestPathTokens:(id)a3 pathProbabilities:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
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
  uint64_t v25;
  id v26;
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
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char isMinimalDrawingResult;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  void *isMinimalDrawingResult_baseWritingDirection;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v62;
  id v63;
  id v64;
  id v65;

  v64 = 0;
  v65 = 0;
  v63 = 0;
  sub_1BE73B600((uint64_t)CHTokenizedTextResult, a3, a4, &v65, &v64, &v63);
  v5 = v65;
  v6 = v64;
  v7 = v63;
  v13 = objc_msgSend_changeableTokenColumnCount(self, v8, v9, v10, v11, v12);
  if (v13 >= objc_msgSend_count(v5, v14, v15, v16, v17, v18))
    v24 = objc_msgSend_count(v5, v19, v20, v21, v22, v23);
  else
    v24 = objc_msgSend_changeableTokenColumnCount(self, v19, v20, v21, v22, v23);
  v25 = v24;
  v26 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_trailingSeparator(self, v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_recognizerGenerationIdentifier(self, v33, v34, v35, v36, v37);
  isMinimalDrawingResult = objc_msgSend_isMinimalDrawingResult(self, v39, v40, v41, v42, v43);
  v50 = objc_msgSend_baseWritingDirection(self, v45, v46, v47, v48, v49);
  v62 = isMinimalDrawingResult;
  isMinimalDrawingResult_baseWritingDirection = (void *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_isMinimalDrawingResult_baseWritingDirection_(v26, v51, (uint64_t)v5, (uint64_t)v6, (uint64_t)v7, (uint64_t)v32, v38, v25, v62, v50);

  objc_msgSend_setInputStrokeIdentifiers_(isMinimalDrawingResult_baseWritingDirection, v53, (uint64_t)self->_inputStrokeIdentifiers, v54, v55, v56);
  objc_msgSend_setLocale_(isMinimalDrawingResult_baseWritingDirection, v57, (uint64_t)self->_locale, v58, v59, v60);

  return isMinimalDrawingResult_baseWritingDirection;
}

- (CHTokenizedTextResult)initWithCoder:(id)a3
{
  id v4;
  CHTokenizedTextResult *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *tokenColumns;
  void *v24;
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
  NSArray *transcriptionPaths;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSArray *transcriptionPathScores;
  const char *v50;
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
  NSString *trailingSeparator;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
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
  uint64_t v85;
  NSArray *inputStrokeIdentifiers;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSLocale *locale;
  NSArray *v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t i;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  BOOL v110;
  char v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSArray *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char v124;
  NSObject *v125;
  uint8_t buf[16];
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  objc_super v132;
  _BYTE v133[128];
  _QWORD v134[4];

  v134[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v132.receiver = self;
  v132.super_class = (Class)CHTokenizedTextResult;
  v5 = -[CHTokenizedResult initWithCoder:](&v132, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3710];
    v7 = objc_opt_class();
    objc_msgSend_setClass_forClassName_(v6, v8, v7, (uint64_t)CFSTR("CHTokenizedTextResultColumn"), v9, v10);
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend_setWithObjects_(v11, v14, v12, v15, v16, v17, v13, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, (uint64_t)CFSTR("tokenColumns"), v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    tokenColumns = v5->_tokenColumns;
    v5->_tokenColumns = (NSArray *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend_setWithObjects_(v24, v27, v25, v28, v29, v30, v26, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v32, (uint64_t)v31, (uint64_t)CFSTR("transcriptionPaths"), v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    transcriptionPaths = v5->_transcriptionPaths;
    v5->_transcriptionPaths = (NSArray *)v35;

    v37 = (void *)MEMORY[0x1E0C99E60];
    v38 = objc_opt_class();
    v39 = objc_opt_class();
    objc_msgSend_setWithObjects_(v37, v40, v38, v41, v42, v43, v39, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v45, (uint64_t)v44, (uint64_t)CFSTR("transcriptionPathScores"), v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    transcriptionPathScores = v5->_transcriptionPathScores;
    v5->_transcriptionPathScores = (NSArray *)v48;

    v5->_recognizerGenerationIdentifier = objc_msgSend_decodeIntegerForKey_(v4, v50, (uint64_t)CFSTR("recognizerGenerationIdentifier"), v51, v52, v53);
    v5->_changeableCount = objc_msgSend_decodeIntegerForKey_(v4, v54, (uint64_t)CFSTR("changeableTokenColumns"), v55, v56, v57);
    v58 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v59, v58, (uint64_t)CFSTR("trailingSeparator"), v60, v61);
    v62 = objc_claimAutoreleasedReturnValue();
    trailingSeparator = v5->_trailingSeparator;
    v5->_trailingSeparator = (NSString *)v62;

    *(_QWORD *)&v5->_baseWritingDirection = objc_msgSend_decodeIntegerForKey_(v4, v64, (uint64_t)CFSTR("baseWritingDirection"), v65, v66, v67);
    v5->_precedingLineBreaks = objc_msgSend_decodeIntegerForKey_(v4, v68, (uint64_t)CFSTR("precedingLineBreaks"), v69, v70, v71);
    v72 = (void *)MEMORY[0x1E0C99E60];
    v134[0] = objc_opt_class();
    v134[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v73, (uint64_t)v134, 2, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v72, v77, (uint64_t)v76, v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v82, (uint64_t)v81, (uint64_t)CFSTR("inputStrokeIdentifiers"), v83, v84);
    v85 = objc_claimAutoreleasedReturnValue();
    inputStrokeIdentifiers = v5->_inputStrokeIdentifiers;
    v5->_inputStrokeIdentifiers = (NSArray *)v85;

    v87 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v88, v87, (uint64_t)CFSTR("locale"), v89, v90);
    v91 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v91;

    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    v93 = v5->_tokenColumns;
    v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v94, (uint64_t)&v128, (uint64_t)v133, 16, v95);
    if (v101)
    {
      v102 = *(_QWORD *)v129;
      while (2)
      {
        for (i = 0; i != v101; ++i)
        {
          if (*(_QWORD *)v129 != v102)
            objc_enumerationMutation(v93);
          objc_msgSend_tokenRows(*(void **)(*((_QWORD *)&v128 + 1) + 8 * i), v96, v97, v98, v99, v100);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = objc_msgSend_count(v104, v105, v106, v107, v108, v109) == 0;

          if (v110)
          {
            v111 = 0;
            goto LABEL_12;
          }
        }
        v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(v93, v96, (uint64_t)&v128, (uint64_t)v133, 16, v100);
        if (v101)
          continue;
        break;
      }
    }
    v111 = 1;
LABEL_12:

    if (!v5->_tokenColumns
      || (v117 = v5->_transcriptionPaths) == 0
      || !v5->_transcriptionPathScores
      || ((v118 = objc_msgSend_count(v117, v112, v113, v114, v115, v116),
           v118 == objc_msgSend_count(v5->_transcriptionPathScores, v119, v120, v121, v122, v123))
        ? (v124 = v111)
        : (v124 = 0),
          (v124 & 1) == 0))
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v125 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v125, OS_LOG_TYPE_ERROR, "CHTokenizedTextResult decoding failed. Token columns, transcription paths, and scores are required to be nonnull and equal in size when constructing a text result", buf, 2u);
      }

      v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CHTokenizedTextResult;
  -[CHTokenizedResult encodeWithCoder:](&v35, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_tokenColumns, (uint64_t)CFSTR("tokenColumns"), v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_transcriptionPaths, (uint64_t)CFSTR("transcriptionPaths"), v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)self->_transcriptionPathScores, (uint64_t)CFSTR("transcriptionPathScores"), v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)self->_trailingSeparator, (uint64_t)CFSTR("trailingSeparator"), v15, v16);
  objc_msgSend_encodeInteger_forKey_(v4, v17, self->_recognizerGenerationIdentifier, (uint64_t)CFSTR("recognizerGenerationIdentifier"), v18, v19);
  objc_msgSend_encodeInteger_forKey_(v4, v20, self->_precedingLineBreaks, (uint64_t)CFSTR("precedingLineBreaks"), v21, v22);
  objc_msgSend_encodeInteger_forKey_(v4, v23, self->_changeableCount, (uint64_t)CFSTR("changeableTokenColumns"), v24, v25);
  objc_msgSend_encodeInteger_forKey_(v4, v26, *(_QWORD *)&self->_baseWritingDirection, (uint64_t)CFSTR("baseWritingDirection"), v27, v28);
  objc_msgSend_encodeObject_forKey_(v4, v29, (uint64_t)self->_inputStrokeIdentifiers, (uint64_t)CFSTR("inputStrokeIdentifiers"), v30, v31);
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)self->_locale, (uint64_t)CFSTR("locale"), v33, v34);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CHMutableTokenizedTextResult *v4;
  NSArray *tokenColumns;
  NSArray *transcriptionPaths;
  NSArray *transcriptionPathScores;
  NSString *trailingSeparator;
  int64_t recognizerGenerationIdentifier;
  int64_t changeableCount;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *isMinimalDrawingResult_baseWritingDirection;
  const char *v18;
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
  char isMinimalDrawingResult;

  v4 = [CHMutableTokenizedTextResult alloc];
  tokenColumns = self->_tokenColumns;
  transcriptionPaths = self->_transcriptionPaths;
  transcriptionPathScores = self->_transcriptionPathScores;
  trailingSeparator = self->_trailingSeparator;
  recognizerGenerationIdentifier = self->_recognizerGenerationIdentifier;
  changeableCount = self->_changeableCount;
  isMinimalDrawingResult = objc_msgSend_isMinimalDrawingResult(self, v11, v12, v13, v14, v15);
  isMinimalDrawingResult_baseWritingDirection = (void *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_isMinimalDrawingResult_baseWritingDirection_(v4, v16, (uint64_t)tokenColumns, (uint64_t)transcriptionPaths, (uint64_t)transcriptionPathScores, (uint64_t)trailingSeparator, recognizerGenerationIdentifier, changeableCount, isMinimalDrawingResult, *(_QWORD *)&self->_baseWritingDirection);
  objc_msgSend_setPrecedingLineBreaks_(isMinimalDrawingResult_baseWritingDirection, v18, self->_precedingLineBreaks, v19, v20, v21);
  objc_msgSend_setInputStrokeIdentifiers_(isMinimalDrawingResult_baseWritingDirection, v22, (uint64_t)self->_inputStrokeIdentifiers, v23, v24, v25);
  objc_msgSend_setLocale_(isMinimalDrawingResult_baseWritingDirection, v26, (uint64_t)self->_locale, v27, v28, v29);
  return isMinimalDrawingResult_baseWritingDirection;
}

- (id)descriptionWithSensitiveInformation:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  const char *v22;
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
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
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
  void *v57;
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
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v127;
  objc_super v128;
  objc_super v129;

  v6 = a3;
  objc_msgSend_tokenColumns(self, a2, a3, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_count(v8, v9, v10, v11, v12, v13);

  if (v14 == 1)
    v20 = CFSTR("column");
  else
    v20 = CFSTR("columns");
  objc_msgSend_tokenColumns(self, v15, v16, v17, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v21, v22, (uint64_t)CFSTR(", "), (uint64_t)&unk_1E77F17F0, v23, v24);
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_transcriptionPaths(self, v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_count(v30, v31, v32, v33, v34, v35);

  if (v36 == 1)
    v42 = CFSTR("transcriptionPath");
  else
    v42 = CFSTR("transcriptionPaths");
  objc_msgSend_transcriptionPaths(self, v37, v38, v39, v40, v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v43, v44, (uint64_t)CFSTR(",\n"), (uint64_t)&unk_1E77F1CF0, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_tokenColumns(self, v48, v49, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v53, v54, (uint64_t)CFSTR(",\n"), (uint64_t)&unk_1E77EFB58, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v129.receiver = self;
    v129.super_class = (Class)CHTokenizedTextResult;
    -[CHTokenizedResult description](&v129, sel_description);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenColumns(self, v59, v60, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend_count(v64, v65, v66, v67, v68, v69);
    v76 = objc_msgSend_changeableTokenColumnCount(self, v71, v72, v73, v74, v75);
    objc_msgSend_transcriptionPaths(self, v77, v78, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend_count(v82, v83, v84, v85, v86, v87);
    objc_msgSend_stringByAppendingFormat_(v58, v89, (uint64_t)CFSTR(" %ld (%ld changeable) %@ [%@], %ld %@ \n%@ \n%@"), v90, v91, v92, v70, v76, v20, v127, v88, v42, v47, v57);
    v93 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v128.receiver = self;
    v128.super_class = (Class)CHTokenizedTextResult;
    -[CHTokenizedResult description](&v128, sel_description);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenColumns(self, v94, v95, v96, v97, v98);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend_count(v58, v99, v100, v101, v102, v103);
    v110 = objc_msgSend_changeableTokenColumnCount(self, v105, v106, v107, v108, v109);
    objc_msgSend_transcriptionPaths(self, v111, v112, v113, v114, v115);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = objc_msgSend_count(v64, v116, v117, v118, v119, v120);
    objc_msgSend_stringByAppendingFormat_(v57, v122, (uint64_t)CFSTR(" %ld (%ld changeable) %@ [%@], %ld %@ \n%@"), v123, v124, v125, v104, v110, v20, v127, v121, v42, v47);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v93;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_descriptionWithSensitiveInformation_(self, a2, 1, v2, v3, v4);
}

- (void)setInputStrokeIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_inputStrokeIdentifiers, a3);
}

- (id)inputStrokeIdentifiers
{
  return self->_inputStrokeIdentifiers;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (id)locale
{
  return self->_locale;
}

- (id)tokenColumns
{
  return self->_tokenColumns;
}

- (int64_t)tokenColumnCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;

  objc_msgSend_tokenColumns(self, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_count(v6, v7, v8, v9, v10, v11);

  return v12;
}

- (int64_t)changeableTokenColumnCount
{
  return self->_changeableCount;
}

- (BOOL)isSingleTokenResult
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (objc_msgSend_tokenColumnCount(self, a2, v2, v3, v4, v5) > 1)
    return 0;
  objc_msgSend_firstObject(self->_transcriptionPaths, v7, v8, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_tokenCountInTranscriptionPath_(self, v14, (uint64_t)v13, v15, v16, v17);

  return v18 == 1;
}

- (int64_t)tokenCountInTranscriptionPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int64_t v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v10 = objc_msgSend_tokenColumnCount(self, v5, v6, v7, v8, v9);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BE73D9E8;
  v14[3] = &unk_1E77F46B0;
  v14[4] = &v15;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v11, (uint64_t)v4, 0, v10, (uint64_t)v14);
  v12 = v16[3];
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (int)baseWritingDirection
{
  return *(_QWORD *)&self->_baseWritingDirection;
}

- (double)score
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  double v13;

  objc_msgSend_firstObject(self->_transcriptionPathScores, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v6, v7, v8, v9, v10, v11);
  v13 = v12;

  return v13;
}

- (id)strokeIndexes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  NSArray *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_tokenColumns;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v25, (uint64_t)v29, 16, v10);
  if (v16)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v8);
        objc_msgSend_strokeIndexes(*(void **)(*((_QWORD *)&v25 + 1) + 8 * v18), v11, v12, v13, v14, v15, (_QWORD)v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addIndexes_(v7, v20, (uint64_t)v19, v21, v22, v23);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v25, (uint64_t)v29, 16, v15);
    }
    while (v16);
  }

  return v7;
}

- (id)tokenRowsAtColumnIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  objc_msgSend_tokenColumns(self, a2, a3, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v7, v8, a3, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_textTokenRows(v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)tokensInTranscriptionPath:(id)a3 atColumnIndex:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
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
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  v8 = objc_msgSend_indexAtPosition_(a3, a2, a4, a4, v4, v5);
  objc_msgSend_tokenColumns(self, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v14, v15, a4, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_textTokenRows(v19, v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v25, v26, v8, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (BOOL)hasTokenAtLocation:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t var0;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t var1;
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
  unint64_t v26;
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
  void *v37;
  unint64_t var2;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  BOOL v44;

  var0 = a3->var0;
  if (var0 >= objc_msgSend_count(self->_tokenColumns, a2, (uint64_t)a3, v3, v4, v5))
    return 0;
  objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v9, a3->var0, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  var1 = a3->var1;
  objc_msgSend_textTokenRows(v13, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_count(v20, v21, v22, v23, v24, v25);

  if (var1 >= v26)
  {
    v44 = 0;
  }
  else
  {
    objc_msgSend_textTokenRows(v13, v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v32, v33, a3->var1, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    var2 = a3->var2;
    v44 = var2 < objc_msgSend_count(v37, v39, v40, v41, v42, v43);

  }
  return v44;
}

- (id)tokenAtLocation:(id *)a3
{
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
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, a2, a3->var0, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textTokenRows(v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v13, v14, a3->var1, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v18, v19, a3->var2, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (int64_t)recognizerGenerationIdentifier
{
  return self->_recognizerGenerationIdentifier;
}

- (int64_t)precedingLineBreaks
{
  return self->_precedingLineBreaks;
}

- (NSString)recognizerDebugDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v6 = objc_msgSend_recognizerGenerationIdentifier(self, a2, v2, v3, v4, v5);
  if (v6 > 2)
    return (NSString *)&stru_1E77F6F28;
  else
    return &off_1E77F4A70[v6]->isa;
}

- (double)heuristicTextScoreForColumnRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  _QWORD v7[5];
  _NSRange v8;
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BE73DFE4;
  v7[3] = &unk_1E77F46D8;
  v8 = a3;
  v7[4] = &v9;
  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(self, a2, (uint64_t)v7, a3.length, v3, v4);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (double)averageTokenRecognitionScoreForColumnRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t i;
  void *v28;
  double v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  double result;
  NSUInteger v58;
  CHTokenizedTextResult *v59;
  unint64_t v60;
  NSUInteger location;
  id obj;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  if (a3.location >= a3.location + a3.length)
  {
    result = NAN;
  }
  else
  {
    v5 = 0;
    v6 = 0.0;
    v58 = a3.location + a3.length;
    v59 = self;
    do
    {
      v60 = v5;
      location = a3.location;
      objc_msgSend_tokenRowsAtColumnIndex_(self, a2, a3.location, a3.length, v3, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      obj = v7;
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v69, (uint64_t)v74, 16, v9);
      if (v10)
      {
        v63 = *(_QWORD *)v70;
        v11 = 0.0;
        v12 = 1;
        do
        {
          v13 = 0;
          v64 = v10;
          do
          {
            if (*(_QWORD *)v70 != v63)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v13);
            v65 = 0u;
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            v15 = v14;
            v18 = 0;
            v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v65, (uint64_t)v73, 16, v17);
            if (v24)
            {
              v25 = *(_QWORD *)v66;
              v26 = 0.0;
              do
              {
                for (i = 0; i != v24; ++i)
                {
                  if (*(_QWORD *)v66 != v25)
                    objc_enumerationMutation(v15);
                  v28 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
                  objc_msgSend_recognitionScore(v28, v19, v20, v21, v22, v23);
                  v30 = v29;
                  objc_msgSend_string(v28, v31, v32, v33, v34, v35);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = objc_msgSend_length(v36, v37, v38, v39, v40, v41);

                  objc_msgSend_string(v28, v43, v44, v45, v46, v47);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = objc_msgSend_length(v48, v49, v50, v51, v52, v53);

                  v26 = v26 + v30 * (double)(unint64_t)v42;
                  v18 += v54;
                }
                v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v19, (uint64_t)&v65, (uint64_t)v73, 16, v23);
              }
              while (v24);
            }
            else
            {
              v26 = 0.0;
            }

            if (v26 / (double)v18 > v11 / (double)v12)
            {
              v11 = v26;
              v12 = v18;
            }
            ++v13;
          }
          while (v13 != v64);
          v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v55, (uint64_t)&v69, (uint64_t)v74, 16, v56);
        }
        while (v10);
      }
      else
      {
        v11 = 0.0;
        v12 = 1;
      }

      v6 = v6 + v11;
      v5 = v12 + v60;
      a3.location = location + 1;
      self = v59;
    }
    while (location + 1 != v58);
    result = v6 / (double)v5;
  }
  if (result > 1.0)
    return 1.0;
  return result;
}

- (BOOL)hasTextReplacementsInColumnRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  _QWORD v7[5];
  _NSRange v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BE73E3E0;
  v7[3] = &unk_1E77F46D8;
  v8 = a3;
  v7[4] = &v9;
  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(self, a2, (uint64_t)v7, a3.length, v3, v4);
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (NSString)topTranscription
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
  uint64_t v19;
  const char *v20;
  void *v21;

  objc_msgSend_transcriptionPaths(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13
    && (v19 = objc_msgSend_length(v13, v14, v15, v16, v17, v18),
        objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(self, v20, (uint64_t)v13, 0, v19, 0),
        (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

    return (NSString *)v21;
  }
  else
  {

    return (NSString *)&stru_1E77F6F28;
  }
}

- (id)rawTranscriptionPath
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __int128 v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
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
  void *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  unint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char isTopOriginal;
  uint64_t i;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  __int128 v55;
  id v56;
  unint64_t v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  unint64_t v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v56 = objc_alloc_init(MEMORY[0x1E0CB36B0]);
    v6 = 0;
    *(_QWORD *)&v7 = 134217984;
    v55 = v7;
    while (v6 < objc_msgSend_count(*(void **)(a1 + 32), v1, v2, v3, v4, v5, v55))
    {
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 32), v8, v6, v9, v10, v11);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v18 = 0x7FFFFFFFFFFFFFFFLL;
      v19 = -1;
      v58 = v6;
      while (1)
      {
        objc_msgSend_textTokenRows(v59, v12, v13, v14, v15, v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v17 < objc_msgSend_count(v20, v21, v22, v23, v24, v25);

        if (!v26)
          break;
        objc_msgSend_textTokenRows(v59, v27, v28, v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v32, v33, v17, v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v38 = v37;
        v41 = 0;
        v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v60, (uint64_t)v66, 16, v40);
        if (v47)
        {
          v48 = *(_QWORD *)v61;
          isTopOriginal = 1;
          do
          {
            for (i = 0; i != v47; ++i)
            {
              if (*(_QWORD *)v61 != v48)
                objc_enumerationMutation(v38);
              v51 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
              if ((isTopOriginal & 1) != 0)
                isTopOriginal = objc_msgSend_isTopOriginal(*(void **)(*((_QWORD *)&v60 + 1) + 8 * i), v42, v43, v44, v45, v46);
              else
                isTopOriginal = 0;
              v41 += objc_msgSend_inputSourceModifiersCount(v51, v42, v43, v44, v45, v46);
            }
            v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v42, (uint64_t)&v60, (uint64_t)v66, 16, v46);
          }
          while (v47);
        }
        else
        {
          isTopOriginal = 1;
        }

        v6 = v58;
        if ((isTopOriginal & (v41 < v19)) != 0)
        {
          v19 = v41;
          v18 = v17;
        }

        ++v17;
      }
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v52 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v55;
          v65 = v6;
          _os_log_impl(&dword_1BE607000, v52, OS_LOG_TYPE_FAULT, "Original token not found in column %ld", buf, 0xCu);
        }

      }
      objc_msgSend_indexPathByAddingIndex_(v56, v27, v18, v29, v30, v31);
      v53 = objc_claimAutoreleasedReturnValue();

      ++v6;
      v56 = (id)v53;
    }
  }
  else
  {
    v56 = 0;
  }
  return v56;
}

- (NSString)rawTranscription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  __CFString *v11;

  v7 = objc_msgSend_count(self->_tokenColumns, a2, v2, v3, v4, v5);
  -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(self, v9, (uint64_t)v8, 0, v7, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = (__CFString *)v10;
  else
    v11 = &stru_1E77F6F28;

  return (NSString *)v11;
}

- (id)topModelTranscriptionPath
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  __int128 v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  unint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t i;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  BOOL v68;
  NSObject *v69;
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
  uint64_t v81;
  __int128 v83;
  void *v84;
  unint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t buf[4];
  unint64_t v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  double v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  unint64_t v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB36B0]);
    v7 = 0;
    *(_QWORD *)&v8 = 134219008;
    v83 = v8;
    while (1)
    {
      v84 = v6;
      if (v7 >= objc_msgSend_count(*(void **)(a1 + 32), v1, v2, v3, v4, v5, v83))
        break;
      v86 = v7;
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 32), v9, v7, v10, v11, v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v20 = 0x7FFFFFFFFFFFFFFFLL;
      v21 = 0.0;
      v22 = 64;
      while (1)
      {
        objc_msgSend_textTokenRows(v18, v13, v14, v15, v16, v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v19 < objc_msgSend_count(v23, v24, v25, v26, v27, v28);

        if (!v29)
          break;
        objc_msgSend_textTokenRows(v18, v30, v31, v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v35, v36, v19, v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v41 = v40;
        v44 = 0;
        v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v87, (uint64_t)v101, 16, v43);
        if (v50)
        {
          v51 = *(_QWORD *)v88;
          v52 = 0.0;
          do
          {
            for (i = 0; i != v50; ++i)
            {
              if (*(_QWORD *)v88 != v51)
                objc_enumerationMutation(v41);
              v54 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
              objc_msgSend_modelScore(v54, v45, v46, v47, v48, v49);
              v52 = v52 + v60;
              v44 += objc_msgSend_inputSourceModifiersCount(v54, v55, v56, v57, v58, v59);
            }
            v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v45, (uint64_t)&v87, (uint64_t)v101, 16, v49);
          }
          while (v50);
        }
        else
        {
          v52 = 0.0;
        }

        v66 = objc_msgSend_count(v41, v61, v62, v63, v64, v65);
        v67 = v52 / (double)(unint64_t)v66;
        if (!v19 || v67 > v21 || (v67 == v21 ? (v68 = v44 >= v22) : (v68 = 1), !v68))
        {
          v22 = v44;
          v21 = v52 / (double)(unint64_t)v66;
          v20 = v19;
        }

        ++v19;
      }
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v69 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend_textTokenRows(v18, v70, v71, v72, v73, v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend_count(v75, v76, v77, v78, v79, v80);
          *(_DWORD *)buf = v83;
          v92 = v86;
          v93 = 2048;
          v94 = v81;
          v95 = 2048;
          v96 = v21;
          v97 = 2048;
          v98 = 0x7FFFFFFFFFFFFFFFLL;
          v99 = 2048;
          v100 = v22;
          _os_log_impl(&dword_1BE607000, v69, OS_LOG_TYPE_FAULT, "Best token not found in column %ld, rows in column = %ld, bestRowModelScore = %.2f, bestRowIndex = %ld, bestInputSourcesCount = %ld", buf, 0x34u);

        }
      }
      objc_msgSend_indexPathByAddingIndex_(v84, v30, v20, v32, v33, v34);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      v7 = v86 + 1;
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)topModelTranscription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  __CFString *v11;

  v7 = objc_msgSend_count(self->_tokenColumns, a2, v2, v3, v4, v5);
  -[CHTokenizedTextResult topModelTranscriptionPath]_0((uint64_t)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(self, v9, (uint64_t)v8, 0, v7, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = (__CFString *)v10;
  else
    v11 = &stru_1E77F6F28;

  return (NSString *)v11;
}

- (id)transcriptionWithPath:(id)a3 columnRange:(_NSRange)a4 filterLowConfidence:(BOOL)a5
{
  objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_excludeGibberish_allowPrecedingSeparator_rejectionRate_tokenProcessingBlock_(self, a2, (uint64_t)a3, a4.location, a4.length, a5, a5, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transcriptionWithPath:(id)a3 columnRange:(_NSRange)a4 filterLowConfidence:(BOOL)a5 allowPrecedingSeparator:(BOOL)a6
{
  objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_excludeGibberish_allowPrecedingSeparator_rejectionRate_tokenProcessingBlock_(self, a2, (uint64_t)a3, a4.location, a4.length, a5, a5, a6, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transcriptionWithPath:(id)a3 columnRange:(_NSRange)a4 filterLowConfidence:(BOOL)a5 excludeGibberish:(BOOL)a6 rejectionRate:(double *)a7 tokenProcessingBlock:(id)a8
{
  objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_excludeGibberish_allowPrecedingSeparator_rejectionRate_tokenProcessingBlock_(self, a2, (uint64_t)a3, a4.location, a4.length, a5, a6, 0, a7, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transcriptionWithPath:(id)a3 columnRange:(_NSRange)a4 filterLowConfidence:(BOOL)a5 excludeGibberish:(BOOL)a6 allowPrecedingSeparator:(BOOL)a7 rejectionRate:(double *)a8 tokenProcessingBlock:(id)a9
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  double v38;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, void *, uint64_t, __int128 *);
  void *v43;
  CHTokenizedTextResult *v44;
  id v45;
  id v46;
  uint64_t *v47;
  _QWORD *v48;
  uint64_t *v49;
  uint64_t *v50;
  BOOL v51;
  BOOL v52;
  BOOL v53;
  _QWORD v54[3];
  char v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  __n128 (*v59)(__n128 *, __n128 *);
  uint64_t (*v60)();
  void *v61;
  __int128 v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;

  length = a4.length;
  location = a4.location;
  v15 = a3;
  v16 = a9;
  objc_msgSend_string(MEMORY[0x1E0CB37A0], v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x4012000000;
  v59 = sub_1BE73F044;
  v60 = nullsub_32;
  v61 = &unk_1BE94989A;
  v62 = xmmword_1BE8D6920;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v55 = 0;
  v40 = MEMORY[0x1E0C809B0];
  v41 = 3221225472;
  v42 = sub_1BE73F054;
  v43 = &unk_1E77F4700;
  v51 = a5;
  v52 = a6;
  v47 = &v63;
  v48 = v54;
  v44 = self;
  v53 = a7;
  v23 = v22;
  v45 = v23;
  v49 = &v67;
  v24 = v16;
  v46 = v24;
  v50 = &v56;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v25, (uint64_t)v15, location, length, (uint64_t)&v40);
  v30 = v57 + 6;
  v29 = v57[6];
  if (v29 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v31 = 0;
    v29 = 0;
    *v30 = 0;
    v30[1] = 0;
  }
  else
  {
    v31 = v57[7];
  }
  objc_msgSend_substringWithRange_(v23, v26, v29, v31, v27, v28, a8, v40, v41, v42, v43, v44);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (a8)
  {
    if (objc_msgSend_length(v23, v32, v33, v34, v35, v36))
      v38 = (double)v68[3] / (double)v64[3];
    else
      v38 = 0.0;
    *a8 = v38;
  }

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);

  return v37;
}

- (BOOL)shouldFilterOutStringForToken:(id)a3 isGibberish:(BOOL *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
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
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
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
  uint64_t v67;
  _BOOL4 v68;
  BOOL v69;
  _BOOL4 v70;
  BOOL v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  int v78;
  int v79;
  int v80;
  _BOOL4 v81;

  v6 = a3;
  v12 = v6;
  if (self->_recognizerGenerationIdentifier != 1)
  {
    if ((objc_msgSend_properties(v6, v7, v8, v9, v10, v11) & 0x10) != 0)
    {
      LOBYTE(v78) = 1;
    }
    else
    {
      objc_msgSend_combinedScore(v12, v72, v73, v74, v75, v76);
      LOBYTE(v78) = v77 < 0.4;
    }
    v69 = (objc_msgSend_properties(v12, v72, v73, v74, v75, v76) & 4) == 0 && sub_1BE73F724((uint64_t)self, v12);
    goto LABEL_32;
  }
  if (qword_1EF568168 != -1)
    dispatch_once(&qword_1EF568168, &unk_1E77F4720);
  v13 = objc_msgSend_properties(v12, v7, v8, v9, v10, v11);
  objc_msgSend_string(v12, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_length(v19, v20, v21, v22, v23, v24);

  v31 = 1.0;
  if (v25 <= 2)
  {
    objc_msgSend_string(v12, v26, v27, v28, v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_rangeOfCharacterFromSet_(v32, v33, qword_1EF568170, v34, v35, v36);

    if (v37 == 0x7FFFFFFFFFFFFFFFLL)
      v31 = 1.5;
    else
      v31 = 2.0;
  }
  objc_msgSend_recognitionScore(v12, v26, v27, v28, v29, v30);
  v39 = v38;
  if ((objc_msgSend_properties(v12, v40, v41, v42, v43, v44) & 4) == 0)
  {
    objc_msgSend_string(v12, v45, v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend_properties(v12, v51, v52, v53, v54, v55);
    objc_msgSend_stringByTrimmingCharactersInSet_(v50, v57, qword_1EF568160, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend_length(v61, v62, v63, v64, v65, v66);

    v68 = sub_1BE73F724((uint64_t)self, v12);
    v69 = v68;
    if ((v56 & 8) == 0 || v67)
    {
      v71 = 0;
      v70 = 0;
      if ((v56 & 8) != 0 && v67)
      {
        v71 = 0;
        v70 = v39 > v31 * 0.8;
      }
    }
    else
    {
      v70 = 0;
      v71 = v39 > v31 * 0.4;
    }
    v80 = (v56 & 8) == 0 || v68;
    if (v80 == 1)
    {
      v81 = v39 > v31 * 0.1;
      if (!v71)
      {
LABEL_27:
        v79 = v70 || v81;
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
      v81 = 0;
      if (!v71)
        goto LABEL_27;
    }
    v79 = 1;
    goto LABEL_30;
  }
  v69 = 0;
  v79 = v39 > v31 * 0.8;
LABEL_31:
  v78 = v79 | (v13 >> 4) & 1;
LABEL_32:
  if (a4)
    *a4 = v69;

  return v78;
}

- (BOOL)isPathOriginal:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v10 = objc_msgSend_tokenColumnCount(self, v5, v6, v7, v8, v9);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BE73F9E8;
  v13[3] = &unk_1E77F46B0;
  v13[4] = &v14;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v11, (uint64_t)v4, 0, v10, (uint64_t)v13);
  LOBYTE(self) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)self;
}

- (BOOL)hasValidPrincipalLinesForPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v10 = objc_msgSend_tokenColumnCount(self, v5, v6, v7, v8, v9);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BE73FB20;
  v13[3] = &unk_1E77F46B0;
  v13[4] = &v14;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v11, (uint64_t)v4, 0, v10, (uint64_t)v13);
  LOBYTE(self) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)self;
}

- (BOOL)transcriptionPathsHaveSameSegmentation:(id)a3 otherPath:(id)a4
{
  id v5;
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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t i;
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
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
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
  unint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  const char *v72;
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
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  BOOL v108;
  CHTokenizedTextResult *v110;
  id v111;

  v110 = self;
  v5 = a3;
  v111 = a4;
  v11 = objc_msgSend_length(v5, v6, v7, v8, v9, v10);
  if (v11 == objc_msgSend_length(v111, v12, v13, v14, v15, v16))
  {
    for (i = 0; i < objc_msgSend_length(v5, v17, v18, v19, v20, v21, v110); ++i)
    {
      objc_msgSend_tokenRowsAtColumnIndex_(v110, v23, i, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_indexAtPosition_(v5, v28, i, v29, v30, v31);
      v37 = objc_msgSend_indexAtPosition_(v111, v33, i, v34, v35, v36);
      objc_msgSend_objectAtIndexedSubscript_(v27, v38, v32, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend_count(v42, v43, v44, v45, v46, v47);
      objc_msgSend_objectAtIndexedSubscript_(v27, v49, v37, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend_count(v53, v54, v55, v56, v57, v58);

      if (v48 != v59)
      {
LABEL_10:

        goto LABEL_11;
      }
      v64 = 0;
      while (1)
      {
        objc_msgSend_objectAtIndexedSubscript_(v27, v60, v32, v61, v62, v63);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend_count(v65, v66, v67, v68, v69, v70);

        if (v64 >= v71)
          break;
        objc_msgSend_objectAtIndexedSubscript_(v27, v72, v32, v73, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v76, v77, v64, v78, v79, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeIndexes(v81, v82, v83, v84, v85, v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectAtIndexedSubscript_(v27, v88, v37, v89, v90, v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v92, v93, v64, v94, v95, v96);
        v97 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeIndexes((void *)v97, v98, v99, v100, v101, v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v97) = objc_msgSend_isEqualToIndexSet_(v87, v104, (uint64_t)v103, v105, v106, v107);
        ++v64;
        if ((v97 & 1) == 0)
          goto LABEL_10;
      }

    }
    v108 = 1;
  }
  else
  {
LABEL_11:
    v108 = 0;
  }

  return v108;
}

- (id)precedingSeparatorForTopTranscriptionPath
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
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __CFString *v52;

  objc_msgSend_transcriptionPaths(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v18 = objc_msgSend_indexAtPosition_(v13, v14, 0, v15, v16, v17);
    objc_msgSend_tokenColumns(self, v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v24, v25, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_textTokenRows(v30, v31, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v36, v37, v18, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_firstObject(v41, v42, v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_precedingSeparatorForToken_(self, v48, (uint64_t)v47, v49, v50, v51);
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v52 = &stru_1E77F6F28;
  }

  return v52;
}

- (id)precedingSeparatorForRawTranscriptionPath
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __CFString *v47;

  -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v3, v4, v5, v6, v7, v8))
  {
    v13 = objc_msgSend_indexAtPosition_(v3, v9, 0, v10, v11, v12);
    objc_msgSend_tokenColumns(self, v14, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v19, v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_textTokenRows(v25, v26, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v31, v32, v13, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_firstObject(v36, v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_precedingSeparatorForToken_(self, v43, (uint64_t)v42, v44, v45, v46);
    v47 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v47 = &stru_1E77F6F28;
  }

  return v47;
}

- (id)precedingSeparatorForToken:(id)a3
{
  id v4;
  const char *v5;
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
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  __CFString *v34;

  v4 = a3;
  if (objc_msgSend_precedingLineBreaks(self, v5, v6, v7, v8, v9) >= 1)
  {
    objc_msgSend_tokenColumns(self, v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v15, v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_containsStartingTokenEquivalentToToken_(v21, v22, (uint64_t)v4, v23, v24, v25) & 1) != 0)
    {
      v31 = objc_msgSend_precedingLineBreaks(self, v26, v27, v28, v29, v30);
      objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(&stru_1E77F6F28, v32, v31, (uint64_t)CFSTR("\n"), 0, v33);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v34)
        goto LABEL_4;
    }
    else
    {

    }
  }
  if ((objc_msgSend_properties(v4, v10, v11, v12, v13, v14) & 0x20) != 0)
    v34 = CFSTR(" ");
  else
    v34 = &stru_1E77F6F28;
LABEL_4:

  return v34;
}

- (id)strokeIndexesForColumnsInRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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

  length = a3.length;
  location = a3.location;
  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], a2, a3.location, a3.length, v3, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (location < location + length)
  {
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v8, location, v9, v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeIndexes(v13, v14, v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addIndexes_(v12, v20, (uint64_t)v19, v21, v22, v23);

      ++location;
      --length;
    }
    while (length);
  }
  return v12;
}

- (id)strokeIndexSetsInPath:(id)a3 columnRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (location < location + length)
  {
    do
    {
      objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(self, v13, (uint64_t)v7, location, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BE740384((uint64_t)CHTokenizedTextResult, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v16, v19, (uint64_t)v18, v20, v21, v22);

      ++location;
      --length;
    }
    while (length);
  }

  return v16;
}

- (BOOL)hasValidColumns
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  BOOL v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  const char *v20;
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
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
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
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;

  v7 = objc_msgSend_count(self->_tokenColumns, a2, v2, v3, v4, v5);
  v8 = v7 != 0;
  if (objc_msgSend_count(self->_tokenColumns, v9, v10, v11, v12, v13))
    v18 = v7 == 0;
  else
    v18 = 1;
  if (!v18)
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v14, 0, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_textTokenRows(v19, v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
    v8 = v31 != 0;

    objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v32, 0, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_textTokenRows(v36, v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_count(v42, v43, v44, v45, v46, v47);

    if (v48)
      v54 = v31 == 0;
    else
      v54 = 1;
    if (!v54)
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v49, 0, v51, v52, v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_textTokenRows(v55, v56, v57, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v61, v62, 0, v63, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend_count(v66, v67, v68, v69, v70, v71) != 0;

      objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v72, 0, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_textTokenRows(v76, v77, v78, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_count(v82, v83, v84, v85, v86, v87);

    }
    objc_msgSend_count(self->_tokenColumns, v49, v50, v51, v52, v53);
  }
  return v8;
}

- (BOOL)hasValidPaths
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  if (objc_msgSend_count(self->_transcriptionPaths, a2, v2, v3, v4, v5))
  {
    v12 = objc_msgSend_count(self->_transcriptionPaths, v7, v8, v9, v10, v11);
    v18 = v12 == objc_msgSend_count(self->_transcriptionPathScores, v13, v14, v15, v16, v17);
    if (!objc_msgSend_count(self->_transcriptionPaths, v19, v20, v21, v22, v23))
      return v18;
  }
  else
  {
    v18 = 0;
    if (!objc_msgSend_count(self->_transcriptionPaths, v7, v8, v9, v10, v11))
      return v18;
  }
  if (!v18)
    return v18;
  objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPaths, v24, 0, v25, v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_length(v29, v30, v31, v32, v33, v34);
  v41 = objc_msgSend_count(self->_tokenColumns, v36, v37, v38, v39, v40);

  objc_msgSend_count(self->_transcriptionPaths, v42, v43, v44, v45, v46);
  return v35 == v41;
}

- (BOOL)isValid
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int hasValidColumns;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  hasValidColumns = objc_msgSend_hasValidColumns(self, a2, v2, v3, v4, v5);
  if (hasValidColumns)
    LOBYTE(hasValidColumns) = MEMORY[0x1E0DE7D20](self, sel_hasValidPaths, v8, v9, v10, v11);
  return hasValidColumns;
}

- (id)tokensFromTranscriptionPath:(id)a3 characterRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
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
  NSObject *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  _QWORD v37[4];
  id v38;
  uint8_t *v39;
  NSUInteger v40;
  NSUInteger v41;
  uint8_t buf[8];
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v13 = objc_msgSend_length(v7, v8, v9, v10, v11, v12);
  objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(self, v14, (uint64_t)v7, 0, v13, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (location + length > objc_msgSend_length(v15, v16, v17, v18, v19, v20))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v26 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v26, OS_LOG_TYPE_FAULT, "The character range must be compatible with the transcription for this path.", buf, 2u);
    }

  }
  *(_QWORD *)buf = 0;
  v43 = buf;
  v44 = 0x2020000000;
  v45 = 0;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v21, v22, v23, v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_tokenColumnCount(self, v28, v29, v30, v31, v32);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = sub_1BE740C2C;
  v37[3] = &unk_1E77F4748;
  v39 = buf;
  v40 = location;
  v41 = length;
  v34 = v27;
  v38 = v34;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v35, (uint64_t)v7, 0, v33, (uint64_t)v37);

  _Block_object_dispose(buf, 8);
  return v34;
}

- (id)tokenizedResultWithFilteredPaths:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  unint64_t i;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  const char *v60;
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
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  CHMutableTokenizedTextResult *v78;
  NSArray *tokenColumns;
  NSString *trailingSeparator;
  int64_t recognizerGenerationIdentifier;
  int64_t changeableCount;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  void *isMinimalDrawingResult_baseWritingDirection;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char isMinimalDrawingResult;

  v9 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_firstObject(self->_transcriptionPaths, a2, v3, v4, v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObject_(v9, v11, (uint64_t)v10, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_firstObject(self->_transcriptionPathScores, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObject_(v16, v23, (uint64_t)v22, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_firstObject(self->_transcriptionPathScores, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v33, v34, v35, v36, v37, v38);
  v40 = v39;

  v46 = v40 * a3;
  for (i = 1; i < objc_msgSend_count(self->_transcriptionPathScores, v41, v42, v43, v44, v45); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPathScores, v48, i, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v52, v53, v54, v55, v56, v57);
    v59 = v58;

    if (v59 <= v46)
      break;
    objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPaths, v60, i, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v15, v65, (uint64_t)v64, v66, v67, v68);

    objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPathScores, v69, i, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v27, v74, (uint64_t)v73, v75, v76, v77);

  }
  v78 = [CHMutableTokenizedTextResult alloc];
  tokenColumns = self->_tokenColumns;
  trailingSeparator = self->_trailingSeparator;
  recognizerGenerationIdentifier = self->_recognizerGenerationIdentifier;
  changeableCount = self->_changeableCount;
  isMinimalDrawingResult = objc_msgSend_isMinimalDrawingResult(self, v83, v84, v85, v86, v87);
  isMinimalDrawingResult_baseWritingDirection = (void *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_isMinimalDrawingResult_baseWritingDirection_(v78, v88, (uint64_t)tokenColumns, (uint64_t)v15, (uint64_t)v27, (uint64_t)trailingSeparator, recognizerGenerationIdentifier, changeableCount, isMinimalDrawingResult, *(_QWORD *)&self->_baseWritingDirection);
  v95 = objc_msgSend_count(v27, v90, v91, v92, v93, v94);
  objc_msgSend_trimTokensToTranscriptionPathCount_(isMinimalDrawingResult_baseWritingDirection, v96, v95, v97, v98, v99);

  return isMinimalDrawingResult_baseWritingDirection;
}

+ (id)resultRestoringRawPathInResult:(id)a3
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
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
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
  void *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
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
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i;
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
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
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
  void *v153;
  _QWORD v154[5];
  uint64_t v155;
  double *v156;
  uint64_t v157;
  uint64_t v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  _QWORD v163[4];
  id v164;
  id v165;
  _BYTE v166[128];
  uint64_t v167;

  v167 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_tokenColumns(v3, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_indexesOfObjectsPassingTest_(v9, v10, (uint64_t)&unk_1E77F4788, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v153 = v14;
  if (objc_msgSend_count(v14, v15, v16, v17, v18, v19))
  {
    v25 = (void *)objc_msgSend_mutableCopy(v3, v20, v21, v22, v23, v24);
    v26 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend_tokenColumns(v25, v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithArray_(v26, v33, (uint64_t)v32, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v163[0] = MEMORY[0x1E0C809B0];
    v163[1] = 3221225472;
    v163[2] = sub_1BE7416EC;
    v163[3] = &unk_1E77F3DD0;
    v164 = v3;
    v38 = v37;
    v165 = v38;
    objc_msgSend_enumerateIndexesUsingBlock_(v14, v39, (uint64_t)v163, v40, v41, v42);
    objc_msgSend_setTokenColumns_(v25, v43, (uint64_t)v38, v44, v45, v46);

  }
  else
  {
    v25 = 0;
  }
  if (v25)
    v47 = v25;
  else
    v47 = v3;
  v48 = v47;

  -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v48, v50, v51, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend_indexOfObjectIdenticalTo_(v55, v56, (uint64_t)v49, v57, v58, v59);

  if (v60 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v66 = 0;
LABEL_9:
    if (v66 < objc_msgSend_tokenColumnCount(v48, v61, v62, v63, v64, v65))
    {
      v67 = objc_msgSend_indexAtPosition_(v49, v61, v66, v63, v64, v65);
      v161 = 0u;
      v162 = 0u;
      v159 = 0u;
      v160 = 0u;
      objc_msgSend_transcriptionPaths(v48, v68, v69, v70, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v74, (uint64_t)&v159, (uint64_t)v166, 16, v75);
      if (v80)
      {
        v81 = *(_QWORD *)v160;
        while (2)
        {
          for (i = 0; i != v80; ++i)
          {
            if (*(_QWORD *)v160 != v81)
              objc_enumerationMutation(v73);
            if (objc_msgSend_indexAtPosition_(*(void **)(*((_QWORD *)&v159 + 1) + 8 * i), v76, v66, v77, v78, v79) == v67)
            {

              ++v66;
              goto LABEL_9;
            }
          }
          v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v76, (uint64_t)&v159, (uint64_t)v166, 16, v79);
          if (v80)
            continue;
          break;
        }
      }

      if (!v25)
        v25 = (void *)objc_msgSend_mutableCopy(v3, v83, v84, v85, v86, v87);
      objc_msgSend_transcriptionPaths(v25, v83, v84, v85, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = (void *)objc_msgSend_mutableCopy(v88, v89, v90, v91, v92, v93);

      objc_msgSend_transcriptionPathScores(v25, v95, v96, v97, v98, v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = (void *)objc_msgSend_mutableCopy(v100, v101, v102, v103, v104, v105);

      objc_msgSend_addObject_(v94, v107, (uint64_t)v49, v108, v109, v110);
      v155 = 0;
      v156 = (double *)&v155;
      v157 = 0x2020000000;
      v158 = 0x3FF0000000000000;
      v116 = objc_msgSend_tokenColumnCount(v25, v111, v112, v113, v114, v115);
      v154[0] = MEMORY[0x1E0C809B0];
      v154[1] = 3221225472;
      v154[2] = sub_1BE741B44;
      v154[3] = &unk_1E77F46B0;
      v154[4] = &v155;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v25, v117, (uint64_t)v49, 0, v116, (uint64_t)v154);
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v118, v119, v120, v121, v122, v156[3]);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v106, v124, (uint64_t)v123, v125, v126, v127);

      objc_msgSend_setTranscriptionPaths_scores_(v25, v128, (uint64_t)v94, (uint64_t)v106, v129, v130);
      _Block_object_dispose(&v155, 8);

    }
  }
  if (v25)
  {
    v131 = (void *)objc_msgSend_copy(v25, v61, v62, v63, v64, v65);

    objc_msgSend_inputStrokeIdentifiers(v48, v132, v133, v134, v135, v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInputStrokeIdentifiers_(v131, v138, (uint64_t)v137, v139, v140, v141);

    objc_msgSend_locale(v48, v142, v143, v144, v145, v146);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocale_(v131, v148, (uint64_t)v147, v149, v150, v151);

  }
  else
  {
    v131 = v3;
  }

  return v131;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)languageFitnessForLocale:(id)a3 recognitionMode:(int)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int hasPrefix;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  char v60;
  uint64_t v61;
  id v62;
  const char *v63;
  double *v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  BOOL v68;
  uint64_t v69;
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
  double v87;
  double v88;
  double v89;
  double v90;
  uint8_t buf[8];
  uint64_t v92;
  void (*v93)(uint64_t, void *);
  void *v94;
  id v95;
  id v96;
  uint64_t *v97;
  uint64_t *v98;
  _QWORD *v99;
  uint64_t *v100;
  uint64_t *v101;
  uint64_t *v102;
  char v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD v108[3];
  char v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  double *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  double *v123;
  uint64_t v124;
  uint64_t v125;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend_transcriptionPaths(self, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v19 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v19, OS_LOG_TYPE_FAULT, "Error: Tokenized text result without any transcription path encountered when computing language fitness.", buf, 2u);
    }

  }
  v20 = v18;
  v21 = v6;
  if (!self)
  {
    v31 = 0.0;
    goto LABEL_21;
  }
  v22 = (void *)objc_opt_class();
  v31 = -10.0;
  if (objc_msgSend_isLocaleSupported_withMode_(v22, v23, (uint64_t)v21, v4, v24, v25))
  {
    if (self->_recognizerGenerationIdentifier != 1)
    {
      v31 = sub_1BE742A90(self, v20);
      goto LABEL_21;
    }
    v122 = 0;
    v123 = (double *)&v122;
    v124 = 0x2020000000;
    v125 = 0;
    v118 = 0;
    v119 = &v118;
    v120 = 0x2020000000;
    v121 = 0;
    objc_msgSend_languageCode(v21, v26, v27, v28, v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasPrefix_(v32, v33, (uint64_t)CFSTR("zh"), v34, v35, v36))
    {

    }
    else
    {
      objc_msgSend_languageCode(v21, v37, v38, v39, v40, v41);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      hasPrefix = objc_msgSend_hasPrefix_(v46, v47, (uint64_t)CFSTR("yue"), v48, v49, v50);

      if (!hasPrefix)
      {
        v60 = 0;
        v59 = 0;
        goto LABEL_16;
      }
    }
    objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v42, (uint64_t)CFSTR("en_US"), v43, v44, v45);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exemplarCharacterSet(v53, v54, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = 1;
LABEL_16:
    v114 = 0;
    v115 = (double *)&v114;
    v116 = 0x2020000000;
    v117 = 0;
    v110 = 0;
    v111 = &v110;
    v112 = 0x2020000000;
    v113 = 0;
    v108[0] = 0;
    v108[1] = v108;
    v108[2] = 0x2020000000;
    v109 = 0;
    v104 = 0;
    v105 = &v104;
    v106 = 0x2020000000;
    v107 = 0;
    v61 = objc_msgSend_length(v20, v42, v52, v43, v44, v45);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v92 = 3221225472;
    v93 = sub_1BE742C30;
    v94 = &unk_1E77F4860;
    v95 = v21;
    v62 = v59;
    v96 = v62;
    v97 = &v122;
    v103 = v60;
    v98 = &v114;
    v99 = v108;
    v100 = &v110;
    v101 = &v104;
    v102 = &v118;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v63, (uint64_t)v20, 0, v61, (uint64_t)buf);
    v64 = v123;
    v65 = v123[3] / (double)v119[3];
    v123[3] = v65;
    v66 = v111[3];
    if (v66 >= 1)
    {
      v65 = v65 - v115[3] / (double)v66;
      v64[3] = v65;
    }
    v67 = v105[3];
    v68 = v67 <= 1;
    v69 = v67 - 1;
    if (!v68)
    {
      v65 = v65 + pow((double)v69, 1.6) * -0.25;
      v64[3] = v65;
    }
    v31 = 1.0 / (exp((v65 + 3.0) * -0.5) + 1.0);

    _Block_object_dispose(&v104, 8);
    _Block_object_dispose(v108, 8);
    _Block_object_dispose(&v110, 8);
    _Block_object_dispose(&v114, 8);

    _Block_object_dispose(&v118, 8);
    _Block_object_dispose(&v122, 8);
  }
LABEL_21:

  objc_msgSend_transcriptionPathScores(self, v70, v71, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v75, v76, v77, v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v81, v82, v83, v84, v85, v86);
  v88 = v87;

  v89 = v31;
  v90 = v88;
  result.var1 = v90;
  result.var0 = v89;
  return result;
}

- (id)lastTokenStrokeIndexes
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  uint8_t v30[16];
  _QWORD v31[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_1BE74350C;
  v36 = sub_1BE74351C;
  v37 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend_transcriptionPaths(self, v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_tokenColumnCount(self, v15, v16, v17, v18, v19);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1BE743524;
  v31[3] = &unk_1E77F4888;
  v31[4] = self;
  v31[5] = &v32;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v21, (uint64_t)v14, v20 - 1, 1, (uint64_t)v31);

  if (!objc_msgSend_count((void *)v33[5], v22, v23, v24, v25, v26))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v27 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_1BE607000, v27, OS_LOG_TYPE_FAULT, "Found empty stroke index set for the last character segment.", v30, 2u);
    }

  }
  v28 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v28;
}

+ (BOOL)isTextTranscriptionUnitConversion:(id)a3 locales:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  char isTextTranscriptionUnitConversion_locales;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend_hasSuffix_(v5, v7, (uint64_t)CFSTR("="), v8, v9, v10))
    isTextTranscriptionUnitConversion_locales = objc_msgSend_isTextTranscriptionUnitConversion_locales_(CHCalculateWrapper, v11, (uint64_t)v5, (uint64_t)v6, v12, v13);
  else
    isTextTranscriptionUnitConversion_locales = 0;

  return isTextTranscriptionUnitConversion_locales;
}

+ (BOOL)isTextTranscriptionVariableAssignment:(id)a3
{
  id v3;
  unint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
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
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
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
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t i;
  void *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  id v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t k;
  void *v166;
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
  uint64_t v177;
  id v178;
  uint64_t j;
  void *v180;
  id v181;
  void *v182;
  void *v183;
  id obj;
  void *v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  _QWORD block[4];
  id v195;
  id v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  uint64_t v204;

  v204 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = 0x1E0CB3000uLL;
  objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E0CB3500], v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByTrimmingCharactersInSet_(v3, v11, (uint64_t)v10, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_length(v15, v16, v17, v18, v19, v20)
    || (objc_msgSend_hasSuffix_(v3, v21, (uint64_t)CFSTR("="), v22, v23, v24) & 1) != 0
    || (v32 = objc_msgSend_rangeOfString_(v15, v25, (uint64_t)CFSTR("="), v26, v27, v28), v32 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v33 = 0;
  }
  else
  {
    v35 = v29;
    objc_msgSend_substringWithRange_(v15, v29, 0, v32, v30, v31);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E0CB3500], v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByTrimmingCharactersInSet_(v36, v43, (uint64_t)v42, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v182 = v47;
    v53 = objc_msgSend_length(v15, v48, v49, v50, v51, v52);
    objc_msgSend_substringWithRange_(v15, v54, (uint64_t)&v35[v32], v53 - (_QWORD)&v35[v32], v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E0CB3500], v58, v59, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByTrimmingCharactersInSet_(v57, v64, (uint64_t)v63, v65, v66, v67);
    v185 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_length(v47, v68, v69, v70, v71, v72) && objc_msgSend_length(v185, v73, v74, v75, v76, v77))
    {
      objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E0CB3500], v78, v79, v80, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v84, v85, v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsSeparatedByCharactersInSet_(v47, v90, (uint64_t)v89, v91, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      v183 = v94;
      if ((unint64_t)objc_msgSend_count(v94, v95, v96, v97, v98, v99) <= 1)
      {
        v199 = 0u;
        v200 = 0u;
        v197 = 0u;
        v198 = 0u;
        obj = v94;
        v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v100, (uint64_t)&v197, (uint64_t)v203, 16, v101);
        if (v105)
        {
          v106 = *(_QWORD *)v198;
          while (2)
          {
            for (i = 0; i != v105; ++i)
            {
              if (*(_QWORD *)v198 != v106)
                objc_enumerationMutation(obj);
              v108 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * i);
              v109 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v108, v102, (uint64_t)v83, 0, v103, v104);
              if (v109 != objc_msgSend_length(v108, v110, v111, v112, v113, v114))
              {
                v33 = 0;
                v94 = v183;
                goto LABEL_48;
              }
            }
            v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v102, (uint64_t)&v197, (uint64_t)v203, 16, v104);
            v94 = v183;
            v4 = 0x1E0CB3000uLL;
            if (v105)
              continue;
            break;
          }
        }

        objc_msgSend_ch_mathOperatorSet(MEMORY[0x1E0CB3500], v115, v116, v117, v118, v119);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1BE743E28;
        block[3] = &unk_1E77F2428;
        v181 = v83;
        v195 = v181;
        obj = v120;
        v196 = obj;
        if (qword_1EF5681B8 != -1)
          dispatch_once(&qword_1EF5681B8, block);
        objc_msgSend_componentsSeparatedByCharactersInSet_(v185, v121, (uint64_t)obj, v122, v123, v124);
        v192 = 0u;
        v193 = 0u;
        v190 = 0u;
        v191 = 0u;
        v178 = (id)objc_claimAutoreleasedReturnValue();
        v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v178, v125, (uint64_t)&v190, (uint64_t)v202, 16, v126);
        if (v127)
        {
          v133 = *(_QWORD *)v191;
          v176 = *(_QWORD *)v191;
          v177 = v127;
          do
          {
            for (j = 0; j != v177; ++j)
            {
              if (*(_QWORD *)v191 != v133)
                objc_enumerationMutation(v178);
              v134 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * j);
              objc_msgSend_whitespaceCharacterSet(*(void **)(v4 + 1280), v128, v129, v130, v131, v132, v176);
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringByTrimmingCharactersInSet_(v134, v136, (uint64_t)v135, v137, v138, v139);
              v180 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend_length(v180, v140, v141, v142, v143, v144))
              {
                objc_msgSend_whitespaceCharacterSet(*(void **)(v4 + 1280), v145, v146, v147, v148, v149);
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_componentsSeparatedByCharactersInSet_(v180, v151, (uint64_t)v150, v152, v153, v154);
                v155 = (void *)objc_claimAutoreleasedReturnValue();

                v188 = 0u;
                v189 = 0u;
                v186 = 0u;
                v187 = 0u;
                v156 = v155;
                v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v156, v157, (uint64_t)&v186, (uint64_t)v201, 16, v158);
                if (v162)
                {
                  v163 = 0;
                  v164 = *(_QWORD *)v187;
                  while (2)
                  {
                    for (k = 0; k != v162; ++k)
                    {
                      if (*(_QWORD *)v187 != v164)
                        objc_enumerationMutation(v156);
                      v166 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * k);
                      v167 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v166, v159, qword_1EF5681B0, 0, v160, v161);
                      if (v167 != objc_msgSend_length(v166, v168, v169, v170, v171, v172))
                      {

                        v94 = v183;
LABEL_45:

                        v33 = 0;
                        goto LABEL_47;
                      }
                      v94 = v183;
                      if (objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v166, v173, (uint64_t)v181, 0, v174, v175))
                      {
                        ++v163;
                      }
                    }
                    v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v156, v159, (uint64_t)&v186, (uint64_t)v201, 16, v161);
                    if (v162)
                      continue;
                    break;
                  }

                  v4 = 0x1E0CB3000;
                  v133 = v176;

                  if (v163 >= 2)
                    goto LABEL_45;
                }
                else
                {

                }
              }

            }
            v33 = 1;
            v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(v178, v128, (uint64_t)&v190, (uint64_t)v202, 16, v132);
          }
          while (v177);
        }
        else
        {
          v33 = 1;
        }
LABEL_47:

LABEL_48:
      }
      else
      {
        v33 = 0;
      }

    }
    else
    {
      v33 = 0;
    }

  }
  return v33;
}

- (id)textRecognitionResultArrayGivenHistory:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
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
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
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
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  const char *v128;
  void *v129;
  CHTextRecognitionResult *v130;
  const char *v131;
  void *isTextReplacement;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  id v200;
  uint64_t v201;
  unint64_t i;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  unint64_t v209;
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
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  CHTextRecognitionResult *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  double v251;
  double v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
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
  uint64_t v280;
  void *v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  id v306;
  id v307;
  CHTokenizedTextResult *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  uint64_t v316;
  void (*v317)(uint64_t);
  void *v318;
  void *v319;
  void *v320;
  _QWORD v321[8];
  uint64_t v322;
  uint64_t *v323;
  uint64_t v324;
  uint64_t (*v325)(uint64_t, uint64_t);
  void (*v326)(uint64_t);
  id v327;
  uint64_t v328;
  uint64_t *v329;
  uint64_t v330;
  uint64_t (*v331)(uint64_t, uint64_t);
  void (*v332)(uint64_t);
  __CFString *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t (*v337)(uint64_t, uint64_t);
  void (*v338)(uint64_t);
  id v339;
  id v340;
  id v341;
  id v342;
  id v343;
  id v344;
  id v345;
  id v346;

  v307 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_transcriptionPaths(self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_count(v10, v11, v12, v13, v14, v15);
  objc_msgSend_arrayWithCapacity_(v4, v17, v16, v18, v19, v20);
  v306 = (id)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v27 = 0x1E0CB3000;
  v308 = self;
  while (1)
  {
    objc_msgSend_transcriptionPaths(self, v21, v22, v23, v24, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_count(v29, v30, v31, v32, v33, v34);

    if (v26 >= v35)
      break;
    v316 = v26;
    if (self)
    {
      objc_msgSend_transcriptionPaths(self, v36, v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v41, v42, v26, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = objc_msgSend_length(v46, v47, v48, v49, v50, v51);
      objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPathScores, v53, v26, v54, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v57, v58, v59, v60, v61, v62);
      v64 = v63;
      v52 *= 2;

      objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v65, v52, v66, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v70, v52, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v75, v52, v76, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v80, v52, v81, v82, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v85, v52, v86, v87, v88);
      v314 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v89, v52, v90, v91, v92);
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v93, v52, v94, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_indexSet(*(void **)(v27 + 1928), v98, v99, v100, v101, v102);
      v310 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_indexSet(*(void **)(v27 + 1928), v103, v104, v105, v106, v107);
      v309 = (void *)objc_claimAutoreleasedReturnValue();
      v319 = v46;
      objc_msgSend_tokenColumns(self, v108, v109, v110, v111, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend_count(v113, v114, v115, v116, v117, v118);

      v334 = MEMORY[0x1E0C809B0];
      v335 = 3221225472;
      v336 = (uint64_t)sub_1BE744AF0;
      v337 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E77F48D8;
      v304 = v74;
      v317 = v74;
      v338 = v317;
      v305 = v69;
      v120 = v69;
      v339 = v120;
      v303 = v79;
      v121 = v79;
      v340 = v121;
      v302 = v84;
      v122 = v84;
      v341 = v122;
      v123 = v314;
      v342 = v123;
      v124 = v312;
      v343 = v124;
      v301 = v97;
      v125 = v97;
      v344 = v125;
      v126 = v310;
      v345 = v126;
      v127 = v309;
      v346 = v127;
      objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_excludeGibberish_rejectionRate_tokenProcessingBlock_(self, v128, (uint64_t)v319, 0, v119, 0, 0, 0, &v334);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = [CHTextRecognitionResult alloc];
      LOBYTE(v300) = 0;
      isTextReplacement = (void *)objc_msgSend_initWithString_score_wordRanges_wordIDs_wordRecognitionScores_wordCombinedScores_wordStrokeSets_wordLexicalEntries_wordPatternEntries_rareWordIndexes_inappropriateWordIndexes_isTextReplacement_(v130, v131, (uint64_t)v129, (uint64_t)v120, (uint64_t)v317, (uint64_t)v121, v122, v123, v64, v124, v125, v126, v127, v300, v301, v302, v303, v304, v305);

    }
    else
    {
      isTextReplacement = 0;
    }
    self = v308;
    if (objc_msgSend_length(v307, v36, v37, v38, v39, v40))
    {
      objc_msgSend_transcriptionPaths(v308, v133, v134, v135, v136, v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v138, v139, v316, v140, v141, v142);
      v143 = (void *)objc_claimAutoreleasedReturnValue();

      v320 = v143;
      v149 = objc_msgSend_length(v143, v144, v145, v146, v147, v148);
      v334 = 0;
      v335 = (uint64_t)&v334;
      v336 = 0x3032000000;
      v337 = sub_1BE74350C;
      v338 = sub_1BE74351C;
      objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v150, 2 * v149, v151, v152, v153);
      v339 = (id)objc_claimAutoreleasedReturnValue();
      v328 = 0;
      v329 = &v328;
      v330 = 0x3032000000;
      v331 = sub_1BE74350C;
      v332 = sub_1BE74351C;
      v333 = &stru_1E77F6F28;
      v322 = 0;
      v323 = &v322;
      v324 = 0x3032000000;
      v325 = sub_1BE74350C;
      v326 = sub_1BE74351C;
      v154 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend_wordRanges(isTextReplacement, v155, v156, v157, v158, v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = objc_msgSend_count(v160, v161, v162, v163, v164, v165);
      objc_msgSend_arrayWithCapacity_(v154, v167, v166, v168, v169, v170);
      v327 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_tokenColumns(v308, v171, v172, v173, v174, v175);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      v182 = objc_msgSend_count(v176, v177, v178, v179, v180, v181);
      v321[0] = MEMORY[0x1E0C809B0];
      v321[1] = 3221225472;
      v321[2] = sub_1BE7449B8;
      v321[3] = &unk_1E77F48B0;
      v321[4] = v308;
      v321[5] = &v334;
      v321[6] = &v328;
      v321[7] = &v322;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v308, v183, (uint64_t)v320, 0, v182, (uint64_t)v321);

      v184 = (void *)v329[5];
      objc_msgSend_string(isTextReplacement, v185, v186, v187, v188, v189);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingString_(v184, v191, (uint64_t)v190, v192, v193, v194);
      v318 = (void *)objc_claimAutoreleasedReturnValue();

      v200 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v201 = 0;
      for (i = 0; ; ++i)
      {
        objc_msgSend_wordRanges(isTextReplacement, v195, v196, v197, v198, v199);
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        v209 = objc_msgSend_count(v203, v204, v205, v206, v207, v208);

        if (i >= v209)
          break;
        objc_msgSend_wordRanges(isTextReplacement, v210, v211, v212, v213, v214);
        v215 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndex_(v215, v216, i, v217, v218, v219);
        v220 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectAtIndex_((void *)v323[5], v221, i, v222, v223, v224);
        v225 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_rangeValue(v220, v226, v227, v228, v229, v230);
        v236 = (uint64_t)&v231[objc_msgSend_length(v225, v231, v232, v233, v234, v235)];
        objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v237, v201, v236, v238, v239);
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v200, v241, (uint64_t)v240, v242, v243, v244);
        v201 += v236;

      }
      v245 = [CHTextRecognitionResult alloc];
      objc_msgSend_score(isTextReplacement, v246, v247, v248, v249, v250);
      v252 = v251;
      objc_msgSend_wordIDs(isTextReplacement, v253, v254, v255, v256, v257);
      v315 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_wordRecognitionScores(isTextReplacement, v258, v259, v260, v261, v262);
      v263 = objc_claimAutoreleasedReturnValue();
      v264 = *(_QWORD *)(v335 + 40);
      objc_msgSend_wordStrokeSets(isTextReplacement, v265, v266, v267, v268, v269);
      v313 = (void *)objc_claimAutoreleasedReturnValue();
      v311 = (void *)v263;
      objc_msgSend_wordLexicalEntries(isTextReplacement, v270, v271, v272, v273, v274);
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_wordPatternEntries(isTextReplacement, v276, v277, v278, v279, v280);
      v281 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rareWordIndexes(isTextReplacement, v282, v283, v284, v285, v286);
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_inappropriateWordIndexes(isTextReplacement, v288, v289, v290, v291, v292);
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v300) = 0;
      v28 = (void *)objc_msgSend_initWithString_score_wordRanges_wordIDs_wordRecognitionScores_wordCombinedScores_wordStrokeSets_wordLexicalEntries_wordPatternEntries_rareWordIndexes_inappropriateWordIndexes_isTextReplacement_(v245, v294, (uint64_t)v318, (uint64_t)v200, (uint64_t)v315, (uint64_t)v311, v264, v313, v252, v275, v281, v287, v293, v300);

      objc_msgSend_addObject_(v306, v295, (uint64_t)v28, v296, v297, v298);
      _Block_object_dispose(&v322, 8);

      _Block_object_dispose(&v328, 8);
      _Block_object_dispose(&v334, 8);

      self = v308;
    }
    else
    {
      objc_msgSend_addObject_(v306, v133, (uint64_t)isTextReplacement, v135, v136, v137);
      v28 = isTextReplacement;
    }

    v26 = v316 + 1;
    v27 = 0x1E0CB3000uLL;
  }

  return v306;
}

- (id)textRecognitionResultArray
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_textRecognitionResultArrayGivenHistory_(self, a2, 0, v2, v3, v4);
}

- (void)enumerateTokensInTopTranscriptionPathWithBlock:(id)a3
{
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
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  id v17;

  v17 = a3;
  objc_msgSend_firstObject(self->_transcriptionPaths, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_tokenColumnCount(self, v10, v11, v12, v13, v14);
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v16, (uint64_t)v9, 0, v15, (uint64_t)v17);

}

- (void)enumerateTokensInTranscriptionPath:(id)a3 columnRange:(_NSRange)a4 tokenProcessingBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(id, uint64_t, uint64_t, _QWORD *);
  NSUInteger v15;
  uint64_t v16;
  uint64_t *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
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
  void *v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
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
  BOOL v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSUInteger v93;
  CHTokenizedTextResult *v94;
  id v95;
  void *v96;
  _QWORD v97[3];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint8_t v102[128];
  uint8_t buf[4];
  NSUInteger v104;
  __int16 v105;
  uint64_t v106;
  uint64_t v107;

  length = a4.length;
  location = a4.location;
  v107 = *MEMORY[0x1E0C80C00];
  v95 = a3;
  v14 = (void (**)(id, uint64_t, uint64_t, _QWORD *))a5;
  v15 = location + length;
  if (location < location + length)
  {
    v16 = 0;
    v17 = &qword_1EF568000;
    v93 = v15;
    v94 = self;
    do
    {
      objc_msgSend_tokenColumns(self, v9, v10, v11, v12, v13, v93, v94);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v18, v19, location, v20, v21, v22);
      v96 = (void *)objc_claimAutoreleasedReturnValue();

      if (location >= objc_msgSend_length(v95, v23, v24, v25, v26, v27))
      {
        if (location >= objc_msgSend_length(v95, v28, v29, v30, v31, v32))
        {
          if (v17[465] != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v57 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
          {
            v73 = objc_msgSend_length(v95, v68, v69, v70, v71, v72);
            *(_DWORD *)buf = 134218240;
            v104 = location;
            v105 = 2048;
            v106 = v73;
            _os_log_impl(&dword_1BE607000, v57, OS_LOG_TYPE_FAULT, "Trying to access index %ld outside of path of length %ld. Skipping.", buf, 0x16u);
          }
          goto LABEL_24;
        }
      }
      else
      {
        v33 = objc_msgSend_indexAtPosition_(v95, v28, location, v30, v31, v32);
        objc_msgSend_textTokenRows(v96, v34, v35, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v33 < objc_msgSend_count(v39, v40, v41, v42, v43, v44);

        if (v45)
        {
          objc_msgSend_textTokenRows(v96, v46, v47, v48, v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v51, v52, v33, v53, v54, v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          v57 = v56;
          v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v98, (uint64_t)v102, 16, v59);
          if (v60)
          {
            v61 = 0;
            v62 = *(_QWORD *)v99;
            do
            {
              v63 = 0;
              v64 = v16;
              do
              {
                if (*(_QWORD *)v99 != v62)
                  objc_enumerationMutation(v57);
                v65 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * v63);
                v97[0] = location;
                v97[1] = v33;
                v97[2] = v61 + v63;
                v14[2](v14, v65, v16 + v63++, v97);
              }
              while (v60 != v63);
              v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v66, (uint64_t)&v98, (uint64_t)v102, 16, v67);
              v61 += v63;
              v16 += v63;
            }
            while (v60);
            v16 = v64 + v63;
            v15 = v93;
            self = v94;
            v17 = &qword_1EF568000;
          }

LABEL_24:
          goto LABEL_25;
        }
        objc_msgSend_textTokenRows(v96, v46, v47, v48, v49, v50);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v33 < objc_msgSend_count(v74, v75, v76, v77, v78, v79);

        if (!v80)
        {
          if (v17[465] != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v57 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend_textTokenRows(v96, v81, v82, v83, v84, v85);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = objc_msgSend_count(v86, v87, v88, v89, v90, v91);
            *(_DWORD *)buf = 134218240;
            v104 = v33;
            v105 = 2048;
            v106 = v92;
            _os_log_impl(&dword_1BE607000, v57, OS_LOG_TYPE_FAULT, "Trying to access index %ld outside of available tokenRows of length %ld. Skipping.", buf, 0x16u);

          }
          goto LABEL_24;
        }
      }
LABEL_25:

      ++location;
    }
    while (location != v15);
  }

}

- (BOOL)isEqualToTokenizedTextResult:(id)a3
{
  CHTokenizedTextResult *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHTokenizedTextResult *v10;
  NSArray *transcriptionPaths;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSArray *transcriptionPathScores;
  uint64_t v29;
  char isEqualToArray;
  NSArray *tokenColumns;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSArray *v37;
  NSArray *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v4 = (CHTokenizedTextResult *)a3;
  v10 = v4;
  if (self == v4)
  {
    isEqualToArray = 1;
    goto LABEL_14;
  }
  transcriptionPaths = self->_transcriptionPaths;
  objc_msgSend_transcriptionPaths(v4, v5, v6, v7, v8, v9);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (transcriptionPaths != v17)
  {
    v18 = self->_transcriptionPaths;
    objc_msgSend_transcriptionPaths(v10, v12, v13, v14, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = objc_msgSend_isEqualToArray_(v18, v20, (uint64_t)v19, v21, v22, v23);

    if (!(_DWORD)v18)
      goto LABEL_11;
    transcriptionPathScores = self->_transcriptionPathScores;
    v29 = (uint64_t)v10->_transcriptionPathScores;
    if (transcriptionPathScores == (NSArray *)v29)
      goto LABEL_9;
LABEL_8:
    if (objc_msgSend_isEqualToArray_(transcriptionPathScores, v24, v29, v25, v26, v27))
      goto LABEL_9;
LABEL_11:
    isEqualToArray = 0;
    goto LABEL_14;
  }

  transcriptionPathScores = self->_transcriptionPathScores;
  v29 = (uint64_t)v10->_transcriptionPathScores;
  if (transcriptionPathScores != (NSArray *)v29)
    goto LABEL_8;
LABEL_9:
  tokenColumns = self->_tokenColumns;
  objc_msgSend_tokenColumns(v10, v24, v29, v25, v26, v27);
  v37 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (tokenColumns == v37)
  {
    isEqualToArray = 1;
  }
  else
  {
    v38 = self->_tokenColumns;
    objc_msgSend_tokenColumns(v10, v32, v33, v34, v35, v36);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToArray = objc_msgSend_isEqualToArray_(v38, v40, (uint64_t)v39, v41, v42, v43);

  }
LABEL_14:

  return isEqualToArray;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToTokenizedTextResult;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToTokenizedTextResult = objc_msgSend_isEqualToTokenizedTextResult_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToTokenizedTextResult;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v7 = objc_msgSend_hash(self->_tokenColumns, a2, v2, v3, v4, v5);
  v13 = objc_msgSend_hash(self->_transcriptionPaths, v8, v9, v10, v11, v12);
  return v13 ^ v7 ^ objc_msgSend_hash(self->_transcriptionPathScores, v14, v15, v16, v17, v18);
}

+ (id)loadFromFile:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E0C99D50], a2, (uint64_t)a3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = objc_opt_class();
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, (uint64_t)v6, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (CHTokenizedTextResult)tokenizedTextResultWithString:(id)a3 strokeIndexes:(id)a4 bounds:(CGRect)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7 defaultTokenScores:(double)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  _QWORD v27[16];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = (void *)objc_opt_class();
  v20 = *MEMORY[0x1E0C9D628];
  v21 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 8);
  v22 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
  v23 = *(_QWORD *)(MEMORY[0x1E0C9D538] + 8);
  v27[0] = *MEMORY[0x1E0C9D538];
  v27[1] = v23;
  v27[2] = v27[0];
  v27[3] = v23;
  v27[4] = v27[0];
  v27[5] = v23;
  v27[6] = v27[0];
  v27[7] = v23;
  v27[8] = v27[0];
  v27[9] = v23;
  v27[10] = v27[0];
  v27[11] = v23;
  v27[12] = v27[0];
  v27[13] = v23;
  v27[14] = v27[0];
  v27[15] = v23;
  objc_msgSend_tokenizedTextResultWithString_strokeIndexes_bounds_trailingSeparator_recognizerGenerationIdentifier_defaultTokenScores_originalBounds_principalLines_(v19, v24, (uint64_t)v16, (uint64_t)v17, (uint64_t)v18, a7, v27, x, y, width, height, a8, v20, v21, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return (CHTokenizedTextResult *)v25;
}

+ (CHTokenizedTextResult)tokenizedTextResultWithString:(id)a3 strokeIndexes:(id)a4 bounds:(CGRect)a5 trailingSeparator:(id)a6 recognizerGenerationIdentifier:(int64_t)a7 defaultTokenScores:(double)a8 originalBounds:(CGRect)a9 principalLines:(id *)a10
{
  double width;
  double y;
  double x;
  id v18;
  CHTokenizedTextResultToken *v19;
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
  uint64_t v30;
  CGPoint var1;
  CGPoint v32;
  CGPoint v33;
  CGPoint v34;
  const char *v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  CHTokenizedResultColumn *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  CHTokenizedTextResult *v78;
  const char *v79;
  void *v80;
  double height;
  id v83;
  id v84;
  _OWORD v85[8];
  void *v86;
  _QWORD v87[3];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v87[1] = *MEMORY[0x1E0C80C00];
  v84 = a3;
  v18 = a4;
  v83 = a6;
  v19 = [CHTokenizedTextResultToken alloc];
  objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v20, (uint64_t)&stru_1E77F6F28, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_count(v18, v25, v26, v27, v28, v29);
  var1 = a10->var2.var1;
  v85[4] = a10->var2.var0;
  v85[5] = var1;
  v32 = a10->var3.var1;
  v85[6] = a10->var3.var0;
  v85[7] = v32;
  v33 = a10->var0.var1;
  v85[0] = a10->var0.var0;
  v85[1] = v33;
  v34 = a10->var1.var1;
  v85[2] = a10->var1.var0;
  v85[3] = v34;
  v36 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v19, v35, (uint64_t)v84, (uint64_t)v18, 0, 4, v24, 4, a8, a8, a8, a8, x, y, width, height, v30, *(_QWORD *)&a9.origin.x, *(_QWORD *)&a9.origin.y,
                  *(_QWORD *)&a9.size.width,
                  *(_QWORD *)&a9.size.height,
                  v85);

  v37 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v38, (uint64_t)v36, v39, v40, v41, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObjects_(v37, v43, (uint64_t)v42, v44, v45, v46, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = [CHTokenizedResultColumn alloc];
  v53 = (void *)objc_msgSend_initWithTokenRows_(v48, v49, (uint64_t)v47, v50, v51, v52);
  objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v54, (uint64_t)v53, v55, v56, v57, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_indexPathWithIndex_(MEMORY[0x1E0CB36B0], v59, 0, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v63;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v64, (uint64_t)v87, 1, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v68, v69, v70, v71, v72, a8);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v73;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v74, (uint64_t)&v86, 1, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = [CHTokenizedTextResult alloc];
  v80 = (void *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_(v78, v79, (uint64_t)v58, (uint64_t)v67, (uint64_t)v77, (uint64_t)v83, a7);

  return (CHTokenizedTextResult *)v80;
}

+ (BOOL)areTokenRowsEquivalent:(id)a3 otherRow:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
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
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __CFString *v61;
  uint64_t v62;
  void *v63;
  void *v64;
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
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char isEqualToIndexSet;
  id v96;
  id obj;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v96 = a4;
  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v6, v7, v8, v9, v10, v5);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = v5;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v103, (uint64_t)v108, 16, v12);
  if (v18)
  {
    v19 = *(_QWORD *)v104;
    v20 = &stru_1E77F6F28;
    do
    {
      v21 = 0;
      v22 = v20;
      do
      {
        if (*(_QWORD *)v104 != v19)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v21);
        if ((objc_msgSend_properties(v23, v13, v14, v15, v16, v17) & 0x20) != 0)
        {
          objc_msgSend_stringByAppendingString_(v22, v24, (uint64_t)CFSTR(" "), v26, v27, v28);
          v29 = objc_claimAutoreleasedReturnValue();

          v22 = (void *)v29;
        }
        objc_msgSend_string(v23, v24, v25, v26, v27, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v22, v31, (uint64_t)v30, v32, v33, v34);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_strokeIndexes(v23, v35, v36, v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addIndexes_(v98, v41, (uint64_t)v40, v42, v43, v44);

        ++v21;
        v22 = v20;
      }
      while (v18 != v21);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v103, (uint64_t)v108, 16, v17);
    }
    while (v18);
  }
  else
  {
    v20 = &stru_1E77F6F28;
  }

  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v45, v46, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v51 = v96;
  v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v99, (uint64_t)v107, 16, v53);
  if (v59)
  {
    v60 = *(_QWORD *)v100;
    v61 = &stru_1E77F6F28;
    do
    {
      v62 = 0;
      v63 = v61;
      do
      {
        if (*(_QWORD *)v100 != v60)
          objc_enumerationMutation(v51);
        v64 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v62);
        if ((objc_msgSend_properties(v64, v54, v55, v56, v57, v58) & 0x20) != 0)
        {
          objc_msgSend_stringByAppendingString_(v63, v65, (uint64_t)CFSTR(" "), v67, v68, v69);
          v70 = objc_claimAutoreleasedReturnValue();

          v63 = (void *)v70;
        }
        objc_msgSend_string(v64, v65, v66, v67, v68, v69);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v63, v72, (uint64_t)v71, v73, v74, v75);
        v61 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_strokeIndexes(v64, v76, v77, v78, v79, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addIndexes_(v50, v82, (uint64_t)v81, v83, v84, v85);

        ++v62;
        v63 = v61;
      }
      while (v59 != v62);
      v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v54, (uint64_t)&v99, (uint64_t)v107, 16, v58);
    }
    while (v59);
  }
  else
  {
    v61 = &stru_1E77F6F28;
  }

  if (objc_msgSend_isEqualToString_(v20, v86, (uint64_t)v61, v87, v88, v89))
    isEqualToIndexSet = objc_msgSend_isEqualToIndexSet_(v98, v90, (uint64_t)v50, v91, v92, v93);
  else
    isEqualToIndexSet = 0;

  return isEqualToIndexSet;
}

+ (int64_t)mergeTokenRow:(id)a3 intoUniqueRows:(id)a4
{
  id v5;
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
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
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
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  double v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  double v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  double v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  double v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t j;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  unint64_t k;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  int isEquivalentToToken;
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
  int v209;
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
  int hasValidPrincipalLines;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  int v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  int v242;
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
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  double v258;
  double v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  double v270;
  _BOOL4 v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  void *v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  char isTopOriginal;
  id v291;
  double v292;
  double v293;
  double v294;
  double v295;
  uint64_t v296;
  void *v297;
  uint64_t v298;
  id obj;
  id obja;
  _OWORD v301[8];
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  _BYTE v306[128];
  uint64_t v307;

  v307 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v291 = a4;
  obj = v5;
  if (objc_msgSend_count(v5, v6, v7, v8, v9, v10))
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v11, 0, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    isTopOriginal = objc_msgSend_isTopOriginal(v16, v17, v18, v19, v20, v21);

    v27 = 1;
    while (v27 < objc_msgSend_count(obj, v22, v23, v24, v25, v26))
    {
      objc_msgSend_objectAtIndexedSubscript_(obj, v11, v27, v13, v14, v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend_isTopOriginal(v28, v29, v30, v31, v32, v33);
      v35 = isTopOriginal & 1;
      isTopOriginal &= v34;

      ++v27;
      if (v35 != v34)
      {
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v22, v23, v24, v25, v26);
        v297 = (void *)objc_claimAutoreleasedReturnValue();
        v304 = 0u;
        v305 = 0u;
        v302 = 0u;
        v303 = 0u;
        obja = obj;
        v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v36, (uint64_t)&v302, (uint64_t)v306, 16, v37);
        if (v38)
        {
          v296 = *(_QWORD *)v303;
          do
          {
            v298 = v38;
            for (i = 0; i != v298; ++i)
            {
              if (*(_QWORD *)v303 != v296)
                objc_enumerationMutation(obja);
              v45 = *(void **)(*((_QWORD *)&v302 + 1) + 8 * i);
              if (objc_msgSend_isTopOriginal(v45, v39, v40, v41, v42, v43))
              {
                objc_msgSend_string(v45, v46, v47, v48, v49, v50);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_strokeIndexes(v45, v52, v53, v54, v55, v56);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = objc_msgSend_wordID(v45, v58, v59, v60, v61, v62);
                objc_msgSend_modelScore(v45, v64, v65, v66, v67, v68);
                v70 = v69;
                objc_msgSend_recognitionScore(v45, v71, v72, v73, v74, v75);
                v77 = v76;
                objc_msgSend_combinedScore(v45, v78, v79, v80, v81, v82);
                v84 = v83;
                objc_msgSend_alignmentScore(v45, v85, v86, v87, v88, v89);
                v91 = v90;
                v97 = objc_msgSend_properties(v45, v92, v93, v94, v95, v96);
                objc_msgSend_recognizerSourceLocale(v45, v98, v99, v100, v101, v102);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                v292 = v91;
                v293 = v84;
                v294 = v77;
                v295 = v70;
                v109 = objc_msgSend_inputSources(v45, v104, v105, v106, v107, v108);
                v115 = objc_msgSend_substrokeCount(v45, v110, v111, v112, v113, v114);
                objc_msgSend_bounds(v45, v116, v117, v118, v119, v120);
                v122 = v121;
                v124 = v123;
                v126 = v125;
                v128 = v127;
                objc_msgSend_originalBounds(v45, v129, v130, v131, v132, v133);
                v140 = v139;
                v142 = v141;
                v144 = v143;
                v146 = v145;
                if (v45)
                  objc_msgSend_principalLines(v45, v134, v135, v136, v137, v138);
                else
                  memset(v301, 0, sizeof(v301));
                objc_msgSend_tokenWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(CHTokenizedTextResultToken, v134, (uint64_t)v51, (uint64_t)v57, v63, v97, v103, v109, v295, v294, v293, v292, v122, v124, v126, v128, v115, v140, v142,
                  v144,
                  v146,
                  v301);
                v147 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_addObject_(v297, v148, (uint64_t)v147, v149, v150, v151);
              }
              else
              {
                objc_msgSend_addObject_(v297, v46, (uint64_t)v45, v48, v49, v50);
              }
            }
            v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v39, (uint64_t)&v302, (uint64_t)v306, 16, v43);
          }
          while (v38);
        }

        obj = v297;
        break;
      }
    }
  }
  else
  {
    isTopOriginal = 1;
  }
  for (j = 0; ; ++j)
  {
    if (j >= objc_msgSend_count(v291, v11, v12, v13, v14, v15))
      goto LABEL_51;
    objc_msgSend_objectAtIndexedSubscript_(v291, v153, j, v154, v155, v156);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_areTokenRowsEquivalent_otherRow_(CHTokenizedTextResult, v158, (uint64_t)obj, (uint64_t)v157, v159, v160))goto LABEL_22;
    v166 = objc_msgSend_count(v157, v161, v162, v163, v164, v165);
    if (v166 == objc_msgSend_count(obj, v167, v168, v169, v170, v171))
      break;
    if ((isTopOriginal & 1) == 0)
    {
      if (j != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_50;
LABEL_22:

      continue;
    }
    sub_1BE745D84((uint64_t)CHTokenizedTextResult, v157);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_atIndexedSubscript_(v291, v276, (uint64_t)v182, j, v277, v278);
LABEL_43:

LABEL_45:
    if (((j != 0x7FFFFFFFFFFFFFFFLL) & isTopOriginal) == 1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v291, v184, j, v185, v186, v187);
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BE745D84((uint64_t)CHTokenizedTextResult, v279);
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_atIndexedSubscript_(v291, v281, (uint64_t)v280, j, v282, v283);

      goto LABEL_52;
    }

    if (j != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_52;
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v172, v173, v174, v175, v176);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  for (k = 0; k < objc_msgSend_count(obj, v177, v178, v179, v180, v181); ++k)
  {
    objc_msgSend_objectAtIndexedSubscript_(obj, v184, k, v185, v186, v187);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v157, v189, k, v190, v191, v192);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    isEquivalentToToken = objc_msgSend_isEquivalentToToken_(v188, v194, (uint64_t)v193, v195, v196, v197);

    if (!isEquivalentToToken)
      goto LABEL_43;
    objc_msgSend_objectAtIndexedSubscript_(obj, v199, k, v200, v201, v202);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v209 = objc_msgSend_isTopOriginal(v203, v204, v205, v206, v207, v208);

    objc_msgSend_objectAtIndexedSubscript_(obj, v210, k, v211, v212, v213);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    hasValidPrincipalLines = objc_msgSend_hasValidPrincipalLines(v214, v215, v216, v217, v218, v219);

    objc_msgSend_objectAtIndexedSubscript_(v157, v221, k, v222, v223, v224);
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    v231 = objc_msgSend_isTopOriginal(v225, v226, v227, v228, v229, v230);

    objc_msgSend_objectAtIndexedSubscript_(v157, v232, k, v233, v234, v235);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = objc_msgSend_hasValidPrincipalLines(v236, v237, v238, v239, v240, v241);

    if (v209 != v231)
    {
      if (v209)
        goto LABEL_32;
LABEL_38:
      objc_msgSend_objectAtIndexedSubscript_(v157, v243, k, v244, v245, v246);
      goto LABEL_33;
    }
    objc_msgSend_objectAtIndexedSubscript_(obj, v243, k, v244, v245, v246);
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_combinedScore(v252, v253, v254, v255, v256, v257);
    v259 = v258;
    objc_msgSend_objectAtIndexedSubscript_(v157, v260, k, v261, v262, v263);
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_combinedScore(v264, v265, v266, v267, v268, v269);
    v271 = v259 > v270;

    if (!v271)
    {
      if (((hasValidPrincipalLines ^ 1 | v242) & 1) != 0)
        goto LABEL_38;
LABEL_32:
      objc_msgSend_objectAtIndexedSubscript_(obj, v243, k, v244, v245, v246);
LABEL_33:
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v182, v248, (uint64_t)v247, v249, v250, v251);
      goto LABEL_40;
    }
    objc_msgSend_objectAtIndexedSubscript_(obj, v243, k, v244, v245, v246);
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v182, v272, (uint64_t)v247, v273, v274, v275);
LABEL_40:

  }
  if (!v182)
    goto LABEL_45;
  objc_msgSend_setObject_atIndexedSubscript_(v291, v184, (uint64_t)v182, j, v186, v187);

LABEL_50:
  if (j == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_51:
    objc_msgSend_addObject_(v291, v153, (uint64_t)obj, v154, v155, v156);
    j = objc_msgSend_count(v291, v284, v285, v286, v287, v288) - 1;
  }
LABEL_52:

  return j;
}

+ (id)extendedToken:(id)a3 withStrokeIndexSet:(id)a4 alignmentScore:(double)a5 bounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  id v14;
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
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CHTokenizedTextResultToken *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
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
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  void *v89;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a3;
  v13 = a4;
  v14 = objc_alloc(MEMORY[0x1E0CB3788]);
  objc_msgSend_strokeIndexes(v12, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend_initWithIndexSet_(v14, v21, (uint64_t)v20, v22, v23, v24);

  objc_msgSend_addIndexes_(v25, v26, (uint64_t)v13, v27, v28, v29);
  v30 = [CHTokenizedTextResultToken alloc];
  objc_msgSend_string(v12, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_wordID(v12, v37, v38, v39, v40, v41);
  objc_msgSend_modelScore(v12, v43, v44, v45, v46, v47);
  v49 = v48;
  objc_msgSend_recognitionScore(v12, v50, v51, v52, v53, v54);
  v56 = v55;
  objc_msgSend_combinedScore(v12, v57, v58, v59, v60, v61);
  v63 = v62;
  v69 = objc_msgSend_properties(v12, v64, v65, v66, v67, v68);
  objc_msgSend_recognizerSourceLocale(v12, v70, v71, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend_inputSources(v12, v76, v77, v78, v79, v80);
  v87 = objc_msgSend_count(v25, v82, v83, v84, v85, v86);
  v89 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v30, v88, (uint64_t)v36, (uint64_t)v25, v42, v69, v75, v81, v49, v56, v63, a5, x, y, width, height, v87);

  return v89;
}

- (id)phraseCaseCorrectedResultWithHistory:(id)a3 phraseLexicon:(_LXLexicon *)a4 maxPhraseLength:(int64_t)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSUInteger v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSUInteger v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  BOOL v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  const char *v137;
  uint64_t v138;
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
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
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
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  void *v195;
  void *v196;
  __CFString *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  uint64_t v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  int64_t v244;
  uint64_t v245;
  int64_t changeableCount;
  CHTokenizedTextResult *v247;
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
  uint64_t v258;
  uint64_t v259;
  const char *v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  const char *v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t i;
  uint64_t v281;
  void *v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  id v289;
  const char *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  CHMutableTokenizedTextResult *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  void *v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  const char *v320;
  uint64_t v321;
  id v323;
  id v324;
  id v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  id v331;
  void *v332;
  NSString *v333;
  void *v334;
  __CFString *v335;
  void *v336;
  id v337;
  id obj;
  void *v339;
  CHTokenizedTextResult *v340;
  _QWORD v341[4];
  id v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  _QWORD v347[4];
  __CFString *v348;
  id v349;
  id v350;
  id v351;
  _QWORD *v352;
  uint64_t *v353;
  uint64_t *v354;
  uint64_t *v355;
  uint64_t *v356;
  uint64_t *v357;
  uint64_t v358;
  BOOL v359;
  _QWORD v360[4];
  uint64_t v361;
  uint64_t *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t *v366;
  uint64_t v367;
  uint64_t (*v368)(uint64_t, uint64_t);
  void (*v369)(uint64_t);
  id v370;
  uint64_t v371;
  uint64_t *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t *v380;
  uint64_t v381;
  __n128 (*v382)(__n128 *, __n128 *);
  void (*v383)(uint64_t);
  void *v384;
  void *__p;
  char *v386;
  char *v387;
  uint64_t v388;
  _BYTE v389[128];
  uint64_t v390;
  _NSRange v391;
  _NSRange v392;

  v390 = *MEMORY[0x1E0C80C00];
  v335 = (__CFString *)a3;
  if (objc_msgSend_tokenColumnCount(self, v8, v9, v10, v11, v12) && self->_transcriptionPaths)
  {
    v18 = v335;
    if (!v335)
      v18 = &stru_1E77F6F28;
    v335 = v18;
    objc_msgSend_precedingSeparatorForTopTranscriptionPath(self, v13, v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(v18, v20, (uint64_t)v19, v21, v22, v23);
    v334 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_topTranscription(self, v24, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(v334, v30, (uint64_t)v29, v31, v32, v33);
    v333 = (NSString *)objc_claimAutoreleasedReturnValue();

    v39 = objc_msgSend_length(v18, v34, v35, v36, v37, v38);
    v45 = objc_msgSend_length(v18, v40, v41, v42, v43, v44);
    v51 = objc_msgSend_length(v333, v46, v47, v48, v49, v50);
    v57 = objc_msgSend_length(v18, v52, v53, v54, v55, v56);
    v388 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend_firstObject(self->_transcriptionPaths, v58, v59, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend_tokenColumnCount(self, v64, v65, v66, v67, v68);
    objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(self, v70, (uint64_t)v63, 0, v69 - 1, 0);
    v327 = (void *)objc_claimAutoreleasedReturnValue();

    v76 = objc_msgSend_length(v334, v71, v72, v73, v74, v75);
    v82 = objc_msgSend_length(v327, v77, v78, v79, v80, v81);
    if (a4)
    {
      v392.length = v51 - v57;
      v391.location = 0;
      v391.length = v39;
      v392.location = v45;
      phraseMatchingCandidates(v333, a4, v391, v392, a5, v82 + v76, &v388);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v88 = 0;
    }
    v329 = v88;
    v89 = objc_msgSend_count(v88, v83, v84, v85, v86, v87);
    v90 = v89;
    v91 = v89 != 0;
    if (v388 != 0x7FFFFFFFFFFFFFFFLL || v89)
    {
      -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)self);
      v326 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(self, v92, v93, v94, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend_indexOfObjectIdenticalTo_(v97, v98, (uint64_t)v326, v99, v100, v101);

      v379 = 0;
      v380 = &v379;
      v381 = 0x4812000000;
      v382 = sub_1BE747960;
      v383 = sub_1BE747984;
      v384 = &unk_1BE94989A;
      v112 = objc_msgSend_length(v326, v103, v104, v105, v106, v107);
      __p = 0;
      v386 = 0;
      v387 = 0;
      if (v112)
      {
        if (v112 >> 61)
          sub_1BE61F930();
        v113 = (char *)operator new(8 * v112);
        __p = v113;
        v387 = &v113[8 * v112];
        bzero(v113, 8 * v112);
        v386 = &v113[8 * v112];
      }
      objc_msgSend_getIndexes_(v326, v108, v380[6], v109, v110, v111);
      v376 = &v375;
      v377 = 0x2020000000;
      v378 = 0;
      v371 = 0;
      v372 = &v371;
      v373 = 0x2020000000;
      v374 = -1;
      v375 = 0;
      v365 = 0;
      v366 = &v365;
      v367 = 0x3032000000;
      v368 = sub_1BE74350C;
      v369 = sub_1BE74351C;
      v370 = 0;
      v361 = 0;
      v362 = &v361;
      v364 = 0x7FFFFFFFFFFFFFFFLL;
      v363 = 0x2020000000;
      if (v90)
      {
        v119 = objc_msgSend_mutableCopy(self->_transcriptionPaths, v114, v115, v116, v117, v118);
        v332 = (void *)objc_msgSend_mutableCopy(self->_transcriptionPathScores, v120, v121, v122, v123, v124);
        v125 = (void *)MEMORY[0x1E0C99DE8];
        v131 = objc_msgSend_count(self->_tokenColumns, v126, v127, v128, v129, v130);
        objc_msgSend_arrayWithCapacity_(v125, v132, v131, v133, v134, v135);
        v328 = (void *)v119;
        v136 = 0;
        v336 = (void *)objc_claimAutoreleasedReturnValue();
        while (v136 < objc_msgSend_count(self->_tokenColumns, v137, v138, v139, v140, v141))
        {
          objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v142, v136, v144, v145, v146);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          v153 = (void *)objc_msgSend_mutableCopy(v147, v148, v149, v150, v151, v152);
          objc_msgSend_addObject_(v336, v154, (uint64_t)v153, v155, v156, v157);

          ++v136;
        }
        objc_msgSend_allKeys(v329, v142, v143, v144, v145, v146);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sortedArrayUsingSelector_(v158, v159, (uint64_t)sel_compare_, v160, v161, v162);
        v330 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectAtIndexedSubscript_(v330, v163, v376[3], v164, v165, v166);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v173 = objc_msgSend_integerValue(v167, v168, v169, v170, v171, v172);
        v372[3] = v173;

        objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v174, v372[3], v175, v176, v177);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v329, v179, (uint64_t)v178, v180, v181, v182);
        v183 = objc_claimAutoreleasedReturnValue();
        v184 = (void *)v366[5];
        v366[5] = v183;

        if (objc_msgSend_hasPrefix_((void *)v366[5], v185, (uint64_t)CFSTR(" "), v186, v187, v188))
        {
          objc_msgSend_substringFromIndex_((void *)v366[5], v189, 1, v190, v191, v192);
          v193 = objc_claimAutoreleasedReturnValue();
          v194 = (void *)v366[5];
          v366[5] = v193;

          ++v372[3];
        }
        v195 = v336;
        v196 = v330;
      }
      else
      {
        v328 = 0;
        v332 = 0;
        v195 = 0;
        v196 = 0;
      }
      v360[0] = 0;
      v360[1] = v360;
      v360[2] = 0x2020000000;
      v360[3] = 0;
      v347[0] = MEMORY[0x1E0C809B0];
      v347[1] = 3221225472;
      v347[2] = sub_1BE74799C;
      v347[3] = &unk_1E77F4900;
      v352 = v360;
      v197 = v335;
      v358 = v388;
      v348 = v197;
      v353 = &v361;
      v354 = &v371;
      v359 = v91;
      v355 = &v365;
      v337 = v195;
      v349 = v337;
      v356 = &v379;
      v357 = &v375;
      v331 = v196;
      v350 = v331;
      v351 = v329;
      objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(self, v198, (uint64_t)v347, v199, v200, v201);
      if (v90)
      {
        objc_msgSend_indexPathWithIndexes_length_(MEMORY[0x1E0CB36B0], v202, v380[6], (v380[7] - v380[6]) >> 3, v205, v206);
        v210 = (void *)objc_claimAutoreleasedReturnValue();
        if (v102 && v102 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend_setObject_atIndexedSubscript_(v328, v207, (uint64_t)v210, v102, v208, v209);
        }
        else
        {
          if (v102 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v211 = 1;
            objc_msgSend_insertObject_atIndex_(v328, v207, (uint64_t)v210, 1, v208, v209);
          }
          else
          {
            v211 = v102 + 1;
            objc_msgSend_insertObject_atIndex_(v328, v207, (uint64_t)v210, v102 + 1, v208, v209);
          }
          objc_msgSend_transcriptionPathScores(self, v212, v213, v214, v215, v216);
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v217, v218, v219, v220, v221, v222);
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_insertObject_atIndex_(v332, v224, (uint64_t)v223, v211, v225, v226);

        }
        v325 = v337;
        v323 = v328;
        v324 = v332;

      }
      else
      {
        objc_msgSend_tokenColumns(self, v202, v203, v204, v205, v206);
        v227 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPaths(self, v228, v229, v230, v231, v232);
        v233 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPathScores(self, v234, v235, v236, v237, v238);
        v324 = (id)objc_claimAutoreleasedReturnValue();
        v323 = (id)v233;
        v325 = (id)v227;
      }
      if (v362[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v244 = 1;
      }
      else
      {
        v245 = objc_msgSend_count(v325, v239, v240, v241, v242, v243);
        v244 = v245 - v362[3];
      }
      if (v244 <= self->_changeableCount)
        changeableCount = self->_changeableCount;
      else
        changeableCount = v244;
      v247 = [CHTokenizedTextResult alloc];
      objc_msgSend_trailingSeparator(self, v248, v249, v250, v251, v252);
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      v259 = objc_msgSend_recognizerGenerationIdentifier(self, v254, v255, v256, v257, v258);
      v340 = (CHTokenizedTextResult *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(v247, v260, (uint64_t)v325, (uint64_t)v323, (uint64_t)v324, (uint64_t)v253, v259, changeableCount);

      if (v90)
      {
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v261, v262, v263, v264, v265);
        v339 = (void *)objc_claimAutoreleasedReturnValue();
        v345 = 0u;
        v346 = 0u;
        v343 = 0u;
        v344 = 0u;
        objc_msgSend_transcriptionPaths(v340, v266, v267, v268, v269, v270);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v278 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v271, (uint64_t)&v343, (uint64_t)v389, 16, v272);
        if (v278)
        {
          v279 = *(_QWORD *)v344;
          do
          {
            for (i = 0; i != v278; ++i)
            {
              if (*(_QWORD *)v344 != v279)
                objc_enumerationMutation(obj);
              v281 = *(_QWORD *)(*((_QWORD *)&v343 + 1) + 8 * i);
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v273, v274, v275, v276, v277);
              v282 = (void *)objc_claimAutoreleasedReturnValue();
              v288 = objc_msgSend_tokenColumnCount(v340, v283, v284, v285, v286, v287);
              v341[0] = MEMORY[0x1E0C809B0];
              v341[1] = 3221225472;
              v341[2] = sub_1BE7481A8;
              v341[3] = &unk_1E77F4928;
              v289 = v282;
              v342 = v289;
              objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v340, v290, v281, 0, v288, (uint64_t)v341);
              objc_msgSend_addObject_(v339, v291, (uint64_t)v289, v292, v293, v294);

            }
            v278 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v273, (uint64_t)&v343, (uint64_t)v389, 16, v277);
          }
          while (v278);
        }

        v295 = [CHMutableTokenizedTextResult alloc];
        objc_msgSend_transcriptionPathScores(v340, v296, v297, v298, v299, v300);
        v301 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_trailingSeparator(v340, v302, v303, v304, v305, v306);
        v307 = (void *)objc_claimAutoreleasedReturnValue();
        v313 = objc_msgSend_recognizerGenerationIdentifier(v340, v308, v309, v310, v311, v312);
        v319 = objc_msgSend_changeableTokenColumnCount(v340, v314, v315, v316, v317, v318);
        v321 = objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(v295, v320, (uint64_t)v339, (uint64_t)v301, (uint64_t)v307, v313, v319);

        v340 = (CHTokenizedTextResult *)v321;
      }

      _Block_object_dispose(v360, 8);
      _Block_object_dispose(&v361, 8);
      _Block_object_dispose(&v365, 8);

      _Block_object_dispose(&v371, 8);
      _Block_object_dispose(&v375, 8);

      _Block_object_dispose(&v379, 8);
      if (__p)
      {
        v386 = (char *)__p;
        operator delete(__p);
      }

    }
    else
    {
      v340 = self;
    }

  }
  else
  {
    v340 = self;
  }

  return v340;
}

- (id)changeableColumnCountUpdatedResultWithHistory:(id)a3 phraseLexicon:(_LXLexicon *)a4 maxPhraseLength:(int64_t)a5
{
  __CFString *v8;
  CHTokenizedTextResult *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSUInteger v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSUInteger v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
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
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  CHTokenizedTextResult *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  CHTokenizedTextResult *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v124;
  NSString *v125;
  _QWORD v126[4];
  __CFString *v127;
  _QWORD *v128;
  uint64_t *v129;
  uint64_t v130;
  _QWORD v131[4];
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  _NSRange v137;
  _NSRange v138;

  v8 = (__CFString *)a3;
  v9 = self;
  if (objc_msgSend_tokenColumnCount(v9, v10, v11, v12, v13, v14) && a4 && a5 && v9->_transcriptionPaths)
  {
    if (!v8)
      v8 = &stru_1E77F6F28;
    objc_msgSend_precedingSeparatorForTopTranscriptionPath(v9, v15, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(v8, v21, (uint64_t)v20, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v124 = v25;
    objc_msgSend_topTranscription(v9, v26, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(v25, v32, (uint64_t)v31, v33, v34, v35);
    v125 = (NSString *)objc_claimAutoreleasedReturnValue();

    v41 = objc_msgSend_length(v8, v36, v37, v38, v39, v40);
    v47 = objc_msgSend_length(v8, v42, v43, v44, v45, v46);
    v53 = objc_msgSend_length(v125, v48, v49, v50, v51, v52);
    v59 = objc_msgSend_length(v8, v54, v55, v56, v57, v58);
    v136 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend_firstObject(v9->_transcriptionPaths, v60, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend_tokenColumnCount(v9, v66, v67, v68, v69, v70);
    objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v9, v72, (uint64_t)v65, 0, v71 - 1, 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = objc_msgSend_length(v124, v74, v75, v76, v77, v78);
    v85 = objc_msgSend_length(v73, v80, v81, v82, v83, v84);
    v138.length = v53 - v59;
    v137.location = 0;
    v137.length = v41;
    v138.location = v47;
    v86 = phraseMatchingCandidates(v125, a4, v137, v138, a5, v85 + v79, &v136);
    if (v136 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v132 = 0;
      v133 = &v132;
      v134 = 0x2020000000;
      v135 = 0x7FFFFFFFFFFFFFFFLL;
      v131[0] = 0;
      v131[1] = v131;
      v131[2] = 0x2020000000;
      v131[3] = 0;
      v126[0] = MEMORY[0x1E0C809B0];
      v126[1] = 3221225472;
      v126[2] = sub_1BE7485D8;
      v126[3] = &unk_1E77F4950;
      v128 = v131;
      v129 = &v132;
      v130 = v136;
      v127 = v8;
      objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v9, v87, (uint64_t)v126, v88, v89, v90);
      if (v133[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v96 = 1;
      }
      else
      {
        v98 = objc_msgSend_tokenColumnCount(v9, v91, v92, v93, v94, v95);
        v96 = v98 - v133[3];
      }
      if (objc_msgSend_changeableTokenColumnCount(v9, v91, v92, v93, v94, v95) > v96)
        v96 = objc_msgSend_changeableTokenColumnCount(v9, v99, v100, v101, v102, v103);
      if (v96 != objc_msgSend_changeableTokenColumnCount(v9, v99, v100, v101, v102, v103))
      {
        v109 = (void *)objc_msgSend_mutableCopy(v9, v104, v105, v106, v107, v108);
        objc_msgSend_setChangeableTokenColumnCount_(v109, v110, v96, v111, v112, v113);
        v114 = v109;

        objc_msgSend_setInputStrokeIdentifiers_(v114, v115, (uint64_t)v9->_inputStrokeIdentifiers, v116, v117, v118);
        objc_msgSend_setLocale_(v114, v119, (uint64_t)v9->_locale, v120, v121, v122);

        v9 = v114;
      }

      _Block_object_dispose(v131, 8);
      _Block_object_dispose(&v132, 8);
    }
    v97 = v9;

  }
  else
  {
    v97 = v9;
  }

  return v97;
}

+ (id)tokenizedTextResultFromResults:(id)a3 shouldPerformStrictFiltering:(BOOL)a4 doesTopLocaleRequireSpecialHandling:(BOOL)a5 hasSwap:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
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
  uint64_t v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v70;
  double v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
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
  double v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
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
  BOOL v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char isEqualToString;
  void *v157;
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
  uint64_t v168;
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
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  id v185;
  const char *v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  int v194;
  uint64_t v195;
  uint64_t k;
  unint64_t v197;
  BOOL v198;
  int v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  id v231;
  const char *v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  char isTopOriginal;
  uint64_t j;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
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
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
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
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  CHTokenizedTextResult *v289;
  const char *v290;
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
  void *v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  const char *v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  void *v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  const char *v323;
  void *v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  id v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  int v334;
  void *v335;
  void *v336;
  unint64_t i;
  void *v338;
  void *v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  _QWORD v348[4];
  id v349;
  _BYTE v350[128];
  _BYTE v351[128];
  _QWORD v352[6];

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v352[4] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (objc_msgSend_count(v9, v10, v11, v12, v13, v14))
  {
    objc_msgSend_objectAtIndexedSubscript_(v9, v15, 0, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIndexes(v19, v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v348[0] = MEMORY[0x1E0C809B0];
    v348[1] = 3221225472;
    v348[2] = sub_1BE7491D4;
    v348[3] = &unk_1E77F4978;
    v329 = v25;
    v349 = v329;
    objc_msgSend_indexesOfObjectsPassingTest_(v9, v26, (uint64_t)v348, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectsAtIndexes_(v9, v31, (uint64_t)v30, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v330 = v35;
    if (objc_msgSend_count(v35, v36, v37, v38, v39, v40) == 1 || v8)
    {
      objc_msgSend_firstObject(v35, v41, v42, v43, v44, v45);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (void *)objc_msgSend_copy(v63, v64, v65, v66, v67, v68);

    }
    else
    {
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v41, v42, v43, v44, v45);
      v333 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v46, v47, v48, v49, v50);
      v332 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v331 = 0;
        if ((unint64_t)objc_msgSend_count(v35, v51, v52, v53, v54, v55) >= 2 && v7)
        {
          objc_msgSend_objectAtIndexedSubscript_(v35, v51, 1, v53, v54, v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_rawTranscription(v56, v57, v58, v59, v60, v61);
          v331 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v331 = 0;
      }
      v70 = 0;
      v334 = v7 && v6;
      v71 = 1.0;
      while (v70 < objc_msgSend_count(v330, v51, v52, v53, v54, v55))
      {
        objc_msgSend_objectAtIndexedSubscript_(v330, v72, v70, v73, v74, v75);
        v339 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPaths(v339, v76, v77, v78, v79, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v81, v82, v83, v84, v85, v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = sub_1BE742A90(v339, v87);

        if (objc_msgSend_count(v333, v89, v90, v91, v92, v93))
        {
          if (v88 < fmax(v71 * 0.8, 0.5))
          {

            break;
          }
        }
        else
        {
          v71 = v88;
        }
        objc_msgSend_transcriptionPaths(v339, v94, v95, v96, v97, v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v99, v100, v101, v102, v103, v104);
        v336 = (void *)objc_claimAutoreleasedReturnValue();

        for (i = 0; ; ++i)
        {
          objc_msgSend_transcriptionPaths(v339, v105, v106, v107, v108, v109);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v116 = i < objc_msgSend_count(v110, v111, v112, v113, v114, v115);

          if (!v116)
            break;
          objc_msgSend_transcriptionPaths(v339, v117, v118, v119, v120, v121);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v122, v123, i, v124, v125, v126);
          v127 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_array(MEMORY[0x1E0C99DE8], v128, v129, v130, v131, v132);
          v338 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_transcriptionPaths(v339, v133, v134, v135, v136, v137);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v138, v139, i, v140, v141, v142);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = objc_msgSend_length(v143, v144, v145, v146, v147, v148);
          objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v339, v150, (uint64_t)v127, 0, v149, 0);
          v335 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v334)
            goto LABEL_38;
          isEqualToString = 0;
          if (!v70 && i == 1)
            isEqualToString = objc_msgSend_isEqualToString_(v331, v151, (uint64_t)v335, v153, v154, v155);
          if (((v70 | i) == 0) | isEqualToString & 1)
            goto LABEL_38;
          objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E0CB3500], v151, v152, v153, v154, v155);
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          v352[0] = v157;
          objc_msgSend_punctuationCharacterSet(MEMORY[0x1E0CB3500], v158, v159, v160, v161, v162);
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          v352[1] = v163;
          objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E0CB3500], v164, v165, v166, v167, v168);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          v352[2] = v169;
          objc_msgSend_ch_basicCyrillicCharacterSet(MEMORY[0x1E0CB3500], v170, v171, v172, v173, v174);
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v352[3] = v175;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v176, (uint64_t)v352, 4, v177, v178);
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ch_hasCharactersFromSets_(v335, v180, (uint64_t)v179, v181, v182, v183);
          v184 = (void *)objc_claimAutoreleasedReturnValue();

          v346 = 0u;
          v347 = 0u;
          v344 = 0u;
          v345 = 0u;
          v185 = v184;
          v193 = objc_msgSend_countByEnumeratingWithState_objects_count_(v185, v186, (uint64_t)&v344, (uint64_t)v351, 16, v187);
          if (!v193)
          {

LABEL_38:
            v197 = 0;
            if (v70)
              v198 = i == 0;
            else
              v198 = 1;
            v199 = v198;
            while (2)
            {
              if (v197 >= objc_msgSend_length(v127, v151, v152, v153, v154, v155))
              {
                objc_msgSend_addObject_(v333, v200, (uint64_t)v338, v201, v202, v203);
                objc_msgSend_transcriptionPathScores(v339, v274, v275, v276, v277, v278);
                v279 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectAtIndexedSubscript_(v279, v280, i, v281, v282, v283);
                v284 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v332, v285, (uint64_t)v284, v286, v287, v288);

                goto LABEL_62;
              }
              v204 = objc_msgSend_indexAtPosition_(v127, v200, v197, v201, v202, v203);
              objc_msgSend_tokenColumns(v339, v205, v206, v207, v208, v209);
              v210 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v210, v211, v197, v212, v213, v214);
              v215 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_textTokenRows(v215, v216, v217, v218, v219, v220);
              v221 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v221, v222, v204, v223, v224, v225);
              v226 = (void *)objc_claimAutoreleasedReturnValue();

              if (v199)
              {
                objc_msgSend_addObjectsFromArray_(v338, v227, (uint64_t)v226, v228, v229, v230);
LABEL_60:

                ++v197;
                continue;
              }
              break;
            }
            v342 = 0u;
            v343 = 0u;
            v340 = 0u;
            v341 = 0u;
            v231 = v226;
            v239 = objc_msgSend_countByEnumeratingWithState_objects_count_(v231, v232, (uint64_t)&v340, (uint64_t)v350, 16, v233);
            if (v239)
            {
              v240 = *(_QWORD *)v341;
              isTopOriginal = 1;
              do
              {
                for (j = 0; j != v239; ++j)
                {
                  while (1)
                  {
                    if (*(_QWORD *)v341 != v240)
                      objc_enumerationMutation(v231);
                    if ((isTopOriginal & 1) != 0)
                      break;
                    isTopOriginal = 0;
                    if (v239 == ++j)
                      goto LABEL_55;
                  }
                  isTopOriginal = objc_msgSend_isTopOriginal(*(void **)(*((_QWORD *)&v340 + 1) + 8 * j), v234, v235, v236, v237, v238);
                }
LABEL_55:
                v239 = objc_msgSend_countByEnumeratingWithState_objects_count_(v231, v234, (uint64_t)&v340, (uint64_t)v350, 16, v238);
              }
              while (v239);

              if ((isTopOriginal & 1) == 0)
              {
                objc_msgSend_tokenColumns(v339, v243, v244, v245, v246, v247);
                v248 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectAtIndexedSubscript_(v248, v249, v197, v250, v251, v252);
                v253 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_textTokenRows(v253, v254, v255, v256, v257, v258);
                v259 = (void *)objc_claimAutoreleasedReturnValue();
                v264 = objc_msgSend_indexAtPosition_(v336, v260, v197, v261, v262, v263);
                objc_msgSend_objectAtIndexedSubscript_(v259, v265, v264, v266, v267, v268);
                v269 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObjectsFromArray_(v338, v270, (uint64_t)v269, v271, v272, v273);

                goto LABEL_60;
              }
            }
            else
            {

            }
            objc_msgSend_addObjectsFromArray_(v338, v243, (uint64_t)v231, v245, v246, v247);
            goto LABEL_60;
          }
          v194 = 0;
          v195 = *(_QWORD *)v345;
          do
          {
            for (k = 0; k != v193; ++k)
            {
              if (*(_QWORD *)v345 != v195)
                objc_enumerationMutation(v185);
              if ((int)objc_msgSend_intValue(*(void **)(*((_QWORD *)&v344 + 1) + 8 * k), v188, v189, v190, v191, v192) > 0)
                ++v194;
            }
            v193 = objc_msgSend_countByEnumeratingWithState_objects_count_(v185, v188, (uint64_t)&v344, (uint64_t)v351, 16, v192);
          }
          while (v193);

          if (v194 < 2)
            goto LABEL_38;
LABEL_62:

        }
        ++v70;
      }
      v289 = [CHTokenizedTextResult alloc];
      objc_msgSend_objectAtIndexedSubscript_(v330, v290, 0, v291, v292, v293);
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_trailingSeparator(v294, v295, v296, v297, v298, v299);
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v330, v301, 0, v302, v303, v304);
      v305 = (void *)objc_claimAutoreleasedReturnValue();
      v311 = objc_msgSend_recognizerGenerationIdentifier(v305, v306, v307, v308, v309, v310);
      objc_msgSend_objectAtIndexedSubscript_(v330, v312, 0, v313, v314, v315);
      v316 = (void *)objc_claimAutoreleasedReturnValue();
      v322 = objc_msgSend_changeableTokenColumnCount(v316, v317, v318, v319, v320, v321);
      v324 = (void *)objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(v289, v323, (uint64_t)v333, (uint64_t)v332, (uint64_t)v300, v311, v322);

      objc_msgSend_resultRestoringRawPathInResult_(CHTokenizedTextResult, v325, (uint64_t)v324, v326, v327, v328);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9 = v330;
  }
  else
  {
    v62 = 0;
  }

  return v62;
}

+ (id)swappableColumnIndexesInResults:(id)a3 locales:(id)a4 topLocaleIndex:(int64_t)a5 swappableIndex:(int64_t)a6 shouldReverseSwappableColumns:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
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
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
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
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  uint64_t i;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
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
  void *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  int v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  int v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  int v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  int v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
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
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  int v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  void *v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  NSObject *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  void *v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  void *v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  _BOOL4 v350;
  const char *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  NSObject *v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  void *v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  const char *v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  const char *v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  id v400;
  void *v401;
  uint64_t v402;
  const char *v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  void *v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  void *v411;
  const char *v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  const char *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  void *v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  unint64_t j;
  void *v427;
  uint64_t v428;
  const char *v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  void *v433;
  const char *v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  const char *v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  void *v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  const char *v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  void *v455;
  const char *v456;
  uint64_t v457;
  uint64_t v458;
  unint64_t v459;
  const char *v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  void *v464;
  const char *v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  int v470;
  const char *v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  void *v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  int v481;
  const char *v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  void *v486;
  const char *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  int v492;
  const char *v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  void *v497;
  const char *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  int v503;
  const char *v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  void *v509;
  const char *v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  void *v514;
  uint64_t v515;
  const char *v516;
  void *v517;
  const char *v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  void *v523;
  const char *v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  void *v528;
  uint64_t v529;
  const char *v530;
  void *v531;
  const char *v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  const char *v536;
  uint64_t v537;
  uint64_t v538;
  const char *v539;
  uint64_t v540;
  uint64_t v541;
  const char *v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  void *v546;
  const char *v547;
  uint64_t v548;
  __CFString *v549;
  const char *v550;
  uint64_t v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  const char *v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  uint64_t v560;
  const char *v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  uint64_t v565;
  void *v566;
  const char *v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  void *v571;
  const char *v572;
  void *v573;
  const char *v574;
  const char *v575;
  uint64_t v576;
  uint64_t v577;
  BOOL v578;
  const char *v579;
  uint64_t v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  unint64_t v585;
  const char *v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  void *v591;
  const char *v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  void *v596;
  const char *v597;
  uint64_t v598;
  uint64_t v599;
  uint64_t v600;
  void *v601;
  const char *v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  void *v606;
  const char *v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  void *v611;
  const char *v612;
  uint64_t v613;
  uint64_t v614;
  void *v615;
  const char *v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  void *v620;
  __CFString *v621;
  void *v622;
  const char *v623;
  uint64_t v624;
  BOOL v625;
  const char *v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  const char *v630;
  uint64_t v631;
  uint64_t v632;
  uint64_t v633;
  const char *v634;
  uint64_t v635;
  uint64_t v636;
  const char *v637;
  uint64_t v638;
  uint64_t v639;
  uint64_t v640;
  __CFString *v641;
  void *v643;
  int64_t v644;
  id v645;
  char isSupportedCyrillicScriptLocale_withMode;
  int isSupportedLatinScriptLocale_withMode;
  int64_t v648;
  void *v649;
  void *v650;
  void *v651;
  __CFString *k;
  void *v653;
  void *v654;
  void *v655;
  void *v656;
  void *v657;
  void *v658;
  __CFString *v659;
  _QWORD v660[5];
  _QWORD v661[5];
  _QWORD v662[5];
  _QWORD v663[5];
  _BYTE buf[24];
  char v665;
  _QWORD v666[5];
  _QWORD v667[4];

  v7 = a7;
  v667[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v645 = a4;
  v648 = a5;
  v643 = v11;
  objc_msgSend_objectAtIndexedSubscript_(v11, v12, a5, v13, v14, v15);
  v656 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v11, v16, a6, v17, v18, v19);
  v659 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v20, v21, v22, v23, v24);
  v649 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v656, v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v30, v31, v32, v33, v34, v35))
  {
    objc_msgSend_transcriptionPaths(v659, v36, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_count(v41, v42, v43, v44, v45, v46);

    if (v47)
    {
      objc_msgSend_objectAtIndexedSubscript_(v645, v48, v648, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      isSupportedCyrillicScriptLocale_withMode = objc_msgSend_isSupportedCyrillicScriptLocale_withMode_(CHRecognizerConfiguration, v54, (uint64_t)v53, 4, v55, v56);

      objc_msgSend_objectAtIndexedSubscript_(v645, v57, v648, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      isSupportedLatinScriptLocale_withMode = objc_msgSend_isSupportedLatinScriptLocale_withMode_(CHRecognizerConfiguration, v62, (uint64_t)v61, 4, v63, v64);

      if (qword_1EF5681D0 != -1)
        dispatch_once(&qword_1EF5681D0, &unk_1E77F4998);
      objc_msgSend_commonTopStrokeSetsWithResult_shouldReverseOtherColumns_(v656, v65, (uint64_t)v659, v7, v66, v67);
      v658 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tokenColumns(v659, v68, v69, v70, v71, v72);
      v657 = (void *)objc_claimAutoreleasedReturnValue();
      v644 = a6;
      if (v7)
      {
        objc_msgSend_tokenColumns(v659, v73, v74, v75, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_reverseObjectEnumerator(v78, v79, v80, v81, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allObjects(v84, v85, v86, v87, v88, v89);
        v90 = objc_claimAutoreleasedReturnValue();

        v657 = (void *)v90;
      }
      objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v73, v74, v75, v76, v77);
      v653 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v91, (uint64_t)&unk_1E7828880, v92, v93, v94);
      v654 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v95, (uint64_t)&unk_1E7828880, v96, v97, v98);
      v650 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v99, (uint64_t)&unk_1E7828880, v100, v101, v102);
      v655 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v103, (uint64_t)&unk_1E7828880, v104, v105, v106);
      v651 = (void *)objc_claimAutoreleasedReturnValue();
      if (v658)
      {
        v112 = 0;
        v113 = 0;
        while (1)
        {
          objc_msgSend_tokenColumns(v656, v107, v108, v109, v110, v111);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          v121 = objc_msgSend_count(v115, v116, v117, v118, v119, v120);

          if (v112 >= v121)
            break;
          objc_msgSend_tokenColumns(v656, v122, v123, v124, v125, v126);
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v127, v128, v112, v129, v130, v131);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeIndexes(v132, v133, v134, v135, v136, v137);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addIndexes_(v653, v139, (uint64_t)v138, v140, v141, v142);

          objc_msgSend_objectAtIndexedSubscript_(v658, v143, v113, v144, v145, v146);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v132) = objc_msgSend_isEqualToIndexSet_(v653, v148, (uint64_t)v147, v149, v150, v151);

          if ((_DWORD)v132)
          {
            objc_msgSend_lastObject(v655, v107, v108, v109, v110, v111);
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(i) = objc_msgSend_intValue(v152, v153, v154, v155, v156, v157);

            objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v158, v159, v160, v161, v162);
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            for (i = (int)i; ; ++i)
            {
              if (i >= objc_msgSend_tokenColumnCount(v659, v163, v164, v165, v166, v167))
              {
                v114 = (uint64_t)v653;
                goto LABEL_10;
              }
              objc_msgSend_objectAtIndexedSubscript_(v657, v170, i, v171, v172, v173);
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeIndexes(v174, v175, v176, v177, v178, v179);
              v180 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addIndexes_(v168, v181, (uint64_t)v180, v182, v183, v184);

              objc_msgSend_objectAtIndexedSubscript_(v658, v185, v113, v186, v187, v188);
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v180) = objc_msgSend_isEqualToIndexSet_(v168, v190, (uint64_t)v189, v191, v192, v193);

              if ((_DWORD)v180)
                break;
            }
            v194 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend_objectAtIndexedSubscript_(v654, v163, v113, v165, v166, v167);
            v195 = (void *)objc_claimAutoreleasedReturnValue();
            v201 = objc_msgSend_intValue(v195, v196, v197, v198, v199, v200);
            objc_msgSend_numberWithInteger_(v194, v202, v112 + 1 - v201, v203, v204, v205);
            v206 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_atIndexedSubscript_(v650, v207, (uint64_t)v206, v113, v208, v209);

            v210 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend_objectAtIndexedSubscript_(v655, v211, v113, v212, v213, v214);
            v215 = (void *)objc_claimAutoreleasedReturnValue();
            v221 = objc_msgSend_intValue(v215, v216, v217, v218, v219, v220);
            objc_msgSend_numberWithInteger_(v210, v222, i - v221 + 1, v223, v224, v225);
            v226 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_atIndexedSubscript_(v651, v227, (uint64_t)v226, v113, v228, v229);

            objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v230, v231, v232, v233, v234);
            v114 = objc_claimAutoreleasedReturnValue();

            if (v113 < objc_msgSend_count(v658, v235, v236, v237, v238, v239) - 1)
            {
              v245 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_lastObject(v654, v240, v241, v242, v243, v244);
              v246 = (void *)objc_claimAutoreleasedReturnValue();
              v252 = objc_msgSend_intValue(v246, v247, v248, v249, v250, v251);
              objc_msgSend_lastObject(v650, v253, v254, v255, v256, v257);
              v258 = (void *)objc_claimAutoreleasedReturnValue();
              v264 = objc_msgSend_intValue(v258, v259, v260, v261, v262, v263);
              objc_msgSend_numberWithInt_(v245, v265, (v264 + v252), v266, v267, v268);
              v269 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v654, v270, (uint64_t)v269, v271, v272, v273);

              objc_msgSend_addObject_(v650, v274, (uint64_t)&unk_1E7828880, v275, v276, v277);
              v278 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend_lastObject(v655, v279, v280, v281, v282, v283);
              v284 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v269) = objc_msgSend_intValue(v284, v285, v286, v287, v288, v289);
              objc_msgSend_lastObject(v651, v290, v291, v292, v293, v294);
              v295 = (void *)objc_claimAutoreleasedReturnValue();
              v301 = objc_msgSend_intValue(v295, v296, v297, v298, v299, v300);
              objc_msgSend_numberWithInt_(v278, v302, (v301 + (_DWORD)v269), v303, v304, v305);
              v306 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v655, v307, (uint64_t)v306, v308, v309, v310);

              objc_msgSend_addObject_(v651, v311, (uint64_t)&unk_1E7828880, v312, v313, v314);
              ++v113;
            }
LABEL_10:

            v653 = (void *)v114;
          }
          ++v112;
        }
      }
      else
      {
        v401 = (void *)MEMORY[0x1E0CB37E8];
        v402 = objc_msgSend_tokenColumnCount(v656, v107, v108, v109, v110, v111);
        objc_msgSend_numberWithInteger_(v401, v403, v402, v404, v405, v406);
        v407 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_atIndexedSubscript_(v650, v408, (uint64_t)v407, 0, v409, v410);

        v411 = (void *)MEMORY[0x1E0CB37E8];
        v417 = objc_msgSend_tokenColumnCount(v659, v412, v413, v414, v415, v416);
        objc_msgSend_numberWithInteger_(v411, v418, v417, v419, v420, v421);
        v422 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_atIndexedSubscript_(v651, v423, (uint64_t)v422, 0, v424, v425);

      }
      if (v7)
      {
        for (j = 0; j < objc_msgSend_count(v655, v122, v123, v124, v125, v126); ++j)
        {
          v427 = (void *)MEMORY[0x1E0CB37E8];
          v428 = objc_msgSend_tokenColumnCount(v659, v122, v123, v124, v125, v126);
          objc_msgSend_objectAtIndexedSubscript_(v655, v429, j, v430, v431, v432);
          v433 = (void *)objc_claimAutoreleasedReturnValue();
          v439 = objc_msgSend_integerValue(v433, v434, v435, v436, v437, v438);
          objc_msgSend_objectAtIndexedSubscript_(v651, v440, j, v441, v442, v443);
          v444 = (void *)objc_claimAutoreleasedReturnValue();
          v450 = objc_msgSend_integerValue(v444, v445, v446, v447, v448, v449);
          objc_msgSend_numberWithInteger_(v427, v451, v428 - (v439 + v450), v452, v453, v454);
          v455 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_atIndexedSubscript_(v655, v456, (uint64_t)v455, j, v457, v458);

        }
      }
      v459 = 0;
      for (k = &stru_1E77F6F28; ; k = v641)
      {
        if (v459 >= objc_msgSend_count(v654, v122, v123, v124, v125, v126))
        {
          v400 = v649;

          goto LABEL_75;
        }
        objc_msgSend_objectAtIndexedSubscript_(v654, v460, v459, v461, v462, v463);
        v464 = (void *)objc_claimAutoreleasedReturnValue();
        v470 = objc_msgSend_intValue(v464, v465, v466, v467, v468, v469);
        objc_msgSend_objectAtIndexedSubscript_(v650, v471, v459, v472, v473, v474);
        v475 = (void *)objc_claimAutoreleasedReturnValue();
        v481 = objc_msgSend_intValue(v475, v476, v477, v478, v479, v480);

        objc_msgSend_objectAtIndexedSubscript_(v655, v482, v459, v483, v484, v485);
        v486 = (void *)objc_claimAutoreleasedReturnValue();
        v492 = objc_msgSend_intValue(v486, v487, v488, v489, v490, v491);
        objc_msgSend_objectAtIndexedSubscript_(v651, v493, v459, v494, v495, v496);
        v497 = (void *)objc_claimAutoreleasedReturnValue();
        v503 = objc_msgSend_intValue(v497, v498, v499, v500, v501, v502);

        objc_msgSend_transcriptionPaths(v656, v504, v505, v506, v507, v508);
        v509 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v509, v510, 0, v511, v512, v513);
        v514 = (void *)objc_claimAutoreleasedReturnValue();
        v515 = v481;
        objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v656, v516, (uint64_t)v514, v470, v481, 0);
        v517 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_transcriptionPaths(v659, v518, v519, v520, v521, v522);
        v523 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v523, v524, 0, v525, v526, v527);
        v528 = (void *)objc_claimAutoreleasedReturnValue();
        v529 = v503;
        objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v659, v530, (uint64_t)v528, v492, v503, 0);
        v531 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v528) = objc_msgSend_isEqualToString_(v517, v532, (uint64_t)v531, v533, v534, v535);
        LODWORD(v523) = objc_msgSend_hasTextReplacementsInColumnRange_(v656, v536, v470, v515, v537, v538);
        if (((v528 | v523 | objc_msgSend_hasTextReplacementsInColumnRange_(v659, v539, v492, v503, v540, v541)) & 1) != 0)goto LABEL_71;
        if (isSupportedLatinScriptLocale_withMode)
        {
          if (v656)
          {
            -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)v656);
            v546 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v656, v547, (uint64_t)v546, v470, v515, 0);
            v548 = objc_claimAutoreleasedReturnValue();
            if (v548)
              v549 = (__CFString *)v548;
            else
              v549 = &stru_1E77F6F28;

            v554 = objc_msgSend_caseInsensitiveCompare_(v549, v550, (uint64_t)v517, v551, v552, v553);
          }
          else
          {
            v549 = 0;
            v554 = objc_msgSend_caseInsensitiveCompare_(0, v542, (uint64_t)v517, v543, v544, v545);
          }
          v559 = v554;
          v560 = objc_msgSend_caseInsensitiveCompare_(v549, v555, (uint64_t)v531, v556, v557, v558);
          if (v559)
          {
            if (!v560)
            {
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              v665 = 1;
              objc_msgSend_transcriptionPaths(v659, v561, v562, v563, v564, v565);
              v566 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v566, v567, 0, v568, v569, v570);
              v571 = (void *)objc_claimAutoreleasedReturnValue();
              v661[0] = MEMORY[0x1E0C809B0];
              v661[1] = 3221225472;
              v661[2] = sub_1BE74A8A0;
              v661[3] = &unk_1E77F46B0;
              v661[4] = buf;
              objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v659, v572, (uint64_t)v571, v492, v529, (uint64_t)v661);

              LODWORD(v571) = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
              _Block_object_dispose(buf, 8);
              if ((_DWORD)v571)
              {

LABEL_64:
                objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v542, v644, v543, v544, v545);
                v591 = (void *)objc_claimAutoreleasedReturnValue();
                v663[0] = v591;
                objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v592, v470, v593, v594, v595);
                v596 = (void *)objc_claimAutoreleasedReturnValue();
                v663[1] = v596;
                objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v597, v515, v598, v599, v600);
                v601 = (void *)objc_claimAutoreleasedReturnValue();
                v663[2] = v601;
                objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v602, v492, v603, v604, v605);
                v606 = (void *)objc_claimAutoreleasedReturnValue();
                v663[3] = v606;
                objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v607, v529, v608, v609, v610);
                v611 = (void *)objc_claimAutoreleasedReturnValue();
                v663[4] = v611;
                objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v612, (uint64_t)v663, 5, v613, v614);
                v615 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v649, v616, (uint64_t)v615, v617, v618, v619);

                v620 = v531;
                goto LABEL_72;
              }
            }
          }
          if (!isStringEntirelyFromSet(&v549->isa, (NSCharacterSet *)qword_1EF5681C0))
            goto LABEL_58;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v665 = 1;
          -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)v656);
          v573 = (void *)objc_claimAutoreleasedReturnValue();
          v660[0] = MEMORY[0x1E0C809B0];
          v660[1] = 3221225472;
          v660[2] = sub_1BE74A8FC;
          v660[3] = &unk_1E77F46B0;
          v660[4] = buf;
          objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v656, v574, (uint64_t)v573, v470, v515, (uint64_t)v660);

          if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          {
            _Block_object_dispose(buf, 8);
LABEL_58:

            goto LABEL_71;
          }
          v621 = v659;
          if (v659)
          {
            -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)v659);
            v622 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v659, v623, (uint64_t)v622, v492, v529, 0);
            v624 = objc_claimAutoreleasedReturnValue();
            if (v624)
              v621 = (__CFString *)v624;
            else
              v621 = &stru_1E77F6F28;

          }
          v625 = objc_msgSend_compare_options_(v549, v575, (uint64_t)v621, 129, v576, v577) == 0;

          _Block_object_dispose(buf, 8);
          if (v625)
            goto LABEL_64;
        }
        else if ((isSupportedCyrillicScriptLocale_withMode & 1) != 0)
        {
          if (objc_msgSend_shouldSwapCyrillicTopResult_topRange_englishResult_englishRange_prevousGroupTopString_(CHRecognizerConfiguration, v542, (uint64_t)v656, v470, v515, (uint64_t)v659, v492, v503, k))goto LABEL_64;
        }
        else
        {
          v578 = isStringEntirelyFromSet((NSString *)v517, (NSCharacterSet *)qword_1EF5681C8);
          if ((unint64_t)objc_msgSend_length(v517, v579, v580, v581, v582, v583) >= 2)
          {
            v585 = objc_msgSend_length(v517, v542, v584, v543, v544, v545);
            objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v517, v586, 0, v587, v588, v589);
            if (v585 > (unint64_t)v542 && v578)
              goto LABEL_64;
          }
        }
LABEL_71:
        objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v542, v648, v543, v544, v545);
        v591 = (void *)objc_claimAutoreleasedReturnValue();
        v662[0] = v591;
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v626, v470, v627, v628, v629);
        v596 = (void *)objc_claimAutoreleasedReturnValue();
        v662[1] = v596;
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v630, v515, v631, v632, v633);
        v601 = (void *)objc_claimAutoreleasedReturnValue();
        v662[2] = v601;
        v662[3] = &unk_1E7828880;
        v662[4] = &unk_1E7828880;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v634, (uint64_t)v662, 5, v635, v636);
        v606 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v649, v637, (uint64_t)v606, v638, v639, v640);
        v620 = v517;
LABEL_72:

        v641 = v620;
        ++v459;
      }
    }
  }
  else
  {

  }
  objc_msgSend_transcriptionPaths(v656, v48, v49, v50, v51, v52);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  v321 = objc_msgSend_count(v315, v316, v317, v318, v319, v320);

  if (!v321)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v327 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v327, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend_strokeIndexes(v656, v328, v329, v330, v331, v332);
      v333 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = objc_msgSend_count(v333, v334, v335, v336, v337, v338);
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend_tokenColumnCount(v656, v339, v340, v341, v342, v343);
      _os_log_impl(&dword_1BE607000, v327, OS_LOG_TYPE_FAULT, "rdar://114127212 topResult has no transcription path. Stroke Count = %lu Column Count = %lu", buf, 0x16u);

    }
  }
  objc_msgSend_transcriptionPaths(v659, v322, v323, v324, v325, v326);
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  v350 = objc_msgSend_count(v344, v345, v346, v347, v348, v349) == 0;

  if (v350)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v355 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v355, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend_strokeIndexes(v659, v356, v357, v358, v359, v360);
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      v367 = objc_msgSend_count(v361, v362, v363, v364, v365, v366);
      v373 = objc_msgSend_tokenColumnCount(v659, v368, v369, v370, v371, v372);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v367;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v373;
      _os_log_impl(&dword_1BE607000, v355, OS_LOG_TYPE_FAULT, "rdar://114127212 englishResult has no transcription path. Stroke Count = %lu Column Count = %lu", buf, 0x16u);

    }
  }
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v351, v648, v352, v353, v354);
  v658 = (void *)objc_claimAutoreleasedReturnValue();
  v666[0] = v658;
  v666[1] = &unk_1E7828880;
  v374 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_objectAtIndexedSubscript_(v643, v375, v648, v376, v377, v378);
  v657 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenColumns(v657, v379, v380, v381, v382, v383);
  v653 = (void *)objc_claimAutoreleasedReturnValue();
  v389 = objc_msgSend_count(v653, v384, v385, v386, v387, v388);
  objc_msgSend_numberWithUnsignedInteger_(v374, v390, v389, v391, v392, v393);
  v654 = (void *)objc_claimAutoreleasedReturnValue();
  v666[2] = v654;
  v666[3] = &unk_1E7828880;
  v666[4] = &unk_1E7828880;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v394, (uint64_t)v666, 5, v395, v396);
  v650 = (void *)objc_claimAutoreleasedReturnValue();
  v667[0] = v650;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v397, (uint64_t)v667, 1, v398, v399);
  v400 = (id)objc_claimAutoreleasedReturnValue();
LABEL_75:

  return v400;
}

+ (id)compressResult:(id)a3 atColumnIndexes:(id)a4
{
  id v5;
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
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
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
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t k;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
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
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
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
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
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
  void *v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
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
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  unint64_t m;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
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
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  CHTokenizedResultColumn *v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  unint64_t v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  NSObject *v282;
  CHMutableTokenizedTextResult *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  void *v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  const char *v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
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
  uint64_t v325;
  id v326;
  uint64_t v327;
  void *v328;
  void *v329;
  void *v330;
  uint8_t buf[16];
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  _BYTE v336[128];
  uint64_t v337;

  v337 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v326 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v6, v7, v8, v9, v10);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenColumns(v5, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v22, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v329, v29, (uint64_t)v28, v30, v31, v32);

  v334 = 0u;
  v335 = 0u;
  v332 = 0u;
  v333 = 0u;
  objc_msgSend_transcriptionPaths(v5, v33, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v332, (uint64_t)v336, 16, v40);
  if (v45)
  {
    v46 = *(_QWORD *)v333;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v333 != v46)
          objc_enumerationMutation(v38);
        v48 = (void *)MEMORY[0x1E0CB36B0];
        v49 = objc_msgSend_indexAtPosition_(*(void **)(*((_QWORD *)&v332 + 1) + 8 * i), v41, 0, v42, v43, v44);
        objc_msgSend_indexPathWithIndex_(v48, v50, v49, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v16, v55, (uint64_t)v54, v56, v57, v58);

      }
      v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v332, (uint64_t)v336, 16, v44);
    }
    while (v45);
  }

  v327 = objc_msgSend_changeableTokenColumnCount(v5, v59, v60, v61, v62, v63);
  v325 = objc_msgSend_tokenColumnCount(v5, v64, v65, v66, v67, v68) - v327;
  for (j = 1; j < objc_msgSend_tokenColumnCount(v5, v69, v70, v71, v72, v73, v325); ++j)
  {
    objc_msgSend_tokenColumns(v5, v75, v76, v77, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v80, v81, j, v82, v83, v84);
    v328 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectAtIndexedSubscript_(v326, v85, j, v86, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend_BOOLValue(v89, v90, v91, v92, v93, v94);

    if (v95)
    {
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v96, v97, v98, v99, v100);
      v330 = (void *)objc_claimAutoreleasedReturnValue();
      for (k = 0; k < objc_msgSend_count(v16, v101, v102, v103, v104, v105); ++k)
      {
        objc_msgSend_objectAtIndexedSubscript_(v16, v107, k, v108, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = objc_msgSend_length(v111, v112, v113, v114, v115, v116);

        objc_msgSend_objectAtIndexedSubscript_(v16, v118, k, v119, v120, v121);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = objc_msgSend_indexAtPosition_(v122, v123, v117 - 1, v124, v125, v126);

        objc_msgSend_transcriptionPaths(v5, v128, v129, v130, v131, v132);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v133, v134, k, v135, v136, v137);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = objc_msgSend_indexAtPosition_(v138, v139, j, v140, v141, v142);

        objc_msgSend_array(MEMORY[0x1E0C99DE8], v144, v145, v146, v147, v148);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastObject(v329, v150, v151, v152, v153, v154);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_textTokenRows(v155, v156, v157, v158, v159, v160);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v161, v162, v127, v163, v164, v165);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v149, v167, (uint64_t)v166, v168, v169, v170);

        objc_msgSend_tokenColumns(v5, v171, v172, v173, v174, v175);
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v176, v177, j, v178, v179, v180);
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_textTokenRows(v181, v182, v183, v184, v185, v186);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v187, v188, v143, v189, v190, v191);
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v149, v193, (uint64_t)v192, v194, v195, v196);

        v197 = (void *)objc_opt_class();
        v205 = objc_msgSend_mergeTokenRow_intoUniqueRows_(v197, v198, (uint64_t)v149, (uint64_t)v330, v199, v200);
        if (v205 != v127)
        {
          objc_msgSend_objectAtIndexedSubscript_(v16, v201, k, v202, v203, v204);
          v206 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_indexPathByRemovingLastIndex(v206, v207, v208, v209, v210, v211);
          v212 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_indexPathByAddingIndex_(v212, v213, v205, v214, v215, v216);
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_atIndexedSubscript_(v16, v218, (uint64_t)v217, k, v219, v220);

        }
      }
      v256 = [CHTokenizedResultColumn alloc];
      v261 = (void *)objc_msgSend_initWithTokenRows_(v256, v257, (uint64_t)v330, v258, v259, v260);
      v267 = objc_msgSend_count(v329, v262, v263, v264, v265, v266);
      objc_msgSend_setObject_atIndexedSubscript_(v329, v268, (uint64_t)v261, v267 - 1, v269, v270);

      v327 -= j > v325;
    }
    else
    {
      objc_msgSend_addObject_(v329, v96, (uint64_t)v328, v98, v99, v100);
      for (m = 0; m < objc_msgSend_count(v16, v221, v222, v223, v224, v225); ++m)
      {
        objc_msgSend_transcriptionPaths(v5, v227, v228, v229, v230, v231);
        v232 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v232, v233, m, v234, v235, v236);
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        v242 = objc_msgSend_indexAtPosition_(v237, v238, j, v239, v240, v241);

        objc_msgSend_objectAtIndexedSubscript_(v16, v243, m, v244, v245, v246);
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_indexPathByAddingIndex_(v247, v248, v242, v249, v250, v251);
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_atIndexedSubscript_(v16, v253, (uint64_t)v252, m, v254, v255);

      }
    }

  }
  v271 = objc_msgSend_count(v329, v75, v76, v77, v78, v79);
  if (v271 >= objc_msgSend_tokenColumnCount(v5, v272, v273, v274, v275, v276))
  {
    v303 = 0;
  }
  else
  {
    if (!objc_msgSend_count(v329, v277, v278, v279, v280, v281))
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v282 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v282, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v282, OS_LOG_TYPE_FAULT, "compressResult removed all columns.", buf, 2u);
      }

    }
    v283 = [CHMutableTokenizedTextResult alloc];
    objc_msgSend_transcriptionPathScores(v5, v284, v285, v286, v287, v288);
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trailingSeparator(v5, v290, v291, v292, v293, v294);
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    v301 = objc_msgSend_recognizerGenerationIdentifier(v5, v296, v297, v298, v299, v300);
    v303 = (void *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(v283, v302, (uint64_t)v329, (uint64_t)v16, (uint64_t)v289, (uint64_t)v295, v301, v327);

    objc_msgSend_inputStrokeIdentifiers(v5, v304, v305, v306, v307, v308);
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInputStrokeIdentifiers_(v303, v310, (uint64_t)v309, v311, v312, v313);

    objc_msgSend_locale(v5, v314, v315, v316, v317, v318);
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocale_(v303, v320, (uint64_t)v319, v321, v322, v323);

  }
  return v303;
}

- (id)subResultWithColumnRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CHMutableTokenizedTextResult *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSArray *transcriptionPathScores;
  int64_t recognizerGenerationIdentifier;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t isMinimalDrawingResult;
  const char *v27;
  void *isMinimalDrawingResult_baseWritingDirection;
  _QWORD v30[6];

  length = a3.length;
  location = a3.location;
  objc_msgSend_transcriptionPaths(self, a2, a3.location, a3.length, v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1BE74B328;
  v30[3] = &unk_1E77F49B8;
  v30[4] = location;
  v30[5] = length;
  objc_msgSend_ch_mappedArrayWithBlock_(v8, v9, (uint64_t)v30, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [CHMutableTokenizedTextResult alloc];
  objc_msgSend_subarrayWithRange_(self->_tokenColumns, v15, location, length, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  transcriptionPathScores = self->_transcriptionPathScores;
  recognizerGenerationIdentifier = self->_recognizerGenerationIdentifier;
  isMinimalDrawingResult = objc_msgSend_isMinimalDrawingResult(self, v21, v22, v23, v24, v25);
  isMinimalDrawingResult_baseWritingDirection = (void *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_recognizerGenerationIdentifier_isMinimalDrawingResult_baseWritingDirection_(v14, v27, (uint64_t)v18, (uint64_t)v13, (uint64_t)transcriptionPathScores, recognizerGenerationIdentifier, isMinimalDrawingResult, *(_QWORD *)&self->_baseWritingDirection);

  return isMinimalDrawingResult_baseWritingDirection;
}

+ (CGPath)newBaselinePathForTokens:(id)a3 strokeIdentifiers:(id)a4 strokeProvider:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  NSObject *v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
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
  void *v57;
  double v58;
  double v59;
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
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double *v76;
  double *v77;
  double *v78;
  double *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  double *v85;
  double *v86;
  double v87;
  double v88;
  uint64_t v89;
  double *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  double *v96;
  char *v97;
  NSObject *v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  double *v112;
  _BYTE *v113;
  uint64_t v114;
  uint64_t v115;
  CHQuadCurvePointFIFO *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  CHBoxcarFilterPointFIFO *v122;
  double v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  CHPointFIFO *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  float64x2_t *v139;
  unint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const CGPath *v146;
  CGPath *v147;
  id v149;
  id v150;
  __int128 v151;
  __int128 v152;
  float64x2_t *v153;
  float64x2_t *v154;
  uint64_t v155;
  void *__p;
  double *v157;
  unint64_t v158;
  uint8_t buf[32];
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  uint64_t v166;

  v166 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v149 = a4;
  v150 = a5;
  v13 = objc_msgSend_count(v149, v8, v9, v10, v11, v12);
  if (v13 != objc_msgSend_count(v7, v14, v15, v16, v17, v18))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v24 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v24, OS_LOG_TYPE_FAULT, "There needs to be an array of stroke identifiers for each token.", buf, 2u);
    }

  }
  v25 = 0;
  __p = 0;
  v157 = 0;
  v158 = 0;
  while (v25 < objc_msgSend_count(v7, v19, v20, v21, v22, v23))
  {
    objc_msgSend_objectAtIndexedSubscript_(v149, v26, v25, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v31, (uint64_t)v30, (uint64_t)v150, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v35, (uint64_t)v34, v36, v37, v38);
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    objc_msgSend_objectAtIndexedSubscript_(v7, v47, v25, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v51;
    if (v51)
    {
      objc_msgSend_principalLines(v51, v52, v53, v54, v55, v56);
      v58 = *((double *)&v160 + 1);
      v59 = *(double *)&v160;
      v152 = v161;
    }
    else
    {
      v164 = 0u;
      v165 = 0u;
      v163 = 0u;
      v161 = 0u;
      v162 = 0u;
      v160 = 0u;
      v152 = 0uLL;
      v58 = 0.0;
      v59 = 0.0;
      memset(buf, 0, sizeof(buf));
    }
    if (v44 == 0.0)
      v44 = 1.0;
    if (v46 == 0.0)
      v46 = 1.0;

    objc_msgSend_objectAtIndexedSubscript_(v7, v60, v25, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v64;
    if (v64)
    {
      objc_msgSend_principalLines(v64, v65, v66, v67, v68, v69);
      v72 = *(double *)buf;
      v71 = *(double *)&buf[8];
      v151 = *(_OWORD *)&buf[16];
    }
    else
    {
      v164 = 0u;
      v165 = 0u;
      v163 = 0u;
      v161 = 0u;
      v162 = 0u;
      v160 = 0u;
      v151 = 0uLL;
      v71 = 0.0;
      v72 = 0.0;
      memset(buf, 0, sizeof(buf));
    }

    v73 = v42 + v58 * v46;
    v74 = (v40 + v59 * v44 + v40 + v72 * v44) * 0.5;
    v75 = (v73 + v42 + v71 * v46) * 0.5;
    v77 = v157;
    v76 = (double *)v158;
    if ((unint64_t)v157 < v158)
    {
      *v157 = v74;
      v77[1] = v75;
      v78 = v77 + 2;
      goto LABEL_37;
    }
    v79 = (double *)__p;
    v80 = ((char *)v157 - (_BYTE *)__p) >> 4;
    v81 = v80 + 1;
    if ((unint64_t)(v80 + 1) >> 60)
      sub_1BE61F930();
    v82 = v158 - (_QWORD)__p;
    if ((uint64_t)(v158 - (_QWORD)__p) >> 3 > v81)
      v81 = v82 >> 3;
    if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF0)
      v83 = 0xFFFFFFFFFFFFFFFLL;
    else
      v83 = v81;
    if (v83)
    {
      if (v83 >> 60)
        sub_1BE61F100();
      v84 = (char *)operator new(16 * v83);
      v85 = (double *)&v84[16 * v80];
      *v85 = v74;
      v85[1] = v75;
      v86 = v85;
      if (v77 == v79)
      {
LABEL_35:
        v76 = (double *)&v84[16 * v83];
        v78 = v85 + 2;
        __p = v86;
        v157 = v85 + 2;
        v158 = (unint64_t)v76;
        if (!v77)
          goto LABEL_37;
LABEL_36:
        operator delete(v77);
        v76 = (double *)v158;
        goto LABEL_37;
      }
    }
    else
    {
      v84 = 0;
      v85 = (double *)(16 * v80);
      *v85 = v74;
      v85[1] = v75;
      v86 = (double *)(16 * v80);
      if (v77 == v79)
        goto LABEL_35;
    }
    do
    {
      *((_OWORD *)v86 - 1) = *((_OWORD *)v77 - 1);
      v86 -= 2;
      v77 -= 2;
    }
    while (v77 != v79);
    v77 = (double *)__p;
    v76 = (double *)&v84[16 * v83];
    v78 = v85 + 2;
    __p = v86;
    v157 = v85 + 2;
    v158 = (unint64_t)v76;
    if (v77)
      goto LABEL_36;
LABEL_37:
    v157 = v78;
    v87 = (v40 + *(double *)&v152 * v44 + v40 + *(double *)&v151 * v44) * 0.5;
    v88 = (v42 + *((double *)&v152 + 1) * v46 + v42 + *((double *)&v151 + 1) * v46) * 0.5;
    if (v78 < v76)
    {
      *v78 = v87;
      v78[1] = v88;
      v89 = (uint64_t)(v78 + 2);
      goto LABEL_55;
    }
    v90 = (double *)__p;
    v91 = ((char *)v78 - (_BYTE *)__p) >> 4;
    v92 = v91 + 1;
    if ((unint64_t)(v91 + 1) >> 60)
      sub_1BE61F930();
    v93 = (char *)v76 - (_BYTE *)__p;
    if (v93 >> 3 > v92)
      v92 = v93 >> 3;
    if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFF0)
      v94 = 0xFFFFFFFFFFFFFFFLL;
    else
      v94 = v92;
    if (v94)
    {
      if (v94 >> 60)
        sub_1BE61F100();
      v95 = (char *)operator new(16 * v94);
      v96 = (double *)&v95[16 * v91];
      v97 = &v95[16 * v94];
      *v96 = v87;
      v96[1] = v88;
      v89 = (uint64_t)(v96 + 2);
      if (v78 == v90)
      {
LABEL_53:
        __p = v96;
        v157 = (double *)v89;
        v158 = (unint64_t)v97;
LABEL_54:
        operator delete(v78);
        goto LABEL_55;
      }
    }
    else
    {
      v96 = (double *)(16 * v91);
      v97 = 0;
      *v96 = v87;
      v96[1] = v88;
      v89 = 16 * v91 + 16;
      if (v78 == v90)
        goto LABEL_53;
    }
    do
    {
      *((_OWORD *)v96 - 1) = *((_OWORD *)v78 - 1);
      v96 -= 2;
      v78 -= 2;
    }
    while (v78 != v90);
    v78 = (double *)__p;
    __p = v96;
    v157 = (double *)v89;
    v158 = (unint64_t)v97;
    if (v78)
      goto LABEL_54;
LABEL_55:
    v157 = (double *)v89;

    ++v25;
  }
  if (v157 == __p)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v98 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v98, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v98, OS_LOG_TYPE_FAULT, "The number of points in the raw baseline estimate must be > 0 at this point.", buf, 2u);
    }

  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v99 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
  {
    v101 = *(_QWORD *)__p;
    v100 = *((_QWORD *)__p + 1);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v101;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v100;
    _os_log_impl(&dword_1BE607000, v99, OS_LOG_TYPE_DEBUG, "Raw points[0] = %.2f, %.2f\n", buf, 0x16u);
  }

  v155 = 0;
  v102 = (void *)objc_opt_class();
  if (v102)
  {
    objc_msgSend_regularizedPathFromPoints_delta_gamma_outError_(v102, v103, (uint64_t)&__p, (uint64_t)&v155, v104, v105, 1.0, 0.9);
    if (qword_1EF568E88 == -1)
      goto LABEL_68;
LABEL_79:
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v106 = (id)qword_1EF568E20;
    if (!os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      goto LABEL_70;
LABEL_69:
    v113 = __p;
    v112 = v157;
    v114 = v155;
    v115 = objc_msgSend_count(v7, v107, v108, v109, v110, v111);
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = ((char *)v112 - v113) >> 4;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v114;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v115;
    _os_log_impl(&dword_1BE607000, v106, OS_LOG_TYPE_DEFAULT, "Baseline Data detectors baseline approximation with %lu points, correction error = %.2f, number of tokens %lu", buf, 0x20u);
    goto LABEL_70;
  }
  v153 = 0;
  v154 = 0;
  if (qword_1EF568E88 != -1)
    goto LABEL_79;
LABEL_68:
  v106 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    goto LABEL_69;
LABEL_70:

  v116 = [CHQuadCurvePointFIFO alloc];
  v121 = (void *)objc_msgSend_initWithFIFO_(v116, v117, 0, v118, v119, v120);
  v122 = [CHBoxcarFilterPointFIFO alloc];
  LODWORD(v123) = 2.0;
  v127 = (void *)objc_msgSend_initWithFIFO_width_spacing_(v122, v124, (uint64_t)v121, 2, v125, v126, v123);
  v128 = [CHPointFIFO alloc];
  v138 = (void *)objc_msgSend_initWithFIFO_(v128, v129, (uint64_t)v127, v130, v131, v132);
  v139 = v153;
  if (v154 != v153)
  {
    v140 = 0;
    do
    {
      objc_msgSend_addPoint_(v138, v133, v134, v135, v136, v137, COERCE_DOUBLE(vcvt_f32_f64(v139[v140++])));
      v139 = v153;
    }
    while (v140 < v154 - v153);
  }
  objc_msgSend_flush(v138, v133, v134, v135, v136, v137);
  v146 = (const CGPath *)objc_msgSend_path(v121, v141, v142, v143, v144, v145);
  v147 = CGPathRetain(v146);

  if (v153)
    operator delete(v153);
  if (__p)
  {
    v157 = (double *)__p;
    operator delete(__p);
  }

  return v147;
}

+ (id)resultsBySwapping:(id)a3 swappableColumns:(id)a4 locales:(id)a5 topLocaleIndex:(int64_t)a6 topLocale:(id)a7
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
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
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
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
  int v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  void *v105;
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
  uint64_t v122;
  void *v123;
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
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  int v181;
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
  void *v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
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
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  BOOL v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  void *v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  int v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  void *v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  void *v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  int v288;
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
  void *v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  const char *v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  void *v312;
  id v313;
  const char *v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  void *v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  NSObject *v338;
  id v339;
  const char *v340;
  uint64_t v341;
  void *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t j;
  void *v350;
  const char *v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  void *v357;
  void *v358;
  id v359;
  id v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  void *v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  BOOL v376;
  NSObject *v377;
  id v378;
  const char *v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  const char *v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  void *v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  void *v396;
  id v397;
  const char *v398;
  uint64_t v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t k;
  uint64_t v408;
  const char *v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  void *v413;
  const char *v414;
  uint64_t v415;
  uint64_t v416;
  void *v417;
  const char *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  id v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  void *v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  void *v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  void *v443;
  const char *v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  void *v448;
  const char *v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  unint64_t m;
  void *v454;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  BOOL v460;
  const char *v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  void *v466;
  const char *v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  void *v471;
  const char *v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  NSIndexPath *v477;
  void *v478;
  const char *v479;
  uint64_t v480;
  uint64_t v481;
  void *v482;
  const char *v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  NSIndexPath *v488;
  void *v489;
  const char *v490;
  uint64_t v491;
  uint64_t v492;
  void *v493;
  const char *v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  void *v499;
  const char *v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  const char *v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  const char *v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  void *v515;
  const char *v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  void *v521;
  const char *v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  void *v527;
  const char *v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  void *v534;
  CHMutableTokenizedResultColumn *v535;
  const char *v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  void *v540;
  const char *v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  void *v545;
  const char *v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  void *v551;
  const char *v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  void *v557;
  const char *v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  BOOL v562;
  const char *v563;
  uint64_t v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  void *v568;
  unint64_t v569;
  unint64_t n;
  void *v571;
  const char *v572;
  uint64_t v573;
  uint64_t v574;
  const char *v575;
  uint64_t v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  void *v580;
  const char *v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  void *v586;
  const char *v587;
  uint64_t v588;
  uint64_t v589;
  const char *v590;
  uint64_t v591;
  uint64_t v592;
  const char *v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  const char *v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  void *v603;
  const char *v604;
  uint64_t v605;
  const char *v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t ii;
  uint64_t v614;
  void *v615;
  const char *v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t v621;
  id v622;
  const char *v623;
  const char *v624;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
  const char *v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  uint64_t v632;
  void *v633;
  CHMutableTokenizedTextResult *v634;
  const char *v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  void *v640;
  const char *v641;
  uint64_t v642;
  uint64_t v643;
  uint64_t v644;
  uint64_t v645;
  void *v646;
  const char *v647;
  uint64_t v648;
  uint64_t v649;
  uint64_t v650;
  uint64_t v651;
  uint64_t v652;
  const char *v653;
  void *v654;
  const char *v655;
  uint64_t v656;
  uint64_t v657;
  uint64_t v658;
  unint64_t v659;
  const char *v660;
  uint64_t v661;
  uint64_t v662;
  uint64_t v663;
  void *v664;
  const char *v665;
  uint64_t v666;
  uint64_t v667;
  uint64_t v668;
  void *v670;
  void *v671;
  void *v672;
  void *v673;
  id v674;
  void *v675;
  void *v676;
  void *v677;
  uint64_t v678;
  uint64_t v679;
  unint64_t v680;
  unint64_t v681;
  void *v682;
  void *v683;
  void *v684;
  id v685;
  id v686;
  void *v687;
  void *v688;
  void *v689;
  void *v690;
  void *v691;
  id v692;
  id obj;
  uint64_t v694;
  id v695;
  id v696;
  unsigned int v697;
  uint64_t v698;
  uint64_t v699;
  uint64_t v700;
  void *v701;
  void *v703;
  uint64_t v704;
  void *v705;
  id v706;
  id v707;
  char v708;
  uint64_t v709;
  void *v710;
  _QWORD v711[4];
  id v712;
  __int128 v713;
  __int128 v714;
  __int128 v715;
  __int128 v716;
  __int128 v717;
  __int128 v718;
  __int128 v719;
  __int128 v720;
  _QWORD v721[4];
  id v722;
  id v723;
  uint64_t *v724;
  uint64_t v725;
  uint64_t v726;
  char v727;
  __int128 v728;
  __int128 v729;
  __int128 v730;
  __int128 v731;
  uint64_t v732;
  uint64_t *v733;
  uint64_t v734;
  uint64_t (*v735)(uint64_t, uint64_t);
  void (*v736)(uint64_t);
  id v737;
  __int128 v738;
  __int128 v739;
  __int128 v740;
  __int128 v741;
  __int128 v742;
  __int128 v743;
  __int128 v744;
  __int128 v745;
  _BYTE v746[128];
  _BYTE v747[128];
  _QWORD v748[2];
  _BYTE v749[128];
  uint8_t v750[128];
  uint8_t buf[136];
  uint64_t v752;

  v752 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v685 = a4;
  v695 = a5;
  v696 = a7;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v11, v12, v13, v14, v15);
  v690 = (void *)objc_claimAutoreleasedReturnValue();
  v740 = 0u;
  v741 = 0u;
  v738 = 0u;
  v739 = 0u;
  obj = v10;
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v738, (uint64_t)v750, 16, v17);
  if (v22)
  {
    v23 = *(_QWORD *)v739;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v739 != v23)
          objc_enumerationMutation(obj);
        objc_msgSend_resultRestoringRawPathInResult_(CHTokenizedTextResult, v18, *(_QWORD *)(*((_QWORD *)&v738 + 1) + 8 * i), v19, v20, v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v690, v26, (uint64_t)v25, v27, v28, v29);

      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v738, (uint64_t)v750, 16, v21);
    }
    while (v22);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v30, v31, v32, v33, v34);
  v674 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v690, v35, a6, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)MEMORY[0x1E0C99DE8];
  v673 = v39;
  v46 = objc_msgSend_tokenColumnCount(v39, v41, v42, v43, v44, v45);
  objc_msgSend_arrayWithCapacity_(v40, v47, v46, v48, v49, v50);
  v51 = objc_claimAutoreleasedReturnValue();
  v57 = 0;
  v708 = 0;
  v58 = MEMORY[0x1E0C9AAA0];
  v59 = MEMORY[0x1E0C9AAB0];
  v684 = (void *)v51;
  while (v57 < objc_msgSend_count(v685, v52, v53, v54, v55, v56))
  {
    objc_msgSend_objectAtIndexedSubscript_(v685, v60, v57, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v65, v66, 1, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend_intValue(v70, v71, v72, v73, v74, v75);
    objc_msgSend_objectAtIndexedSubscript_(v685, v77, v57, v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v81, v82, 2, v83, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend_intValue(v86, v87, v88, v89, v90, v91);

    objc_msgSend_addObject_(v684, v93, v58, v94, v95, v96);
    if (v76 + 1 < (unint64_t)(v92 + (uint64_t)v76))
    {
      v97 = v92 - 1;
      do
      {
        objc_msgSend_addObject_(v684, v52, v59, v54, v55, v56);
        --v97;
      }
      while (v97);
      v708 = 1;
    }
    ++v57;
  }
  if ((v708 & 1) != 0)
  {
    objc_msgSend_compressResult_atColumnIndexes_(CHTokenizedTextResult, v60, (uint64_t)v673, (uint64_t)v684, v63, v64);
    v98 = objc_claimAutoreleasedReturnValue();
    v104 = 0x1E0C99000;
  }
  else
  {
    v98 = objc_msgSend_mutableCopy(v673, v60, v61, v62, v63, v64);
    v104 = 0x1E0C99000uLL;
  }
  v105 = (void *)v98;
  objc_msgSend_array(*(void **)(v104 + 3560), v99, v100, v101, v102, v103);
  v671 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = *(void **)(v104 + 3560);
  v682 = v105;
  objc_msgSend_transcriptionPaths(v105, v107, v108, v109, v110, v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithArray_(v106, v113, (uint64_t)v112, v114, v115, v116);
  v677 = (void *)objc_claimAutoreleasedReturnValue();

  v117 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_transcriptionPathScores(v682, v118, v119, v120, v121, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithArray_(v117, v124, (uint64_t)v123, v125, v126, v127);
  v672 = (void *)objc_claimAutoreleasedReturnValue();

  v128 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_transcriptionPaths(v682, v129, v130, v131, v132, v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v134, v135, v136, v137, v138, v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v682, v141, v142, v143, v144, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v146, v147, v148, v149, v150, v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObjects_(v128, v153, (uint64_t)v140, v154, v155, v156, v152, 0);
  v676 = (void *)objc_claimAutoreleasedReturnValue();

  v680 = 0;
  v732 = 0;
  v733 = &v732;
  v734 = 0x3032000000;
  v735 = sub_1BE74350C;
  v736 = sub_1BE74351C;
  v737 = 0;
  v694 = *MEMORY[0x1E0C997E8];
  while (v680 < objc_msgSend_count(v685, v157, v158, v159, v160, v161))
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v162, v163, v164, v165, v166);
    v701 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v685, v167, v680, v168, v169, v170);
    v670 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v670, v171, 0, v172, v173, v174);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = objc_msgSend_intValue(v175, v176, v177, v178, v179, v180);

    objc_msgSend_transcriptionPaths(v682, v182, v183, v184, v185, v186);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v187, v188, 0, v189, v190, v191);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v679 = objc_msgSend_indexAtPosition_(v192, v193, v680, v194, v195, v196);

    objc_msgSend_tokenColumns(v682, v197, v198, v199, v200, v201);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v202, v203, v680, v204, v205, v206);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_textTokenRows(v207, v208, v209, v210, v211, v212);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v213, v214, v679, v215, v216, v217);
    v675 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_firstObject(v675, v218, v219, v220, v221, v222);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v207) = objc_msgSend_properties(v223, v224, v225, v226, v227, v228);

    v681 = 0;
    v678 = v181;
    v697 = (v207 >> 5) & 1;
    while (1)
    {
      objc_msgSend_tokenColumns(v682, v229, v230, v231, v232, v233);
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v234, v235, v680, v236, v237, v238);
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_textTokenRows(v239, v240, v241, v242, v243, v244);
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      v251 = v681 < objc_msgSend_count(v245, v246, v247, v248, v249, v250);

      if (!v251)
        break;
      if (v681 == v679 && v678 != a6)
      {
        objc_msgSend_objectAtIndexedSubscript_(v690, v252, v678, v254, v255, v256);
        v703 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v685, v257, v680, v258, v259, v260);
        v261 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v261, v262, 3, v263, v264, v265);
        v266 = (void *)objc_claimAutoreleasedReturnValue();
        v272 = objc_msgSend_intValue(v266, v267, v268, v269, v270, v271);
        objc_msgSend_objectAtIndexedSubscript_(v685, v273, v680, v274, v275, v276);
        v277 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v277, v278, 4, v279, v280, v281);
        v282 = (void *)objc_claimAutoreleasedReturnValue();
        v288 = objc_msgSend_intValue(v282, v283, v284, v285, v286, v287);

        v730 = 0u;
        v731 = 0u;
        v728 = 0u;
        v729 = 0u;
        objc_msgSend_transcriptionPaths(v703, v289, v290, v291, v292, v293);
        v294 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v294, v295, 0, v296, v297, v298);
        v299 = (void *)objc_claimAutoreleasedReturnValue();
        v748[0] = v299;
        -[CHTokenizedTextResult rawTranscriptionPath]_0((uint64_t)v703);
        v300 = (void *)objc_claimAutoreleasedReturnValue();
        v748[1] = v300;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v301, (uint64_t)v748, 2, v302, v303);
        v692 = (id)objc_claimAutoreleasedReturnValue();

        v704 = objc_msgSend_countByEnumeratingWithState_objects_count_(v692, v304, (uint64_t)&v728, (uint64_t)v749, 16, v305);
        if (!v704)
          goto LABEL_75;
        v698 = v288;
        v699 = v272;
        v700 = *(_QWORD *)v729;
        while (1)
        {
          v709 = 0;
          do
          {
            if (*(_QWORD *)v729 != v700)
              objc_enumerationMutation(v692);
            v311 = *(_QWORD *)(*((_QWORD *)&v728 + 1) + 8 * v709);
            objc_msgSend_array(MEMORY[0x1E0C99DE8], v306, v307, v308, v309, v310);
            v312 = (void *)objc_claimAutoreleasedReturnValue();
            v721[0] = MEMORY[0x1E0C809B0];
            v721[1] = 3221225472;
            v721[2] = sub_1BE74D4BC;
            v721[3] = &unk_1E77F49E0;
            v726 = v698;
            v727 = v697;
            v725 = v699;
            v724 = &v732;
            v722 = v696;
            v313 = v312;
            v723 = v313;
            objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v703, v314, v311, v699, v698, (uint64_t)v721);
            objc_msgSend_objectAtIndex_(v695, v315, a6, v316, v317, v318);
            v705 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v705, v319, v694, v320, v321, v322);
            v706 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_characterDirectionForLanguage_(MEMORY[0x1E0C99DC8], v323, (uint64_t)v706, v324, v325, v326) == 2)
            {
              objc_msgSend_objectAtIndexedSubscript_(obj, v327, 0, v328, v329, v330);
              v331 = (void *)objc_claimAutoreleasedReturnValue();
              v337 = objc_msgSend_baseWritingDirection(v331, v332, v333, v334, v335, v336);

              if (v337 == 1)
              {
                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v338 = (id)qword_1EF568E18[0];
                if (os_log_type_enabled(v338, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BE607000, v338, OS_LOG_TYPE_DEBUG, "BiDi Swapping : visual->logical transform might be needed in secondary recognizer. First locale is RTL and base direction of first result is also RTL.", buf, 2u);
                }

                v719 = 0u;
                v720 = 0u;
                v717 = 0u;
                v718 = 0u;
                v339 = v313;
                v342 = 0;
                v347 = objc_msgSend_countByEnumeratingWithState_objects_count_(v339, v340, (uint64_t)&v717, (uint64_t)v747, 16, v341);
                if (v347)
                {
                  v348 = *(_QWORD *)v718;
                  do
                  {
                    for (j = 0; j != v347; ++j)
                    {
                      while (1)
                      {
                        if (*(_QWORD *)v718 != v348)
                          objc_enumerationMutation(v339);
                        v350 = *(void **)(*((_QWORD *)&v717 + 1) + 8 * j);
                        if (!v342)
                          break;
                        sub_1BE637DE0((uint64_t)v342, v350);
                        if (v347 == ++j)
                          goto LABEL_43;
                      }
                      v342 = (void *)objc_msgSend_mutableCopy(*(void **)(*((_QWORD *)&v717 + 1) + 8 * j), (const char *)v350, v343, v344, v345, v346);
                    }
LABEL_43:
                    v347 = objc_msgSend_countByEnumeratingWithState_objects_count_(v339, v351, (uint64_t)&v717, (uint64_t)v747, 16, v346);
                  }
                  while (v347);
                }

                if (qword_1EF5681E0 == -1)
                {
                  if (v342)
                    goto LABEL_46;
LABEL_48:
                  if (qword_1EF568E88 != -1)
                    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                  v377 = (id)qword_1EF568E18[0];
                  if (os_log_type_enabled(v377, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1BE607000, v377, OS_LOG_TYPE_DEBUG, "BiDi Swapping : visual->logical transform was not needed since the secondary recognizer results were all strong LTR.", buf, 2u);
                  }
                  v313 = v339;
                }
                else
                {
                  dispatch_once(&qword_1EF5681E0, &unk_1E77F4A00);
                  if (!v342)
                    goto LABEL_48;
LABEL_46:
                  objc_msgSend_string(v342, v352, v353, v354, v355, v356);
                  v357 = (void *)objc_claimAutoreleasedReturnValue();
                  v358 = (void *)qword_1EF5681D8;
                  v359 = v357;
                  v360 = v358;
                  if (objc_msgSend_length(v359, v361, v362, v363, v364, v365))
                  {
                    objc_msgSend_stringByTrimmingCharactersInSet_(v359, v366, (uint64_t)v360, v367, v368, v369);
                    v370 = (void *)objc_claimAutoreleasedReturnValue();
                    v376 = objc_msgSend_length(v370, v371, v372, v373, v374, v375) == 0;

                    if (v376)
                      goto LABEL_48;
                  }
                  else
                  {

                  }
                  v378 = v342;
                  objc_opt_self();
                  objc_msgSend_string(v378, v379, v380, v381, v382, v383);
                  v689 = (void *)objc_claimAutoreleasedReturnValue();
                  v691 = v378;
                  v686 = objc_alloc_init(MEMORY[0x1E0DBEC50]);
                  objc_msgSend_transformVisualToLogical_visualDirectionality_logicalBaseDirectionality_baseDirectionalityPredictionMode_outTokenizedLogicalOrderIndexes_outReorderingPermutation_outMirroredVisualString_outLogicalBaseDirection_(v686, v384, (uint64_t)v689, 1, 2, 0, 0, 0, 0, 0);
                  v390 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v390)
                    v390 = (void *)objc_msgSend_copy(v689, v385, v386, v387, v388, v389);
                  objc_msgSend_componentsSeparatedByString_(v390, v385, (uint64_t)CFSTR(" "), v387, v388, v389);
                  v688 = (void *)objc_claimAutoreleasedReturnValue();
                  v687 = v390;
                  objc_msgSend_string(MEMORY[0x1E0CB37A0], v391, v392, v393, v394, v395);
                  v396 = (void *)objc_claimAutoreleasedReturnValue();
                  v744 = 0u;
                  v745 = 0u;
                  v742 = 0u;
                  v743 = 0u;
                  v397 = v688;
                  v405 = objc_msgSend_countByEnumeratingWithState_objects_count_(v397, v398, (uint64_t)&v742, (uint64_t)buf, 16, v399);
                  if (v405)
                  {
                    v406 = *(_QWORD *)v743;
                    do
                    {
                      for (k = 0; k != v405; ++k)
                      {
                        if (*(_QWORD *)v743 != v406)
                          objc_enumerationMutation(v397);
                        v408 = *(_QWORD *)(*((_QWORD *)&v742 + 1) + 8 * k);
                        if (objc_msgSend_length(v396, v400, v401, v402, v403, v404))
                          objc_msgSend_appendString_(v396, v409, (uint64_t)CFSTR(" "), v410, v411, v412);
                        v413 = (void *)objc_opt_class();
                        objc_msgSend_performInverseBiDiForNumeric_isRTLContext_(v413, v414, v408, 1, v415, v416);
                        v417 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_appendString_(v396, v418, (uint64_t)v417, v419, v420, v421);

                      }
                      v405 = objc_msgSend_countByEnumeratingWithState_objects_count_(v397, v400, (uint64_t)&v742, (uint64_t)buf, 16, v404);
                    }
                    while (v405);
                  }

                  v422 = v396;
                  objc_msgSend_setString_(v691, v423, (uint64_t)v422, v424, v425, v426);

                  objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v427, (uint64_t)v691, v428, v429, v430);
                  v313 = (id)objc_claimAutoreleasedReturnValue();

                  if (qword_1EF568E88 != -1)
                    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                  v377 = (id)qword_1EF568E18[0];
                  if (os_log_type_enabled(v377, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1BE607000, v377, OS_LOG_TYPE_DEBUG, "BiDi Swapping : visual->logical transform performed since the secondary recognizer results contained some weak characters.", buf, 2u);
                  }
                }

              }
            }
            objc_msgSend_addObject_(v701, v327, (uint64_t)v313, v328, v329, v330);

            ++v709;
          }
          while (v709 != v704);
          v431 = objc_msgSend_countByEnumeratingWithState_objects_count_(v692, v306, (uint64_t)&v728, (uint64_t)v749, 16, v310);
          v704 = v431;
          if (!v431)
          {
LABEL_75:

            v708 = 1;
            break;
          }
        }
      }
      objc_msgSend_tokenColumns(v682, v252, v253, v254, v255, v256);
      v432 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v432, v433, v680, v434, v435, v436);
      v437 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_textTokenRows(v437, v438, v439, v440, v441, v442);
      v443 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v443, v444, v681, v445, v446, v447);
      v448 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v701, v449, (uint64_t)v448, v450, v451, v452);

      ++v681;
    }
    if (v678 != a6)
    {
      for (m = 0; ; ++m)
      {
        objc_msgSend_transcriptionPaths(v682, v252, v253, v254, v255, v256);
        v454 = (void *)objc_claimAutoreleasedReturnValue();
        v460 = m < objc_msgSend_count(v454, v455, v456, v457, v458, v459);

        if (!v460)
          break;
        objc_msgSend_transcriptionPaths(v682, v461, v462, v463, v464, v465);
        v466 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v466, v467, m, v468, v469, v470);
        v471 = (void *)objc_claimAutoreleasedReturnValue();
        v476 = objc_msgSend_indexAtPosition_(v471, v472, v680, v473, v474, v475);

        if (v476 >= v679)
        {
          objc_msgSend_objectAtIndexedSubscript_(v677, v252, m, v254, v255, v256);
          v477 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
          modifyIndexPath(v477, v680, v476 + 2);
          v478 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_atIndexedSubscript_(v677, v479, (uint64_t)v478, m, v480, v481);

        }
      }
      objc_msgSend_objectAtIndexedSubscript_(v676, v461, 1, v463, v464, v465);
      v482 = (void *)objc_claimAutoreleasedReturnValue();
      v487 = objc_msgSend_indexAtPosition_(v482, v483, v680, v484, v485, v486);

      if (v487 >= v679)
      {
        objc_msgSend_objectAtIndexedSubscript_(v676, v252, 1, v254, v255, v256);
        v488 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
        modifyIndexPath(v488, v680, v487 + 1);
        v489 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_atIndexedSubscript_(v676, v490, (uint64_t)v489, 1, v491, v492);

      }
    }
    objc_msgSend_transcriptionPaths(v682, v252, v253, v254, v255, v256);
    v493 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v493, v494, v495, v496, v497, v498);
    v499 = (void *)objc_claimAutoreleasedReturnValue();
    v505 = objc_msgSend_count(v671, v500, v501, v502, v503, v504);
    v510 = objc_msgSend_indexAtPosition_(v499, v506, v505, v507, v508, v509);

    objc_msgSend_objectAtIndexedSubscript_(v701, v511, v510, v512, v513, v514);
    v515 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v515, v516, v517, v518, v519, v520);
    v521 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_string(v521, v522, v523, v524, v525, v526);
    v527 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastComposedCharacter(v527, v528, v529, v530, v531, v532);
    v533 = objc_claimAutoreleasedReturnValue();
    v534 = (void *)v733[5];
    v733[5] = v533;

    v535 = [CHMutableTokenizedResultColumn alloc];
    v540 = (void *)objc_msgSend_initWithTokenRows_(v535, v536, (uint64_t)v701, v537, v538, v539);
    objc_msgSend_addObject_(v671, v541, (uint64_t)v540, v542, v543, v544);

    ++v680;
  }
  objc_msgSend_firstObject(v677, v162, v163, v164, v165, v166);
  v545 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v682, v546, v547, v548, v549, v550);
  v551 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v551, v552, v553, v554, v555, v556);
  v557 = (void *)objc_claimAutoreleasedReturnValue();
  v562 = objc_msgSend_compare_(v545, v558, (uint64_t)v557, v559, v560, v561) == 0;

  v568 = v682;
  v569 = 0x1E0C99000uLL;
  if (!v562)
  {
    for (n = 0; n < objc_msgSend_count(v676, v563, v564, v565, v566, v567); ++n)
    {
      objc_msgSend_objectAtIndexedSubscript_(v676, v563, n, v565, v566, v567);
      v571 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_insertObject_atIndex_(v677, v572, (uint64_t)v571, n, v573, v574);

      objc_msgSend_transcriptionPathScores(v682, v575, v576, v577, v578, v579);
      v580 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v580, v581, v582, v583, v584, v585);
      v586 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_insertObject_atIndex_(v672, v587, (uint64_t)v586, 0, v588, v589);

      v568 = v682;
      v569 = 0x1E0C99000;
    }
  }
  objc_msgSend_setTokenColumns_(v568, v563, (uint64_t)v671, v565, v566, v567);
  objc_msgSend_setTranscriptionPaths_scores_(v568, v590, (uint64_t)v677, (uint64_t)v672, v591, v592);
  if ((v708 & 1) != 0)
  {
    objc_msgSend_array(*(void **)(v569 + 3560), v593, v594, v595, v596, v597);
    v710 = (void *)objc_claimAutoreleasedReturnValue();
    v715 = 0u;
    v716 = 0u;
    v713 = 0u;
    v714 = 0u;
    objc_msgSend_transcriptionPaths(v568, v598, v599, v600, v601, v602);
    v603 = (void *)objc_claimAutoreleasedReturnValue();
    v707 = v603;
    v611 = objc_msgSend_countByEnumeratingWithState_objects_count_(v603, v604, (uint64_t)&v713, (uint64_t)v746, 16, v605);
    if (v611)
    {
      v612 = *(_QWORD *)v714;
      do
      {
        for (ii = 0; ii != v611; ++ii)
        {
          if (*(_QWORD *)v714 != v612)
            objc_enumerationMutation(v707);
          v614 = *(_QWORD *)(*((_QWORD *)&v713 + 1) + 8 * ii);
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v606, v607, v608, v609, v610);
          v615 = (void *)objc_claimAutoreleasedReturnValue();
          v621 = objc_msgSend_tokenColumnCount(v682, v616, v617, v618, v619, v620);
          v711[0] = MEMORY[0x1E0C809B0];
          v711[1] = 3221225472;
          v711[2] = sub_1BE74D720;
          v711[3] = &unk_1E77F4928;
          v622 = v615;
          v712 = v622;
          objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v682, v623, v614, 0, v621, (uint64_t)v711);
          objc_msgSend_addObject_(v710, v624, (uint64_t)v622, v625, v626, v627);

        }
        v603 = v707;
        v611 = objc_msgSend_countByEnumeratingWithState_objects_count_(v707, v606, (uint64_t)&v713, (uint64_t)v746, 16, v610);
      }
      while (v611);
    }

    objc_msgSend_inputStrokeIdentifiers(v682, v628, v629, v630, v631, v632);
    v633 = (void *)objc_claimAutoreleasedReturnValue();
    v634 = [CHMutableTokenizedTextResult alloc];
    objc_msgSend_transcriptionPathScores(v682, v635, v636, v637, v638, v639);
    v640 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trailingSeparator(v682, v641, v642, v643, v644, v645);
    v646 = (void *)objc_claimAutoreleasedReturnValue();
    v652 = objc_msgSend_recognizerGenerationIdentifier(v682, v647, v648, v649, v650, v651);
    v654 = (void *)objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_(v634, v653, (uint64_t)v710, (uint64_t)v640, (uint64_t)v646, v652);

    objc_msgSend_setInputStrokeIdentifiers_(v654, v655, (uint64_t)v633, v656, v657, v658);
    v568 = v654;
  }
  v659 = 0;
  v683 = v568;
  while (v659 < objc_msgSend_count(v690, v593, v594, v595, v596, v597))
  {
    if (a6 == v659)
    {
      objc_msgSend_addObject_(v674, v660, (uint64_t)v568, v661, v662, v663);
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(v690, v660, v659, v661, v662, v663);
      v664 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v674, v665, (uint64_t)v664, v666, v667, v668);

      v568 = v683;
    }
    ++v659;
  }
  _Block_object_dispose(&v732, 8);

  return v674;
}

- (id)commonTopStrokeSetsWithResult:(id)a3 shouldReverseOtherColumns:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
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
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  NSObject *v80;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  void *v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v4 = a4;
  v96 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  objc_msgSend_tokenColumns(self, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v86, (uint64_t)v95, 16, v20);
  if (v26)
  {
    v27 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v87 != v27)
          objc_enumerationMutation(v18);
        objc_msgSend_strokeIndexes(*(void **)(*((_QWORD *)&v86 + 1) + 8 * i), v21, v22, v23, v24, v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v12, v30, (uint64_t)v29, v31, v32, v33);

      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v86, (uint64_t)v95, 16, v25);
    }
    while (v26);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v34, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenColumns(v6, v40, v41, v42, v43, v44);
  if (v4)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_reverseObjectEnumerator(v45, v46, v47, v48, v49, v50);
  }
  else
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectEnumerator(v45, v51, v52, v53, v54, v55);
  }
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v57 = v56;
  v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v82, (uint64_t)v94, 16, v59);
  if (v65)
  {
    v66 = *(_QWORD *)v83;
    do
    {
      for (j = 0; j != v65; ++j)
      {
        if (*(_QWORD *)v83 != v66)
          objc_enumerationMutation(v57);
        objc_msgSend_strokeIndexes(*(void **)(*((_QWORD *)&v82 + 1) + 8 * j), v60, v61, v62, v63, v64, (_QWORD)v82);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v39, v69, (uint64_t)v68, v70, v71, v72);

      }
      v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v60, (uint64_t)&v82, (uint64_t)v94, 16, v64);
    }
    while (v65);
  }

  commonIndexSetsFromSets(v12, v39);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v73, v74, v75, v76, v77, v78))
  {
    v79 = v73;
  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v80 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v91 = v12;
      v92 = 2112;
      v93 = v39;
      _os_log_impl(&dword_1BE607000, v80, OS_LOG_TYPE_ERROR, "Unexpected failure to find common stroke sets between top stroke sets %@ and other stroke sets %@.", buf, 0x16u);
    }

    v79 = 0;
  }

  return v79;
}

- (id)tokenizedTextResultByAppendingTokenizedTextResult:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
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
  float v67;
  float v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  double v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
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
  uint64_t v122;
  float v123;
  float v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  id v137;
  const char *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  CHTokenizedTextResult *v171;
  const char *v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  CHTokenizedTextResult *v179;
  unint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  _QWORD v185[4];
  id v186;
  id v187;
  uint64_t v188;
  _QWORD v189[4];
  id v190;

  v4 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7, v8, v9);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12, v13, v14);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIndexes(self, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_count(v20, v21, v22, v23, v24, v25);

  v32 = 0;
  v33 = MEMORY[0x1E0C809B0];
  v179 = self;
  while (1)
  {
    objc_msgSend_transcriptionPaths(self, v27, v28, v29, v30, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend_count(v34, v35, v36, v37, v38, v39);

    if (v32 >= v40)
      break;
    objc_msgSend_transcriptionPaths(self, v41, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v46, v47, v32, v48, v49, v50);
    v182 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_transcriptionPathScores(self, v51, v52, v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v56, v57, v32, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v61, v62, v63, v64, v65, v66);
    v68 = v67;

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v69, v70, v71, v72, v73);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = v32;
    v79 = objc_msgSend_tokenColumnCount(self, v74, v75, v76, v77, v78);
    v189[0] = v33;
    v189[1] = 3221225472;
    v189[2] = sub_1BE74DFD0;
    v189[3] = &unk_1E77F4928;
    v80 = v181;
    v190 = v80;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v81, (uint64_t)v182, 0, v79, (uint64_t)v189);
    v87 = 0;
    v88 = v68;
    while (1)
    {
      objc_msgSend_transcriptionPaths(v4, v82, v83, v84, v85, v86);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend_count(v89, v90, v91, v92, v93, v94);

      if (v87 >= v95)
        break;
      objc_msgSend_transcriptionPaths(v4, v96, v97, v98, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v101, v102, v87, v103, v104, v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_transcriptionPathScores(v4, v107, v108, v109, v110, v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v112, v113, v87, v114, v115, v116);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v117, v118, v119, v120, v121, v122);
      v124 = v123;

      v130 = (void *)objc_msgSend_mutableCopy(v80, v125, v126, v127, v128, v129);
      v136 = objc_msgSend_tokenColumnCount(v4, v131, v132, v133, v134, v135);
      v185[0] = v33;
      v185[1] = 3221225472;
      v185[2] = sub_1BE74DFDC;
      v185[3] = &unk_1E77F4A28;
      v188 = v26;
      v137 = v130;
      v186 = v137;
      v187 = v4;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v187, v138, (uint64_t)v106, 0, v136, (uint64_t)v185);
      v144 = (void *)objc_msgSend_copy(v137, v139, v140, v141, v142, v143);
      objc_msgSend_addObject_(v184, v145, (uint64_t)v144, v146, v147, v148);

      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v149, v150, v151, v152, v153, v88 * v124);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v183, v155, (uint64_t)v154, v156, v157, v158);

      ++v87;
    }

    self = v179;
    v32 = v180 + 1;
  }
  objc_msgSend_inputStrokeIdentifiers(self, v41, v42, v43, v44, v45);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputStrokeIdentifiers(v4, v160, v161, v162, v163, v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(v159, v166, (uint64_t)v165, v167, v168, v169);
  v170 = (void *)objc_claimAutoreleasedReturnValue();

  v171 = [CHTokenizedTextResult alloc];
  v173 = (void *)objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_(v171, v172, (uint64_t)v184, (uint64_t)v183, (uint64_t)&stru_1E77F6F28, 2);
  objc_msgSend_setInputStrokeIdentifiers_(v173, v174, (uint64_t)v170, v175, v176, v177);

  return v173;
}

- (NSString)trailingSeparator
{
  return self->_trailingSeparator;
}

- (NSArray)transcriptionPaths
{
  return self->_transcriptionPaths;
}

- (NSArray)transcriptionPathScores
{
  return self->_transcriptionPathScores;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingSeparator, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_inputStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_transcriptionPathScores, 0);
  objc_storeStrong((id *)&self->_transcriptionPaths, 0);
  objc_storeStrong((id *)&self->_tokenColumns, 0);
}

@end

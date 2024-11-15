@implementation CHTextRecognitionResult

- (CHTextRecognitionResult)initWithString:(id)a3 score:(double)a4 wordRanges:(id)a5 wordIDs:(id)a6 wordRecognitionScores:(id)a7 wordCombinedScores:(id)a8 wordStrokeSets:(id)a9 wordLexicalEntries:(id)a10 wordPatternEntries:(id)a11 rareWordIndexes:(id)a12 inappropriateWordIndexes:(id)a13 isTextReplacement:(BOOL)a14
{
  CHTextRecognitionResult *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id *p_isa;
  CHTextRecognitionResult *v28;
  NSString *string;
  uint64_t v30;
  NSString *v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  NSString *v42;
  objc_super v43;

  v42 = (NSString *)a3;
  v41 = a5;
  v40 = a6;
  v39 = a7;
  v38 = a8;
  v37 = a9;
  v36 = a10;
  v35 = a11;
  v34 = a12;
  v33 = a13;
  v43.receiver = self;
  v43.super_class = (Class)CHTextRecognitionResult;
  v21 = -[CHRecognitionResult initWithScore:](&v43, sel_initWithScore_, a4);
  p_isa = (id *)&v21->super.super.isa;
  v28 = v21;
  if (v21)
  {
    string = v21->_string;
    if (string != v42)
    {
      v21->_string = 0;

    }
    v30 = objc_msgSend_copy(v42, v22, v23, v24, v25, v26);
    v31 = v28->_string;
    v28->_string = (NSString *)v30;

    objc_storeStrong(p_isa + 4, a5);
    objc_storeStrong(p_isa + 5, a6);
    objc_storeStrong(p_isa + 6, a7);
    objc_storeStrong(p_isa + 7, a8);
    objc_storeStrong(p_isa + 8, a9);
    objc_storeStrong(p_isa + 9, a10);
    objc_storeStrong(p_isa + 10, a11);
    objc_storeStrong(p_isa + 11, a12);
    objc_storeStrong(p_isa + 12, a13);
    v28->_isTextReplacement = a14;
  }

  return v28;
}

- (id)mecabraCandidate
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
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
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  const char **v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v75;
  CHTextRecognitionResult *v76;
  uint64_t *v77;
  char *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  objc_msgSend_wordIDs(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_count(v7, v8, v9, v10, v11, v12);

  if (!v13)
    return 0;
  objc_msgSend_wordRanges(self, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_count(v19, v20, v21, v22, v23, v24);

  if (v13 != v25)
    return 0;
  v77 = &v75;
  MEMORY[0x1E0C80A78](v26);
  v28 = (char *)&v75 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend_wordIDs(self, v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v83, (uint64_t)v88, 16, v36);
  if (v42)
  {
    v43 = 0;
    v44 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v84 != v44)
          objc_enumerationMutation(v34);
        *(_DWORD *)&v28[4 * v43 + 4 * i] = objc_msgSend_unsignedIntValue(*(void **)(*((_QWORD *)&v83 + 1) + 8 * i), v37, v38, v39, v40, v41);
      }
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v83, (uint64_t)v88, 16, v41);
      v43 += i;
    }
    while (v42);
  }

  MEMORY[0x1E0C80A78](v46);
  v78 = (char *)&v75 - v47;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  objc_msgSend_wordRanges(self, v48, v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = self;
  v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v79, (uint64_t)v87, 16, v55);
  if (v61)
  {
    v62 = 0;
    v63 = *(_QWORD *)v80;
    v64 = v78 + 8;
    do
    {
      v65 = 0;
      v66 = (const char **)&v64[16 * v62];
      do
      {
        if (*(_QWORD *)v80 != v63)
          objc_enumerationMutation(v53);
        *(v66 - 1) = (const char *)objc_msgSend_rangeValue(*(void **)(*((_QWORD *)&v79 + 1) + 8 * v65), v56, v57, v58, v59, v60);
        *v66 = v56;
        ++v65;
        v66 += 2;
      }
      while (v61 != v65);
      v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v79, (uint64_t)v87, 16, v60);
      v62 += v65;
    }
    while (v61);
  }

  objc_msgSend_string(v76, v67, v68, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  MecabraCreateHandwritingCandidate();
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  return v73;
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)wordRanges
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)wordIDs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)wordRecognitionScores
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)wordCombinedScores
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)wordStrokeSets
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)wordLexicalEntries
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)wordPatternEntries
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (NSIndexSet)rareWordIndexes
{
  return (NSIndexSet *)objc_getProperty(self, a2, 88, 1);
}

- (NSIndexSet)inappropriateWordIndexes
{
  return (NSIndexSet *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isTextReplacement
{
  return self->_isTextReplacement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inappropriateWordIndexes, 0);
  objc_storeStrong((id *)&self->_rareWordIndexes, 0);
  objc_storeStrong((id *)&self->_wordPatternEntries, 0);
  objc_storeStrong((id *)&self->_wordLexicalEntries, 0);
  objc_storeStrong((id *)&self->_wordStrokeSets, 0);
  objc_storeStrong((id *)&self->_wordCombinedScores, 0);
  objc_storeStrong((id *)&self->_wordRecognitionScores, 0);
  objc_storeStrong((id *)&self->_wordIDs, 0);
  objc_storeStrong((id *)&self->_wordRanges, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end

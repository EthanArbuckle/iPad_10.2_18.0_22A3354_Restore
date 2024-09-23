@implementation CHRecognizerResultCache

- (CHRecognizerResultCache)init
{
  CHRecognizerResultCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *lastDrawings;
  NSMutableDictionary *v5;
  NSMutableDictionary *textResults;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CHRecognizerResultCache;
  v2 = -[CHRecognizerResultCache init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lastDrawings = v2->_lastDrawings;
    v2->_lastDrawings = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    textResults = v2->_textResults;
    v2->_textResults = v5;

  }
  return v2;
}

- (void)cacheTextResult:(id)a3 drawing:(id)a4 recognitionEngineCachingKey:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
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
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;

  v37 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_objectForKeyedSubscript_(self->_lastDrawings, v10, (uint64_t)v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToDrawing_(v14, v15, (uint64_t)v8, v16, v17, v18) & 1) == 0)
  {
    v24 = (void *)objc_msgSend_copy(v37, v19, v20, v21, v22, v23);
    objc_msgSend_setObject_forKeyedSubscript_(self->_textResults, v25, (uint64_t)v24, (uint64_t)v9, v26, v27);

    v33 = (void *)objc_msgSend_copy(v8, v28, v29, v30, v31, v32);
    objc_msgSend_setObject_forKeyedSubscript_(self->_lastDrawings, v34, (uint64_t)v33, (uint64_t)v9, v35, v36);

  }
}

- (id)retrievePartialResultsForDrawing:(id)a3 recognitionEngineCachingKey:(id)a4 matchingColumnRange:(_NSRange *)a5
{
  id v8;
  id v9;
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
  unint64_t v25;
  uint64_t v26;
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
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
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
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSUInteger v80;
  NSUInteger v81;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSMutableDictionary *textResults;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
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
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  id v122;

  v8 = a3;
  v9 = a4;
  objc_msgSend_objectForKeyedSubscript_(self->_lastDrawings, v10, (uint64_t)v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_matchingStrokePrefixRangeForDrawing_(v14, v15, (uint64_t)v8, v16, v17, v18);
  v25 = (unint64_t)v20;
  if (!v20)
  {
    objc_msgSend_clearCacheForKey_(self, 0, (uint64_t)v9, v22, v23, v24);
    v80 = 0;
    v38 = 0;
    v81 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a5)
      goto LABEL_15;
    goto LABEL_14;
  }
  v26 = v19;
  if (v20 == (const char *)objc_msgSend_strokeCount(v14, v20, v21, v22, v23, v24)
    && v25 < objc_msgSend_strokeCount(v8, v27, v28, v29, v30, v31))
  {
    objc_msgSend_objectForKeyedSubscript_(self->_textResults, v27, (uint64_t)v9, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v32;
    if (v32)
    {
LABEL_18:
      v80 = objc_msgSend_tokenColumnCount(v32, v33, v34, v35, v36, v37);
      v81 = 0;
      if (!a5)
        goto LABEL_15;
      goto LABEL_14;
    }
    goto LABEL_26;
  }
  if (v25 < objc_msgSend_strokeCount(v14, v27, v28, v29, v30, v31)
    && v25 == objc_msgSend_strokeCount(v8, v39, v40, v41, v42, v43))
  {
    objc_msgSend_objectForKeyedSubscript_(self->_textResults, v39, (uint64_t)v9, v41, v42, v43);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v54 = objc_msgSend_strokeCount(v14, v44, v45, v46, v47, v48) - v25;
      if (v54 < 1)
      {
        v79 = 0;
      }
      else
      {
        v55 = 0;
        do
        {
          objc_msgSend_tokenColumns(v38, v49, v50, v51, v52, v53);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend_tokenColumnCount(v38, v57, v58, v59, v60, v61);
          objc_msgSend_objectAtIndexedSubscript_(v56, v63, v55 + v62 - 1, v64, v65, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeIndexes(v67, v68, v69, v70, v71, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v54 -= objc_msgSend_count(v73, v74, v75, v76, v77, v78);

          --v55;
        }
        while (v54 > 0);
        v79 = -v55;
      }
      v120 = objc_msgSend_tokenColumnCount(v38, v49, v50, v51, v52, v53);
      v81 = 0;
      v80 = v120 - v79;
      if (!a5)
        goto LABEL_15;
LABEL_14:
      a5->location = v81;
      a5->length = v80;
      goto LABEL_15;
    }
    goto LABEL_26;
  }
  v87 = objc_msgSend_strokeCount(v8, v39, v40, v41, v42, v43);
  textResults = self->_textResults;
  if (v25 == v87)
  {
    objc_msgSend_objectForKeyedSubscript_(textResults, v83, (uint64_t)v9, v84, v85, v86);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v32;
    if (v32)
      goto LABEL_18;
    goto LABEL_26;
  }
  objc_msgSend_objectForKeyedSubscript_(textResults, v83, (uint64_t)v9, v84, v85, v86);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
LABEL_26:
    v80 = 0;
    v81 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a5)
      goto LABEL_15;
    goto LABEL_14;
  }
  v121 = v9;
  v122 = v8;
  v94 = 0;
  v95 = 0;
  v96 = v26 + v25;
  v97 = 0x7FFFFFFFFFFFFFFFLL;
  while (v95 < objc_msgSend_tokenColumnCount(v38, v89, v90, v91, v92, v93, v121, v122))
  {
    objc_msgSend_tokenColumns(v38, v98, v99, v100, v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v103, v104, v95, v105, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIndexes(v108, v109, v110, v111, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v94 += objc_msgSend_count(v114, v115, v116, v117, v118, v119);

    if (v94 <= v96)
      v97 = v95;
    ++v95;
  }
  v81 = 0x7FFFFFFFFFFFFFFFLL;
  if (v97 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v80 = 0;
  }
  else
  {
    v81 = 0;
    v80 = v97 + 1;
  }
  v9 = v121;
  v8 = v122;
  if (a5)
    goto LABEL_14;
LABEL_15:

  return v38;
}

- (void)clearCacheForKey:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend_removeObjectForKey_(self->_lastDrawings, v4, (uint64_t)v12, v5, v6, v7);
  objc_msgSend_removeObjectForKey_(self->_textResults, v8, (uint64_t)v12, v9, v10, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textResults, 0);
  objc_storeStrong((id *)&self->_lastDrawings, 0);
}

@end

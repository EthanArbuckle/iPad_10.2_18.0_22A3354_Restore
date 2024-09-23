@implementation PKTextInputDebugArchivedLogEntry

- (PKTextInputDebugArchivedLogEntry)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  PKTextInputDebugArchivedLogEntry *v7;
  uint64_t v8;
  NSDictionary *logDictionary;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  BOOL v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  PKTextInputDebugArchivedLogEntry *v38;
  void *v40;
  char isKindOfClass;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  objc_super v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PKTextInputDebugArchivedLogEntry;
  v7 = -[PKTextInputDebugArchivedLogEntry init](&v47, sel_init);
  if (!v7)
  {
    v33 = 0;
    v11 = &stru_1E777DEE8;
    if (!a4)
      goto LABEL_29;
    goto LABEL_28;
  }
  v8 = objc_msgSend(v6, "copy");
  logDictionary = v7->_logDictionary;
  v7->_logDictionary = (NSDictionary *)v8;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("date"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_21;
  v11 = (__CFString *)v10;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("date"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inputDrawing")),
        (v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_25:

    v34 = CFSTR("The input dictionary is incomplete or corrupted.");
LABEL_26:

    v11 = (__CFString *)v34;
    goto LABEL_27;
  }
  v14 = (void *)v13;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inputDrawing"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inputTargets")),
        (v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_24:

    goto LABEL_25;
  }
  v45 = (void *)v16;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inputTargets"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inputTargetContentInfo")),
        (v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  v43 = (void *)v18;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inputTargetContentInfo"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("recognitionResult")),
        (v19 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_23;
  }
  v40 = (void *)v19;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("recognitionResult"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_21:
    v11 = CFSTR("The input dictionary is incomplete or corrupted.");
    goto LABEL_27;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("date"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKTextInputDebugLogEntry loggedDateFormatter](PKTextInputDebugLogEntry, "loggedDateFormatter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dateFromString:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogEntry setEntryDate:](v7, "setEntryDate:", v22);

  -[PKTextInputDebugLogEntry entryDate](v7, "entryDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[NSDictionary objectForKeyedSubscript:](v7->_logDictionary, "objectForKeyedSubscript:", CFSTR("inputDrawing"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = &stru_1E777DEE8;
    v25 = -[PKTextInputDebugArchivedLogEntry _loadInputDrawingFromDictionary:errorMessage:](v7, "_loadInputDrawingFromDictionary:errorMessage:", v24, &v46);
    v11 = v46;

    if (!v25)
      goto LABEL_27;
    -[NSDictionary objectForKeyedSubscript:](v7->_logDictionary, "objectForKeyedSubscript:", CFSTR("inputTargets"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[PKTextInputDebugArchivedLogEntry _loadTextInputTargetsFromDictionaries:](v7, "_loadTextInputTargetsFromDictionaries:", v26);

    if (v27)
    {
      -[NSDictionary objectForKeyedSubscript:](v7->_logDictionary, "objectForKeyedSubscript:", CFSTR("inputTargetContentInfo"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDebugLogEntry inputTargets](v7, "inputTargets");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[PKTextInputDebugArchivedLogEntry _loadTargetContentInfoFromDictionary:targets:](v7, "_loadTargetContentInfoFromDictionary:targets:", v28, v29);

      if (v30)
      {
        -[NSDictionary objectForKeyedSubscript:](v7->_logDictionary, "objectForKeyedSubscript:", CFSTR("recognitionResult"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[PKTextInputDebugArchivedLogEntry _loadRecognitionResultFromDictionary:](v7, "_loadRecognitionResultFromDictionary:", v31);

        if (v32)
        {
          v33 = 0;
          if (!a4)
            goto LABEL_29;
          goto LABEL_28;
        }
        v34 = CFSTR("Failed to load recognition result.");
      }
      else
      {
        v34 = CFSTR("Failed to load target content info.");
      }
    }
    else
    {
      v34 = CFSTR("Failed to load text input targets.");
    }
    goto LABEL_26;
  }
  v11 = CFSTR("Failed to load entry date.");
LABEL_27:

  v35 = (void *)MEMORY[0x1E0CB35C8];
  v36 = *MEMORY[0x1E0CB28A8];
  v48 = *MEMORY[0x1E0CB2D50];
  v49[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 1, v37);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (a4)
LABEL_28:
    *a4 = objc_retainAutorelease(v33);
LABEL_29:
  v38 = v7;

  return v38;
}

- (PKTextInputDebugArchivedLogEntry)initWithRecordingLogEntry:(id)a3 error:(id *)a4
{
  void *v6;
  PKTextInputDebugArchivedLogEntry *v7;

  objc_msgSend(a3, "dictionaryRepresentationWithTargetContentLevel:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKTextInputDebugArchivedLogEntry initWithDictionary:error:](self, "initWithDictionary:error:", v6, a4);

  return v7;
}

- (id)dictionaryRepresentationWithDetailLevel:(int64_t)a3 targetContentLevel:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = (void *)-[NSDictionary mutableCopy](self->_logDictionary, "mutableCopy");
  v8 = v7;
  if (!a3)
  {
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("inputTargets"));
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[PKTextInputDebugLogEntry inputTargets](self, "inputTargets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("inputTargetsCount"));

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("recognitionResult"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if (v13)
    {
      objc_msgSend(v13, "removeObjectForKey:", CFSTR("tokenizedTextResultData"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("recognitionResult"));
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inputDrawing"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (v15)
    {
      objc_msgSend(v15, "removeObjectForKey:", CFSTR("drawingData"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("inputDrawing"));
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inputTargetContentInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    if (v17)
    {
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("characterRectsInReferenceSubstring"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("inputTargetContentInfo"));
    }

  }
  if (a4 != 2)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inputTargetContentInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    if (v19)
    {
      -[PKTextInputDebugLogEntry referenceSubstringWithTargetContentLevel:](self, "referenceSubstringWithTargetContentLevel:", a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("referenceSubstring"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("inputTargetContentInfo"));

    }
  }
  return v8;
}

- (BOOL)_loadInputDrawingFromDictionary:(id)a3 errorMessage:(id *)a4
{
  id v6;
  void *v7;
  PKDrawing *v8;
  id v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  __CFString *v16;
  id v18;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("drawingData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    v16 = CFSTR("Failed to load drawing data.");
    if (!a4)
      goto LABEL_11;
    goto LABEL_10;
  }
  v18 = 0;
  v8 = -[PKDrawing initWithData:error:]([PKDrawing alloc], "initWithData:error:", v7, &v18);
  v9 = v18;
  -[PKTextInputDebugLogEntry setInputDrawing:](self, "setInputDrawing:", v8);

  -[PKTextInputDebugLogEntry inputDrawing](self, "inputDrawing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 != 0;

  if (v10)
  {

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsInProgressStroke"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsInProgressStroke"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v16 = 0;
        v11 = 1;
        if (!a4)
          goto LABEL_11;
        goto LABEL_10;
      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsInProgressStroke"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugLogEntry setInputContainsInProgressStroke:](self, "setInputContainsInProgressStroke:", objc_msgSend(v9, "BOOLValue"));
    v16 = 0;
  }
  else
  {
    objc_msgSend(v9, "localizedDescription");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  if (a4)
LABEL_10:
    *a4 = objc_retainAutorelease(v16);
LABEL_11:

  return v11;
}

- (BOOL)_loadTextInputTargetsFromDictionaries:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  NSString *v16;
  double x;
  double y;
  double width;
  double height;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  PKTextInputDebugArchivedLogEntry *v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v4;
  v29 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v32;
    v27 = self;
    obj = v6;
    while (2)
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v32 != v30)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_15;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_15;
        v10 = (void *)v9;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("frame")),
              (v12 = objc_claimAutoreleasedReturnValue()) == 0))
        {

LABEL_15:
          v25 = 0;
          v6 = obj;
          v24 = obj;
          goto LABEL_16;
        }
        v13 = (void *)v12;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("frame"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          goto LABEL_15;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("frame"));
        v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        v37 = CGRectFromString(v16);
        x = v37.origin.x;
        y = v37.origin.y;
        width = v37.size.width;
        height = v37.size.height;

        v21 = objc_alloc(MEMORY[0x1E0D16880]);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v21, "initWithIdentifier:frame:", v22, x, y, width, height);

        objc_msgSend(v5, "addObject:", v23);
      }
      v6 = obj;
      self = v27;
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v29)
        continue;
      break;
    }
  }

  v24 = (void *)objc_msgSend(v5, "copy");
  -[PKTextInputDebugLogEntry setInputTargets:](self, "setInputTargets:", v24);
  v25 = 1;
LABEL_16:

  return v25;
}

- (BOOL)_loadTargetContentInfoFromDictionary:(id)a3 targets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  char v45;
  id v46;
  id v47;
  id v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  __CFString *v59;
  void *v60;
  NSString *v61;
  NSRange v62;
  void *v63;
  NSString *v64;
  void *v65;
  NSString *v66;
  void *v67;
  NSString *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSString *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  BOOL v90;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  unsigned int v101;
  void *v102;
  unsigned int v103;
  void *v104;
  unsigned int v105;
  void *v106;
  unsigned int v107;
  void *v108;
  uint64_t v109;
  void *v110;
  NSRange v111;
  void *v112;
  void *v113;
  NSRange v114;
  void *v115;
  void *v116;
  NSRange v117;
  void *v118;
  void *v119;
  NSUInteger location;
  void *v121;
  uint64_t v122;
  void *v123;
  __CFString *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  PKTextInputDebugArchivedLogEntry *v138;
  void *count;
  NSUInteger counta;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _BYTE v149[128];
  _BYTE v150[128];
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("targetIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("targetIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_169:
      goto LABEL_170;
    }
    v137 = v9;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("textContentLength"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10
    || (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("textContentLength")),
        v11 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        count = (void *)v11,
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("elementType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("elementType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        isKindOfClass = 0;
LABEL_88:

LABEL_89:
        if (!v10)
          goto LABEL_91;
        goto LABEL_90;
      }
      v133 = v14;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("referenceSubstring"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
    {
      v17 = (void *)v15;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("referenceSubstring"));
      v18 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v131 = (void *)v18;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        isKindOfClass = 0;
        v16 = v17;
LABEL_86:

LABEL_87:
        v14 = v133;
        if (!v13)
          goto LABEL_89;
        goto LABEL_88;
      }
      v16 = v17;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("referenceSubstringRange"));
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    if (v135)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("referenceSubstringRange"));
      v19 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v127 = (void *)v19;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        isKindOfClass = 0;
LABEL_84:

LABEL_85:
        if (!v16)
          goto LABEL_87;
        goto LABEL_86;
      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("strokeCoveredTextRange"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    if (v129)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("strokeCoveredTextRange"));
      v20 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v123 = (void *)v20;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        isKindOfClass = 0;
LABEL_82:

LABEL_83:
        if (!v135)
          goto LABEL_85;
        goto LABEL_84;
      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("selectedTextRange"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    if (v125)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("selectedTextRange"));
      v21 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v119 = (void *)v21;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        isKindOfClass = 0;
LABEL_80:

LABEL_81:
        if (!v129)
          goto LABEL_83;
        goto LABEL_82;
      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activePreviewRange"));
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (v121)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activePreviewRange"));
      v22 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v116 = (void *)v22;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        isKindOfClass = 0;
LABEL_78:

LABEL_79:
        if (!v125)
          goto LABEL_81;
        goto LABEL_80;
      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastCharacterLevelPosition"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (v118)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastCharacterLevelPosition"));
      v23 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v113 = (void *)v23;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        isKindOfClass = 0;
LABEL_76:

LABEL_77:
        if (!v121)
          goto LABEL_79;
        goto LABEL_78;
      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentType"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (v115)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentType"));
      v24 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v110 = (void *)v24;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        isKindOfClass = 0;
LABEL_74:

LABEL_75:
        if (!v118)
          goto LABEL_77;
        goto LABEL_76;
      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("autocapitalization"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (v112)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("autocapitalization"));
      v25 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v106 = (void *)v25;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        isKindOfClass = 0;
LABEL_72:

LABEL_73:
        if (!v115)
          goto LABEL_75;
        goto LABEL_74;
      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("autocorrection"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (v108)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("autocorrection"));
      v26 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v102 = (void *)v26;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        isKindOfClass = 0;
LABEL_70:

LABEL_71:
        if (!v112)
          goto LABEL_73;
        goto LABEL_72;
      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("characterRectsInReferenceSubstring"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (v104)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("characterRectsInReferenceSubstring"));
      v27 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v99 = (void *)v27;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        isKindOfClass = 0;
LABEL_68:

LABEL_69:
        if (!v108)
          goto LABEL_71;
        goto LABEL_70;
      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("referenceSubstringLogContentLevel"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (v100)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("referenceSubstringLogContentLevel"));
      v28 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v98 = (void *)v28;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        isKindOfClass = 0;
LABEL_66:

LABEL_67:
        if (!v104)
          goto LABEL_69;
        goto LABEL_68;
      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCursorStrong"));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v29)
    {
      v31 = (void *)v29;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCursorStrong"));
      v32 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v96 = (void *)v32;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        isKindOfClass = 0;
        v30 = v31;
LABEL_64:

LABEL_65:
        if (!v100)
          goto LABEL_67;
        goto LABEL_66;
      }
      v30 = v31;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsCommittedStrokes"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v97)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsCommittedStrokes"));
      v33 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v94 = (void *)v33;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        isKindOfClass = 0;
LABEL_62:

LABEL_63:
        if (!v30)
          goto LABEL_65;
        goto LABEL_64;
      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSingleLine"));
    v95 = objc_claimAutoreleasedReturnValue();
    if (!v95
      || (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSingleLine")),
          v34 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          v93 = (void *)v34,
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("protectedCharacterIndexes"));
      v36 = objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v37 = (void *)v36;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("protectedCharacterIndexes"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

      }
      else
      {
        isKindOfClass = 1;
      }
      v35 = (void *)v95;
      if (!v95)
      {
LABEL_61:
        if (!v97)
          goto LABEL_63;
        goto LABEL_62;
      }
    }
    else
    {
      isKindOfClass = 0;
      v35 = (void *)v95;
    }

    goto LABEL_61;
  }
  isKindOfClass = 0;
LABEL_90:

LABEL_91:
  if (v8)

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("targetIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v147 = 0u;
      v148 = 0u;
      v145 = 0u;
      v146 = 0u;
      v38 = v7;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v145, v150, 16);
      if (v39)
      {
        v40 = v39;
        v136 = v7;
        v138 = self;
        v41 = *(_QWORD *)v146;
LABEL_97:
        v42 = 0;
        while (1)
        {
          if (*(_QWORD *)v146 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * v42);
          objc_msgSend(v43, "inputTargetIdentifier", v92);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "isEqualToNumber:", v8);

          if ((v45 & 1) != 0)
            break;
          if (v40 == ++v42)
          {
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v145, v150, 16);
            if (v40)
              goto LABEL_97;
            v7 = v136;
            self = v138;
            goto LABEL_168;
          }
        }
        v46 = v43;

        v7 = v136;
        self = v138;
        if (!v46)
          goto LABEL_169;
        v47 = objc_alloc_init(MEMORY[0x1E0D16818]);
        objc_msgSend(v47, "setTextInputTarget:", v46);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentType"));
        v48 = (id)objc_claimAutoreleasedReturnValue();
        v132 = v46;
        if ((objc_msgSend(v48, "isEqualToString:", CFSTR("Default")) & 1) != 0)
        {
          v101 = 0;
        }
        else
        {
          if ((objc_msgSend(v48, "isEqualToString:", CFSTR("Digits")) & 1) != 0)
          {
            v49 = 1;
          }
          else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("Phone")) & 1) != 0)
          {
            v49 = 2;
          }
          else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("Username")) & 1) != 0)
          {
            v49 = 3;
          }
          else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("EmailAddress")) & 1) != 0)
          {
            v49 = 4;
          }
          else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("URL")) & 1) != 0)
          {
            v49 = 5;
          }
          else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("ASCII")) & 1) != 0)
          {
            v49 = 6;
          }
          else if (objc_msgSend(v48, "isEqualToString:", CFSTR("Equation")))
          {
            v49 = 7;
          }
          else
          {
            v49 = 0;
          }
          v101 = v49;
        }

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("autocapitalization"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_1E77ED2F8, "objectForKeyedSubscript:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51;
        if (v51)
          v128 = objc_msgSend(v51, "integerValue");
        else
          v128 = 1;

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("autocorrection"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_1E77ED320, "objectForKeyedSubscript:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v54;
        if (v54)
          v126 = objc_msgSend(v54, "integerValue");
        else
          v126 = 0;

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("textContentLength"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = objc_msgSend(v56, "integerValue");

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("referenceSubstring"));
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = (void *)v57;
        v59 = &stru_1E777DEE8;
        if (v57)
          v59 = (__CFString *)v57;
        v124 = v59;

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("referenceSubstringRange"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("referenceSubstringRange"));
          v61 = (NSString *)objc_claimAutoreleasedReturnValue();
          v62 = NSRangeFromString(v61);
          location = v62.location;
          counta = v62.length;

        }
        else
        {
          counta = 0;
          location = 0x7FFFFFFFFFFFFFFFLL;
        }

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("selectedTextRange"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (v63)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("selectedTextRange"));
          v64 = (NSString *)objc_claimAutoreleasedReturnValue();
          v117 = NSRangeFromString(v64);

        }
        else
        {
          v117.location = 0x7FFFFFFFFFFFFFFFLL;
          v117.length = 0;
        }

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("strokeCoveredTextRange"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (v65)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("strokeCoveredTextRange"));
          v66 = (NSString *)objc_claimAutoreleasedReturnValue();
          v114 = NSRangeFromString(v66);

        }
        else
        {
          v114.location = 0x7FFFFFFFFFFFFFFFLL;
          v114.length = 0;
        }

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activePreviewRange"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (v67)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activePreviewRange"));
          v68 = (NSString *)objc_claimAutoreleasedReturnValue();
          v111 = NSRangeFromString(v68);

        }
        else
        {
          v111.location = 0x7FFFFFFFFFFFFFFFLL;
          v111.length = 0;
        }

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastCharacterLevelPosition"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (v69)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastCharacterLevelPosition"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = objc_msgSend(v70, "integerValue");

        }
        else
        {
          v109 = 0x7FFFFFFFFFFFFFFFLL;
        }

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCursorStrong"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (v71)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isCursorStrong"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = objc_msgSend(v72, "BOOLValue");

        }
        else
        {
          v107 = 1;
        }

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsCommittedStrokes"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (v73)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containsCommittedStrokes"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = objc_msgSend(v74, "BOOLValue");

        }
        else
        {
          v105 = 0;
        }

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSingleLine"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = v47;
        if (v75)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSingleLine"));
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = objc_msgSend(v76, "BOOLValue");

        }
        else
        {
          v103 = 1;
        }

        v134 = malloc_type_calloc(counta, 0x20uLL, 0x1000040E0EAB150uLL);
        v141 = 0u;
        v142 = 0u;
        v143 = 0u;
        v144 = 0u;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("characterRectsInReferenceSubstring"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v141, v149, 16);
        if (v78)
        {
          v79 = v78;
          v80 = 0;
          v81 = *(_QWORD *)v142;
LABEL_157:
          v82 = 0;
          v83 = (uint64_t)v134 + 32 * v80 + 16;
          while (1)
          {
            if (*(_QWORD *)v142 != v81)
              objc_enumerationMutation(v77);
            v84 = *(NSString **)(*((_QWORD *)&v141 + 1) + 8 * v82);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || v80 + v82 >= counta)
              break;
            *(CGRect *)(v83 - 16) = CGRectFromString(v84);
            v83 += 32;
            if (v79 == ++v82)
            {
              v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v141, v149, 16);
              v80 += v82;
              if (v79)
                goto LABEL_157;
              break;
            }
          }
        }

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("protectedCharacterIndexes"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        if (v85)
        {
          v86 = v130;
          objc_msgSend(v130, "setProtectedCharacterIndexes:", v85);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v130;
          objc_msgSend(v130, "setProtectedCharacterIndexes:", v87);

        }
        v7 = v136;
        self = v138;

        objc_msgSend(v86, "setReferenceSubstring:range:characterRects:", v124, location, counta, v134);
        objc_msgSend(v86, "setTextContentLength:", v122);
        objc_msgSend(v86, "setStrokeCoveredTextRange:", v114.location, v114.length);
        objc_msgSend(v86, "setSelectedTextRange:", v117.location, v117.length);
        objc_msgSend(v86, "setActivePreviewRange:", v111.location, v111.length);
        objc_msgSend(v86, "setContentType:", v101);
        objc_msgSend(v86, "setAutoCapitalizationMode:", v128);
        objc_msgSend(v86, "setAutoCorrectionMode:", v126);
        objc_msgSend(v86, "setIsSingleLine:", v103);
        objc_msgSend(v86, "setIsCursorStrong:", v107);
        objc_msgSend(v86, "setLastCharacterLevelPosition:", v109);
        objc_msgSend(v86, "setContainsCommittedStrokes:", v105);
        free(v134);
        v88 = (void *)objc_msgSend(v86, "copy");
        -[PKTextInputDebugLogEntry setInputTargetContentInfo:](v138, "setInputTargetContentInfo:", v88);

        v38 = v132;
      }
LABEL_168:

    }
    goto LABEL_169;
  }
LABEL_170:
  -[PKTextInputDebugLogEntry inputTargetContentInfo](self, "inputTargetContentInfo", v92);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v89 != 0;

  return v90;
}

- (BOOL)_loadRecognitionResultFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;
  uint64_t v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSString *v41;
  NSRange v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  id v72;
  uint64_t v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognitionLocale"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_11;
  v6 = (id)v5;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognitionLocale"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognitionLocales")),
        (v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  v9 = (void *)v8;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognitionLocales"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("committedText"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_13:
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topTranscription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v11;
    if (v15)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topTranscription"));
      v16 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v63 = (void *)v16;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = 1;
        v11 = v65;
LABEL_48:

LABEL_49:
        v12 = v64;
        if (!v11)
          goto LABEL_51;
        goto LABEL_50;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("committedTokenColumnCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("committedTokenColumnCount"));
      v19 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v60 = (void *)v19;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = 1;
LABEL_46:

LABEL_47:
        v11 = v65;
        if (!v15)
          goto LABEL_49;
        goto LABEL_48;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commitReason"));
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = v18;
    if (v61)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commitReason"));
      v20 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v56 = (void *)v20;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = 1;
        v21 = (void *)v61;
LABEL_44:

LABEL_45:
        v18 = v62;
        if (!v62)
          goto LABEL_47;
        goto LABEL_46;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tokenizedTextResultData"));
    v59 = objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tokenizedTextResultData"));
      v22 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v55 = (void *)v22;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = (void *)v59;
        v57 = 1;
        v21 = (void *)v61;
LABEL_42:

LABEL_43:
        v17 = v57;
        if (!v21)
          goto LABEL_45;
        goto LABEL_44;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("affectedRange"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v53 = v15;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("affectedRange"));
      v25 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v50 = (void *)v25;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v57 = 1;
        v21 = (void *)v61;
        v15 = v53;
LABEL_40:

LABEL_41:
        v23 = (void *)v59;
        if (!v59)
          goto LABEL_43;
        goto LABEL_42;
      }
      v15 = v53;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognitionDuration"));
    v52 = v24;
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v54
      || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognitionDuration")),
          v51 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultType"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v58 = v27;
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultType"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v26 = objc_opt_isKindOfClass() ^ 1;

        v27 = v58;
      }
      else
      {
        LOBYTE(v26) = 0;
      }
      v21 = (void *)v61;

      if (!v54)
      {
        v57 = v26;
LABEL_39:
        v24 = v52;
        if (!v52)
          goto LABEL_41;
        goto LABEL_40;
      }
    }
    else
    {
      LOBYTE(v26) = 1;
      v21 = (void *)v61;
    }
    v57 = v26;

    goto LABEL_39;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("committedText"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v64 = v12;
    goto LABEL_13;
  }
  v17 = 1;
LABEL_50:

LABEL_51:
  if ((v17 & 1) != 0)
  {
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognitionLocales"));
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v68;
    while (2)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v68 != v31)
          objc_enumerationMutation(v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          goto LABEL_10;
        }
      }
      v30 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      if (v30)
        continue;
      break;
    }
  }

  -[PKTextInputDebugLogEntry setRecognitionLocaleIdentifiers:](self, "setRecognitionLocaleIdentifiers:", v6);
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognitionLocale"));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (v33)
    {
      v73 = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDebugLogEntry setRecognitionLocaleIdentifiers:](self, "setRecognitionLocaleIdentifiers:", v35);

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("committedText"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogEntry setResultCommittedText:](self, "setResultCommittedText:", v36);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topTranscription"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogEntry setResultTopTranscription:](self, "setResultTopTranscription:", v37);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("committedTokenColumnCount"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogEntry setResultCommittedTokenColumnCount:](self, "setResultCommittedTokenColumnCount:", objc_msgSend(v38, "integerValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commitReason"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogEntry setResultCommitReason:](self, "setResultCommitReason:", v39);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("affectedRange"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("affectedRange"));
    v41 = (NSString *)objc_claimAutoreleasedReturnValue();
    v42 = NSRangeFromString(v41);
    -[PKTextInputDebugLogEntry setResultAffectedRange:](self, "setResultAffectedRange:", v42.location, v42.length);

  }
  else
  {
    -[PKTextInputDebugLogEntry setResultAffectedRange:](self, "setResultAffectedRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultType"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogEntry setResultTypeDescription:](self, "setResultTypeDescription:", v43);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognitionDuration"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "doubleValue");
  -[PKTextInputDebugLogEntry setResultRecognitionDuration:](self, "setResultRecognitionDuration:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tokenizedTextResultData"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v66 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v45, &v66);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v66;
    -[PKTextInputDebugLogEntry setTokenizedTextResult:](self, "setTokenizedTextResult:", v46);

    -[PKTextInputDebugLogEntry tokenizedTextResult](self, "tokenizedTextResult");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v48)
    {
      v49 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v47;
        _os_log_error_impl(&dword_1BE213000, v49, OS_LOG_TYPE_ERROR, "Error unarchiving CHTokenizedTextResult: %@", buf, 0xCu);
      }

    }
  }

  v13 = 1;
LABEL_12:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logDictionary, 0);
}

@end

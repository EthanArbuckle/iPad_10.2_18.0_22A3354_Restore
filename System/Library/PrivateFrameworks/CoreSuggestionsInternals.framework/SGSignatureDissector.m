@implementation SGSignatureDissector

+ (id)singleLineSignatureLeadingCharacterSet
{
  if (singleLineSignatureLeadingCharacterSet_onceToken != -1)
    dispatch_once(&singleLineSignatureLeadingCharacterSet_onceToken, &__block_literal_global_91_19104);
  return (id)singleLineSignatureLeadingCharacterSet_charset;
}

void __62__SGSignatureDissector_singleLineSignatureLeadingCharacterSet__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v1);

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v2);

  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)singleLineSignatureLeadingCharacterSet_charset;
  singleLineSignatureLeadingCharacterSet_charset = v3;

}

- (id)initIgnoringDataDetectors
{
  SGSignatureDissector *v2;
  SGSignatureDissector *v3;
  NSNumber *ignoreDataDetectorsForTesting;

  v2 = -[SGSignatureDissector init](self, "init");
  v3 = v2;
  if (v2)
  {
    ignoreDataDetectorsForTesting = v2->_ignoreDataDetectorsForTesting;
    v2->_ignoreDataDetectorsForTesting = (NSNumber *)MEMORY[0x1E0C9AAB0];

  }
  return v3;
}

- (_NSRange)signatureRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  _NSRange result;

  v4 = a3;
  objc_msgSend(v4, "htmlParser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "signatureRegions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_msgSend(v6, "firstIndex");
    v8 = objc_msgSend(v6, "lastIndex");
    if (v8 >= v7)
      v9 = v7;
    else
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 >= v7)
      v10 = v8 - v7 + 1;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = -[SGSignatureDissector miniSignatureRange:](self, "miniSignatureRange:", v4);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = -[SGSignatureDissector hmmPlausibleSignatureRange:](self, "hmmPlausibleSignatureRange:", v4);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        v11 = -[SGSignatureDissector hmmSignatureRange:](self, "hmmSignatureRange:", v4);
    }
    v9 = v11;
    v10 = v12;
  }

  v13 = v9;
  v14 = v10;
  result.length = v14;
  result.location = v13;
  return result;
}

- (id)findValedictionCommencedSignatureRanges:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v10;
  void *v11;
  id v12;

  v3 = a3;
  objc_msgSend(v3, "textContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v3, "quotedRegions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v4;
    v11 = v6;
    v12 = v5;
    v7 = v6;
    _PASEnumerateSimpleLinesInString();
    v8 = v12;

  }
  else
  {
    v8 = (id)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)findSignaturePrefixesInMessage:(id)a3 withSignaturePrefixes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v13;
  id v14;
  void *v15;
  id v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "textContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v5, "quotedRegions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7;
    v14 = v6;
    v15 = v9;
    v16 = v8;
    v10 = v9;
    _PASEnumerateSimpleLinesInString();
    v11 = v16;

  }
  else
  {
    v11 = (id)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (_NSRange)findValediction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v4 = a3;
  patterns_19149();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regex2ForKey:", CFSTR("ValedictionSig/F"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSignatureDissector findSignaturePrefixesInMessage:withSignaturePrefixes:](self, "findSignaturePrefixesInMessage:withSignaturePrefixes:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeValue");
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (id)findRejectSig:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, _QWORD *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__19251;
  v20 = __Block_byref_object_dispose__19252;
  v21 = 0;
  v21 = (id)objc_opt_new();
  objc_msgSend(v3, "quotedRegions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    patterns_19149();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "regex2ForKey:", CFSTR("RejetedSig/F"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __38__SGSignatureDissector_findRejectSig___block_invoke;
    v13 = &unk_1E7DAECA8;
    v14 = v4;
    v15 = &v16;
    objc_msgSend(v7, "enumerateMatchesInString:ngroups:block:", v5, 0, &v10);

  }
  v8 = (void *)objc_msgSend((id)v17[5], "copy", v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (_NSRange)findSignaturePrefix:(id)a3
{
  id v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  v4 = a3;
  v5 = -[SGSignatureDissector findValediction:](self, "findValediction:", v4);
  if (v6)
  {
    v7 = v5;
    v8 = v6;
  }
  else
  {
    patterns_19149();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "regex2ForKey:", CFSTR("SymbolicSig"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSignatureDissector findSignaturePrefixesInMessage:withSignaturePrefixes:](self, "findSignaturePrefixesInMessage:withSignaturePrefixes:", v4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "rangeValue");
    v8 = v13;

  }
  v14 = v7;
  v15 = v8;
  result.length = v15;
  result.location = v14;
  return result;
}

- (_NSRange)hmmPlausibleSignatureRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  void *v30;
  void *context;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  _NSRange result;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SGSignatureDissector findValedictionCommencedSignatureRanges:](self, "findValedictionCommencedSignatureRanges:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rangeValue");
  v9 = v8;

  if (v9)
  {
    context = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v4, "textContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringToIndex:", v7 + v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "quotedRegions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexesInRange:options:passingTest:", 0, objc_msgSend(v11, "length"), 0, &__block_literal_global_19247);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "plainTextDetectedData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v4, "plainTextDetectedData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v22 = objc_msgSend(v21, "range", v30);
          objc_msgSend(v21, "range");
          if (v23 + v22 <= (unint64_t)objc_msgSend(v11, "length"))
            objc_msgSend(v15, "addObject:", v21);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v18);
    }

    -[SGSignatureDissector authorFirstname:](self, "authorFirstname:", v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SGSignatureDissector hmmSignatureRangeWithContent:detectedData:quotedRegions:authorName:](self, "hmmSignatureRangeWithContent:detectedData:quotedRegions:authorName:", v11, v15, v30, v24);
    v27 = v26;

    objc_autoreleasePoolPop(context);
  }
  else
  {
    v27 = 0;
    v25 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v28 = v25;
  v29 = v27;
  result.length = v29;
  result.location = v28;
  return result;
}

- (_NSRange)hmmSignatureRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v4 = a3;
  objc_msgSend(v4, "textContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plainTextDetectedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quotedRegions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSignatureDissector authorFirstname:](self, "authorFirstname:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SGSignatureDissector hmmSignatureRangeWithContent:detectedData:quotedRegions:authorName:](self, "hmmSignatureRangeWithContent:detectedData:quotedRegions:authorName:", v5, v6, v7, v8);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (_NSRange)hmmSignatureRangeWithContent:(id)a3 detectedData:(id)a4 quotedRegions:(id)a5 authorName:(id)a6
{
  unint64_t v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  unsigned __int16 v51;
  char v52;
  NSUInteger v53;
  uint64_t v54;
  unsigned __int8 *v55;
  size_t v56;
  _BYTE *v57;
  unsigned __int8 v58;
  double *v59;
  double *v60;
  unsigned __int8 *v61;
  unsigned __int8 *v62;
  double v63;
  double v64;
  size_t v65;
  double v66;
  double v67;
  _BYTE *v68;
  unsigned __int8 *v69;
  double *v70;
  double *v71;
  uint64_t v72;
  unsigned int v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  _BYTE *v81;
  int v82;
  int v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  NSObject *v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  NSUInteger v98;
  NSUInteger v99;
  const char *v100;
  id v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint8_t buf[16];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  void *v114[2];
  void *v115[2];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[4];
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;
  _NSRange result;

  v129 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v10)
  {
    v53 = 0;
    v54 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_93;
  }
  v104 = v13;
  v105 = v12;
  v103 = v10;
  _PASTrimTrailingWhitespace();
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 16);
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v102 = v11;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v122, v128, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v123;
LABEL_4:
    v20 = 0;
    while (2)
    {
      if (*(_QWORD *)v123 != v19)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v20);
      v22 = 0;
      switch(objc_msgSend(v21, "matchType"))
      {
        case 0u:
          v22 = 2;
          goto LABEL_12;
        case 1u:
          v22 = 1;
          goto LABEL_12;
        case 3u:
          v22 = 4;
          goto LABEL_12;
        case 4u:
        case 6u:
        case 7u:
        case 8u:
        case 9u:
          goto LABEL_13;
        case 5u:
          v22 = 3;
          goto LABEL_12;
        default:
LABEL_12:
          v23 = objc_msgSend(v21, "range");
          v6 = v22 | v6 & 0xFFFFFFFF00000000;
          +[SGSlice sliceWithType:range:](SGSlice, "sliceWithType:range:", v6, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v25);

LABEL_13:
          if (v18 != ++v20)
            continue;
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v122, v128, 16);
          if (!v18)
            goto LABEL_15;
          goto LABEL_4;
      }
    }
  }
LABEL_15:

  v120[0] = MEMORY[0x1E0C809B0];
  v120[1] = 3221225472;
  v120[2] = __91__SGSignatureDissector_hmmSignatureRangeWithContent_detectedData_quotedRegions_authorName___block_invoke;
  v120[3] = &unk_1E7DB5420;
  v26 = v15;
  v121 = v26;
  objc_msgSend(v105, "enumerateRangesUsingBlock:", v120);
  v27 = (void *)objc_opt_new();
  v107 = v26;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v26, "count"));
  v29 = 0;
  do
  {
    v108 = v29;
    v30 = slicePrecedence[v29];
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v31 = v107;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v116, v127, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v117;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v117 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
          if (v30 == (unsigned __int16)objc_msgSend(v36, "type"))
          {
            v37 = objc_msgSend(v36, "range");
            v39 = v38;
            if ((objc_msgSend(v27, "intersectsIndexesInRange:", v37, v38) & 1) == 0)
            {
              objc_msgSend(v27, "addIndexesInRange:", v37, v39);
              objc_msgSend(v28, "addObject:", v36);
            }
          }
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v116, v127, 16);
      }
      while (v33);
    }

    v29 = v108 + 1;
  }
  while (v108 != 5);
  v40 = v28;

  objc_msgSend(v40, "sortUsingSelector:", sel_compare_);
  v114[0] = 0;
  *(_OWORD *)v115 = 0u;
  v114[1] = (void *)256;
  v41 = malloc_type_malloc(0x100uLL, 0x100004077774924uLL);
  if (!v41)
    goto LABEL_99;
  v115[0] = v41;
  v42 = malloc_type_malloc(0x800uLL, 0x100004000313F17uLL);
  if (!v42)
    goto LABEL_99;
  v115[1] = v42;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v43 = v40;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v110, v126, 16);
  v14 = v104;
  if (v44)
  {
    v45 = v44;
    v46 = 0;
    v47 = *(_QWORD *)v111;
LABEL_31:
    v48 = 0;
    while (1)
    {
      if (*(_QWORD *)v111 != v47)
        objc_enumerationMutation(v43);
      v49 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v48);
      v50 = objc_msgSend(v49, "start");
      if (v50 >= objc_msgSend(v106, "length"))
        break;
      if (objc_msgSend(v49, "start") > v46)
        tokenize(v106, (uint64_t)v114, v46, objc_msgSend(v49, "start") - v46, v104);
      v51 = objc_msgSend(v49, "type");
      if (v51 >= 6u)
        v52 = 7;
      else
        v52 = v51 + 12;
      emitToken(v114, v52, objc_msgSend(v49, "start"));
      v46 = objc_msgSend(v49, "end");
      if (v45 == ++v48)
      {
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v110, v126, 16);
        if (v45)
          goto LABEL_31;
        break;
      }
    }
  }
  else
  {
    v46 = 0;
  }

  if (v46 < objc_msgSend(v106, "length"))
    tokenize(v106, (uint64_t)v114, v46, objc_msgSend(v106, "length") - v46, v104);
  v55 = (unsigned __int8 *)v115[0];
  v56 = (size_t)v114[0];
  if (viterbi_hmmOnceToken != -1)
    dispatch_once(&viterbi_hmmOnceToken, &__block_literal_global_203_19220);
  v57 = 0;
  v58 = atomic_load(viterbi_hmmLoaded);
  if (!v56 || (v58 & 1) == 0)
    goto LABEL_67;
  v59 = (double *)malloc_type_malloc(8 * v56, 0x100004000313F17uLL);
  v60 = (double *)malloc_type_malloc(8 * v56, 0x100004000313F17uLL);
  v61 = (unsigned __int8 *)malloc_type_calloc(v56, 1uLL, 0x100004077774924uLL);
  if (!v61)
  {
LABEL_99:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v101 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v101);
  }
  v62 = v61;
  v57 = 0;
  if (v59 && v60)
  {
    *v59 = *(double *)&qword_1ED528188 + hmm[*v55];
    *v60 = *(double *)&qword_1ED528190 + hmm[*v55 + 18];
    *v61 = 2;
    if (v56 >= 2)
    {
      v63 = *(double *)&qword_1ED528168;
      v64 = unk_1ED528170;
      v65 = v56 - 1;
      v66 = *(double *)&qword_1ED528178;
      v67 = unk_1ED528180;
      v68 = v61 + 1;
      v69 = v55 + 1;
      v70 = v59;
      v71 = v60;
      do
      {
        v73 = *v69++;
        v72 = v73;
        if (v73 >= 0x13uLL)
          __assert_rtn("viterbi", "SGSignatureDissector.m", 1413, "obs <= NUM_TOKEN_TYPES");
        v74 = *v70;
        v75 = hmm[v72];
        v76 = v63 + *v70 + v75;
        v77 = v75 + v66 + *v71;
        if (v77 > v76)
        {
          *v68 |= 1u;
          v74 = *v70;
          v76 = v77;
        }
        v70[1] = v76;
        v78 = hmm[v72 + 18];
        v79 = v64 + v74 + v78;
        v80 = v78 + v67 + *v71;
        if (v80 > v79)
        {
          *v68 |= 2u;
          v79 = v80;
        }
        v71[1] = v79;
        ++v71;
        ++v68;
        ++v70;
        --v65;
      }
      while (v65);
    }
    v81 = malloc_type_malloc(v56, 0x100004077774924uLL);
    v57 = v81;
    if (v81)
    {
      v82 = v56 - 1;
      if ((int)v56 >= 1)
      {
        LOBYTE(v83) = v60[v56 - 1] > v59[v56 - 1];
        v84 = v56 + 1;
        do
        {
          v81[v82] = v83 & 1;
          v83 = (v62[v82] >> (v83 & 1)) & 1;
          --v84;
          --v82;
        }
        while (v84 > 1);
      }
    }
  }
  free(v59);
  free(v60);
  free(v62);
  v14 = v104;
LABEL_67:
  v85 = (char *)v114[0];
  if (!v114[0])
    goto LABEL_91;
  v86 = 0;
  while (1)
  {
    v87 = (char *)(v86 + 1);
    if (v57[v86])
      break;
    ++v86;
    if (v114[0] == v87)
      goto LABEL_91;
  }
  if (LODWORD(v114[0]) - (int)v86 > 39)
  {
    sgLogHandle();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v100 = "HMM confused, too many tokens in signature";
LABEL_97:
      _os_log_debug_impl(&dword_1C3607000, v88, OS_LOG_TYPE_DEBUG, v100, buf, 2u);
    }
    goto LABEL_74;
  }
  if (v114[0] <= (void *)(v86 + 1))
  {
LABEL_84:
    v54 = *((unsigned int *)v115[1] + v86);
    v93 = objc_msgSend(v106, "rangeOfString:options:range:", CFSTR("\n"), 6, 0, v54);
    if (!v94)
      goto LABEL_91;
    if ((unint64_t)(v54 - v93) >= 5)
    {
      v95 = objc_msgSend(v106, "rangeOfString:options:range:", CFSTR("\n"), 2, v54, objc_msgSend(v106, "length") - v54);
      if (v96)
        v54 = v95 + 1;
    }
    v97 = objc_msgSend(v106, "length");
    v53 = v97 - v54;
    if (v97 == v54)
      v54 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_92;
  }
  v89 = 0;
  while (*((_BYTE *)v115[0] + (unint64_t)v87) != 17)
  {
LABEL_83:
    if (v85 <= ++v87)
      goto LABEL_84;
  }
  v90 = *((unsigned int *)v115[1] + (_QWORD)v87);
  v91 = ((_DWORD)v87 + 1);
  if ((unint64_t)v85 <= v91)
    v92 = objc_msgSend(v106, "length");
  else
    v92 = *((unsigned int *)v115[1] + v91);
  v89 += v92 - v90;
  if (v89 <= 0x100)
  {
    v85 = (char *)v114[0];
    goto LABEL_83;
  }
  sgLogHandle();
  v88 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    v100 = "HMM confused, too much quoting in signature";
    goto LABEL_97;
  }
LABEL_74:

LABEL_91:
  v53 = 0;
  v54 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_92:
  free(v57);
  free(v115[0]);
  free(v115[1]);

  v11 = v102;
  v10 = v103;
  v12 = v105;
LABEL_93:

  v98 = v54;
  v99 = v53;
  result.length = v99;
  result.location = v98;
  return result;
}

- (_NSRange)miniSignatureRange:(id)a3
{
  id v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  NSUInteger v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  unsigned int v17;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  _NSRange result;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SGSignatureDissector trailingSenderNameLineRange:](self, "trailingSenderNameLineRange:", v4);
  if (v6)
  {
    v7 = v5;
    v8 = v6;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v4, "plainTextDetectedData", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "range");
          if (v15 >= v7 && v15 - v7 < v8)
          {
            v17 = objc_msgSend(v14, "matchType");
            if (v17 <= 5 && v17 != 4)
            {
              v19 = v7;
              v20 = v8;
              goto LABEL_21;
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        v20 = 0;
        v19 = 0x7FFFFFFFFFFFFFFFLL;
      }
      while (v11);
    }
    else
    {
      v20 = 0;
      v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_21:

  }
  else
  {
    v20 = 0;
    v19 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v21 = v19;
  v22 = v20;
  result.length = v22;
  result.location = v21;
  return result;
}

- (_NSRange)trailingSenderNameLineRange:(id)a3
{
  id v4;
  void *v5;
  SGPlainTextContentCursor *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  NSUInteger v34;
  uint64_t v35;
  void *context;
  void *contexta;
  id v38;
  SGSignatureDissector *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _QWORD v46[3];
  _NSRange result;

  v46[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39 = self;
  -[SGSignatureDissector authorName:](self, "authorName:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v40, "length"))
    goto LABEL_10;
  v5 = (void *)MEMORY[0x1C3BD4F6C]();
  v6 = -[SGPlainTextContentCursor initWithMailMessage:]([SGPlainTextContentCursor alloc], "initWithMailMessage:", v4);
  -[SGPlainTextContentCursor seekToEnd](v6, "seekToEnd");
  -[SGPlainTextContentCursor backwardWhile:](v6, "backwardWhile:", &__block_literal_global_57_19213);
  v7 = -[SGPlainTextContentCursor pos](v6, "pos");
  -[SGPlainTextContentCursor backwardToString:consume:](v6, "backwardToString:consume:", CFSTR("\n\n"), 0);
  if (-[SGPlainTextContentCursor pos](v6, "pos") == v7)
    -[SGPlainTextContentCursor backwardWhile:](v6, "backwardWhile:", &__block_literal_global_60_19214);
  if (-[SGPlainTextContentCursor pos](v6, "pos") == v7)
    goto LABEL_9;
  v8 = -[SGPlainTextContentCursor pos](v6, "pos");
  objc_msgSend(v4, "textContent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "characterAtIndex:", v7);

  if (v10 == 65306 || v10 == 58)
  {
    -[SGPlainTextContentCursor backward](v6, "backward");
    -[SGPlainTextContentCursor backwardWhile:](v6, "backwardWhile:", &__block_literal_global_61_19215);
    v7 = -[SGPlainTextContentCursor pos](v6, "pos");
    -[SGPlainTextContentCursor backwardToString:consume:](v6, "backwardToString:consume:", CFSTR("\n\n"), 0);
    v8 = -[SGPlainTextContentCursor pos](v6, "pos");
  }
  v11 = v7 - v8;
  if (v7 == v8)
  {
LABEL_9:

    objc_autoreleasePoolPop(v5);
LABEL_10:
    v12 = 0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_11;
  }
  -[SGPlainTextContentCursor backward](v6, "backward");
  -[SGPlainTextContentCursor backwardWhile:](v6, "backwardWhile:", &__block_literal_global_62_19216);
  v16 = -[SGPlainTextContentCursor pos](v6, "pos");
  -[SGPlainTextContentCursor backwardToString:consume:](v6, "backwardToString:consume:", CFSTR("\n"), 0);
  v17 = -[SGPlainTextContentCursor pos](v6, "pos");
  context = v5;
  v38 = v4;
  if (-[SGPlainTextContentCursor pos](v6, "pos") < 2)
    goto LABEL_17;
  objc_msgSend(v4, "textContent", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "characterAtIndex:", -[SGPlainTextContentCursor pos](v6, "pos") - 1) != 10)
  {

    goto LABEL_17;
  }
  objc_msgSend(v4, "textContent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "characterAtIndex:", -[SGPlainTextContentCursor pos](v6, "pos") - 2);

  if (v20 != 10)
  {
LABEL_17:
    v21 = 0;
    goto LABEL_18;
  }
  v21 = v16 - v17 + 1;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v8, v11 + 1, context);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  if (v21)
  {
    v25 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v17, v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v26);

    objc_autoreleasePoolPop(v25);
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v27 = v24;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v42 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v33 = (void *)MEMORY[0x1C3BD4F6C]();
        v13 = objc_msgSend(v32, "rangeValue");
        v12 = v34;
        v35 = -[SGSignatureDissector rangeOfSenderName:inRange:restrictLength:forMessage:](v39, "rangeOfSenderName:inRange:restrictLength:forMessage:", v40, v13, v34, 1, v38);
        objc_autoreleasePoolPop(v33);
        if (v35 != 0x7FFFFFFFFFFFFFFFLL)
        {

          objc_autoreleasePoolPop(contexta);
          goto LABEL_30;
        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v29)
        continue;
      break;
    }
  }

  objc_autoreleasePoolPop(contexta);
  v12 = 0;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_30:
  v4 = v38;
LABEL_11:

  v14 = v13;
  v15 = v12;
  result.length = v15;
  result.location = v14;
  return result;
}

- (id)authorName:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "author");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)authorFirstname:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[SGSignatureDissector authorName:](self, "authorName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[SGIdentityName nameWithString:](SGIdentityName, "nameWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstname");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v4, "firstname");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v3;
    }
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_NSRange)rangeOfSenderName:(id)a3 inRange:(_NSRange)a4 restrictLength:(BOOL)a5 forMessage:(id)a6
{
  _BOOL4 v7;
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSUInteger v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  SGSignatureDissector *v43;
  void *v44;
  NSUInteger v45;
  NSUInteger v46;
  NSUInteger v47;
  _NSRange result;

  v7 = a5;
  length = a4.length;
  location = a4.location;
  v11 = a3;
  v12 = a6;
  v13 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v12, "textContent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "substringWithRange:", location, length);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v13);
  if (!v7)
    goto LABEL_4;
  v16 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-_ "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v16);
  v19 = objc_msgSend(v18, "length");

  if (v19 > 0x96)
  {
    v20 = 0;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
LABEL_4:
    +[SGNames stripHonorifics:](SGNames, "stripHonorifics:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGIdentityName nameWithString:](SGIdentityName, "nameWithString:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_opt_new();
    objc_msgSend(v23, "firstname");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v23, "firstname");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsSeparatedByString:", CFSTR(" "));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v26);
      objc_msgSend(v24, "addObjectsFromArray:", v28);

    }
    objc_msgSend(v23, "surname");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v23, "surname");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsSeparatedByString:", CFSTR(" "));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v30);
      objc_msgSend(v24, "addObjectsFromArray:", v32);

    }
    objc_msgSend(v23, "middlename");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v23, "middlename");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsSeparatedByString:", CFSTR(" "));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v34);
      objc_msgSend(v24, "addObjectsFromArray:", v36);

    }
    v37 = -[SGSignatureDissector rangeOfSenderNameComponents:withFullname:inSubstring:](self, "rangeOfSenderNameComponents:withFullname:inSubstring:", v24, v22, v15);
    v20 = v38;
    if (v37 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v23, "firstname");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v23, "firstname");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGNicknames nicknamesForName:](SGNicknames, "nicknamesForName:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "allObjects");
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = self;
        v44 = (void *)v42;
        v21 = -[SGSignatureDissector rangeOfSenderNameComponents:withFullname:inSubstring:](v43, "rangeOfSenderNameComponents:withFullname:inSubstring:", v42, v22, v15);
        v20 = v45;

      }
      else
      {
        v21 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      v21 = v37;
    }

  }
  v46 = v21;
  v47 = v20;
  result.length = v47;
  result.location = v46;
  return result;
}

- (_NSRange)rangeOfSenderNameComponents:(id)a3 withFullname:(id)a4 inSubstring:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  NSUInteger v19;
  unint64_t v20;
  unint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  _NSRange result;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v25 = 0u;
  v26 = 0u;
  if (+[SGNames isProbablyShortCJKName:](SGNames, "isProbablyShortCJKName:", a4))
    v9 = 1;
  else
    v9 = 3;
  v27 = 0uLL;
  v28 = 0uLL;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    v24 = v9;
LABEL_6:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v14);
      if (objc_msgSend(v15, "length") >= v9)
      {
        v16 = objc_msgSend(v8, "rangeOfString:options:", v15, 1);
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v18 = v16;
          v19 = v17;
          if (v16 < 4)
            break;
          v20 = 0;
          v21 = v16 - 1;
          do
          {
            if (!v21)
              break;
            if (objc_msgSend(v8, "characterAtIndex:", v21) == 10)
              goto LABEL_21;
            --v21;
            ++v20;
          }
          while (v20 < 3);
          v9 = v24;
          if (objc_msgSend(v8, "characterAtIndex:", v18 - 1) == 32)
            break;
        }
      }
      if (++v14 == v12)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        v19 = 0;
        v18 = 0x7FFFFFFFFFFFFFFFLL;
        if (v12)
          goto LABEL_6;
        break;
      }
    }
  }
  else
  {
    v19 = 0;
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_21:

  v22 = v18;
  v23 = v19;
  result.length = v23;
  result.location = v22;
  return result;
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v8, "textContent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (!v13)
    goto LABEL_27;
  if ((objc_msgSend(MEMORY[0x1E0D198F0], "detectContacts") & 1) == 0)
  {
    sgLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
LABEL_26:

      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v20 = "Skipping signature dissector: detectContacts is OFF";
LABEL_29:
    _os_log_debug_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEBUG, v20, buf, 2u);
    goto LABEL_26;
  }
  v33 = 0uLL;
  objc_msgSend(v9, "releaseDissectorLock");
  if (-[NSNumber BOOLValue](self->_ignoreDataDetectorsForTesting, "BOOLValue")
    || objc_msgSend(v8, "detectedDataSignatureRange") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = -[SGSignatureDissector signatureRange:](self, "signatureRange:", v8);
    *(_QWORD *)&v33 = v14;
    *((_QWORD *)&v33 + 1) = v15;
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = v14;
      v17 = v15;
      sgLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEBUG, "Signature found by alternative algorithms.", buf, 2u);
      }

      goto LABEL_18;
    }
  }
  else
  {
    sgLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEBUG, "Signature found by DataDetectors.", buf, 2u);
    }

    v22 = objc_msgSend(v8, "detectedDataSignatureRange");
    *(_QWORD *)&v33 = v22;
    *((_QWORD *)&v33 + 1) = v23;
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = v22;
      v17 = v23;
LABEL_18:
      v25 = (void *)MEMORY[0x1C3BD4F6C]();
      sgLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v31 = v17 + v16;
        objc_msgSend(v8, "textContent");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "substringWithRange:", v16, v17);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v35 = v16;
        v36 = 2048;
        v37 = v31;
        v38 = 2112;
        v39 = v30;
        _os_log_debug_impl(&dword_1C3607000, v26, OS_LOG_TYPE_DEBUG, "Sig range %lu-%lu (%@)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v25);
      v32 = 0;
      if (-[SGSignatureDissector shouldIgnoreSignature:signatureRange:isInhuman:](self, "shouldIgnoreSignature:signatureRange:isInhuman:", v8, &v33, &v32))
      {
        v33 = xmmword_1C385A570;
      }
      goto LABEL_22;
    }
  }
  sgLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEBUG, "No signature found", buf, 2u);
  }

  v32 = 0;
LABEL_22:
  objc_msgSend(v9, "acquireDissectorLock");
  objc_msgSend(v9, "setPlainTextSigRange:", v33);
  if (v32)
  {
    sgLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v27, OS_LOG_TYPE_DEBUG, "Tagging as inhuman after adjusting range: Signature pattern", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D197F0], "inhuman");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTag:", v28);

    sgLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v20 = "Ignoring signature after adjusting range: Inhuman pattern.";
    goto LABEL_29;
  }
LABEL_27:
  objc_autoreleasePoolPop(v11);

}

- (BOOL)_paragraphWithContent:(id)a3 range:(_NSRange)a4 exceedsLineLimit:(unint64_t)a5 orCharacterLimit:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  BOOL v11;
  uint64_t v12;

  length = a4.length;
  location = a4.location;
  v10 = a3;
  if (length <= a6)
  {
    if (!length)
    {
LABEL_8:
      v11 = 0;
      goto LABEL_9;
    }
    v12 = 0;
    while (objc_msgSend(v10, "characterAtIndex:", location) != 10 || ++v12 <= a5)
    {
      ++location;
      if (!--length)
        goto LABEL_8;
    }
  }
  v11 = 1;
LABEL_9:

  return v11;
}

- (BOOL)shouldIgnoreSignature:(id)a3 signatureRange:(_NSRange *)a4 isInhuman:(BOOL *)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  BOOL v13;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  unint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  NSUInteger v38;
  unint64_t v39;
  void *v40;
  void *v41;
  BOOL v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  NSUInteger v47;
  BOOL v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  BOOL v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  BOOL v59;
  void *v60;
  NSObject *v61;
  void *v62;
  BOOL v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  int v79;
  char v80;
  NSObject *v81;
  int v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  int v88;
  NSObject *v89;
  const char *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  void *v98;
  _BOOL4 v99;
  unint64_t v100;
  SGPlainTextContentCursor *v101;
  void *v102;
  BOOL v103;
  uint64_t v104;
  unint64_t v105;
  NSObject *v106;
  void *v107;
  unint64_t v108;
  void *v109;
  _BOOL4 v110;
  void *v111;
  BOOL v112;
  uint64_t v113;
  NSUInteger v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  BOOL v120;
  void *v121;
  void *v122;
  void *v123;
  BOOL v124;
  NSObject *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t i;
  void *v131;
  unint64_t v132;
  unint64_t v133;
  int v135;
  void *v136;
  uint64_t v137;
  _BOOL4 v138;
  uint64_t v139;
  void *v140;
  void *v141;
  NSObject *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  NSUInteger v149;
  void *v150;
  NSUInteger v151;
  NSUInteger v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  id v158;
  NSObject *v159;
  NSObject *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t j;
  void *v169;
  void *v170;
  NSUInteger v171;
  NSUInteger v172;
  void *v173;
  uint64_t v174;
  NSUInteger v175;
  NSUInteger v176;
  NSObject *v177;
  void *v178;
  id v179;
  void *v180;
  uint64_t v181;
  NSObject *v182;
  NSObject *v183;
  void *v184;
  void *v185;
  BOOL *v186;
  NSObject *v187;
  NSObject *obj;
  void *v189;
  void *v190;
  uint64_t v191;
  unint64_t v192;
  id v193;
  NSUInteger length;
  NSUInteger location;
  void *context;
  _NSRange *v198;
  void *v199;
  uint8_t v200[16];
  _QWORD v201[4];
  NSObject *v202;
  SGSignatureDissector *v203;
  NSObject *v204;
  uint8_t *v205;
  uint8_t v206[8];
  uint8_t *v207;
  uint64_t v208;
  char v209;
  _QWORD v210[4];
  id v211;
  id v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  _QWORD v233[4];
  id v234;
  id v235;
  uint8_t *v236;
  uint8_t buf[8];
  uint8_t *v238;
  uint64_t v239;
  uint64_t v240;
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  _BYTE v244[128];
  _BYTE v245[128];
  uint64_t v246;
  NSRange v247;
  NSRange v248;

  v246 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  context = (void *)MEMORY[0x1C3BD4F6C]();
  v198 = a4;
  length = a4->length;
  location = a4->location;
  *a5 = 0;
  v199 = v7;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v186 = a5;
    objc_msgSend(v7, "textContent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (location > v10)
    {
      sgLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "Can't meaningfully call shouldIgnoreSignature with a signature that starts after the content.", buf, 2u);
      }
      goto LABEL_12;
    }
    objc_msgSend(v7, "textContent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (length + location > v12)
    {
      sgLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "Can't meaningfully call shouldIgnoreSignature on an entity with no detected signature.", buf, 2u);
      }
      goto LABEL_12;
    }
    v15 = (void *)objc_opt_new();
    *(_QWORD *)buf = 0;
    v238 = buf;
    v239 = 0x2020000000;
    v240 = 0;
    objc_msgSend(v7, "quotedRegions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v233[0] = MEMORY[0x1E0C809B0];
    v233[1] = 3221225472;
    v233[2] = __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke;
    v233[3] = &unk_1E7DAEDB0;
    v236 = buf;
    v17 = v15;
    v234 = v17;
    v193 = v7;
    v235 = v193;
    objc_msgSend(v16, "enumerateRangesUsingBlock:", v233);

    v18 = *((_QWORD *)v238 + 3);
    objc_msgSend(v193, "textContent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = v18 < objc_msgSend(v19, "length");

    if ((_DWORD)v18)
    {
      objc_msgSend(v193, "textContent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "substringFromIndex:", *((_QWORD *)v238 + 3));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v21);

      objc_msgSend(v193, "textContent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "length");
      *((_QWORD *)v238 + 3) = v23;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "_pas_proxyStringByConcatenatingStrings:", v17);
    v185 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v185, "substringWithRange:", v198->location, v198->length);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    patterns_19149();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "regex2ForKey:", CFSTR("InhumanSig"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "existsInString:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      sgLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v206 = 0;
        _os_log_debug_impl(&dword_1C3607000, v29, OS_LOG_TYPE_DEBUG, "Tagging as inhuman: Signature pattern", v206, 2u);
      }

      sgLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v206 = 0;
        _os_log_debug_impl(&dword_1C3607000, v30, OS_LOG_TYPE_DEBUG, "Ignoring signature: Inhuman pattern.", v206, 2u);
      }

      *v186 = 1;
    }

    objc_autoreleasePoolPop(v24);
    if (v28)
    {
      v13 = 1;
LABEL_200:

      _Block_object_dispose(buf, 8);
      goto LABEL_13;
    }
    v31 = -[SGSignatureDissector findSignaturePrefix:](self, "findSignaturePrefix:", v193);
    if (v32)
    {
      v33 = v198->location - v31;
      if (v198->location < v31)
      {
        v34 = v198->length;
        if (v31 + v32 < v34 + v198->location)
        {
          v198->location = v31;
          v198->length = v33 + v34;
        }
      }
    }
    v35 = -[SGSignatureDissector findValediction:](self, "findValediction:", v193);
    if (v36 && v198->length + v198->location <= v35)
    {
      sgLogHandle();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v206 = 0;
        _os_log_debug_impl(&dword_1C3607000, v61, OS_LOG_TYPE_DEBUG, "Ignoring signature: Valediction after signature.", v206, 2u);
      }
      v13 = 1;
      goto LABEL_199;
    }
    +[SGContactStoreFactory contactStore](SGContactStoreFactory, "contactStore");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGCuratedContactMatcher fetchMeContactFromContactStore:](SGCuratedContactMatcher, "fetchMeContactFromContactStore:", v37);
    v187 = objc_claimAutoreleasedReturnValue();

    v39 = v198->location;
    v38 = v198->length;
    -[NSObject givenName](v187, "givenName");
    obj = objc_claimAutoreleasedReturnValue();
    if (!obj)
    {
LABEL_44:
      -[NSObject phoneNumbers](v187, "phoneNumbers");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v60, "count"))
      {

LABEL_50:
        v231 = 0u;
        v232 = 0u;
        v229 = 0u;
        v230 = 0u;
        objc_msgSend(v193, "plainTextDetectedData");
        v64 = objc_claimAutoreleasedReturnValue();
        v65 = -[NSObject countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v229, v245, 16);
        obj = v64;
        if (!v65)
          goto LABEL_90;
        v189 = *(void **)v230;
        while (1)
        {
          v66 = 0;
          v191 = v65;
          do
          {
            if (*(void **)v230 != v189)
              objc_enumerationMutation(obj);
            v67 = *(void **)(*((_QWORD *)&v229 + 1) + 8 * v66);
            v68 = (void *)MEMORY[0x1C3BD4F6C]();
            v247.location = objc_msgSend(v67, "range");
            if (NSIntersectionRange(v247, *v198).length)
            {
              if (objc_msgSend(v67, "matchType"))
              {
                if (objc_msgSend(v67, "matchType") == 1)
                {
                  objc_msgSend(v193, "textContent");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  v70 = objc_msgSend(v67, "valueRange");
                  objc_msgSend(v69, "substringWithRange:", v70, v71);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();

                  v227 = 0u;
                  v228 = 0u;
                  v225 = 0u;
                  v226 = 0u;
                  -[NSObject postalAddresses](v187, "postalAddresses");
                  v73 = objc_claimAutoreleasedReturnValue();
                  v74 = -[NSObject countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v225, v244, 16);
                  if (v74)
                  {
                    v75 = *(_QWORD *)v226;
LABEL_60:
                    v76 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v226 != v75)
                        objc_enumerationMutation(v73);
                      v77 = *(void **)(*((_QWORD *)&v225 + 1) + 8 * v76);
                      v78 = (void *)MEMORY[0x1C3BD4F6C]();
                      v79 = SGPostalAddressesMatchWithParsed(v77, v72, 0, 0, 0, 0, 1);
                      v80 = v79;
                      if (v79)
                      {
                        sgLogHandle();
                        v81 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
                        {
                          *(_WORD *)v206 = 0;
                          _os_log_debug_impl(&dword_1C3607000, v81, OS_LOG_TYPE_DEBUG, "Ignoring signature: Recipient's postal.", v206, 2u);
                        }

                      }
                      objc_autoreleasePoolPop(v78);
                      if ((v80 & 1) != 0)
                        break;
                      if (v74 == ++v76)
                      {
                        v74 = -[NSObject countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v225, v244, 16);
                        if (v74)
                          goto LABEL_60;
                        goto LABEL_70;
                      }
                    }
LABEL_78:
                    v82 = 1;
                  }
                  else
                  {
LABEL_70:
                    v82 = 0;
                  }

LABEL_81:
                  goto LABEL_82;
                }
                if (objc_msgSend(v67, "matchType") != 2)
                {
                  v82 = 0;
                  goto LABEL_82;
                }
                objc_msgSend(v193, "textContent");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                v92 = objc_msgSend(v67, "valueRange");
                objc_msgSend(v91, "substringWithRange:", v92, v93);
                v72 = (void *)objc_claimAutoreleasedReturnValue();

                -[NSObject emailAddresses](v187, "emailAddresses");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                SGNormalizeEmailAddress();
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                v96 = objc_msgSend(v94, "containsObject:", v95);

                if (v96)
                {
                  sgLogHandle();
                  v73 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
                    goto LABEL_78;
                  *(_WORD *)v206 = 0;
                  v89 = v73;
                  v90 = "Ignoring signature: Recipient's email.";
                  goto LABEL_88;
                }
              }
              else
              {
                objc_msgSend(v193, "textContent");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v84 = objc_msgSend(v67, "valueRange");
                objc_msgSend(v83, "substringWithRange:", v84, v85);
                v72 = (void *)objc_claimAutoreleasedReturnValue();

                -[NSObject phoneNumbers](v187, "phoneNumbers");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                SGNormalizePhoneNumber();
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                v88 = objc_msgSend(v86, "containsObject:", v87);

                if (v88)
                {
                  sgLogHandle();
                  v73 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
                    goto LABEL_78;
                  *(_WORD *)v206 = 0;
                  v89 = v73;
                  v90 = "Ignoring signature: Recipient's phone.";
LABEL_88:
                  _os_log_debug_impl(&dword_1C3607000, v89, OS_LOG_TYPE_DEBUG, v90, v206, 2u);
                  goto LABEL_78;
                }
              }
              v82 = 0;
              goto LABEL_81;
            }
            v82 = 3;
LABEL_82:
            objc_autoreleasePoolPop(v68);
            if (v82 != 3 && v82)
              goto LABEL_150;
            ++v66;
          }
          while (v66 != v191);
          v65 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v229, v245, 16);
          if (!v65)
          {
LABEL_90:

            goto LABEL_91;
          }
        }
      }
      -[NSObject postalAddresses](v187, "postalAddresses");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "count") == 0;

      if (!v63)
        goto LABEL_50;
LABEL_91:
      -[SGSignatureDissector authorName:](self, "authorName:", v193);
      obj = objc_claimAutoreleasedReturnValue();
      if (!obj
        || (nontokenCharset(),
            v97 = (void *)objc_claimAutoreleasedReturnValue(),
            -[NSObject stringByTrimmingCharactersInSet:](obj, "stringByTrimmingCharactersInSet:", v97),
            v98 = (void *)objc_claimAutoreleasedReturnValue(),
            v99 = objc_msgSend(v98, "length") == 0,
            v98,
            v97,
            v99))
      {
        sgLogHandle();
        v101 = (SGPlainTextContentCursor *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v101->super, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v206 = 0;
          _os_log_debug_impl(&dword_1C3607000, &v101->super, OS_LOG_TYPE_DEBUG, "Ignoring signature: Sender's name unavailable.", v206, 2u);
        }
      }
      else
      {
        v100 = v198->location;
        v101 = -[SGPlainTextContentCursor initWithMailMessage:]([SGPlainTextContentCursor alloc], "initWithMailMessage:", v193);
        -[SGPlainTextContentCursor setPos:](v101, "setPos:", v198->location);
        if (-[SGPlainTextContentCursor pos](v101, "pos"))
        {
          objc_msgSend(v193, "textContent");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = objc_msgSend(v102, "characterAtIndex:", -[SGPlainTextContentCursor pos](v101, "pos")) == 10;

          if (!v103)
          {
            -[SGPlainTextContentCursor backwardWhile:](v101, "backwardWhile:", &__block_literal_global_81_19165);
            v100 = -[SGPlainTextContentCursor pos](v101, "pos");
          }
        }
        v104 = -[SGPlainTextContentCursor pos](v101, "pos");
        -[SGPlainTextContentCursor backwardWhile:](v101, "backwardWhile:", &__block_literal_global_82_19166);
        if (-[SGPlainTextContentCursor pos](v101, "pos"))
          v105 = -[SGPlainTextContentCursor pos](v101, "pos") + 1;
        else
          v105 = 1;
        objc_msgSend(v193, "textContent");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = objc_msgSend(v107, "length");

        if (v105 >= v108)
          v105 = v108;
        -[SGPlainTextContentCursor setPos:](v101, "setPos:", v104);
        -[SGPlainTextContentCursor backwardToString:consume:](v101, "backwardToString:consume:", CFSTR("\n\n"), 1);
        objc_msgSend(v193, "textContent");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = -[SGSignatureDissector _paragraphWithContent:range:exceedsLineLimit:orCharacterLimit:](self, "_paragraphWithContent:range:exceedsLineLimit:orCharacterLimit:", v109, -[SGPlainTextContentCursor pos](v101, "pos"), v104 - -[SGPlainTextContentCursor pos](v101, "pos"), 4, 125);

        if (v110)
          -[SGPlainTextContentCursor setPos:](v101, "setPos:", v104);
        if (-[SGPlainTextContentCursor pos](v101, "pos") == v100)
        {
          if (!v110)
            v100 = 0;
        }
        else
        {
          -[SGPlainTextContentCursor backwardWhile:](v101, "backwardWhile:", &__block_literal_global_83_19168);
          v100 = -[SGPlainTextContentCursor pos](v101, "pos");
          -[SGPlainTextContentCursor backwardToString:consume:](v101, "backwardToString:consume:", CFSTR("\n\n"), 0);
          objc_msgSend(v193, "textContent");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = -[SGSignatureDissector _paragraphWithContent:range:exceedsLineLimit:orCharacterLimit:](self, "_paragraphWithContent:range:exceedsLineLimit:orCharacterLimit:", v111, -[SGPlainTextContentCursor pos](v101, "pos"), v100 - -[SGPlainTextContentCursor pos](v101, "pos"), 2, 75);

          if (!v112)
            v100 = -[SGPlainTextContentCursor pos](v101, "pos");
        }
        if (v100 <= v105)
          v100 = v105;
        -[SGPlainTextContentCursor setPos:](v101, "setPos:", v100);
        -[SGPlainTextContentCursor forwardWhile:](v101, "forwardWhile:", &__block_literal_global_84);
        v113 = -[SGPlainTextContentCursor pos](v101, "pos");
        v114 = v198->length;
        if (v113 - v100 >= v198->location - v100 + v114)
          v115 = v198->location - v100 + v114;
        else
          v115 = v113 - v100;
        v117 = -[SGSignatureDissector rangeOfSenderName:inRange:restrictLength:forMessage:](self, "rangeOfSenderName:inRange:restrictLength:forMessage:", obj, v100, v115, 0, v193);
        if (v117 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v193, "author");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "sg_emailAddress");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = v119 == 0;

          if (v120)
            goto LABEL_125;
          objc_msgSend(v193, "textContent");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v193, "author");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "sg_emailAddress");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = objc_msgSend(v121, "rangeOfString:options:range:", v123, 1, v100, v115) == 0x7FFFFFFFFFFFFFFFLL;

          if (v124)
          {
LABEL_125:
            sgLogHandle();
            v125 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v206 = 0;
              _os_log_debug_impl(&dword_1C3607000, v125, OS_LOG_TYPE_DEBUG, "Ignoring signature: No sender's name or email.", v206, 2u);
            }
            goto LABEL_127;
          }
        }
        else
        {
          v126 = v116;
          v190 = (void *)MEMORY[0x1C3BD4F6C]();
          v192 = v117 + v100;
          -[SGPlainTextContentCursor setPos:](v101, "setPos:");
          v223 = 0u;
          v224 = 0u;
          v221 = 0u;
          v222 = 0u;
          objc_msgSend(v193, "plainTextDetectedData");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v221, v243, 16);
          if (v128)
          {
            v129 = *(_QWORD *)v222;
            do
            {
              for (i = 0; i != v128; ++i)
              {
                if (*(_QWORD *)v222 != v129)
                  objc_enumerationMutation(v127);
                v131 = *(void **)(*((_QWORD *)&v221 + 1) + 8 * i);
                v132 = objc_msgSend(v131, "range");
                if (v132 > -[SGPlainTextContentCursor pos](v101, "pos"))
                {
                  v133 = objc_msgSend(v131, "range");
                  if (v133 >= v198->location && v133 - v198->location < v198->length)
                  {
                    v135 = 1;
                    goto LABEL_142;
                  }
                }
              }
              v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v221, v243, 16);
            }
            while (v128);
          }
          v135 = 0;
LABEL_142:

          objc_msgSend(v193, "textContent");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          v137 = v192 + v126;
          if (v192 + v126 == objc_msgSend(v136, "length"))
          {
            v138 = 1;
          }
          else
          {
            v139 = -[NSObject length](obj, "length");
            objc_msgSend(v193, "textContent");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            if (v139 + v192 >= objc_msgSend(v140, "length"))
            {
              v138 = 1;
            }
            else
            {
              objc_msgSend(v193, "textContent");
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v141, "characterAtIndex:", v137) == 10)
              {
                v138 = 1;
              }
              else
              {
                objc_msgSend(v193, "textContent");
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject stringByAppendingString:](obj, "stringByAppendingString:", CFSTR("\n"));
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v193, "textContent");
                v145 = (void *)objc_claimAutoreleasedReturnValue();
                v184 = v141;
                v146 = v143;
                v138 = objc_msgSend(v143, "rangeOfString:options:range:", v144, 1, v192, objc_msgSend(v145, "length") - v192) == v192;

                v141 = v184;
              }

            }
          }

          v147 = -[SGPlainTextContentCursor pos](v101, "pos");
          -[SGPlainTextContentCursor forwardWhile:](v101, "forwardWhile:", &__block_literal_global_86_19171);
          if ((v135 | v138) == 1 && -[SGPlainTextContentCursor pos](v101, "pos") > v100)
          {
            v148 = -[SGPlainTextContentCursor pos](v101, "pos");
            v149 = v115 + v100 - v147;
            if (v149 >= v148 - v147)
              v149 = v148 - v147;
            v198->location = v147;
            v198->length = v149;
          }
          objc_autoreleasePoolPop(v190);
        }
        if (v198->location == location && v198->length == length)
          goto LABEL_170;
        v150 = (void *)MEMORY[0x1C3BD4F6C]();
        v151 = v198->location;
        v152 = v198->length;
        v153 = (void *)MEMORY[0x1C3BD4F6C]();
        patterns_19149();
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "regex2ForKey:", CFSTR("InhumanSig"));
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "substringWithRange:", v151, v152);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "existsInString:", v156);
        v157 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v153);
        v158 = v157;

        if (v158)
        {
          sgLogHandle();
          v159 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v206 = 0;
            _os_log_debug_impl(&dword_1C3607000, v159, OS_LOG_TYPE_DEBUG, "Tagging as inhuman after adjusting range: Signature pattern", v206, 2u);
          }

          sgLogHandle();
          v160 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v206 = 0;
            _os_log_debug_impl(&dword_1C3607000, v160, OS_LOG_TYPE_DEBUG, "Ignoring signature after adjusting range: Inhuman pattern.", v206, 2u);
          }

          *v186 = 1;
        }
        objc_autoreleasePoolPop(v150);
        if (!v158)
        {
LABEL_170:
          v219 = 0u;
          v220 = 0u;
          v217 = 0u;
          v218 = 0u;
          objc_msgSend(v193, "plainTextDetectedData");
          v125 = objc_claimAutoreleasedReturnValue();
          v161 = -[NSObject countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v217, v242, 16);
          if (!v161)
          {
LABEL_179:

            -[SGSignatureDissector findRejectSig:](self, "findRejectSig:", v193);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            v215 = 0u;
            v216 = 0u;
            v213 = 0u;
            v214 = 0u;
            v125 = v165;
            v166 = -[NSObject countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v213, v241, 16);
            if (v166)
            {
              v167 = *(_QWORD *)v214;
              while (2)
              {
                for (j = 0; j != v166; ++j)
                {
                  if (*(_QWORD *)v214 != v167)
                    objc_enumerationMutation(v125);
                  v248.location = objc_msgSend(*(id *)(*((_QWORD *)&v213 + 1) + 8 * j), "rangeValue");
                  if (NSIntersectionRange(v248, *v198).length)
                  {
                    sgLogHandle();
                    v177 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v177, OS_LOG_TYPE_DEBUG))
                    {
                      *(_WORD *)v206 = 0;
                      _os_log_debug_impl(&dword_1C3607000, v177, OS_LOG_TYPE_DEBUG, "Ignoring signature: Anti pattern.", v206, 2u);
                    }
                    v13 = 1;
                    v182 = v125;
                    goto LABEL_195;
                  }
                }
                v166 = -[NSObject countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v213, v241, 16);
                if (v166)
                  continue;
                break;
              }
            }

            +[SGIdentityName nameWithString:](SGIdentityName, "nameWithString:", obj);
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            v170 = (void *)objc_opt_new();
            v171 = v198->location;
            v172 = v198->length;
            objc_msgSend(v193, "textContent");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            v174 = objc_msgSend(v173, "length");
            v175 = v198->location;
            v176 = v198->length;

            v177 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", v172 + v171, v174 - (v175 + v176));
            objc_msgSend(v193, "quotedRegions");
            v178 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject removeIndexes:](v177, "removeIndexes:", v178);

            v210[0] = MEMORY[0x1E0C809B0];
            v210[1] = 3221225472;
            v210[2] = __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_87;
            v210[3] = &unk_1E7DB72C0;
            v179 = v170;
            v211 = v179;
            v212 = v193;
            -[NSObject enumerateRangesUsingBlock:](v177, "enumerateRangesUsingBlock:", v210);
            objc_msgSend(MEMORY[0x1E0CB3940], "_pas_proxyStringByConcatenatingStrings:", v179);
            v180 = (void *)objc_claimAutoreleasedReturnValue();

            *(_QWORD *)v206 = 0;
            v207 = v206;
            v208 = 0x2020000000;
            v209 = 0;
            v181 = objc_msgSend(v180, "length");
            v201[0] = MEMORY[0x1E0C809B0];
            v201[1] = 3221225472;
            v201[2] = __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_2_88;
            v201[3] = &unk_1E7DAEE78;
            v202 = obj;
            v203 = self;
            v182 = v169;
            v204 = v182;
            v205 = v206;
            objc_msgSend(v180, "enumerateSubstringsInRange:options:usingBlock:", 0, v181, 256, v201);
            v13 = v207[24] != 0;
            if (!v207[24])
            {
              sgLogHandle();
              v183 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v183, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)v200 = 0;
                _os_log_debug_impl(&dword_1C3607000, v183, OS_LOG_TYPE_DEBUG, "Not ignoring signature.", v200, 2u);
              }

            }
            _Block_object_dispose(v206, 8);

LABEL_195:
            goto LABEL_196;
          }
          v162 = 0;
          v163 = *(_QWORD *)v218;
LABEL_172:
          v164 = 0;
          while (1)
          {
            if (*(_QWORD *)v218 != v163)
              objc_enumerationMutation(v125);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v217 + 1) + 8 * v164), "matchType") == 2
              && (unint64_t)++v162 > 3)
            {
              break;
            }
            if (v161 == ++v164)
            {
              v161 = -[NSObject countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v217, v242, 16);
              if (v161)
                goto LABEL_172;
              goto LABEL_179;
            }
          }
LABEL_127:
          v13 = 1;
LABEL_196:

          goto LABEL_197;
        }
      }
      v13 = 1;
LABEL_197:

      goto LABEL_198;
    }
    -[NSObject familyName](v187, "familyName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      -[NSObject formattedName](v187, "formattedName");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41 == 0;

      if (v42)
        goto LABEL_44;
      if (v39 >= 0x14)
        v43 = 20;
      else
        v43 = v39;
      if (v39 >= 0x14)
        v44 = v39 - 20;
      else
        v44 = 0;
      objc_msgSend(v193, "textContent");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject formattedName](v187, "formattedName");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v38 + v43;
      v48 = objc_msgSend(v45, "rangeOfString:options:range:", v46, 0, v44, v47) == 0x7FFFFFFFFFFFFFFFLL;

      if (v48)
      {
        v49 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[NSObject givenName](v187, "givenName");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject familyName](v187, "familyName");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        obj = objc_msgSend(v49, "initWithFormat:", CFSTR("%@ %@"), v50, v51);

        objc_msgSend(v193, "textContent");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "rangeOfString:options:range:", obj, 0, v44, v47) == 0x7FFFFFFFFFFFFFFFLL;

        if (v53)
        {
          v54 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[NSObject familyName](v187, "familyName");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject givenName](v187, "givenName");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = (void *)objc_msgSend(v54, "initWithFormat:", CFSTR("%@ %@"), v55, v56);

          objc_msgSend(v193, "textContent");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "rangeOfString:options:range:", v57, 0, v44, v47) == 0x7FFFFFFFFFFFFFFFLL;

          if (v59)
          {

            goto LABEL_43;
          }
          sgLogHandle();
          v142 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v206 = 0;
            _os_log_debug_impl(&dword_1C3607000, v142, OS_LOG_TYPE_DEBUG, "Ignoring signature: Recipient's name (last first).", v206, 2u);
          }

        }
        else
        {
          sgLogHandle();
          v106 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v206 = 0;
            _os_log_debug_impl(&dword_1C3607000, v106, OS_LOG_TYPE_DEBUG, "Ignoring signature: Recipient's name (first last).", v206, 2u);
          }

        }
      }
      else
      {
        sgLogHandle();
        obj = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v206 = 0;
          _os_log_debug_impl(&dword_1C3607000, obj, OS_LOG_TYPE_DEBUG, "Ignoring signature: Recipient's name (composite).", v206, 2u);
        }
      }
LABEL_150:
      v13 = 1;
LABEL_198:

      v61 = v187;
LABEL_199:

      goto LABEL_200;
    }
LABEL_43:

    goto LABEL_44;
  }
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "Can't meaningfully call shouldIgnoreSignature on an entity with no detected signature.", buf, 2u);
  }
LABEL_12:

  v13 = 1;
LABEL_13:
  objc_autoreleasePoolPop(context);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreDataDetectorsForTesting, 0);
}

void __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke(uint64_t a1, unint64_t a2, size_t size)
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v6 = a2 - v5;
  if (a2 > v5)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "textContent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "substringWithRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v6;
  }
  v10 = malloc_type_calloc(1uLL, size, 0x26A8E209uLL);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v10, size, 1, 1);
  if (!v11)
    __assert_rtn("-[SGSignatureDissector shouldIgnoreSignature:signatureRange:isInhuman:]_block_invoke", "SGSignatureDissector.m", 989, "sub != nil");
  v13 = (id)v11;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v13, "length");

}

void __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_87(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 40), "textContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "substringWithRange:", a2, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "addObject:", v9);

}

void __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_2_88(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  uint8_t v18[16];

  v10 = a2;
  if (a4 && a4 <= 2 * objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v11 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend((id)objc_opt_class(), "singleLineSignatureLeadingCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "firstname");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "caseInsensitiveCompare:", v14))
    {
      objc_msgSend(*(id *)(a1 + 48), "surname");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "caseInsensitiveCompare:", v15))
      {
        v16 = +[SGNames unnormalizedNamesApproximatelyMatch:and:](SGNames, "unnormalizedNamesApproximatelyMatch:and:", *(_QWORD *)(a1 + 32), v13);

        if (!v16)
        {
LABEL_12:

          objc_autoreleasePoolPop(v11);
          goto LABEL_13;
        }
LABEL_9:
        sgLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v18 = 0;
          _os_log_debug_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEBUG, "Ignoring signature: Sender's name after sig.", v18, 2u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        *a7 = 1;
        goto LABEL_12;
      }

    }
    goto LABEL_9;
  }
LABEL_13:

}

uint64_t __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_85(uint64_t a1, uint64_t a2, int a3)
{
  return a3 ^ 1u;
}

uint64_t __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_4(uint64_t a1, uint64_t a2, int a3)
{
  return a3 ^ 1u;
}

uint64_t __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_3(uint64_t a1, int a2, int a3)
{
  if (a2 == 10)
    return a3 ^ 1u;
  else
    return 0;
}

uint64_t __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  return a3 ^ 1u;
}

uint64_t __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_80(uint64_t a1, int a2, int a3)
{
  if (a2 == 10)
    return 0;
  else
    return a3 ^ 1u;
}

BOOL __52__SGSignatureDissector_trailingSenderNameLineRange___block_invoke_4(uint64_t a1, int a2)
{
  return a2 == 10;
}

BOOL __52__SGSignatureDissector_trailingSenderNameLineRange___block_invoke_3(uint64_t a1, int a2)
{
  return a2 == 10;
}

BOOL __52__SGSignatureDissector_trailingSenderNameLineRange___block_invoke_2(uint64_t a1, int a2)
{
  return a2 != 10;
}

uint64_t __52__SGSignatureDissector_trailingSenderNameLineRange___block_invoke(uint64_t a1, int a2, unsigned int a3)
{
  if (a2 == 10)
    return 1;
  else
    return a3;
}

void __91__SGSignatureDissector_hmmSignatureRangeWithContent_detectedData_quotedRegions_authorName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  +[SGSlice sliceWithType:range:](SGSlice, "sliceWithType:range:", 5, a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

uint64_t __51__SGSignatureDissector_hmmPlausibleSignatureRange___block_invoke()
{
  return 1;
}

uint64_t __38__SGSignatureDissector_findRejectSig___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:", *a2, a2[1]) & 1) == 0)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", *a2, a2[1]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  return 1;
}

uint64_t __77__SGSignatureDissector_findSignaturePrefixesInMessage_withSignaturePrefixes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__SGSignatureDissector_findSignaturePrefixesInMessage_withSignaturePrefixes___block_invoke_2;
  v9[3] = &unk_1E7DAEC58;
  v12 = a2;
  v13 = a3;
  v7 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v7, "enumerateMatchesInString:ngroups:block:", v6, 0, v9);

  return 1;
}

uint64_t __77__SGSignatureDissector_findSignaturePrefixesInMessage_withSignaturePrefixes___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:", *a2 + *(_QWORD *)(a1 + 48), a2[1] + 1) & 1) == 0)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", *a2 + *(_QWORD *)(a1 + 48), a2[1]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  return 1;
}

uint64_t __64__SGSignatureDissector_findValedictionCommencedSignatureRanges___block_invoke(int a1, NSRange range1)
{
  NSUInteger length;
  id *v3;
  id *v4;
  NSUInteger location;
  uint64_t v6;
  NSRange v7;
  NSUInteger v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  NSUInteger v17;
  NSUInteger v18;

  length = range1.length;
  v4 = v3;
  if (range1.location)
  {
    range1.length = range1.location - 1;
    location = range1.location;
    range1.location = length;
    v6 = 1;
    v7 = NSUnionRange(range1, *(NSRange *)&range1.length);
    v8 = v7.location;
    length = v7.length;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4[4], "substringWithRange:", v8, length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  patterns_19149();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "regex2ForKey:", CFSTR("RelaxedSig/F"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__SGSignatureDissector_findValedictionCommencedSignatureRanges___block_invoke_2;
  v13[3] = &unk_1E7DAEC08;
  v17 = v8;
  v18 = length;
  v14 = v4[5];
  v15 = v4[4];
  v16 = v4[6];
  objc_msgSend(v11, "enumerateMatchesInString:ngroups:block:", v9, 0, v13);

  return 1;
}

uint64_t __64__SGSignatureDissector_findValedictionCommencedSignatureRanges___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFIndex v18;
  UniChar v19;
  uint64_t v21;
  CFIndex v22;
  uint64_t v23;
  CFIndex v24;
  uint64_t v25;
  void *v26;
  CFIndex v28;
  void *v29;
  int v30;
  UniChar buffer[8];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CFStringRef theString;
  const UniChar *v40;
  const char *v41;
  uint64_t v42;
  CFIndex v43;
  uint64_t v44;
  uint64_t v45;
  CFRange v46;

  v3 = a2[1];
  v4 = *(_QWORD *)(a1 + 56) + *a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:", v4, v3) & 1) != 0)
    return 1;
  objc_msgSend(*(id *)(a1 + 40), "substringFromIndex:", v4 + v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "length") < 4)
    goto LABEL_53;
  v6 = v5;
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_38;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  *(_OWORD *)buffer = 0u;
  v32 = 0u;
  Length = CFStringGetLength(v6);
  theString = v6;
  v42 = 0;
  v43 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v6);
  CStringPtr = 0;
  v40 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
  v44 = 0;
  v45 = 0;
  v41 = CStringPtr;
  if (Length < 1)
  {
LABEL_38:

    goto LABEL_52;
  }
  v29 = v5;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  while (2)
  {
    v30 = v13;
    v14 = 0;
    v15 = -v12;
    v16 = v12 + 64;
    v28 = v12;
    while (1)
    {
      v17 = (unint64_t)v12 >= 4 ? 4 : v12;
      v18 = v43;
      if (v43 > v12)
      {
        if (v40)
        {
          v19 = v40[v12 + v42];
        }
        else if (v41)
        {
          v19 = v41[v42 + v12];
        }
        else
        {
          if (v45 <= v12 || v11 > v12)
          {
            v21 = v17 + v15;
            v22 = v16 - v17;
            v23 = v12 - v17;
            v24 = v23 + 64;
            if (v23 + 64 >= v43)
              v24 = v43;
            v44 = v23;
            v45 = v24;
            if (v43 >= v22)
              v18 = v22;
            v46.length = v18 + v21;
            v46.location = v23 + v42;
            CFStringGetCharacters(theString, v46, buffer);
            v11 = v44;
          }
          v19 = buffer[v12 - v11];
        }
        if (v19 == 13)
          goto LABEL_30;
        if (v19 == 10)
          break;
      }
      ++v14;
LABEL_30:
      ++v12;
      --v15;
      ++v16;
      if (Length == v12)
      {

        v13 = v30;
        if (v14 >= 1)
          goto LABEL_40;
LABEL_46:
        v12 = Length;
LABEL_47:
        v5 = v29;
        goto LABEL_48;
      }
    }
    v13 = v30;
    if (v14 || !v30)
    {
      if (v14 >= 151)
      {

        Length = v28;
LABEL_40:
        if (v14 >= 0x97)
          v12 = v28;
        else
          v12 = Length;
        if (v14 < 0x97)
          ++v13;
        goto LABEL_47;
      }
      if (v30 != 4)
      {
        v13 = v30 + 1;
        if (++v12 != Length)
          continue;

        goto LABEL_46;
      }
      v13 = 5;
    }
    break;
  }
  v5 = v29;

LABEL_48:
  if (v13 <= 1)
  {
LABEL_52:

  }
  else
  {

    if (v12)
    {
      v25 = v12 + v3;
      if ((objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:", v4, v25) & 1) == 0)
      {
        v26 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v4, v25);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v6);
        goto LABEL_52;
      }
    }
  }
LABEL_53:

  return 1;
}

@end

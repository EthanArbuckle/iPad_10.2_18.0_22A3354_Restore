@implementation _EAREditDistance

- (_EAREditDistance)editDistanceWithRefTokens:(id)a3 hypTokens:(id)a4 caseInsensitive:(BOOL)a5 removeWordSense:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;
  _EARAlignmentState *v16;
  _EARAlignmentState *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v65;
  unint64_t v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  _BOOL4 v72;
  _BOOL4 v73;
  uint64_t v74;

  v6 = a6;
  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v74 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\\\\\S*$"), 0, &v74);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v74)
  {
    v72 = v6;
    v73 = v7;
    v67 = v12;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v9, "count") != -1)
    {
      v15 = 0;
      do
      {
        v16 = objc_alloc_init(_EARAlignmentState);
        -[_EARAlignmentState setNumberOfInsertions:](v16, "setNumberOfInsertions:", 0);
        -[_EARAlignmentState setNumberOfSubstitutions:](v16, "setNumberOfSubstitutions:", 0);
        -[_EARAlignmentState setNumberOfDeletions:](v16, "setNumberOfDeletions:", v15);
        -[_EARAlignmentState setTotalCost:](v16, "setTotalCost:", v15);
        objc_msgSend(v13, "addObject:", v16);
        v17 = objc_alloc_init(_EARAlignmentState);
        objc_msgSend(v14, "addObject:", v17);

        ++v15;
      }
      while (v15 < objc_msgSend(v9, "count") + 1);
    }
    if (objc_msgSend(v10, "count", v11))
    {
      v66 = 1;
      v70 = v9;
      v71 = v10;
      v68 = v13;
      v69 = v14;
      do
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v19, 0);

        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "incrementInsertions");

        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "incrementCost");

        if (objc_msgSend(v9, "count"))
        {
          v22 = 1;
          do
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "totalCost");

            objc_msgSend(v14, "objectAtIndexedSubscript:", v22 - 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v13;
            v27 = objc_msgSend(v25, "totalCost");

            objc_msgSend(v26, "objectAtIndexedSubscript:", v22 - 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "totalCost");

            objc_msgSend(v10, "objectAtIndexedSubscript:", v66 - 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectAtIndexedSubscript:", v22 - 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v73)
            {
              objc_msgSend(v30, "lowercaseString");
              v32 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v31, "lowercaseString");
              v33 = objc_claimAutoreleasedReturnValue();

              v30 = (void *)v32;
              v31 = (void *)v33;
            }
            if (v72)
            {
              objc_msgSend(v67, "stringByReplacingMatchesInString:options:range:withTemplate:", v30, 0, 0, objc_msgSend(v30, "length"), &stru_1E5D49530);
              v34 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v67, "stringByReplacingMatchesInString:options:range:withTemplate:", v31, 0, 0, objc_msgSend(v31, "length"), &stru_1E5D49530);
              v35 = objc_claimAutoreleasedReturnValue();

              v30 = (void *)v34;
              v31 = (void *)v35;
            }
            v9 = v70;
            v36 = v29 + (objc_msgSend(v30, "isEqualToString:", v31) ^ 1);
            if (v36 > v24 || v36 > v27)
            {
              if (v27 >= v24)
              {
                v13 = v68;
                objc_msgSend(v68, "objectAtIndexedSubscript:", v22);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = (void *)objc_msgSend(v44, "copy");
                v14 = v69;
                objc_msgSend(v69, "setObject:atIndexedSubscript:", v45, v22);

                objc_msgSend(v69, "objectAtIndexedSubscript:", v22);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setTotalCost:", v24 + 1);

                objc_msgSend(v69, "objectAtIndexedSubscript:", v22);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "incrementInsertions");
              }
              else
              {
                v14 = v69;
                objc_msgSend(v69, "objectAtIndexedSubscript:", v22 - 1);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = (void *)objc_msgSend(v41, "copy");
                objc_msgSend(v69, "setObject:atIndexedSubscript:", v42, v22);

                objc_msgSend(v69, "objectAtIndexedSubscript:", v22);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "setTotalCost:", v27 + 1);

                objc_msgSend(v69, "objectAtIndexedSubscript:", v22);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "incrementDeletions");
                v13 = v68;
              }
            }
            else
            {
              v13 = v68;
              objc_msgSend(v68, "objectAtIndexedSubscript:", v22 - 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = (void *)objc_msgSend(v37, "copy");
              v14 = v69;
              objc_msgSend(v69, "setObject:atIndexedSubscript:", v38, v22);

              if ((objc_msgSend(v30, "isEqualToString:", v31) & 1) == 0)
              {
                objc_msgSend(v69, "objectAtIndexedSubscript:", v22);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "incrementSubstitutions");

              }
              objc_msgSend(v69, "objectAtIndexedSubscript:", v22);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setTotalCost:", v36);
            }

            ++v22;
            v10 = v71;
          }
          while (v22 <= objc_msgSend(v70, "count"));
        }
        if (objc_msgSend(v13, "count"))
        {
          v47 = 0;
          do
          {
            objc_msgSend(v14, "objectAtIndexedSubscript:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (void *)objc_msgSend(v48, "copy");
            objc_msgSend(v13, "setObject:atIndexedSubscript:", v49, v47);

            ++v47;
          }
          while (v47 < objc_msgSend(v13, "count"));
        }
        ++v66;
      }
      while (v66 <= objc_msgSend(v10, "count"));
    }
    if (objc_msgSend(v13, "count"))
    {
      v50 = objc_msgSend(v13, "count") - 1;
      v51 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v13, "objectAtIndexedSubscript:", v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "numberWithInteger:", objc_msgSend(v52, "numberOfInsertions"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v65;
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v53, CFSTR("Insertions"));

      v54 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v13, "objectAtIndexedSubscript:", v50);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "numberWithInteger:", objc_msgSend(v55, "numberOfDeletions"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v56, CFSTR("Deletions"));

      v57 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v13, "objectAtIndexedSubscript:", v50);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "numberWithInteger:", objc_msgSend(v58, "numberOfSubstitutions"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v59, CFSTR("Substitutions"));

      v60 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v13, "objectAtIndexedSubscript:", v50);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "numberWithInteger:", objc_msgSend(v61, "totalCost"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v62, CFSTR("EditDistance"));

    }
    else
    {
      v11 = v65;
      objc_msgSend(v65, "setObject:forKeyedSubscript:", &unk_1E5D5BDC8, CFSTR("Insertions"));
      objc_msgSend(v65, "setObject:forKeyedSubscript:", &unk_1E5D5BDC8, CFSTR("Deletions"));
      objc_msgSend(v65, "setObject:forKeyedSubscript:", &unk_1E5D5BDC8, CFSTR("Substitutions"));
      objc_msgSend(v65, "setObject:forKeyedSubscript:", &unk_1E5D5BDC8, CFSTR("EditDistance"));
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v63, CFSTR("ReferenceSize"));

    v12 = v67;
  }

  return (_EAREditDistance *)v11;
}

- (_EAREditDistance)editDistanceWithRefText:(id)a3 hypText:(id)a4 caseInsensitive:(BOOL)a5 removeWordSense:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  _EARNLTokenizer *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(_EARNLTokenizer);
  -[_EARNLTokenizer setToLowerCase:](v12, "setToLowerCase:", 0);
  -[_EARNLTokenizer setReplacePunctuation:](v12, "setReplacePunctuation:", 0);
  -[_EARNLTokenizer tokenize:](v12, "tokenize:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_EARNLTokenizer tokenize:](v12, "tokenize:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_EAREditDistance editDistanceWithRefTokens:hypTokens:caseInsensitive:removeWordSense:](self, "editDistanceWithRefTokens:hypTokens:caseInsensitive:removeWordSense:", v13, v14, v7, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (_EAREditDistance *)v15;
}

- (void)editAlignmentWithRefTokens:(id)a3 hypTokens:(id)a4 placeholderSymbol:(id)a5 caseInsensitive:(BOOL)a6 removeWordSense:(BOOL)a7 completion:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t i;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  char *v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  unint64_t v67;
  uint64_t v68;
  id v70;
  id v71;
  void *v72;
  char *v73;
  void *v74;
  _QWORD v75[2];
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  char *v84;
  uint64_t v85;
  char *v86;
  _BOOL4 v87;
  _BOOL4 v88;
  id v89;
  id v90;
  _QWORD v91[2];

  v87 = a6;
  v88 = a7;
  v91[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a8;
  v90 = v11;
  v15 = objc_msgSend(v11, "count");
  v89 = v12;
  v16 = objc_msgSend(v12, "count");
  if (!v15 || (v17 = v16) == 0)
  {
LABEL_11:
    (*((void (**)(id, void *, _QWORD, _QWORD))v14 + 2))(v14, &unk_1E5D5BDE0, 0, 0);
    goto LABEL_12;
  }
  for (i = 0; i != v15; ++i)
  {
    objc_msgSend(v90, "objectAtIndexedSubscript:", i);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19 == v13)
      goto LABEL_11;
  }
  v20 = 0;
  do
  {
    objc_msgSend(v89, "objectAtIndexedSubscript:", v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    if (v21 == v13)
      goto LABEL_11;
    ++v20;
  }
  while (v17 != v20);
  v82 = v15;
  v77 = v14;
  v91[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\\\\\S*$"), 0, v91);
  v22 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v22;
  if (v91[0])
  {
    (*((void (**)(id, void *, _QWORD, _QWORD))v77 + 2))(v77, &unk_1E5D5BDE0, 0, 0);
    goto LABEL_61;
  }
  v75[1] = v75;
  v76 = v13;
  MEMORY[0x1E0C80A78](v22, v23);
  v26 = (char *)v75 - v25;
  v27 = 0;
  v83 = v28;
  v29 = 1;
  if (v28 > 1)
    v29 = v17 + 1;
  do
  {
    *(_QWORD *)&v26[8 * v27] = v27;
    ++v27;
  }
  while (v29 != v27);
  v84 = v26;
  v30 = v26 + 8;
  v81 = 8 * v17 + 8;
  v31 = 1;
  do
  {
    v32 = v31 - 1;
    v33 = *(_QWORD *)&v84[8 * (v31 - 1) * v83] + 1;
    v85 = v31;
    v86 = v30;
    *(_QWORD *)&v84[8 * v31 * v83] = v33;
    v34 = 1;
    do
    {
      objc_msgSend(v89, "objectAtIndexedSubscript:", v34 - 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "objectAtIndexedSubscript:", v32);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v87)
      {
        objc_msgSend(v35, "lowercaseString");
        v37 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v36, "lowercaseString");
        v38 = objc_claimAutoreleasedReturnValue();

        v36 = (void *)v38;
        v35 = (void *)v37;
      }
      if (v88)
      {
        objc_msgSend(v24, "stringByReplacingMatchesInString:options:range:withTemplate:", v35, 0, 0, objc_msgSend(v35, "length"), &stru_1E5D49530);
        v39 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "stringByReplacingMatchesInString:options:range:withTemplate:", v36, 0, 0, objc_msgSend(v36, "length"), &stru_1E5D49530);
        v40 = objc_claimAutoreleasedReturnValue();

        v36 = (void *)v40;
        v35 = (void *)v39;
      }
      v41 = *((_QWORD *)v30 - 1);
      v42 = v41 + (objc_msgSend(v35, "isEqualToString:", v36) ^ 1);
      v43 = *(_QWORD *)v30 + 1;
      v44 = *(_QWORD *)&v30[8 * v17];
      if (v43 >= v44 + 1)
        v43 = v44 + 1;
      if (v42 >= v43)
        v42 = v43;
      *(_QWORD *)&v30[8 * v17 + 8] = v42;

      ++v34;
      v30 += 8;
    }
    while (v34 <= v17);
    v31 = v85 + 1;
    v30 = &v86[v81];
  }
  while (v85 + 1 <= v82);
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v86 = (char *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = v82;
  v47 = v17;
  v13 = v76;
  v78 = v45;
  do
  {
    if (v46)
    {
      if (!v47)
      {
        v58 = 0;
        --v46;
        goto LABEL_55;
      }
      v48 = v47 - 1;
      objc_msgSend(v89, "objectAtIndexedSubscript:", v47 - 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v46 - 1;
      objc_msgSend(v90, "objectAtIndexedSubscript:");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v46;
      if (v87)
      {
        objc_msgSend(v49, "lowercaseString");
        v51 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v50, "lowercaseString");
        v52 = objc_claimAutoreleasedReturnValue();

        v49 = (void *)v51;
        v50 = (void *)v52;
      }
      if (v88)
      {
        objc_msgSend(v24, "stringByReplacingMatchesInString:options:range:withTemplate:", v49, 0, 0, objc_msgSend(v49, "length"), &stru_1E5D49530);
        v53 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "stringByReplacingMatchesInString:options:range:withTemplate:", v50, 0, 0, objc_msgSend(v50, "length"), &stru_1E5D49530);
        v54 = objc_claimAutoreleasedReturnValue();

        v55 = (void *)v53;
        v56 = (void *)v54;
      }
      else
      {
        v56 = v50;
        v55 = v49;
      }
      v59 = v83;
      v60 = v81;
      v61 = &v84[8 * v81 * v83];
      v79 = *(_QWORD *)&v61[8 * v48];
      v80 = v55;
      v62 = objc_msgSend(v55, "isEqualToString:", v56);
      v63 = *(_QWORD *)&v61[8 * v47];
      v57 = v85;
      v64 = *(_QWORD *)&v84[8 * v85 * v59 + 8 * v48];
      v65 = v63 + 1;
      if (v63 + 1 >= v64 + 1)
        v65 = v64 + 1;
      v66 = v63 <= v64;
      if (v63 <= v64)
        v67 = v47;
      else
        v67 = v47 - 1;
      v68 = v79 + (v62 ^ 1u);
      if (v66 || v68 <= v65)
        v46 = v60;
      else
        v46 = v85;
      if (v68 <= v65)
        v58 = v47 - 1;
      else
        v58 = v67;

      v45 = v78;
    }
    else
    {
      v57 = 0;
      v58 = v47 - 1;
    }
    if (v46 == v57)
    {
      v70 = v13;
      v46 = v57;
      goto LABEL_56;
    }
LABEL_55:
    objc_msgSend(v90, "objectAtIndexedSubscript:", v46);
    v70 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:
    if (v58 == v47)
    {
      v71 = v13;
    }
    else
    {
      objc_msgSend(v89, "objectAtIndexedSubscript:", v58);
      v71 = (id)objc_claimAutoreleasedReturnValue();
    }
    v72 = v71;
    objc_msgSend(v45, "addObject:", v70);
    objc_msgSend(v86, "addObject:", v72);

    v47 = v58;
  }
  while (v46 | v58);
  ReverseArray(v45);
  v73 = v86;
  ReverseArray(v86);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)&v84[8 * v83 * v82 + 8 * v17]);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, id, char *))v77 + 2))(v77, v74, v45, v73);

LABEL_61:
  v14 = v77;
LABEL_12:

}

- (void)editAlignmentWithRefText:(id)a3 hypText:(id)a4 placeholderSymbol:(id)a5 caseInsensitive:(BOOL)a6 removeWordSense:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _EARNLTokenizer *v20;

  v8 = a7;
  v9 = a6;
  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v20 = objc_alloc_init(_EARNLTokenizer);
  -[_EARNLTokenizer setToLowerCase:](v20, "setToLowerCase:", 0);
  -[_EARNLTokenizer setReplacePunctuation:](v20, "setReplacePunctuation:", 0);
  -[_EARNLTokenizer tokenize:](v20, "tokenize:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[_EARNLTokenizer tokenize:](v20, "tokenize:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[_EAREditDistance editAlignmentWithRefTokens:hypTokens:placeholderSymbol:caseInsensitive:removeWordSense:completion:](self, "editAlignmentWithRefTokens:hypTokens:placeholderSymbol:caseInsensitive:removeWordSense:completion:", v18, v19, v15, v9, v8, v14);
}

@end

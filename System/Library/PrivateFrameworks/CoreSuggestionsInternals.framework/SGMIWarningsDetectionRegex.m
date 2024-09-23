@implementation SGMIWarningsDetectionRegex

- (SGMIWarningsDetectionRegex)initWithPattern:(id)a3 compiledRegexCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SGMIWarningsDetectionRegex *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(CFSTR("SGMIWarningsDetectionRegex-"), "stringByAppendingString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v12 = -[SGMIWarningsDetectionRegex initWithPattern:](self, "initWithPattern:", v6);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v9);
    self = v12;
  }

  return v12;
}

- (SGMIWarningsDetectionRegex)initWithPattern:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  SGMIWarningsDetectionRegex *v16;
  id v17;
  uint64_t v18;
  NSNumber *privateGroupsCount;
  SGMIWarningsDetectionRegex *v20;
  NSObject *v21;
  objc_super v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v38 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("(?:(?:(?<!\\\\)\\.)|\\\\w)(?:[*\\+\\?]|\\{\\d*\\,\\d*\\})?|(?:\\[[^\\]]+\\](?:[*\\+\\?]|\\{\\d*\\,\\d*\\}))"), 0, &v38);
  v7 = v38;
  v8 = (void *)objc_opt_new();
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v9 = (void *)MEMORY[0x1C3BD4F6C]();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __46__SGMIWarningsDetectionRegex_initWithPattern___block_invoke;
  v25[3] = &unk_1E7DB4F08;
  v28 = &v34;
  v10 = v8;
  v26 = v10;
  v11 = v4;
  v27 = v11;
  v29 = &v30;
  objc_msgSend(v6, "enumerateMatchesInString:options:range:usingBlock:", v11, 0, 0, v5, v25);
  v12 = v35[3];
  v13 = v5 - v12;
  if (v5 > v12)
  {
    objc_msgSend(v11, "substringWithRange:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

  }
  objc_msgSend(v10, "_pas_componentsJoinedByString:", &stru_1E7DB83A8, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  v23.receiver = self;
  v23.super_class = (Class)SGMIWarningsDetectionRegex;
  v24 = v7;
  v16 = -[SGMIWarningsDetectionRegex initWithPattern:options:error:](&v23, sel_initWithPattern_options_error_, v15, 1, &v24);
  v17 = v24;

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31[3]);
    v18 = objc_claimAutoreleasedReturnValue();
    privateGroupsCount = v16->_privateGroupsCount;
    v16->_privateGroupsCount = (NSNumber *)v18;

    v20 = v16;
  }
  else
  {
    sgMailIntelligenceLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v40 = v15;
      v41 = 2112;
      v42 = v17;
      _os_log_fault_impl(&dword_1C3607000, v21, OS_LOG_TYPE_FAULT, "SGMIWarningsDetectionRegex: Invalid pattern %@ : %@.", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v16;
}

- (id)matchForString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SGMIWarningsDetectionRegex matchForString:withinRange:](self, "matchForString:withinRange:", v4, 0, objc_msgSend(v4, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)matchForString:(id)a3 withinRange:(_NSRange)a4
{
  void *v4;
  void *v5;

  -[SGMIWarningsDetectionRegex matchesForString:withinRange:onlyFirstMatch:](self, "matchesForString:withinRange:onlyFirstMatch:", a3, a4.location, a4.length, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)matchesForString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SGMIWarningsDetectionRegex matchesForString:withinRange:onlyFirstMatch:](self, "matchesForString:withinRange:onlyFirstMatch:", v4, 0, objc_msgSend(v4, "length"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)matchesForString:(id)a3 withinRange:(_NSRange)a4 onlyFirstMatch:(BOOL)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__SGMIWarningsDetectionRegex_matchesForString_withinRange_onlyFirstMatch___block_invoke;
  v18[3] = &unk_1E7DB4F58;
  v18[4] = self;
  v19 = v9;
  v20 = v11;
  v12 = v10;
  v21 = v12;
  v22 = a5;
  v13 = v11;
  v14 = v9;
  -[SGMIWarningsDetectionRegex enumerateMatchesInString:options:range:usingBlock:](self, "enumerateMatchesInString:options:range:usingBlock:", v14, 0, location, length, v18);
  v15 = v21;
  v16 = v12;

  return v16;
}

- (id)description
{
  id v3;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGMIWarningsDetectionRegex with %@ private groups>\nPattern:'%@'\n"), self->_privateGroupsCount, *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CB3BB0]));
}

- (NSNumber)privateGroupsCount
{
  return self->_privateGroupsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateGroupsCount, 0);
}

void __74__SGMIWarningsDetectionRegex_matchesForString_withinRange_onlyFirstMatch___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  SGMIWarningsDetectionRegexMatch *v44;
  uint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  _BYTE *v60;
  _QWORD *v61;
  _QWORD v62[3];
  char v63;
  _BYTE buf[24];
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v51 = (void *)objc_opt_new();
  v52 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  if (!v6 || (unint64_t)objc_msgSend(v6, "numberOfRanges") < 2)
    goto LABEL_27;
  v46 = a4;
  v49 = v7;
  v8 = objc_msgSend(v6, "range");
  v47 = v9;
  v48 = v8;
  v10 = (void *)objc_opt_new();
  v53 = a1;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "unsignedIntValue"))
  {
    v11 = 0;
    do
    {
      v12 = (void *)MEMORY[0x1E0CB3B18];
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("G%tu"), v11);
      v14 = objc_msgSend(v6, "rangeWithName:", v13);
      objc_msgSend(v12, "valueWithRange:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v16);

      ++v11;
    }
    while (v11 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "unsignedIntValue"));
  }
  v17 = objc_msgSend(v6, "rangeWithName:", CFSTR("core"));
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v23 = v17;
    v25 = v18;
    v21 = v53;
    goto LABEL_13;
  }
  v19 = objc_msgSend(v6, "rangeWithName:", CFSTR("coreAlternative"));
  v21 = a1;
  if (v19 != 0x7FFFFFFFFFFFFFFFLL
    || (v19 = objc_msgSend(v6, "rangeWithName:", CFSTR("coreAlternative2")),
        v22 = 0x7FFFFFFFFFFFFFFFLL,
        v19 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v23 = v19;
    v25 = v20;
    goto LABEL_13;
  }
  v23 = objc_msgSend(v6, "rangeWithName:", CFSTR("coreAlternative3"));
  v25 = v24;
  if (v23 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_13:
    objc_msgSend(*(id *)(v21 + 40), "substringWithRange:", v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(v53 + 48), "containsObject:", v26) & 1) != 0)
    {

LABEL_26:
      v7 = v49;
      goto LABEL_27;
    }
    objc_msgSend(*(id *)(v53 + 48), "addObject:", v26);

    v22 = v23;
  }
  v45 = v22;
  v27 = (void *)objc_opt_new();
  v50 = (void *)objc_opt_new();
  if (objc_msgSend(v6, "numberOfRanges"))
  {
    v28 = 0;
    do
    {
      v29 = objc_msgSend(v6, "rangeAtIndex:", v28);
      if (v29 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v31 = v29;
        v32 = v30;
        objc_msgSend(v27, "addIndex:", v29);
        objc_msgSend(v27, "addIndex:", v31 + v32);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v10, "containsObject:", v33);

        if (v34)
          objc_msgSend(v50, "addIndexesInRange:", v31, v32);
      }
      ++v28;
    }
    while (v28 < objc_msgSend(v6, "numberOfRanges"));
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v65 = v48;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  v63 = 0;
  objc_msgSend(v27, "removeIndex:");
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __74__SGMIWarningsDetectionRegex_matchesForString_withinRange_onlyFirstMatch___block_invoke_2;
  v54[3] = &unk_1E7DB4F30;
  v60 = buf;
  v55 = *(id *)(v53 + 40);
  v35 = v50;
  v56 = v35;
  v61 = v62;
  v36 = v51;
  v57 = v36;
  v37 = v52;
  v58 = v37;
  v38 = v49;
  v59 = v38;
  objc_msgSend(v27, "enumerateIndexesUsingBlock:", v54);

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(buf, 8);

  v7 = v49;
  if (v48 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v37, "_pas_componentsJoinedByString:", CFSTR(" "));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_pas_componentsJoinedByString:", &stru_1E7DB83A8);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    sgMailIntelligenceLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v53 + 40), "substringWithRange:", v48, v47);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138740483;
      *(_QWORD *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v40;
      *(_WORD *)&buf[22] = 2117;
      v65 = (uint64_t)v39;
      _os_log_impl(&dword_1C3607000, v41, OS_LOG_TYPE_DEFAULT, "SGMIWarningsDetectionRegexMatch (%{sensitive}@) with signature: %@ (%{sensitive}@)", buf, 0x20u);

    }
    v43 = *(void **)(v53 + 56);
    v44 = -[SGMIWarningsDetectionRegexMatch initWithRange:coreRange:signature:wildcardsMatches:]([SGMIWarningsDetectionRegexMatch alloc], "initWithRange:coreRange:signature:wildcardsMatches:", v48, v47, v45, v25, v40, v38);
    objc_msgSend(v43, "addObject:", v44);

    *v46 = *(_BYTE *)(v53 + 64);
    goto LABEL_26;
  }
LABEL_27:

}

void __74__SGMIWarningsDetectionRegex_matchesForString_withinRange_onlyFirstMatch___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v5 = a2 - v4;
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v4, a2 - v4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "intersectsIndexesInRange:", v4, v5))
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", CFSTR("ff"));
      objc_msgSend(*(id *)(a1 + 56), "addObject:", CFSTR("[PRIVATE]>(ff)"));
    }
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v13);
    v6 = 1;
  }
  else
  {
    v7 = *(void **)(a1 + 48);
    +[SGMIWarningsDetectionRegex hashedValueOfString:](SGMIWarningsDetectionRegex, "hashedValueOfString:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    v9 = *(void **)(a1 + 56);
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 48), "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("[%@]>(%@)"), v13, v11);
    objc_msgSend(v9, "addObject:", v12);

    v6 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a2;

}

void __46__SGMIWarningsDetectionRegex_initWithPattern___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = a2;
  if (v3)
  {
    v15 = v3;
    v5 = objc_msgSend(v3, "rangeAtIndex:", 0);
    v3 = v15;
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v4;
      if (v5 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        v7 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "substringWithRange:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

      }
      objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v5, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 32);
      v11 = objc_alloc(MEMORY[0x1E0CB3940]);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v13 = *(_QWORD *)(v12 + 24);
      *(_QWORD *)(v12 + 24) = v13 + 1;
      v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("(?<G%tu>%@)"), v13, v9);
      objc_msgSend(v10, "addObject:", v14);

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5 + v6;
      v3 = v15;
    }
  }

}

+ (id)hashedValueOfString:(id)a3
{
  const char *v3;
  CC_LONG v4;
  id v5;
  unsigned __int8 v6;
  unsigned __int8 md[16];
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  *(_OWORD *)md = 0u;
  v9 = 0u;
  v4 = strlen(v3);
  CC_SHA256(v3, v4, md);
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v6 = md[0];
  if (md[0] == 0xFF)
    v6 = 0;
  return (id)objc_msgSend(v5, "initWithFormat:", CFSTR("%02x"), v6);
}

@end

@implementation SGMailQuoteParser

+ (id)_tofuRegions:(id)a3 utf8:(const char *)a4 isAOSPMail:(BOOL)a5
{
  _BOOL4 v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v26;
  id v27;
  id v28;
  _QWORD v29[8];
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t);
  void *v49;
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;

  v5 = a5;
  v6 = a3;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = MEMORY[0x1E0C809B0];
  v46 = MEMORY[0x1E0C809B0];
  v47 = 3221225472;
  v48 = __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke;
  v49 = &unk_1E7DB78A0;
  v50 = v6;
  v51 = &v52;
  _PASMemoryHeavyOperation();
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__20086;
  v44 = __Block_byref_object_dispose__20087;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__20086;
  v38 = __Block_byref_object_dispose__20087;
  v39 = 0;
  v29[4] = v7;
  v29[5] = 3221225472;
  v29[6] = __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_12;
  v29[7] = &unk_1E7DAF3D8;
  v8 = v50;
  v30 = v8;
  v31 = &v52;
  v32 = &v40;
  v33 = &v34;
  _PASMemoryHeavyOperation();
  v9 = (void *)v41[5];
  if (v9 && v35[5])
  {
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    v11 = objc_msgSend((id)v35[5], "unsignedIntegerValue");
    v12 = v10 >= v11 ? v11 : v10;
    if (v12 < v53[3])
      v53[3] = v12;
  }
  if (v5)
  {
    patterns_20088();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "regex2ForKey:", CFSTR("SXReply"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0;
    v27 = v14;
    v28 = v8;
    _PASEnumerateSimpleLinesInString();

    _Block_object_dispose(v29, 8);
  }
  v15 = objc_msgSend(v8, "length");
  v16 = objc_msgSend(v8, "length");
  v17 = 4000;
  if (v16 < 0xFA0)
    v17 = v16;
  v18 = v15 - v17;
  v19 = v53[3];
  if (v18 < v19)
  {
    v26 = v8;
    _PASMemoryHeavyOperation();

    v19 = v53[3];
  }
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = objc_opt_new();
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x1E0CB36B8]);
    v22 = v53[3];
    v23 = objc_msgSend(v8, "length");
    v20 = objc_msgSend(v21, "initWithIndexesInRange:", v22, v23 - v53[3]);
  }
  v24 = (void *)v20;

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v52, 8);
  return v24;
}

+ (id)_xWrote:(id)a3 utf8:(const char *)a4
{
  id v4;
  id v5;
  id v7;
  id v8;

  v7 = a3;
  v8 = (id)objc_opt_new();
  v4 = v7;
  _PASMemoryHeavyOperation();
  v5 = v8;

  return v5;
}

+ (id)quotedRegionsFrom:(id)a3 isAOSPMail:(BOOL)a4 foundToEndOfMessage:(BOOL *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v8 = a3;
  v9 = (void *)MEMORY[0x1C3BD4F6C]();
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "UTF8String");
  v12 = (void *)objc_opt_new();
  objc_msgSend(a1, "_tofuRegions:utf8:isAOSPMail:", v10, v11, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addIndexes:", v13);
  if (a5)
    *a5 = objc_msgSend(v13, "count") != 0;
  objc_msgSend(a1, "_xWrote:utf8:", v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addIndexes:", v14);

  objc_autoreleasePoolPop(v9);
  return v12;
}

void __34__SGMailQuoteParser__xWrote_utf8___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  +[SGMailPatterns replyAttributionPattern](SGMailPatterns, "replyAttributionPattern");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SGMailQuoteParser__xWrote_utf8___block_invoke_2;
  v5[3] = &unk_1E7DAF450;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateMatchesInUtf8:fromString:ngroups:block:", v4, v3, 0, v5);

}

uint64_t __34__SGMailQuoteParser__xWrote_utf8___block_invoke_2(uint64_t a1, unint64_t *a2)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = *a2;
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(*(id *)(a1 + 40), "length");
  if (v2 <= v4)
    v5 = v4;
  else
    v5 = v2;
  if (v2 >= v4)
    v6 = v4;
  else
    v6 = v2;
  objc_msgSend(v3, "addIndexesInRange:", v6, v5 - v6);
  return 0;
}

void __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  patterns_20088();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regex2ForKey:", CFSTR("OriginalMessage/F"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(id *)(a1 + 32);
  v4 = v3;
  _PASEnumerateSimpleLinesInString();

}

void __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_12(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  __int128 v9;
  uint64_t v10;

  patterns_20088();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regex2ForKey:", CFSTR("BodyHeaders/F"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_2_13;
  v6[3] = &unk_1E7DAF3B0;
  v7 = v4;
  v8 = v3;
  v9 = *(_OWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 56);
  v5 = v3;
  SGEnumerateBodyHeaderCandidates(v7, v6);

}

BOOL __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_4(uint64_t a1, unint64_t a2, unint64_t a3)
{
  _BOOL8 v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a2 + a3 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (a3 <= 1)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    return v4;
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (a3 > 0x65 || a3 - 1 < 0xA || *(_QWORD *)(v5 + 24) < 2uLL)
  {
LABEL_10:
    *(_QWORD *)(v5 + 24) = 0;
    return v4;
  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "matchesString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    goto LABEL_10;
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = 0;
  if (a2 < *(_QWORD *)(v10 + 24))
    *(_QWORD *)(v10 + 24) = a2;
  return v4;
}

void __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[6];

  objc_msgSend(*(id *)(a1 + 32), "substringFromIndex:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  patterns_20088();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "regex2ForKey:", CFSTR("CorporateFooter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_6;
  v6[3] = &unk_1E7DAF428;
  v5 = *(_QWORD *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v6[5] = v5;
  objc_msgSend(v4, "enumerateMatchesInString:ngroups:block:", v2, 0, v6);

}

uint64_t __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_6(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2 + *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v2 < *(_QWORD *)(v3 + 24))
    *(_QWORD *)(v3 + 24) = v2;
  return 0;
}

uint64_t __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_2_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[9];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  BOOL v16;

  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v8 = *(void **)(a1 + 40);
  v16 = (unint64_t)(a2 + a3) < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_3_14;
  v12[3] = &unk_1E7DAF388;
  v12[7] = a2;
  v12[8] = a3;
  v9 = *(_QWORD *)(a1 + 64);
  v12[4] = *(_QWORD *)(a1 + 56);
  v12[5] = &v13;
  v12[6] = v9;
  objc_msgSend(v8, "enumerateMatchesInString:ngroups:block:", v7, 0, v12);
  v10 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  objc_autoreleasePoolPop(v6);
  return v10;
}

uint64_t __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_3_14(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (!*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[7] + *a2);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[4] + 8);
    v6 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
    v4 = 1;
    goto LABEL_5;
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[7] + *a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = 0;
    v5 = *(_QWORD *)(a1[6] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v3;
LABEL_5:

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
  }
  return 0;
}

uint64_t __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v14 = (unint64_t)(a2 + a3) < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_3;
  v10[3] = &unk_1E7DAF338;
  v10[6] = a2;
  v10[7] = a3;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 48);
  v10[5] = &v11;
  objc_msgSend(v7, "enumerateMatchesInString:ngroups:block:", v6, 0, v10);
  v8 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __50__SGMailQuoteParser__tofuRegions_utf8_isAOSPMail___block_invoke_3(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2 + a1[6];
  v3 = *(_QWORD *)(a1[4] + 8);
  if (v2 < *(_QWORD *)(v3 + 24))
    *(_QWORD *)(v3 + 24) = v2;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  return 0;
}

@end

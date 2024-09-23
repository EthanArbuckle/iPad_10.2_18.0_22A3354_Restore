@implementation NSRegularExpression(EmailFoundationAdditions)

- (void)ef_enumerateTokensInString:()EmailFoundationAdditions options:usingBlock:
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v8, "length");
  v22 = 0;
  v23 = &v22;
  v24 = 0x3010000000;
  v25 = &unk_1B10E80F5;
  v26 = 0;
  v27 = v10;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __95__NSRegularExpression_EmailFoundationAdditions__ef_enumerateTokensInString_options_usingBlock___block_invoke;
  v17 = &unk_1E62A6790;
  v20 = &v22;
  v11 = v9;
  v19 = v11;
  v12 = v8;
  v18 = v12;
  v21 = v10;
  objc_msgSend(a1, "enumerateMatchesInString:options:range:usingBlock:", v12, a4, v26, v27, &v14);
  if (v23[5])
  {
    objc_msgSend(v12, "substringWithRange:", v23[4], v14, v15, v16, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, uint64_t, uint64_t))v11 + 2))(v11, v13, 0, v23[4], v23[5]);

  }
  _Block_object_dispose(&v22, 8);

}

- (id)ef_stringByRemovingTokensFromString:()EmailFoundationAdditions matchingOptions:tokenizationOptions:tokenizationHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  char v22;

  v10 = a3;
  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __141__NSRegularExpression_EmailFoundationAdditions__ef_stringByRemovingTokensFromString_matchingOptions_tokenizationOptions_tokenizationHandler___block_invoke;
  v19[3] = &unk_1E62A67B8;
  v22 = a5 & 1;
  v13 = v11;
  v21 = v13;
  v14 = v12;
  v20 = v14;
  objc_msgSend(a1, "ef_enumerateTokensInString:options:usingBlock:", v10, a4, v19);
  v15 = v14;
  v16 = v15;
  if ((a5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)ef_stringByRemovingTokensFromString:()EmailFoundationAdditions tokenizationHandler:
{
  objc_msgSend(a1, "ef_stringByRemovingTokensFromString:matchingOptions:tokenizationOptions:tokenizationHandler:", a3, 0, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ef_regularExpressionForQuotedStringsInLocales:()EmailFoundationAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99DC8], "ef_quotePairsForLocales:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_map:", &__block_literal_global_20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("|"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v6, 0, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFNSRegularExpressionAdditions.m"), 96, CFSTR("Failed to create regular expression. Error:"), v8);

  }
  return v7;
}

@end

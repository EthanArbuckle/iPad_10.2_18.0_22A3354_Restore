@implementation NSString(Regex)

- (id)calc_stringByReplacingOccurrencesOfRegex:()Regex usingBlockWithResult:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  _QWORD aBlock[4];
  id v24;
  uint64_t *v25;
  _QWORD *v26;
  _QWORD v27[4];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = objc_msgSend(v8, "length");
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v10 = MEMORY[0x1E0C809B0];
  v27[3] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__NSString_Regex__calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult___block_invoke;
  aBlock[3] = &unk_1E6E9FA08;
  v25 = &v28;
  v11 = v8;
  v24 = v11;
  v26 = v27;
  v12 = _Block_copy(aBlock);
  if (calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__onceToken != -1)
    dispatch_once(&calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__onceToken, &__block_literal_global_71);
  objc_msgSend((id)calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__lock, "lock");
  objc_msgSend((id)calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__regexes, "objectForKeyedSubscript:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v6, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__regexes, "setObject:forKeyedSubscript:", v13, v6);
  }
  objc_msgSend((id)calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__lock, "unlock");
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __81__NSString_Regex__calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult___block_invoke_3;
  v19[3] = &unk_1E6E9FA50;
  v14 = v12;
  v20 = v14;
  v22 = &v28;
  v15 = v7;
  v21 = v15;
  objc_msgSend(v13, "enumerateMatchesInString:options:range:usingBlock:", v11, 0, 0, v9, v19);
  v16 = v11;
  if (v29[5])
  {
    (*((void (**)(id, uint64_t, _QWORD))v14 + 2))(v14, v9, 0);
    v16 = (void *)v29[5];
  }
  v17 = v16;

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v28, 8);

  return v17;
}

- (id)calc_stringByReplacingOccurrencesOfRegex:()Regex usingBlock:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__NSString_Regex__calc_stringByReplacingOccurrencesOfRegex_usingBlock___block_invoke;
  v10[3] = &unk_1E6E9FE48;
  v10[4] = a1;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a1, "calc_stringByReplacingOccurrencesOfRegex:usingBlockWithResult:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end

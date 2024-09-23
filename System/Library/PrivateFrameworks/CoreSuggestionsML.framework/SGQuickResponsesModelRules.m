@implementation SGQuickResponsesModelRules

+ (id)rules
{
  return +[SGModelAsset rules](SGModelAsset, "rules");
}

+ (BOOL)areModelsAvailableInLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  __CFString *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(a1, "rules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SGQuickResponses"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__SGQuickResponsesModelRules_areModelsAvailableInLanguage___block_invoke;
  v9[3] = &unk_24DDC4650;
  v10 = CFSTR("SGQRTextMessage");
  v11 = &v12;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);
  LOBYTE(v5) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v5;
}

void __59__SGQuickResponsesModelRules_areModelsAvailableInLanguage___block_invoke(uint64_t a1, void *a2, void *a3, BOOL *a4)
{
  id v7;
  void *v8;
  BOOL v9;
  id v10;

  v10 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("+[SGQuickResponsesModelRules areModelsAvailableInLanguage:]_block_invoke", "SGQuickResponsesModel.m", 448, "[objectives isKindOfClass:[NSDictionary class]]");
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
  *a4 = v9;

}

@end

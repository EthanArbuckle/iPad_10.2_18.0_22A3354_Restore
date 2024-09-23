@implementation ATXScoreInterpreterFromAssetBuilder

+ (id)assetFilenameForSubType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF8CD0], "sharedInstanceWithMobileAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getAssetFileAndSubscoreForConsumerSubType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)interpreterFromAssetFilename:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _ATXScoreInterpreter *v11;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0CF8CF8]);
  objc_msgSend(MEMORY[0x1E0CF8C10], "abGroupOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithAssetsForResource:ofType:specifiedABGroup:", v5, CFSTR("plplist"), v7);

  objc_msgSend(v8, "abGroupContents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXScoreInterpreterFromAssetBuilder.m"), 35, CFSTR("Nil asset contents (missing prediction model file?): '%@'"), v5);

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Scorer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXScoreInterpreterFromAssetBuilder.m"), 37, CFSTR("Could not retrieve _ATXAppPredictor information from asset dictionary in '%@'"), v5);

  }
  v11 = -[_ATXScoreInterpreter initWithParseRoot:]([_ATXScoreInterpreter alloc], "initWithParseRoot:", v10);

  return v11;
}

+ (id)scoreInterpreterForConsumerSubType:(unsigned __int8)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "assetFilenameForSubType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "interpreterFromAssetFilename:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)scoreInterpretersForAllSubTypes
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CF9508];
  v5 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __70__ATXScoreInterpreterFromAssetBuilder_scoreInterpretersForAllSubTypes__block_invoke;
  v25[3] = &unk_1E82E9C80;
  v6 = v3;
  v26 = v6;
  v27 = a1;
  objc_msgSend(v4, "iterConsumerSubTypesWithBlock:", v25);
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v6, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __70__ATXScoreInterpreterFromAssetBuilder_scoreInterpretersForAllSubTypes__block_invoke_2;
  v22[3] = &unk_1E82E9CA8;
  v10 = (id)objc_opt_new();
  v23 = v10;
  v24 = a1;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v22);
  v11 = (void *)objc_opt_new();
  v12 = (void *)MEMORY[0x1E0CF9508];
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __70__ATXScoreInterpreterFromAssetBuilder_scoreInterpretersForAllSubTypes__block_invoke_3;
  v18[3] = &unk_1E82E9CD0;
  v19 = v6;
  v20 = v10;
  v21 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v6;
  objc_msgSend(v12, "iterConsumerSubTypesWithBlock:", v18);
  v16 = (void *)objc_msgSend(v13, "copy");

  return v16;
}

void __70__ATXScoreInterpreterFromAssetBuilder_scoreInterpretersForAllSubTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 40), "assetFilenameForSubType:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

void __70__ATXScoreInterpreterFromAssetBuilder_scoreInterpretersForAllSubTypes__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "interpreterFromAssetFilename:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);

}

void __70__ATXScoreInterpreterFromAssetBuilder_scoreInterpretersForAllSubTypes__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);

}

@end

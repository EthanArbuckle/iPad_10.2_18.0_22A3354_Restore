@implementation ATXCurrentABGroupDetails

- (ATXCurrentABGroupDetails)init
{
  void *v3;
  ATXCurrentABGroupDetails *v4;

  objc_msgSend(MEMORY[0x1E0CF8CD0], "sharedInstanceWithMobileAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXCurrentABGroupDetails initWithAssetMapping:](self, "initWithAssetMapping:", v3);

  return v4;
}

- (ATXCurrentABGroupDetails)initWithAssetMapping:(id)a3
{
  id v4;
  ATXCurrentABGroupDetails *v5;
  uint64_t v6;
  NSMutableDictionary *subTypeToABGroup;
  uint64_t v8;
  NSMutableDictionary *subTypeToFinalSubscore;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXCurrentABGroupDetails;
  v5 = -[ATXCurrentABGroupDetails init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    subTypeToABGroup = v5->_subTypeToABGroup;
    v5->_subTypeToABGroup = (NSMutableDictionary *)v6;

    v8 = objc_opt_new();
    subTypeToFinalSubscore = v5->_subTypeToFinalSubscore;
    v5->_subTypeToFinalSubscore = (NSMutableDictionary *)v8;

    -[ATXCurrentABGroupDetails loadAssetFromAssetMapping:](v5, "loadAssetFromAssetMapping:", v4);
  }

  return v5;
}

- (void)loadAssetFromAssetMapping:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  ATXCurrentABGroupDetails *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0CF9508];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__ATXCurrentABGroupDetails_loadAssetFromAssetMapping___block_invoke;
  v9[3] = &unk_1E82E9CD0;
  v10 = v4;
  v11 = self;
  v12 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "iterConsumerSubTypesWithBlock:", v9);

}

void __54__ATXCurrentABGroupDetails_loadAssetFromAssetMapping___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "getAssetFileAndSubscoreForConsumerSubType:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v8, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFinalSubscore:subType:", v5, a2);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v8, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setABGroupFromFilename:subType:filenameToABGroup:", v7, a2, *(_QWORD *)(a1 + 48));

}

- (void)setFinalSubscore:(id)a3 subType:(unsigned __int8)a4
{
  uint64_t v4;
  __CFString *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = (__CFString *)a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXCurrentABGroupDetails setFinalSubscore:subType:].cold.1((uint64_t)v7, v8);

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("'subscore' value not specified for consumerSubType of '%@'"), v7);
    v6 = CFSTR("TotalScore");
  }
  -[ATXCurrentABGroupDetails subTypeToFinalSubscore](self, "subTypeToFinalSubscore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v10);

}

- (void)setABGroupFromFilename:(id)a3 subType:(unsigned __int8)a4 filenameToABGroup:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v6 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[ATXCurrentABGroupDetails abGroupIdentifierForFilename:](self, "abGroupIdentifierForFilename:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v8);

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCurrentABGroupDetails subTypeToABGroup](self, "subTypeToABGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

  __atxlog_handle_default();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v16;
    v20 = 2112;
    v21 = v17;
    _os_log_debug_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEBUG, "_ATXAppPredictor ABGroup set to %@ for consumerSubType of '%@'", (uint8_t *)&v18, 0x16u);

  }
}

- (id)abGroupIdentifierForFilename:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CF8CF8]);
  objc_msgSend(MEMORY[0x1E0CF8C10], "abGroupOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAssetsForResource:ofType:specifiedABGroup:", v3, CFSTR("plplist"), v5);

  if (!v6)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXCurrentABGroupDetails abGroupIdentifierForFilename:].cold.1((uint64_t)v3, v7);

  }
  objc_msgSend(v6, "groupIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF8C10], "abGroupNilString");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)abGroupIdentifierForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  -[ATXCurrentABGroupDetails subTypeToABGroup](self, "subTypeToABGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)finalSubScoreForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  -[ATXCurrentABGroupDetails subTypeToFinalSubscore](self, "subTypeToFinalSubscore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)subTypeToABGroup
{
  return self->_subTypeToABGroup;
}

- (NSMutableDictionary)subTypeToFinalSubscore
{
  return self->_subTypeToFinalSubscore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTypeToFinalSubscore, 0);
  objc_storeStrong((id *)&self->_subTypeToABGroup, 0);
}

- (void)setFinalSubscore:(uint64_t)a1 subType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "'subscore' value not specified for consumerSubType of '%@'", (uint8_t *)&v2, 0xCu);
}

- (void)abGroupIdentifierForFilename:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Couldn't find file %@", (uint8_t *)&v2, 0xCu);
}

@end

@implementation DESRecipeEvaluationSession

- (id)_initWithDodMLTask:(id)a3
{
  id v4;
  DESRecipeEvaluationSession *v5;
  uint64_t v6;
  DESRecipe *recipe;
  uint64_t v8;
  DESRecordSet *matchingRecordSet;
  void *v10;
  uint64_t v11;
  NSURL *baseURL;
  void *v13;
  uint64_t v14;
  NSString *localeIdentifier;
  void *v16;
  uint64_t v17;
  NSString *testingRecipePath;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *testingRecipeAttachments;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DESRecipeEvaluationSession;
  v5 = -[DESRecipeEvaluationSession init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "recipe");
    v6 = objc_claimAutoreleasedReturnValue();
    recipe = v5->_recipe;
    v5->_recipe = (DESRecipe *)v6;

    objc_msgSend(v4, "matchingRecordSet");
    v8 = objc_claimAutoreleasedReturnValue();
    matchingRecordSet = v5->_matchingRecordSet;
    v5->_matchingRecordSet = (DESRecordSet *)v8;

    objc_msgSend(v4, "baseURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v11;

    objc_msgSend(v4, "localeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v14;

    objc_msgSend(v4, "testingRecipePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    testingRecipePath = v5->_testingRecipePath;
    v5->_testingRecipePath = (NSString *)v17;

    objc_msgSend(v4, "recipe");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "attachments");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    testingRecipeAttachments = v5->_testingRecipeAttachments;
    v5->_testingRecipeAttachments = (NSArray *)v21;

  }
  return v5;
}

- (DESRecipeEvaluationSession)initWithResumptionURL:(id)a3 error:(id *)a4
{
  return (DESRecipeEvaluationSession *)-[DESRecipeEvaluationSession _initWithResumptionURL:recordSet:protocolClass:error:](self, "_initWithResumptionURL:recordSet:protocolClass:error:", a3, 0, 0, a4);
}

- (id)_initWithResumptionURL:(id)a3 recordSet:(id)a4 protocolClass:(Class)a5 error:(id *)a6
{
  DESLogAndSetSunsetError(a6);

  return 0;
}

- (void)downloadAttachmentsWithConfiguration:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  DESLogAndReturnSunsetError();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);

}

- (void)completeWithJSONResult:(id)a3 binaryResult:(id)a4 completionHandler:(id)a5
{
  id v5;
  void *v6;
  id v7;

  v7 = a5;
  v5 = DESLogAndReturnSunsetError();
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)completeWithError:(id)a3 completionHandler:(id)a4
{
  id v4;
  void *v5;
  id v6;

  v6 = a4;
  v4 = DESLogAndReturnSunsetError();
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

- (id)deferWithDeadline:(id)a3 error:(id *)a4
{
  DESLogAndSetSunsetError(a4);
  return 0;
}

- (id)deferralURL
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSURL *baseURL;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSArray *testingRecipeAttachments;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("dodml://evaluation_session/resume?"));
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)MEMORY[0x1E0CB39D8];
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%.0f"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryItemWithName:value:", CFSTR("deferralDate"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB39D8];
  v12 = (void *)MEMORY[0x1E0CB3940];
  -[NSDate timeIntervalSinceReferenceDate](self->_deadline, "timeIntervalSinceReferenceDate");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%.0f"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queryItemWithName:value:", CFSTR("deadline"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v15);

  v16 = (void *)MEMORY[0x1E0CB39D8];
  -[DESRecipe recipeID](self->_recipe, "recipeID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "queryItemWithName:value:", CFSTR("recipeId"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v18);

  v19 = (void *)MEMORY[0x1E0CB39D8];
  -[DESRecipe bundleIdentifier](self->_recipe, "bundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "queryItemWithName:value:", CFSTR("recipeType"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v21);

  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("localeIdentifier"), self->_localeIdentifier);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v22);

  baseURL = self->_baseURL;
  if (baseURL)
  {
    v24 = (void *)MEMORY[0x1E0CB39D8];
    -[NSURL absoluteString](baseURL, "absoluteString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByAddingPercentEncodingWithAllowedCharacters:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "queryItemWithName:value:", CFSTR("baseURL"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v28);

  }
  if (self->_testingRecipePath)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("recipePath"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v29);

  }
  testingRecipeAttachments = self->_testingRecipeAttachments;
  v31 = MEMORY[0x1E0C809B0];
  if (testingRecipeAttachments)
  {
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __41__DESRecipeEvaluationSession_deferralURL__block_invoke;
    v39[3] = &unk_1E706EAE8;
    v40 = v4;
    -[NSArray enumerateObjectsUsingBlock:](testingRecipeAttachments, "enumerateObjectsUsingBlock:", v39);

  }
  -[DESRecordSet nativeRecords](self->_matchingRecordSet, "nativeRecords");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v31;
  v37[1] = 3221225472;
  v37[2] = __41__DESRecipeEvaluationSession_deferralURL__block_invoke_2;
  v37[3] = &unk_1E706EB10;
  v38 = v4;
  v33 = v4;
  objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v37);

  v34 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v34, "setScheme:", CFSTR("dodml"));
  objc_msgSend(v34, "setHost:", CFSTR("evaluation_session"));
  objc_msgSend(v34, "setPath:", CFSTR("/resume"));
  objc_msgSend(v34, "setQueryItems:", v33);
  objc_msgSend(v34, "URL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

void __41__DESRecipeEvaluationSession_deferralURL__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3 + 1;
  v6 = a2;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%lu"), CFSTR("attachment"), v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFileURL");
  v8 = *(void **)(a1 + 32);
  v9 = (void *)MEMORY[0x1E0CB39D8];
  if (v7)
    objc_msgSend(v6, "path");
  else
    objc_msgSend(v6, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "queryItemWithName:value:", v12, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v11);

}

void __41__DESRecipeEvaluationSession_deferralURL__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v18 = a1;
    v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      v12 = 1;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
          if ((v12 & 1) == 0)
            objc_msgSend(v7, "appendString:", CFSTR("+"));
          objc_msgSend(v14, "UUIDString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendString:", v15);

          v12 = 0;
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v12 = 0;
      }
      while (v10);
    }

    v16 = *(void **)(v18 + 32);
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", v5, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

  }
}

- (BOOL)taskIsDeferred
{
  return self->_requestedToStop;
}

- (DESRecipe)recipe
{
  return self->_recipe;
}

- (DESRecordSet)matchingRecordSet
{
  return self->_matchingRecordSet;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (BOOL)requestedToStop
{
  return self->_requestedToStop;
}

- (void)setRequestedToStop:(BOOL)a3
{
  self->_requestedToStop = a3;
}

- (int64_t)evaluationResult
{
  return self->_evaluationResult;
}

- (NSDictionary)JSONResult
{
  return self->_JSONResult;
}

- (NSData)binaryResult
{
  return self->_binaryResult;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)testingRecipePath
{
  return self->_testingRecipePath;
}

- (void)setTestingRecipePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)testingRecipeAttachments
{
  return self->_testingRecipeAttachments;
}

- (void)setTestingRecipeAttachments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)testingCompletionHandler
{
  return self->_testingCompletionHandler;
}

- (void)setTestingCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_testingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_testingRecipeAttachments, 0);
  objc_storeStrong((id *)&self->_testingRecipePath, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_binaryResult, 0);
  objc_storeStrong((id *)&self->_JSONResult, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_matchingRecordSet, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_deferralDate, 0);
  objc_storeStrong((id *)&self->_deadline, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end

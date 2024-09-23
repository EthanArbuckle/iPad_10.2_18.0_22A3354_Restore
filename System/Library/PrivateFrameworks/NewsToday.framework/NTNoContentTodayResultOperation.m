@implementation NTNoContentTodayResultOperation

- (BOOL)validateOperation
{
  void *v2;

  -[NTTodayResultOperation headlineResultCompletionHandler](self, "headlineResultCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNoContentTodayResultOperation validateOperation].cold.1();
  return v2 != 0;
}

- (void)performOperation
{
  NTTodayResults *v3;
  void *v4;
  void *v5;
  void *v6;
  NTTodayResults *v7;

  v3 = [NTTodayResults alloc];
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NTTodayResults initWithSourceIdentifier:sections:expirationDate:headlineScale:](v3, "initWithSourceIdentifier:sections:expirationDate:headlineScale:", CFSTR("unknown"), v4, v5, 1.0);

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setTodaySourceIdentifier:", CFSTR("unknown"));
  -[NTNoContentTodayResultOperation setResultTodayResults:](self, "setResultTodayResults:", v7);
  -[NTNoContentTodayResultOperation setResultAssetHandlesByAssetID:](self, "setResultAssetHandlesByAssetID:", MEMORY[0x24BDBD1B8]);
  -[NTNoContentTodayResultOperation setResultFetchInfo:](self, "setResultFetchInfo:", v6);
  -[FCOperation finishedPerformingOperationWithError:](self, "finishedPerformingOperationWithError:", 0);

}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *, void *, void *, id);

  v4 = a3;
  -[NTTodayResultOperation headlineResultCompletionHandler](self, "headlineResultCompletionHandler");
  v8 = (void (**)(id, void *, void *, void *, id))objc_claimAutoreleasedReturnValue();
  -[NTNoContentTodayResultOperation resultTodayResults](self, "resultTodayResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTNoContentTodayResultOperation resultAssetHandlesByAssetID](self, "resultAssetHandlesByAssetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTNoContentTodayResultOperation resultFetchInfo](self, "resultFetchInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v5, v6, v7, v4);

}

- (NTTodayResults)resultTodayResults
{
  return self->_resultTodayResults;
}

- (void)setResultTodayResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NSDictionary)resultAssetHandlesByAssetID
{
  return self->_resultAssetHandlesByAssetID;
}

- (void)setResultAssetHandlesByAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NTPBTodayResultOperationFetchInfo)resultFetchInfo
{
  return self->_resultFetchInfo;
}

- (void)setResultFetchInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFetchInfo, 0);
  objc_storeStrong((id *)&self->_resultAssetHandlesByAssetID, 0);
  objc_storeStrong((id *)&self->_resultTodayResults, 0);
}

- (void)validateOperation
{
  void *v0;
  int v1;
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("No content result operation must have a completion handler"));
  v1 = 136315906;
  v2 = "-[NTNoContentTodayResultOperation validateOperation]";
  v3 = 2080;
  v4 = "NTNoContentTodayResultOperation.m";
  v5 = 1024;
  v6 = 27;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);

}

@end

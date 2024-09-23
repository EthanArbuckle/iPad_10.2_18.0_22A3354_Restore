@implementation ICASSearchSelectionData

- (ICASSearchSelectionData)initWithSelectedResultID:(id)a3 selectedResultAccountType:(id)a4 selectedResultType:(id)a5 gmRankingStrategyType:(id)a6 gmRank:(id)a7 searchRankingExperimentSummary:(id)a8 gmRankIOS13:(id)a9 charLengthOfQueryString:(id)a10 isNoteFoundByAttachment:(id)a11 isTopHit:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  ICASSearchSelectionData *v22;
  ICASSearchSelectionData *v23;
  id obj;
  id v26;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  obj = a4;
  v33 = a4;
  v32 = a5;
  v26 = a6;
  v31 = a6;
  v27 = a7;
  v30 = a7;
  v29 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)ICASSearchSelectionData;
  v22 = -[ICASSearchSelectionData init](&v35, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_selectedResultID, a3);
    objc_storeStrong((id *)&v23->_selectedResultAccountType, obj);
    objc_storeStrong((id *)&v23->_selectedResultType, a5);
    objc_storeStrong((id *)&v23->_gmRankingStrategyType, v26);
    objc_storeStrong((id *)&v23->_gmRank, v27);
    objc_storeStrong((id *)&v23->_searchRankingExperimentSummary, a8);
    objc_storeStrong((id *)&v23->_gmRankIOS13, a9);
    objc_storeStrong((id *)&v23->_charLengthOfQueryString, a10);
    objc_storeStrong((id *)&v23->_isNoteFoundByAttachment, a11);
    objc_storeStrong((id *)&v23->_isTopHit, a12);
  }

  return v23;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("SearchSelectionData");
}

- (id)toDict
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[10];
  _QWORD v36[12];

  v36[10] = *MEMORY[0x1E0C80C00];
  v35[0] = CFSTR("selectedResultID");
  -[ICASSearchSelectionData selectedResultID](self, "selectedResultID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    -[ICASSearchSelectionData selectedResultID](self, "selectedResultID");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v33 = (void *)v3;
  v36[0] = v3;
  v35[1] = CFSTR("selectedResultAccountType");
  -[ICASSearchSelectionData selectedResultAccountType](self, "selectedResultAccountType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    -[ICASSearchSelectionData selectedResultAccountType](self, "selectedResultAccountType");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v31 = (void *)v4;
  v36[1] = v4;
  v35[2] = CFSTR("selectedResultType");
  -[ICASSearchSelectionData selectedResultType](self, "selectedResultType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[ICASSearchSelectionData selectedResultType](self, "selectedResultType");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v29 = (void *)v5;
  v36[2] = v5;
  v35[3] = CFSTR("gmRankingStrategyType");
  -[ICASSearchSelectionData gmRankingStrategyType](self, "gmRankingStrategyType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    -[ICASSearchSelectionData gmRankingStrategyType](self, "gmRankingStrategyType");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v27 = (void *)v6;
  v36[3] = v6;
  v35[4] = CFSTR("gmRank");
  -[ICASSearchSelectionData gmRank](self, "gmRank");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[ICASSearchSelectionData gmRank](self, "gmRank");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v25 = (void *)v7;
  v36[4] = v7;
  v35[5] = CFSTR("searchRankingExperimentSummary");
  -[ICASSearchSelectionData searchRankingExperimentSummary](self, "searchRankingExperimentSummary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[ICASSearchSelectionData searchRankingExperimentSummary](self, "searchRankingExperimentSummary");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  v36[5] = v8;
  v35[6] = CFSTR("gmRankIOS13");
  -[ICASSearchSelectionData gmRankIOS13](self, "gmRankIOS13");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[ICASSearchSelectionData gmRankIOS13](self, "gmRankIOS13");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_opt_new();
  }
  v12 = (void *)v11;
  v36[6] = v11;
  v35[7] = CFSTR("charLengthOfQueryString");
  -[ICASSearchSelectionData charLengthOfQueryString](self, "charLengthOfQueryString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[ICASSearchSelectionData charLengthOfQueryString](self, "charLengthOfQueryString");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_opt_new();
  }
  v15 = (void *)v14;
  v36[7] = v14;
  v35[8] = CFSTR("isNoteFoundByAttachment");
  -[ICASSearchSelectionData isNoteFoundByAttachment](self, "isNoteFoundByAttachment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[ICASSearchSelectionData isNoteFoundByAttachment](self, "isNoteFoundByAttachment");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_opt_new();
  }
  v18 = (void *)v17;
  v36[8] = v17;
  v35[9] = CFSTR("isTopHit");
  -[ICASSearchSelectionData isTopHit](self, "isTopHit");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[ICASSearchSelectionData isTopHit](self, "isTopHit");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = objc_opt_new();
  }
  v21 = (void *)v20;
  v36[9] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSString)selectedResultID
{
  return self->_selectedResultID;
}

- (ICASSelectedResultAccountType)selectedResultAccountType
{
  return self->_selectedResultAccountType;
}

- (ICASSelectedResultType)selectedResultType
{
  return self->_selectedResultType;
}

- (ICASGmRankingStrategyType)gmRankingStrategyType
{
  return self->_gmRankingStrategyType;
}

- (NSNumber)gmRank
{
  return self->_gmRank;
}

- (NSArray)searchRankingExperimentSummary
{
  return self->_searchRankingExperimentSummary;
}

- (NSNumber)gmRankIOS13
{
  return self->_gmRankIOS13;
}

- (NSNumber)charLengthOfQueryString
{
  return self->_charLengthOfQueryString;
}

- (NSNumber)isNoteFoundByAttachment
{
  return self->_isNoteFoundByAttachment;
}

- (NSNumber)isTopHit
{
  return self->_isTopHit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isTopHit, 0);
  objc_storeStrong((id *)&self->_isNoteFoundByAttachment, 0);
  objc_storeStrong((id *)&self->_charLengthOfQueryString, 0);
  objc_storeStrong((id *)&self->_gmRankIOS13, 0);
  objc_storeStrong((id *)&self->_searchRankingExperimentSummary, 0);
  objc_storeStrong((id *)&self->_gmRank, 0);
  objc_storeStrong((id *)&self->_gmRankingStrategyType, 0);
  objc_storeStrong((id *)&self->_selectedResultType, 0);
  objc_storeStrong((id *)&self->_selectedResultAccountType, 0);
  objc_storeStrong((id *)&self->_selectedResultID, 0);
}

@end

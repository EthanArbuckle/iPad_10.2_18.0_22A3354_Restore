@implementation CNAutocompleteRecentResult

+ (id)contactResultWithDisplayName:(id)a3 value:(id)a4 lastSendingAddress:(id)a5 date:(id)a6
{
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  objc_msgSend(a1, "contactResultWithDisplayName:value:nameComponents:identifier:", a3, a4, 0, 0);
  v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "copy");

  v14 = (void *)v12[17];
  v12[17] = v13;

  objc_msgSend(v12, "setLastSendingAddress:", v11);
  return v12;
}

+ (id)groupResultWithDisplayName:(id)a3 date:(id)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "groupResultWithDisplayName:identifier:", a3, 0);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "copy");

  v9 = (void *)v7[17];
  v7[17] = v8;

  return v7;
}

+ (id)comparators
{
  if (comparators_cn_once_token_13 != -1)
    dispatch_once(&comparators_cn_once_token_13, &__block_literal_global_202);
  return (id)comparators_cn_once_object_13;
}

void __41__CNAutocompleteRecentResult_comparators__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E40]);
  v1 = _Block_copy(sSortResultsByCategory);
  v11 = v1;
  v2 = _Block_copy(sSortRecentResultsByCompletingChosenGroup);
  v12 = v2;
  v3 = _Block_copy(sSortResultsByPreferredDomain);
  v13 = v3;
  v4 = _Block_copy(sSortRecentResultsBySendingAddressMatch);
  v14 = v4;
  v5 = _Block_copy(sSortRecentResultsByDate);
  v15 = v5;
  v6 = _Block_copy(sSortResultsByDisplayName);
  v16 = v6;
  v7 = _Block_copy(sSortResultsByAddress);
  v17 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v0, "initWithArray:", v8, v11, v12, v13, v14, v15, v16);
  v10 = (void *)comparators_cn_once_object_13;
  comparators_cn_once_object_13 = v9;

}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)matchesSendingAddress
{
  return self->_matchesSendingAddress;
}

- (void)setMatchesSendingAddress:(BOOL)a3
{
  self->_matchesSendingAddress = a3;
}

- (BOOL)completesChosenGroup
{
  return self->_completesChosenGroup;
}

- (void)setCompletesChosenGroup:(BOOL)a3
{
  self->_completesChosenGroup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end

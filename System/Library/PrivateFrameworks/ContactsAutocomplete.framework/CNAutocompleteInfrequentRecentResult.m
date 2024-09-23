@implementation CNAutocompleteInfrequentRecentResult

+ (id)contactResultWithDisplayName:(id)a3 value:(id)a4 lastSendingAddress:(id)a5 dateCount:(unint64_t)a6 date:(id)a7
{
  id result;

  result = (id)objc_msgSend(a1, "contactResultWithDisplayName:value:lastSendingAddress:date:", a3, a4, a5, a7);
  *((_QWORD *)result + 19) = a6;
  return result;
}

+ (id)groupResultWithDisplayName:(id)a3 dateCount:(unint64_t)a4 date:(id)a5
{
  id result;

  result = (id)objc_msgSend(a1, "groupResultWithDisplayName:date:", a3, a5);
  *((_QWORD *)result + 19) = a4;
  return result;
}

+ (id)comparators
{
  if (comparators_cn_once_token_14 != -1)
    dispatch_once(&comparators_cn_once_token_14, &__block_literal_global_224);
  return (id)comparators_cn_once_object_14;
}

void __51__CNAutocompleteInfrequentRecentResult_comparators__block_invoke()
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
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E40]);
  v1 = _Block_copy(sSortResultsByCategory);
  v12[0] = v1;
  v2 = _Block_copy(sSortRecentResultsByCompletingChosenGroup);
  v12[1] = v2;
  v3 = _Block_copy(sSortResultsByPreferredDomain);
  v12[2] = v3;
  v4 = _Block_copy(sSortRecentResultsByDateCount);
  v12[3] = v4;
  v5 = _Block_copy(sSortRecentResultsBySendingAddressMatch);
  v12[4] = v5;
  v6 = _Block_copy(sSortRecentResultsByDate);
  v12[5] = v6;
  v7 = _Block_copy(sSortResultsByDisplayName);
  v12[6] = v7;
  v8 = _Block_copy(sSortResultsByAddress);
  v12[7] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v0, "initWithArray:", v9);
  v11 = (void *)comparators_cn_once_object_14;
  comparators_cn_once_object_14 = v10;

}

+ (unint64_t)category
{
  return 6;
}

- (unint64_t)dateCount
{
  return self->_dateCount;
}

- (void)setDateCount:(unint64_t)a3
{
  self->_dateCount = a3;
}

@end

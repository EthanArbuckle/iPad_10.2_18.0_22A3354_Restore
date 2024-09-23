@implementation NSArray(UpcomingMedia)

- (id)atx_filterPlayMediaIntentsWithUnavailableAppDestinationGivenSBAppList:()UpcomingMedia
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v5 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v6 = (void *)MEMORY[0x1E0CB3880];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __96__NSArray_UpcomingMedia__atx_filterPlayMediaIntentsWithUnavailableAppDestinationGivenSBAppList___block_invoke;
    v10[3] = &unk_1E82E7398;
    v12 = a2;
    v10[4] = a1;
    v11 = v5;
    objc_msgSend(v6, "predicateWithBlock:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "filteredArrayUsingPredicate:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = a1;
  }

  return v8;
}

@end

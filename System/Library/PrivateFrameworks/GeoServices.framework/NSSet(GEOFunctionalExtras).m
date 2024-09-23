@implementation NSSet(GEOFunctionalExtras)

- (id)_geo_filtered:()GEOFunctionalExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v5 = (void *)MEMORY[0x1E0CB3880];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__NSSet_GEOFunctionalExtras___geo_filtered___block_invoke;
    v9[3] = &unk_1E1C096C8;
    v10 = v4;
    objc_msgSend(v5, "predicateWithBlock:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "filteredSetUsingPredicate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)objc_opt_new();
  }

  return v7;
}

@end

@implementation NSMutableArray(GEOFunctionalExtras)

- (void)_geo_filter:()GEOFunctionalExtras
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v5 = (void *)MEMORY[0x1E0CB3880];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__NSMutableArray_GEOFunctionalExtras___geo_filter___block_invoke;
    v7[3] = &unk_1E1C096C8;
    v8 = v4;
    objc_msgSend(v5, "predicateWithBlock:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "filterUsingPredicate:", v6);

  }
}

@end

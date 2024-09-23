@implementation NSError(MapsSharedExtras)

+ (uint64_t)_maps_cancellationError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
}

- (BOOL)_maps_isCancellation
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    v3 = objc_msgSend(a1, "code") == 3072;
  else
    v3 = 0;

  return v3;
}

- (BOOL)_maps_isErrorOfDomain:()MapsSharedExtras code:
{
  id v6;
  void *v7;
  int v8;
  _BOOL8 v9;

  v6 = a3;
  objc_msgSend(a1, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v6);

  if (v8)
    v9 = objc_msgSend(a1, "code") == a4;
  else
    v9 = 0;

  return v9;
}

@end

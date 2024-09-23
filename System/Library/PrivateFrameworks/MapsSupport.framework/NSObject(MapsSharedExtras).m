@implementation NSObject(MapsSharedExtras)

- (uint64_t)_maps_setNeedsUpdateWithSelector:()MapsSharedExtras
{
  return objc_msgSend(a1, "_maps_setNeedsUpdate:withSelector:", 1, a3);
}

- (void)_maps_setNeedsUpdate:()MapsSharedExtras withSelector:
{
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[5];

  objc_getAssociatedObject(a1, off_1ED328280);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v7;
  if (a3)
  {
    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_setAssociatedObject(a1, off_1ED328280, v8, (void *)1);
    }
    NSStringFromSelector(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    objc_getAssociatedObject(a1, _MergedGlobals_32);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_setAssociatedObject(a1, _MergedGlobals_32, MEMORY[0x1E0C9AAB0], (void *)3);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__NSObject_MapsSharedExtras___maps_setNeedsUpdate_withSelector___block_invoke;
      block[3] = &unk_1E6651E88;
      block[4] = a1;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  else
  {
    NSStringFromSelector(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v11);

  }
}

- (uint64_t)_maps_needsUpdateWithSelector:()MapsSharedExtras
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_getAssociatedObject(a1, off_1ED328280);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

@end

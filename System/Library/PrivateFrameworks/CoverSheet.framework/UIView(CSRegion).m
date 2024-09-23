@implementation UIView(CSRegion)

- (void)setCoverSheetRegionRole:()CSRegion
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "coverSheetRegionRole", v2, (void *)1);

}

- (uint64_t)coverSheetRegionRole
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, "coverSheetRegionRole");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (void)setCoverSheetRegionReservedForHorizontalScrolling:()CSRegion
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "coverSheetRegionReservedForHorizontalScrolling", v2, (void *)1);

}

- (uint64_t)coverSheetRegionIsReservedForHorizontalScrolling
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, "coverSheetRegionReservedForHorizontalScrolling");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end

@implementation BRQueryItem(BRCAdditions)

- (unint64_t)_isAppLibraryTrashFolder
{
  return ((unint64_t)*(unsigned int *)(a1 + (int)*MEMORY[0x1E0D10F68]) >> 30) & 1;
}

- (id)asFileProviderItem
{
  id v2;

  if ((objc_msgSend(a1, "isDead") & 1) != 0 || (objc_msgSend(a1, "_isAppLibraryTrashFolder") & 1) != 0)
    v2 = 0;
  else
    v2 = a1;
  return v2;
}

@end

@implementation CPUIImageRowCellImageTitleItem

uint64_t __86___CPUIImageRowCellImageTitleItem_configureWithArtwork_title_imageSize_fallbackImage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
    a3 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "setImage:forState:", a3, 0);
}

@end

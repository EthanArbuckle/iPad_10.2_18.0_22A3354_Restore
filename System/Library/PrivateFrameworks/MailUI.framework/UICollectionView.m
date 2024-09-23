@implementation UICollectionView

uint64_t __58__UICollectionView_MailUI__mui_indexPathsForPreparedItems__block_invoke()
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  mui_indexPathsForPreparedItems_shouldUseImprovedSPI = result & 1;
  return result;
}

uint64_t __58__UICollectionView_MailUI__mui_indexPathsForPreparedItems__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "indexPathForCell:", a2);
}

@end

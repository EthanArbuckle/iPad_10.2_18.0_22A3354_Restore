@implementation SUUISpacerCollectionViewCell

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  CGSize result;

  v5 = 1.0;
  result.height = v5;
  result.width = a3;
  return result;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

@end

@implementation CPSClusterEstimatesViewController

+ (double)shadowRadius
{
  return 3.0;
}

+ (NSEdgeInsets)edgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)cornerRadius
{
  return 12.0;
}

+ (id)createEstimatesView
{
  CPSClusterEstimatesView *v2;

  v2 = [CPSClusterEstimatesView alloc];
  return -[CPSDashboardEstimatesView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

@end

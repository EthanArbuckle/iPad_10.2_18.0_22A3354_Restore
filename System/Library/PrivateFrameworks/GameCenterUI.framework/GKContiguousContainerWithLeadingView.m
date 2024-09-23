@implementation GKContiguousContainerWithLeadingView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  v3 = *MEMORY[0x1E0DC55F0];
  result.height = v3;
  result.width = v2;
  return result;
}

@end

@implementation _FEFocusNullGroup

- (CGRect)boundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x24BDBF070];
  v3 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF070] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)primaryItem
{
  return 0;
}

@end

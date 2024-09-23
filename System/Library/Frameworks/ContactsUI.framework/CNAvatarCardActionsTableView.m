@implementation CNAvatarCardActionsTableView

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = *MEMORY[0x1E0DC55F0];
  v4 = (double)-[CNAvatarCardActionsTableView numberOfRowsInSection:](self, "numberOfRowsInSection:", 0);
  -[CNAvatarCardActionsTableView rowHeight](self, "rowHeight");
  v6 = v5 * v4;
  v7 = v3;
  result.height = v6;
  result.width = v7;
  return result;
}

@end

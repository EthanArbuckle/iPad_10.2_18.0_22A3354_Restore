@implementation CNPostalAddressEditorTableView

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v3 = (double)-[CNPostalAddressEditorTableView numberOfRowsInSection:](self, "numberOfRowsInSection:", 0);
  -[CNPostalAddressEditorTableView rowHeight](self, "rowHeight");
  v5 = v4 * v3;
  v6 = *MEMORY[0x1E0DC55F0];
  result.height = v5;
  result.width = v6;
  return result;
}

@end

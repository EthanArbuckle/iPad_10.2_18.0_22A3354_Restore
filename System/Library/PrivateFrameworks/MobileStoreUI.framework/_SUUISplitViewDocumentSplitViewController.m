@implementation _SUUISplitViewDocumentSplitViewController

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  CGFloat height;
  double width;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  float v12;
  float v13;
  double v14;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[_SUUISplitViewDocumentSplitViewController viewControllers](self, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[_SUUISplitViewDocumentSplitViewController _SUUI_primaryColumnWidthForWidth:](self, "_SUUI_primaryColumnWidthForWidth:", width);
  if (v9 != v7)
  {
    v11 = width - v10;
    -[_SUUISplitViewDocumentSplitViewController gutterWidth](self, "gutterWidth");
    v13 = v11 - v12;
    v10 = floorf(v13);
  }
  v14 = height;
  result.height = v14;
  result.width = v10;
  return result;
}

- (double)_SUUI_primaryColumnWidthForWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double result;
  double v11;

  -[_SUUISplitViewDocumentSplitViewController preferredPrimaryColumnWidthFraction](self, "preferredPrimaryColumnWidthFraction");
  v6 = *MEMORY[0x24BEBE750];
  if (v5 == *MEMORY[0x24BEBE750])
    v5 = 0.4;
  v7 = ceil(v5 * a3);
  -[_SUUISplitViewDocumentSplitViewController minimumPrimaryColumnWidth](self, "minimumPrimaryColumnWidth");
  if (v8 == v6)
    v9 = 0.0;
  else
    v9 = v8;
  -[_SUUISplitViewDocumentSplitViewController maximumPrimaryColumnWidth](self, "maximumPrimaryColumnWidth");
  if (result == v6)
    result = 320.0;
  if (v9 >= v7)
    v11 = v9;
  else
    v11 = v7;
  if (result >= v11)
    return v11;
  return result;
}

@end

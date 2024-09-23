@implementation UIAccessibilityPDFElement

- (CGRect)frame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[UIAccessibilityPDFElement accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("_scroller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bounds");
    v8 = v7;
    objc_msgSend(v6, "_accessibilityContentSize");
    v10 = v9;
    v12 = v11 / (double)-[UIAccessibilityPDFElement pageCount](self, "pageCount");
    v13 = v12 * (double)-[UIAccessibilityPDFElement page](self, "page");
  }
  else
  {
    v8 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v14 = v8;
  v15 = v13;
  v16 = v10;
  v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  -[UIAccessibilityPDFElement frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIAccessibilityPDFElement accessibilityContainer](self, "accessibilityContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "safeValueForKey:", CFSTR("_scroller"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:toView:", v14, v4, v6, v8, v10);
  objc_msgSend(v14, "convertRect:toWindow:", 0);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (int64_t)page
{
  return self->_page;
}

- (void)setPage:(int64_t)a3
{
  self->_page = a3;
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  self->_pageCount = a3;
}

@end

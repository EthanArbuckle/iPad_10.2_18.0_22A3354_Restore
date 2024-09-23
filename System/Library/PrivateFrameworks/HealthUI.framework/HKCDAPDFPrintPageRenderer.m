@implementation HKCDAPDFPrintPageRenderer

- (HKCDAPDFPrintPageRenderer)initWithPaperRect:(CGRect)a3 horizontalMargin:(double)a4 verticalMargin:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  HKCDAPDFPrintPageRenderer *v11;
  HKCDAPDFPrintPageRenderer *v12;
  CGFloat *p_x;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)HKCDAPDFPrintPageRenderer;
  v11 = -[HKCDAPDFPrintPageRenderer init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_paperRectOverride.origin.x = x;
    v11->_paperRectOverride.origin.y = y;
    v11->_paperRectOverride.size.width = width;
    v11->_paperRectOverride.size.height = height;
    p_x = &v11->_printableRectOverride.origin.x;
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v17 = CGRectInset(v16, a4, a5);
    *p_x = v17.origin.x;
    v12->_printableRectOverride.origin.y = v17.origin.y;
    v12->_printableRectOverride.size.width = v17.size.width;
    v12->_printableRectOverride.size.height = v17.size.height + a5;
    -[UIPrintPageRenderer setFooterHeight:](v12, "setFooterHeight:", a5);
  }
  return v12;
}

- (CGRect)paperRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_paperRectOverride.origin.x;
  y = self->_paperRectOverride.origin.y;
  width = self->_paperRectOverride.size.width;
  height = self->_paperRectOverride.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)printableRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_printableRectOverride.origin.x;
  y = self->_printableRectOverride.origin.y;
  width = self->_printableRectOverride.size.width;
  height = self->_printableRectOverride.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)drawFooterForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", a3, 8.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CLINICAL_DOCUMENT_CDA_DISCLOSURE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v11, "setAlignment:", 0);
  v12 = *MEMORY[0x1E0DC1178];
  v15[0] = *MEMORY[0x1E0DC1138];
  v15[1] = v12;
  v16[0] = v8;
  v16[1] = v11;
  v15[2] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v14, 0, width + -20.0, height);
  objc_msgSend(v10, "drawInRect:withAttributes:", v14, x + 20.0, y + 10.0);

}

@end

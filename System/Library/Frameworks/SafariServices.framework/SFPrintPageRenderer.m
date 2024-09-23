@implementation SFPrintPageRenderer

- (SFPrintPageRenderer)init
{
  SFPrintPageRenderer *v2;
  NSNumberFormatter *v3;
  NSNumberFormatter *numberFormatter;
  uint64_t v5;
  UIFont *footerFont;
  uint64_t v7;
  UIColor *footerColor;
  SFPrintPageRenderer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFPrintPageRenderer;
  v2 = -[SFPrintPageRenderer init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    numberFormatter = v2->_numberFormatter;
    v2->_numberFormatter = v3;

    -[NSNumberFormatter setNumberStyle:](v2->_numberFormatter, "setNumberStyle:", 0);
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", 7.0);
    v5 = objc_claimAutoreleasedReturnValue();
    footerFont = v2->_footerFont;
    v2->_footerFont = (UIFont *)v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.5, 1.0);
    v7 = objc_claimAutoreleasedReturnValue();
    footerColor = v2->_footerColor;
    v2->_footerColor = (UIColor *)v7;

    v2->_printFooter = 1;
    v9 = v2;
  }

  return v2;
}

- (void)setContentFormatter:(id)a3
{
  UIPrintFormatter *v5;
  UIPrintFormatter *contentFormatter;
  UIPrintFormatter *v7;

  v5 = (UIPrintFormatter *)a3;
  contentFormatter = self->_contentFormatter;
  if (contentFormatter != v5)
  {
    v7 = v5;
    -[UIPrintFormatter removeFromPrintPageRenderer](contentFormatter, "removeFromPrintPageRenderer");
    objc_storeStrong((id *)&self->_contentFormatter, a3);
    v5 = v7;
    if (self->_contentFormatter)
    {
      -[UIPrintPageRenderer addPrintFormatter:startingAtPageAtIndex:](self, "addPrintFormatter:startingAtPageAtIndex:", v7, 0);
      v5 = v7;
    }
  }

}

- (void)drawFooterForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  NSNumberFormatter *numberFormatter;
  void *v7;
  NSNumberFormatter *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double y;
  CGFloat v17;
  double v18;
  id v19;

  if (self->_printFooter)
  {
    -[UIColor set](self->_footerColor, "set", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    -[NSString _legacy_drawAtPoint:forWidth:withFont:lineBreakMode:](self->_URLString, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", self->_footerFont, 5, self->_footerOffset.x, self->_footerOffset.y, self->_URLWidth);
    -[NSString _legacy_drawAtPoint:forWidth:withFont:lineBreakMode:](self->_dateString, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", self->_footerFont, 2, self->_footerOffset.x + self->_printWidth - self->_dateWidth, self->_footerOffset.y);
    numberFormatter = self->_numberFormatter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v7);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    v8 = self->_numberFormatter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[UIPrintPageRenderer numberOfPages](self, "numberOfPages"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](v8, "stringFromNumber:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v19, v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "_legacy_sizeWithFont:", self->_footerFont);
    v15 = v14;
    y = self->_footerOffset.y;
    v17 = self->_footerOffset.x + self->_printWidth - v14;
    -[UIFont lineHeight](self->_footerFont, "lineHeight");
    objc_msgSend(v13, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", self->_footerFont, 2, v17, y + v18, v15);

  }
}

- (void)printInteractionControllerWillStartJob:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat x;
  double y;
  CGFloat width;
  CGFloat height;
  double v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v21;
  UIPrintFormatter *contentFormatter;
  double v23;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *dateString;
  double v28;
  double v29;
  double v30;
  id v31;
  _BYTE v32[8];
  CGFloat v33;
  CGFloat v34;
  double v35;
  uint64_t v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  objc_msgSend(v31, "printPaper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paperSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "printableRect");
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  v33 = v37.origin.x;
  v34 = v37.origin.y;
  v30 = v6;
  v35 = v6 - CGRectGetMaxX(v37);
  v13 = 36.0;
  for (i = 8; i != 32; i += 8)
  {
    if (v13 < *(double *)&v32[i])
      v13 = *(double *)&v32[i];
  }
  objc_msgSend(v31, "printInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "duplex");

  if (v16)
  {
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    if (v13 <= v8 - CGRectGetMaxY(v38))
    {
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      v13 = v8 - CGRectGetMaxY(v39);
    }
  }
  if (self->_printFooter)
    v17 = 18.0;
  else
    v17 = 0.0;
  if (self->_printFooter)
    v18 = 36.0;
  else
    v18 = 0.0;
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v19 = v8 - CGRectGetMaxY(v40);
  if (v17 >= v19)
    v19 = v17;
  if (v19 < v13 - v18)
    v19 = v13 - v18;
  if (v19 > y || v16 == 0)
    y = v19;
  self->_contentOffset.x = v13;
  self->_contentOffset.y = v13;
  -[UIFont lineHeight](self->_footerFont, "lineHeight");
  self->_footerOffset.x = v13;
  self->_footerOffset.y = v8 - (y + v21 * 2.0);
  if (self->_printFooter)
    -[UIPrintPageRenderer setFooterHeight:](self, "setFooterHeight:");
  contentFormatter = self->_contentFormatter;
  if (contentFormatter)
  {
    v23 = 0.0;
    if (!self->_printFooter)
      v23 = y;
    -[UIPrintFormatter setPerPageContentInsets:](contentFormatter, "setPerPageContentInsets:", self->_contentOffset.y, self->_contentOffset.x, v23, self->_contentOffset.x);
  }
  self->_printWidth = v30 - (v13 + v13);
  v24 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringFromDate:dateStyle:timeStyle:", v25, 1, 1);
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  dateString = self->_dateString;
  self->_dateString = v26;

  -[NSString _legacy_sizeWithFont:](self->_dateString, "_legacy_sizeWithFont:", self->_footerFont);
  self->_dateWidth = v28;
  -[NSString _legacy_sizeWithFont:forWidth:lineBreakMode:](self->_URLString, "_legacy_sizeWithFont:forWidth:lineBreakMode:", self->_footerFont, 5, self->_printWidth - (v28 + 18.0));
  self->_URLWidth = v29;

}

- (void)printInteractionControllerDidFinishJob:(id)a3
{
  -[SFPrintPageRenderer setContentFormatter:](self, "setContentFormatter:", 0);
}

- (id)printInteractionControllerParentViewController:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentingViewControllerForPrintPageRenderer:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void)setURLString:(id)a3
{
  objc_storeStrong((id *)&self->_URLString, a3);
}

- (UIPrintFormatter)contentFormatter
{
  return self->_contentFormatter;
}

- (BOOL)printFooter
{
  return self->_printFooter;
}

- (void)setPrintFooter:(BOOL)a3
{
  self->_printFooter = a3;
}

- (SFPrintPageRendererDelegate)delegate
{
  return (SFPrintPageRendererDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentFormatter, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_footerColor, 0);
  objc_storeStrong((id *)&self->_footerFont, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

@end

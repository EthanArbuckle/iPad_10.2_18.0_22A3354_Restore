@implementation NTKRichComplicationBezelEmptyView

- (void)layoutSubviews
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKRichComplicationBezelEmptyView;
  -[NTKRichComplicationBezelEmptyView layoutSubviews](&v6, sel_layoutSubviews);
  -[NTKRichComplicationBezelView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[NTKRichComplicationBezelView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didUpdateBezelTextForRichComplicationBezelView:", self);

  }
}

@end

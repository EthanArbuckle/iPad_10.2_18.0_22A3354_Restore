@implementation _CNAtomLayoutView

+ (id)layoutViewWithDelegateView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDelegateView:", v4);

  return v5;
}

- (_CNAtomLayoutView)initWithDelegateView:(id)a3
{
  id v5;
  _CNAtomLayoutView *v6;
  _CNAtomLayoutView *v7;
  id *p_delegateView;
  _CNAtomLayoutView *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CNAtomLayoutView;
  v6 = -[_CNAtomLayoutView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    p_delegateView = (id *)&v6->_delegateView;
    objc_storeStrong((id *)&v6->_delegateView, a3);
    objc_msgSend(*p_delegateView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_CNAtomLayoutView setAutoresizesSubviews:](v7, "setAutoresizesSubviews:", 0);
    -[_CNAtomLayoutView addSubview:](v7, "addSubview:", *p_delegateView);
    v9 = v7;
  }

  return v7;
}

- (_CNAtomLayoutView)init
{

  return 0;
}

- (_CNAtomLayoutView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (_CNAtomLayoutView)initWithCoder:(id)a3
{

  return 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CNAtomLayoutView;
  if (-[_CNAtomLayoutView respondsToSelector:](&v5, sel_respondsToSelector_))
    v3 = 1;
  else
    v3 = objc_opt_respondsToSelector();
  return v3 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNAtomLayoutView;
  -[_CNAtomLayoutView methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[CNAtomTextViewAtomLayout methodSignatureForSelector:](self->_delegateView, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_delegateView;
}

- (void)setMaskBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_CNAtomLayoutView bounds](self, "bounds");
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v8 = CGRectEqualToRect(v15, v16);
  -[_CNAtomLayoutView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  if (v8)
  {
    objc_msgSend(v9, "setMask:", 0);
    v10 = v14;
  }
  else
  {
    objc_msgSend(v9, "mask");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CNAtomLayoutView layer](self, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMask:", v11);

    }
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", x, y, width, height);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "setPath:", objc_msgSend(v13, "CGPath"));

    v10 = v11;
  }

}

- (UIEdgeInsets)atomInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  objc_msgSend(MEMORY[0x1E0CEABB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[_CNAtomLayoutView semanticContentAttribute](self, "semanticContentAttribute"));
  v2 = 0.0;
  v3 = 2.0;
  v4 = 0.0;
  v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)viewForLastBaselineLayout
{
  return (id)-[CNAtomTextViewAtomLayout viewForLastBaselineLayout](self->_delegateView, "viewForLastBaselineLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[CNAtomTextViewAtomLayout systemLayoutSizeFittingSize:](self->_delegateView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[_CNAtomLayoutView atomInsets](self, "atomInsets");
  v10 = v5 + v8 + v9;
  v13 = v7 + v11 + v12;
  v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_CNAtomLayoutView;
  -[_CNAtomLayoutView layoutSubviews](&v15, sel_layoutSubviews);
  -[_CNAtomLayoutView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_CNAtomLayoutView atomInsets](self, "atomInsets");
  v12 = v4 + v11;
  -[CNAtomTextViewAtomLayout systemLayoutSizeFittingSize:](self->_delegateView, "systemLayoutSizeFittingSize:", v8, v10);
  -[CNAtomTextViewAtomLayout setFrame:](self->_delegateView, "setFrame:", v12, v6, v13, v14);
}

- (CGRect)selectionBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CNAtomTextViewAtomLayout bounds](self->_delegateView, "bounds");
  -[_CNAtomLayoutView convertRect:fromView:](self, "convertRect:fromView:", self->_delegateView);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)boundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double MaxY;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat rect;
  CGFloat height;
  CGRect v31;
  CGRect v32;
  CGRect result;

  height = a4.size.height;
  -[_CNAtomLayoutView layoutIfNeeded](self, "layoutIfNeeded", a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
  v7 = *MEMORY[0x1E0C9D648];
  rect = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[_CNAtomLayoutView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v9 = v8;
  v11 = v10;
  -[_CNAtomLayoutView viewForLastBaselineLayout](self, "viewForLastBaselineLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  -[_CNAtomLayoutView convertRect:fromView:](self, "convertRect:fromView:", v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v12, "_baselineOffsetFromBottom");
  v22 = v21;
  v31.origin.x = v14;
  v31.origin.y = v16;
  v31.size.width = v18;
  v31.size.height = v20;
  MaxY = CGRectGetMaxY(v31);
  v32.origin.x = v7;
  v32.origin.y = rect;
  v32.size.width = v9;
  v32.size.height = v11;
  v24 = MaxY - CGRectGetMaxY(v32) - v22;

  v25 = v7;
  v26 = v24;
  v27 = v9;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CNAtomTextViewAtomLayout)delegateView
{
  return self->_delegateView;
}

- (void)setDelegateView:(id)a3
{
  objc_storeStrong((id *)&self->_delegateView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateView, 0);
}

@end

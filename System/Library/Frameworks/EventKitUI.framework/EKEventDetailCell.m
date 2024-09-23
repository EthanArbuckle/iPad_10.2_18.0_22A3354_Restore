@implementation EKEventDetailCell

- (EKEventDetailCell)initWithEvent:(id)a3 editable:(BOOL)a4
{
  return -[EKEventDetailCell initWithEvent:editable:style:](self, "initWithEvent:editable:style:", a3, a4, 0);
}

- (EKEventDetailCell)initWithEvent:(id)a3 editable:(BOOL)a4 style:(int64_t)a5
{
  id v8;
  EKEventDetailCell *v9;
  EKEventDetailCell *v10;

  v8 = a3;
  v9 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", a5, 0);
  v10 = v9;
  if (v9)
  {
    v9->_editable = a4;
    -[EKEventDetailCell setEvent:](v9, "setEvent:", v8);
  }

  return v10;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  EKEvent *v5;
  EKEvent *v6;

  v5 = (EKEvent *)a3;
  if (self->_event != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_event, a3);
    v5 = v6;
  }

}

- (BOOL)isEditable
{
  return self->_editable;
}

- (BOOL)update
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend((id)objc_opt_class(), "detailsCellDefaultHeight");
  if (height < v5)
  {
    objc_msgSend((id)objc_opt_class(), "detailsCellDefaultHeight");
    height = v6;
  }
  v7 = width;
  v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutForWidth:(double)a3 position:(int)a4
{
  -[EKEventDetailCell setSelectionStyle:](self, "setSelectionStyle:", -[EKEventDetailCell accessoryType](self, "accessoryType") == 1);
  self->_lastLaidOutWidth = a3;
  self->_lastLaidOutPosition = a4;
}

- (BOOL)needsLayoutForWidth:(double)a3 position:(int)a4
{
  return self->_lastLaidOutWidth != a3 || self->_lastLaidOutPosition != a4;
}

+ (id)_bodyFontAtDefaultSize
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
}

+ (double)_scaledDistanceCalculatedFromTopFromBaseline:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bodyFontAtDefaultSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ascender");
  objc_msgSend(v5, "_scaledValueForValue:", v7 + a3);
  v9 = v8;
  objc_msgSend(v5, "ascender");
  CalRoundToScreenScale(v9 - v10);
  if (v11 >= a3)
    a3 = v11;

  return a3;
}

+ (double)_scaledDistanceCalculatedFromBottomToBaseline:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bodyFontAtDefaultSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descender");
  objc_msgSend(v5, "_scaledValueForValue:", a3 - v7);
  v9 = v8;
  objc_msgSend(v5, "descender");
  CalRoundToScreenScale(v9 + v10);
  if (v11 >= a3)
    a3 = v11;

  return a3;
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailCell;
  -[EKEventDetailCell layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[EKEventDetailCell setNeedsLayout](self, "setNeedsLayout");
}

- (double)detailsLeftInset
{
  double v3;
  double v4;
  double v5;

  -[EKEventDetailCell layoutMargins](self, "layoutMargins");
  v4 = v3;
  -[EKEventDetailCell safeAreaInsets](self, "safeAreaInsets");
  return v4 - v5;
}

- (double)detailsRightInset
{
  double v3;
  double v4;
  double v5;

  -[EKEventDetailCell layoutMargins](self, "layoutMargins");
  v4 = v3;
  -[EKEventDetailCell safeAreaInsets](self, "safeAreaInsets");
  return v4 - v5;
}

+ (double)detailsTopVerticalInset
{
  double result;

  objc_msgSend(a1, "_scaledDistanceCalculatedFromTopFromBaseline:", 12.0);
  return result;
}

+ (double)detailsBottomVerticalInset
{
  double result;

  objc_msgSend(a1, "_scaledDistanceCalculatedFromBottomToBaseline:", 9.0);
  return result;
}

+ (double)detailsPostLabelSpace
{
  double result;

  objc_msgSend(a1, "_scaledDistanceCalculatedFromBottomToBaseline:", 9.0);
  return result;
}

+ (double)detailsCellDefaultHeight
{
  void *v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 44.0;
  objc_msgSend(v2, "_scaledValueForValue:", 44.0);
  CalRoundToScreenScale(v4);
  if (v5 >= 44.0)
    v3 = v5;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end

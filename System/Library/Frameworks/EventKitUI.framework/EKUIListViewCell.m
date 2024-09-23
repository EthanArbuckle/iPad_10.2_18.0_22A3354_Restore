@implementation EKUIListViewCell

- (id)initForCarplayWithReuseIdentifier:(id)a3
{
  EKUIListViewCell *v3;
  EKUIListViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKUIListViewCell;
  v3 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, 0, a3);
  v4 = v3;
  if (v3)
  {
    v3->_carplayMode = 1;
    -[EKUIListViewCell setAutomaticallyUpdatesBackgroundConfiguration:](v3, "setAutomaticallyUpdatesBackgroundConfiguration:", 0);
  }
  return v4;
}

- (id)initForDragPreview
{
  EKUIListViewCell *v2;
  EKUIListViewCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIListViewCell;
  v2 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](&v5, sel_initWithStyle_reuseIdentifier_, 0, 0);
  v3 = v2;
  if (v2)
  {
    v2->_dragPreview = 1;
    -[EKUIListViewCell setAutomaticallyUpdatesBackgroundConfiguration:](v2, "setAutomaticallyUpdatesBackgroundConfiguration:", 0);
  }
  return v3;
}

- (EKUIListViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIListViewCell *v4;
  EKUIListViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKUIListViewCell;
  v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[EKUIListViewCell setAutomaticallyUpdatesBackgroundConfiguration:](v4, "setAutomaticallyUpdatesBackgroundConfiguration:", 0);
  return v5;
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  int IsLeftToRight;
  double v11;
  double v12;
  double v13;
  int v14;
  double v15;
  double v16;
  double v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;

  v23 = a3;
  if (objc_msgSend(v23, "isSelected") && !-[EKUIListViewCell carplayMode](self, "carplayMode"))
  {
    -[EKUIListViewCell defaultBackgroundConfiguration](self, "defaultBackgroundConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatedConfigurationForState:", v23);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v6) = CalInterfaceIsLeftToRight();
    -[EKUIListViewCell safeAreaInsets](self, "safeAreaInsets");
    if ((_DWORD)v6)
      v9 = v7;
    else
      v9 = v8;
    IsLeftToRight = CalInterfaceIsLeftToRight();
    -[EKUIListViewCell safeAreaInsets](self, "safeAreaInsets");
    if (IsLeftToRight)
      v13 = v12;
    else
      v13 = v11;
    v14 = CalInterfaceIsLeftToRight();
    -[EKUIListViewCell layoutMargins](self, "layoutMargins");
    if (v14)
      v17 = v15;
    else
      v17 = v16;
    v18 = CalInterfaceIsLeftToRight();
    -[EKUIListViewCell layoutMargins](self, "layoutMargins");
    if (v18)
      v21 = v20;
    else
      v21 = v19;
    v22 = v21 + -8.0;
    objc_msgSend(v4, "setCornerRadius:", 6.0);
    objc_msgSend(v4, "setBackgroundInsets:", 4.0, v9 - (v17 + -8.0), 4.0, v13 - v22);
    objc_msgSend(v4, "setEdgesAddingLayoutMarginsToBackgroundInsets:", 10);
    -[EKUIListViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updatedConfigurationForState:", v23);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIListViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v5);

  }
}

+ (id)pathForBackgroundForRect:(CGRect)a3 allDay:(BOOL)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (BOOL)drawsBackgroundForEvent:(id)a3
{
  return +[EKUIListViewCellBackground drawsBackgroundForEvent:](EKUIListViewCellBackground, "drawsBackgroundForEvent:", a3);
}

+ (UIEdgeInsets)adjustedSeparatorInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)carplayMode
{
  return self->_carplayMode;
}

- (BOOL)dragPreview
{
  return self->_dragPreview;
}

@end

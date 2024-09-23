@implementation EKCalendarChooserCellLayoutManager

+ (id)sharedLayoutManagerForStyle:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)sharedLayoutManagerForStyle__sLayoutManagers;
  if (!sharedLayoutManagerForStyle__sLayoutManagers)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)sharedLayoutManagerForStyle__sLayoutManagers;
    sharedLayoutManagerForStyle__sLayoutManagers = v6;

    v5 = (void *)sharedLayoutManagerForStyle__sLayoutManagers;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCellStyle:", a3);
    v10 = (void *)sharedLayoutManagerForStyle__sLayoutManagers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v11);

  }
  return v9;
}

- (EKCalendarChooserCellLayoutManager)initWithCellStyle:(int64_t)a3
{
  EKCalendarChooserCellLayoutManager *v4;
  uint64_t v5;
  id realLayoutManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKCalendarChooserCellLayoutManager;
  v4 = -[EKCalendarChooserCellLayoutManager init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3D58], "layoutManagerForTableViewCellStyle:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    realLayoutManager = v4->_realLayoutManager;
    v4->_realLayoutManager = (id)v5;

  }
  return v4;
}

- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  void *v19;
  double MaxX;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  v5 = a5;
  v8 = a3;
  objc_msgSend(self->_realLayoutManager, "textRectForCell:rowWidth:forSizing:", v8, v5, a4);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_msgSend(v8, "showCheckmarksOnLeft") & 1) != 0 || objc_msgSend(v8, "showsColorDot")))
  {
    objc_msgSend(v8, "textLeadingIndent");
    v18 = v17;
    if (CalInterfaceIsLeftToRight())
    {
      v14 = v14 - (v18 - v10);
      v10 = v18;
    }
    else
    {
      objc_msgSend(v8, "contentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      MaxX = CGRectGetMaxX(v27);
      v28.origin.x = v10;
      v28.origin.y = v12;
      v28.size.width = v14;
      v28.size.height = v16;
      v21 = MaxX - CGRectGetMaxX(v28);

      v14 = v14 - (v18 - v21);
      objc_msgSend(v8, "contentView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v10 = CGRectGetMaxX(v29) - v14 - v18;

    }
  }

  v23 = v10;
  v24 = v12;
  v25 = v14;
  v26 = v16;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (double)defaultTextLabelFontSizeForCell:(id)a3
{
  double result;

  objc_msgSend(self->_realLayoutManager, "defaultTextLabelFontSizeForCell:", a3);
  return result;
}

- (double)defaultDetailTextLabelFontSizeForCell:(id)a3
{
  double result;

  objc_msgSend(self->_realLayoutManager, "defaultDetailTextLabelFontSizeForCell:", a3);
  return result;
}

- (id)detailTextLabelForCell:(id)a3
{
  return (id)objc_msgSend(self->_realLayoutManager, "detailTextLabelForCell:", a3);
}

- (id)defaultTextLabelFontForCell:(id)a3
{
  return (id)objc_msgSend(self->_realLayoutManager, "defaultTextLabelFontForCell:", a3);
}

- (id)defaultDetailTextLabelFontForCell:(id)a3
{
  return (id)objc_msgSend(self->_realLayoutManager, "defaultDetailTextLabelFontForCell:", a3);
}

- (void)getTextLabelRect:(CGRect *)a3 detailTextLabelRect:(CGRect *)a4 forCell:(id)a5 rowWidth:(double)a6 forSizing:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int IsLeftToRight;
  char v22;
  CGFloat y;
  CGFloat height;
  double x;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double width;
  double v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v7 = a7;
  v12 = a5;
  objc_msgSend(self->_realLayoutManager, "getTextLabelRect:detailTextLabelRect:forCell:rowWidth:forSizing:", a3, a4, v12, v7, a6);
  -[EKCalendarChooserCellLayoutManager textRectForCell:rowWidth:forSizing:](self, "textRectForCell:rowWidth:forSizing:", v12, v7, a6);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  IsLeftToRight = CalInterfaceIsLeftToRight();
  v22 = IsLeftToRight;
  if (a3)
  {
    y = a3->origin.y;
    height = a3->size.height;
    if (IsLeftToRight)
    {
      v36.origin.x = a3->origin.x;
      v36.origin.y = a3->origin.y;
      v36.size.width = v18;
      v36.size.height = a3->size.height;
      v37 = CGRectOffset(v36, v14 - a3->origin.x, 0.0);
      x = v37.origin.x;
      y = v37.origin.y;
      height = v37.size.height;
    }
    else
    {
      objc_msgSend(v12, "textLeadingIndent");
      v27 = v26;
      objc_msgSend(v12, "contentView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bounds");
      x = v29 - v18 - v27;

      v37.size.width = v18;
    }
    a3->origin.x = x;
    a3->origin.y = y;
    a3->size.width = v37.size.width;
    a3->size.height = height;
  }
  if (a4)
  {
    v30 = a4->origin.x;
    v31 = a4->origin.y;
    width = a4->size.width;
    v33 = a4->size.height;
    v35 = 0.0;
    if (-[EKCalendarChooserCellLayoutManager rect:trailsOtherRect:byDistance:](self, "rect:trailsOtherRect:byDistance:", &v35, v14, v16, v18, v20, v30, v31, width, v33))
    {
      v34 = v35;
      if ((v22 & 1) == 0)
      {
        v34 = -v35;
        v35 = -v35;
      }
      v38.origin.x = v30;
      v38.origin.y = v31;
      v38.size.width = width;
      v38.size.height = v33;
      *a4 = CGRectOffset(v38, v34, 0.0);
    }
  }

}

- (BOOL)rect:(CGRect)a3 trailsOtherRect:(CGRect)a4 byDistance:(double *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double MaxX;
  CGRect v17;
  CGRect v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  if (CalInterfaceIsLeftToRight())
  {
    v14 = v13 - x;
  }
  else
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    MaxX = CGRectGetMaxX(v17);
    v18.origin.x = v13;
    v18.origin.y = v12;
    v18.size.width = v11;
    v18.size.height = v10;
    v14 = MaxX - CGRectGetMaxX(v18);
  }
  *a5 = v14;
  return v14 > 0.0;
}

- (CGSize)intrinsicContentSizeForCell:(id)a3 rowWidth:(double)a4
{
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(self->_realLayoutManager, "intrinsicContentSizeForCell:rowWidth:", a3, a4);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_realLayoutManager, 0);
}

@end

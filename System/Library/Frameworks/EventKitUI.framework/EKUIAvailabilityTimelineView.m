@implementation EKUIAvailabilityTimelineView

- (EKUIAvailabilityTimelineView)init
{
  EKUIAvailabilityTimelineView *v2;
  int v3;
  uint64_t v4;
  NSMutableArray *labels;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  UIView *bottomPixelBorder;
  UIView *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)EKUIAvailabilityTimelineView;
  v2 = -[EKUIAvailabilityTimelineView init](&v20, sel_init);
  if (v2)
  {
    v3 = 23;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 23);
    v4 = objc_claimAutoreleasedReturnValue();
    labels = v2->_labels;
    v2->_labels = (NSMutableArray *)v4;

    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = *MEMORY[0x1E0DC4AA0];
    do
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v9, v8);
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFont:", v12);

      if (CalInterfaceIsLeftToRight())
        v13 = 2;
      else
        v13 = 0;
      objc_msgSend(v11, "setTextAlignment:", v13);
      objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTextColor:", v14);

      -[EKUIAvailabilityTimelineView addSubview:](v2, "addSubview:", v11);
      -[NSMutableArray addObject:](v2->_labels, "addObject:", v11);

      --v3;
    }
    while (v3);
    -[EKUIAvailabilityTimelineView setLabels](v2, "setLabels");
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v9, v8);
    bottomPixelBorder = v2->_bottomPixelBorder;
    v2->_bottomPixelBorder = (UIView *)v15;

    v17 = v2->_bottomPixelBorder;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[EKUIAvailabilityTimelineView addSubview:](v2, "addSubview:", v2->_bottomPixelBorder);
  }
  return v2;
}

- (void)setLabels
{
  void *v3;
  NSString *v4;
  BOOL v5;
  NSMutableArray *labels;
  _QWORD v7[4];
  BOOL v8;

  -[EKUIAvailabilityTimelineView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E0DC4900]) != NSOrderedAscending;

  labels = self->_labels;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__EKUIAvailabilityTimelineView_setLabels__block_invoke;
  v7[3] = &__block_descriptor_33_e24_v32__0__UILabel_8Q16_B24l;
  v8 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](labels, "enumerateObjectsUsingBlock:", v7);
}

void __41__EKUIAvailabilityTimelineView_setLabels__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (a3 == 8 || a3 == 16)
  {
    if ((CUIKShow24Hours() & 1) == 0 && !*(_BYTE *)(a1 + 32))
    {
      CUIKStringForHour();
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    CUIKStringForHourWithoutDesignator();
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v5 = (void *)v7;
    objc_msgSend(v9, "setText:", v7);
    goto LABEL_10;
  }
  if (a3 != 11 || *(_BYTE *)(a1 + 32))
    goto LABEL_8;
  EventKitUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Noon"), &stru_1E601DFA8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v6);

LABEL_10:
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

}

- (void)setContentWidth:(double)a3
{
  double v5;
  double v6;
  NSMutableArray *labels;
  _QWORD v8[7];

  -[EKUIAvailabilityTimelineView frame](self, "frame");
  v6 = v5;
  -[EKUIAvailabilityTimelineView setContentSize:](self, "setContentSize:", a3, v5);
  self->_largestLabelWidth = 0.0;
  labels = self->_labels;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__EKUIAvailabilityTimelineView_setContentWidth___block_invoke;
  v8[3] = &unk_1E6019908;
  *(double *)&v8[5] = a3;
  *(double *)&v8[6] = v6;
  v8[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](labels, "enumerateObjectsUsingBlock:", v8);
  -[UIView setFrame:](self->_bottomPixelBorder, "setFrame:", 0.0, v6 + -1.0, a3, 0.5);
  -[EKUIAvailabilityTimelineView setNeedsLayout](self, "setNeedsLayout");
}

void __48__EKUIAvailabilityTimelineView_setContentWidth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (double)(unint64_t)(a3 + 1) / 24.0 * *(double *)(a1 + 40);
  v5 = a2;
  if ((CalTimeDirectionIsLeftToRight() & 1) == 0)
    v4 = *(double *)(a1 + 40) - v4;
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v5, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeWithAttributes:", v8);
  v10 = v9;
  v12 = v11;

  objc_msgSend(v5, "setFrame:", v4 + v10 * -0.5, *(double *)(a1 + 48) - v12 + -11.0, v10, v12);
  v13 = *(_QWORD *)(a1 + 32);
  if (v10 > *(double *)(v13 + 2096))
    *(double *)(v13 + 2096) = v10;
}

- (double)minWidth
{
  return (self->_largestLabelWidth + 10.0) * 24.0;
}

- (void)setHorizontalScrollOffset:(double)a3
{
  -[EKUIAvailabilityTimelineView setContentOffset:](self, "setContentOffset:", a3, 0.0);
}

- (void)setContentOffset:(CGPoint)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKUIAvailabilityTimelineView;
  -[EKUIAvailabilityTimelineView setContentOffset:](&v3, sel_setContentOffset_, a3.x, a3.y);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomPixelBorder, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end

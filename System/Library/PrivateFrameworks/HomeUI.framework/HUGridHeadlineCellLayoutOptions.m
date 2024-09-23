@implementation HUGridHeadlineCellLayoutOptions

- (double)cellInnerMargin
{
  _BOOL4 v2;
  double result;

  v2 = -[HUGridHeadlineCellLayoutOptions isEditing](self, "isEditing");
  result = 0.0;
  if (v2)
    return 14.0;
  return result;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3 viewSizeSubclass:(int64_t)a4 viewWidth:(double)a5 containerLeadingMargin:(double)a6 containerTrailingMargin:(double)a7
{
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[7];
  _QWORD v19[7];
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___HUGridHeadlineCellLayoutOptions;
  objc_msgSendSuper2(&v17, sel_defaultOptionsForCellSizeSubclass_);
  v12 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v12 + 160) = a4;
  *(double *)(v12 + 168) = a5;
  *(double *)(v12 + 176) = a6;
  *(double *)(v12 + 184) = a7;
  objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB580], 32770);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "setFont:", v13);

  objc_msgSend((id)v12, "setHeadlineBaselineOffset:", 15.0);
  v20[0] = &unk_1E7041A10;
  v20[1] = &unk_1E70419F8;
  v21[0] = &unk_1E7043778;
  v21[1] = &unk_1E7043788;
  v20[2] = &unk_1E7041A88;
  v20[3] = &unk_1E7041A40;
  v21[2] = &unk_1E7043798;
  v21[3] = &unk_1E7043788;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "setMinimumFontSize:", HUConstantForCellSizeSubclass(a3, v14));

  v18[0] = &unk_1E7041A10;
  v18[1] = &unk_1E70419F8;
  v19[0] = &unk_1E70437A8;
  v19[1] = &unk_1E70437B8;
  v18[2] = &unk_1E7041A40;
  v18[3] = &unk_1E7041AA0;
  v19[2] = &unk_1E70437C8;
  v19[3] = &unk_1E70437B8;
  v18[4] = &unk_1E7041A58;
  v18[5] = &unk_1E7041AB8;
  v19[4] = &unk_1E70437D8;
  v19[5] = &unk_1E70437E8;
  v18[6] = &unk_1E7041A70;
  v19[6] = &unk_1E70437B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "setEditingBackgroundHeight:", HUConstantFloatForViewSizeSubclass(a4, v15));

  return (id)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUGridHeadlineCellLayoutOptions;
  v4 = -[HUGridCellLayoutOptions copyWithZone:](&v9, sel_copyWithZone_, a3);
  v4[20] = -[HUGridHeadlineCellLayoutOptions viewSizeSubclass](self, "viewSizeSubclass");
  -[HUGridHeadlineCellLayoutOptions viewWidth](self, "viewWidth");
  v4[21] = v5;
  -[HUGridHeadlineCellLayoutOptions containerLeadingMargin](self, "containerLeadingMargin");
  v4[22] = v6;
  -[HUGridHeadlineCellLayoutOptions containerTrailingMargin](self, "containerTrailingMargin");
  v4[23] = v7;
  -[HUGridHeadlineCellLayoutOptions minimumFontSize](self, "minimumFontSize");
  objc_msgSend(v4, "setMinimumFontSize:");
  -[HUGridHeadlineCellLayoutOptions headlineBaselineOffset](self, "headlineBaselineOffset");
  objc_msgSend(v4, "setHeadlineBaselineOffset:");
  -[HUGridHeadlineCellLayoutOptions editingBackgroundHeight](self, "editingBackgroundHeight");
  objc_msgSend(v4, "setEditingBackgroundHeight:");
  return v4;
}

- (void)setMinimumFontSize:(double)a3
{
  self->_minimumFontSize = a3;
}

- (void)setHeadlineBaselineOffset:(double)a3
{
  self->_headlineBaselineOffset = a3;
}

- (void)setEditingBackgroundHeight:(double)a3
{
  self->_editingBackgroundHeight = a3;
}

- (double)viewWidth
{
  return self->_viewWidth;
}

- (int64_t)viewSizeSubclass
{
  return self->_viewSizeSubclass;
}

- (double)minimumFontSize
{
  return self->_minimumFontSize;
}

- (double)headlineBaselineOffset
{
  double headlineBaselineOffset;
  uint64_t v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  headlineBaselineOffset = self->_headlineBaselineOffset;
  if (-[HUGridHeadlineCellLayoutOptions isEditing](self, "isEditing"))
  {
    v4 = -[HUGridHeadlineCellLayoutOptions viewSizeSubclass](self, "viewSizeSubclass");
    v7[0] = &unk_1E7041A10;
    v7[1] = &unk_1E7041A40;
    v8[0] = &unk_1E70437F8;
    v8[1] = &unk_1E7043808;
    v7[2] = &unk_1E7041AA0;
    v7[3] = &unk_1E7041A58;
    v8[2] = &unk_1E7043748;
    v8[3] = &unk_1E7043778;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    headlineBaselineOffset = headlineBaselineOffset + HUConstantFloatForViewSizeSubclass(v4, v5);

  }
  return headlineBaselineOffset;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (double)editingBackgroundHeight
{
  return self->_editingBackgroundHeight;
}

- (double)containerTrailingMargin
{
  return self->_containerTrailingMargin;
}

- (double)containerLeadingMargin
{
  return self->_containerLeadingMargin;
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_defaultOptionsForCellSizeSubclass_viewSizeSubclass_viewWidth_containerLeadingMargin_containerTrailingMargin_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HUGridLayoutOptions.m"), 778, CFSTR("%s is unavailable; use %@ instead"),
    "+[HUGridHeadlineCellLayoutOptions defaultOptionsForCellSizeSubclass:]",
    v6);

  return 0;
}

- (double)editingBackgroundMinimumWidth
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = -[HUGridHeadlineCellLayoutOptions viewSizeSubclass](self, "viewSizeSubclass");
  -[HUGridHeadlineCellLayoutOptions viewWidth](self, "viewWidth");
  v5 = v4;
  if (v3 < 4)
  {
    -[HUGridHeadlineCellLayoutOptions containerLeadingMargin](self, "containerLeadingMargin");
    v6 = v5 - v8;
    -[HUGridHeadlineCellLayoutOptions containerTrailingMargin](self, "containerTrailingMargin");
  }
  else
  {
    v6 = v4 * 0.5;
    -[HUGridHeadlineCellLayoutOptions containerLeadingMargin](self, "containerLeadingMargin");
  }
  return v6 - v7;
}

@end

@implementation HUGridLimitedWidthViewLayoutOptions

+ (id)defaultOptionsForViewSize:(CGSize)a3 columnStyle:(unint64_t)a4 overrideSizeSubclass:(id)a5
{
  double width;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];
  _QWORD v15[4];

  width = a3.width;
  v15[3] = *MEMORY[0x1E0C80C00];
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___HUGridLimitedWidthViewLayoutOptions;
  objc_msgSendSuper2(&v13, sel_defaultOptionsForViewSize_columnStyle_overrideSizeSubclass_, a4, a5, a3.width, a3.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (width <= 500.0)
    v8 = 20.0;
  else
    v8 = (width + -500.0) * 0.5;
  v9 = objc_msgSend(v6, "viewSizeSubclass");
  v14[0] = &unk_1E7041A10;
  v14[1] = &unk_1E70419F8;
  v15[0] = &unk_1E70436E8;
  v15[1] = &unk_1E70436F8;
  v14[2] = &unk_1E7041A70;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSectionLeadingMargin:", HUConstantFloatForViewSizeSubclass(v9, v11));

  objc_msgSend(v7, "sectionLeadingMargin");
  objc_msgSend(v7, "setSectionTrailingMargin:");
  return v7;
}

@end

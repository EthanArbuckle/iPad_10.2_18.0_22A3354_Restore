@implementation ASCMiniProductPageTitleView

- (ASCMiniProductPageTitleView)initWithFrame:(CGRect)a3
{
  ASCMiniProductPageTitleView *v3;
  ASCAgeRatingView *v4;
  uint64_t v5;
  ASCAgeRatingView *ageRatingView;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ASCMiniProductPageTitleView;
  v3 = -[ASCMiniProductPageTitleView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [ASCAgeRatingView alloc];
    v5 = -[ASCAgeRatingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    ageRatingView = v3->_ageRatingView;
    v3->_ageRatingView = (ASCAgeRatingView *)v5;

    ASCAXIdentifierWithSuffix((uint64_t)CFSTR("Lockup.AgeRating"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAgeRatingView setAccessibilityIdentifier:](v3->_ageRatingView, "setAccessibilityIdentifier:", v7);

    v8 = *MEMORY[0x1E0DC49E8];
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    -[ASCMiniProductPageTitleView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], v9, v10, v11);
    -[ASCMiniProductPageTitleView setTextContainerInset:](v3, "setTextContainerInset:", v8, v9, v10, v11);
    -[ASCMiniProductPageTitleView setEditable:](v3, "setEditable:", 0);
    -[ASCMiniProductPageTitleView setSelectable:](v3, "setSelectable:", 0);
    -[ASCMiniProductPageTitleView setScrollEnabled:](v3, "setScrollEnabled:", 0);
    -[ASCMiniProductPageTitleView setBorderStyle:](v3, "setBorderStyle:", 0);
    -[ASCMiniProductPageTitleView textContainer](v3, "textContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLineFragmentPadding:", 0.0);

    -[ASCMiniProductPageTitleView textContainer](v3, "textContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLineBreakMode:", 4);

    -[ASCMiniProductPageTitleView textContainer](v3, "textContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWidthTracksTextView:", 1);

    -[ASCMiniProductPageTitleView textContainer](v3, "textContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHeightTracksTextView:", 1);

    -[ASCMiniProductPageTitleView addSubview:](v3, "addSubview:", v3->_ageRatingView);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  double v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ASCMiniProductPageTitleView textContainer](self, "textContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSize:", width, height);

  -[ASCMiniProductPageTitleView textContainer](self, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExclusionPaths:", MEMORY[0x1E0C9AA60]);

  v27.receiver = self;
  v27.super_class = (Class)ASCMiniProductPageTitleView;
  -[ASCSkeletonTextView sizeThatFits:](&v27, sel_sizeThatFits_, width, height);
  v9 = v8;
  v11 = v10;
  -[ASCMiniProductPageTitleView ageRatingView](self, "ageRatingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeThatFits:", width, height);
  v14 = v13;

  -[ASCMiniProductPageTitleView lastLineFrame](self, "lastLineFrame");
  v16 = v15;
  v17 = -[ASCMiniProductPageTitleView displayedNumberOfLines](self, "displayedNumberOfLines");
  v18 = v14 + 6.0;
  if (width - v16 >= v18)
  {
    if (v18 + v16 >= v9)
      v9 = v18 + v16;
  }
  else
  {
    v19 = v17;
    -[ASCMiniProductPageTitleView textContainer](self, "textContainer", width - v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 < objc_msgSend(v20, "maximumNumberOfLines"))
    {

LABEL_11:
      -[ASCMiniProductPageTitleView font](self, "font");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lineHeight");
      v11 = v11 + v24;

      goto LABEL_12;
    }
    -[ASCMiniProductPageTitleView textContainer](self, "textContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "maximumNumberOfLines");

    if (!v22)
      goto LABEL_11;
    if (v18 + v16 < v9)
      v9 = v18 + v16;
  }
LABEL_12:
  v25 = v9;
  v26 = v11;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  objc_super v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)ASCMiniProductPageTitleView;
  -[ASCMiniProductPageTitleView layoutSubviews](&v50, sel_layoutSubviews);
  -[ASCMiniProductPageTitleView textContainer](self, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExclusionPaths:", MEMORY[0x1E0C9AA60]);

  -[ASCMiniProductPageTitleView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  -[ASCMiniProductPageTitleView ageRatingView](self, "ageRatingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", v5, v7);
  v10 = v9;
  v12 = v11;

  -[ASCMiniProductPageTitleView lastLineFrame](self, "lastLineFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = -[ASCMiniProductPageTitleView displayedNumberOfLines](self, "displayedNumberOfLines");
  v22 = v10 + 6.0;
  if (v5 - v18 < v10 + 6.0)
  {
    v49 = v10;
    v23 = (double)v21;
    -[ASCMiniProductPageTitleView textContainer](self, "textContainer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 < (double)(unint64_t)objc_msgSend(v24, "maximumNumberOfLines"))
    {

    }
    else
    {
      -[ASCMiniProductPageTitleView textContainer](self, "textContainer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "maximumNumberOfLines");

      if (v26)
      {
        -[ASCMiniProductPageTitleView bounds](self, "bounds");
        +[__ASCLayoutProxy rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:", self, v5 - v22, v16, v22, v20, v27, v28, v29, v30);
        objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v31;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCMiniProductPageTitleView textContainer](self, "textContainer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setExclusionPaths:", v32);

        -[ASCMiniProductPageTitleView lastLineFrame](self, "lastLineFrame");
        v14 = v34;
        v16 = v35;
        v18 = v36;
        v20 = v37;
        v38 = v34 + v36 + 6.0;
        v39 = v35 + (v37 - v12) * 0.5;

LABEL_8:
        v10 = v49;
        goto LABEL_9;
      }
    }
    v39 = v16 + v20 + (v20 - v12) * 0.5;
    v38 = 0.0;
    goto LABEL_8;
  }
  v38 = v14 + v18 + 6.0;
  v39 = v16 + (v20 - v12) * 0.5;
LABEL_9:
  +[__ASCLayoutProxy rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:", self, v38, v39, v10, v12, v14, v16, v18, v20);
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  -[ASCMiniProductPageTitleView ageRatingView](self, "ageRatingView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

}

- (CGRect)lastLineFrame
{
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[5];
  uint64_t v16;
  double *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  CGRect result;

  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x4010000000;
  v19 = &unk_1BCC16697;
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v20 = *MEMORY[0x1E0C9D648];
  v21 = v3;
  -[ASCMiniProductPageTitleView textLayoutManager](self, "textLayoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPageTitleView textLayoutManager](self, "textLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__ASCMiniProductPageTitleView_lastLineFrame__block_invoke;
  v15[3] = &unk_1E7561338;
  v15[4] = &v16;
  objc_msgSend(v4, "enumerateTextSegmentsInRange:type:options:usingBlock:", v6, 0, 1, v15);

  v7 = v17[4];
  v8 = v17[5];
  v9 = v17[6];
  v10 = v17[7];
  _Block_object_dispose(&v16, 8);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

uint64_t __44__ASCMiniProductPageTitleView_lastLineFrame__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double *v5;

  v5 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return 1;
}

- (unint64_t)displayedNumberOfLines
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[ASCMiniProductPageTitleView textLayoutManager](self, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPageTitleView textLayoutManager](self, "textLayoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__ASCMiniProductPageTitleView_displayedNumberOfLines__block_invoke;
  v8[3] = &unk_1E7561338;
  v8[4] = &v9;
  objc_msgSend(v3, "enumerateTextSegmentsInRange:type:options:usingBlock:", v5, 0, 1, v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __53__ASCMiniProductPageTitleView_displayedNumberOfLines__block_invoke(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 1;
}

- (ASCAgeRatingView)ageRatingView
{
  return self->_ageRatingView;
}

- (void)setAgeRatingView:(id)a3
{
  objc_storeStrong((id *)&self->_ageRatingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ageRatingView, 0);
}

@end

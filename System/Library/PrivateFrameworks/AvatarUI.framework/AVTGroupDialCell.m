@implementation AVTGroupDialCell

+ (id)cellIdentifier
{
  return CFSTR("AVTGroupDialCell");
}

+ (id)labelFont
{
  return +[AVTUIFontRepository groupDialLabelFont](AVTUIFontRepository, "groupDialLabelFont");
}

+ (id)boldLabelFont
{
  return +[AVTUIFontRepository groupDialBoldLabelFont](AVTUIFontRepository, "groupDialBoldLabelFont");
}

- (AVTGroupDialCell)initWithFrame:(CGRect)a3
{
  AVTGroupDialCell *v3;
  id v4;
  uint64_t v5;
  UILabel *label;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVTGroupDialCell;
  v3 = -[AVTGroupDialCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    -[AVTGroupDialCell bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    objc_msgSend((id)objc_opt_class(), "labelFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v7);

    +[AVTUIColorRepository groupDialCellTextColor](AVTUIColorRepository, "groupDialCellTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v8);

    -[UILabel setAutoresizingMask:](v3->_label, "setAutoresizingMask:", 18);
    -[AVTGroupDialCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_label);

  }
  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTGroupDialCell;
  -[AVTGroupDialCell prepareForReuse](&v9, sel_prepareForReuse);
  objc_msgSend((id)objc_opt_class(), "labelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTGroupDialCell label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  +[AVTUIColorRepository groupDialCellTextColor](AVTUIColorRepository, "groupDialCellTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTGroupDialCell label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  -[AVTGroupDialCell label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllAnimations");

  -[AVTGroupDialCell cancelShimmerTimer](self, "cancelShimmerTimer");
}

- (void)setString:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_string, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_string, a3);
    -[AVTGroupDialCell label](self, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

  }
}

- (void)setActiveItem:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  _QWORD v12[5];
  BOOL v13;

  v4 = a4;
  -[AVTGroupDialCell cancelShimmerTimer](self, "cancelShimmerTimer");
  -[AVTGroupDialCell label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllAnimations");

  v9 = (void *)MEMORY[0x1E0CEABB0];
  -[AVTGroupDialCell label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0.2;
  if (!v4)
    v11 = 0.0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__AVTGroupDialCell_setActiveItem_animated___block_invoke;
  v12[3] = &unk_1EA51E268;
  v12[4] = self;
  v13 = a3;
  objc_msgSend(v9, "transitionWithView:duration:options:animations:completion:", v10, 5242880, v12, 0, v11);

}

void __43__AVTGroupDialCell_setActiveItem_animated___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = (void *)objc_opt_class();
  if (v2)
    objc_msgSend(v3, "boldLabelFont");
  else
    objc_msgSend(v3, "labelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  if (*(_BYTE *)(a1 + 40))
    +[AVTUIColorRepository groupDialCellSelectedTextColor](AVTUIColorRepository, "groupDialCellSelectedTextColor");
  else
    +[AVTUIColorRepository groupDialCellTextColor](AVTUIColorRepository, "groupDialCellTextColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

}

- (void)stopShimmeringAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = a3;
  -[AVTGroupDialCell cancelShimmerTimer](self, "cancelShimmerTimer");
  v5 = (void *)MEMORY[0x1E0CEABB0];
  -[AVTGroupDialCell label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0.0;
  if (v3)
    v7 = 1.0;
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__AVTGroupDialCell_stopShimmeringAnimated___block_invoke;
  v9[3] = &unk_1EA51D188;
  v9[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__AVTGroupDialCell_stopShimmeringAnimated___block_invoke_2;
  v8[3] = &unk_1EA51D250;
  objc_msgSend(v5, "transitionWithView:duration:options:animations:completion:", v6, 5242884, v9, v8, v7);

}

void __43__AVTGroupDialCell_stopShimmeringAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[AVTUIColorRepository groupDialCellTextColor](AVTUIColorRepository, "groupDialCellTextColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v3);

}

void __43__AVTGroupDialCell_stopShimmeringAnimated___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "label");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllAnimations");

}

- (void)startShimmering
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[AVTGroupDialCell cancelShimmerTimer](self, "cancelShimmerTimer");
  -[AVTGroupDialCell label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__AVTGroupDialCell_startShimmering__block_invoke;
  v5[3] = &unk_1EA51D250;
  v5[4] = self;
  -[AVTGroupDialCell shimmerOnceWithCompletion:](self, "shimmerOnceWithCompletion:", v5);
}

uint64_t __35__AVTGroupDialCell_startShimmering__block_invoke(uint64_t result, int a2)
{
  void *v2;
  _QWORD v3[5];

  if (a2)
  {
    v2 = *(void **)(result + 32);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __35__AVTGroupDialCell_startShimmering__block_invoke_2;
    v3[3] = &unk_1EA51D250;
    v3[4] = v2;
    return objc_msgSend(v2, "shimmerOnceWithCompletion:", v3);
  }
  return result;
}

uint64_t __35__AVTGroupDialCell_startShimmering__block_invoke_2(uint64_t result, int a2)
{
  void *v2;
  _QWORD v3[5];

  if (a2)
  {
    v2 = *(void **)(result + 32);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __35__AVTGroupDialCell_startShimmering__block_invoke_3;
    v3[3] = &unk_1EA51D250;
    v3[4] = v2;
    return objc_msgSend(v2, "shimmerOnceWithCompletion:", v3);
  }
  return result;
}

void __35__AVTGroupDialCell_startShimmering__block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  if (a2)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v3 = (void *)MEMORY[0x1E0C99E88];
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __35__AVTGroupDialCell_startShimmering__block_invoke_4;
    v8 = &unk_1EA51E290;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v5, 8.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setShimmerTimer:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __35__AVTGroupDialCell_startShimmering__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "startShimmering");

}

- (void)cancelShimmerTimer
{
  void *v3;

  -[AVTGroupDialCell shimmerTimer](self, "shimmerTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[AVTGroupDialCell setShimmerTimer:](self, "setShimmerTimer:", 0);
}

- (void)shimmerOnceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CEABB0];
  -[AVTGroupDialCell label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__AVTGroupDialCell_shimmerOnceWithCompletion___block_invoke;
  v10[3] = &unk_1EA51D188;
  v10[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__AVTGroupDialCell_shimmerOnceWithCompletion___block_invoke_2;
  v8[3] = &unk_1EA51E2B8;
  v8[4] = self;
  v7 = v4;
  objc_msgSend(v5, "transitionWithView:duration:options:animations:completion:", v6, 5242884, v10, v8, 1.0);

}

void __46__AVTGroupDialCell_shimmerOnceWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[AVTUIColorRepository groupDialCellShimmeringTextColor](AVTUIColorRepository, "groupDialCellShimmeringTextColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v3);

}

void __46__AVTGroupDialCell_shimmerOnceWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0CEABB0];
    objc_msgSend(*(id *)(a1 + 32), "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__AVTGroupDialCell_shimmerOnceWithCompletion___block_invoke_3;
    v6[3] = &unk_1EA51D188;
    v5 = *(_QWORD *)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "transitionWithView:duration:options:animations:completion:", v4, 5242884, v6, v5, 1.0);

  }
}

void __46__AVTGroupDialCell_shimmerOnceWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  +[AVTUIColorRepository groupDialCellTextColor](AVTUIColorRepository, "groupDialCellTextColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v3);

}

- (NSString)string
{
  return self->_string;
}

- (UILabel)label
{
  return self->_label;
}

- (NSTimer)shimmerTimer
{
  return self->_shimmerTimer;
}

- (void)setShimmerTimer:(id)a3
{
  objc_storeStrong((id *)&self->_shimmerTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shimmerTimer, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end

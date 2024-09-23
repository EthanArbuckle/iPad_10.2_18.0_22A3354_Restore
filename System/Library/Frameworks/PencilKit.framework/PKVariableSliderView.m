@implementation PKVariableSliderView

- (_QWORD)_stringFromNumber:(_QWORD *)a1
{
  _QWORD *v2;
  id v4;
  void *v5;

  v2 = a1;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v4, "setNumberStyle:", 1);
    objc_msgSend(v4, "setMinimumFractionDigits:", v2[59]);
    objc_msgSend(v4, "setMaximumFractionDigits:", v2[59]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromNumber:", v5);
    v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)setupViewsIfNecessary
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  float v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 432))
    {
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 7);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v2);
      objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v3, "_setContinuousCornerRadius:", 8.0);
      objc_msgSend(v3, "setClipsToBounds:", 1);
      v4 = *(void **)(a1 + 432);
      *(_QWORD *)(a1 + 432) = v3;
      v5 = v3;

      objc_msgSend((id)a1, "addSubview:", *(_QWORD *)(a1 + 432));
    }
    if (!*(_QWORD *)(a1 + 416))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0DC3C80]);
      v7 = *(void **)(a1 + 416);
      *(_QWORD *)(a1 + 416) = v6;

      objc_msgSend(*(id *)(a1 + 416), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(*(id *)(a1 + 416), "addTarget:action:forControlEvents:", a1, sel_sliderValueChanged, 4096);
      objc_msgSend((id)a1, "addSubview:", *(_QWORD *)(a1 + 416));
      v8 = *(double *)(a1 + 480);
      if (v8 >= 0.0)
        v9 = *(double *)(a1 + 480);
      else
        v9 = -v8;
      v10 = __exp10(1.0);
      if (v9 > v10)
      {
        v11 = 1.0;
        do
        {
          v11 = v11 + 1.0;
          v12 = __exp10(v11);
        }
        while (v9 > v12);
        v10 = v12;
      }
      v13 = *(double *)(a1 + 480);
      if (v13 >= 0.0)
      {
        v17 = fmax(v13 + v10 * -0.5, 0.0);
        *(float *)&v17 = v17;
        objc_msgSend(*(id *)(a1 + 416), "setMinimumValue:", v17);
        objc_msgSend(*(id *)(a1 + 416), "minimumValue");
        v19 = v10 + v18;
        *(float *)&v19 = v19;
        objc_msgSend(*(id *)(a1 + 416), "setMaximumValue:", v19);
      }
      else
      {
        v14 = v10 + v13;
        if (v14 > -0.000001)
          v14 = -0.000001;
        *(float *)&v14 = v14;
        objc_msgSend(*(id *)(a1 + 416), "setMaximumValue:", v14);
        objc_msgSend(*(id *)(a1 + 416), "maximumValue");
        v16 = v15 - v10;
        *(float *)&v16 = v16;
        objc_msgSend(*(id *)(a1 + 416), "setMinimumValue:", v16);
      }
      v20 = *(double *)(a1 + 480);
      *(float *)&v20 = v20;
      objc_msgSend(*(id *)(a1 + 416), "setValue:", v20);
    }
    if (!*(_QWORD *)(a1 + 424))
    {
      v21 = objc_alloc_init(MEMORY[0x1E0DC3990]);
      v22 = *(void **)(a1 + 424);
      *(_QWORD *)(a1 + 424) = v21;

      objc_msgSend(*(id *)(a1 + 424), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PKVariableSliderView _stringFromNumber:]((_QWORD *)a1, *(double *)(a1 + 480));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 424), "setText:", v23);

      objc_msgSend((id)a1, "addSubview:", *(_QWORD *)(a1 + 424));
    }
  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double MaxY;
  double MidX;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;

  -[PKVariableSliderView setupViewsIfNecessary]((uint64_t)self);
  -[PKVariableSliderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:");
  -[UISlider intrinsicContentSize](self->_slider, "intrinsicContentSize");
  v12 = v11;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  MaxY = CGRectGetMaxY(v17);
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  MidX = CGRectGetMidX(v18);
  -[UISlider setFrame:](self->_slider, "setFrame:", 8.0, MaxY - (v12 + 8.0), v8 + -16.0, v12);
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v8, v10);
  -[UILabel setFrame:](self->_label, "setFrame:", MidX + v15 * -0.5, 8.0, v15, v16);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[PKVariableSliderView setupViewsIfNecessary]((uint64_t)self);
  -[UISlider intrinsicContentSize](self->_slider, "intrinsicContentSize");
  v4 = v3;
  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  v6 = v4 + v5 + 24.0;
  v7 = 216.0;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)sliderValueChanged
{
  float v3;
  double v4;
  void *v5;
  char v6;
  id v7;

  -[UISlider value](self->_slider, "value");
  v4 = v3;
  -[PKVariableSliderView _stringFromNumber:](self, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel text](self->_label, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    self->_valueToSend = v4;
    -[UILabel setText:](self->_label, "setText:", v7);
    -[PKVariableSliderView setNeedsLayout](self, "setNeedsLayout");
    if (CACurrentMediaTime() - self->_lastSentTimestamp >= 0.05)
      -[PKVariableSliderView sendValueChanged](self, "sendValueChanged");
    else
      -[PKVariableSliderView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_sendValueChanged, 0);
  }

}

- (void)sendValueChanged
{
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_sendValueChanged, 0);
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "variableSliderView:valueDidChange:", self, self->_valueToSend);

  self->_lastSentTimestamp = CACurrentMediaTime();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_slider, 0);
}

@end

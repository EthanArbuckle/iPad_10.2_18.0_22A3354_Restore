@implementation CDRichComplicationView

- (CDRichComplicationView)initWithFamily:(int64_t)a3
{
  CDRichComplicationView *v4;
  void *v5;
  uint64_t v6;
  CLKDevice *device;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CDRichComplicationView;
  v4 = -[CDRichComplicationView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDB8780], "sharedRenderingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v6 = objc_claimAutoreleasedReturnValue();
    device = v4->_device;
    v4->_device = (CLKDevice *)v6;

    v4->_family = a3;
    v4->_paused = 1;
    -[CDRichComplicationView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[CDRichComplicationView _applyPausedUpdate](self, "_applyPausedUpdate");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CDRichComplicationView;
  -[CDRichComplicationView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CDRichComplicationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setWhistlerAnalogEditingAlphaTransitonFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5
{
  double v6;
  double v7;
  double v8;

  if (a5 == 1)
  {
    CLKCompressFraction();
    v6 = v8;
  }
  else
  {
    v6 = 0.0;
    if (!a5)
    {
      CLKCompressFraction();
      v6 = 1.0 - v7;
    }
  }
  -[CDRichComplicationView setAlpha:](self, "setAlpha:", a4, v6);
}

- (int64_t)tritiumUpdateMode
{
  return 2;
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__CDRichComplicationView_setTimeTravelDate_animated___block_invoke;
  v8[3] = &unk_24CF21628;
  v9 = v6;
  v7 = v6;
  -[CDRichComplicationView _enumerateLabelsWithBlock:](self, "_enumerateLabelsWithBlock:", v8);

}

uint64_t __53__CDRichComplicationView_setTimeTravelDate_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInTimeTravel:", *(_QWORD *)(a1 + 32) != 0);
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    if (!a3)
    {
      -[CDRichComplicationView setAlpha:](self, "setAlpha:", 1.0);
      -[CDRichComplicationView _editingDidEnd](self, "_editingDidEnd");
      -[CDRichComplicationView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (NSDate)complicationDate
{
  NSDate *timeTravelDate;

  timeTravelDate = self->_timeTravelDate;
  if (timeTravelDate)
    return timeTravelDate;
  objc_msgSend(MEMORY[0x24BDB8720], "complicationDate");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)timeTravelDate
{
  return self->_timeTravelDate;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  void *v6;
  void *v7;

  -[CDRichComplicationView filterProvider](self, "filterProvider", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filtersForView:style:", self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  void *v8;
  void *v9;

  -[CDRichComplicationView filterProvider](self, "filterProvider", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filtersForView:style:fraction:", self, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  void *v8;
  void *v9;

  -[CDRichComplicationView filterProvider](self, "filterProvider", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterForView:style:fraction:", self, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  void *v6;
  void *v7;

  -[CDRichComplicationView filterProvider](self, "filterProvider", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filterForView:style:", self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorForView:accented:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)interpolatedColorForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interpolatedColorForView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)backgroundColorForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColorForView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)viewShouldIgnoreTwoPieceImage:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  -[CDRichComplicationView filterProvider](self, "filterProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "viewShouldIgnoreTwoPieceImage:", self);

  return v7;
}

- (void)setFontStyle:(int64_t)a3
{
  BOOL v4;
  void *v5;
  uint64_t v6;
  id v7;
  BOOL v8[8];
  id v9;
  uint64_t v10;

  if (self->_fontStyle != a3)
  {
    self->_fontStyle = a3;
    if (a3 == 3)
    {
      CDRichComplicationSemiboldFontDescriptor();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 2)
      {
        v4 = a3 == 1;
        v5 = 0;
        v6 = 0;
LABEL_8:
        v8[0] = v4;
        v7 = v5;
        v9 = v7;
        v10 = v6;
        -[CDRichComplicationView _setFontConfiguration:](self, "_setFontConfiguration:", v8);

        return;
      }
      CDRichComplicationMonoFontDescriptor();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = 0;
    v6 = 0x3FF0000000000000;
    goto LABEL_8;
  }
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  objc_storeStrong((id *)&self->_fontDescriptor, a3->var1);
  self->_fontSizeFactor = a3->var2;

}

- (void)_updateColoringLabel:(id)a3 withFontDescriptor:(id)a4 andSizeFactor:(double)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pointSize");
  -[CDRichComplicationView _fontWithSize:withFontDescriptor:](self, "_fontWithSize:withFontDescriptor:", v8, v11 * a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFont:", v12);
  -[CDRichComplicationView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_fontWithSize:(double)a3 withFontDescriptor:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDB8748], "fontWithDescriptor:size:", a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CLKFontWithAlternativePunctuation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (CDComplicationDisplayObserver)displayObserver
{
  return (CDComplicationDisplayObserver *)objc_loadWeakRetained((id *)&self->displayObserver);
}

- (void)setDisplayObserver:(id)a3
{
  objc_storeWeak((id *)&self->displayObserver, a3);
}

- (unint64_t)textLayoutStyle
{
  return self->textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->textLayoutStyle = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (int64_t)family
{
  return self->_family;
}

- (BOOL)paused
{
  return self->_paused;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundColor, a3);
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
}

- (UIFontDescriptor)fontDescriptor
{
  return self->_fontDescriptor;
}

- (double)fontSizeFactor
{
  return self->_fontSizeFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontDescriptor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->displayObserver);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
}

@end

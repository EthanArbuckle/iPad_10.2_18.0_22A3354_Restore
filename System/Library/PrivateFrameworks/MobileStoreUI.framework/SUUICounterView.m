@implementation SUUICounterView

- (void)dealloc
{
  NSObject *updateTimer;
  objc_super v4;

  updateTimer = self->_updateTimer;
  if (updateTimer)
    dispatch_source_cancel(updateTimer);
  v4.receiver = self;
  v4.super_class = (Class)SUUICounterView;
  -[SUUIViewReuseView dealloc](&v4, sel_dealloc);
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  void *v8;
  char v9;

  v7 = a5;
  objc_msgSend(a3, "backgroundImageElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = objc_msgSend(v7, "prefetchResourcesForViewElement:reason:", v8, a4);
  else
    v9 = 0;

  return v9;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v5 = a4;
  objc_msgSend(a3, "backgroundImageElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "sizeForImageElement:", v6);
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v8 = *MEMORY[0x24BDBF148];
    v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  SUUICounterViewElement *v8;
  id v9;
  NSNumberFormatter *numberFormatter;
  id v11;
  uint64_t v12;
  int *v13;
  SUUICounterViewElement *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  SUUICounterViewElement *v20;
  SUUICounterView *v21;
  id v22;

  v8 = (SUUICounterViewElement *)a3;
  v9 = a5;
  if (self->_counterElement != v8)
  {
    -[SUUICounterView _stopUpdateTimer](self, "_stopUpdateTimer");
    objc_storeStrong((id *)&self->_counterElement, a3);
    numberFormatter = self->_numberFormatter;
    self->_numberFormatter = 0;

  }
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __55__SUUICounterView_reloadWithViewElement_width_context___block_invoke;
  v19 = &unk_2511F6630;
  v14 = v8;
  v20 = v14;
  v21 = self;
  v11 = v9;
  v22 = v11;
  -[SUUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", &v16);
  v12 = -[SUUICounterViewElement counterType](v14, "counterType");
  if (!v12)
  {
    -[SUUICounterView _addTimeViewWithViewElement:context:](self, "_addTimeViewWithViewElement:context:", v14, v11);
    v13 = &OBJC_IVAR___SUUICounterView__numberView;
    goto LABEL_7;
  }
  if (v12 == 1)
  {
    -[SUUICounterView _addNumberViewWithViewElement:context:](self, "_addNumberViewWithViewElement:context:", v14, v11);
    v13 = &OBJC_IVAR___SUUICounterView__timeView;
LABEL_7:
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v13), "setHidden:", 1, v14, v16, v17, v18, v19, v20, v21);
  }
  -[SUUICounterView _reloadUpdateTimer](self, "_reloadUpdateTimer", v14);

}

void __55__SUUICounterView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "backgroundImageElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v5, "addImageViewWithElement:context:", v3, *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 472), v4);
  if (v3)

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUICounterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SUUICounterViewElement backgroundImageElement](self->_counterElement, "backgroundImageElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    && (v12 = objc_msgSend(v9, "requestIdentifier"),
        objc_msgSend(v10, "requestIdentifierForViewElement:", v11),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "unsignedIntegerValue"),
        v13,
        v12 == v14))
  {
    -[SUUIImageView setImage:](self->_imageView, "setImage:", v8);
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUICounterView;
  -[SUUICounterView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SUUICounterView _reloadUpdateTimer](self, "_reloadUpdateTimer");
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUICounterView;
  -[SUUICounterView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[SUUICounterView _reloadUpdateTimer](self, "_reloadUpdateTimer");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SUUIImageView *imageView;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  SUUICounterTimeView *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  double v24;
  double v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  float v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  unsigned __int8 v42;
  CGRect v43;

  -[SUUICounterView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v9 = v3;
  v10 = v4;
  imageView = self->_imageView;
  if (imageView)
  {
    v12 = v3 - self->_contentInset.left - self->_contentInset.right;
    v13 = v4 - self->_contentInset.bottom - self->_contentInset.top;
    -[SUUIImageView frame](imageView, "frame");
    -[SUUIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v9, v10);
    SUUIImageRectForBounds(0, v14, v15, v6, v8, v9, v10);
    v9 = v16;
    v10 = v17;
    v18 = self->_contentInset.left + (v12 - v16) * 0.5;
    v6 = floorf(v18);
    v19 = self->_contentInset.top + (v13 - v17) * 0.5;
    v8 = floorf(v19);
    -[SUUIImageView setFrame:](self->_imageView, "setFrame:", v6, v8, v16, v17);
  }
  v20 = self->_timeView;
  v21 = v20;
  if (v20 && !-[SUUICounterTimeView isHidden](v20, "isHidden")
    || (v22 = self->_numberView, v21, (v21 = v22) != 0))
  {
    if ((objc_msgSend(v21, "isHidden") & 1) == 0)
    {
      -[SUUICounterViewElement style](self->_counterElement, "style");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v24 = SUUIViewElementPaddingForStyle(v23, (char *)&v42);
      v40 = v25;
      v41 = v24;
      v26 = v42;
      objc_msgSend(v21, "frame");
      v28 = v27;
      objc_msgSend(v21, "sizeThatFits:", v9, v10);
      v30 = v29;
      v32 = v31;
      *(float *)&v29 = v6 + (v9 - v29) * 0.5;
      v33 = floorf(*(float *)&v29);
      v34 = objc_msgSend(v23, "elementPosition");
      if (v34 <= 9)
      {
        if (((1 << v34) & 0x309) != 0)
        {
          if (v26)
            v39 = v40;
          else
            v39 = 4.0;
          v43.origin.x = v6;
          v43.origin.y = v8;
          v43.size.width = v9;
          v43.size.height = v10;
          v28 = CGRectGetMaxY(v43) - v32 - v39;
        }
        else
        {
          v35 = v8 + (v10 - v32) * 0.5;
          v36 = floorf(v35);
          v37 = 4.0;
          if (v26)
            v37 = v41;
          v38 = v8 + v37;
          if (((1 << v34) & 0x32) != 0)
            v28 = v36;
          else
            v28 = v38;
        }
      }
      objc_msgSend(v21, "setFrame:", v33, v28, v30, v32);

    }
  }
  -[SUUICounterView _reloadUpdateTimer](self, "_reloadUpdateTimer");

}

- (void)setAlpha:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUICounterView;
  -[SUUICounterView setAlpha:](&v4, sel_setAlpha_, a3);
  -[SUUICounterView _reloadUpdateTimer](self, "_reloadUpdateTimer");
}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUICounterView;
  -[SUUICounterView setHidden:](&v4, sel_setHidden_, a3);
  -[SUUICounterView _reloadUpdateTimer](self, "_reloadUpdateTimer");
}

- (void)_addNumberViewWithViewElement:(id)a3 context:(id)a4
{
  id v6;
  UILabel *v7;
  UILabel *numberView;
  UILabel *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (!self->_numberView)
  {
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    numberView = self->_numberView;
    self->_numberView = v7;

    v9 = self->_numberView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[UILabel setTextAlignment:](self->_numberView, "setTextAlignment:", 1);
  }
  objc_msgSend(v16, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_numberView;
  SUUIViewElementFontWithStyle(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v12, "setFont:", v13);

  objc_msgSend(v6, "tintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setTextColor:](self->_numberView, "setTextColor:", v15);
  -[UILabel setHidden:](self->_numberView, "setHidden:", 0);
  -[SUUICounterView addSubview:](self, "addSubview:", self->_numberView);
  -[SUUICounterView _reloadNumberValue](self, "_reloadNumberValue");

}

- (void)_addTimeViewWithViewElement:(id)a3 context:(id)a4
{
  id v6;
  SUUICounterTimeView *v7;
  void *v8;
  SUUICounterTimeView *v9;
  SUUICounterTimeView *timeView;
  SUUICounterTimeView *v11;
  void *v12;
  void *v13;
  SUUICounterTimeView *v14;
  void *v15;
  void *v16;
  void *v17;
  SUUICounterTimeView *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  if (!self->_timeView)
  {
    v7 = [SUUICounterTimeView alloc];
    objc_msgSend(v6, "clientContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SUUICounterTimeView initWithClientContext:](v7, "initWithClientContext:", v8);
    timeView = self->_timeView;
    self->_timeView = v9;

    v11 = self->_timeView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICounterTimeView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  }
  objc_msgSend(v20, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self->_timeView;
  objc_msgSend(v20, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICounterTimeView setEndDate:](v14, "setEndDate:", v15);

  objc_msgSend(v6, "tintColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUICounterTimeView setTextColor:](self->_timeView, "setTextColor:", v17);
  v18 = self->_timeView;
  SUUIViewElementFontWithStyle(v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICounterTimeView setValueFont:](v18, "setValueFont:", v19);

  -[SUUICounterTimeView setVisibleFields:](self->_timeView, "setVisibleFields:", -[SUUICounterView _visibleTimeFieldsForDateFormat:](self, "_visibleTimeFieldsForDateFormat:", objc_msgSend(v20, "dateFormatType")));
  -[SUUICounterTimeView setHidden:](self->_timeView, "setHidden:", 0);
  -[SUUICounterView addSubview:](self, "addSubview:", self->_timeView);

}

- (void)_reloadNumberValue
{
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v4;
  NSNumberFormatter *v5;
  NSNumberFormatter *v6;
  void *v7;
  UILabel *numberView;
  void *v9;
  id v10;

  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    -[NSNumberFormatter setNumberStyle:](self->_numberFormatter, "setNumberStyle:", 1);
    v6 = self->_numberFormatter;
    -[SUUICounterViewElement numberFormat](self->_counterElement, "numberFormat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setPositiveFormat:](v6, "setPositiveFormat:", v7);

    numberFormatter = self->_numberFormatter;
  }
  numberView = self->_numberView;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[SUUICounterViewElement currentNumberValue](self->_counterElement, "currentNumberValue"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](numberView, "setText:", v9);

}

- (void)_reloadUpdateTimer
{
  double v3;
  void *v4;

  if ((-[SUUICounterView isHidden](self, "isHidden") & 1) != 0
    || (-[SUUICounterView alpha](self, "alpha"), v3 < 0.00000011920929)
    || (-[SUUICounterView window](self, "window"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    -[SUUICounterView _stopUpdateTimer](self, "_stopUpdateTimer");
  }
  else
  {
    -[SUUICounterView _startUpdateTimer](self, "_startUpdateTimer");
  }
}

- (void)_startUpdateTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *updateTimer;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  unint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id location;

  if (!self->_updateTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    updateTimer = self->_updateTimer;
    self->_updateTimer = v3;

    if (-[SUUICounterViewElement counterType](self->_counterElement, "counterType") == 1)
    {
      -[SUUICounterViewElement changeRatePerSecond](self->_counterElement, "changeRatePerSecond");
      v6 = 1.0 / v5;
      v7 = v6 * 1000000000.0;
      v8 = v6 <= 0.333333333;
      v9 = 333333333.0;
      if (!v8)
        v9 = v7;
      v10 = (unint64_t)v9;
    }
    else
    {
      v10 = 1000000000;
    }
    v11 = self->_updateTimer;
    v12 = dispatch_time(0, v10);
    dispatch_source_set_timer(v11, v12, v10, 0);
    objc_initWeak(&location, self);
    v13 = self->_updateTimer;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __36__SUUICounterView__startUpdateTimer__block_invoke;
    v14[3] = &unk_2511F53F8;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v13, v14);
    dispatch_resume((dispatch_object_t)self->_updateTimer);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __36__SUUICounterView__startUpdateTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateTimerAction");

}

- (void)_stopUpdateTimer
{
  NSObject *updateTimer;
  OS_dispatch_source *v4;

  updateTimer = self->_updateTimer;
  if (updateTimer)
  {
    dispatch_source_cancel(updateTimer);
    v4 = self->_updateTimer;
    self->_updateTimer = 0;

  }
}

- (void)_updateTimerAction
{
  SUUICounterTimeView *timeView;
  UILabel *numberView;

  timeView = self->_timeView;
  if (timeView && (-[SUUICounterTimeView isHidden](timeView, "isHidden") & 1) == 0)
    -[SUUICounterTimeView reloadTimeValue](self->_timeView, "reloadTimeValue");
  numberView = self->_numberView;
  if (numberView)
  {
    if ((-[UILabel isHidden](numberView, "isHidden") & 1) == 0)
      -[SUUICounterView _reloadNumberValue](self, "_reloadNumberValue");
  }
}

- (unint64_t)_visibleTimeFieldsForDateFormat:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 7;
  else
    return qword_241EFC018[a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_numberView, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_counterElement, 0);
}

@end

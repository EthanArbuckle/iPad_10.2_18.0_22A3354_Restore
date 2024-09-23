@implementation MUPDFPageLabelView

- (MUPDFPageLabelView)initWithFrame:(CGRect)a3
{
  MUPDFPageLabelView *v3;
  uint64_t v4;
  UIBlurEffect *blurEffect;
  uint64_t v6;
  UIVisualEffectView *blurView;
  uint64_t v8;
  UILabel *label;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;
  _QWORD v43[10];

  v43[8] = *MEMORY[0x24BDAC8D0];
  v42.receiver = self;
  v42.super_class = (Class)MUPDFPageLabelView;
  v3 = -[MUPDFPageLabelView initWithFrame:](&v42, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    blurEffect = v3->_blurEffect;
    v3->_blurEffect = (UIBlurEffect *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", 0);
    blurView = v3->_blurView;
    v3->_blurView = (UIVisualEffectView *)v6;

    -[UIVisualEffectView _setContinuousCornerRadius:](v3->_blurView, "_setContinuousCornerRadius:", 7.0);
    -[MUPDFPageLabelView addSubview:](v3, "addSubview:", v3->_blurView);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    label = v3->_label;
    v3->_label = (UILabel *)v8;

    -[UILabel setOpaque:](v3->_label, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](v3->_label, "setBackgroundColor:", 0);
    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    v10 = v3->_label;
    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 16.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    v12 = v3->_label;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[UILabel setAlpha:](v3->_label, "setAlpha:", 0.0);
    -[UIVisualEffectView contentView](v3->_blurView, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v3->_label);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v32 = (void *)MEMORY[0x24BDD1628];
    -[UIVisualEffectView topAnchor](v3->_blurView, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPDFPageLabelView topAnchor](v3, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v39;
    -[UIVisualEffectView bottomAnchor](v3->_blurView, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPDFPageLabelView bottomAnchor](v3, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v36;
    -[UIVisualEffectView trailingAnchor](v3->_blurView, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPDFPageLabelView trailingAnchor](v3, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v33;
    -[UIVisualEffectView leadingAnchor](v3->_blurView, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPDFPageLabelView leadingAnchor](v3, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v29;
    -[UILabel topAnchor](v3->_label, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPDFPageLabelView topAnchor](v3, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, 6.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43[4] = v26;
    -[UILabel bottomAnchor](v3->_label, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPDFPageLabelView bottomAnchor](v3, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v15, -6.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v43[5] = v16;
    -[UILabel leadingAnchor](v3->_label, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPDFPageLabelView leadingAnchor](v3, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 10.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[6] = v19;
    -[UILabel trailingAnchor](v3->_label, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPDFPageLabelView trailingAnchor](v3, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -10.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43[7] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v23);

  }
  return v3;
}

- (void)clearTimer
{
  NSTimer *timer;

  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[MUPDFPageLabelView clearTimer](self, "clearTimer");
  v3.receiver = self;
  v3.super_class = (Class)MUPDFPageLabelView;
  -[MUPDFPageLabelView dealloc](&v3, sel_dealloc);
}

+ (id)sidebarAttributedString
{
  if (sidebarAttributedString_onceToken != -1)
    dispatch_once(&sidebarAttributedString_onceToken, &__block_literal_global_4);
  return (id)sidebarAttributedString__sidebarAttributedString;
}

void __45__MUPDFPageLabelView_sidebarAttributedString__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x24BDF6768];
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("sidebar.squares.leading"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "textAttachmentWithImage:", v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithAttributedString:", v2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR(" "));
  objc_msgSend(v3, "appendAttributedString:", v4);

  v5 = (void *)sidebarAttributedString__sidebarAttributedString;
  sidebarAttributedString__sidebarAttributedString = (uint64_t)v3;

}

- (void)setText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x24BDD1688];
  v5 = a3;
  v6 = [v4 alloc];
  +[MUPDFPageLabelView sidebarAttributedString](MUPDFPageLabelView, "sidebarAttributedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "initWithAttributedString:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v5);
  objc_msgSend(v9, "appendAttributedString:", v8);

  -[UILabel setAttributedText:](self->_label, "setAttributedText:", v9);
  -[MUPDFPageLabelView layoutIfNeeded](self, "layoutIfNeeded");

}

- (BOOL)isTimerInstalled
{
  return self->_timer != 0;
}

- (double)_fadeOutDelay
{
  return 2.0;
}

- (double)_fadeOutDuration
{
  return 0.5;
}

- (void)showNowInSuperView:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[UILabel setAlpha:](self->_label, "setAlpha:", 0.4);
  -[UIVisualEffectView setEffect:](self->_blurView, "setEffect:", self->_blurEffect);
  if (v6)
    -[MUPDFPageLabelView setText:](self, "setText:", v6);
  -[MUPDFPageLabelView superview](self, "superview");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
    objc_msgSend(v8, "bringSubviewToFront:", self);
  else
    objc_msgSend(v8, "addSubview:", self);
  -[MUPDFPageLabelView resetFadeOutTimer](self, "resetFadeOutTimer");

}

- (void)resetFadeOutTimer
{
  NSTimer *timer;
  NSTimer *v4;
  NSTimer *v5;
  uint64_t v6;

  -[MUPDFPageLabelView _fadeOutDelay](self, "_fadeOutDelay");
  timer = self->_timer;
  if (timer)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSTimer setFireDate:](timer, "setFireDate:", v6);
    v4 = (NSTimer *)v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_fadeOut, 0, 1);
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v4 = self->_timer;
    self->_timer = v5;
  }

}

- (void)fadeOut
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  if (-[MUPDFPageLabelView isTimerInstalled](self, "isTimerInstalled"))
  {
    v3 = (void *)MEMORY[0x24BDF6F90];
    -[MUPDFPageLabelView _fadeOutDuration](self, "_fadeOutDuration");
    v4[4] = self;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __29__MUPDFPageLabelView_fadeOut__block_invoke;
    v5[3] = &unk_24E5D4068;
    v5[4] = self;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __29__MUPDFPageLabelView_fadeOut__block_invoke_2;
    v4[3] = &unk_24E5D44D0;
    objc_msgSend(v3, "animateWithDuration:animations:completion:", v5, v4);
  }
}

uint64_t __29__MUPDFPageLabelView_fadeOut__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setEffect:", 0);
}

uint64_t __29__MUPDFPageLabelView_fadeOut__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 32), "clearTimer");
}

- (unint64_t)currentPageIndex
{
  return self->currentPageIndex;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  self->currentPageIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end

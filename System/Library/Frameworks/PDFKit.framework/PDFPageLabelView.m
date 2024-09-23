@implementation PDFPageLabelView

- (PDFPageLabelView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  PDFPageLabelView *v5;
  PDFPageLabelViewPrivate *v6;
  PDFPageLabelViewPrivate *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PDFPageLabelViewPrivate *v14;
  _UIBackdropView *backdropView;
  uint64_t v16;
  PDFPageLabelViewPrivate *v17;
  UILabel *label;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PDFTimer *v26;
  PDFPageLabelViewPrivate *v27;
  PDFTimer *visibilityTimer;
  objc_super v30;

  height = a3.size.height;
  width = a3.size.width;
  v30.receiver = self;
  v30.super_class = (Class)PDFPageLabelView;
  v5 = -[PDFPageLabelView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = objc_alloc_init(PDFPageLabelViewPrivate);
    v7 = v5->_private;
    v5->_private = v6;

    -[PDFPageLabelView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    v8 = *MEMORY[0x24BDBEFB0];
    v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    -[PDFPageLabelView setAlpha:](v5, "setAlpha:", 0.0);
    -[PDFPageLabelView layer](v5, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsGroupOpacity:", 0);

    -[PDFPageLabelView layer](v5, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupBlending:", 0);

    objc_msgSend(MEMORY[0x24BDF7020], "settingsForPrivateStyle:", 2020);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setScale:", 0.5);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDF7018]), "initWithSettings:", v12);
    v14 = v5->_private;
    backdropView = v14->backdropView;
    v14->backdropView = (_UIBackdropView *)v13;

    -[_UIBackdropView setFrame:](v5->_private->backdropView, "setFrame:", v8, v9, width, height);
    -[_UIBackdropView _setCornerRadius:](v5->_private->backdropView, "_setCornerRadius:", 7.0);
    -[PDFPageLabelView addSubview:](v5, "addSubview:", v5->_private->backdropView);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v8, v9, width, height);
    v17 = v5->_private;
    label = v17->label;
    v17->label = (UILabel *)v16;

    -[UILabel setOpaque:](v5->_private->label, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](v5->_private->label, "setBackgroundColor:", 0);
    -[UILabel setTextAlignment:](v5->_private->label, "setTextAlignment:", 1);
    v19 = v5->_private->label;
    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 16.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v19, "setFont:", v20);

    v21 = v5->_private->label;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    -[UILabel setAdjustsFontSizeToFitWidth:](v5->_private->label, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setAlpha:](v5->_private->label, "setAlpha:", 0.4);
    -[UILabel layer](v5->_private->label, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCompositingFilter:", v24);

    -[_UIBackdropView contentView](v5->_private->backdropView, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v5->_private->label);

    v26 = -[PDFTimer initWithThrottleDelay:forSelector:forTarget:]([PDFTimer alloc], "initWithThrottleDelay:forSelector:forTarget:", sel__startFade, v5, 1.5);
    v27 = v5->_private;
    visibilityTimer = v27->visibilityTimer;
    v27->visibilityTimer = v26;

  }
  return v5;
}

- (void)setCurrentPageNumber:(unint64_t)a3 forPageCount:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;

  v7 = (void *)MEMORY[0x24BDD17C8];
  PDFKitLocalizedString(CFSTR("%d of %d"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](self->_private->label, "setText:", v9);
  -[PDFPageLabelView updateEffect](self, "updateEffect");

}

- (void)updateEffect
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __32__PDFPageLabelView_updateEffect__block_invoke;
  v3[3] = &unk_24C25C350;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v3, 0.1);
  -[PDFTimer cancel](self->_private->visibilityTimer, "cancel");
  -[PDFTimer update](self->_private->visibilityTimer, "update");
}

uint64_t __32__PDFPageLabelView_updateEffect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)_startFade
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __30__PDFPageLabelView__startFade__block_invoke;
  v2[3] = &unk_24C25C350;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v2, 0.75);
}

uint64_t __30__PDFPageLabelView__startFade__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end

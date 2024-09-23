@implementation CNPlatterBackBarButtonItem

- (CNPlatterBackBarButtonItem)initWithTarget:(id)a3 action:(SEL)a4 isRTL:(BOOL)a5
{
  _BOOL8 v5;
  CNPlatterBackBarButtonItem *v6;
  CNPlatterBackBarButtonItem *v7;
  void *v8;
  CNPlatterBackBarButtonItem *v9;
  objc_super v11;

  v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)CNPlatterBackBarButtonItem;
  v6 = -[CNPlatterBackBarButtonItem initWithTitle:style:target:action:](&v11, sel_initWithTitle_style_target_action_, CFSTR(" "), 0, a3, a4);
  v7 = v6;
  if (v6)
  {
    -[CNPlatterBackBarButtonItem backButtonPlatterImageForRTL:](v6, "backButtonPlatterImageForRTL:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPlatterBackBarButtonItem setBackgroundImage:forState:barMetrics:](v7, "setBackgroundImage:forState:barMetrics:", v8, 0, 0);

    v9 = v7;
  }

  return v7;
}

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  id v8;
  void *v9;
  objc_super v10;

  v8 = a3;
  -[CNPlatterBackBarButtonItem backgroundImageForState:barMetrics:](self, "backgroundImageForState:barMetrics:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10.receiver = self;
    v10.super_class = (Class)CNPlatterBackBarButtonItem;
    -[CNPlatterBackBarButtonItem setBackgroundImage:forState:barMetrics:](&v10, sel_setBackgroundImage_forState_barMetrics_, v8, a4, a5);
  }

}

- (id)backButtonPlatterImageForRTL:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("back-button-platter-rtl");
  else
    v3 = CFSTR("back-button-platter-ltr");
  objc_msgSend(MEMORY[0x1E0DC3870], "cnui_imageNamed:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

@implementation APButtonTrayScrollViewAssistant

- (APButtonTrayScrollViewAssistant)initWithDelegate:(id)a3
{
  id v4;
  APButtonTrayScrollViewAssistant *v5;
  APButtonTrayScrollViewAssistant *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)APButtonTrayScrollViewAssistant;
  v5 = -[APButtonTrayScrollViewAssistant init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)performAdjustmentsForScrollView:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double height;
  double v19;
  double v20;
  double v21;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v22 = a3;
  -[APButtonTrayScrollViewAssistant delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonTrayForAssistant:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "bounds");
    objc_msgSend(v5, "convertRect:toView:", v22);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v22, "bounds");
    v25.origin.x = v14;
    v25.origin.y = v15;
    v25.size.width = v16;
    v25.size.height = v17;
    v23.origin.x = v7;
    v23.origin.y = v9;
    v23.size.width = v11;
    v23.size.height = v13;
    v24 = CGRectIntersection(v23, v25);
    height = v24.size.height;
    if (CGRectIsNull(v24))
    {
      v19 = *MEMORY[0x24BEBE158];
      v20 = *(double *)(MEMORY[0x24BEBE158] + 8);
      height = *(double *)(MEMORY[0x24BEBE158] + 16);
      v21 = *(double *)(MEMORY[0x24BEBE158] + 24);
    }
    else
    {
      v19 = 0.0;
      v20 = 0.0;
      v21 = 0.0;
    }
    objc_msgSend(v22, "setContentInset:", v19, v20, height, v21);
    objc_msgSend(v22, "setScrollIndicatorInsets:", v19, v20, height, v21);
  }

}

- (APButtonTrayScrollViewAssistantDelegate)delegate
{
  return (APButtonTrayScrollViewAssistantDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end

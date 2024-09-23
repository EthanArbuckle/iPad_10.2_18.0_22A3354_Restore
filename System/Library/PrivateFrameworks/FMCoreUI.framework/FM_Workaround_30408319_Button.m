@implementation FM_Workaround_30408319_Button

- (void)updateConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  objc_super v25;

  -[FM_Workaround_30408319_Button contentEdgeInsets](self, "contentEdgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[FM_Workaround_30408319_Button fm_workaround_height_constraint](self, "fm_workaround_height_constraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[FM_Workaround_30408319_Button heightAnchor](self, "heightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FM_Workaround_30408319_Button bounds](self, "bounds");
    objc_msgSend(v12, "constraintEqualToConstant:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FM_Workaround_30408319_Button setFm_workaround_height_constraint:](self, "setFm_workaround_height_constraint:", v14);

    -[FM_Workaround_30408319_Button fm_workaround_height_constraint](self, "fm_workaround_height_constraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIdentifier:", CFSTR("fm_workaround_height_constraint"));

    -[FM_Workaround_30408319_Button fm_workaround_height_constraint](self, "fm_workaround_height_constraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 1144750080;
    objc_msgSend(v16, "setPriority:", v17);

    -[FM_Workaround_30408319_Button fm_workaround_height_constraint](self, "fm_workaround_height_constraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

  }
  -[FM_Workaround_30408319_Button bounds](self, "bounds");
  v20 = v19 - (v6 + v10);
  -[FM_Workaround_30408319_Button titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sizeThatFits:", v20, 1.79769313e308);
  v23 = v22;

  -[FM_Workaround_30408319_Button fm_workaround_height_constraint](self, "fm_workaround_height_constraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setConstant:", v8 + v4 + v23);

  v25.receiver = self;
  v25.super_class = (Class)FM_Workaround_30408319_Button;
  -[FM_Workaround_30408319_Button updateConstraints](&v25, sel_updateConstraints);
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FM_Workaround_30408319_Button;
  -[FM_Workaround_30408319_Button setTitle:forState:](&v6, sel_setTitle_forState_, a3, a4);
  -[FM_Workaround_30408319_Button titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateIntrinsicContentSize");

}

- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FM_Workaround_30408319_Button;
  -[FM_Workaround_30408319_Button setAttributedTitle:forState:](&v6, sel_setAttributedTitle_forState_, a3, a4);
  -[FM_Workaround_30408319_Button titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateIntrinsicContentSize");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
  _QWORD block[5];

  v4 = a3;
  -[FM_Workaround_30408319_Button titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateIntrinsicContentSize");

  -[FM_Workaround_30408319_Button invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[FM_Workaround_30408319_Button setNeedsLayout](self, "setNeedsLayout");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__FM_Workaround_30408319_Button_traitCollectionDidChange___block_invoke;
  block[3] = &unk_24C837100;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v6.receiver = self;
  v6.super_class = (Class)FM_Workaround_30408319_Button;
  -[FM_Workaround_30408319_Button traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);

}

- (NSLayoutConstraint)fm_workaround_height_constraint
{
  return self->_fm_workaround_height_constraint;
}

- (void)setFm_workaround_height_constraint:(id)a3
{
  objc_storeStrong((id *)&self->_fm_workaround_height_constraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fm_workaround_height_constraint, 0);
}

@end

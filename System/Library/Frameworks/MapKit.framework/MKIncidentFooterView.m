@implementation MKIncidentFooterView

- (MKIncidentFooterView)initWithReuseIdentifier:(id)a3
{
  MKIncidentFooterView *v3;
  MKIncidentFooterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKIncidentFooterView;
  v3 = -[MKIncidentFooterView initWithReuseIdentifier:](&v6, sel_initWithReuseIdentifier_, a3);
  v4 = v3;
  if (v3)
    -[MKIncidentFooterView _commonInit](v3, "_commonInit");
  return v4;
}

- (MKIncidentFooterView)initWithCoder:(id)a3
{
  MKIncidentFooterView *v3;
  MKIncidentFooterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKIncidentFooterView;
  v3 = -[MKIncidentFooterView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[MKIncidentFooterView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  MKViewWithHairline *v3;
  void *v4;
  MKViewWithHairline *v5;
  MKViewWithHairline *hairlineView;
  void *v7;
  id v8;

  v3 = [MKViewWithHairline alloc];
  -[MKIncidentFooterView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[MKViewWithHairline initWithFrame:](v3, "initWithFrame:", 0.0, 0.0);
  hairlineView = self->_hairlineView;
  self->_hairlineView = v5;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.0500000007);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKViewWithHairline setBackgroundColor:](self->_hairlineView, "setBackgroundColor:", v7);

  -[MKViewWithHairline setAutoresizingMask:](self->_hairlineView, "setAutoresizingMask:", 2);
  -[MKIncidentFooterView contentView](self, "contentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_hairlineView);

}

- (void)setSeparatorColor:(id)a3
{
  -[MKViewWithHairline setHairlineColor:](self->_hairlineView, "setHairlineColor:", a3);
}

- (UIColor)separatorColor
{
  return -[MKViewWithHairline hairlineColor](self->_hairlineView, "hairlineColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hairlineView, 0);
}

@end

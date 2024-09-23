@implementation VPNToggleCell

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VPNToggleCell;
  -[PSSwitchTableCell layoutSubviews](&v19, sel_layoutSubviews);
  v3 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection");
  -[VPNToggleCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  v7 = 10.0;
  if (!v3)
    v7 = -10.0;
  v8 = v6 + v7;
  -[VPNToggleCell detailTextLabel](self, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  -[VPNToggleCell detailTextLabel](self, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  -[VPNToggleCell detailTextLabel](self, "detailTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16;
  -[VPNToggleCell detailTextLabel](self, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v8, v11, v14, v17);

}

@end

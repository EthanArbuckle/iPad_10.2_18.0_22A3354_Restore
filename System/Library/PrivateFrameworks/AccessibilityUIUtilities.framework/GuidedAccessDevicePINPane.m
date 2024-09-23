@implementation GuidedAccessDevicePINPane

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)GuidedAccessDevicePINPane;
  -[DevicePINPane layoutSubviews](&v29, sel_layoutSubviews);
  -[GuidedAccessDevicePINPane safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_keypadContainerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[GuidedAccessDevicePINPane frame](self, "frame");
  v11 = v10;
  objc_msgSend(v3, "frame");
  v13 = v12;
  -[GuidedAccessDevicePINPane safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_pinView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16)
    v17 = 1;
  else
    v17 = v14 == 0;
  if (!v17)
  {
    objc_msgSend(v14, "frame");
    v28 = v18;
    v20 = v19;
    v22 = v21;
    v23 = v7;
    v25 = v24 + -50.0;
    v5 = v5 + -50.0;
    v9 = v9 + 50.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v26);

    v27 = v25;
    v7 = v23;
    objc_msgSend(v14, "setFrame:", v28, v20, v22, v27);
  }
  objc_msgSend(v3, "setFrame:", v11 * 0.5 - v13 * 0.5, v5, v7, v9);

}

@end

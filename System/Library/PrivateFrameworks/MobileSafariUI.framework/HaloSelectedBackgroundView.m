@implementation HaloSelectedBackgroundView

- (HaloSelectedBackgroundView)initWithFrame:(CGRect)a3
{
  HaloSelectedBackgroundView *v3;
  UIView *v4;
  UIView *haloRing;
  void *v6;
  void *v7;
  UIView *v8;
  void *v9;
  void *v10;
  id v11;
  HaloSelectedBackgroundView *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HaloSelectedBackgroundView;
  v3 = -[HaloSelectedBackgroundView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    haloRing = v3->_haloRing;
    v3->_haloRing = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_haloRing, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView _setContinuousCornerRadius:](v3->_haloRing, "_setContinuousCornerRadius:", 23.0);
    -[UIView layer](v3->_haloRing, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderWidth:", 3.0);

    -[HaloSelectedBackgroundView addSubview:](v3, "addSubview:", v3->_haloRing);
    v7 = (void *)MEMORY[0x1E0CB3718];
    v8 = v3->_haloRing;
    UIEdgeInsetsMakeWithEdges();
    objc_msgSend(v7, "safari_constraintsMatchingFrameOfView:withFrameOfView:edgeInsets:", v3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activateConstraints:", v9);

    -[HaloSelectedBackgroundView _updateHaloColor](v3, "_updateHaloColor");
    objc_initWeak(&location, v3);
    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__HaloSelectedBackgroundView_initWithFrame___block_invoke;
    v14[3] = &unk_1E9CF61E0;
    objc_copyWeak(&v15, &location);
    v11 = (id)-[HaloSelectedBackgroundView registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v10, v14);

    v12 = v3;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v3;
}

void __44__HaloSelectedBackgroundView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateHaloColor");

}

- (void)_updateHaloColor
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.1);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[UIView layer](self->_haloRing, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderColor:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_haloRing, 0);
}

@end

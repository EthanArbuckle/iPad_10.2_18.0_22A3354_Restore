@implementation CPUINowPlayingButton

- (BOOL)canBecomeFocused
{
  return 1;
}

- (CPUINowPlayingButton)init
{
  return -[CPUINowPlayingButton initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 32.0, 44.0);
}

- (CPUINowPlayingButton)initWithBundleIdentifier:(id)a3
{
  id v5;
  CPUINowPlayingButton *v6;
  CPUINowPlayingButton *v7;

  v5 = a3;
  v6 = -[CPUINowPlayingButton init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);

  return v7;
}

- (CPUINowPlayingButton)initWithFrame:(CGRect)a3
{
  CPUINowPlayingButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIImageView *focusBackgroundView;
  void *v16;
  CPUINowPlayingButtonView *v17;
  CPUINowPlayingButtonView *nowPlayingView;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;
  void *v47;
  _QWORD v48[10];

  v48[8] = *MEMORY[0x24BDAC8D0];
  v46.receiver = self;
  v46.super_class = (Class)CPUINowPlayingButton;
  v3 = -[CPUINowPlayingButton initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    CPUIFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("BouncingBars"), CFSTR("caml"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDF6AC8];
      CPUIFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageNamed:inBundle:", CFSTR("CarNowPlayingBarsPlatter"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageWithRenderingMode:", 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_alloc(MEMORY[0x24BDF6AE8]);
      objc_msgSend(MEMORY[0x24BDF6950], "_carSystemQuaternaryColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "_flatImageWithColor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "_flatImageWithColor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v9, "initWithImage:highlightedImage:", v11, v13);
      focusBackgroundView = v3->_focusBackgroundView;
      v3->_focusBackgroundView = (UIImageView *)v14;

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_focusBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIImageView layer](v3->_focusBackgroundView, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMasksToBounds:", 1);

      -[UIImageView _setContinuousCornerRadius:](v3->_focusBackgroundView, "_setContinuousCornerRadius:", 16.0);
      -[UIImageView setUserInteractionEnabled:](v3->_focusBackgroundView, "setUserInteractionEnabled:", 0);
      -[CPUINowPlayingButton addSubview:](v3, "addSubview:", v3->_focusBackgroundView);
      v17 = -[CPUINowPlayingButtonView initWithCAML:]([CPUINowPlayingButtonView alloc], "initWithCAML:", v5);
      nowPlayingView = v3->_nowPlayingView;
      v3->_nowPlayingView = v17;

      -[CPUINowPlayingButtonView setUserInteractionEnabled:](v3->_nowPlayingView, "setUserInteractionEnabled:", 0);
      -[CPUINowPlayingButtonView setTranslatesAutoresizingMaskIntoConstraints:](v3->_nowPlayingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v19) = 1148846080;
      -[CPUINowPlayingButtonView setContentCompressionResistancePriority:forAxis:](v3->_nowPlayingView, "setContentCompressionResistancePriority:forAxis:", 0, v19);
      -[CPUINowPlayingButton addSubview:](v3, "addSubview:", v3->_nowPlayingView);
      v37 = (void *)MEMORY[0x24BDD1628];
      -[UIImageView heightAnchor](v3->_focusBackgroundView, "heightAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToConstant:", 32.0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v43;
      -[UIImageView widthAnchor](v3->_focusBackgroundView, "widthAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToConstant:", 32.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = v41;
      -[UIImageView centerYAnchor](v3->_focusBackgroundView, "centerYAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUINowPlayingButton centerYAnchor](v3, "centerYAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintEqualToAnchor:", v39);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v48[2] = v38;
      -[UIImageView leadingAnchor](v3->_focusBackgroundView, "leadingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUINowPlayingButton leadingAnchor](v3, "leadingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v35);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v48[3] = v34;
      -[CPUINowPlayingButtonView centerYAnchor](v3->_nowPlayingView, "centerYAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView centerYAnchor](v3->_focusBackgroundView, "centerYAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v32);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v48[4] = v31;
      -[CPUINowPlayingButtonView centerXAnchor](v3->_nowPlayingView, "centerXAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView centerXAnchor](v3->_focusBackgroundView, "centerXAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v48[5] = v22;
      -[CPUINowPlayingButtonView widthAnchor](v3->_nowPlayingView, "widthAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToConstant:", 32.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v48[6] = v24;
      -[CPUINowPlayingButtonView heightAnchor](v3->_nowPlayingView, "heightAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToConstant:", 32.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v48[7] = v26;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "activateConstraints:", v27);

      -[CPUINowPlayingButton setHighlighted:](v3, "setHighlighted:", 0);
      -[CPUINowPlayingButtonView setStateName:](v3->_nowPlayingView, "setStateName:", CFSTR("Pause"));
      CPUILocalizedStringForKey(CFSTR("NOW_PLAYING"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v28;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUINowPlayingButton setAccessibilityUserInputLabels:](v3, "setAccessibilityUserInputLabels:", v29);

    }
    -[CPUINowPlayingButton setNeedsLayout](v3, "setNeedsLayout");

  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 32.0;
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  CPUINowPlayingButton *v5;

  objc_msgSend(a3, "nextFocusedItem");
  v5 = (CPUINowPlayingButton *)objc_claimAutoreleasedReturnValue();
  -[CPUINowPlayingButton setHighlighted:](self, "setHighlighted:", v5 == self);

}

- (void)setHighlighted:(BOOL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  CPUINowPlayingButton *v11;
  BOOL v12;

  -[CPUINowPlayingButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __39__CPUINowPlayingButton_setHighlighted___block_invoke;
  v10 = &unk_24DF24150;
  v12 = a3;
  v11 = self;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDF6F30], "_currentTraitCollection", v7, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6F30], "_setCurrentTraitCollection:", v5);
    v9((uint64_t)&v7);
    objc_msgSend(MEMORY[0x24BDF6F30], "_setCurrentTraitCollection:", v6);

  }
}

void __39__CPUINowPlayingButton_setHighlighted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  objc_super v6;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)CPUINowPlayingButton;
  objc_msgSendSuper2(&v6, sel_setHighlighted_, v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 752), "setHighlighted:", *(unsigned __int8 *)(a1 + 40));
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 760);
  if (v3)
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemQuaternaryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_focusBackgroundView, 0);
  objc_storeStrong((id *)&self->_nowPlayingView, 0);
}

@end

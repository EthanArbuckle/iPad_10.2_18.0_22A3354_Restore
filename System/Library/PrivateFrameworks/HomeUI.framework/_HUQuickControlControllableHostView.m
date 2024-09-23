@implementation _HUQuickControlControllableHostView

- (_HUQuickControlControllableHostView)initWithProfile:(id)a3
{
  id v5;
  _HUQuickControlControllableHostView *v6;
  _HUQuickControlControllableHostView *v7;
  uint64_t v8;
  MTMaterialView *backgroundView;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HUQuickControlControllableHostView;
  v6 = -[_HUQuickControlControllableHostView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:configuration:", 4, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    backgroundView = v7->_backgroundView;
    v7->_backgroundView = (MTMaterialView *)v8;

    -[MTMaterialView _setContinuousCornerRadius:](v7->_backgroundView, "_setContinuousCornerRadius:", 28.0);
    -[MTMaterialView setUserInteractionEnabled:](v7->_backgroundView, "setUserInteractionEnabled:", 0);
    -[MTMaterialView setAutoresizingMask:](v7->_backgroundView, "setAutoresizingMask:", 18);
    -[_HUQuickControlControllableHostView addSubview:](v7, "addSubview:", v7->_backgroundView);
  }

  return v7;
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  return +[HUIntrinsicSizeDescriptor noIntrinsicSizeDescriptor](HUIntrinsicSizeDescriptor, "noIntrinsicSizeDescriptor", a3);
}

- (HUQuickControlViewProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (HUQuickControlViewInteractionDelegate)interactionDelegate
{
  return (HUQuickControlViewInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (id)value
{
  return self->_value;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong(&self->_value, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end

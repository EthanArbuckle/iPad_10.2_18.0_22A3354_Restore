@implementation BSUIVibrancyView

+ (BOOL)isDisabled
{
  if (qword_1ECEC3970 != -1)
    dispatch_once(&qword_1ECEC3970, &__block_literal_global_6);
  return _MergedGlobals_1_0;
}

void __30__BSUIVibrancyView_isDisabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1_0 = objc_msgSend(v0, "BOOLForKey:", CFSTR("BSUIVibrancyEffectViewDisabled"));

}

- (BSUIVibrancyView)initWithFrame:(CGRect)a3
{
  BSUIVibrancyView *v3;
  BSUIVibrancyConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BSUIVibrancyView;
  v3 = -[BSUIVibrancyView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(BSUIVibrancyConfiguration);
    -[BSUIVibrancyView setConfiguration:](v3, "setConfiguration:", v4);

  }
  return v3;
}

- (void)setConfiguration:(id)a3
{
  BSUIVibrancyConfiguration *v4;
  BSUIVibrancyConfiguration *configuration;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (BSUIVibrancyConfiguration *)objc_msgSend(v6, "copy");
    configuration = self->_configuration;
    self->_configuration = v4;

    -[BSUIVibrancyView invalidateSubviews](self, "invalidateSubviews");
    -[BSUIVibrancyView _invalidateFilters](self, "_invalidateFilters");
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BSUIVibrancyView;
  -[BSUIVibrancyView layoutSubviews](&v3, sel_layoutSubviews);
  -[BSUIVibrancyView _update](self, "_update");
}

- (void)_invalidateFilters
{
  self->_needsUpdate.effectFilterViews = 1;
  -[BSUIVibrancyView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateFilterViewsIfNeeded
{
  if (self->_needsUpdate.effectFilterViews)
  {
    self->_needsUpdate.effectFilterViews = 0;
    -[BSUIVibrancyView updateFilters](self, "updateFilters");
  }
}

- (BSUIVibrancyConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end

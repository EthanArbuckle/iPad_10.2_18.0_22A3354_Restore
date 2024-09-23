@implementation HUQuickControlColorInteractionCoordinator

- (HUQuickControlColorInteractionCoordinator)initWithControlView:(id)a3 colorPalette:(id)a4 delegate:(id)a5
{
  id v8;
  HUQuickControlColorInteractionCoordinator *v9;
  HUQuickControlColorInteractionCoordinator *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlColorInteractionCoordinator;
  v9 = -[HUQuickControlSimpleInteractionCoordinator initWithControlView:delegate:](&v12, sel_initWithControlView_delegate_, a3, a5);
  v10 = v9;
  if (v9)
    -[HUQuickControlColorInteractionCoordinator setColorPalette:](v9, "setColorPalette:", v8);

  return v10;
}

- (void)_notifyDelegateOfColorPaletteChangeIfNecessary
{
  void *v3;
  void *v4;

  if (-[HUQuickControlColorInteractionCoordinator hasPendingColorPaletteChangeDelegateNotification](self, "hasPendingColorPaletteChangeDelegateNotification"))
  {
    if (!-[HUQuickControlSimpleInteractionCoordinator isUserInteractionActive](self, "isUserInteractionActive"))
    {
      -[HUQuickControlInteractionCoordinator delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUQuickControlColorInteractionCoordinator colorPalette](self, "colorPalette");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "interactionCoordinator:colorPaletteDidChange:", self, v4);

      -[HUQuickControlColorInteractionCoordinator setHasPendingColorPaletteChangeDelegateNotification:](self, "setHasPendingColorPaletteChangeDelegateNotification:", 0);
    }
  }
}

- (void)controlView:(id)a3 interactionStateDidChange:(BOOL)a4 forFirstTouch:(BOOL)a5
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlColorInteractionCoordinator;
  -[HUQuickControlSimpleInteractionCoordinator controlView:interactionStateDidChange:forFirstTouch:](&v7, sel_controlView_interactionStateDidChange_forFirstTouch_, a3, a4, a5);
  if (!a4)
    -[HUQuickControlColorInteractionCoordinator _notifyDelegateOfColorPaletteChangeIfNecessary](self, "_notifyDelegateOfColorPaletteChangeIfNecessary");
}

- (void)controlView:(id)a3 colorPaletteDidChange:(id)a4
{
  -[HUQuickControlColorInteractionCoordinator setColorPalette:](self, "setColorPalette:", a4);
  -[HUQuickControlColorInteractionCoordinator setHasPendingColorPaletteChangeDelegateNotification:](self, "setHasPendingColorPaletteChangeDelegateNotification:", 1);
  -[HUQuickControlColorInteractionCoordinator _notifyDelegateOfColorPaletteChangeIfNecessary](self, "_notifyDelegateOfColorPaletteChangeIfNecessary");
}

- (void)controlView:(id)a3 showAuxiliaryView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUQuickControlInteractionCoordinator delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactionCoordinator:showAuxiliaryView:", self, v5);

}

- (void)hideAuxiliaryViewForControlView:(id)a3
{
  id v4;

  -[HUQuickControlInteractionCoordinator delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideAuxiliaryViewForInteractionCoordinator:", self);

}

- (void)presentFullColorViewForControlView:(id)a3 selectedColorIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUQuickControlInteractionCoordinator delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentFullColorViewForInteractionCoordinator:selectedColorIndexPath:", self, v5);

}

- (void)controlView:(id)a3 didSelectColorAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUQuickControlInteractionCoordinator delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactionCoordinator:didSelectColorAtIndexPath:", self, v5);

}

- (void)cancelButtonTappedToDismissColorViewController
{
  NSObject *v3;
  void *v4;
  int v5;
  HUQuickControlColorInteractionCoordinator *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412546;
    v6 = self;
    v7 = 2080;
    v8 = "-[HUQuickControlColorInteractionCoordinator cancelButtonTappedToDismissColorViewController]";
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped cancel button", (uint8_t *)&v5, 0x16u);
  }

  -[HUQuickControlInteractionCoordinator controlView](self, "controlView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelColorPicking");

}

- (HFColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (void)setColorPalette:(id)a3
{
  objc_storeStrong((id *)&self->_colorPalette, a3);
}

- (BOOL)hasPendingColorPaletteChangeDelegateNotification
{
  return self->_hasPendingColorPaletteChangeDelegateNotification;
}

- (void)setHasPendingColorPaletteChangeDelegateNotification:(BOOL)a3
{
  self->_hasPendingColorPaletteChangeDelegateNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPalette, 0);
}

@end

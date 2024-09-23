@implementation HPSBatteryIconView

- (HPSBatteryIconView)init
{
  HPSBatteryIconView *v2;
  HPSBatteryIconView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HPSBatteryIconView;
  v2 = -[HPSBatteryIconView init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UIBatteryView setSizeCategory:](v2, "setSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBatteryView setFillColor:](v3, "setFillColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBatteryView setBodyColor:](v3, "setBodyColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBatteryView setPinColor:](v3, "setPinColor:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBatteryView setBoltColor:](v3, "setBoltColor:", v7);

    -[HPSBatteryIconView traitCollection](v3, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceStyle");

    if (v9 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBatteryView setBoltColor:](v3, "setBoltColor:", v10);

    }
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HPSBatteryIconView;
  -[HPSBatteryIconView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  -[HPSBatteryIconView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBatteryView setBoltColor:](self, "setBoltColor:", v5);

}

- (void)setIsCharging:(BOOL)a3
{
  _BOOL8 v4;

  v4 = a3;
  -[_UIBatteryView setShowsInlineChargingIndicator:](self, "setShowsInlineChargingIndicator:");
  -[_UIBatteryView setChargingState:](self, "setChargingState:", v4);
}

@end

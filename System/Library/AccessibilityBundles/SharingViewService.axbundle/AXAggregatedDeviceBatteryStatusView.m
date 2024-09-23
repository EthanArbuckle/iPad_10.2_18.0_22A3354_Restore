@implementation AXAggregatedDeviceBatteryStatusView

- (AXAggregatedDeviceBatteryStatusView)initWithAccessibilityContainer:(id)a3 representedElements:(id)a4 primaryTitle:(id)a5 batteryLevelLabel:(id)a6 chargingImage:(id)a7 warningImage:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  AXAggregatedDeviceBatteryStatusView *v18;
  AXAggregatedDeviceBatteryStatusView *v19;
  objc_super v21;

  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)AXAggregatedDeviceBatteryStatusView;
  v18 = -[UIAccessibilityAggregateElement initWithAccessibilityContainer:representedElements:](&v21, sel_initWithAccessibilityContainer_representedElements_, self, a4);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_primaryTitle, a5);
    if ((objc_msgSend(v15, "isHidden") & 1) == 0)
      objc_storeStrong(&v19->_batteryLevelLabel, a6);
    if ((objc_msgSend(v16, "isHidden") & 1) == 0)
      objc_storeStrong(&v19->_chargingImage, a7);
    if ((objc_msgSend(v17, "isHidden") & 1) == 0)
      objc_storeStrong(&v19->_warningImage, a8);
  }

  return v19;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  NSString *v3;

  v3 = -[NSString length](self->_primaryTitle, "length");
  if (v3)
    v3 = self->_primaryTitle;
  return v3;
}

- (id)accessibilityValue
{
  id batteryLevelLabel;
  void *v4;
  id chargingImage;
  void *v6;
  void *v7;
  void *v9;

  batteryLevelLabel = self->_batteryLevelLabel;
  if (batteryLevelLabel)
  {
    objc_msgSend(self->_batteryLevelLabel, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  chargingImage = self->_chargingImage;
  if (chargingImage)
  {
    accessibilityB188LocalizedString(CFSTR("device.battery.state.charging"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (self->_warningImage)
  {
    accessibilityB188LocalizedString(CFSTR("device.battery.state.disconnected"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!chargingImage)
      goto LABEL_10;
    goto LABEL_9;
  }
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (chargingImage)
LABEL_9:

LABEL_10:
  if (batteryLevelLabel)

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_warningImage, 0);
  objc_storeStrong(&self->_chargingImage, 0);
  objc_storeStrong(&self->_batteryLevelLabel, 0);
  objc_storeStrong((id *)&self->_primaryTitle, 0);
}

@end

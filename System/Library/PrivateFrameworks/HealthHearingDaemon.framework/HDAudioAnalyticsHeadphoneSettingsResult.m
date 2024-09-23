@implementation HDAudioAnalyticsHeadphoneSettingsResult

- (HDAudioAnalyticsHeadphoneSettingsResult)initWithLocalDevice:(id)a3 activePairedWatch:(id)a4
{
  id v6;
  id v7;
  HDAudioAnalyticsHeadphoneSettingsResult *v8;
  HDAudioAnalyticsHeadphoneSettingsResult *v9;
  HDAudioAnalyticsHeadphoneSettingsResult *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDAudioAnalyticsHeadphoneSettingsResult;
  v8 = -[HDAudioAnalyticsHeadphoneSettingsResult init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HDAudioAnalyticsHeadphoneSettingsResult setLocalDevice:](v8, "setLocalDevice:", v6);
    -[HDAudioAnalyticsHeadphoneSettingsResult setActivePairedWatch:](v9, "setActivePairedWatch:", v7);
    v10 = v9;
  }

  return v9;
}

- (HDAudioAnalyticsHeadphoneSettingsDeviceResult)localDevice
{
  return self->_localDevice;
}

- (void)setLocalDevice:(id)a3
{
  objc_storeStrong((id *)&self->_localDevice, a3);
}

- (HDAudioAnalyticsHeadphoneSettingsDeviceResult)activePairedWatch
{
  return self->_activePairedWatch;
}

- (void)setActivePairedWatch:(id)a3
{
  objc_storeStrong((id *)&self->_activePairedWatch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePairedWatch, 0);
  objc_storeStrong((id *)&self->_localDevice, 0);
}

@end

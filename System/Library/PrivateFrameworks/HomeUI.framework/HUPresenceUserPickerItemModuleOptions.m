@implementation HUPresenceUserPickerItemModuleOptions

- (HUPresenceUserPickerItemModuleOptions)initWithLocationDevice:(id)a3 customLocationSelected:(BOOL)a4
{
  id v7;
  HUPresenceUserPickerItemModuleOptions *v8;
  HUPresenceUserPickerItemModuleOptions *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUPresenceUserPickerItemModuleOptions;
  v8 = -[HUPresenceUserPickerItemModuleOptions init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locationDevice, a3);
    v9->_customLocationSelected = a4;
  }

  return v9;
}

- (HUPresenceCurrentUserLocationDevice)locationDevice
{
  return self->_locationDevice;
}

- (BOOL)customLocationSelected
{
  return self->_customLocationSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDevice, 0);
}

@end

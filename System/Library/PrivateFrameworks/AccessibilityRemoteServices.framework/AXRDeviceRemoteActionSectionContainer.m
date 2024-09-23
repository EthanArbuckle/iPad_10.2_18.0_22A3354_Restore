@implementation AXRDeviceRemoteActionSectionContainer

- (AXRDeviceRemoteActionSectionContainer)initWithLocalizedTitle:(id)a3 preferredContextType:(int64_t)a4 remoteActions:(id)a5
{
  id v9;
  id v10;
  AXRDeviceRemoteActionSectionContainer *v11;
  AXRDeviceRemoteActionSectionContainer *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AXRDeviceRemoteActionSectionContainer;
  v11 = -[AXRDeviceRemoteActionSectionContainer init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_localizedTitle, a3);
    v12->_preferredContextType = a4;
    objc_storeStrong((id *)&v12->_remoteActions, a5);
  }

  return v12;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (int64_t)preferredContextType
{
  return self->_preferredContextType;
}

- (NSArray)remoteActions
{
  return self->_remoteActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteActions, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end

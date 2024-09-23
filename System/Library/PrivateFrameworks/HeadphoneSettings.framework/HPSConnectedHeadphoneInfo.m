@implementation HPSConnectedHeadphoneInfo

- (HPSConnectedHeadphoneInfo)initWithID:(id)a3 name:(id)a4 image:(id)a5 specifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HPSConnectedHeadphoneInfo *v15;
  HPSConnectedHeadphoneInfo *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HPSConnectedHeadphoneInfo;
  v15 = -[HPSConnectedHeadphoneInfo init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deviceID, a3);
    objc_storeStrong((id *)&v16->_deviceName, a4);
    objc_storeStrong((id *)&v16->_deviceImage, a5);
    objc_storeStrong((id *)&v16->_deviceSpecifier, a6);
  }

  return v16;
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (UIImage)deviceImage
{
  return (UIImage *)objc_getProperty(self, a2, 24, 1);
}

- (PSSpecifier)deviceSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSpecifier, 0);
  objc_storeStrong((id *)&self->_deviceImage, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end

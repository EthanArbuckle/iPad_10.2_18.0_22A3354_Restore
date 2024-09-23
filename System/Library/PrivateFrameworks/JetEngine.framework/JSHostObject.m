@implementation JSHostObject

- (NSString)platform
{
  return (NSString *)(id)sub_19CFDF554();
}

- (BOOL)isOSAtLeast:(id)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC9JetEngine12JSHostObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v17[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = (int)objc_msgSend(v8, sel_toInt32);
  v13 = (int)objc_msgSend(v9, sel_toInt32);
  v14 = (int)objc_msgSend(v10, sel_toInt32);
  v15 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v17[0] = v12;
  v17[1] = v13;
  v17[2] = v14;
  LOBYTE(v12) = objc_msgSend(v15, sel_isOperatingSystemAtLeastVersion_, v17);

  return v12;
}

- (_TtC9JetEngine12JSHostObject)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[JSHostObject init](&v3, sel_init);
}

- (NSString)clientIdentifier
{
  void *v3;
  _TtC9JetEngine12JSHostObject *v4;
  id v5;
  id v6;
  void *v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_mainBundle);
  v6 = objc_msgSend(v5, sel_bundleIdentifier);

  if (v6)
  {
    sub_19CFDF578();

  }
  else
  {

  }
  v7 = (void *)sub_19CFDF554();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)osBuild
{
  return (NSString *)sub_19CD0421C(self, (uint64_t)a2, (uint64_t (*)(void))JEGestaltGetBuildVersion);
}

- (NSString)deviceModel
{
  return (NSString *)sub_19CD0421C(self, (uint64_t)a2, (uint64_t (*)(void))JEGestaltGetDeviceModel);
}

- (NSString)deviceLocalizedModel
{
  return (NSString *)sub_19CD0421C(self, (uint64_t)a2, (uint64_t (*)(void))JEGestaltGetLocalizedDeviceModel);
}

- (NSString)devicePhysicalModel
{
  return (NSString *)sub_19CD0421C(self, (uint64_t)a2, (uint64_t (*)(void))JEGestaltGetProductType);
}

- (NSString)deviceModelFamily
{
  return (NSString *)sub_19CD0421C(self, (uint64_t)a2, (uint64_t (*)(void))JEGestaltGetDeviceClass);
}

- (NSString)deviceMarketingFamilyName
{
  return (NSString *)sub_19CD0421C(self, (uint64_t)a2, (uint64_t (*)(void))JEGestaltGetMarketingDeviceFamilyName);
}

- (NSString)clientVersion
{
  void *v2;

  sub_19CFB9474();
  v2 = (void *)sub_19CFDF554();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

@end

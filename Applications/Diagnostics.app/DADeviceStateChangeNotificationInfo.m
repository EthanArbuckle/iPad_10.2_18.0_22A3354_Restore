@implementation DADeviceStateChangeNotificationInfo

+ (id)infoWithChangedProperties:(unint64_t)a3 snapshot:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithChangedProperties:snapshot:", a3, v6);

  return v7;
}

- (DADeviceStateChangeNotificationInfo)initWithChangedProperties:(unint64_t)a3 snapshot:(id)a4
{
  id v7;
  DADeviceStateChangeNotificationInfo *v8;
  DADeviceStateChangeNotificationInfo *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DADeviceStateChangeNotificationInfo;
  v8 = -[DADeviceStateChangeNotificationInfo init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_changedProperties = a3;
    objc_storeStrong((id *)&v8->_snapshot, a4);
  }

  return v9;
}

- (unint64_t)changedProperties
{
  return self->_changedProperties;
}

- (DADeviceState)snapshot
{
  return self->_snapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end

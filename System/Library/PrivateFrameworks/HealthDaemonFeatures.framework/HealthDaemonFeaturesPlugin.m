@implementation HealthDaemonFeaturesPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)(id)sub_23DDDE2D8();
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)extensionForProfile:(id)a3
{
  id v4;
  _TtC20HealthDaemonFeatures26HealthDaemonFeaturesPlugin *v5;
  id v6;
  _TtC20HealthDaemonFeatures26HealthDaemonFeaturesPlugin *v7;
  id v8;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, sel_profileType) == (id)1)
  {
    v6 = objc_allocWithZone((Class)type metadata accessor for HealthDaemonFeaturesProfileExtension());
    v7 = (_TtC20HealthDaemonFeatures26HealthDaemonFeaturesPlugin *)v4;
    v8 = sub_23DDDDB48(v7);

    v5 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_TtC20HealthDaemonFeatures26HealthDaemonFeaturesPlugin)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HealthDaemonFeaturesPlugin();
  return -[HealthDaemonFeaturesPlugin init](&v3, sel_init);
}

@end

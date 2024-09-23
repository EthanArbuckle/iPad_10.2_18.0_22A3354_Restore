@implementation AUAppleCustomViewLoader

- (id)customViewControllerFor:(AudioComponentDescription *)a3 audioUnit:(void *)a4 v3AU:(id)a5
{
  OSType componentSubType;
  OSType componentManufacturer;
  id v10;
  _TtC12CoreAudioKit23AUAppleCustomViewLoader *v11;
  _QWORD *v12;

  componentSubType = a3->componentSubType;
  componentManufacturer = a3->componentManufacturer;
  v10 = a5;
  v11 = self;
  v12 = sub_2131AF3F0(componentSubType, componentManufacturer, (uint64_t)a4, a5);

  return v12;
}

- (_TtC12CoreAudioKit23AUAppleCustomViewLoader)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AUAppleCustomViewLoader();
  return -[AUAppleCustomViewLoader init](&v3, sel_init);
}

@end

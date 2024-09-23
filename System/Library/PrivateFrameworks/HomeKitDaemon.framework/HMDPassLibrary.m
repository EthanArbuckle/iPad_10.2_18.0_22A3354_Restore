@implementation HMDPassLibrary

+ (HMDPassLibrary)shared
{
  if (qword_25573B3C8 != -1)
    swift_once();
  return (HMDPassLibrary *)(id)swift_retain();
}

- (HMDPassLibrary)init
{
  objc_super v4;

  swift_defaultActor_initialize();
  sub_222596744();
  swift_retain();
  *(_QWORD *)&self->_anon_60[8] = sub_222596738();
  swift_release();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PassLibrary();
  return -[HMDPassLibrary init](&v4, sel_init);
}

@end

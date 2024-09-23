@implementation LocationDataProvider

- (_TtC18MobileTimerSupport20LocationDataProvider)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_defaultActor_initialize();
  *(_QWORD *)&self->_anon_60[8] = MEMORY[0x1E0DEE9E0];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[LocationDataProvider init](&v5, sel_init);
}

@end

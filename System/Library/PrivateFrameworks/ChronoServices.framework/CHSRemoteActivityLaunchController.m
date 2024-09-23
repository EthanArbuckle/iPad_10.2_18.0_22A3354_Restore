@implementation CHSRemoteActivityLaunchController

- (_TtC14ChronoServices33CHSRemoteActivityLaunchController)init
{
  id v2;
  objc_class *v3;
  char *v4;
  _TtC14ChronoServices33CHSRemoteActivityLaunchController *v5;
  objc_super v7;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v3 = (objc_class *)type metadata accessor for CHSRemoteActivityLaunchController();
  v4 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ChronoServices33CHSRemoteActivityLaunchController_connection] = v2;
  v7.receiver = v4;
  v7.super_class = v3;
  v5 = -[CHSRemoteActivityLaunchController init](&v7, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14ChronoServices33CHSRemoteActivityLaunchController_connection));
}

@end

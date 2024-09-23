@implementation LocationAuthorization

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  _TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization *v5;

  v4 = a3;
  v5 = self;
  sub_1001883BC(v4);

}

- (_TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization)init
{
  _TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization *result;

  result = (_TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization *)_swift_stdlib_reportUnimplementedInitializer("SOSBuddy.LocationAuthorization", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization_locationManagerQueue));
  swift_bridgeObjectRelease(*(_QWORD *)&self->locationManagerQueue[OBJC_IVAR____TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization_name]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->locationManagerQueue[OBJC_IVAR____TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization_effectiveBundlePath]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization_locationManager));
  sub_10004DA00(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization_handler), *(_QWORD *)&self->locationManagerQueue[OBJC_IVAR____TtC8SOSBuddyP33_EA0A6DD3813AFCA28C36541F1A14F10521LocationAuthorization_handler]);
}

@end

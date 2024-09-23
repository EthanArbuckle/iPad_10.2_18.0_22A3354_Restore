@implementation LocationServicesDisabledView.ViewModel

- (_TtCV12FindMyUICore28LocationServicesDisabledView9ViewModel)init
{
  return (_TtCV12FindMyUICore28LocationServicesDisabledView9ViewModel *)sub_23B996010();
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  _TtCV12FindMyUICore28LocationServicesDisabledView9ViewModel *v5;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_authorizationStatus);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23BB8923C();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12FindMyUICore28LocationServicesDisabledView9ViewModel_clLocationManager));
  v3 = (char *)self + OBJC_IVAR____TtCV12FindMyUICore28LocationServicesDisabledView9ViewModel__authorizationStatus;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A59A68);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end

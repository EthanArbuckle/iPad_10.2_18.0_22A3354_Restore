@implementation ReviewExtensionHostService

- (void)cancel
{
  _TtC20AppleMediaServicesUI26ReviewExtensionHostService *v2;

  v2 = self;
  sub_211229580();

}

- (void)dismissWithData:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  _TtC20AppleMediaServicesUI26ReviewExtensionHostService *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_2112296AC(a3, (unint64_t)a4);

}

- (_TtC20AppleMediaServicesUI26ReviewExtensionHostService)init
{
  ReviewExtensionHostService.init()();
}

- (void).cxx_destruct
{
  sub_211229D20((uint64_t)self + OBJC_IVAR____TtC20AppleMediaServicesUI26ReviewExtensionHostService_hostView);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20AppleMediaServicesUI26ReviewExtensionHostService_reviewContext));
  swift_unknownObjectRelease();
  sub_2111C7E2C((uint64_t)self + OBJC_IVAR____TtC20AppleMediaServicesUI26ReviewExtensionHostService_dismissContinuation, (uint64_t *)&unk_254A9EBA0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20AppleMediaServicesUI26ReviewExtensionHostService_connection));
}

@end

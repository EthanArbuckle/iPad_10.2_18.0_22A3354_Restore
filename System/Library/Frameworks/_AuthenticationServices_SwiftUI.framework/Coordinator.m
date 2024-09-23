@implementation Coordinator

- (void)buttonPressed
{
  _TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator *v2;

  v2 = self;
  sub_22632F9D0();

}

- (_TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator)init
{
  _TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator *result;

  result = (_TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_presentationAnchor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_button));
}

- (id)presentationAnchorForAuthorizationController:(id)a3
{
  id v4;
  _TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_226330AC0();

  return v6;
}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  void (*v6)(id, uint64_t);
  id v7;
  _TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator *v8;
  id v9;

  v6 = *(void (**)(id, uint64_t))&self->config[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_config
                                                       + 16];
  v7 = a3;
  v9 = a4;
  v8 = self;
  v6(a4, 1);

}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  void (*v6)(id, _QWORD);
  id v7;
  id v8;
  _TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator *v9;

  v6 = *(void (**)(id, _QWORD))&self->config[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_config
                                                      + 16];
  v7 = a3;
  v8 = a4;
  v9 = self;
  v6(a4, 0);

}

@end

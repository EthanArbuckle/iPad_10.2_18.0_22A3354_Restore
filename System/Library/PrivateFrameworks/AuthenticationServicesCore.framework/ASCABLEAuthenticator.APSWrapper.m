@implementation ASCABLEAuthenticator.APSWrapper

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  _TtCC26AuthenticationServicesCore20ASCABLEAuthenticatorP33_84AFAA0745E7F5997DD6543D9C2808DD10APSWrapper *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtCC26AuthenticationServicesCore20ASCABLEAuthenticatorP33_84AFAA0745E7F5997DD6543D9C2808DD10APSWrapper *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;

  if (a4)
  {
    v6 = a3;
    v7 = self;
    v8 = a4;
    v9 = sub_20E6E9C80();
    v11 = v10;

  }
  else
  {
    v12 = a3;
    v13 = self;
    v9 = 0;
    v11 = 0xF000000000000000;
  }
  if (qword_254A2DBE8 != -1)
    swift_once();
  v14 = sub_20E6E9F50();
  __swift_project_value_buffer(v14, (uint64_t)qword_254A3ED50);
  v15 = sub_20E6E9F38();
  v16 = sub_20E6EA3D0();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_20E648000, v15, v16, "Received public push token", v17, 2u);
    MEMORY[0x212BC3A38](v17, -1, -1);
  }

  sub_20E66AA28(v9, v11);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  _TtCC26AuthenticationServicesCore20ASCABLEAuthenticatorP33_84AFAA0745E7F5997DD6543D9C2808DD10APSWrapper *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_20E67A370(a4);

}

- (_TtCC26AuthenticationServicesCore20ASCABLEAuthenticatorP33_84AFAA0745E7F5997DD6543D9C2808DD10APSWrapper)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ASCABLEAuthenticator.APSWrapper();
  return -[ASCABLEAuthenticator.APSWrapper init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end

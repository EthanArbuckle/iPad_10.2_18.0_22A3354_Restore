@implementation LocalPlayerAuthenticationPresenter

- (_TtC12GameCenterUI34LocalPlayerAuthenticationPresenter)init
{
  return (_TtC12GameCenterUI34LocalPlayerAuthenticationPresenter *)sub_1AB69A190();
}

- (void)authenticationShowGreenBuddyUIForLocalPlayer:(id)a3 withCompletionHandler:(id)a4
{
  void *v6;
  id v7;
  _TtC12GameCenterUI34LocalPlayerAuthenticationPresenter *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v6;
    v6 = sub_1AB69E0E8;
  }
  v7 = a3;
  v8 = self;
  sub_1AB69D40C(v7);
  sub_1AB46A9C4((uint64_t)v6);

}

- (void)authenticationShowSignInUIForLocalPlayer:(id)a3 origin:(unint64_t)a4 dismiss:(id)a5
{
  void *v8;
  id v9;
  _TtC12GameCenterUI34LocalPlayerAuthenticationPresenter *v10;

  v8 = _Block_copy(a5);
  if (v8)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v8;
    v8 = sub_1AB48638C;
  }
  v9 = a3;
  v10 = self;
  sub_1AB69D58C((uint64_t)v9, a4, v8);
  sub_1AB46A9C4((uint64_t)v8);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12GameCenterUI34LocalPlayerAuthenticationPresenter_localPlayer));
  swift_release();
  swift_release();
  swift_release();
}

@end

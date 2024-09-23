@implementation ScreenRecorder

- (_TtC11AssetViewer14ScreenRecorder)init
{
  return (_TtC11AssetViewer14ScreenRecorder *)sub_1D949F208();
}

- (void).cxx_destruct
{
  sub_1D93D6F6C((uint64_t)self + OBJC_IVAR____TtC11AssetViewer14ScreenRecorder_url);
  swift_unknownObjectRelease();
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11AssetViewer14ScreenRecorder____lazy_storage___userNotificationCenter));
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  _QWORD *v8;
  void (*v9)(_QWORD *, uint64_t);
  id v10;
  id v11;
  _TtC11AssetViewer14ScreenRecorder *v12;

  v8 = _Block_copy(a5);
  v9 = (void (*)(_QWORD *, uint64_t))v8[2];
  v10 = a3;
  v11 = a4;
  v12 = self;
  v9(v8, 7);
  _Block_release(v8);

}

@end

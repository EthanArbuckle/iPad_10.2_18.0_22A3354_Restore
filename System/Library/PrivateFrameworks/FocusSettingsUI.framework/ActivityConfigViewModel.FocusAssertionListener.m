@implementation ActivityConfigViewModel.FocusAssertionListener

- (void)didUpdateActiveModesForActivationManager:(id)a3 assertion:(id)a4
{
  void (*v6)(id);
  id v7;
  id v8;
  _TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22FocusAssertionListener *v9;

  v6 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22FocusAssertionListener_modeActivationDidChange);
  v7 = a3;
  v8 = a4;
  v9 = self;
  swift_retain();
  v6(a4);

  swift_release();
}

- (_TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22FocusAssertionListener)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22FocusAssertionListener_modeActivationDidChange);
  *v2 = nullsub_1;
  v2[1] = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ActivityConfigViewModel.FocusAssertionListener();
  return -[ActivityConfigViewModel.FocusAssertionListener init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end

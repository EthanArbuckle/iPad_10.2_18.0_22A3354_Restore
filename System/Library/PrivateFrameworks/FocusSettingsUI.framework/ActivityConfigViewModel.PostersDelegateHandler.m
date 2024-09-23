@implementation ActivityConfigViewModel.PostersDelegateHandler

- (void)modalController:(id)a3 willDismissSheetWithResponse:(id)a4
{
  sub_21557AFF8((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR____TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22PostersDelegateHandler_modalControllerWillDismissHandler);
}

- (void)modalController:(id)a3 didDismissSheetWithResponse:(id)a4
{
  sub_21557AFF8((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR____TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22PostersDelegateHandler_modalControllerDidDismissHandler);
}

- (_TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22PostersDelegateHandler)init
{
  _QWORD *v3;
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22PostersDelegateHandler_modalControllerWillDismissHandler);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22PostersDelegateHandler_modalControllerDidDismissHandler);
  v5 = (objc_class *)type metadata accessor for ActivityConfigViewModel.PostersDelegateHandler();
  *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return -[ActivityConfigViewModel.PostersDelegateHandler init](&v7, sel_init);
}

- (void).cxx_destruct
{
  sub_215505AD4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22PostersDelegateHandler_modalControllerWillDismissHandler));
  sub_215505AD4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22PostersDelegateHandler_modalControllerDidDismissHandler));
}

@end

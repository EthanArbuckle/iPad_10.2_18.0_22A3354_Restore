@implementation MusicRecognitionAmbientViewController

- (void)dealloc
{
  _TtC16MusicRecognition37MusicRecognitionAmbientViewController *v2;
  uint64_t v3;

  v2 = self;
  sub_10000CEE0((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionAmbientViewController_musicRecognitionCancellable));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionAmbientViewController_matchingFlowView));
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC16MusicRecognition37MusicRecognitionAmbientViewController *v3;

  v3 = self;
  sub_1000A58B4((uint64_t)v3, v2);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MusicRecognition37MusicRecognitionAmbientViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC16MusicRecognition37MusicRecognitionAmbientViewController *)sub_1000A63E8(v5, v7, a4);
}

- (_TtC16MusicRecognition37MusicRecognitionAmbientViewController)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC16MusicRecognition37MusicRecognitionAmbientViewController *)sub_1000A653C(v3, v4);
}

@end

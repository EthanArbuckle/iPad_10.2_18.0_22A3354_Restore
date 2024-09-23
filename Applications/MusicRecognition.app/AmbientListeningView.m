@implementation AmbientListeningView

- (_TtC16MusicRecognition20AmbientListeningView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicRecognition20AmbientListeningView *)sub_100015380(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC16MusicRecognition20AmbientListeningView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC16MusicRecognition20AmbientListeningView *)sub_100015DE0(v3, v4);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v4.receiver;
  -[AmbientListeningView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC16MusicRecognition20AmbientListeningView_listeningLayer];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC16MusicRecognition20AmbientListeningView_listeningLayerView], "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition20AmbientListeningView_listeningLayerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition20AmbientListeningView_listeningLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition20AmbientListeningView_listeningLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition20AmbientListeningView_cancelButton));
}

@end

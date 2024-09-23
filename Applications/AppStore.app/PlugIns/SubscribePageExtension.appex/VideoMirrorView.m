@implementation VideoMirrorView

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VideoMirrorView();
  return -[MirrorView backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  char *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for VideoMirrorView();
  v4 = (char *)v10.receiver;
  v5 = a3;
  -[MirrorView setBackgroundColor:](&v10, "setBackgroundColor:", v5);
  v6 = *(void **)&v4[OBJC_IVAR____TtC22SubscribePageExtension15VideoMirrorView_videoLayer];
  v7 = objc_msgSend(v4, "backgroundColor", v10.receiver, v10.super_class);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "CGColor");

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v6, "setBackgroundColor:", v9);

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VideoMirrorView();
  v2 = (char *)v5.receiver;
  -[MirrorView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension15VideoMirrorView_videoLayer];
  v4 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension10MirrorView_artworkLayer];
  objc_msgSend(v4, "bounds", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setBounds:");
  objc_msgSend(v4, "position");
  objc_msgSend(v3, "setPosition:");

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension15VideoMirrorView_sourceVideoView);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15VideoMirrorView_videoLayer));
}

@end

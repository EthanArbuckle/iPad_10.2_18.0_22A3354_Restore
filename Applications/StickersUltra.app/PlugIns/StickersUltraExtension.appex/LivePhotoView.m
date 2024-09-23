@implementation LivePhotoView

- (void)dealloc
{
  _TtC22StickersUltraExtension13LivePhotoView *v2;

  v2 = self;
  sub_100011780();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension13LivePhotoView_stillImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension13LivePhotoView_stillImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension13LivePhotoView_livePhoto));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension13LivePhotoView_playerView));
  sub_100011988((uint64_t)self + OBJC_IVAR____TtC22StickersUltraExtension13LivePhotoView_playerObserver);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC22StickersUltraExtension13LivePhotoView *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  id v19;
  _TtC22StickersUltraExtension13LivePhotoView *v20;
  _OWORD v21[2];

  if (a3)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v21, 0, sizeof(v21));
    v19 = a5;
    v20 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4);
  v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)(v21, a4);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v16 = v15;
  v17 = sub_1000147D4(&qword_10009B408, (uint64_t)&unk_1000784F8);
  v18 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v16, (char *)&type metadata for Any + 8, v17);

LABEL_8:
  sub_100012024(v10, v12, (uint64_t)v21, v18, (uint64_t)a6);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v12);
  sub_100011988((uint64_t)v21);
}

- (_TtC22StickersUltraExtension13LivePhotoView)initWithCoder:(id)a3
{
  _OWORD *v4;
  id v5;
  _TtC22StickersUltraExtension13LivePhotoView *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC22StickersUltraExtension13LivePhotoView_playerObserver);
  *v4 = 0u;
  v4[1] = 0u;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22StickersUltraExtension13LivePhotoView_playerItemContext) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22StickersUltraExtension13LivePhotoView_startPlaybackWhenReady) = 0;
  v5 = a3;

  result = (_TtC22StickersUltraExtension13LivePhotoView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100073990, "StickersUltraExtension/LivePhotoView.swift", 42, 2, 118, 0);
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22StickersUltraExtension13LivePhotoView_stillImage), "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC22StickersUltraExtension13LivePhotoView)initWithFrame:(CGRect)a3
{
  _TtC22StickersUltraExtension13LivePhotoView *result;

  result = (_TtC22StickersUltraExtension13LivePhotoView *)_swift_stdlib_reportUnimplementedInitializer("StickersUltraExtension.LivePhotoView", 36, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end

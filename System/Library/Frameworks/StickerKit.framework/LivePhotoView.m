@implementation LivePhotoView

- (void)dealloc
{
  _TtC10StickerKit13LivePhotoView *v2;

  v2 = self;
  sub_2346C08B0();
}

- (void).cxx_destruct
{

  sub_234608630((uint64_t)self + OBJC_IVAR____TtC10StickerKit13LivePhotoView_playerObserver);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC10StickerKit13LivePhotoView *v14;
  void *v15;
  id v16;
  _TtC10StickerKit13LivePhotoView *v17;
  _OWORD v18[2];

  if (a3)
  {
    v10 = sub_234717754();
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v18, 0, sizeof(v18));
    v16 = a5;
    v17 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  sub_234717ED4();
  swift_unknownObjectRelease();
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_2346C3208();
  v15 = (void *)sub_2347176C4();

LABEL_8:
  sub_2346C0EB8(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_234608630((uint64_t)v18);
}

- (_TtC10StickerKit13LivePhotoView)initWithCoder:(id)a3
{
  _OWORD *v4;
  id v5;
  _TtC10StickerKit13LivePhotoView *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC10StickerKit13LivePhotoView_playerObserver);
  *v4 = 0u;
  v4[1] = 0u;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickerKit13LivePhotoView_playerItemContext) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickerKit13LivePhotoView_startPlaybackWhenReady) = 0;
  v5 = a3;

  result = (_TtC10StickerKit13LivePhotoView *)sub_2347180B4();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickerKit13LivePhotoView_stillImage), sel_size);
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC10StickerKit13LivePhotoView)initWithFrame:(CGRect)a3
{
  _TtC10StickerKit13LivePhotoView *result;

  result = (_TtC10StickerKit13LivePhotoView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

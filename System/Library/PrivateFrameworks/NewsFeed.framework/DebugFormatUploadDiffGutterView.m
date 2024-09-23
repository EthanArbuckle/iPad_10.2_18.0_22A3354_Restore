@implementation DebugFormatUploadDiffGutterView

- (_TtC8NewsFeed31DebugFormatUploadDiffGutterView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _OWORD *v5;
  __int128 v6;
  id v7;
  _TtC8NewsFeed31DebugFormatUploadDiffGutterView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadDiffGutterView_contentSize);
  *v4 = 0;
  v4[1] = 0;
  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadDiffGutterView_contentInsets);
  v6 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *v5 = *MEMORY[0x1E0DC49E8];
  v5[1] = v6;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadDiffGutterView_numberOfLines) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadDiffGutterView_changedHunkRanges) = (Class)MEMORY[0x1E0DEE9D8];
  v7 = a3;

  result = (_TtC8NewsFeed31DebugFormatUploadDiffGutterView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8NewsFeed31DebugFormatUploadDiffGutterView *v2;

  v2 = self;
  sub_1BB85DC38();

}

- (_TtC8NewsFeed31DebugFormatUploadDiffGutterView)initWithFrame:(CGRect)a3
{
  _TtC8NewsFeed31DebugFormatUploadDiffGutterView *result;

  result = (_TtC8NewsFeed31DebugFormatUploadDiffGutterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

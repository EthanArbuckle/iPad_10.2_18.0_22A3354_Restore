@implementation CACompressionView

- (NSArray)accessibilityElements
{
  _TtC12CoreAudioKit17CACompressionView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_2131B0900();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_2131E1B00();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  _TtC12CoreAudioKit17CACompressionView *v5;
  id v6;
  id v7;
  id v8;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_curveFill);
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_tintColor);
  v7 = objc_msgSend(v6, sel_colorWithAlphaComponent_, 0.5);

  v8 = objc_msgSend(v7, sel_CGColor);
  objc_msgSend(v3, sel_setFillColor_, v8);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_2131752A0(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_2131B4A60);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_2131752A0(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_2131B5070);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_2131752A0(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_2131B5408);
}

- (_TtC12CoreAudioKit17CACompressionView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit17CACompressionView *)sub_2131B5730(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit17CACompressionView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit17CACompressionView *)sub_2131B5910(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_diagonalLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_curveFill));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_compressionLine));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_expansionFill));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_compressionFill));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_compressionTriangle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_accessibilityFormatter));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_activeControl));
  swift_bridgeObjectRelease();
  sub_21317BC98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit17CACompressionView_dataSource, &qword_254B89030);
}

@end

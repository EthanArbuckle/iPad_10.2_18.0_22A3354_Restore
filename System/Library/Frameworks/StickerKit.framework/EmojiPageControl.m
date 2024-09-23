@implementation EmojiPageControl

- (_TtC10StickerKit16EmojiPageControl)initWithFrame:(CGRect)a3
{
  return (_TtC10StickerKit16EmojiPageControl *)sub_2345BBF1C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10StickerKit16EmojiPageControl)initWithCoder:(id)a3
{
  return (_TtC10StickerKit16EmojiPageControl *)sub_2345BC114(a3);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_2345BE140(self, (uint64_t)a2, type metadata accessor for EmojiPageControl, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  sub_2345BE1C8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for EmojiPageControl, (const char **)&selRef_setBounds_, (void (*)(id))sub_2345BCD54);
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_2345BE140(self, (uint64_t)a2, type metadata accessor for EmojiPageControl, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  sub_2345BE1C8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for EmojiPageControl, (const char **)&selRef_setFrame_, (void (*)(id))sub_2345BCD54);
}

- (void)didMoveToWindow
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for EmojiPageControl();
  v2 = v4.receiver;
  -[EmojiPageControl didMoveToWindow](&v4, sel_didMoveToWindow);
  v3 = objc_msgSend(v2, sel_window, v4.receiver, v4.super_class);

  if (v3)
    sub_2345BCD54();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit16EmojiPageControl_pillBackground));

  swift_bridgeObjectRelease();
}

@end

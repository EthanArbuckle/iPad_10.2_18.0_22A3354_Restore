@implementation MultiLinkableTextView

- (NSString)action
{
  _TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1DB3AD9DC();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView *v12;
  id v13;
  void *v14;
  BOOL result;
  uint64_t v16;
  NSString *v17;
  SEL v18;
  id v19;
  uint64_t v20;

  v7 = sub_1DB3BBCD4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB3BBCBC();
  v11 = a3;
  v12 = self;
  v13 = sub_1DB3AD840();
  if (!v13)
    goto LABEL_4;
  v14 = v13;
  result = sub_1DB3AD9DC();
  if (v16)
  {
    v17 = (NSString *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
    v18 = NSSelectorFromString(v17);

    objc_msgSend(v14, sel_performSelector_withObject_, v18, v12);
    v19 = v14;
LABEL_4:

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return 0;
  }
  __break(1u);
  return result;
}

- (void)refreshContentsWith:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSRange v7;
  _TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView *v8;

  v4 = a3;
  v8 = self;
  sub_1DB3AD834();
  v5 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  -[MultiLinkableTextView setText:](v8, sel_setText_, v5);

  sub_1DB3ADA78();
  v6 = (NSString *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  v7 = NSRangeFromString(v6);

  *(NSRange *)((char *)&v8->super.super.super.super.super.isa
             + OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_linkRange) = v7;
  sub_1DB3AD270();

}

- (_TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_linkRange);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView *)sub_1DB3BC664();
  __break(1u);
  return result;
}

- (_TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  _TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView *result;

  v4 = a4;
  result = (_TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier));
}

@end

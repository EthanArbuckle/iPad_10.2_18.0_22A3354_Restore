@implementation LinkedTextView

- (_TtC16HealthArticlesUI14LinkedTextView)initWithFrame:(CGRect)a3
{
  return (_TtC16HealthArticlesUI14LinkedTextView *)sub_1BC961EC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16HealthArticlesUI14LinkedTextView)initWithCoder:(id)a3
{
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC16HealthArticlesUI14LinkedTextView *result;

  v5 = (char *)self + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v5[32] = -1;
  v6 = (char *)self + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkContent;
  v7 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (char *)self + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_rangeOfLink;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 1;
  v9 = a3;

  result = (_TtC16HealthArticlesUI14LinkedTextView *)sub_1BC98028C();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BC963394(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat), *(_QWORD *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat), *(uint64_t *)((char *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat), *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat), *((_BYTE *)&self->super.super.super._cachedTraitCollection+ OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat));
  sub_1BC96327C((uint64_t)self + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkContent);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC16HealthArticlesUI14LinkedTextView *v13;
  uint64_t v15;

  v8 = sub_1BC97F98C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC97F980();
  v12 = a3;
  v13 = self;
  LOBYTE(self) = sub_1BC962FC8();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return self & 1;
}

@end

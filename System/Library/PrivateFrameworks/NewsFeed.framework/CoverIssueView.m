@implementation CoverIssueView

- (_TtC8NewsFeed14CoverIssueView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed14CoverIssueView *)CoverIssueView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed14CoverIssueView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s8NewsFeed14CoverIssueViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (NSString)accessibilityValue
{
  _TtC8NewsFeed14CoverIssueView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  CoverIssueView.accessibilityValue.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1BB872970();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityValue:(id)a3
{
  objc_class *ObjectType;
  _TtC8NewsFeed14CoverIssueView *v6;
  _TtC8NewsFeed14CoverIssueView *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1BB8729A0();
    v6 = self;
    a3 = (id)sub_1BB872970();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  -[CoverIssueView setAccessibilityValue:](&v8, sel_setAccessibilityValue_, a3);

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed14CoverIssueView_secondaryIssueCoverView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed14CoverIssueView_downloadProgressBar));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed14CoverIssueView_selectionImageView));
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed14CoverIssueView_onEditSelection));
  swift_release();
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed14CoverIssueView_downloadButtonDataProvider);
  sub_1BAACC92C((uint64_t)self + OBJC_IVAR____TtC8NewsFeed14CoverIssueView_downloadStateDisposable);
  sub_1BAACC92C((uint64_t)self + OBJC_IVAR____TtC8NewsFeed14CoverIssueView_downloadProgressDisposable);
}

@end

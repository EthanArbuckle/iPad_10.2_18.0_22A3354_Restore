@implementation DebugFormatContentSizeCategoryCell

- (_TtC8NewsFeed34DebugFormatContentSizeCategoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1BB8729A0();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC8NewsFeed34DebugFormatContentSizeCategoryCell *)sub_1BB591290(a3, (uint64_t)a4, v6);
}

- (_TtC8NewsFeed34DebugFormatContentSizeCategoryCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB591C8C();
}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[DebugFormatContentSizeCategoryCell prepareForReuse](&v5, sel_prepareForReuse);
  v3 = &v2[OBJC_IVAR____TtC8NewsFeed34DebugFormatContentSizeCategoryCell_onChangeBlock];
  v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC8NewsFeed34DebugFormatContentSizeCategoryCell_onChangeBlock];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  sub_1BA49EBE0(v4);

}

- (void)onValueChangeWithSlider:(id)a3
{
  id v4;
  _TtC8NewsFeed34DebugFormatContentSizeCategoryCell *v5;

  v4 = a3;
  v5 = self;
  sub_1BB591A98(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatContentSizeCategoryCell_slider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatContentSizeCategoryCell_label));
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed34DebugFormatContentSizeCategoryCell_onChangeBlock));
}

@end

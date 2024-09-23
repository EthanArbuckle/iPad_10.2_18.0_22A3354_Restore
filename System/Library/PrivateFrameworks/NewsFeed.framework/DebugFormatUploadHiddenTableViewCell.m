@implementation DebugFormatUploadHiddenTableViewCell

- (_TtC8NewsFeed36DebugFormatUploadHiddenTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = sub_1BB8729A0();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC8NewsFeed36DebugFormatUploadHiddenTableViewCell *)sub_1BB6CC8C8(v4, v5);
}

- (_TtC8NewsFeed36DebugFormatUploadHiddenTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  Class v9;
  _TtC8NewsFeed36DebugFormatUploadHiddenTableViewCell *result;

  v5 = OBJC_IVAR____TtC8NewsFeed36DebugFormatUploadHiddenTableViewCell_button;
  v6 = (void *)objc_opt_self();
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_buttonWithType_, 0);
  v8 = OBJC_IVAR____TtC8NewsFeed36DebugFormatUploadHiddenTableViewCell_onTap;
  sub_1BA563554();
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(v9), sel_init);

  result = (_TtC8NewsFeed36DebugFormatUploadHiddenTableViewCell *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  -[DebugFormatUploadHiddenTableViewCell layoutSubviews](&v13, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed36DebugFormatUploadHiddenTableViewCell_button];
  v4 = objc_msgSend(v2, sel_contentView, v13.receiver, v13.super_class);
  objc_msgSend(v4, sel_bounds);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, sel_setFrame_, v6, v8, v10, v12);
}

- (void)prepareForReuse
{
  id v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[DebugFormatUploadHiddenTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  v3 = (void *)sub_1BB871344();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed36DebugFormatUploadHiddenTableViewCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed36DebugFormatUploadHiddenTableViewCell_onTap));
}

@end

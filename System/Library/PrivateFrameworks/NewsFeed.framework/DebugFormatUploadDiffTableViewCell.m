@implementation DebugFormatUploadDiffTableViewCell

- (_TtC8NewsFeed34DebugFormatUploadDiffTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8NewsFeed34DebugFormatUploadDiffTableViewCell *)sub_1BB18A918(a3, (uint64_t)a4, v6);
}

- (_TtC8NewsFeed34DebugFormatUploadDiffTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8NewsFeed34DebugFormatUploadDiffTableViewCell *result;

  v5 = OBJC_IVAR____TtC8NewsFeed34DebugFormatUploadDiffTableViewCell_label;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed34DebugFormatUploadDiffTableViewCell *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatUploadDiffTableViewCell_label));
}

@end

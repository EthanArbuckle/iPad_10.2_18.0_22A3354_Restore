@implementation DebugFormatUploadEntryTableViewCell

- (_TtC8NewsFeed35DebugFormatUploadEntryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8NewsFeed35DebugFormatUploadEntryTableViewCell *)sub_1BAF1EECC(v4, v5);
}

- (_TtC8NewsFeed35DebugFormatUploadEntryTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BAF1F248();
}

- (void)prepareForReuse
{
  id v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[DebugFormatUploadEntryTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  v3 = (void *)sub_1BB871344();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadEntryTableViewCell_onDiffTap));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadEntryTableViewCell_diffButton));
}

@end

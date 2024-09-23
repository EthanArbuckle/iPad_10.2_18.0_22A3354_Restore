@implementation DebugPersonalizationArticleTableViewCell

- (_TtC8NewsFeed40DebugPersonalizationArticleTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  _TtC8NewsFeed40DebugPersonalizationArticleTableViewCell *result;

  if (a4)
  {
    a4 = (id)sub_1BB8729A0();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  sub_1BB0B8378(a3, (uint64_t)a4, v6);
  return result;
}

- (_TtC8NewsFeed40DebugPersonalizationArticleTableViewCell)initWithCoder:(id)a3
{
  _TtC8NewsFeed40DebugPersonalizationArticleTableViewCell *result;

  sub_1BB0B900C(a3);
  return result;
}

- (void)prepareForReuse
{
  _TtC8NewsFeed40DebugPersonalizationArticleTableViewCell *v2;

  v2 = self;
  sub_1BB0B939C();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed40DebugPersonalizationArticleTableViewCell_thumbnailImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed40DebugPersonalizationArticleTableViewCell_publisherTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed40DebugPersonalizationArticleTableViewCell_articleTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed40DebugPersonalizationArticleTableViewCell_yesButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed40DebugPersonalizationArticleTableViewCell_noButton));
}

@end

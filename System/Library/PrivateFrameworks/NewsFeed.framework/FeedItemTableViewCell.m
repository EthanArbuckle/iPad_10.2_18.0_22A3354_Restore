@implementation FeedItemTableViewCell

- (_TtC8NewsFeed21FeedItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_class *ObjectType;
  _QWORD *v7;
  _QWORD *v8;
  _TtC8NewsFeed21FeedItemTableViewCell *v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_1BB8729A0();
    v7 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC8NewsFeed21FeedItemTableViewCell_identifier);
    *v7 = 0;
    v7[1] = 0;
    a4 = (id)sub_1BB872970();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC8NewsFeed21FeedItemTableViewCell_identifier);
    *v8 = 0;
    v8[1] = 0;
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[FeedItemTableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, 3, a4);

  return v9;
}

- (_TtC8NewsFeed21FeedItemTableViewCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8NewsFeed21FeedItemTableViewCell *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8NewsFeed21FeedItemTableViewCell_identifier);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC8NewsFeed21FeedItemTableViewCell *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[FeedItemTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  v3 = &v2[OBJC_IVAR____TtC8NewsFeed21FeedItemTableViewCell_identifier];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

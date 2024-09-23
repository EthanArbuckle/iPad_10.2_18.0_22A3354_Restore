@implementation CNAvatarPosterPairCollectionPreWarmer

- (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer)initWithContact:(id)a3 contactForSharedProfile:(id)a4
{
  id v5;
  id v6;
  _TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer *v7;

  v5 = a3;
  v6 = a4;
  v7 = (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer *)sub_18ACBC454(v5, v6);

  return v7;
}

- (void)dealloc
{
  _TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer *v3;
  _TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer_carouselViewModelSubscriber))
  {
    v3 = self;
    swift_retain();
    sub_18AF4EB40();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionPreWarmer();
  -[CNAvatarPosterPairCollectionPreWarmer dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer_contact));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer_carouselViewModel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer_windowScene));
}

- (void)preWarmFirstPosterSnapshotIn:(id)a3
{
  id v4;
  _TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer *v5;

  v4 = a3;
  v5 = self;
  sub_18ACBBA5C(v4);

}

- (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer)init
{
  _TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer *result;

  result = (_TtC10ContactsUI37CNAvatarPosterPairCollectionPreWarmer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end

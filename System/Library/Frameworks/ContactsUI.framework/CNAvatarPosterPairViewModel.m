@implementation CNAvatarPosterPairViewModel

- (_TtC10ContactsUI27CNAvatarPosterPairViewModel)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI27CNAvatarPosterPairViewModel_avatarPosterPair) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI27CNAvatarPosterPairViewModel_contact) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNAvatarPosterPairViewModel();
  return -[CNAvatarPosterPairViewModel init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI27CNAvatarPosterPairViewModel_avatarPosterPair));

}

@end

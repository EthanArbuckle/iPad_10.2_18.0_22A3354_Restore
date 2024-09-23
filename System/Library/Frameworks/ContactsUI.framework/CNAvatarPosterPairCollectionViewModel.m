@implementation CNAvatarPosterPairCollectionViewModel

- (_TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel)init
{
  _TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel *result;

  result = (_TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel__avatarPosterPairs;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF987E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel_contact));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel_contactForSharedProfile));
  swift_unknownObjectRelease();
  swift_release();
}

@end

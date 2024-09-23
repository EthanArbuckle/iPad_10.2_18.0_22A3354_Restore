@implementation ModalToolbarFeatureProvider

- (void)didTap
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v7;

  v3 = type metadata accessor for ArticleViewerFeatureAction();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))&self->actionHandler[6];
  if (v6)
  {
    swift_storeEnumTagMultiPayload();
    swift_retain();
    sub_1B9E5C4E4((uint64_t)v6);
    v6(v5);
    sub_1B9E47D78((uint64_t)v6);
    sub_1B9EB7B04((uint64_t)v5);
    swift_release();
  }
}

@end

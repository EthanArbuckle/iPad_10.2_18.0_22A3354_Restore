@implementation TableOfContentsURLHandler

- (_TtC12NewsArticles25TableOfContentsURLHandler)init
{
  _TtC12NewsArticles25TableOfContentsURLHandler *result;

  result = (_TtC12NewsArticles25TableOfContentsURLHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles25TableOfContentsURLHandler_actionHandler);
  swift_unknownObjectWeakDestroy();
}

- (void)openURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC12NewsArticles25TableOfContentsURLHandler *v8;
  uint64_t v9;

  v4 = sub_1BA0B9998();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA0B995C();
  v8 = self;
  sub_1B9E57E54((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)viewControllerForURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC12NewsArticles25TableOfContentsURLHandler *v8;
  uint64_t v10;

  v4 = sub_1BA0B9998();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA0B995C();
  v8 = self;
  sub_1B9E57E54((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (void)commitViewController:(id)a3 URL:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = sub_1BA0B9998();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA0B995C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end

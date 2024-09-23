@implementation URLPreviewViewControllerFactory

- (id)createViewControllerForURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v9;

  v3 = sub_1BA0B9998();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA0B995C();
  v7 = _s12NewsArticles31URLPreviewViewControllerFactoryC06createdE03forSo06UIViewE0CSg10Foundation3URLV_tF_0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

- (_TtC12NewsArticles31URLPreviewViewControllerFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[URLPreviewViewControllerFactory init](&v3, sel_init);
}

@end

@implementation WebViewControllerFactory

- (id)createViewControllerForURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v3 = sub_21C1D8CE8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C1D8CDC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return 0;
}

- (_TtC7NewsKit24WebViewControllerFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[WebViewControllerFactory init](&v3, sel_init);
}

@end

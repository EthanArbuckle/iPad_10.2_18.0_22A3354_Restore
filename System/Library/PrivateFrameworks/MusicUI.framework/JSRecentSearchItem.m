@implementation JSRecentSearchItem

- (JSValue)timestamp
{
  _TtC7MusicUI18JSRecentSearchItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21D6C32CC();

  return (JSValue *)v3;
}

- (JSValue)contentDescriptor
{
  _TtC7MusicUI18JSRecentSearchItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21D6C32CC();

  return (JSValue *)v3;
}

- (_TtC7MusicUI18JSRecentSearchItem)init
{
  sub_21D6C3320();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC7MusicUI18JSRecentSearchItem__timestamp;
  v4 = sub_21D7BF964();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_21CDB579C((uint64_t)self + OBJC_IVAR____TtC7MusicUI18JSRecentSearchItem__contentDescriptor);

}

@end

@implementation HeartAppDelegate

- (_TtC5Heart16HeartAppDelegate)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC5Heart16HeartAppDelegate____lazy_storage___articleIdentifiersByUrl) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[HeartAppDelegate init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  sub_231375798(self, (int)a2, a3, a4, a5, (uint64_t)&unk_250024FD0, (uint64_t)sub_23137C328, (void (*)(id, uint64_t, uint64_t))sub_23137B674);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  sub_231375798(self, (int)a2, a3, a4, a5, (uint64_t)&unk_250024FA8, (uint64_t)sub_23137B664, (void (*)(id, uint64_t, uint64_t))sub_23137C020);
}

- (Class)makeDataListDataProviderClassForDisplayType:(id)a3
{
  id v4;
  _TtC5Heart16HeartAppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_231378CD0(v4);

  return 0;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC5Heart16HeartAppDelegate *v12;
  char v13;

  v5 = (uint64_t)a5;
  if (!a4)
  {
    v8 = 0;
    v10 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = sub_2314146BC();
  v10 = v9;
  if (v5)
LABEL_3:
    v5 = sub_231414638();
LABEL_4:
  v11 = a3;
  v12 = self;
  v13 = sub_2313D73EC(a3, v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

@end

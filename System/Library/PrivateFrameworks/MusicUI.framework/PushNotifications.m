@implementation PushNotifications

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  void *v4;
  id v6;
  _TtC7MusicUI17PushNotifications *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _TtC7MusicUI17PushNotifications *v12;

  v4 = a4;
  if (a4)
  {
    v6 = a3;
    v7 = self;
    v8 = v4;
    v4 = (void *)sub_21D7BF7D8();
    v10 = v9;

  }
  else
  {
    v11 = a3;
    v12 = self;
    v10 = 0xF000000000000000;
  }
  sub_21CDDB4CC((uint64_t)v4, v10);

}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC7MusicUI17PushNotifications *v12;

  v5 = (uint64_t)a5;
  if (!a4)
  {
    v8 = 0;
    v10 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = sub_21D7C50F4();
  v10 = v9;
  if (v5)
LABEL_3:
    v5 = sub_21D7C4FC8();
LABEL_4:
  v11 = a3;
  v12 = self;
  sub_21D7632F4((uint64_t)v12, v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC7MusicUI17PushNotifications)init
{
  sub_21D764298();
}

- (void).cxx_destruct
{
  char *v3;
  void (*v4)(char *);

  v3 = (char *)self + OBJC_IVAR____TtC7MusicUI17PushNotifications_bag;
  sub_21D7C4CEC();
  OUTLINED_FUNCTION_45_0();
  v4(v3);
  swift_release();
  swift_bridgeObjectRelease();
  sub_21D764A08(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC7MusicUI17PushNotifications_connection));
}

@end

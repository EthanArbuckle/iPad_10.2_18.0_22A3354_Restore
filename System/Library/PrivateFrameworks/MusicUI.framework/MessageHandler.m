@implementation MessageHandler

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6;
  id v7;
  _TtC7MusicUI14MessageHandler *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_21D561DCC((uint64_t)v8, v7);

}

- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5
{
  id v8;
  _TtC7MusicUI14MessageHandler *v9;

  sub_21D7C4FC8();
  if (a5)
    sub_21D7C50F4();
  v8 = a3;
  v9 = self;
  sub_21D561E70();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC7MusicUI14MessageHandler)init
{
  sub_21D561FA0();
}

- (void).cxx_destruct
{
  swift_release();
}

@end

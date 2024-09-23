@implementation VideoObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  _TtC27AppleMediaServicesUIDynamic13VideoObserver *v10;
  id v11;
  _TtC27AppleMediaServicesUIDynamic13VideoObserver *v12;
  _OWORD v13[2];

  if (a3)
  {
    sub_1B9DE2160();
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v13, 0, sizeof(v13));
    v11 = a5;
    v12 = self;
    if (!a5)
      goto LABEL_7;
    goto LABEL_4;
  }
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v9 = a5;
  v10 = self;
  sub_1B9DE2604();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1B9DCC908(&qword_1EF2423D0, type metadata accessor for NSKeyValueChangeKey);
    sub_1B9DE20A0();

  }
LABEL_7:
  sub_1B9DCA974();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B9D44EF4((uint64_t)v13);
}

- (void)videoDidPlayToEnd
{
  self;
  sub_1B9DCB0F0();
}

- (void)videoPlaybackDidStall
{
  self;
  sub_1B9DCB1C8();
}

- (void)playbackErrorOccurredWithNotification:(id)a3
{
  id v4;
  _TtC27AppleMediaServicesUIDynamic13VideoObserver *v5;

  v4 = a3;
  v5 = self;
  sub_1B9DCB3F4();

}

- (_TtC27AppleMediaServicesUIDynamic13VideoObserver)init
{
  return (_TtC27AppleMediaServicesUIDynamic13VideoObserver *)sub_1B9DCBA60();
}

- (void).cxx_destruct
{
  sub_1B9D5DB24((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate);
  sub_1B9D44EF4((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_timeBoundaryObserver);
}

@end

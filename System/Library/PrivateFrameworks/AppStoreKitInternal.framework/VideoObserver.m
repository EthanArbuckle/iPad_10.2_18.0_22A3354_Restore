@implementation VideoObserver

- (_TtC19AppStoreKitInternal13VideoObserver)init
{
  _OWORD *v3;
  objc_class *v4;
  objc_super v6;

  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC19AppStoreKitInternal13VideoObserver_delegate] = 0;
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal13VideoObserver_playerItemObserversAdded) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal13VideoObserver_playerObserversAdded) = 0;
  v3 = (_OWORD *)((char *)self + OBJC_IVAR____TtC19AppStoreKitInternal13VideoObserver_timeBoundaryObserver);
  v4 = (objc_class *)type metadata accessor for VideoObserver();
  *v3 = 0u;
  v3[1] = 0u;
  v6.receiver = self;
  v6.super_class = v4;
  return -[VideoObserver init](&v6, sel_init);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _TtC19AppStoreKitInternal13VideoObserver *v14;
  void *v15;
  id v16;
  _TtC19AppStoreKitInternal13VideoObserver *v17;
  _OWORD v18[2];

  if (a3)
  {
    v10 = sub_1D892ADB4();
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v18, 0, sizeof(v18));
    v16 = a5;
    v17 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  sub_1D892B954();
  swift_unknownObjectRelease();
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1D832F170((unint64_t *)&unk_1EDA45728, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_1D8931808);
  v15 = (void *)sub_1D892AC88();

LABEL_8:
  sub_1D83AB7FC(v10, v12, (uint64_t)v18, v15, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D83EC544((uint64_t)v18);
}

- (void)videoDidPlayToEnd
{
  _TtC19AppStoreKitInternal13VideoObserver *v2;

  v2 = self;
  sub_1D8466E84();

}

- (void)videoPlaybackDidStall
{
  _TtC19AppStoreKitInternal13VideoObserver *v2;

  v2 = self;
  sub_1D8466F5C();

}

- (void)playbackErrorOccurredWithNotification:(id)a3
{
  id v4;
  _TtC19AppStoreKitInternal13VideoObserver *v5;

  v4 = a3;
  v5 = self;
  sub_1D84672E8(v4);

}

- (void).cxx_destruct
{
  sub_1D8374F48((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal13VideoObserver_delegate);
  sub_1D83EC544((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal13VideoObserver_timeBoundaryObserver);
}

@end

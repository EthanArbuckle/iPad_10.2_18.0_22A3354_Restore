@implementation AUGenericViewInternal

- (AUAudioUnit)auAudioUnit
{
  return (AUAudioUnit *)sub_21316C048((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_auAudioUnit);
}

- (void)setAuAudioUnit:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC12CoreAudioKit21AUGenericViewInternal *v8;

  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_auAudioUnit);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_21316B20C();
  sub_21316B3A0();

}

- (UIViewController)owningController
{
  return (UIViewController *)sub_21316C048((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_owningController);
}

- (void)setOwningController:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_owningController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)paramObserverToken
{
  void **v2;

  v2 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_paramObserverToken);
  swift_beginAccess();
  return *v2;
}

- (void)setParamObserverToken:(void *)a3
{
  void **v4;

  v4 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_paramObserverToken);
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC12CoreAudioKit21AUGenericViewInternal)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit21AUGenericViewInternal *)sub_21316C764(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit21AUGenericViewInternal)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit21AUGenericViewInternal *)sub_21316C9A4(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12CoreAudioKit21AUGenericViewInternal *v6;

  v5 = a3;
  v6 = self;
  sub_21316CE2C((uint64_t)a3);

}

- (void)removeFromSuperview
{
  _TtC12CoreAudioKit21AUGenericViewInternal *v2;

  v2 = self;
  sub_21316CFB8();

}

- (void)removeScheduledUpdatesTimer
{
  uint64_t v2;
  void *v3;
  _TtC12CoreAudioKit21AUGenericViewInternal *v5;
  id v6;

  v2 = OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_scheduledUpdatesTimer;
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_scheduledUpdatesTimer);
  if (v3)
  {
    v5 = self;
    objc_msgSend(v3, sel_invalidate);
    v6 = *(Class *)((char *)&self->super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.isa + v2) = 0;

  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_auAudioUnit));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_owningController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_collectionView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_scheduledUpdatesTimer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _TtC12CoreAudioKit21AUGenericViewInternal *v19;
  uint64_t v20;

  v9 = sub_2131E198C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2131E1A94();
  v16 = v15;
  sub_2131E1944();
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_213170A60(v18, v14, v16);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC12CoreAudioKit21AUGenericViewInternal *v15;
  uint64_t v16;

  v8 = sub_2131E198C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2131E1944();
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_213170B88(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

@end

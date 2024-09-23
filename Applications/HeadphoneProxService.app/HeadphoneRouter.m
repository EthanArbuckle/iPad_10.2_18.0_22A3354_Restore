@implementation HeadphoneRouter

- (_TtC20HeadphoneProxService15HeadphoneRouter)init
{
  objc_class *ObjectType;
  char *v4;
  _QWORD *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(_QWORD *)&self->currentView[OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_currentView] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_navigationController) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_presenter;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_initialCardDisplayUpTicks) = 0;
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_marketingUpsell);
  *v5 = 0;
  v5[1] = 0;
  *(_QWORD *)&self->currentView[OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_delegate] = 0;
  swift_unknownObjectWeakInit();
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[HeadphoneRouter init](&v7, "init");
}

- (void).cxx_destruct
{
  sub_100009FD0((uint64_t)self + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_currentView);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_navigationController));
  sub_100017E48((uint64_t)self + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_presenter, &qword_1000B8C48);
  sub_100032028(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_marketingUpsell), *(void **)&self->currentView[OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_marketingUpsell]);
  sub_100009FD0((uint64_t)self + OBJC_IVAR____TtC20HeadphoneProxService15HeadphoneRouter_delegate);
}

- (void)proxCardFlowDidDismiss
{
  _TtC20HeadphoneProxService15HeadphoneRouter *v2;

  v2 = self;
  sub_100031E30();

}

@end

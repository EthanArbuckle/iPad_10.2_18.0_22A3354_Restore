@implementation AccountPageViewControllerDelegate

- (_TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454633AccountPageViewControllerDelegate)init
{
  _TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454633AccountPageViewControllerDelegate *v2;
  void *v3;
  _TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454633AccountPageViewControllerDelegate *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454633AccountPageViewControllerDelegate_selfReference) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccountPageViewControllerDelegate();
  v2 = -[AccountPageViewControllerDelegate init](&v6, "init");
  v3 = *(Class *)((char *)&v2->super.isa
                + OBJC_IVAR____TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454633AccountPageViewControllerDelegate_selfReference);
  *(Class *)((char *)&v2->super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454633AccountPageViewControllerDelegate_selfReference) = (Class)v2;
  v4 = v2;

  return v4;
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454633AccountPageViewControllerDelegate *v8;
  id v9;
  _QWORD v10[5];
  uint64_t v11;

  v5 = swift_allocObject(&unk_10073C580, 24, 7);
  *(_QWORD *)(v5 + 16) = self;
  v10[4] = sub_1003B18C4;
  v11 = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_1000BD6CC;
  v10[3] = &unk_10073C598;
  v6 = _Block_copy(v10);
  v7 = v11;
  v8 = self;
  v9 = a3;
  objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v6, swift_release(v7).n128_f64[0]);
  _Block_release(v6);

}

- (void).cxx_destruct
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;

  v2 = *(char **)((char *)&self->super.isa
                + OBJC_IVAR____TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454633AccountPageViewControllerDelegate_selfReference);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454633AccountPageViewControllerDelegate_selfReference) = 0;
  v3 = v2;
  if (v2)
  {
    while (1)
    {
      v6 = v3;
      if (!swift_isUniquelyReferenced())
        break;
      v4 = *(char **)&v6[OBJC_IVAR____TtC22SubscribePageExtensionP33_17E5165BDAD277E02C837297BEA7454633AccountPageViewControllerDelegate_selfReference];
      v5 = v4;

      v3 = v4;
      if (!v4)
        goto LABEL_6;
    }
    v3 = v6;
  }
LABEL_6:

}

@end

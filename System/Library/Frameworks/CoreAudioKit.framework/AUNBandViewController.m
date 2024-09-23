@implementation AUNBandViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12CoreAudioKit21AUNBandViewController *v3;

  v3 = self;
  sub_2131823EC();

}

- (void)hintDismissedWithRecognizer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _TtC12CoreAudioKit21AUNBandViewController *v7;

  v4 = a3;
  v7 = self;
  v5 = -[AUNBandViewController view](v7, sel_view);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_removeGestureRecognizer_, v4);

    objc_msgSend(*(id *)((char *)&v7->super.super.super.super.super.isa+ OBJC_IVAR____TtC12CoreAudioKit21AUNBandViewController_hintView), sel_removeFromSuperview);
  }
  else
  {
    __break(1u);
  }
}

- (void)globalGainChangedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_21317FE44);
}

- (void)globalGainKnobTouchedWithNotification:(id)a3
{
  sub_213180860(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_21317FF70);
}

- (void)globalGainKnobReleasedWithNotification:(id)a3
{
  sub_213180860(self, (uint64_t)a2, (uint64_t)a3, sub_2131802BC);
}

- (void)bandSelectionChangedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_2131808FC);
}

- (void)bandEnabledChangedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_213180A04);
}

- (void)typeControlChangedWithSender:(id)a3
{
  id v4;
  _TtC12CoreAudioKit21AUNBandViewController *v5;

  v4 = a3;
  v5 = self;
  sub_213181418((int64_t)objc_msgSend(v4, sel_tag), 1);

}

- (_TtC12CoreAudioKit21AUNBandViewController)init
{
  return (_TtC12CoreAudioKit21AUNBandViewController *)sub_213181DC8();
}

- (_TtC12CoreAudioKit21AUNBandViewController)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit21AUNBandViewController *)sub_213181EB8(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUNBandViewController_hintView));
}

@end

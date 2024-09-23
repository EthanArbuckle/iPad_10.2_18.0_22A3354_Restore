@implementation AUEQViewControllerBase

- (void)viewDidLoad
{
  _TtC12CoreAudioKit22AUEQViewControllerBase *v2;

  v2 = self;
  sub_213186DFC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12CoreAudioKit22AUEQViewControllerBase *v3;

  v3 = self;
  sub_213188060();

}

- (void)auParameterValueChangedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_21318409C);
}

- (void)auGraphBeginGestureWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_213184608);
}

- (void)auGraphEndGestureWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_213184650);
}

- (_TtC12CoreAudioKit22AUEQViewControllerBase)init
{
  return (_TtC12CoreAudioKit22AUEQViewControllerBase *)sub_213187A60();
}

- (_TtC12CoreAudioKit22AUEQViewControllerBase)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit22AUEQViewControllerBase *)sub_213187B18(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit22AUEQViewControllerBase____lazy_storage___eqView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit22AUEQViewControllerBase____lazy_storage___wholeNumberFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit22AUEQViewControllerBase____lazy_storage___decimalFormatter));
}

@end

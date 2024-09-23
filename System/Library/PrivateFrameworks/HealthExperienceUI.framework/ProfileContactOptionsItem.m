@implementation ProfileContactOptionsItem

- (_TtC18HealthExperienceUI25ProfileContactOptionsItem)init
{
  return (_TtC18HealthExperienceUI25ProfileContactOptionsItem *)sub_1A97EF13C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25ProfileContactOptionsItem____lazy_storage___cnCapabilitiesManager));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  objc_msgSend(a3, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

@end

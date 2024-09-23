@implementation InteractiveTimelineViewController

- (_TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231C086CC();
}

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController *v2;

  v2 = self;
  sub_231C06488();

}

- (void)scrollToCurrentDay
{
  _TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController *v2;

  v2 = self;
  sub_231C07880();

}

- (_TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController____lazy_storage___dateIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController____lazy_storage___downArrow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController____lazy_storage___timeline));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController____lazy_storage___legend));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController_timelineHeight));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)respondToHorizontalSizeChanges
{
  _TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController *v2;

  v2 = self;
  sub_231C07D18();

}

- (void)updateConstraintConstants
{
  _TtC24MenstrualCyclesAppPlugin33InteractiveTimelineViewController *v2;

  v2 = self;
  sub_231C080C0();

}

@end

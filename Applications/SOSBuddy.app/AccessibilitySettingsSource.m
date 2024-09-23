@implementation AccessibilitySettingsSource

- (_TtC8SOSBuddy27AccessibilitySettingsSource)init
{
  return (_TtC8SOSBuddy27AccessibilitySettingsSource *)sub_1001B71CC();
}

- (void)dealloc
{
  _TtC8SOSBuddy27AccessibilitySettingsSource *v2;

  v2 = self;
  sub_1001B7434();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8SOSBuddy27AccessibilitySettingsSource_contentSizeCategoryDidChange));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8SOSBuddy27AccessibilitySettingsSource_observers));
}

@end

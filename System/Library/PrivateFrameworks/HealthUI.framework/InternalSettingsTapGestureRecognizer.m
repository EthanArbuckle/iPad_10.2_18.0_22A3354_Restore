@implementation InternalSettingsTapGestureRecognizer

- (_TtC8HealthUI36InternalSettingsTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _OWORD v6[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1D7B4A770();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC8HealthUI36InternalSettingsTapGestureRecognizer *)InternalSettingsTapGestureRecognizer.init(target:action:)((uint64_t)v6, (uint64_t)a4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC8HealthUI36InternalSettingsTapGestureRecognizer *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = _s8HealthUI36InternalSettingsTapGestureRecognizerC07gestureG0_13shouldReceiveSbSo09UIGestureG0C_So7UITouchCtF_0(v6, v7);

  return v9;
}

@end

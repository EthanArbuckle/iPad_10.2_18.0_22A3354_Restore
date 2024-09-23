@implementation _MPCSleepTimerController

- (_MPCSleepTimerController)initWithPlaybackEngine:(id)a3
{
  _MPCSleepTimerController *result;

  SleepTimerController.init(playbackEngine:)(a3);
  return result;
}

- (void)startSleepTimerForItemEnd
{
  _MPCSleepTimerController *v2;

  v2 = self;
  sub_210D0F800();

}

- (void)startSleepTimerWithTimeRemaining:(double)a3
{
  _MPCSleepTimerController *v4;

  v4 = self;
  sub_210D0F860(a3);

}

- (void)startSleepTimerForChapterEnd
{
  _MPCSleepTimerController *v2;

  v2 = self;
  sub_210D0F8D8();

}

- (void)reset
{
  _MPCSleepTimerController *v2;

  v2 = self;
  sub_210D0F940();

}

- (int64_t)stopMode
{
  return sub_210D0F9B8();
}

- (double)time
{
  return sub_210D0FA0C();
}

- (double)fireDate
{
  _MPCSleepTimerController *v2;
  double v3;

  v2 = self;
  v3 = sub_210D0FA68();

  return v3;
}

- (_MPCSleepTimerController)init
{
  SleepTimerController.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

- (void)didEndPlaybackForCurrentItem
{
  _MPCSleepTimerController *v2;

  v2 = self;
  SleepTimerController.didEndPlaybackForCurrentItem()();

}

- (void)didChangeItemElapsedTime:(double)a3
{
  Swift::Double v3;
  _MPCSleepTimerController *v4;

  v4 = self;
  SleepTimerController.didChangeItemElapsedTime(_:)(v3);

}

@end

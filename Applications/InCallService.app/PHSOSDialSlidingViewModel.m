@implementation PHSOSDialSlidingViewModel

- (unint64_t)countdown
{
  return 8;
}

- (unint64_t)countdownWithAudio
{
  return -[PHSOSDialSlidingViewModel countdown](self, "countdown") - 3;
}

- (double)countdownTickDuration
{
  return 1.0;
}

- (BOOL)playsSound
{
  return +[SOSUtilities shouldPlayAudioDuringCountdown](SOSUtilities, "shouldPlayAudioDuringCountdown");
}

@end

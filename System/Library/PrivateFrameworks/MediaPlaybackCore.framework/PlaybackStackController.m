@implementation PlaybackStackController

- (void)setSpatializationFormat:(int64_t)a3
{
  swift_retain();
  sub_210C48550(a3);
  swift_release();
}

- (void)updateAudioSessionWithConfiguration:(id)a3
{
  sub_210C4856C((uint64_t)self, (uint64_t)a2, a3, sub_210C485B4);
}

- (BOOL)isModeShared
{
  return sub_210C48650();
}

- (BOOL)isModeSolo
{
  return sub_210C487D4();
}

- (NSDictionary)stateDictionary
{
  swift_retain();
  sub_210D25A80();
}

- (void)resetWithReason:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_210D25D50(v3);
  swift_release();

}

- (int64_t)renderingMode
{
  int64_t v2;

  swift_retain();
  v2 = sub_210D25F80();
  swift_release();
  return v2;
}

- (void)activateAudioSessionWithCompletion:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_retain();
  sub_210D25FB8((uint64_t (*)(uint64_t, void *))sub_210C80E18, v4);
  swift_release();
  swift_release();
}

- (void)deactivateAudioSessionIfIdle:(int64_t)a3
{
  swift_retain();
  sub_210D26064();
  swift_release();
}

- (void)setInhibitSpeechDetection:(BOOL)a3
{
  swift_retain();
  sub_210D260E0();
  swift_release();
}

- (NSString)modeDescription
{
  void *v2;

  swift_retain();
  sub_210D261A4();
  swift_release();
  v2 = (void *)sub_210E92B84();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isModeManagedSession
{
  return sub_210D262DC();
}

- (void)setupForSolo
{
  sub_210D2638C();
}

- (void)setupForShared
{
  sub_210D2638C();
}

- (void)setupForManagedSessionWithAudioSession:(id)a3
{
  sub_210C4856C((uint64_t)self, (uint64_t)a2, a3, sub_210D263C4);
}

- (float)relativeVolume
{
  float v2;
  float v3;

  swift_retain();
  sub_210D26434();
  v3 = v2;
  swift_release();
  return v3;
}

- (void)setRelativeVolume:(float)a3
{
  swift_retain();
  sub_210D2648C();
  swift_release();
}

- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 duration:(double)a4
{
  sub_210D264A8(a3, a4);
}

@end

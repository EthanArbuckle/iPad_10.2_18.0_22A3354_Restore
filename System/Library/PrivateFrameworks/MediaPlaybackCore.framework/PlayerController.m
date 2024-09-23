@implementation PlayerController

- (NSDictionary)stateDictionary
{
  swift_retain();
  sub_210C87ACC();
}

- (void)resetWithReason:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_210C899C0(v3);
  swift_release();

}

- (void)setSpatializationFormat:(int64_t)a3
{
  swift_retain();
  sub_210C3EB6C(a3);
  swift_release();
}

- (float)relativeVolume
{
  float v2;
  float v3;

  swift_retain();
  sub_210C8BEB8();
  v3 = v2;
  swift_release();
  return v3;
}

- (void)setRelativeVolume:(float)a3
{
  swift_retain();
  sub_210C8BF58();
  swift_release();
}

- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 duration:(double)a4
{
  sub_210C8BFD0(a3, a4);
}

@end

@implementation SNDetectSoundActionsRequest

- (double)sampleRate
{
  return sub_1D4474400();
}

- (void)setSampleRate:(double)a3
{
  sub_1D4474434(a3);
}

- (int64_t)hopSizeSamples
{
  return sub_1D4474468();
}

- (void)setHopSizeSamples:(int64_t)a3
{
  sub_1D44744A0(a3);
}

- (int64_t)blocksBetweenTriggers
{
  return sub_1D44744D4();
}

- (void)setBlocksBetweenTriggers:(int64_t)a3
{
  sub_1D447450C(a3);
}

- (NSArray)commands
{
  SNDetectSoundActionsRequest *v2;
  void *v3;

  v2 = self;
  sub_1D4474570();

  type metadata accessor for SNSoundActionCommand();
  v3 = (void *)sub_1D451A908();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setCommands:(id)a3
{
  unint64_t v4;
  SNDetectSoundActionsRequest *v5;

  type metadata accessor for SNSoundActionCommand();
  v4 = sub_1D451A92C();
  v5 = self;
  sub_1D44746FC(v4);

}

- (SNDetectSoundActionsRequest)initWithModel:(id)a3 dictionary:(id)a4 error:(id *)a5
{
  uint64_t v6;
  SNDetectSoundActionsRequest *result;

  v6 = sub_1D451A5CC();
  sub_1D44748F0(a3, v6);
  return result;
}

- (SNDetectSoundActionsRequest)init
{
  SNDetectSoundActionsRequest.init()();
}

- (void).cxx_destruct
{
  id v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SNDetectSoundActionsRequest_impl);
  swift_bridgeObjectRelease();

}

@end

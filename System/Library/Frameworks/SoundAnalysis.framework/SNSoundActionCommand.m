@implementation SNSoundActionCommand

- (double)confidenceThreshold
{
  return SNSoundActionCommand.confidenceThreshold.getter();
}

- (void)setConfidenceThreshold:(double)a3
{
  SNSoundActionCommand.confidenceThreshold.setter(a3);
}

- (int64_t)minDurationBlocks
{
  return SNSoundActionCommand.minDurationBlocks.getter();
}

- (void)setMinDurationBlocks:(int64_t)a3
{
  SNSoundActionCommand.minDurationBlocks.setter(a3);
}

- (NSString)name
{
  void *v2;

  SNSoundActionCommand.name.getter();
  v2 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  SNSoundActionCommand *v7;

  v4 = sub_1D451A6EC();
  v6 = v5;
  v7 = self;
  SNSoundActionCommand.name.setter(v4, v6);

}

- (SNSoundActionCommand)init
{
  return (SNSoundActionCommand *)sub_1D4440544();
}

- (SNSoundActionCommand)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v4;

  v4 = sub_1D451A5CC();
  return (SNSoundActionCommand *)sub_1D44405AC(v4);
}

- (id)copyWithZone:(void *)a3
{
  SNSoundActionCommand *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNSoundActionCommand.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  SNSoundActionCommand *v2;
  int64_t v3;

  v2 = self;
  v3 = SNSoundActionCommand.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SNSoundActionCommand *v4;
  SNSoundActionCommand *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D451B208();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = SNSoundActionCommand.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6;
}

- (SNSoundActionCommand)initWithCoder:(id)a3
{
  return (SNSoundActionCommand *)SNSoundActionCommand.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNSoundActionCommand *v5;

  v4 = a3;
  v5 = self;
  SNSoundActionCommand.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end

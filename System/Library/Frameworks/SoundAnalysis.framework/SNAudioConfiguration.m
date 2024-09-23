@implementation SNAudioConfiguration

- (NSString)category
{
  SNAudioConfiguration *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1D441B148();
  v4 = v3;

  return (NSString *)v4;
}

- (void)setCategory:(id)a3
{
  id v4;
  SNAudioConfiguration *v5;

  v4 = a3;
  v5 = self;
  sub_1D441B1C4();

}

- (NSString)mode
{
  SNAudioConfiguration *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1D441B22C();
  v4 = v3;

  return (NSString *)v4;
}

- (void)setMode:(id)a3
{
  id v4;
  SNAudioConfiguration *v5;

  v4 = a3;
  v5 = self;
  sub_1D441B2A8();

}

- (unint64_t)options
{
  return sub_1D441B300();
}

- (void)setOptions:(unint64_t)a3
{
  sub_1D441B338(a3);
}

- (NSArray)channelMap
{
  return (NSArray *)sub_1D441B5C4((uint64_t)self, (uint64_t)a2, sub_1D441B360, MEMORY[0x1E0DEB418]);
}

- (void)setChannelMap:(id)a3
{
  uint64_t v4;
  SNAudioConfiguration *v5;

  if (a3)
    v4 = sub_1D451A92C();
  else
    v4 = 0;
  v5 = self;
  sub_1D441B3D4(v4);

}

- (BOOL)useSiriAudioRouting
{
  return sub_1D441B414() & 1;
}

- (void)setUseSiriAudioRouting:(BOOL)a3
{
  sub_1D441B44C(a3);
}

- (BOOL)prefersNoMicrophoneUsageIndicator
{
  return sub_1D441B484() & 1;
}

- (void)setPrefersNoMicrophoneUsageIndicator:(BOOL)a3
{
  sub_1D441B4BC(a3);
}

- (BOOL)prefersNoInterruptions
{
  return sub_1D441B4F4() & 1;
}

- (BOOL)allowHapticsAndSystemSoundsDuringRecording
{
  return sub_1D441B52C() & 1;
}

- (BOOL)preferDecoupledIO
{
  return sub_1D441B564() & 1;
}

- (BOOL)smartRoutingConsideration
{
  return sub_1D441B59C() & 1;
}

- (NSArray)audioHWControlFlags
{
  return (NSArray *)sub_1D441B5C4((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_1D441B608, MEMORY[0x1E0DEBB98]);
}

- (SNAudioConfiguration)init
{
  SNAudioConfiguration *result;

  sub_1D441B700();
  return result;
}

- (NSString)description
{
  SNAudioConfiguration *v2;
  void *v3;

  v2 = self;
  SNAudioConfiguration.description.getter();

  v3 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copyWithZone:(void *)a3
{
  SNAudioConfiguration *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNAudioConfiguration.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  SNAudioConfiguration *v2;
  int64_t v3;

  v2 = self;
  v3 = SNAudioConfiguration.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SNAudioConfiguration *v4;
  SNAudioConfiguration *v5;
  char v6;
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
  v6 = SNAudioConfiguration.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6 & 1;
}

- (SNAudioConfiguration)initWithCoder:(id)a3
{
  return (SNAudioConfiguration *)SNAudioConfiguration.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNAudioConfiguration *v5;

  v4 = a3;
  v5 = self;
  SNAudioConfiguration.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1D42BE8B4();
  swift_bridgeObjectRelease();
}

+ (id)shazamAudioConfiguration
{
  id v2;

  swift_getObjCClassMetadata();
  sub_1D441C1A0();
  return v2;
}

@end

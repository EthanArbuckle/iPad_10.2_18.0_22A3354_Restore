@implementation SNDetectSpeechUtteranceRequest

- (double)decisionDelay
{
  SNDetectSpeechUtteranceRequest *v2;
  double v3;

  v2 = self;
  v3 = sub_1D42F6A38();

  return v3;
}

- (SNDetectSpeechUtteranceRequest)init
{
  return (SNDetectSpeechUtteranceRequest *)sub_1D42F6B90();
}

- (SNDetectSpeechUtteranceRequest)initWithRequestType:(int64_t)a3
{
  SNDetectSpeechUtteranceRequest *result;

  sub_1D42F6BE8(a3);
  return result;
}

- (id)copyWithZone:(void *)a3
{
  SNDetectSpeechUtteranceRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  SNDetectSpeechUtteranceRequest.copy(with:)(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  int64_t result;

  SNDetectSpeechUtteranceRequest.hash.getter();
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SNDetectSpeechUtteranceRequest *v4;
  SNDetectSpeechUtteranceRequest *v5;
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
  v6 = SNDetectSpeechUtteranceRequest.isEqual(_:)((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6;
}

- (SNDetectSpeechUtteranceRequest)initWithCoder:(id)a3
{
  SNDetectSpeechUtteranceRequest *result;

  SNDetectSpeechUtteranceRequest.init(coder:)(a3);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNDetectSpeechUtteranceRequest *v5;

  v4 = a3;
  v5 = self;
  SNDetectSpeechUtteranceRequest.encode(with:)((NSCoder)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

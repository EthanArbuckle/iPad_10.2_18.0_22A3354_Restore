@implementation SNCorrelateAudioRequest

- (double)overlapFactor
{
  return sub_1D4340DF0();
}

- (void)setOverlapFactor:(double)a3
{
  SNCorrelateAudioRequest *v4;

  v4 = self;
  sub_1D4340E48(a3);

}

- (SNCorrelateAudioRequest)initWithAudioFile:(id)a3 overlapFactor:(double)a4
{
  return (SNCorrelateAudioRequest *)sub_1D4340FF4((uint64_t)a3, a4);
}

- (SNCorrelateAudioRequest)initWithAudioFile:(id)a3
{
  return (SNCorrelateAudioRequest *)sub_1D4341084((uint64_t)a3);
}

- (SNCorrelateAudioRequest)init
{
  SNCorrelateAudioRequest.init()();
}

- (void).cxx_destruct
{

}

@end

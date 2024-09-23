@implementation AVAudioSessionRouteControl

- (unint64_t)routeControlOptions
{
  return self->routeControlOptions;
}

- (void)setRouteControlOptions:(unint64_t)a3
{
  self->routeControlOptions = a3;
}

- (NSNumber)constantOutputVolumeLeveldB
{
  return self->constantOutputVolumeLeveldB;
}

- (void)setConstantOutputVolumeLeveldB:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->constantOutputVolumeLeveldB, 0);
}

@end

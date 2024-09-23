@implementation OverlappingTransitionTimeImpl

- (double)startItemSourceTime
{
  return *(double *)self->startItemSourceTime;
}

- (void)setStartItemSourceTime:(double)a3
{
  *(double *)self->startItemSourceTime = a3;
}

- (double)startItemTargetTime
{
  return *(double *)self->startItemTargetTime;
}

- (void)setStartItemTargetTime:(double)a3
{
  *(double *)self->startItemTargetTime = a3;
}

- (double)endItemSourceTime
{
  return *(double *)self->endItemSourceTime;
}

- (void)setEndItemSourceTime:(double)a3
{
  *(double *)self->endItemSourceTime = a3;
}

- (double)endItemTargetTime
{
  return *(double *)self->endItemTargetTime;
}

- (void)setEndItemTargetTime:(double)a3
{
  *(double *)self->endItemTargetTime = a3;
}

@end

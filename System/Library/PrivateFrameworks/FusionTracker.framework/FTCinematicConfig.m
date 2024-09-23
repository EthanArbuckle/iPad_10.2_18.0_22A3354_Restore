@implementation FTCinematicConfig

- (FTCinematicConfig)init
{
  FTCinematicConfig *v2;
  FTCinematicConfig *v3;
  FTCinematicConfig *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTCinematicConfig;
  v2 = -[FTCinematicConfig init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FTCinematicConfig setEnsureObservationTimestampMatchesFrame:](v2, "setEnsureObservationTimestampMatchesFrame:", 0);
    -[FTCinematicConfig setAllowTrackPromotion:](v3, "setAllowTrackPromotion:", 0);
    v4 = v3;
  }

  return v3;
}

- (BOOL)ensureObservationTimestampMatchesFrame
{
  return self->_ensureObservationTimestampMatchesFrame;
}

- (void)setEnsureObservationTimestampMatchesFrame:(BOOL)a3
{
  self->_ensureObservationTimestampMatchesFrame = a3;
}

- (BOOL)allowTrackPromotion
{
  return self->_allowTrackPromotion;
}

- (void)setAllowTrackPromotion:(BOOL)a3
{
  self->_allowTrackPromotion = a3;
}

@end

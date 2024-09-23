@implementation HDRacePreviousRouteProfileExtension

- (HDRacePreviousRouteProfileExtension)initWithProfile:(id)a3
{
  id v4;
  HDRacePreviousRouteProfileExtension *v5;
  HDRacePreviousRouteProfileExtension *v6;
  HDRaceRouteClusterManager *v7;
  HDRaceRouteClusterManager *raceRouteClusterManager;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDRacePreviousRouteProfileExtension;
  v5 = -[HDRacePreviousRouteProfileExtension init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = -[HDRaceRouteClusterManager initWithProfile:]([HDRaceRouteClusterManager alloc], "initWithProfile:", v4);
    raceRouteClusterManager = v6->_raceRouteClusterManager;
    v6->_raceRouteClusterManager = v7;

  }
  return v6;
}

- (HDRaceRouteClusterManager)raceRouteClusterManager
{
  return self->_raceRouteClusterManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_raceRouteClusterManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end

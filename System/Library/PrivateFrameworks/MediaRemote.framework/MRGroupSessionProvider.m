@implementation MRGroupSessionProvider

+ (id)remoteControlGroupSessionWithIdentifier:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  MRRemoteControlGroupSession *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MRRemoteControlGroupSession initWithIdentifier:delegate:]([MRRemoteControlGroupSession alloc], "initWithIdentifier:delegate:", v6, v5);

  return v7;
}

@end
